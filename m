Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796F85FF76
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F4510E9C5;
	Thu, 22 Feb 2024 17:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 396 seconds by postgrey-1.36 at gabe;
 Thu, 22 Feb 2024 17:35:02 UTC
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4DD10E9C8;
 Thu, 22 Feb 2024 17:35:02 +0000 (UTC)
Received: from kaveri ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202402221828222440; Thu, 22 Feb 2024 18:28:22 +0100
Received: from daenzer by kaveri with local (Exim 4.97)
 (envelope-from <michel@daenzer.net>) id 1rdCrt-000000004Ot-0rRw;
 Thu, 22 Feb 2024 18:28:21 +0100
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu: Keep track of the number of KMS FBs using an
 amdgpu_bo
Date: Thu, 22 Feb 2024 18:28:19 +0100
Message-ID: <20240222172821.16901-2-michel@daenzer.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222172821.16901-1-michel@daenzer.net>
References: <20240222172821.16901-1-michel@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F22.65D78437.0036,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
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

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 14 ++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  3 +++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 514a5b2159815..89bda2a2baf58 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -531,6 +531,15 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connector *amdgpu_connector,
 	return true;
 }
 
+static void
+amdgpu_fb_destroy(struct drm_framebuffer *fb)
+{
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(fb->obj[0]);
+
+	atomic_dec(&bo->num_fbs);
+	drm_gem_fb_destroy(fb);
+}
+
 static int amdgpu_dirtyfb(struct drm_framebuffer *fb, struct drm_file *file,
 			  unsigned int flags, unsigned int color,
 			  struct drm_clip_rect *clips, unsigned int num_clips)
@@ -544,12 +553,12 @@ static int amdgpu_dirtyfb(struct drm_framebuffer *fb, struct drm_file *file,
 }
 
 static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
-	.destroy = drm_gem_fb_destroy,
+	.destroy = amdgpu_fb_destroy,
 	.create_handle = drm_gem_fb_create_handle,
 };
 
 static const struct drm_framebuffer_funcs amdgpu_fb_funcs_atomic = {
-	.destroy = drm_gem_fb_destroy,
+	.destroy = amdgpu_fb_destroy,
 	.create_handle = drm_gem_fb_create_handle,
 	.dirty = amdgpu_dirtyfb
 };
@@ -1306,6 +1315,7 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
+	atomic_inc(&bo->num_fbs);
 	drm_gem_object_put(obj);
 	return &amdgpu_fb->base;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index a3ea8a82db23a..47579a6eb2ae8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -117,6 +117,9 @@ struct amdgpu_bo {
 	 * for memory accounting.
 	 */
 	int8_t				xcp_id;
+
+	/* Number of KMS FBs using this BO */
+	atomic_t			num_fbs;
 };
 
 struct amdgpu_bo_user {
-- 
2.43.0

