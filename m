Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8386885FF7B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5B710E9CF;
	Thu, 22 Feb 2024 17:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF1310E9CD;
 Thu, 22 Feb 2024 17:35:10 +0000 (UTC)
Received: from kaveri ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202402221828222448; Thu, 22 Feb 2024 18:28:22 +0100
Received: from daenzer by kaveri with local (Exim 4.97)
 (envelope-from <michel@daenzer.net>) id 1rdCrt-000000004Ox-1AJZ;
 Thu, 22 Feb 2024 18:28:21 +0100
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: Refuse non-P2P dma-buf attachments for BOs
 with KMS FBs
Date: Thu, 22 Feb 2024 18:28:20 +0100
Message-ID: <20240222172821.16901-3-michel@daenzer.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222172821.16901-1-michel@daenzer.net>
References: <20240222172821.16901-1-michel@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F18.65D78437.004B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
 Spam="Unknown"; VOD="Unknown"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michel Dänzer <mdaenzer@redhat.com>

Pinning the BO storage to VRAM for scanout would make it inaccessible
to non-P2P dma-buf importers.

Also keep file_priv->prime.lock locked until after bumping bo->num_fbs
in amdgpu_display_user_framebuffer_create, so that the checks there and
in amdgpu_dma_buf_attach are always consistent with each other.

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 20 ++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 11 +++++++++++
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 89bda2a2baf58..2afe5558ba895 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1251,6 +1251,7 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 {
 	struct amdgpu_framebuffer *amdgpu_fb;
 	struct drm_gem_object *obj;
+	bool prime_locked = false;
 	struct amdgpu_bo *bo;
 	uint32_t domains;
 	int ret;
@@ -1270,6 +1271,7 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 		bool can_pin = true;
 
 		mutex_lock(&file_priv->prime.lock);
+		prime_locked = true;
 
 		/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
 		if (obj->import_attach) {
@@ -1293,29 +1295,31 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 			dma_resv_unlock(dmabuf->resv);
 		}
 
-		mutex_unlock(&file_priv->prime.lock);
-
 		if (!can_pin) {
-			drm_gem_object_put(obj);
-			return ERR_PTR(-EINVAL);
+			amdgpu_fb = ERR_PTR(-EINVAL);
+			goto out;
 		}
 	}
 
 	amdgpu_fb = kzalloc(sizeof(*amdgpu_fb), GFP_KERNEL);
 	if (amdgpu_fb == NULL) {
-		drm_gem_object_put(obj);
-		return ERR_PTR(-ENOMEM);
+		amdgpu_fb = ERR_PTR(-ENOMEM);
+		goto out;
 	}
 
 	ret = amdgpu_display_gem_fb_verify_and_init(dev, amdgpu_fb, file_priv,
 						    mode_cmd, obj);
 	if (ret) {
 		kfree(amdgpu_fb);
-		drm_gem_object_put(obj);
-		return ERR_PTR(ret);
+		amdgpu_fb = ERR_PTR(ret);
+		goto out;
 	}
 
 	atomic_inc(&bo->num_fbs);
+
+out:
+	if (prime_locked)
+		mutex_unlock(&file_priv->prime.lock);
 	drm_gem_object_put(obj);
 	return &amdgpu_fb->base;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index decbbe3d4f06e..275d34898284d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -63,6 +63,17 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 	if (pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
 		attach->peer2peer = false;
 
+	if ((!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) || !attach->peer2peer) &&
+	    atomic_read(&bo->num_fbs) > 0) {
+		uint32_t domains = amdgpu_display_supported_domains(adev, bo->flags);
+
+		if (!(domains & AMDGPU_GEM_DOMAIN_GTT)) {
+			drm_dbg_prime(adev_to_drm(adev),
+				      "Cannot attach to BO with KMS FBs without P2P\n");
+			return -EINVAL;
+		}
+	}
+
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	trace_amdgpu_runpm_reference_dumps(1, __func__);
 	if (r < 0)
-- 
2.43.0

