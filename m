Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C1F1369CE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 10:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556E66E9FE;
	Fri, 10 Jan 2020 09:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E216E9D5;
 Fri, 10 Jan 2020 09:21:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F19AEB2A7;
 Fri, 10 Jan 2020 09:21:40 +0000 (UTC)
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
Subject: [PATCH 12/23] drm/amdgpu: Convert to CRTC VBLANK callbacks
Date: Fri, 10 Jan 2020 10:21:16 +0100
Message-Id: <20200110092127.27847-13-tzimmermann@suse.de>
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
their equivalents in struct drm_crtc_funcs. Convert amdgpu over.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  4 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 24 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  4 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 ++
 9 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 81a531b652aa..c1262ab588c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1197,6 +1197,9 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
 u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe);
 int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe);
 void amdgpu_disable_vblank_kms(struct drm_device *dev, unsigned int pipe);
+u32 amdgpu_crtc_get_vblank_counter(struct drm_crtc *crtc);
+int amdgpu_crtc_enable_vblank(struct drm_crtc *crtc);
+void amdgpu_crtc_disable_vblank(struct drm_crtc *crtc);
 long amdgpu_kms_compat_ioctl(struct file *filp, unsigned int cmd,
 			     unsigned long arg);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 0749285dd1c7..9baa1ddf8693 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1377,10 +1377,6 @@ static struct drm_driver kms_driver = {
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
index 60591dbc2097..efe4671fb032 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1174,6 +1174,14 @@ u32 amdgpu_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe)
 	return count;
 }
 
+u32 amdgpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+
+	return amdgpu_get_vblank_counter_kms(dev, pipe);
+}
+
 /**
  * amdgpu_enable_vblank_kms - enable vblank interrupt
  *
@@ -1191,6 +1199,14 @@ int amdgpu_enable_vblank_kms(struct drm_device *dev, unsigned int pipe)
 	return amdgpu_irq_get(adev, &adev->crtc_irq, idx);
 }
 
+int amdgpu_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+
+	return amdgpu_enable_vblank_kms(dev, pipe);
+}
+
 /**
  * amdgpu_disable_vblank_kms - disable vblank interrupt
  *
@@ -1207,6 +1223,14 @@ void amdgpu_disable_vblank_kms(struct drm_device *dev, unsigned int pipe)
 	amdgpu_irq_put(adev, &adev->crtc_irq, idx);
 }
 
+void amdgpu_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+
+	amdgpu_disable_vblank_kms(dev, pipe);
+}
+
 const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index bdc1e0f036d4..8e62f46f0bfd 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2494,6 +2494,10 @@ static const struct drm_crtc_funcs dce_v10_0_crtc_funcs = {
 	.set_config = amdgpu_display_crtc_set_config,
 	.destroy = dce_v10_0_crtc_destroy,
 	.page_flip_target = amdgpu_display_crtc_page_flip_target,
+	.get_vblank_counter = amdgpu_crtc_get_vblank_counter,
+	.enable_vblank = amdgpu_crtc_enable_vblank,
+	.disable_vblank = amdgpu_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
 };
 
 static void dce_v10_0_crtc_dpms(struct drm_crtc *crtc, int mode)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 0319da5f7bf9..9e37e4a78403 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2573,6 +2573,10 @@ static const struct drm_crtc_funcs dce_v11_0_crtc_funcs = {
 	.set_config = amdgpu_display_crtc_set_config,
 	.destroy = dce_v11_0_crtc_destroy,
 	.page_flip_target = amdgpu_display_crtc_page_flip_target,
+	.get_vblank_counter = amdgpu_crtc_get_vblank_counter,
+	.enable_vblank = amdgpu_crtc_enable_vblank,
+	.disable_vblank = amdgpu_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
 };
 
 static void dce_v11_0_crtc_dpms(struct drm_crtc *crtc, int mode)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 78642c3b14fc..2d4c99d3b352 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2388,6 +2388,10 @@ static const struct drm_crtc_funcs dce_v6_0_crtc_funcs = {
 	.set_config = amdgpu_display_crtc_set_config,
 	.destroy = dce_v6_0_crtc_destroy,
 	.page_flip_target = amdgpu_display_crtc_page_flip_target,
+	.get_vblank_counter = amdgpu_crtc_get_vblank_counter,
+	.enable_vblank = amdgpu_crtc_enable_vblank,
+	.disable_vblank = amdgpu_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
 };
 
 static void dce_v6_0_crtc_dpms(struct drm_crtc *crtc, int mode)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 1e8d4975435a..cd51fd155349 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2395,6 +2395,10 @@ static const struct drm_crtc_funcs dce_v8_0_crtc_funcs = {
 	.set_config = amdgpu_display_crtc_set_config,
 	.destroy = dce_v8_0_crtc_destroy,
 	.page_flip_target = amdgpu_display_crtc_page_flip_target,
+	.get_vblank_counter = amdgpu_crtc_get_vblank_counter,
+	.enable_vblank = amdgpu_crtc_enable_vblank,
+	.disable_vblank = amdgpu_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
 };
 
 static void dce_v8_0_crtc_dpms(struct drm_crtc *crtc, int mode)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index 4b2f915aba47..53c260deb384 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -123,6 +123,10 @@ static const struct drm_crtc_funcs dce_virtual_crtc_funcs = {
 	.set_config = amdgpu_display_crtc_set_config,
 	.destroy = dce_virtual_crtc_destroy,
 	.page_flip_target = amdgpu_display_crtc_page_flip_target,
+	.get_vblank_counter = amdgpu_crtc_get_vblank_counter,
+	.enable_vblank = amdgpu_crtc_enable_vblank,
+	.disable_vblank = amdgpu_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
 };
 
 static void dce_virtual_crtc_dpms(struct drm_crtc *crtc, int mode)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 39c5cf242c1b..0c51c4dd8c46 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4214,8 +4214,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.set_crc_source = amdgpu_dm_crtc_set_crc_source,
 	.verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
 	.get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
+	.get_vblank_counter = amdgpu_crtc_get_vblank_counter,
 	.enable_vblank = dm_enable_vblank,
 	.disable_vblank = dm_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
 };
 
 static enum drm_connector_status
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
