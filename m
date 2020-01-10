Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DC81369B5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 10:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CEA6E9A9;
	Fri, 10 Jan 2020 09:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1936E99F;
 Fri, 10 Jan 2020 09:21:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0327AB2A2;
 Fri, 10 Jan 2020 09:21:35 +0000 (UTC)
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
Subject: [PATCH 05/23] drm/radeon: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
Date: Fri, 10 Jan 2020 10:21:09 +0100
Message-Id: <20200110092127.27847-6-tzimmermann@suse.de>
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

The callback struct drm_driver.get_scanout_position() is deprecated in
favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
radeon over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/atombios_crtc.c      |  1 +
 drivers/gpu/drm/radeon/radeon_display.c     | 13 +++++++++++++
 drivers/gpu/drm/radeon/radeon_drv.c         | 11 -----------
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c |  3 ++-
 drivers/gpu/drm/radeon/radeon_mode.h        |  6 ++++++
 5 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
index da2c9e295408..447d74b78f19 100644
--- a/drivers/gpu/drm/radeon/atombios_crtc.c
+++ b/drivers/gpu/drm/radeon/atombios_crtc.c
@@ -2232,6 +2232,7 @@ static const struct drm_crtc_helper_funcs atombios_helper_funcs = {
 	.prepare = atombios_crtc_prepare,
 	.commit = atombios_crtc_commit,
 	.disable = atombios_crtc_disable,
+	.get_scanout_position = radeon_get_crtc_scanout_position,
 };
 
 void radeon_atombios_init_crtc(struct drm_device *dev,
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 962575e27cde..7187158b9963 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1978,3 +1978,16 @@ int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
 
 	return ret;
 }
+
+bool
+radeon_get_crtc_scanout_position(struct drm_crtc *crtc,
+				 bool in_vblank_irq, int *vpos, int *hpos,
+				 ktime_t *stime, ktime_t *etime,
+				 const struct drm_display_mode *mode)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+
+	return radeon_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
+					  stime, etime, mode);
+}
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index fd74e2611185..1f597f166bff 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -563,16 +563,6 @@ static const struct file_operations radeon_driver_kms_fops = {
 #endif
 };
 
-static bool
-radeon_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
-				 bool in_vblank_irq, int *vpos, int *hpos,
-				 ktime_t *stime, ktime_t *etime,
-				 const struct drm_display_mode *mode)
-{
-	return radeon_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
-					  stime, etime, mode);
-}
-
 static struct drm_driver kms_driver = {
 	.driver_features =
 	    DRIVER_USE_AGP | DRIVER_GEM | DRIVER_RENDER,
@@ -585,7 +575,6 @@ static struct drm_driver kms_driver = {
 	.enable_vblank = radeon_enable_vblank_kms,
 	.disable_vblank = radeon_disable_vblank_kms,
 	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
-	.get_scanout_position = radeon_get_crtc_scanout_position,
 	.irq_preinstall = radeon_driver_irq_preinstall_kms,
 	.irq_postinstall = radeon_driver_irq_postinstall_kms,
 	.irq_uninstall = radeon_driver_irq_uninstall_kms,
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
index a1985a552794..8817fd033cd0 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
@@ -1111,7 +1111,8 @@ static const struct drm_crtc_helper_funcs legacy_helper_funcs = {
 	.mode_set_base_atomic = radeon_crtc_set_base_atomic,
 	.prepare = radeon_crtc_prepare,
 	.commit = radeon_crtc_commit,
-	.disable = radeon_crtc_disable
+	.disable = radeon_crtc_disable,
+	.get_scanout_position = radeon_get_crtc_scanout_position,
 };
 
 
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index fd470d6bf3f4..06c4c527d376 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -881,6 +881,12 @@ extern int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
 				      ktime_t *stime, ktime_t *etime,
 				      const struct drm_display_mode *mode);
 
+extern bool radeon_get_crtc_scanout_position(struct drm_crtc *crtc,
+					     bool in_vblank_irq, int *vpos,
+					     int *hpos, ktime_t *stime,
+					     ktime_t *etime,
+					     const struct drm_display_mode *mode);
+
 extern bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev);
 extern struct edid *
 radeon_bios_get_hardcoded_edid(struct radeon_device *rdev);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
