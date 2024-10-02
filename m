Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAB398E249
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 20:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F91610E794;
	Wed,  2 Oct 2024 18:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d03mtRa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5603410E796;
 Wed,  2 Oct 2024 18:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727893348; x=1759429348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c0QXKhwci/Izzy1OlI144ahqJ09nmvEd0qo81iaK+oA=;
 b=d03mtRa9qMt0+9A7Hsc7tbj2wfwd/Hy2lF66/t+EryAQWjn1XKVjchWG
 YVDoT9HwmELoP0u0hkTQFXkyCLe46UudxrVMLtNTb/IN/CZ9dEzrqFkg9
 BIyA6HAh0PCZWDQPbtj0mQf07hCQ3E2amrdSfAhIsdFOvPOvM4LbNqsnq
 3gSWOkliYbq5P42+4ZQ9qnuAGhudJuVdWvLZTHelib9QeKMdMaTG7UYOH
 wkWJdpvC0HuaiAxYdE4bQjWMAe2x4mJ9iO9nPCUXQnt3nDGlx9FfGqWdO
 mAWXmFihFmKoT1ZumUgnxJnB+vgdA+EfovnGYQ64JRa9/kCGgShqS+aBs g==;
X-CSE-ConnectionGUID: U242J1kKSfiOdciMewZLHw==
X-CSE-MsgGUID: nqqW3pPwQVC5NLE2ag1GZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26957609"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="26957609"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 11:22:25 -0700
X-CSE-ConnectionGUID: KgWmmX8iTF2bpIYtU4YHSg==
X-CSE-MsgGUID: 44OP74LUT6ClRqxjDpf5uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="74202342"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 11:22:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2024 21:22:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Sandy Huang <hjc@rock-chips.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Alexey Brodkin <abrodkin@synopsys.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Zack Rusin <zack.rusin@broadcom.com>, amd-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.orga, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.orga, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH 2/2] drm: Move crtc->{x, y, mode,
 enabled} to legacy sub-structure
Date: Wed,  2 Oct 2024 21:22:00 +0300
Message-ID: <20241002182200.15363-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Atomic drivers shouldn't be using the legacy state stored
directly under drm_crtc. Move that junk into a 'legacy' sub
structure to highlight the offenders, of which there are
quite a few unfortunately.

I'm hoping we could get all these fixed and then declare
the legacy state off limits for atomic drivers (which is
what did long ago for plane->fb/etc). And maybe eventually
turn crtc->legacy into a pointer and only allocate it on
legacy drivers.

TODO: hwmode should probably go there too but it probably
      needs a closer look, maybe other stuff too...

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: "Maíra Canal" <mairacanal@riseup.net>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.orga
Cc: freedreno@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.orga
Cc: virtualization@lists.linux.dev
Cc: spice-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 14 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        | 23 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        | 23 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         | 25 ++++---
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         | 23 +++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c  |  4 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_hw.c               |  2 +-
 drivers/gpu/drm/armada/armada_crtc.c          | 12 ++-
 drivers/gpu/drm/ast/ast_dp.c                  |  8 +-
 drivers/gpu/drm/drm_atomic_helper.c           |  8 +-
 drivers/gpu/drm/drm_client_modeset.c          | 10 +--
 drivers/gpu/drm/drm_crtc.c                    |  9 ++-
 drivers/gpu/drm/drm_crtc_helper.c             | 62 +++++++--------
 drivers/gpu/drm/drm_fb_helper.c               | 10 ++-
 drivers/gpu/drm/drm_plane.c                   |  5 +-
 drivers/gpu/drm/drm_plane_helper.c            |  6 +-
 drivers/gpu/drm/drm_vblank.c                  |  2 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  4 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |  4 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  4 +-
 drivers/gpu/drm/gma500/gma_display.c          |  8 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |  4 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  8 +-
 drivers/gpu/drm/i2c/ch7006_drv.c              |  5 +-
 drivers/gpu/drm/i2c/sil164_drv.c              |  2 +-
 .../drm/i915/display/intel_modeset_setup.c    |  4 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           | 31 +++++---
 drivers/gpu/drm/mediatek/mtk_crtc.c           |  6 +-
 drivers/gpu/drm/meson/meson_overlay.c         |  2 +-
 drivers/gpu/drm/meson/meson_plane.c           |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 18 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 16 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  9 ++-
 drivers/gpu/drm/nouveau/dispnv04/cursor.c     |  2 +-
 .../gpu/drm/nouveau/dispnv04/tvmodesnv17.c    |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  5 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  6 +-
 drivers/gpu/drm/qxl/qxl_display.c             |  6 +-
 drivers/gpu/drm/radeon/atombios_crtc.c        | 12 +--
 drivers/gpu/drm/radeon/cik.c                  | 12 +--
 drivers/gpu/drm/radeon/evergreen.c            | 14 ++--
 drivers/gpu/drm/radeon/r100.c                 | 10 +--
 drivers/gpu/drm/radeon/r600_cs.c              |  2 +-
 drivers/gpu/drm/radeon/r600_dpm.c             |  4 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |  6 +-
 drivers/gpu/drm/radeon/radeon_cursor.c        | 29 +++----
 drivers/gpu/drm/radeon/radeon_display.c       | 22 +++---
 drivers/gpu/drm/radeon/radeon_drv.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c   |  2 +-
 .../gpu/drm/radeon/radeon_legacy_encoders.c   |  2 +-
 drivers/gpu/drm/radeon/radeon_pm.c            |  2 +-
 drivers/gpu/drm/radeon/rs600.c                |  8 +-
 drivers/gpu/drm/radeon/rs690.c                | 22 +++---
 drivers/gpu/drm/radeon/rs780_dpm.c            |  6 +-
 drivers/gpu/drm/radeon/rv515.c                | 30 ++++----
 drivers/gpu/drm/radeon/si.c                   | 14 ++--
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    |  2 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  4 +-
 drivers/gpu/drm/sti/sti_crtc.c                |  4 +-
 drivers/gpu/drm/sti/sti_cursor.c              |  2 +-
 drivers/gpu/drm/sti/sti_gdp.c                 |  2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c               |  2 +-
 drivers/gpu/drm/sti/sti_tvout.c               |  6 +-
 drivers/gpu/drm/sti/sti_vid.c                 |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          | 10 +--
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  2 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_plane.c               |  4 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |  4 +-
 drivers/gpu/drm/vkms/vkms_composer.c          |  4 +-
 drivers/gpu/drm/vkms/vkms_crtc.c              |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           | 18 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  9 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c          |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c       |  2 +-
 include/drm/drm_crtc.h                        | 75 ++++++++++---------
 89 files changed, 431 insertions(+), 383 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 90973470b6da..5a3152ee1477 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -92,9 +92,10 @@ static void amdgpu_connector_property_change_mode(struct drm_encoder *encoder)
 {
 	struct drm_crtc *crtc = encoder->crtc;
 
-	if (crtc && crtc->enabled) {
-		drm_crtc_helper_set_mode(crtc, &crtc->mode,
-					 crtc->x, crtc->y, crtc->primary->legacy.fb);
+	if (crtc && crtc->legacy.enabled) {
+		drm_crtc_helper_set_mode(crtc, &crtc->legacy.mode,
+					 crtc->legacy.x, crtc->legacy.y,
+					 crtc->primary->legacy.fb);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 1b1448a58543..8c54fff945ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -328,7 +328,7 @@ int amdgpu_display_crtc_set_config(struct drm_mode_set *set,
 	ret = drm_crtc_helper_set_config(set, ctx);
 
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
-		if (crtc->enabled)
+		if (crtc->legacy.enabled)
 			active = true;
 
 	pm_runtime_mark_last_busy(dev->dev);
@@ -1466,9 +1466,9 @@ bool amdgpu_display_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 		memcpy(&amdgpu_crtc->native_mode,
 		       &amdgpu_encoder->native_mode,
 		       sizeof(struct drm_display_mode));
-		src_v = crtc->mode.vdisplay;
+		src_v = crtc->legacy.mode.vdisplay;
 		dst_v = amdgpu_crtc->native_mode.vdisplay;
-		src_h = crtc->mode.hdisplay;
+		src_h = crtc->legacy.mode.hdisplay;
 		dst_h = amdgpu_crtc->native_mode.hdisplay;
 
 		/* fix up for overscan on hdmi */
@@ -1486,10 +1486,10 @@ bool amdgpu_display_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 			else
 				amdgpu_crtc->v_border = (mode->vdisplay >> 5) + 16;
 			amdgpu_crtc->rmx_type = RMX_FULL;
-			src_v = crtc->mode.vdisplay;
-			dst_v = crtc->mode.vdisplay - (amdgpu_crtc->v_border * 2);
-			src_h = crtc->mode.hdisplay;
-			dst_h = crtc->mode.hdisplay - (amdgpu_crtc->h_border * 2);
+			src_v = crtc->legacy.mode.vdisplay;
+			dst_v = crtc->legacy.mode.vdisplay - (amdgpu_crtc->v_border * 2);
+			src_h = crtc->legacy.mode.hdisplay;
+			dst_h = crtc->legacy.mode.hdisplay - (amdgpu_crtc->h_border * 2);
 		}
 	}
 	if (amdgpu_crtc->rmx_type != RMX_OFF) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
index 675aa138ea11..212d8328e741 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
@@ -348,7 +348,7 @@ int amdgpu_pll_get_shared_nondp_ppll(struct drm_crtc *crtc)
 			}
 			/* for non-DP check the clock */
 			test_adjusted_clock = test_amdgpu_crtc->adjusted_clock;
-			if ((crtc->mode.clock == test_crtc->mode.clock) &&
+			if ((crtc->legacy.mode.clock == test_crtc->legacy.mode.clock) &&
 			    (adjusted_clock == test_adjusted_clock) &&
 			    (amdgpu_crtc->ss_enabled == test_amdgpu_crtc->ss_enabled) &&
 			    (test_amdgpu_crtc->pll_id != ATOM_PPLL_INVALID))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index d4c2afafbb73..9c745b7640c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -70,7 +70,7 @@ static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc)
 	struct amdgpu_vkms_output *out = drm_crtc_to_amdgpu_vkms_output(crtc);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 
-	drm_calc_timestamping_constants(crtc, &crtc->mode);
+	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
 
 	out->period_ns = ktime_set(0, vblank->framedur_ns);
 	hrtimer_start(&amdgpu_crtc->vblank_timer, out->period_ns, HRTIMER_MODE_REL);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index db19854f04f2..e3bf71b674e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -605,7 +605,7 @@ static u32 dce_v10_0_line_buffer_adjust(struct amdgpu_device *adev,
 	 * than 4096, you need use to use 2 display controllers and combine
 	 * them using the stereo blender.
 	 */
-	if (amdgpu_crtc->base.enabled && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && mode) {
 		if (mode->crtc_hdisplay < 1920) {
 			mem_cfg = 1;
 			buffer_alloc = 2;
@@ -640,7 +640,7 @@ static u32 dce_v10_0_line_buffer_adjust(struct amdgpu_device *adev,
 		udelay(1);
 	}
 
-	if (amdgpu_crtc->base.enabled && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && mode) {
 		switch (mem_cfg) {
 		case 0:
 		default:
@@ -1027,14 +1027,14 @@ static void dce_v10_0_program_watermarks(struct amdgpu_device *adev,
 					struct amdgpu_crtc *amdgpu_crtc,
 					u32 lb_size, u32 num_heads)
 {
-	struct drm_display_mode *mode = &amdgpu_crtc->base.mode;
+	struct drm_display_mode *mode = &amdgpu_crtc->base.legacy.mode;
 	struct dce10_wm_params wm_low, wm_high;
 	u32 active_time;
 	u32 line_time = 0;
 	u32 latency_watermark_a = 0, latency_watermark_b = 0;
 	u32 tmp, wm_mask, lb_vblank_lead_lines = 0;
 
-	if (amdgpu_crtc->base.enabled && num_heads && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && num_heads && mode) {
 		active_time = (u32) div_u64((u64)mode->crtc_hdisplay * 1000000,
 					    (u32)mode->clock);
 		line_time = (u32) div_u64((u64)mode->crtc_htotal * 1000000,
@@ -1164,11 +1164,11 @@ static void dce_v10_0_bandwidth_update(struct amdgpu_device *adev)
 	amdgpu_display_update_priority(adev);
 
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		if (adev->mode_info.crtcs[i]->base.enabled)
+		if (adev->mode_info.crtcs[i]->base.legacy.enabled)
 			num_heads++;
 	}
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		mode = &adev->mode_info.crtcs[i]->base.mode;
+		mode = &adev->mode_info.crtcs[i]->base.legacy.mode;
 		lb_size = dce_v10_0_line_buffer_adjust(adev, adev->mode_info.crtcs[i], mode);
 		dce_v10_0_program_watermarks(adev, adev->mode_info.crtcs[i],
 					    lb_size, num_heads);
@@ -2066,8 +2066,8 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 	y &= ~1;
 	WREG32(mmVIEWPORT_START + amdgpu_crtc->crtc_offset,
 	       (x << 16) | y);
-	viewport_w = crtc->mode.hdisplay;
-	viewport_h = (crtc->mode.vdisplay + 1) & ~1;
+	viewport_w = crtc->legacy.mode.hdisplay;
+	viewport_h = (crtc->legacy.mode.vdisplay + 1) & ~1;
 	WREG32(mmVIEWPORT_SIZE + amdgpu_crtc->crtc_offset,
 	       (viewport_w << 16) | viewport_h);
 
@@ -2330,9 +2330,10 @@ static int dce_v10_0_cursor_move_locked(struct drm_crtc *crtc,
 	amdgpu_crtc->cursor_y = y;
 
 	/* avivo cursor are offset into the total surface */
-	x += crtc->x;
-	y += crtc->y;
-	DRM_DEBUG("x %d y %d c->x %d c->y %d\n", x, y, crtc->x, crtc->y);
+	x += crtc->legacy.x;
+	y += crtc->legacy.y;
+	DRM_DEBUG("x %d y %d c->x %d c->y %d\n", x, y, crtc->legacy.x,
+		  crtc->legacy.y);
 
 	if (x < 0) {
 		xorigin = min(-x, amdgpu_crtc->max_cursor_width - 1);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index af889d0b6826..a2a8775fcfc0 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -637,7 +637,7 @@ static u32 dce_v11_0_line_buffer_adjust(struct amdgpu_device *adev,
 	 * than 4096, you need use to use 2 display controllers and combine
 	 * them using the stereo blender.
 	 */
-	if (amdgpu_crtc->base.enabled && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && mode) {
 		if (mode->crtc_hdisplay < 1920) {
 			mem_cfg = 1;
 			buffer_alloc = 2;
@@ -672,7 +672,7 @@ static u32 dce_v11_0_line_buffer_adjust(struct amdgpu_device *adev,
 		udelay(1);
 	}
 
-	if (amdgpu_crtc->base.enabled && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && mode) {
 		switch (mem_cfg) {
 		case 0:
 		default:
@@ -1059,14 +1059,14 @@ static void dce_v11_0_program_watermarks(struct amdgpu_device *adev,
 					struct amdgpu_crtc *amdgpu_crtc,
 					u32 lb_size, u32 num_heads)
 {
-	struct drm_display_mode *mode = &amdgpu_crtc->base.mode;
+	struct drm_display_mode *mode = &amdgpu_crtc->base.legacy.mode;
 	struct dce10_wm_params wm_low, wm_high;
 	u32 active_time;
 	u32 line_time = 0;
 	u32 latency_watermark_a = 0, latency_watermark_b = 0;
 	u32 tmp, wm_mask, lb_vblank_lead_lines = 0;
 
-	if (amdgpu_crtc->base.enabled && num_heads && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && num_heads && mode) {
 		active_time = (u32) div_u64((u64)mode->crtc_hdisplay * 1000000,
 					    (u32)mode->clock);
 		line_time = (u32) div_u64((u64)mode->crtc_htotal * 1000000,
@@ -1196,11 +1196,11 @@ static void dce_v11_0_bandwidth_update(struct amdgpu_device *adev)
 	amdgpu_display_update_priority(adev);
 
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		if (adev->mode_info.crtcs[i]->base.enabled)
+		if (adev->mode_info.crtcs[i]->base.legacy.enabled)
 			num_heads++;
 	}
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		mode = &adev->mode_info.crtcs[i]->base.mode;
+		mode = &adev->mode_info.crtcs[i]->base.legacy.mode;
 		lb_size = dce_v11_0_line_buffer_adjust(adev, adev->mode_info.crtcs[i], mode);
 		dce_v11_0_program_watermarks(adev, adev->mode_info.crtcs[i],
 					    lb_size, num_heads);
@@ -2116,8 +2116,8 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
 	y &= ~1;
 	WREG32(mmVIEWPORT_START + amdgpu_crtc->crtc_offset,
 	       (x << 16) | y);
-	viewport_w = crtc->mode.hdisplay;
-	viewport_h = (crtc->mode.vdisplay + 1) & ~1;
+	viewport_w = crtc->legacy.mode.hdisplay;
+	viewport_h = (crtc->legacy.mode.vdisplay + 1) & ~1;
 	WREG32(mmVIEWPORT_SIZE + amdgpu_crtc->crtc_offset,
 	       (viewport_w << 16) | viewport_h);
 
@@ -2414,9 +2414,10 @@ static int dce_v11_0_cursor_move_locked(struct drm_crtc *crtc,
 	amdgpu_crtc->cursor_y = y;
 
 	/* avivo cursor are offset into the total surface */
-	x += crtc->x;
-	y += crtc->y;
-	DRM_DEBUG("x %d y %d c->x %d c->y %d\n", x, y, crtc->x, crtc->y);
+	x += crtc->legacy.x;
+	y += crtc->legacy.y;
+	DRM_DEBUG("x %d y %d c->x %d c->y %d\n", x, y, crtc->legacy.x,
+		  crtc->legacy.y);
 
 	if (x < 0) {
 		xorigin = min(-x, amdgpu_crtc->max_cursor_width - 1);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index d55be18957b3..0dc970b66120 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -845,7 +845,7 @@ static void dce_v6_0_program_watermarks(struct amdgpu_device *adev,
 					struct amdgpu_crtc *amdgpu_crtc,
 					u32 lb_size, u32 num_heads)
 {
-	struct drm_display_mode *mode = &amdgpu_crtc->base.mode;
+	struct drm_display_mode *mode = &amdgpu_crtc->base.legacy.mode;
 	struct dce6_wm_params wm_low, wm_high;
 	u32 dram_channels;
 	u32 active_time;
@@ -857,7 +857,7 @@ static void dce_v6_0_program_watermarks(struct amdgpu_device *adev,
 	u32 tmp, arb_control3, lb_vblank_lead_lines = 0;
 	fixed20_12 a, b, c;
 
-	if (amdgpu_crtc->base.enabled && num_heads && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && num_heads && mode) {
 		active_time = (u32) div_u64((u64)mode->crtc_hdisplay * 1000000,
 					    (u32)mode->clock);
 		line_time = (u32) div_u64((u64)mode->crtc_htotal * 1000000,
@@ -1026,7 +1026,7 @@ static u32 dce_v6_0_line_buffer_adjust(struct amdgpu_device *adev,
 	 * of crtcs.  Ideally for multiple large displays we'd assign them to
 	 * non-linked crtcs for maximum line buffer allocation.
 	 */
-	if (amdgpu_crtc->base.enabled && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && mode) {
 		if (other_mode) {
 			tmp = 0; /* 1/2 */
 			buffer_alloc = 1;
@@ -1051,7 +1051,7 @@ static u32 dce_v6_0_line_buffer_adjust(struct amdgpu_device *adev,
 		udelay(1);
 	}
 
-	if (amdgpu_crtc->base.enabled && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && mode) {
 		switch (tmp) {
 		case 0:
 		default:
@@ -1087,12 +1087,12 @@ static void dce_v6_0_bandwidth_update(struct amdgpu_device *adev)
 	amdgpu_display_update_priority(adev);
 
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		if (adev->mode_info.crtcs[i]->base.enabled)
+		if (adev->mode_info.crtcs[i]->base.legacy.enabled)
 			num_heads++;
 	}
 	for (i = 0; i < adev->mode_info.num_crtc; i += 2) {
-		mode0 = &adev->mode_info.crtcs[i]->base.mode;
-		mode1 = &adev->mode_info.crtcs[i+1]->base.mode;
+		mode0 = &adev->mode_info.crtcs[i]->base.legacy.mode;
+		mode1 = &adev->mode_info.crtcs[i+1]->base.legacy.mode;
 		lb_size = dce_v6_0_line_buffer_adjust(adev, adev->mode_info.crtcs[i], mode0, mode1);
 		dce_v6_0_program_watermarks(adev, adev->mode_info.crtcs[i], lb_size, num_heads);
 		lb_size = dce_v6_0_line_buffer_adjust(adev, adev->mode_info.crtcs[i+1], mode1, mode0);
@@ -2023,8 +2023,8 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 	y &= ~1;
 	WREG32(mmVIEWPORT_START + amdgpu_crtc->crtc_offset,
 	       (x << 16) | y);
-	viewport_w = crtc->mode.hdisplay;
-	viewport_h = (crtc->mode.vdisplay + 1) & ~1;
+	viewport_w = crtc->legacy.mode.hdisplay;
+	viewport_h = (crtc->legacy.mode.vdisplay + 1) & ~1;
 
 	WREG32(mmVIEWPORT_SIZE + amdgpu_crtc->crtc_offset,
 	       (viewport_w << 16) | viewport_h);
@@ -2250,9 +2250,10 @@ static int dce_v6_0_cursor_move_locked(struct drm_crtc *crtc,
 	amdgpu_crtc->cursor_y = y;
 
 	/* avivo cursor are offset into the total surface */
-	x += crtc->x;
-	y += crtc->y;
-	DRM_DEBUG("x %d y %d c->x %d c->y %d\n", x, y, crtc->x, crtc->y);
+	x += crtc->legacy.x;
+	y += crtc->legacy.y;
+	DRM_DEBUG("x %d y %d c->x %d c->y %d\n", x, y, crtc->legacy.x,
+		  crtc->legacy.y);
 
 	if (x < 0) {
 		xorigin = min(-x, amdgpu_crtc->max_cursor_width - 1);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 7a24d5835107..6424a1a40949 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -560,7 +560,7 @@ static u32 dce_v8_0_line_buffer_adjust(struct amdgpu_device *adev,
 	 * than 4096, you need use to use 2 display controllers and combine
 	 * them using the stereo blender.
 	 */
-	if (amdgpu_crtc->base.enabled && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && mode) {
 		if (mode->crtc_hdisplay < 1920) {
 			tmp = 1;
 			buffer_alloc = 2;
@@ -593,7 +593,7 @@ static u32 dce_v8_0_line_buffer_adjust(struct amdgpu_device *adev,
 		udelay(1);
 	}
 
-	if (amdgpu_crtc->base.enabled && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && mode) {
 		switch (tmp) {
 		case 0:
 		default:
@@ -980,14 +980,14 @@ static void dce_v8_0_program_watermarks(struct amdgpu_device *adev,
 					struct amdgpu_crtc *amdgpu_crtc,
 					u32 lb_size, u32 num_heads)
 {
-	struct drm_display_mode *mode = &amdgpu_crtc->base.mode;
+	struct drm_display_mode *mode = &amdgpu_crtc->base.legacy.mode;
 	struct dce8_wm_params wm_low, wm_high;
 	u32 active_time;
 	u32 line_time = 0;
 	u32 latency_watermark_a = 0, latency_watermark_b = 0;
 	u32 tmp, wm_mask, lb_vblank_lead_lines = 0;
 
-	if (amdgpu_crtc->base.enabled && num_heads && mode) {
+	if (amdgpu_crtc->base.legacy.enabled && num_heads && mode) {
 		active_time = (u32) div_u64((u64)mode->crtc_hdisplay * 1000000,
 					    (u32)mode->clock);
 		line_time = (u32) div_u64((u64)mode->crtc_htotal * 1000000,
@@ -1119,11 +1119,11 @@ static void dce_v8_0_bandwidth_update(struct amdgpu_device *adev)
 	amdgpu_display_update_priority(adev);
 
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		if (adev->mode_info.crtcs[i]->base.enabled)
+		if (adev->mode_info.crtcs[i]->base.legacy.enabled)
 			num_heads++;
 	}
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		mode = &adev->mode_info.crtcs[i]->base.mode;
+		mode = &adev->mode_info.crtcs[i]->base.legacy.mode;
 		lb_size = dce_v8_0_line_buffer_adjust(adev, adev->mode_info.crtcs[i], mode);
 		dce_v8_0_program_watermarks(adev, adev->mode_info.crtcs[i],
 					    lb_size, num_heads);
@@ -1993,8 +1993,8 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 	y &= ~1;
 	WREG32(mmVIEWPORT_START + amdgpu_crtc->crtc_offset,
 	       (x << 16) | y);
-	viewport_w = crtc->mode.hdisplay;
-	viewport_h = (crtc->mode.vdisplay + 1) & ~1;
+	viewport_w = crtc->legacy.mode.hdisplay;
+	viewport_h = (crtc->legacy.mode.vdisplay + 1) & ~1;
 	WREG32(mmVIEWPORT_SIZE + amdgpu_crtc->crtc_offset,
 	       (viewport_w << 16) | viewport_h);
 
@@ -2249,9 +2249,10 @@ static int dce_v8_0_cursor_move_locked(struct drm_crtc *crtc,
 	amdgpu_crtc->cursor_y = y;
 
 	/* avivo cursor are offset into the total surface */
-	x += crtc->x;
-	y += crtc->y;
-	DRM_DEBUG("x %d y %d c->x %d c->y %d\n", x, y, crtc->x, crtc->y);
+	x += crtc->legacy.x;
+	y += crtc->legacy.y;
+	DRM_DEBUG("x %d y %d c->x %d c->y %d\n", x, y, crtc->legacy.x,
+		  crtc->legacy.y);
 
 	if (x < 0) {
 		xorigin = min(-x, amdgpu_crtc->max_cursor_width - 1);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6e79028c5d78..60f20fd287b1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8498,8 +8498,8 @@ static bool is_content_protection_different(struct drm_crtc_state *new_crtc_stat
 	 *
 	 * Handles:	DESIRED -> DESIRED (Special case)
 	 */
-	if (!(old_conn_state->crtc && old_conn_state->crtc->enabled) &&
-		new_conn_state->crtc && new_conn_state->crtc->enabled &&
+	if (!(old_conn_state->crtc && old_conn_state->crtc->legacy.enabled) &&
+		new_conn_state->crtc && new_conn_state->crtc->legacy.enabled &&
 		connector->state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
 		dm_con_state->update_hdcp = false;
 		pr_debug("[HDCP_DM] DESIRED->DESIRED (Stream removed and re-enabled) %s :true\n",
@@ -9635,10 +9635,10 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 	wb_info->dwb_params.cnv_params.cnv_out_bpc = DWB_CNV_OUT_BPC_10BPC;
 
 	/* width & height from crtc */
-	wb_info->dwb_params.cnv_params.src_width = acrtc->base.mode.crtc_hdisplay;
-	wb_info->dwb_params.cnv_params.src_height = acrtc->base.mode.crtc_vdisplay;
-	wb_info->dwb_params.dest_width = acrtc->base.mode.crtc_hdisplay;
-	wb_info->dwb_params.dest_height = acrtc->base.mode.crtc_vdisplay;
+	wb_info->dwb_params.cnv_params.src_width = acrtc->base.legacy.mode.crtc_hdisplay;
+	wb_info->dwb_params.cnv_params.src_height = acrtc->base.legacy.mode.crtc_vdisplay;
+	wb_info->dwb_params.dest_width = acrtc->base.legacy.mode.crtc_hdisplay;
+	wb_info->dwb_params.dest_height = acrtc->base.legacy.mode.crtc_vdisplay;
 
 	wb_info->dwb_params.cnv_params.crop_en = false;
 	wb_info->dwb_params.stereo_params.stereo_enabled = false;
@@ -9880,7 +9880,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 
 		stream_update.stream = dm_new_crtc_state->stream;
 		if (scaling_changed) {
-			update_stream_scaling_settings(&dm_new_con_state->base.crtc->mode,
+			update_stream_scaling_settings(&dm_new_con_state->base.crtc->legacy.mode,
 					dm_new_con_state, dm_new_crtc_state->stream);
 
 			stream_update.src = dm_new_crtc_state->stream->src;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index a2cf2c066a76..b543d70c1883 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -721,7 +721,7 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 	acrtc->max_cursor_height = dm->adev->dm.dc->caps.max_cursor_size;
 
 	acrtc->crtc_id = crtc_index;
-	acrtc->base.enabled = false;
+	acrtc->base.legacy.enabled = false;
 	acrtc->otg_inst = -1;
 
 	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
index 42efe838fa85..15ff0fd2157b 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
@@ -58,7 +58,7 @@ u32 amdgpu_dpm_get_vblank_time(struct amdgpu_device *adev)
 	if (adev->mode_info.num_crtc && adev->mode_info.mode_config_initialized) {
 		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 			amdgpu_crtc = to_amdgpu_crtc(crtc);
-			if (crtc->enabled && amdgpu_crtc->enabled && amdgpu_crtc->hw_mode.clock) {
+			if (crtc->legacy.enabled && amdgpu_crtc->enabled && amdgpu_crtc->hw_mode.clock) {
 				vblank_in_pixels =
 					amdgpu_crtc->hw_mode.crtc_htotal *
 					(amdgpu_crtc->hw_mode.crtc_vblank_end -
@@ -84,7 +84,7 @@ u32 amdgpu_dpm_get_vrefresh(struct amdgpu_device *adev)
 	if (adev->mode_info.num_crtc && adev->mode_info.mode_config_initialized) {
 		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 			amdgpu_crtc = to_amdgpu_crtc(crtc);
-			if (crtc->enabled && amdgpu_crtc->enabled && amdgpu_crtc->hw_mode.clock) {
+			if (crtc->legacy.enabled && amdgpu_crtc->enabled && amdgpu_crtc->hw_mode.clock) {
 				vrefresh = drm_mode_vrefresh(&amdgpu_crtc->hw_mode);
 				break;
 			}
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index f5d358f3893b..ba1f196745bd 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -211,7 +211,7 @@ static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = entry->dev;
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 	unsigned long clkrate = clk_get_rate(hdlcd->clk);
-	unsigned long mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock = hdlcd->crtc.legacy.mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);
diff --git a/drivers/gpu/drm/arm/malidp_hw.c b/drivers/gpu/drm/arm/malidp_hw.c
index 9b845d3f34e1..84eed9cdc6bb 100644
--- a/drivers/gpu/drm/arm/malidp_hw.c
+++ b/drivers/gpu/drm/arm/malidp_hw.c
@@ -1209,7 +1209,7 @@ static irqreturn_t malidp_de_irq(int irq, void *arg)
 	mask = malidp_hw_read(hwdev, MALIDP_REG_MASKIRQ);
 	/* keep the status of the enabled interrupts, plus the error bits */
 	status &= (mask | de->err_mask);
-	if ((status & de->vsync_irq) && malidp->crtc.enabled)
+	if ((status & de->vsync_irq) && malidp->crtc.legacy.enabled)
 		drm_crtc_handle_vblank(&malidp->crtc);
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index c78687c755a8..7d1ce5e15118 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -613,10 +613,12 @@ static int armada_drm_crtc_cursor_update(struct armada_crtc *dcrtc, bool reload)
 		xoff = -dcrtc->cursor_x;
 		xscr = 0;
 		w -= min(xoff, w);
-	} else if (dcrtc->cursor_x + w > dcrtc->crtc.mode.hdisplay) {
+	} else if (dcrtc->cursor_x + w > dcrtc->crtc.legacy.mode.hdisplay) {
 		xoff = 0;
 		xscr = dcrtc->cursor_x;
-		w = max_t(int, dcrtc->crtc.mode.hdisplay - dcrtc->cursor_x, 0);
+		w = max_t(int,
+			  dcrtc->crtc.legacy.mode.hdisplay - dcrtc->cursor_x,
+			  0);
 	} else {
 		xoff = 0;
 		xscr = dcrtc->cursor_x;
@@ -626,10 +628,12 @@ static int armada_drm_crtc_cursor_update(struct armada_crtc *dcrtc, bool reload)
 		yoff = -dcrtc->cursor_y;
 		yscr = 0;
 		h -= min(yoff, h);
-	} else if (dcrtc->cursor_y + h > dcrtc->crtc.mode.vdisplay) {
+	} else if (dcrtc->cursor_y + h > dcrtc->crtc.legacy.mode.vdisplay) {
 		yoff = 0;
 		yscr = dcrtc->cursor_y;
-		h = max_t(int, dcrtc->crtc.mode.vdisplay - dcrtc->cursor_y, 0);
+		h = max_t(int,
+			  dcrtc->crtc.legacy.mode.vdisplay - dcrtc->cursor_y,
+			  0);
 	} else {
 		yoff = 0;
 		yscr = dcrtc->cursor_y;
diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 0e282b7b167c..eed3e44bb0a2 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -230,7 +230,7 @@ static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *v
 
 	ulRefreshRateIndex = vbios_mode->enh_table->refresh_rate_index - 1;
 
-	switch (crtc->mode.crtc_hdisplay) {
+	switch (crtc->legacy.mode.crtc_hdisplay) {
 	case 320:
 		ModeIdx = ASTDP_320x240_60;
 		break;
@@ -253,7 +253,7 @@ static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *v
 		ModeIdx = ASTDP_1152x864_75;
 		break;
 	case 1280:
-		if (crtc->mode.crtc_vdisplay == 800)
+		if (crtc->legacy.mode.crtc_vdisplay == 800)
 			ModeIdx = (ASTDP_1280x800_60_RB - (u8) ulRefreshRateIndex);
 		else		// 1024
 			ModeIdx = (ASTDP_1280x1024_60 + (u8) ulRefreshRateIndex);
@@ -266,7 +266,7 @@ static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *v
 		ModeIdx = (ASTDP_1440x900_60_RB - (u8) ulRefreshRateIndex);
 		break;
 	case 1600:
-		if (crtc->mode.crtc_vdisplay == 900)
+		if (crtc->legacy.mode.crtc_vdisplay == 900)
 			ModeIdx = (ASTDP_1600x900_60_RB - (u8) ulRefreshRateIndex);
 		else		//1200
 			ModeIdx = ASTDP_1600x1200_60;
@@ -275,7 +275,7 @@ static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *v
 		ModeIdx = (ASTDP_1680x1050_60_RB - (u8) ulRefreshRateIndex);
 		break;
 	case 1920:
-		if (crtc->mode.crtc_vdisplay == 1080)
+		if (crtc->legacy.mode.crtc_vdisplay == 1080)
 			ModeIdx = ASTDP_1920x1080_60;
 		else		//1200
 			ModeIdx = ASTDP_1920x1200_60;
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5186d2114a50..79b3f2b4cdb5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1301,15 +1301,15 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
 		struct drm_plane *primary = crtc->primary;
 		struct drm_plane_state *new_plane_state;
 
-		crtc->mode = new_crtc_state->mode;
-		crtc->enabled = new_crtc_state->enable;
+		crtc->legacy.mode = new_crtc_state->mode;
+		crtc->legacy.enabled = new_crtc_state->enable;
 
 		new_plane_state =
 			drm_atomic_get_new_plane_state(old_state, primary);
 
 		if (new_plane_state && new_plane_state->crtc == crtc) {
-			crtc->x = new_plane_state->src_x >> 16;
-			crtc->y = new_plane_state->src_y >> 16;
+			crtc->legacy.x = new_plane_state->src_x >> 16;
+			crtc->legacy.y = new_plane_state->src_y >> 16;
 		}
 	}
 }
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index cee5eafbfb81..69af71e2b131 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -703,17 +703,17 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			/*
 			 * IMPORTANT: We want to use the adjusted mode (i.e.
 			 * after the panel fitter upscaling) as the initial
-			 * config, not the input mode, which is what crtc->mode
+			 * config, not the input mode, which is what crtc->legacy.mode
 			 * usually contains. But since our current
 			 * code puts a mode derived from the post-pfit timings
-			 * into crtc->mode this works out correctly.
+			 * into crtc->legacy.mode this works out correctly.
 			 *
-			 * This is crtc->mode and not crtc->state->mode for the
+			 * This is crtc->legacy.mode and not crtc->state->mode for the
 			 * fastboot check to work correctly.
 			 */
 			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] looking for current mode\n",
 				    connector->base.id, connector->name);
-			modes[i] = &connector->state->crtc->mode;
+			modes[i] = &connector->state->crtc->legacy.mode;
 		}
 		/*
 		 * In case of tiled modes, if all tiles are not present
@@ -1213,7 +1213,7 @@ static void drm_client_modeset_dpms_legacy(struct drm_client_dev *client, int dp
 
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	drm_client_for_each_modeset(modeset, client) {
-		if (!modeset->crtc->enabled)
+		if (!modeset->crtc->legacy.enabled)
 			continue;
 
 		for (j = 0; j < modeset->num_connectors; j++) {
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index db9e6253949f..6c317d6afc65 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -564,11 +564,12 @@ int drm_mode_getcrtc(struct drm_device *dev,
 			crtc_resp->mode_valid = 0;
 		}
 	} else {
-		crtc_resp->x = crtc->x;
-		crtc_resp->y = crtc->y;
+		crtc_resp->x = crtc->legacy.x;
+		crtc_resp->y = crtc->legacy.y;
 
-		if (crtc->enabled) {
-			drm_mode_convert_to_umode(&crtc_resp->mode, &crtc->mode);
+		if (crtc->legacy.enabled) {
+			drm_mode_convert_to_umode(&crtc_resp->mode,
+						  &crtc->legacy.mode);
 			crtc_resp->mode_valid = 1;
 
 		} else {
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 1df4a05f7a01..f6161377d576 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -198,8 +198,8 @@ static void __drm_helper_disable_unused_functions(struct drm_device *dev)
 	drm_for_each_crtc(crtc, dev) {
 		const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
 
-		crtc->enabled = drm_helper_crtc_in_use(crtc);
-		if (!crtc->enabled) {
+		crtc->legacy.enabled = drm_helper_crtc_in_use(crtc);
+		if (!crtc->legacy.enabled) {
 			if (crtc_funcs->disable)
 				(*crtc_funcs->disable)(crtc);
 			else
@@ -298,28 +298,28 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 
 	drm_warn_on_modeset_not_all_locked(dev);
 
-	saved_enabled = crtc->enabled;
-	crtc->enabled = drm_helper_crtc_in_use(crtc);
-	if (!crtc->enabled)
+	saved_enabled = crtc->legacy.enabled;
+	crtc->legacy.enabled = drm_helper_crtc_in_use(crtc);
+	if (!crtc->legacy.enabled)
 		return true;
 
 	adjusted_mode = drm_mode_duplicate(dev, mode);
 	if (!adjusted_mode) {
-		crtc->enabled = saved_enabled;
+		crtc->legacy.enabled = saved_enabled;
 		return false;
 	}
 
-	drm_mode_init(&saved_mode, &crtc->mode);
+	drm_mode_init(&saved_mode, &crtc->legacy.mode);
 	drm_mode_init(&saved_hwmode, &crtc->hwmode);
-	saved_x = crtc->x;
-	saved_y = crtc->y;
+	saved_x = crtc->legacy.x;
+	saved_y = crtc->legacy.y;
 
 	/* Update crtc values up front so the driver can rely on them for mode
 	 * setting.
 	 */
-	drm_mode_copy(&crtc->mode, mode);
-	crtc->x = x;
-	crtc->y = y;
+	drm_mode_copy(&crtc->legacy.mode, mode);
+	crtc->legacy.x = x;
+	crtc->legacy.y = y;
 
 	/* Pass our mode to the connectors and the CRTC to give them a chance to
 	 * adjust it according to limitations or connector properties, and also
@@ -424,11 +424,11 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 done:
 	drm_mode_destroy(dev, adjusted_mode);
 	if (!ret) {
-		crtc->enabled = saved_enabled;
-		drm_mode_copy(&crtc->mode, &saved_mode);
+		crtc->legacy.enabled = saved_enabled;
+		drm_mode_copy(&crtc->legacy.mode, &saved_mode);
 		drm_mode_copy(&crtc->hwmode, &saved_hwmode);
-		crtc->x = saved_x;
-		crtc->y = saved_y;
+		crtc->legacy.x = saved_x;
+		crtc->legacy.y = saved_y;
 	}
 
 	return ret;
@@ -632,9 +632,9 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	drm_connector_list_iter_end(&conn_iter);
 
 	save_set.crtc = set->crtc;
-	save_set.mode = &set->crtc->mode;
-	save_set.x = set->crtc->x;
-	save_set.y = set->crtc->y;
+	save_set.mode = &set->crtc->legacy.mode;
+	save_set.x = set->crtc->legacy.x;
+	save_set.y = set->crtc->legacy.y;
 	save_set.fb = set->crtc->primary->legacy.fb;
 
 	/* We should be able to check here if the fb has the same properties
@@ -651,13 +651,14 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 			fb_changed = true;
 	}
 
-	if (set->x != set->crtc->x || set->y != set->crtc->y)
+	if (set->x != set->crtc->legacy.x || set->y != set->crtc->legacy.y)
 		fb_changed = true;
 
-	if (!drm_mode_equal(set->mode, &set->crtc->mode)) {
+	if (!drm_mode_equal(set->mode, &set->crtc->legacy.mode)) {
 		drm_dbg_kms(dev, "[CRTC:%d:%s] modes are different, full mode set:\n",
 			    set->crtc->base.id, set->crtc->name);
-		drm_dbg_kms(dev, DRM_MODE_FMT "\n", DRM_MODE_ARG(&set->crtc->mode));
+		drm_dbg_kms(dev, DRM_MODE_FMT "\n",
+			    DRM_MODE_ARG(&set->crtc->legacy.mode));
 		drm_dbg_kms(dev, DRM_MODE_FMT "\n", DRM_MODE_ARG(set->mode));
 		mode_changed = true;
 	}
@@ -788,14 +789,14 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 		}
 		__drm_helper_disable_unused_functions(dev);
 	} else if (fb_changed) {
-		set->crtc->x = set->x;
-		set->crtc->y = set->y;
+		set->crtc->legacy.x = set->x;
+		set->crtc->legacy.y = set->y;
 		set->crtc->primary->legacy.fb = set->fb;
 		ret = crtc_funcs->mode_set_base(set->crtc,
 						set->x, set->y, save_set.fb);
 		if (ret != 0) {
-			set->crtc->x = save_set.x;
-			set->crtc->y = save_set.y;
+			set->crtc->legacy.x = save_set.x;
+			set->crtc->legacy.y = save_set.y;
 			set->crtc->primary->legacy.fb = save_set.fb;
 			goto fail;
 		}
@@ -993,11 +994,12 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
 	drm_modeset_lock_all(dev);
 	drm_for_each_crtc(crtc, dev) {
 
-		if (!crtc->enabled)
+		if (!crtc->legacy.enabled)
 			continue;
 
-		ret = drm_crtc_helper_set_mode(crtc, &crtc->mode,
-					       crtc->x, crtc->y, crtc->primary->legacy.fb);
+		ret = drm_crtc_helper_set_mode(crtc, &crtc->legacy.mode,
+					       crtc->legacy.x, crtc->legacy.y,
+					       crtc->primary->legacy.fb);
 
 		/* Restoring the old config should never fail! */
 		if (ret == false)
@@ -1049,7 +1051,7 @@ int drm_helper_force_disable_all(struct drm_device *dev)
 
 	drm_modeset_lock_all(dev);
 	drm_for_each_crtc(crtc, dev)
-		if (crtc->enabled) {
+		if (crtc->legacy.enabled) {
 			struct drm_mode_set set = {
 				.crtc = crtc,
 			};
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index fd9d804e3672..59cc05ed5115 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -145,7 +145,7 @@ int drm_fb_helper_debug_enter(struct fb_info *info)
 	list_for_each_entry(helper, &kernel_fb_helper_list, kernel_fb_list) {
 		mutex_lock(&helper->client.modeset_mutex);
 		drm_client_for_each_modeset(mode_set, &helper->client) {
-			if (!mode_set->crtc->enabled)
+			if (!mode_set->crtc->legacy.enabled)
 				continue;
 
 			funcs =	mode_set->crtc->helper_private;
@@ -191,7 +191,7 @@ int drm_fb_helper_debug_leave(struct fb_info *info)
 		funcs = crtc->helper_private;
 		fb = crtc->primary->legacy.fb;
 
-		if (!crtc->enabled)
+		if (!crtc->legacy.enabled)
 			continue;
 
 		if (!fb) {
@@ -203,8 +203,10 @@ int drm_fb_helper_debug_leave(struct fb_info *info)
 			continue;
 
 		drm_fb_helper_restore_lut_atomic(mode_set->crtc);
-		funcs->mode_set_base_atomic(mode_set->crtc, fb, crtc->x,
-					    crtc->y, LEAVE_ATOMIC_MODE_SET);
+		funcs->mode_set_base_atomic(mode_set->crtc, fb,
+					    crtc->legacy.x,
+					    crtc->legacy.y,
+					    LEAVE_ATOMIC_MODE_SET);
 	}
 	mutex_unlock(&client->modeset_mutex);
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 4b077110238a..e46f1732f55b 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1467,8 +1467,9 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 						       state->src_h,
 						       fb);
 	} else {
-		ret = drm_crtc_check_viewport(crtc, crtc->x, crtc->y,
-					      &crtc->mode, fb);
+		ret = drm_crtc_check_viewport(crtc, crtc->legacy.x,
+					      crtc->legacy.y,
+					      &crtc->legacy.mode, fb);
 	}
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index 7982be4b0306..6fe690e5107b 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -119,8 +119,8 @@ static int drm_plane_helper_check_update(struct drm_plane *plane,
 	};
 	struct drm_crtc_state crtc_state = {
 		.crtc = crtc,
-		.enable = crtc->enabled,
-		.mode = crtc->mode,
+		.enable = crtc->legacy.enabled,
+		.mode = crtc->legacy.mode,
 	};
 	int ret;
 
@@ -172,7 +172,7 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
 	struct drm_mode_set set = {
 		.crtc = crtc,
 		.fb = fb,
-		.mode = &crtc->mode,
+		.mode = &crtc->legacy.mode,
 		.x = src_x >> 16,
 		.y = src_y >> 16,
 	};
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 94e45ed6869d..440411ae05c0 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -2042,7 +2042,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 	if (crtc->state)
 		get_seq->active = crtc->state->enable;
 	else
-		get_seq->active = crtc->enabled;
+		get_seq->active = crtc->legacy.enabled;
 	drm_modeset_unlock(&crtc->mutex);
 	get_seq->sequence = drm_vblank_count_and_time(dev, pipe, &now);
 	get_seq->sequence_ns = ktime_to_ns(now);
diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 0ef7bc8848b0..fccc731d83f0 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -196,7 +196,7 @@ static void decon_setup_trigger(struct decon_context *ctx)
 static void decon_commit(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
-	struct drm_display_mode *m = &crtc->base.mode;
+	struct drm_display_mode *m = &crtc->base.legacy.mode;
 	bool interlaced = false;
 	u32 val;
 
@@ -410,7 +410,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	dma_addr_t dma_addr = exynos_drm_fb_dma_addr(fb, 0);
 	u32 val;
 
-	if (crtc->base.mode.flags & DRM_MODE_FLAG_INTERLACE) {
+	if (crtc->base.legacy.mode.flags & DRM_MODE_FLAG_INTERLACE) {
 		val = COORDINATE_X(state->crtc.x) |
 			COORDINATE_Y(state->crtc.y / 2);
 		writel(val, ctx->addr + DECON_VIDOSDxA(win));
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 49851881e41e..e43a1247bd92 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1847,8 +1847,8 @@ cdv_intel_dp_set_property(struct drm_connector *connector,
 done:
 	if (encoder->base.crtc) {
 		struct drm_crtc *crtc = encoder->base.crtc;
-		drm_crtc_helper_set_mode(crtc, &crtc->mode,
-					 crtc->x, crtc->y,
+		drm_crtc_helper_set_mode(crtc, &crtc->legacy.mode,
+					 crtc->legacy.x, crtc->legacy.y,
 					 crtc->primary->legacy.fb);
 	}
 
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index 16968c94bfd3..5d6814f16093 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -191,7 +191,7 @@ static int cdv_hdmi_set_property(struct drm_connector *connector,
 		    crtc->saved_mode.vdisplay != 0) {
 			if (centre) {
 				if (!drm_crtc_helper_set_mode(encoder->crtc, &crtc->saved_mode,
-							      encoder->crtc->x, encoder->crtc->y,
+							      encoder->crtc->legacy.x, encoder->crtc->legacy.y,
 							      encoder->crtc->primary->legacy.fb))
 					return -1;
 			} else {
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index b607355b85dd..d1e29d4f5ba6 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -373,8 +373,8 @@ static int cdv_intel_lvds_set_property(struct drm_connector *connector,
 		    crtc->saved_mode.vdisplay != 0) {
 			if (!drm_crtc_helper_set_mode(encoder->crtc,
 						      &crtc->saved_mode,
-						      encoder->crtc->x,
-						      encoder->crtc->y,
+						      encoder->crtc->legacy.x,
+						      encoder->crtc->legacy.y,
 						      encoder->crtc->primary->legacy.fb))
 				return -1;
 		}
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index f2f8a95c8d39..6410ba1a3766 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -152,7 +152,7 @@ void gma_crtc_load_lut(struct drm_crtc *crtc)
 	int i;
 
 	/* The clocks have to be on to load the palette. */
-	if (!crtc->enabled)
+	if (!crtc->legacy.enabled)
 		return;
 
 	r = crtc->gamma_store;
@@ -537,7 +537,8 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 
 		/* Call this locked if we want an event at vblank interrupt. */
-		ret = crtc_funcs->mode_set_base(crtc, crtc->x, crtc->y, old_fb);
+		ret = crtc_funcs->mode_set_base(crtc, crtc->legacy.x,
+						crtc->legacy.y, old_fb);
 		if (ret) {
 			spin_lock_irqsave(&dev->event_lock, flags);
 			if (gma_crtc->page_flip_event) {
@@ -547,7 +548,8 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
 			spin_unlock_irqrestore(&dev->event_lock, flags);
 		}
 	} else {
-		ret = crtc_funcs->mode_set_base(crtc, crtc->x, crtc->y, old_fb);
+		ret = crtc_funcs->mode_set_base(crtc, crtc->legacy.x,
+						crtc->legacy.y, old_fb);
 	}
 
 	/* Restore previous fb in case of failure. */
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 1e80bc865843..8dee9d211537 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -568,8 +568,8 @@ int psb_intel_lvds_set_property(struct drm_connector *connector,
 		    crtc->saved_mode.vdisplay != 0) {
 			if (!drm_crtc_helper_set_mode(encoder->crtc,
 						      &crtc->saved_mode,
-						      encoder->crtc->x,
-						      encoder->crtc->y,
+						      encoder->crtc->legacy.x,
+						      encoder->crtc->legacy.y,
 						      encoder->crtc->primary->legacy.fb))
 				goto set_prop_error;
 		}
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 9fab87f17dc9..2a6cb2ae2f50 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -1726,8 +1726,10 @@ psb_intel_sdvo_set_property(struct drm_connector *connector,
 done:
 	if (psb_intel_sdvo->base.base.crtc) {
 		struct drm_crtc *crtc = psb_intel_sdvo->base.base.crtc;
-		drm_crtc_helper_set_mode(crtc, &crtc->mode, crtc->x,
-					 crtc->y, crtc->primary->legacy.fb);
+		drm_crtc_helper_set_mode(crtc, &crtc->legacy.mode,
+					 crtc->legacy.x,
+					 crtc->legacy.y,
+					 crtc->primary->legacy.fb);
 	}
 
 	return 0;
@@ -1755,7 +1757,7 @@ static void psb_intel_sdvo_restore(struct drm_connector *connector)
 	/* Force a full mode set on the crtc. We're supposed to have the
 	   mode_config lock already. */
 	if (connector->status == connector_status_connected)
-		drm_crtc_helper_set_mode(crtc, &crtc->mode, crtc->x, crtc->y,
+		drm_crtc_helper_set_mode(crtc, &crtc->legacy.mode, crtc->legacy.x, crtc->legacy.y,
 					 NULL);
 }
 
diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 058cb389b8ec..48a7b50b83f4 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -362,8 +362,9 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 		drm_helper_probe_single_connector_modes(connector, 0, 0);
 
 		if (crtc)
-			drm_crtc_helper_set_mode(crtc, &crtc->mode,
-						 crtc->x, crtc->y,
+			drm_crtc_helper_set_mode(crtc, &crtc->legacy.mode,
+						 crtc->legacy.x,
+						 crtc->legacy.y,
 						 crtc->primary->legacy.fb);
 	}
 
diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
index ff23422727fc..860e1cb6d753 100644
--- a/drivers/gpu/drm/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/i2c/sil164_drv.c
@@ -219,7 +219,7 @@ sil164_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
 	struct sil164_priv *priv = to_sil164_priv(encoder);
 	bool on = (mode == DRM_MODE_DPMS_ON);
-	bool duallink = (on && encoder->crtc->mode.clock > 165000);
+	bool duallink = (on && encoder->crtc->legacy.mode.clock > 165000);
 
 	sil164_set_power_state(drm_i2c_encoder_get_client(encoder), on);
 
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index bcc5cf137a88..bfd9da71e8e9 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -88,7 +88,7 @@ static void intel_crtc_disable_noatomic_begin(struct intel_crtc *crtc,
 		    crtc->base.base.id, crtc->base.name);
 
 	crtc->active = false;
-	crtc->base.enabled = false;
+	crtc->base.legacy.enabled = false;
 
 	if (crtc_state->shared_dpll)
 		intel_unreference_shared_dpll_crtc(crtc,
@@ -725,7 +725,7 @@ static void intel_modeset_readout_hw_state(struct drm_i915_private *i915)
 
 		crtc_state->hw.enable = crtc_state->hw.active;
 
-		crtc->base.enabled = crtc_state->hw.enable;
+		crtc->base.legacy.enabled = crtc_state->hw.enable;
 		crtc->active = crtc_state->hw.active;
 
 		if (crtc_state->hw.active)
diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 3215c4acd675..7e5ed8864d6a 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -154,24 +154,31 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
 		return;
 
 	/* Disable PER clock to make register write possible */
-	if (old_state && old_state->crtc && old_state->crtc->enabled)
+	if (old_state && old_state->crtc && old_state->crtc->legacy.enabled)
 		clk_disable_unprepare(lcdc->clk_per);
 
 	/* Framesize */
-	framesize = FIELD_PREP(IMX21LCDC_LSR_XMAX, crtc->mode.hdisplay >> 4) |
-		FIELD_PREP(IMX21LCDC_LSR_YMAX, crtc->mode.vdisplay);
+	framesize = FIELD_PREP(IMX21LCDC_LSR_XMAX,
+		               crtc->legacy.mode.hdisplay >> 4) |
+		FIELD_PREP(IMX21LCDC_LSR_YMAX, crtc->legacy.mode.vdisplay);
 	writel(framesize, lcdc->base + IMX21LCDC_LSR);
 
 	/* HSYNC */
-	lhcr = FIELD_PREP(IMX21LCDC_LHCR_HFPORCH, crtc->mode.hsync_start - crtc->mode.hdisplay - 1) |
-		FIELD_PREP(IMX21LCDC_LHCR_HWIDTH, crtc->mode.hsync_end - crtc->mode.hsync_start - 1) |
-		FIELD_PREP(IMX21LCDC_LHCR_HBPORCH, crtc->mode.htotal - crtc->mode.hsync_end - 3);
+	lhcr = FIELD_PREP(IMX21LCDC_LHCR_HFPORCH,
+		          crtc->legacy.mode.hsync_start - crtc->legacy.mode.hdisplay - 1) |
+		FIELD_PREP(IMX21LCDC_LHCR_HWIDTH,
+		           crtc->legacy.mode.hsync_end - crtc->legacy.mode.hsync_start - 1) |
+		FIELD_PREP(IMX21LCDC_LHCR_HBPORCH,
+		           crtc->legacy.mode.htotal - crtc->legacy.mode.hsync_end - 3);
 	writel(lhcr, lcdc->base + IMX21LCDC_LHCR);
 
 	/* VSYNC */
-	lvcr = FIELD_PREP(IMX21LCDC_LVCR_VFPORCH, crtc->mode.vsync_start - crtc->mode.vdisplay) |
-		FIELD_PREP(IMX21LCDC_LVCR_VWIDTH, crtc->mode.vsync_end - crtc->mode.vsync_start) |
-		FIELD_PREP(IMX21LCDC_LVCR_VBPORCH, crtc->mode.vtotal - crtc->mode.vsync_end);
+	lvcr = FIELD_PREP(IMX21LCDC_LVCR_VFPORCH,
+		          crtc->legacy.mode.vsync_start - crtc->legacy.mode.vdisplay) |
+		FIELD_PREP(IMX21LCDC_LVCR_VWIDTH,
+		           crtc->legacy.mode.vsync_end - crtc->legacy.mode.vsync_start) |
+		FIELD_PREP(IMX21LCDC_LVCR_VBPORCH,
+		           crtc->legacy.mode.vtotal - crtc->legacy.mode.vsync_end);
 	writel(lvcr, lcdc->base + IMX21LCDC_LVCR);
 
 	lpcr = readl(lcdc->base + IMX21LCDC_LPCR);
@@ -183,7 +190,7 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
 	writel(new_state->fb->pitches[0] / 4, lcdc->base + IMX21LCDC_LVPWR);
 
 	/* Enable PER clock */
-	if (new_state->crtc->enabled)
+	if (new_state->crtc->legacy.enabled)
 		clk_prepare_enable(lcdc->clk_per);
 }
 
@@ -195,7 +202,7 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 	int clk_div;
 	int bpp;
 	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
-	struct drm_display_mode *mode = &pipe->crtc.mode;
+	struct drm_display_mode *mode = &pipe->crtc.legacy.mode;
 	struct drm_display_info *disp_info = &lcdc->connector->display_info;
 	const int hsync_pol = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
 	const int vsync_pol = (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : 1;
@@ -257,7 +264,7 @@ static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
 	clk_disable_unprepare(lcdc->clk_ahb);
 	clk_disable_unprepare(lcdc->clk_ipg);
 
-	if (pipe->crtc.enabled)
+	if (pipe->crtc.legacy.enabled)
 		clk_disable_unprepare(lcdc->clk_per);
 
 	spin_lock_irq(&lcdc->drm.event_lock);
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 175b00e5a253..5496ea981370 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -211,9 +211,9 @@ static void mtk_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct mtk_crtc_state *state = to_mtk_crtc_state(crtc->state);
 
-	state->pending_width = crtc->mode.hdisplay;
-	state->pending_height = crtc->mode.vdisplay;
-	state->pending_vrefresh = drm_mode_vrefresh(&crtc->mode);
+	state->pending_width = crtc->legacy.mode.hdisplay;
+	state->pending_height = crtc->legacy.mode.vdisplay;
+	state->pending_vrefresh = drm_mode_vrefresh(&crtc->legacy.mode);
 	wmb();	/* Make sure the above parameters are set before update */
 	state->pending_config = true;
 }
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 7f98de38842b..1d6119c8d567 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -482,7 +482,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 
 	DRM_DEBUG_DRIVER("\n");
 
-	interlace_mode = new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE;
+	interlace_mode = new_state->crtc->legacy.mode.flags & DRM_MODE_FLAG_INTERLACE;
 
 	spin_lock_irqsave(&priv->drm->event_lock, flags);
 
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index b43ac61201f3..35ea994057b0 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -251,7 +251,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	hf_bank_len = 4;
 	vf_bank_len = 4;
 
-	if (new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE) {
+	if (new_state->crtc->legacy.mode.flags & DRM_MODE_FLAG_INTERLACE) {
 		vsc_bot_rcv_num = 6;
 		vsc_bot_rpt_p0_num = 2;
 	}
@@ -273,7 +273,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	 * But the vertical scaler can provide such funtionnality if
 	 * is configured for 2:1 scaling with interlace options enabled.
 	 */
-	if (new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE) {
+	if (new_state->crtc->legacy.mode.flags & DRM_MODE_FLAG_INTERLACE) {
 		dest.y1 /= 2;
 		dest.y2 /= 2;
 		dst_h /= 2;
@@ -282,7 +282,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	hf_phase_step = ((src_w << 18) / dst_w) << 6;
 	vf_phase_step = (src_h << 20) / dst_h;
 
-	if (new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE)
+	if (new_state->crtc->legacy.mode.flags & DRM_MODE_FLAG_INTERLACE)
 		bot_ini_phase = ((vf_phase_step / 2) >> 4);
 	else
 		bot_ini_phase = 0;
@@ -314,7 +314,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 					VSC_TOP_RPT_L0_NUM(vsc_ini_rpt_p0_num) |
 					VSC_VERTICAL_SCALER_EN;
 
-		if (new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE)
+		if (new_state->crtc->legacy.mode.flags & DRM_MODE_FLAG_INTERLACE)
 			priv->viu.osd_sc_v_ctrl0 |=
 					VSC_BOT_INI_RCV_NUM(vsc_bot_rcv_num) |
 					VSC_BOT_RPT_L0_NUM(vsc_bot_rpt_p0_num) |
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 68fae048a9a8..a415f2001db8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -170,7 +170,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	curr_client_type = dpu_crtc_get_client_type(crtc);
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
-		if (tmp_crtc->enabled &&
+		if (tmp_crtc->legacy.enabled &&
 		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
 		    tmp_crtc != crtc) {
 			struct dpu_crtc_state *tmp_cstate =
@@ -219,7 +219,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 		return 0;
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
-		if (tmp_crtc->enabled &&
+		if (tmp_crtc->legacy.enabled &&
 			curr_client_type ==
 				dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
@@ -291,7 +291,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 
 	clk_rate = 0;
 	drm_for_each_crtc(crtc, kms->dev) {
-		if (crtc->enabled) {
+		if (crtc->legacy.enabled) {
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
 			clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
 							clk_rate);
@@ -323,12 +323,13 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
 
 	DRM_DEBUG_ATOMIC("crtc:%d enabled:%d core_clk:%llu\n",
-			crtc->base.id, crtc->enabled, kms->perf.core_clk_rate);
+			crtc->base.id, crtc->legacy.enabled,
+			kms->perf.core_clk_rate);
 
 	old = &dpu_crtc->cur_perf;
 	new = &dpu_cstate->new_perf;
 
-	if (crtc->enabled) {
+	if (crtc->legacy.enabled) {
 		/*
 		 * cases for bus bandwidth update.
 		 * 1. new bandwidth vote - "ab or ib vote" is higher
@@ -361,7 +362,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	}
 
 	trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
-		new->core_clk_rate, !crtc->enabled, update_bus, update_clk);
+		new->core_clk_rate, !crtc->legacy.enabled, update_bus,
+		update_clk);
 
 	if (update_bus) {
 		ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
@@ -381,7 +383,9 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 
 		DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
 
-		trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
+		trace_dpu_core_perf_update_clk(kms->dev,
+					       !crtc->legacy.enabled,
+					       clk_rate);
 
 		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
 		ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 29298e066163..f249288ab042 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1139,12 +1139,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
-				   drm_mode_vrefresh(&crtc->mode),
+				   drm_mode_vrefresh(&crtc->legacy.mode),
 				   layout_valid ? &layout : NULL);
 
 	if (r_pipe->sspp) {
 		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
-					   drm_mode_vrefresh(&crtc->mode),
+					   drm_mode_vrefresh(&crtc->legacy.mode),
 					   layout_valid ? &layout : NULL);
 	}
 
@@ -1152,14 +1152,18 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		pstate->needs_qos_remap = false;
 
 	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt,
-						    &crtc->mode, pipe_cfg);
+						    &crtc->legacy.mode,
+						    pipe_cfg);
 
-	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
+	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->legacy.mode, pipe_cfg);
 
 	if (r_pipe->sspp) {
-		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
+		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
+							     &crtc->legacy.mode,
+							     r_pipe_cfg);
 
-		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
+		pstate->plane_clk = max(pstate->plane_clk,
+					_dpu_plane_calc_clk(&crtc->legacy.mode, r_pipe_cfg));
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 0f653e62b4a0..382939ab23ac 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -842,8 +842,8 @@ static void mdp5_crtc_atomic_flush(struct drm_crtc *crtc,
 static void get_roi(struct drm_crtc *crtc, uint32_t *roi_w, uint32_t *roi_h)
 {
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
-	uint32_t xres = crtc->mode.hdisplay;
-	uint32_t yres = crtc->mode.vdisplay;
+	uint32_t xres = crtc->legacy.mode.hdisplay;
+	uint32_t yres = crtc->legacy.mode.vdisplay;
 
 	/*
 	 * Cursor Region Of Interest (ROI) is a plane read from cursor
diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 4cbc3976b180..35e66559b1f6 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -735,7 +735,7 @@ static void nv_crtc_commit(struct drm_crtc *crtc)
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 
 	nouveau_hw_load_state(dev, nv_crtc->index, &nv04_display(dev)->mode_reg);
-	nv04_crtc_mode_set_base(crtc, crtc->x, crtc->y, NULL);
+	nv04_crtc_mode_set_base(crtc, crtc->legacy.x, crtc->legacy.y, NULL);
 
 #ifdef __BIG_ENDIAN
 	/* turn on LFB swapping */
@@ -899,7 +899,8 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 	nv_set_crtc_base(dev, nv_crtc->index, regp->fb_start);
 
 	/* Update the arbitration parameters. */
-	nouveau_calc_arb(dev, crtc->mode.clock, drm_fb->format->cpp[0] * 8,
+	nouveau_calc_arb(dev, crtc->legacy.mode.clock,
+			 drm_fb->format->cpp[0] * 8,
 			 &arb_burst, &arb_lwm);
 
 	regp->CRTC[NV_CIO_CRE_FF_INDEX] = arb_burst;
@@ -1097,8 +1098,8 @@ nv04_flip_complete(struct nvif_event *event, void *argv, u32 argc)
 
 	if (!nv04_finish_page_flip(chan, &state)) {
 		nv_set_crtc_base(drm->dev, drm_crtc_index(state.crtc),
-				 state.offset + state.crtc->y *
-				 state.pitch + state.crtc->x *
+				 state.offset + state.crtc->legacy.y *
+				 state.pitch + state.crtc->legacy.x *
 				 state.bpp / 8);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/cursor.c b/drivers/gpu/drm/nouveau/dispnv04/cursor.c
index 4c6440d29c3f..2a87b3256c29 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/cursor.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/cursor.c
@@ -47,7 +47,7 @@ nv04_cursor_set_offset(struct nouveau_crtc *nv_crtc, uint32_t offset)
 		XLATE(offset, 17, NV_CIO_CRE_HCUR_ADDR0_ADR);
 	regp->CRTC[NV_CIO_CRE_HCUR_ADDR1_INDEX] =
 		XLATE(offset, 11, NV_CIO_CRE_HCUR_ADDR1_ADR);
-	if (crtc->mode.flags & DRM_MODE_FLAG_DBLSCAN)
+	if (crtc->legacy.mode.flags & DRM_MODE_FLAG_DBLSCAN)
 		regp->CRTC[NV_CIO_CRE_HCUR_ADDR1_INDEX] |=
 			MASK(NV_CIO_CRE_HCUR_ADDR1_CUR_DBL);
 	regp->CRTC[NV_CIO_CRE_HCUR_ADDR2_INDEX] = offset >> 24;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c
index a3fedd226854..1663e173264a 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c
@@ -315,7 +315,7 @@ static void tv_setup_filter(struct drm_encoder *encoder)
 {
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
 	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
-	struct drm_display_mode *mode = &encoder->crtc->mode;
+	struct drm_display_mode *mode = &encoder->crtc->legacy.mode;
 	uint32_t (*filters[])[4][7] = {&tv_enc->state.hfilter,
 				       &tv_enc->state.vfilter};
 	int i, j, k;
@@ -544,7 +544,7 @@ void nv17_ctv_update_rescaler(struct drm_encoder *encoder)
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
 	int head = nouveau_crtc(encoder->crtc)->index;
 	struct nv04_crtc_reg *regs = &nv04_display(dev)->mode_reg.crtc_reg[head];
-	struct drm_display_mode *crtc_mode = &encoder->crtc->mode;
+	struct drm_display_mode *crtc_mode = &encoder->crtc->legacy.mode;
 	struct drm_display_mode *output_mode =
 		&get_tv_norm(encoder)->ctv_enc_mode.mode;
 	int overscan, hmargin, vmargin, hratio, vratio;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 4bc8039e6ee0..d7039aee9d72 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -754,8 +754,9 @@ static int nv17_tv_set_property(struct drm_encoder *encoder,
 		/* Disable the crtc to ensure a full modeset is
 		 * performed whenever it's turned on again. */
 		if (crtc)
-			drm_crtc_helper_set_mode(crtc, &crtc->mode,
-						 crtc->x, crtc->y,
+			drm_crtc_helper_set_mode(crtc, &crtc->legacy.mode,
+						 crtc->legacy.x,
+						 crtc->legacy.y,
 						 crtc->primary->legacy.fb);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 8d5c9c74cbb9..70a9d98b882c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -807,9 +807,9 @@ nouveau_connector_set_property(struct drm_connector *connector,
 
 	if (connector->encoder && connector->encoder->crtc) {
 		ret = drm_crtc_helper_set_mode(connector->encoder->crtc,
-					      &connector->encoder->crtc->mode,
-					       connector->encoder->crtc->x,
-					       connector->encoder->crtc->y,
+					      &connector->encoder->crtc->legacy.mode,
+					       connector->encoder->crtc->legacy.x,
+					       connector->encoder->crtc->legacy.y,
 					       NULL);
 		if (!ret)
 			return -EINVAL;
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index bc24af08dfcd..c2ea1d64d581 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -337,12 +337,12 @@ static void qxl_crtc_update_monitors_config(struct drm_crtc *crtc,
 	head.surface_id = 0;
 	oldcount = qdev->monitors_config->count;
 	if (crtc->state->active) {
-		struct drm_display_mode *mode = &crtc->mode;
+		struct drm_display_mode *mode = &crtc->legacy.mode;
 
 		head.width = mode->hdisplay;
 		head.height = mode->vdisplay;
-		head.x = crtc->x;
-		head.y = crtc->y;
+		head.x = crtc->legacy.x;
+		head.y = crtc->legacy.y;
 		if (qdev->monitors_config->count < i + 1)
 			qdev->monitors_config->count = i + 1;
 		if (qdev->primary_bo == qdev->dumb_shadow_bo)
diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
index 36e4663186c8..418ba3783835 100644
--- a/drivers/gpu/drm/radeon/atombios_crtc.c
+++ b/drivers/gpu/drm/radeon/atombios_crtc.c
@@ -1426,10 +1426,10 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
 	y &= ~1;
 	WREG32(EVERGREEN_VIEWPORT_START + radeon_crtc->crtc_offset,
 	       (x << 16) | y);
-	viewport_w = crtc->mode.hdisplay;
-	viewport_h = (crtc->mode.vdisplay + 1) & ~1;
+	viewport_w = crtc->legacy.mode.hdisplay;
+	viewport_h = (crtc->legacy.mode.vdisplay + 1) & ~1;
 	if ((rdev->family >= CHIP_BONAIRE) &&
-	    (crtc->mode.flags & DRM_MODE_FLAG_INTERLACE))
+	    (crtc->legacy.mode.flags & DRM_MODE_FLAG_INTERLACE))
 		viewport_h *= 2;
 	WREG32(EVERGREEN_VIEWPORT_SIZE + radeon_crtc->crtc_offset,
 	       (viewport_w << 16) | viewport_h);
@@ -1637,8 +1637,8 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 	y &= ~1;
 	WREG32(AVIVO_D1MODE_VIEWPORT_START + radeon_crtc->crtc_offset,
 	       (x << 16) | y);
-	viewport_w = crtc->mode.hdisplay;
-	viewport_h = (crtc->mode.vdisplay + 1) & ~1;
+	viewport_w = crtc->legacy.mode.hdisplay;
+	viewport_h = (crtc->legacy.mode.vdisplay + 1) & ~1;
 	WREG32(AVIVO_D1MODE_VIEWPORT_SIZE + radeon_crtc->crtc_offset,
 	       (viewport_w << 16) | viewport_h);
 
@@ -1812,7 +1812,7 @@ static int radeon_get_shared_nondp_ppll(struct drm_crtc *crtc)
 			}
 			/* for non-DP check the clock */
 			test_adjusted_clock = test_radeon_crtc->adjusted_clock;
-			if ((crtc->mode.clock == test_crtc->mode.clock) &&
+			if ((crtc->legacy.mode.clock == test_crtc->legacy.mode.clock) &&
 			    (adjusted_clock == test_adjusted_clock) &&
 			    (radeon_crtc->ss_enabled == test_radeon_crtc->ss_enabled) &&
 			    (test_radeon_crtc->pll_id != ATOM_PPLL_INVALID))
diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 11a492f21157..551367df0057 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -8811,7 +8811,7 @@ static u32 dce8_line_buffer_adjust(struct radeon_device *rdev,
 	 * than 4096, you need use to use 2 display controllers and combine
 	 * them using the stereo blender.
 	 */
-	if (radeon_crtc->base.enabled && mode) {
+	if (radeon_crtc->base.legacy.enabled && mode) {
 		if (mode->crtc_hdisplay < 1920) {
 			tmp = 1;
 			buffer_alloc = 2;
@@ -8843,7 +8843,7 @@ static u32 dce8_line_buffer_adjust(struct radeon_device *rdev,
 		udelay(1);
 	}
 
-	if (radeon_crtc->base.enabled && mode) {
+	if (radeon_crtc->base.legacy.enabled && mode) {
 		switch (tmp) {
 		case 0:
 		default:
@@ -9230,14 +9230,14 @@ static void dce8_program_watermarks(struct radeon_device *rdev,
 				    struct radeon_crtc *radeon_crtc,
 				    u32 lb_size, u32 num_heads)
 {
-	struct drm_display_mode *mode = &radeon_crtc->base.mode;
+	struct drm_display_mode *mode = &radeon_crtc->base.legacy.mode;
 	struct dce8_wm_params wm_low, wm_high;
 	u32 active_time;
 	u32 line_time = 0;
 	u32 latency_watermark_a = 0, latency_watermark_b = 0;
 	u32 tmp, wm_mask;
 
-	if (radeon_crtc->base.enabled && num_heads && mode) {
+	if (radeon_crtc->base.legacy.enabled && num_heads && mode) {
 		active_time = (u32) div_u64((u64)mode->crtc_hdisplay * 1000000,
 					    (u32)mode->clock);
 		line_time = (u32) div_u64((u64)mode->crtc_htotal * 1000000,
@@ -9374,11 +9374,11 @@ void dce8_bandwidth_update(struct radeon_device *rdev)
 	radeon_update_display_priority(rdev);
 
 	for (i = 0; i < rdev->num_crtc; i++) {
-		if (rdev->mode_info.crtcs[i]->base.enabled)
+		if (rdev->mode_info.crtcs[i]->base.legacy.enabled)
 			num_heads++;
 	}
 	for (i = 0; i < rdev->num_crtc; i++) {
-		mode = &rdev->mode_info.crtcs[i]->base.mode;
+		mode = &rdev->mode_info.crtcs[i]->base.legacy.mode;
 		lb_size = dce8_line_buffer_adjust(rdev, rdev->mode_info.crtcs[i], mode);
 		dce8_program_watermarks(rdev, rdev->mode_info.crtcs[i], lb_size, num_heads);
 	}
diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index 2cbcf7cfdc3c..e915f61286dc 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -1851,7 +1851,7 @@ static u32 evergreen_line_buffer_adjust(struct radeon_device *rdev,
 	 * of crtcs.  Ideally for multiple large displays we'd assign them to
 	 * non-linked crtcs for maximum line buffer allocation.
 	 */
-	if (radeon_crtc->base.enabled && mode) {
+	if (radeon_crtc->base.legacy.enabled && mode) {
 		if (other_mode) {
 			tmp = 0; /* 1/2 */
 			buffer_alloc = 1;
@@ -1880,7 +1880,7 @@ static u32 evergreen_line_buffer_adjust(struct radeon_device *rdev,
 		}
 	}
 
-	if (radeon_crtc->base.enabled && mode) {
+	if (radeon_crtc->base.legacy.enabled && mode) {
 		switch (tmp) {
 		case 0:
 		case 4:
@@ -2156,7 +2156,7 @@ static void evergreen_program_watermarks(struct radeon_device *rdev,
 					 struct radeon_crtc *radeon_crtc,
 					 u32 lb_size, u32 num_heads)
 {
-	struct drm_display_mode *mode = &radeon_crtc->base.mode;
+	struct drm_display_mode *mode = &radeon_crtc->base.legacy.mode;
 	struct evergreen_wm_params wm_low, wm_high;
 	u32 dram_channels;
 	u32 active_time;
@@ -2169,7 +2169,7 @@ static void evergreen_program_watermarks(struct radeon_device *rdev,
 	u32 tmp, arb_control3;
 	fixed20_12 a, b, c;
 
-	if (radeon_crtc->base.enabled && num_heads && mode) {
+	if (radeon_crtc->base.legacy.enabled && num_heads && mode) {
 		active_time = (u32) div_u64((u64)mode->crtc_hdisplay * 1000000,
 					    (u32)mode->clock);
 		line_time = (u32) div_u64((u64)mode->crtc_htotal * 1000000,
@@ -2334,12 +2334,12 @@ void evergreen_bandwidth_update(struct radeon_device *rdev)
 	radeon_update_display_priority(rdev);
 
 	for (i = 0; i < rdev->num_crtc; i++) {
-		if (rdev->mode_info.crtcs[i]->base.enabled)
+		if (rdev->mode_info.crtcs[i]->base.legacy.enabled)
 			num_heads++;
 	}
 	for (i = 0; i < rdev->num_crtc; i += 2) {
-		mode0 = &rdev->mode_info.crtcs[i]->base.mode;
-		mode1 = &rdev->mode_info.crtcs[i+1]->base.mode;
+		mode0 = &rdev->mode_info.crtcs[i]->base.legacy.mode;
+		mode1 = &rdev->mode_info.crtcs[i + 1]->base.legacy.mode;
 		lb_size = evergreen_line_buffer_adjust(rdev, rdev->mode_info.crtcs[i], mode0, mode1);
 		evergreen_program_watermarks(rdev, rdev->mode_info.crtcs[i], lb_size, num_heads);
 		lb_size = evergreen_line_buffer_adjust(rdev, rdev->mode_info.crtcs[i+1], mode1, mode0);
diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 1aa3126ab6d9..6f066656c651 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -1499,7 +1499,7 @@ int r100_cs_packet_parse_vline(struct radeon_cs_parser *p)
 	radeon_crtc = to_radeon_crtc(crtc);
 	crtc_id = radeon_crtc->crtc_id;
 
-	if (!crtc->enabled) {
+	if (!crtc->legacy.enabled) {
 		/* if the CRTC isn't enabled - we need to nop out the wait until */
 		ib[h_idx + 2] = PACKET2(0);
 		ib[h_idx + 3] = PACKET2(0);
@@ -3242,19 +3242,19 @@ void r100_bandwidth_update(struct radeon_device *rdev)
 
 	radeon_update_display_priority(rdev);
 
-	if (rdev->mode_info.crtcs[0]->base.enabled) {
+	if (rdev->mode_info.crtcs[0]->base.legacy.enabled) {
 		const struct drm_framebuffer *fb =
 			rdev->mode_info.crtcs[0]->base.primary->legacy.fb;
 
-		mode1 = &rdev->mode_info.crtcs[0]->base.mode;
+		mode1 = &rdev->mode_info.crtcs[0]->base.legacy.mode;
 		pixel_bytes1 = fb->format->cpp[0];
 	}
 	if (!(rdev->flags & RADEON_SINGLE_CRTC)) {
-		if (rdev->mode_info.crtcs[1]->base.enabled) {
+		if (rdev->mode_info.crtcs[1]->base.legacy.enabled) {
 			const struct drm_framebuffer *fb =
 				rdev->mode_info.crtcs[1]->base.primary->legacy.fb;
 
-			mode2 = &rdev->mode_info.crtcs[1]->base.mode;
+			mode2 = &rdev->mode_info.crtcs[1]->base.legacy.mode;
 			pixel_bytes2 = fb->format->cpp[0];
 		}
 	}
diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index 1b2d31c4d77c..27f6a285c615 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -892,7 +892,7 @@ int r600_cs_common_vline_parse(struct radeon_cs_parser *p,
 	radeon_crtc = to_radeon_crtc(crtc);
 	crtc_id = radeon_crtc->crtc_id;
 
-	if (!crtc->enabled) {
+	if (!crtc->legacy.enabled) {
 		/* CRTC isn't enabled - we need to nop out the WAIT_REG_MEM */
 		ib[h_idx + 2] = PACKET2(0);
 		ib[h_idx + 3] = PACKET2(0);
diff --git a/drivers/gpu/drm/radeon/r600_dpm.c b/drivers/gpu/drm/radeon/r600_dpm.c
index 81d58ef667dd..19b02bc35c09 100644
--- a/drivers/gpu/drm/radeon/r600_dpm.c
+++ b/drivers/gpu/drm/radeon/r600_dpm.c
@@ -162,7 +162,7 @@ u32 r600_dpm_get_vblank_time(struct radeon_device *rdev)
 	if (rdev->num_crtc && rdev->mode_info.mode_config_initialized) {
 		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 			radeon_crtc = to_radeon_crtc(crtc);
-			if (crtc->enabled && radeon_crtc->enabled && radeon_crtc->hw_mode.clock) {
+			if (crtc->legacy.enabled && radeon_crtc->enabled && radeon_crtc->hw_mode.clock) {
 				vblank_in_pixels =
 					radeon_crtc->hw_mode.crtc_htotal *
 					(radeon_crtc->hw_mode.crtc_vblank_end -
@@ -188,7 +188,7 @@ u32 r600_dpm_get_vrefresh(struct radeon_device *rdev)
 	if (rdev->num_crtc && rdev->mode_info.mode_config_initialized) {
 		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 			radeon_crtc = to_radeon_crtc(crtc);
-			if (crtc->enabled && radeon_crtc->enabled && radeon_crtc->hw_mode.clock) {
+			if (crtc->legacy.enabled && radeon_crtc->enabled && radeon_crtc->hw_mode.clock) {
 				vrefresh = drm_mode_vrefresh(&radeon_crtc->hw_mode);
 				break;
 			}
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index dbe0f75cfea7..f3a1f4aa4327 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -90,9 +90,9 @@ static void radeon_property_change_mode(struct drm_encoder *encoder)
 {
 	struct drm_crtc *crtc = encoder->crtc;
 
-	if (crtc && crtc->enabled) {
-		drm_crtc_helper_set_mode(crtc, &crtc->mode,
-					 crtc->x, crtc->y,
+	if (crtc && crtc->legacy.enabled) {
+		drm_crtc_helper_set_mode(crtc, &crtc->legacy.mode,
+					 crtc->legacy.x, crtc->legacy.y,
 					 crtc->primary->legacy.fb);
 	}
 }
diff --git a/drivers/gpu/drm/radeon/radeon_cursor.c b/drivers/gpu/drm/radeon/radeon_cursor.c
index 3507805b34bc..59bf6542f180 100644
--- a/drivers/gpu/drm/radeon/radeon_cursor.c
+++ b/drivers/gpu/drm/radeon/radeon_cursor.c
@@ -153,8 +153,8 @@ static int radeon_cursor_move_locked(struct drm_crtc *crtc, int x, int y)
 
 	if (ASIC_IS_AVIVO(rdev)) {
 		/* avivo cursor are offset into the total surface */
-		x += crtc->x;
-		y += crtc->y;
+		x += crtc->legacy.x;
+		y += crtc->legacy.y;
 	}
 
 	if (x < 0)
@@ -163,10 +163,11 @@ static int radeon_cursor_move_locked(struct drm_crtc *crtc, int x, int y)
 		yorigin = min(-y, radeon_crtc->max_cursor_height - 1);
 
 	if (!ASIC_IS_AVIVO(rdev)) {
-		x += crtc->x;
-		y += crtc->y;
+		x += crtc->legacy.x;
+		y += crtc->legacy.y;
 	}
-	DRM_DEBUG("x %d y %d c->x %d c->y %d\n", x, y, crtc->x, crtc->y);
+	DRM_DEBUG("x %d y %d c->x %d c->y %d\n", x, y, crtc->legacy.x,
+		  crtc->legacy.y);
 
 	/* fixed on DCE6 and newer */
 	if (ASIC_IS_AVIVO(rdev) && !ASIC_IS_DCE6(rdev)) {
@@ -177,20 +178,20 @@ static int radeon_cursor_move_locked(struct drm_crtc *crtc, int x, int y)
 		 * avivo cursor image can't end on 128 pixel boundary or
 		 * go past the end of the frame if both crtcs are enabled
 		 *
-		 * NOTE: It is safe to access crtc->enabled of other crtcs
+		 * NOTE: It is safe to access crtc->legacy.enabled of other crtcs
 		 * without holding either the mode_config lock or the other
 		 * crtc's lock as long as write access to this flag _always_
 		 * grabs all locks.
 		 */
 		list_for_each_entry(crtc_p, &crtc->dev->mode_config.crtc_list, head) {
-			if (crtc_p->enabled)
+			if (crtc_p->legacy.enabled)
 				i++;
 		}
 		if (i > 1) {
 			int cursor_end, frame_end;
 
 			cursor_end = x + w;
-			frame_end = crtc->x + crtc->mode.crtc_hdisplay;
+			frame_end = crtc->legacy.x + crtc->legacy.mode.crtc_hdisplay;
 			if (cursor_end >= frame_end) {
 				w = w - (cursor_end - frame_end);
 				if (!(frame_end & 0x7f))
@@ -206,9 +207,9 @@ static int radeon_cursor_move_locked(struct drm_crtc *crtc, int x, int y)
 		}
 	}
 
-	if (x <= (crtc->x - w) || y <= (crtc->y - radeon_crtc->cursor_height) ||
-	    x >= (crtc->x + crtc->mode.hdisplay) ||
-	    y >= (crtc->y + crtc->mode.vdisplay))
+	if (x <= (crtc->legacy.x - w) || y <= (crtc->legacy.y - radeon_crtc->cursor_height) ||
+	    x >= (crtc->legacy.x + crtc->legacy.mode.hdisplay) ||
+	    y >= (crtc->legacy.y + crtc->legacy.mode.vdisplay))
 		goto out_of_bounds;
 
 	x += xorigin;
@@ -225,10 +226,10 @@ static int radeon_cursor_move_locked(struct drm_crtc *crtc, int x, int y)
 		WREG32(AVIVO_D1CUR_SIZE + radeon_crtc->crtc_offset,
 		       ((w - 1) << 16) | (radeon_crtc->cursor_height - 1));
 	} else {
-		x -= crtc->x;
-		y -= crtc->y;
+		x -= crtc->legacy.x;
+		y -= crtc->legacy.y;
 
-		if (crtc->mode.flags & DRM_MODE_FLAG_DBLSCAN)
+		if (crtc->legacy.mode.flags & DRM_MODE_FLAG_DBLSCAN)
 			y *= 2;
 
 		WREG32(RADEON_CUR_HORZ_VERT_OFF + radeon_crtc->crtc_offset,
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 55f80424f514..aac3a1cf3673 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -223,7 +223,7 @@ void radeon_crtc_load_lut(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct radeon_device *rdev = dev->dev_private;
 
-	if (!crtc->enabled)
+	if (!crtc->legacy.enabled)
 		return;
 
 	if (ASIC_IS_DCE5(rdev))
@@ -553,11 +553,11 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 				base &= ~0x7ff;
 			} else {
 				int byteshift = fb->format->cpp[0] * 8 >> 4;
-				int tile_addr = (((crtc->y >> 3) * pitch_pixels +  crtc->x) >> (8 - byteshift)) << 11;
-				base += tile_addr + ((crtc->x << byteshift) % 256) + ((crtc->y % 8) << 8);
+				int tile_addr = (((crtc->legacy.y >> 3) * pitch_pixels +  crtc->legacy.x) >> (8 - byteshift)) << 11;
+				base += tile_addr + ((crtc->legacy.x << byteshift) % 256) + ((crtc->legacy.y % 8) << 8);
 			}
 		} else {
-			int offset = crtc->y * pitch_pixels + crtc->x;
+			int offset = crtc->legacy.y * pitch_pixels + crtc->legacy.x;
 			switch (fb->format->cpp[0] * 8) {
 			case 8:
 			default:
@@ -641,7 +641,7 @@ radeon_crtc_set_config(struct drm_mode_set *set,
 	ret = drm_crtc_helper_set_config(set, ctx);
 
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
-		if (crtc->enabled)
+		if (crtc->legacy.enabled)
 			active = true;
 
 	pm_runtime_mark_last_busy(dev->dev);
@@ -1712,9 +1712,9 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 			memcpy(&radeon_crtc->native_mode,
 			       &radeon_encoder->native_mode,
 				sizeof(struct drm_display_mode));
-			src_v = crtc->mode.vdisplay;
+			src_v = crtc->legacy.mode.vdisplay;
 			dst_v = radeon_crtc->native_mode.vdisplay;
-			src_h = crtc->mode.hdisplay;
+			src_h = crtc->legacy.mode.hdisplay;
 			dst_h = radeon_crtc->native_mode.hdisplay;
 
 			/* fix up for overscan on hdmi */
@@ -1733,10 +1733,10 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 				else
 					radeon_crtc->v_border = (mode->vdisplay >> 5) + 16;
 				radeon_crtc->rmx_type = RMX_FULL;
-				src_v = crtc->mode.vdisplay;
-				dst_v = crtc->mode.vdisplay - (radeon_crtc->v_border * 2);
-				src_h = crtc->mode.hdisplay;
-				dst_h = crtc->mode.hdisplay - (radeon_crtc->h_border * 2);
+				src_v = crtc->legacy.mode.vdisplay;
+				dst_v = crtc->legacy.mode.vdisplay - (radeon_crtc->v_border * 2);
+				src_h = crtc->legacy.mode.hdisplay;
+				dst_h = crtc->legacy.mode.hdisplay - (radeon_crtc->h_border * 2);
 			}
 			first = false;
 		} else {
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 900b05d8aa5c..fb1247179e77 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -472,7 +472,7 @@ static int radeon_pmops_runtime_idle(struct device *dev)
 	}
 
 	list_for_each_entry(crtc, &drm_dev->mode_config.crtc_list, head) {
-		if (crtc->enabled) {
+		if (crtc->legacy.enabled) {
 			DRM_DEBUG_DRIVER("failing to power off - crtc active\n");
 			return -EBUSY;
 		}
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
index 6b37b301ea1f..20f0775f63ca 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
@@ -1080,7 +1080,7 @@ static void radeon_crtc_commit(struct drm_crtc *crtc)
 	* Reenable the CRTCs that should be running.
 	*/
 	list_for_each_entry(crtci, &dev->mode_config.crtc_list, head) {
-		if (crtci->enabled)
+		if (crtci->legacy.enabled)
 			radeon_crtc_dpms(crtci, DRM_MODE_DPMS_ON);
 	}
 }
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
index d6aa1a3012a8..0b4f6c766e38 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
@@ -1538,7 +1538,7 @@ static enum drm_connector_status radeon_legacy_tv_dac_detect(struct drm_encoder
 	/* find out if crtc2 is in use or if this encoder is using it */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-		if ((radeon_crtc->crtc_id == 1) && crtc->enabled) {
+		if ((radeon_crtc->crtc_id == 1) && crtc->legacy.enabled) {
 			if (encoder->crtc != crtc) {
 				return connector_status_disconnected;
 			}
diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index b4fb7e70320b..f2f481074b50 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -1783,7 +1783,7 @@ static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
 		list_for_each_entry(crtc,
 				    &ddev->mode_config.crtc_list, head) {
 			radeon_crtc = to_radeon_crtc(crtc);
-			if (crtc->enabled) {
+			if (crtc->legacy.enabled) {
 				rdev->pm.dpm.new_active_crtcs |= (1 << radeon_crtc->crtc_id);
 				rdev->pm.dpm.new_active_crtc_count++;
 				if (!radeon_crtc->connector)
diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs600.c
index 335df822b330..b8f1e331ae41 100644
--- a/drivers/gpu/drm/radeon/rs600.c
+++ b/drivers/gpu/drm/radeon/rs600.c
@@ -908,10 +908,10 @@ void rs600_bandwidth_update(struct radeon_device *rdev)
 
 	radeon_update_display_priority(rdev);
 
-	if (rdev->mode_info.crtcs[0]->base.enabled)
-		mode0 = &rdev->mode_info.crtcs[0]->base.mode;
-	if (rdev->mode_info.crtcs[1]->base.enabled)
-		mode1 = &rdev->mode_info.crtcs[1]->base.mode;
+	if (rdev->mode_info.crtcs[0]->base.legacy.enabled)
+		mode0 = &rdev->mode_info.crtcs[0]->base.legacy.mode;
+	if (rdev->mode_info.crtcs[1]->base.legacy.enabled)
+		mode1 = &rdev->mode_info.crtcs[1]->base.legacy.mode;
 
 	rs690_line_buffer_adjust(rdev, mode0, mode1);
 
diff --git a/drivers/gpu/drm/radeon/rs690.c b/drivers/gpu/drm/radeon/rs690.c
index 016eb4992803..1d9d8163c206 100644
--- a/drivers/gpu/drm/radeon/rs690.c
+++ b/drivers/gpu/drm/radeon/rs690.c
@@ -274,14 +274,14 @@ static void rs690_crtc_bandwidth_compute(struct radeon_device *rdev,
 					 struct rs690_watermark *wm,
 					 bool low)
 {
-	struct drm_display_mode *mode = &crtc->base.mode;
+	struct drm_display_mode *mode = &crtc->base.legacy.mode;
 	fixed20_12 a, b, c;
 	fixed20_12 pclk, request_fifo_depth, tolerable_latency, estimated_width;
 	fixed20_12 consumption_time, line_time, chunk_time, read_delay_latency;
 	fixed20_12 sclk, core_bandwidth, max_bandwidth;
 	u32 selected_sclk;
 
-	if (!crtc->base.enabled) {
+	if (!crtc->base.legacy.enabled) {
 		/* FIXME: wouldn't it better to set priority mark to maximum */
 		wm->lb_request_fifo_depth = 4;
 		return;
@@ -348,7 +348,7 @@ static void rs690_crtc_bandwidth_compute(struct radeon_device *rdev,
 	 *  LineTime = total number of horizontal pixels
 	 *  pclk = pixel clock period(ns)
 	 */
-	a.full = dfixed_const(crtc->base.mode.crtc_htotal);
+	a.full = dfixed_const(crtc->base.legacy.mode.crtc_htotal);
 	line_time.full = dfixed_mul(a, pclk);
 
 	/* Determine active time
@@ -356,8 +356,8 @@ static void rs690_crtc_bandwidth_compute(struct radeon_device *rdev,
 	 *  hactive = total number of horizontal active pixels
 	 *  htotal = total number of horizontal pixels
 	 */
-	a.full = dfixed_const(crtc->base.mode.crtc_htotal);
-	b.full = dfixed_const(crtc->base.mode.crtc_hdisplay);
+	a.full = dfixed_const(crtc->base.legacy.mode.crtc_htotal);
+	b.full = dfixed_const(crtc->base.legacy.mode.crtc_hdisplay);
 	wm->active_time.full = dfixed_mul(line_time, b);
 	wm->active_time.full = dfixed_div(wm->active_time, a);
 
@@ -440,14 +440,14 @@ static void rs690_crtc_bandwidth_compute(struct radeon_device *rdev,
 	 *  width = viewport width in pixels
 	 */
 	a.full = dfixed_const(16);
-	wm->priority_mark_max.full = dfixed_const(crtc->base.mode.crtc_hdisplay);
+	wm->priority_mark_max.full = dfixed_const(crtc->base.legacy.mode.crtc_hdisplay);
 	wm->priority_mark_max.full = dfixed_div(wm->priority_mark_max, a);
 	wm->priority_mark_max.full = dfixed_ceil(wm->priority_mark_max);
 
 	/* Determine estimated width */
 	estimated_width.full = tolerable_latency.full - wm->worst_case_latency.full;
 	estimated_width.full = dfixed_div(estimated_width, consumption_time);
-	if (dfixed_trunc(estimated_width) > crtc->base.mode.crtc_hdisplay) {
+	if (dfixed_trunc(estimated_width) > crtc->base.legacy.mode.crtc_hdisplay) {
 		wm->priority_mark.full = dfixed_const(10);
 	} else {
 		a.full = dfixed_const(16);
@@ -596,10 +596,10 @@ void rs690_bandwidth_update(struct radeon_device *rdev)
 
 	radeon_update_display_priority(rdev);
 
-	if (rdev->mode_info.crtcs[0]->base.enabled)
-		mode0 = &rdev->mode_info.crtcs[0]->base.mode;
-	if (rdev->mode_info.crtcs[1]->base.enabled)
-		mode1 = &rdev->mode_info.crtcs[1]->base.mode;
+	if (rdev->mode_info.crtcs[0]->base.legacy.enabled)
+		mode0 = &rdev->mode_info.crtcs[0]->base.legacy.mode;
+	if (rdev->mode_info.crtcs[1]->base.legacy.enabled)
+		mode1 = &rdev->mode_info.crtcs[1]->base.legacy.mode;
 	/*
 	 * Set display0/1 priority up in the memory controller for
 	 * modes if the user specifies HIGH for displaypriority
diff --git a/drivers/gpu/drm/radeon/rs780_dpm.c b/drivers/gpu/drm/radeon/rs780_dpm.c
index 24ad12409120..fd8b00164106 100644
--- a/drivers/gpu/drm/radeon/rs780_dpm.c
+++ b/drivers/gpu/drm/radeon/rs780_dpm.c
@@ -60,11 +60,11 @@ static void rs780_get_pm_mode_parameters(struct radeon_device *rdev)
 
 	for (i = 0; i < rdev->num_crtc; i++) {
 		crtc = (struct drm_crtc *)minfo->crtcs[i];
-		if (crtc && crtc->enabled) {
+		if (crtc && crtc->legacy.enabled) {
 			radeon_crtc = to_radeon_crtc(crtc);
 			pi->crtc_id = radeon_crtc->crtc_id;
-			if (crtc->mode.htotal && crtc->mode.vtotal)
-				pi->refresh_rate = drm_mode_vrefresh(&crtc->mode);
+			if (crtc->legacy.mode.htotal && crtc->legacy.mode.vtotal)
+				pi->refresh_rate = drm_mode_vrefresh(&crtc->legacy.mode);
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
index 1b4dfb645585..485365082f0a 100644
--- a/drivers/gpu/drm/radeon/rv515.c
+++ b/drivers/gpu/drm/radeon/rv515.c
@@ -925,14 +925,14 @@ static void rv515_crtc_bandwidth_compute(struct radeon_device *rdev,
 					 struct rv515_watermark *wm,
 					 bool low)
 {
-	struct drm_display_mode *mode = &crtc->base.mode;
+	struct drm_display_mode *mode = &crtc->base.legacy.mode;
 	fixed20_12 a, b, c;
 	fixed20_12 pclk, request_fifo_depth, tolerable_latency, estimated_width;
 	fixed20_12 consumption_time, line_time, chunk_time, read_delay_latency;
 	fixed20_12 sclk;
 	u32 selected_sclk;
 
-	if (!crtc->base.enabled) {
+	if (!crtc->base.legacy.enabled) {
 		/* FIXME: wouldn't it better to set priority mark to maximum */
 		wm->lb_request_fifo_depth = 4;
 		return;
@@ -996,7 +996,7 @@ static void rv515_crtc_bandwidth_compute(struct radeon_device *rdev,
 	 *  LineTime = total number of horizontal pixels
 	 *  pclk = pixel clock period(ns)
 	 */
-	a.full = dfixed_const(crtc->base.mode.crtc_htotal);
+	a.full = dfixed_const(crtc->base.legacy.mode.crtc_htotal);
 	line_time.full = dfixed_mul(a, pclk);
 
 	/* Determine active time
@@ -1004,8 +1004,8 @@ static void rv515_crtc_bandwidth_compute(struct radeon_device *rdev,
 	 *  hactive = total number of horizontal active pixels
 	 *  htotal = total number of horizontal pixels
 	 */
-	a.full = dfixed_const(crtc->base.mode.crtc_htotal);
-	b.full = dfixed_const(crtc->base.mode.crtc_hdisplay);
+	a.full = dfixed_const(crtc->base.legacy.mode.crtc_htotal);
+	b.full = dfixed_const(crtc->base.legacy.mode.crtc_hdisplay);
 	wm->active_time.full = dfixed_mul(line_time, b);
 	wm->active_time.full = dfixed_div(wm->active_time, a);
 
@@ -1059,14 +1059,14 @@ static void rv515_crtc_bandwidth_compute(struct radeon_device *rdev,
 	 *  width = viewport width in pixels
 	 */
 	a.full = dfixed_const(16);
-	wm->priority_mark_max.full = dfixed_const(crtc->base.mode.crtc_hdisplay);
+	wm->priority_mark_max.full = dfixed_const(crtc->base.legacy.mode.crtc_hdisplay);
 	wm->priority_mark_max.full = dfixed_div(wm->priority_mark_max, a);
 	wm->priority_mark_max.full = dfixed_ceil(wm->priority_mark_max);
 
 	/* Determine estimated width */
 	estimated_width.full = tolerable_latency.full - wm->worst_case_latency.full;
 	estimated_width.full = dfixed_div(estimated_width, consumption_time);
-	if (dfixed_trunc(estimated_width) > crtc->base.mode.crtc_hdisplay) {
+	if (dfixed_trunc(estimated_width) > crtc->base.legacy.mode.crtc_hdisplay) {
 		wm->priority_mark.full = wm->priority_mark_max.full;
 	} else {
 		a.full = dfixed_const(16);
@@ -1210,10 +1210,10 @@ void rv515_bandwidth_avivo_update(struct radeon_device *rdev)
 	u32 d1mode_priority_a_cnt, d1mode_priority_b_cnt;
 	u32 d2mode_priority_a_cnt, d2mode_priority_b_cnt;
 
-	if (rdev->mode_info.crtcs[0]->base.enabled)
-		mode0 = &rdev->mode_info.crtcs[0]->base.mode;
-	if (rdev->mode_info.crtcs[1]->base.enabled)
-		mode1 = &rdev->mode_info.crtcs[1]->base.mode;
+	if (rdev->mode_info.crtcs[0]->base.legacy.enabled)
+		mode0 = &rdev->mode_info.crtcs[0]->base.legacy.mode;
+	if (rdev->mode_info.crtcs[1]->base.legacy.enabled)
+		mode1 = &rdev->mode_info.crtcs[1]->base.legacy.mode;
 	rs690_line_buffer_adjust(rdev, mode0, mode1);
 
 	rv515_crtc_bandwidth_compute(rdev, rdev->mode_info.crtcs[0], &wm0_high, false);
@@ -1252,10 +1252,10 @@ void rv515_bandwidth_update(struct radeon_device *rdev)
 
 	radeon_update_display_priority(rdev);
 
-	if (rdev->mode_info.crtcs[0]->base.enabled)
-		mode0 = &rdev->mode_info.crtcs[0]->base.mode;
-	if (rdev->mode_info.crtcs[1]->base.enabled)
-		mode1 = &rdev->mode_info.crtcs[1]->base.mode;
+	if (rdev->mode_info.crtcs[0]->base.legacy.enabled)
+		mode0 = &rdev->mode_info.crtcs[0]->base.legacy.mode;
+	if (rdev->mode_info.crtcs[1]->base.legacy.enabled)
+		mode1 = &rdev->mode_info.crtcs[1]->base.legacy.mode;
 	/*
 	 * Set display0/1 priority up in the memory controller for
 	 * modes if the user specifies HIGH for displaypriority
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 6c95575ce109..2f529e881514 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -1964,7 +1964,7 @@ static u32 dce6_line_buffer_adjust(struct radeon_device *rdev,
 	 * of crtcs.  Ideally for multiple large displays we'd assign them to
 	 * non-linked crtcs for maximum line buffer allocation.
 	 */
-	if (radeon_crtc->base.enabled && mode) {
+	if (radeon_crtc->base.legacy.enabled && mode) {
 		if (other_mode) {
 			tmp = 0; /* 1/2 */
 			buffer_alloc = 1;
@@ -1989,7 +1989,7 @@ static u32 dce6_line_buffer_adjust(struct radeon_device *rdev,
 		udelay(1);
 	}
 
-	if (radeon_crtc->base.enabled && mode) {
+	if (radeon_crtc->base.legacy.enabled && mode) {
 		switch (tmp) {
 		case 0:
 		default:
@@ -2275,7 +2275,7 @@ static void dce6_program_watermarks(struct radeon_device *rdev,
 					 struct radeon_crtc *radeon_crtc,
 					 u32 lb_size, u32 num_heads)
 {
-	struct drm_display_mode *mode = &radeon_crtc->base.mode;
+	struct drm_display_mode *mode = &radeon_crtc->base.legacy.mode;
 	struct dce6_wm_params wm_low, wm_high;
 	u32 dram_channels;
 	u32 active_time;
@@ -2287,7 +2287,7 @@ static void dce6_program_watermarks(struct radeon_device *rdev,
 	u32 tmp, arb_control3;
 	fixed20_12 a, b, c;
 
-	if (radeon_crtc->base.enabled && num_heads && mode) {
+	if (radeon_crtc->base.legacy.enabled && num_heads && mode) {
 		active_time = (u32) div_u64((u64)mode->crtc_hdisplay * 1000000,
 					    (u32)mode->clock);
 		line_time = (u32) div_u64((u64)mode->crtc_htotal * 1000000,
@@ -2450,12 +2450,12 @@ void dce6_bandwidth_update(struct radeon_device *rdev)
 	radeon_update_display_priority(rdev);
 
 	for (i = 0; i < rdev->num_crtc; i++) {
-		if (rdev->mode_info.crtcs[i]->base.enabled)
+		if (rdev->mode_info.crtcs[i]->base.legacy.enabled)
 			num_heads++;
 	}
 	for (i = 0; i < rdev->num_crtc; i += 2) {
-		mode0 = &rdev->mode_info.crtcs[i]->base.mode;
-		mode1 = &rdev->mode_info.crtcs[i+1]->base.mode;
+		mode0 = &rdev->mode_info.crtcs[i]->base.legacy.mode;
+		mode1 = &rdev->mode_info.crtcs[i + 1]->base.legacy.mode;
 		lb_size = dce6_line_buffer_adjust(rdev, rdev->mode_info.crtcs[i], mode0, mode1);
 		dce6_program_watermarks(rdev, rdev->mode_info.crtcs[i], lb_size, num_heads);
 		lb_size = dce6_line_buffer_adjust(rdev, rdev->mode_info.crtcs[i+1], mode1, mode0);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
index 7e175dbfd892..3bb2d90c100d 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -600,7 +600,7 @@ static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
 	 * sync mode (with the HSYNC and VSYNC signals configured as outputs and
 	 * actively driven).
 	 */
-	interlaced = rcrtc->crtc.mode.flags & DRM_MODE_FLAG_INTERLACE;
+	interlaced = rcrtc->crtc.legacy.mode.flags & DRM_MODE_FLAG_INTERLACE;
 	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_TVM_MASK | DSYSR_SCM_MASK,
 				   (interlaced ? DSYSR_SCM_INT_VIDEO : 0) |
 				   DSYSR_TVM_MASTER);
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 2e2f37b9d0a4..df4411a3e6d5 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -112,7 +112,7 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 	struct drm_crtc *crtc = &scrtc->base;
 	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
 	const struct drm_display_info *info = &sdev->connector->display_info;
-	const struct drm_display_mode *mode = &crtc->mode;
+	const struct drm_display_mode *mode = &crtc->legacy.mode;
 	unsigned int i;
 	u32 value;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 14fce5c33e03..a9aa2808364b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -958,8 +958,8 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 	dsp_info = (drm_rect_height(dest) - 1) << 16;
 	dsp_info |= (drm_rect_width(dest) - 1) & 0xffff;
 
-	dsp_stx = dest->x1 + crtc->mode.htotal - crtc->mode.hsync_start;
-	dsp_sty = dest->y1 + crtc->mode.vtotal - crtc->mode.vsync_start;
+	dsp_stx = dest->x1 + crtc->legacy.mode.htotal - crtc->legacy.mode.hsync_start;
+	dsp_sty = dest->y1 + crtc->legacy.mode.vtotal - crtc->legacy.mode.vsync_start;
 	dsp_st = dsp_sty << 16 | (dsp_stx & 0xffff);
 
 	if (fb->format->char_per_block[0])
diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index 3c7154f2d5f3..34052c43bda9 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -83,9 +83,9 @@ sti_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode)
 		goto pix_error;
 	}
 
-	sti_vtg_set_config(compo->vtg[mixer->id], &crtc->mode);
+	sti_vtg_set_config(compo->vtg[mixer->id], &crtc->legacy.mode);
 
-	if (sti_mixer_active_video_area(mixer, &crtc->mode)) {
+	if (sti_mixer_active_video_area(mixer, &crtc->legacy.mode)) {
 		DRM_ERROR("Can't set active video area\n");
 		goto mixer_error;
 	}
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index c59fcb4dca32..981218d0db2b 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -277,7 +277,7 @@ static void sti_cursor_atomic_update(struct drm_plane *drm_plane,
 	if (!crtc || !fb)
 		return;
 
-	mode = &crtc->mode;
+	mode = &crtc->legacy.mode;
 	dst_x = newstate->crtc_x;
 	dst_y = newstate->crtc_y;
 
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index f046f5f7ad25..e431c760558d 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -755,7 +755,7 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 		clk_prepare_enable(gdp->clk_pix);
 	}
 
-	mode = &crtc->mode;
+	mode = &crtc->legacy.mode;
 	dst_x = newstate->crtc_x;
 	dst_y = newstate->crtc_y;
 	dst_w = clamp_val(newstate->crtc_w, 0, mode->hdisplay - dst_x);
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 5793cf2cb897..f24d83136692 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1150,7 +1150,7 @@ static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
 		return;
 	}
 
-	mode = &crtc->mode;
+	mode = &crtc->legacy.mode;
 	dst_x = newstate->crtc_x;
 	dst_y = newstate->crtc_y;
 	dst_w = clamp_val(newstate->crtc_w, 0, mode->hdisplay - dst_x);
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index e714c232026c..f8ff059f61fc 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -633,7 +633,7 @@ static void sti_dvo_encoder_enable(struct drm_encoder *encoder)
 {
 	struct sti_tvout *tvout = to_sti_tvout(encoder);
 
-	tvout_preformatter_set_matrix(tvout, &encoder->crtc->mode);
+	tvout_preformatter_set_matrix(tvout, &encoder->crtc->legacy.mode);
 
 	tvout_dvo_start(tvout, sti_crtc_is_main(encoder->crtc));
 }
@@ -683,7 +683,7 @@ static void sti_hda_encoder_enable(struct drm_encoder *encoder)
 {
 	struct sti_tvout *tvout = to_sti_tvout(encoder);
 
-	tvout_preformatter_set_matrix(tvout, &encoder->crtc->mode);
+	tvout_preformatter_set_matrix(tvout, &encoder->crtc->legacy.mode);
 
 	tvout_hda_start(tvout, sti_crtc_is_main(encoder->crtc));
 }
@@ -734,7 +734,7 @@ static void sti_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
 	struct sti_tvout *tvout = to_sti_tvout(encoder);
 
-	tvout_preformatter_set_matrix(tvout, &encoder->crtc->mode);
+	tvout_preformatter_set_matrix(tvout, &encoder->crtc->legacy.mode);
 
 	tvout_hdmi_start(tvout, sti_crtc_is_main(encoder->crtc));
 }
diff --git a/drivers/gpu/drm/sti/sti_vid.c b/drivers/gpu/drm/sti/sti_vid.c
index 2d818397918d..5d3bb49f93f9 100644
--- a/drivers/gpu/drm/sti/sti_vid.c
+++ b/drivers/gpu/drm/sti/sti_vid.c
@@ -140,7 +140,7 @@ void sti_vid_commit(struct sti_vid *vid,
 		    struct drm_plane_state *state)
 {
 	struct drm_crtc *crtc = state->crtc;
-	struct drm_display_mode *mode = &crtc->mode;
+	struct drm_display_mode *mode = &crtc->legacy.mode;
 	int dst_x = state->crtc_x;
 	int dst_y = state->crtc_y;
 	int dst_w = clamp_val(state->crtc_w, 0, mode->hdisplay - dst_x);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b5f60b2b2d0e..3b7e7eec3239 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -71,10 +71,10 @@ static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
 	start = gem->dma_addr + fb->offsets[0] +
-		crtc->y * fb->pitches[0] +
-		crtc->x * fb->format->cpp[0];
+		crtc->legacy.y * fb->pitches[0] +
+		crtc->legacy.x * fb->format->cpp[0];
 
-	end = start + (crtc->mode.vdisplay * fb->pitches[0]);
+	end = start + (crtc->legacy.mode.vdisplay * fb->pitches[0]);
 
 	/* Write LCDC_DMA_FB_BASE_ADDR_0_REG and LCDC_DMA_FB_CEILING_ADDR_0_REG
 	 * with a single insruction, if available. This should make it more
@@ -211,7 +211,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 	clkdiv = 2; /* first try using a standard divider of 2 */
 
 	/* mode.clock is in KHz, set_rate wants parameter in Hz */
-	pclk_rate = crtc->mode.clock * 1000;
+	pclk_rate = crtc->legacy.mode.clock * 1000;
 
 	ret = clk_set_rate(priv->clk, pclk_rate * clkdiv);
 	clk_rate = clk_get_rate(priv->clk);
@@ -252,7 +252,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 	tilcdc_crtc->lcd_fck_rate = clk_rate;
 
 	DBG("lcd_clk=%u, mode clock=%d, div=%u",
-	    tilcdc_crtc->lcd_fck_rate, crtc->mode.clock, clkdiv);
+	    tilcdc_crtc->lcd_fck_rate, crtc->legacy.mode.clock, clkdiv);
 
 	/* Configure the LCD clock divisor. */
 	tilcdc_write(dev, LCDC_CTRL_REG, LCDC_CLK_DIVISOR(clkdiv) |
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 81abedec435d..d9befd81de4a 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -343,7 +343,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
-	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock = arcpgu->pipe.crtc.legacy.mode.crtc_clock * 1000;
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 9ff3bade9795..9ce2a8ffcff2 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -56,7 +56,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
 	 * screen is programmed this way, so try to fake it.
 	 */
 	if (vbox_crtc->crtc_id == 0 && fb &&
-	    vbox_crtc->fb_offset / pitch < 0xffff - crtc->y &&
+	    vbox_crtc->fb_offset / pitch < 0xffff - crtc->legacy.y &&
 	    vbox_crtc->fb_offset % (bpp / 8) == 0) {
 		vbox_write_ioport(VBE_DISPI_INDEX_XRES, width);
 		vbox_write_ioport(VBE_DISPI_INDEX_YRES, height);
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index a382dc4654bd..0103f17e22cc 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -134,7 +134,7 @@ static void vc4_dpi_encoder_disable(struct drm_encoder *encoder)
 static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
-	struct drm_display_mode *mode = &encoder->crtc->mode;
+	struct drm_display_mode *mode = &encoder->crtc->legacy.mode;
 	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector = NULL, *connector_scan;
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index ba6e86d62a77..907dea3e71df 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1342,8 +1342,8 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 
 	/* crtc_* are already clipped coordinates. */
 	covers_screen = vc4_state->crtc_x == 0 && vc4_state->crtc_y == 0 &&
-			vc4_state->crtc_w == state->crtc->mode.hdisplay &&
-			vc4_state->crtc_h == state->crtc->mode.vdisplay;
+			vc4_state->crtc_w == state->crtc->legacy.mode.hdisplay &&
+			vc4_state->crtc_h == state->crtc->legacy.mode.vdisplay;
 	/* Background fill might be necessary when the plane has per-pixel
 	 * alpha content or a non-opaque plane alpha and could blend from the
 	 * background or does not cover the entire screen.
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 64baf2f22d9f..9cf099a600f7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -90,8 +90,8 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
 
 	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0,
-				   crtc->mode.hdisplay,
-				   crtc->mode.vdisplay, 0, 0);
+				   crtc->legacy.mode.hdisplay,
+				   crtc->legacy.mode.vdisplay, 0, 0);
 	virtio_gpu_notify(vgdev);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 57a5769fc994..a7f8b1da6e85 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -187,7 +187,7 @@ static void blend(struct vkms_writeback_job *wb,
 
 	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
-	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
+	size_t crtc_y_limit = crtc_state->base.crtc->legacy.mode.vdisplay;
 
 	/*
 	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
@@ -270,7 +270,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
 		return -EINVAL;
 
-	line_width = crtc_state->base.crtc->mode.hdisplay;
+	line_width = crtc_state->base.crtc->legacy.mode.hdisplay;
 	stage_buffer.n_pixels = line_width;
 	output_buffer.n_pixels = line_width;
 
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index a40295c18b48..780681ea77e4 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 
-	drm_calc_timestamping_constants(crtc, &crtc->mode);
+	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
 
 	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	out->vblank_hrtimer.function = &vkms_vblank_simulate;
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index bc724cbd5e3a..27164cddb94d 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -131,8 +131,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *conn_state = wb_conn->base.state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
-	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
-	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
+	u16 crtc_height = crtc_state->base.crtc->legacy.mode.vdisplay;
+	u16 crtc_width = crtc_state->base.crtc->legacy.mode.hdisplay;
 	struct vkms_writeback_job *active_wb;
 	struct vkms_frame_info *wb_frame_info;
 	u32 wb_format = fb->format->format;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 288ed0bb75cb..cf7af685b120 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2352,10 +2352,10 @@ int vmw_kms_helper_dirty(struct vmw_private *dev_priv,
 
 	for (k = 0; k < num_units; k++) {
 		struct vmw_display_unit *unit = units[k];
-		s32 crtc_x = unit->crtc.x;
-		s32 crtc_y = unit->crtc.y;
-		s32 crtc_width = unit->crtc.mode.hdisplay;
-		s32 crtc_height = unit->crtc.mode.vdisplay;
+		s32 crtc_x = unit->crtc.legacy.x;
+		s32 crtc_y = unit->crtc.legacy.y;
+		s32 crtc_width = unit->crtc.legacy.mode.hdisplay;
+		s32 crtc_height = unit->crtc.legacy.mode.vdisplay;
 		const struct drm_clip_rect *clips_ptr = clips;
 		const struct drm_vmw_rect *vclips_ptr = vclips;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 39949e0a493f..91a635d96a39 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -92,8 +92,10 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
 		int w = 0, h = 0;
 		list_for_each_entry(entry, &lds->active, active) {
 			crtc = &entry->base.crtc;
-			w = max(w, crtc->x + crtc->mode.hdisplay);
-			h = max(h, crtc->y + crtc->mode.vdisplay);
+			w = max(w,
+				crtc->legacy.x + crtc->legacy.mode.hdisplay);
+			h = max(h,
+				crtc->legacy.y + crtc->legacy.mode.vdisplay);
 		}
 
 		if (crtc == NULL)
@@ -123,10 +125,14 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
 
 		vmw_write(dev_priv, SVGA_REG_DISPLAY_ID, i);
 		vmw_write(dev_priv, SVGA_REG_DISPLAY_IS_PRIMARY, !i);
-		vmw_write(dev_priv, SVGA_REG_DISPLAY_POSITION_X, crtc->x);
-		vmw_write(dev_priv, SVGA_REG_DISPLAY_POSITION_Y, crtc->y);
-		vmw_write(dev_priv, SVGA_REG_DISPLAY_WIDTH, crtc->mode.hdisplay);
-		vmw_write(dev_priv, SVGA_REG_DISPLAY_HEIGHT, crtc->mode.vdisplay);
+		vmw_write(dev_priv, SVGA_REG_DISPLAY_POSITION_X,
+			  crtc->legacy.x);
+		vmw_write(dev_priv, SVGA_REG_DISPLAY_POSITION_Y,
+			  crtc->legacy.y);
+		vmw_write(dev_priv, SVGA_REG_DISPLAY_WIDTH,
+			  crtc->legacy.mode.hdisplay);
+		vmw_write(dev_priv, SVGA_REG_DISPLAY_HEIGHT,
+			  crtc->legacy.mode.vdisplay);
 
 		i++;
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 0f4bfd98480a..5f380e288136 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -249,10 +249,11 @@ static void vmw_sou_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		x = vmw_conn_state->gui_x;
 		y = vmw_conn_state->gui_y;
 
-		ret = vmw_sou_fifo_create(dev_priv, sou, x, y, &crtc->mode);
+		ret = vmw_sou_fifo_create(dev_priv, sou, x, y,
+					  &crtc->legacy.mode);
 		if (ret)
 			DRM_ERROR("Failed to define Screen Object %dx%d\n",
-				  crtc->x, crtc->y);
+				  crtc->legacy.x, crtc->legacy.y);
 
 	} else {
 		sou->buffer = NULL;
@@ -993,8 +994,8 @@ static void vmw_sou_surface_fifo_commit(struct vmw_kms_dirty *dirty)
 	struct vmw_kms_sou_surface_dirty *sdirty =
 		container_of(dirty, typeof(*sdirty), base);
 	struct vmw_kms_sou_dirty_cmd *cmd = dirty->cmd;
-	s32 trans_x = dirty->unit->crtc.x - sdirty->dst_x;
-	s32 trans_y = dirty->unit->crtc.y - sdirty->dst_y;
+	s32 trans_x = dirty->unit->crtc.legacy.x - sdirty->dst_x;
+	s32 trans_y = dirty->unit->crtc.legacy.y - sdirty->dst_y;
 	size_t region_size = dirty->num_hits * sizeof(SVGASignedRect);
 	SVGASignedRect *blit = (SVGASignedRect *) &cmd[1];
 	int i;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index fab155a68054..6a4294fcf852 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -406,11 +406,11 @@ static void vmw_stdu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	y = vmw_conn_state->gui_y;
 
 	vmw_svga_enable(dev_priv);
-	ret = vmw_stdu_define_st(dev_priv, stdu, &crtc->mode, x, y);
+	ret = vmw_stdu_define_st(dev_priv, stdu, &crtc->legacy.mode, x, y);
 
 	if (ret)
 		DRM_ERROR("Failed to define Screen Target of size %dx%d\n",
-			  crtc->x, crtc->y);
+			  crtc->legacy.x, crtc->legacy.y);
 }
 
 static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
index 8651b788e98b..964474ef5dca 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -288,7 +288,7 @@ vmw_vkms_enable_vblank(struct drm_crtc *crtc)
 	if (!vmw->vkms_enabled)
 		return -EINVAL;
 
-	drm_calc_timestamping_constants(crtc, &crtc->mode);
+	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
 
 	hrtimer_init(&du->vkms.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	du->vkms.timer.function = &vmw_vkms_vblank_simulate;
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index dfa78a49a6d9..be3e6a52de0f 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -116,7 +116,7 @@ static void display_enable(struct drm_simple_display_pipe *pipe,
 	if (!drm_dev_enter(pipe->crtc.dev, &idx))
 		return;
 
-	ret = xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
+	ret = xen_drm_front_mode_set(pipeline, crtc->legacy.x, crtc->legacy.y,
 				     fb->width, fb->height,
 				     fb->format->cpp[0] * 8,
 				     xen_drm_front_fb_to_cookie(fb));
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8b48a1974da3..d82d2035124a 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1002,25 +1002,45 @@ struct drm_crtc {
 	 */
 	int cursor_y;
 
-	/**
-	 * @enabled:
-	 *
-	 * Is this CRTC enabled? Should only be used by legacy drivers, atomic
-	 * drivers should instead consult &drm_crtc_state.enable and
-	 * &drm_crtc_state.active. Atomic drivers can update this by calling
-	 * drm_atomic_helper_update_legacy_modeset_state().
-	 */
-	bool enabled;
-
-	/**
-	 * @mode:
-	 *
-	 * Current mode timings. Should only be used by legacy drivers, atomic
-	 * drivers should instead consult &drm_crtc_state.mode. Atomic drivers
-	 * can update this by calling
-	 * drm_atomic_helper_update_legacy_modeset_state().
-	 */
-	struct drm_display_mode mode;
+	struct {
+		/**
+		 * @enabled:
+		 *
+		 * Is this CRTC enabled? Should only be used by legacy drivers, atomic
+		 * drivers should instead consult &drm_crtc_state.enable and
+		 * &drm_crtc_state.active. Atomic drivers can update this by calling
+		 * drm_atomic_helper_update_legacy_modeset_state().
+		 */
+		bool enabled;
+
+		/**
+		 * @mode:
+		 *
+		 * Current mode timings. Should only be used by legacy drivers, atomic
+		 * drivers should instead consult &drm_crtc_state.mode. Atomic drivers
+		 * can update this by calling
+		 * drm_atomic_helper_update_legacy_modeset_state().
+		 */
+		struct drm_display_mode mode;
+
+		/**
+		 * @x:
+		 * x position on screen. Should only be used by legacy drivers, atomic
+		 * drivers should look at &drm_plane_state.crtc_x of the primary plane
+		 * instead. Updated by calling
+		 * drm_atomic_helper_update_legacy_modeset_state().
+		 */
+		int x;
+
+		/**
+		 * @y:
+		 * y position on screen. Should only be used by legacy drivers, atomic
+		 * drivers should look at &drm_plane_state.crtc_y of the primary plane
+		 * instead. Updated by calling
+		 * drm_atomic_helper_update_legacy_modeset_state().
+		 */
+		int y;
+	} legacy;
 
 	/**
 	 * @hwmode:
@@ -1038,23 +1058,6 @@ struct drm_crtc {
 	 */
 	struct drm_display_mode hwmode;
 
-	/**
-	 * @x:
-	 * x position on screen. Should only be used by legacy drivers, atomic
-	 * drivers should look at &drm_plane_state.crtc_x of the primary plane
-	 * instead. Updated by calling
-	 * drm_atomic_helper_update_legacy_modeset_state().
-	 */
-	int x;
-	/**
-	 * @y:
-	 * y position on screen. Should only be used by legacy drivers, atomic
-	 * drivers should look at &drm_plane_state.crtc_y of the primary plane
-	 * instead. Updated by calling
-	 * drm_atomic_helper_update_legacy_modeset_state().
-	 */
-	int y;
-
 	/** @funcs: CRTC control functions */
 	const struct drm_crtc_funcs *funcs;
 
-- 
2.45.2

