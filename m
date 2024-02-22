Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3E185FF77
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58D110E9CB;
	Thu, 22 Feb 2024 17:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9230A10E9CA;
 Thu, 22 Feb 2024 17:35:08 +0000 (UTC)
Received: from kaveri ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202402221828222442; Thu, 22 Feb 2024 18:28:22 +0100
Received: from daenzer by kaveri with local (Exim 4.97)
 (envelope-from <michel@daenzer.net>) id 1rdCrt-000000004Oq-0c4z;
 Thu, 22 Feb 2024 18:28:21 +0100
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu: Refuse to create a KMS FB for non-P2P
 exported dma-bufs
Date: Thu, 22 Feb 2024 18:28:18 +0100
Message-ID: <20240222172821.16901-1-michel@daenzer.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F18.65D78437.0045,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
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

Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10635
Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 38 ++++++++++++++++++---
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index b8fbe97efe1d3..514a5b2159815 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1255,13 +1255,41 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-ENOENT);
 	}
 
-	/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
 	bo = gem_to_amdgpu_bo(obj);
 	domains = amdgpu_display_supported_domains(drm_to_adev(dev), bo->flags);
-	if (obj->import_attach && !(domains & AMDGPU_GEM_DOMAIN_GTT)) {
-		drm_dbg_kms(dev, "Cannot create framebuffer from imported dma_buf\n");
-		drm_gem_object_put(obj);
-		return ERR_PTR(-EINVAL);
+	if (!(domains & AMDGPU_GEM_DOMAIN_GTT)) {
+		bool can_pin = true;
+
+		mutex_lock(&file_priv->prime.lock);
+
+		/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
+		if (obj->import_attach) {
+			drm_dbg_kms(dev, "Cannot create framebuffer from imported dma_buf\n");
+			can_pin = false;
+		} else if (obj->dma_buf) {
+			struct dma_buf *dmabuf = obj->dma_buf;
+			struct dma_buf_attachment *attachment;
+
+			dma_resv_lock(dmabuf->resv, NULL);
+
+			list_for_each_entry(attachment, &dmabuf->attachments, node) {
+				if (IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) && attachment->peer2peer)
+					continue;
+
+				drm_dbg_kms(dev, "Cannot create framebuffer from non-P2P exported dma_buf\n");
+				can_pin = false;
+				break;
+			}
+
+			dma_resv_unlock(dmabuf->resv);
+		}
+
+		mutex_unlock(&file_priv->prime.lock);
+
+		if (!can_pin) {
+			drm_gem_object_put(obj);
+			return ERR_PTR(-EINVAL);
+		}
 	}
 
 	amdgpu_fb = kzalloc(sizeof(*amdgpu_fb), GFP_KERNEL);
-- 
2.43.0

