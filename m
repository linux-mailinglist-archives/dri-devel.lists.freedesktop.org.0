Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E041369ED
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 10:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E9E6E9FC;
	Fri, 10 Jan 2020 09:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0367F6E9ED;
 Fri, 10 Jan 2020 09:21:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97265B29E;
 Fri, 10 Jan 2020 09:21:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 22/23] drm/vmwgfx: Convert to CRTC VBLANK callbacks
Date: Fri, 10 Jan 2020 10:21:26 +0100
Message-Id: <20200110092127.27847-23-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110092127.27847-1-tzimmermann@suse.de>
References: <20200110092127.27847-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VBLANK callbacks in struct drm_driver are deprecated in favor of
their equivalents in struct drm_crtc_funcs. Convert vmwgfx over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c  | 5 +----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  | 6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  | 3 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 5 ++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 3 +++
 6 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index e962048f65d2..f5ab04468522 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1329,7 +1329,7 @@ static int vmw_pm_freeze(struct device *kdev)
 
 	vmw_fence_fifo_down(dev_priv->fman);
 	__vmw_svga_disable(dev_priv);
-	
+
 	vmw_release_device_late(dev_priv);
 	return 0;
 }
@@ -1393,9 +1393,6 @@ static struct drm_driver driver = {
 	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC,
 	.load = vmw_driver_load,
 	.unload = vmw_driver_unload,
-	.get_vblank_counter = vmw_get_vblank_counter,
-	.enable_vblank = vmw_enable_vblank,
-	.disable_vblank = vmw_disable_vblank,
 	.ioctls = vmw_ioctls,
 	.num_ioctls = ARRAY_SIZE(vmw_ioctls),
 	.master_set = vmw_master_set,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index a31e726d6d71..845b3b8c29ca 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1100,9 +1100,9 @@ int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 bool vmw_kms_validate_mode_vram(struct vmw_private *dev_priv,
 				uint32_t pitch,
 				uint32_t height);
-u32 vmw_get_vblank_counter(struct drm_device *dev, unsigned int pipe);
-int vmw_enable_vblank(struct drm_device *dev, unsigned int pipe);
-void vmw_disable_vblank(struct drm_device *dev, unsigned int pipe);
+u32 vmw_get_vblank_counter(struct drm_crtc *crtc);
+int vmw_enable_vblank(struct drm_crtc *crtc);
+void vmw_disable_vblank(struct drm_crtc *crtc);
 int vmw_kms_present(struct vmw_private *dev_priv,
 		    struct drm_file *file_priv,
 		    struct vmw_framebuffer *vfb,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index f47d5710cc95..9f0fee62904a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1991,7 +1991,7 @@ bool vmw_kms_validate_mode_vram(struct vmw_private *dev_priv,
 /**
  * Function called by DRM code called with vbl_lock held.
  */
-u32 vmw_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
+u32 vmw_get_vblank_counter(struct drm_crtc *crtc)
 {
 	return 0;
 }
@@ -1999,7 +1999,7 @@ u32 vmw_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 /**
  * Function called by DRM code called with vbl_lock held.
  */
-int vmw_enable_vblank(struct drm_device *dev, unsigned int pipe)
+int vmw_enable_vblank(struct drm_crtc *crtc)
 {
 	return -EINVAL;
 }
@@ -2007,7 +2007,7 @@ int vmw_enable_vblank(struct drm_device *dev, unsigned int pipe)
 /**
  * Function called by DRM code called with vbl_lock held.
  */
-void vmw_disable_vblank(struct drm_device *dev, unsigned int pipe)
+void vmw_disable_vblank(struct drm_crtc *crtc)
 {
 }
 
@@ -2088,7 +2088,7 @@ static int vmw_du_update_layout(struct vmw_private *dev_priv,
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 	mutex_unlock(&dev->mode_config.mutex);
- 
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 5702219ec38f..16dafff5cab1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -236,6 +236,9 @@ static const struct drm_crtc_funcs vmw_legacy_crtc_funcs = {
 	.atomic_duplicate_state = vmw_du_crtc_duplicate_state,
 	.atomic_destroy_state = vmw_du_crtc_destroy_state,
 	.set_config = drm_atomic_helper_set_config,
+	.get_vblank_counter = vmw_get_vblank_counter,
+	.enable_vblank = vmw_enable_vblank,
+	.disable_vblank = vmw_disable_vblank,
 };
 
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index e5a283263211..207a4053e769 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -319,6 +319,9 @@ static const struct drm_crtc_funcs vmw_screen_object_crtc_funcs = {
 	.atomic_destroy_state = vmw_du_crtc_destroy_state,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.get_vblank_counter = vmw_get_vblank_counter,
+	.enable_vblank = vmw_enable_vblank,
+	.disable_vblank = vmw_disable_vblank,
 };
 
 /*
@@ -1388,6 +1391,6 @@ int vmw_kms_sou_readback(struct vmw_private *dev_priv,
 	vmw_validation_revert(&val_ctx);
 out_unref:
 	vmw_validation_unref_lists(&val_ctx);
-	
+
 	return ret;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 41a96fb49835..570687a1a327 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -916,6 +916,9 @@ static const struct drm_crtc_funcs vmw_stdu_crtc_funcs = {
 	.atomic_destroy_state = vmw_du_crtc_destroy_state,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.get_vblank_counter = vmw_get_vblank_counter,
+	.enable_vblank = vmw_enable_vblank,
+	.disable_vblank = vmw_disable_vblank,
 };
 
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
