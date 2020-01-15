Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1A13C00E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E8F6E950;
	Wed, 15 Jan 2020 12:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17046E93D;
 Wed, 15 Jan 2020 12:17:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 85DA2AFCD;
 Wed, 15 Jan 2020 12:17:02 +0000 (UTC)
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
Subject: [PATCH v2 05/21] drm/amdgpu: Convert to CRTC VBLANK callbacks
Date: Wed, 15 Jan 2020 13:16:36 +0100
Message-Id: <20200115121652.7050-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115121652.7050-1-tzimmermann@suse.de>
References: <20200115121652.7050-1-tzimmermann@suse.de>
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
their equivalents in struct drm_crtc_funcs. Convert amdgpu over.

v2:
	* don't wrap existing functions; change signature instead

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  4 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 21 +++++++++++--------
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  4 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++----
 10 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 81a531b652aa..9aff914608b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1194,9 +1194,9 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
 int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
 int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
-u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe);
-int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe);
-void amdgpu_disable_vblank_kms(struct drm_device *dev, unsigned int pipe);
+u32 amdgpu_get_vblank_counter_kms(struct drm_crtc *crtc);
+int amdgpu_enable_vblank_kms(struct drm_crtc *crtc);
+void amdgpu_disable_vblank_kms(struct drm_crtc *crtc);
 long amdgpu_kms_compat_ioctl(struct file *filp, unsigned int cmd,
 			     unsigned long arg);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index a1e769d4417d..ad9c9546a64f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -99,7 +99,7 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
 	     & (DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_IN_VBLANK)) ==
 	    (DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_IN_VBLANK) &&
 	    (int)(work->target_vblank -
-		  amdgpu_get_vblank_counter_kms(adev->ddev, amdgpu_crtc->crtc_id)) > 0) {
+		  amdgpu_get_vblank_counter_kms(crtc)) > 0) {
 		schedule_delayed_work(&work->flip_work, usecs_to_jiffies(1000));
 		return;
 	}
@@ -219,7 +219,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 	if (!adev->enable_virtual_display)
 		work->base = amdgpu_bo_gpu_offset(new_abo);
 	work->target_vblank = target - (uint32_t)drm_crtc_vblank_count(crtc) +
-		amdgpu_get_vblank_counter_kms(dev, work->crtc_id);
+		amdgpu_get_vblank_counter_kms(crtc);
 
 	/* we borrow the event spin lock for protecting flip_wrok */
 	spin_lock_irqsave(&crtc->dev->event_lock, flags);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 18c0aa4779e5..3f8a73beac1b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1378,10 +1378,6 @@ static struct drm_driver kms_driver = {
 	.postclose = amdgpu_driver_postclose_kms,
 	.lastclose = amdgpu_driver_lastclose_kms,
 	.unload = amdgpu_driver_unload_kms,
-	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
-	.enable_vblank = amdgpu_enable_vblank_kms,
-	.disable_vblank = amdgpu_disable_vblank_kms,
-	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
 	.irq_handler = amdgpu_irq_handler,
 	.ioctls = amdgpu_ioctls_kms,
 	.gem_free_object_unlocked = amdgpu_gem_object_free,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 60591dbc2097..98c196de27a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1110,14 +1110,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 /**
  * amdgpu_get_vblank_counter_kms - get frame count
  *
- * @dev: drm dev pointer
- * @pipe: crtc to get the frame count from
+ * @crtc: crtc to get the frame count from
  *
  * Gets the frame count on the requested crtc (all asics).
  * Returns frame count on success, -EINVAL on failure.
  */
-u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe)
+u32 amdgpu_get_vblank_counter_kms(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct amdgpu_device *adev = dev->dev_private;
 	int vpos, hpos, stat;
 	u32 count;
@@ -1177,14 +1178,15 @@ u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe)
 /**
  * amdgpu_enable_vblank_kms - enable vblank interrupt
  *
- * @dev: drm dev pointer
- * @pipe: crtc to enable vblank interrupt for
+ * @crtc: crtc to enable vblank interrupt for
  *
  * Enable the interrupt on the requested crtc (all asics).
  * Returns 0 on success, -EINVAL on failure.
  */
-int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe)
+int amdgpu_enable_vblank_kms(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct amdgpu_device *adev = dev->dev_private;
 	int idx = amdgpu_display_crtc_idx_to_irq_type(adev, pipe);
 
@@ -1194,13 +1196,14 @@ int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe)
 /**
  * amdgpu_disable_vblank_kms - disable vblank interrupt
  *
- * @dev: drm dev pointer
- * @pipe: crtc to disable vblank interrupt for
+ * @crtc: crtc to disable vblank interrupt for
  *
  * Disable the interrupt on the requested crtc (all asics).
  */
-void amdgpu_disable_vblank_kms(struct drm_device *dev, unsigned int pipe)
+void amdgpu_disable_vblank_kms(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct amdgpu_device *adev = dev->dev_private;
 	int idx = amdgpu_display_crtc_idx_to_irq_type(adev, pipe);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index bdc1e0f036d4..2512e7ebfedf 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2494,6 +2494,10 @@ static const struct drm_crtc_funcs dce_v10_0_crtc_funcs = {
 	.set_config = amdgpu_display_crtc_set_config,
 	.destroy = dce_v10_0_crtc_destroy,
 	.page_flip_target = amdgpu_display_crtc_page_flip_target,
+	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
+	.enable_vblank = amdgpu_enable_vblank_kms,
+	.disable_vblank = amdgpu_disable_vblank_kms,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 static void dce_v10_0_crtc_dpms(struct drm_crtc *crtc, int mode)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 0319da5f7bf9..0dde22db9848 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2573,6 +2573,10 @@ static const struct drm_crtc_funcs dce_v11_0_crtc_funcs = {
 	.set_config = amdgpu_display_crtc_set_config,
 	.destroy = dce_v11_0_crtc_destroy,
 	.page_flip_target = amdgpu_display_crtc_page_flip_target,
+	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
+	.enable_vblank = amdgpu_enable_vblank_kms,
+	.disable_vblank = amdgpu_disable_vblank_kms,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 static void dce_v11_0_crtc_dpms(struct drm_crtc *crtc, int mode)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 78642c3b14fc..84219534bd38 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2388,6 +2388,10 @@ static const struct drm_crtc_funcs dce_v6_0_crtc_funcs = {
 	.set_config = amdgpu_display_crtc_set_config,
 	.destroy = dce_v6_0_crtc_destroy,
 	.page_flip_target = amdgpu_display_crtc_page_flip_target,
+	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
+	.enable_vblank = amdgpu_enable_vblank_kms,
+	.disable_vblank = amdgpu_disable_vblank_kms,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 static void dce_v6_0_crtc_dpms(struct drm_crtc *crtc, int mode)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 1e8d4975435a..3a640702d7d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2395,6 +2395,10 @@ static const struct drm_crtc_funcs dce_v8_0_crtc_funcs = {
 	.set_config = amdgpu_display_crtc_set_config,
 	.destroy = dce_v8_0_crtc_destroy,
 	.page_flip_target = amdgpu_display_crtc_page_flip_target,
+	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
+	.enable_vblank = amdgpu_enable_vblank_kms,
+	.disable_vblank = amdgpu_disable_vblank_kms,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 static void dce_v8_0_crtc_dpms(struct drm_crtc *crtc, int mode)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index 4b2f915aba47..5707e4ad1a62 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -123,6 +123,10 @@ static const struct drm_crtc_funcs dce_virtual_crtc_funcs = {
 	.set_config = amdgpu_display_crtc_set_config,
 	.destroy = dce_virtual_crtc_destroy,
 	.page_flip_target = amdgpu_display_crtc_page_flip_target,
+	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
+	.enable_vblank = amdgpu_enable_vblank_kms,
+	.disable_vblank = amdgpu_disable_vblank_kms,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 static void dce_virtual_crtc_dpms(struct drm_crtc *crtc, int mode)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3d52c933a519..5320cf612474 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -377,8 +377,8 @@ static void dm_pflip_high_irq(void *interrupt_params)
 	 * of pageflip completion, so last_flip_vblank is the forbidden count
 	 * for queueing new pageflips if vsync + VRR is enabled.
 	 */
-	amdgpu_crtc->last_flip_vblank = amdgpu_get_vblank_counter_kms(adev->ddev,
-							amdgpu_crtc->crtc_id);
+	amdgpu_crtc->last_flip_vblank =
+		amdgpu_get_vblank_counter_kms(&amdgpu_crtc->base);
 
 	amdgpu_crtc->pflip_status = AMDGPU_FLIP_NONE;
 	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
@@ -4215,8 +4215,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.set_crc_source = amdgpu_dm_crtc_set_crc_source,
 	.verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
 	.get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
+	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
 	.enable_vblank = dm_enable_vblank,
 	.disable_vblank = dm_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 static enum drm_connector_status
@@ -6361,7 +6363,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			 * clients using the GLX_OML_sync_control extension or
 			 * DRI3/Present extension with defined target_msc.
 			 */
-			last_flip_vblank = amdgpu_get_vblank_counter_kms(dm->ddev, acrtc_attach->crtc_id);
+			last_flip_vblank = amdgpu_get_vblank_counter_kms(pcrtc);
 		}
 		else {
 			/* For variable refresh rate mode only:
@@ -6390,7 +6392,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			 & (DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_IN_VBLANK)) ==
 			(DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_IN_VBLANK) &&
 			(int)(target_vblank -
-			  amdgpu_get_vblank_counter_kms(dm->ddev, acrtc_attach->crtc_id)) > 0)) {
+			  amdgpu_get_vblank_counter_kms(pcrtc)) > 0)) {
 			usleep_range(1000, 1100);
 		}
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
