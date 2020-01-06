Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A11316C5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 18:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31496E4F8;
	Mon,  6 Jan 2020 17:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957856E4DE;
 Mon,  6 Jan 2020 17:28:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 09:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; 
 d="scan'208,217";a="225496157"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2020 09:28:40 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: rodrigo.vivi@intel.com, irlied@linux.ie, daniel@ffwll.ch,
 sudeep.dutt@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [RFC 7/7] drm/i915: Make WARN* device specific for
 various cases.
Date: Mon,  6 Jan 2020 22:53:26 +0530
Message-Id: <20200106172326.32592-8-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific dev_WARN*
variants in functions where any one of intel_pm, intel_encoder,
i915_perf_stream or intel_crtc_state struct pointer is available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually

@@
identifier func, T;
@@
func(struct intel_vgpu *T,...) {
<...
(
-WARN(
+dev_WARN(vgpu_to_dev(T),
...)
|
-WARN_ON(
+dev_WARN_ON(vgpu_to_dev(T),
...)
|
-WARN_ONCE(
+dev_WARN_ONCE(vgpu_to_dev(T),
...)
|
-WARN_ON_ONCE(
+dev_WARN_ON_ONCE(vgpu_to_dev(T),
...)
)
...>

}

@@
identifier func, T;
@@
func(struct intel_encoder *T,...) {
<...
(
-WARN(
+dev_WARN(enc_to_dev(T),
...)
|
-WARN_ON(
+dev_WARN_ON(enc_to_dev(T),
...)
|
-WARN_ONCE(
+dev_WARN_ONCE(enc_to_dev(T),
...)
|
-WARN_ON_ONCE(
+dev_WARN_ON_ONCE(enc_to_dev(T),
...)
)
...>

}

@@
identifier func, T;
@@
func(struct i915_perf_stream *T,...) {
<...
(
-WARN(
+dev_WARN(perf_stream_to_dev(T),
...)
|
-WARN_ON(
+dev_WARN_ON(perf_stream_to_dev(T),
...)
|
-WARN_ONCE(
+dev_WARN_ONCE(perf_stream_to_dev(T),
...)
|
-WARN_ON_ONCE(
+dev_WARN_ON_ONCE(perf_stream_to_dev(T),
...)
)
...>

}

@@
identifier func, T;
@@
func(struct intel_crtc_state *T,...) {
<...
(
-WARN(
+dev_WARN(crtc_state_to_dev(T),
...)
|
-WARN_ON(
+dev_WARN_ON(crtc_state_to_dev(T),
...)
|
-WARN_ONCE(
+dev_WARN_ONCE(crtc_state_to_dev(T),
...)
|
-WARN_ON_ONCE(
+dev_WARN_ON_ONCE(crtc_state_to_dev(T),
...)
)
...>

}

command: spatch --sp-file <script>  --dir drivers/gpu/drm/i915 \
				--linux-spacing --in-place

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  6 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 15 ++--
 drivers/gpu/drm/i915/display/intel_dp.c       |  5 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 20 +++---
 drivers/gpu/drm/i915/display/intel_panel.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  3 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c          | 20 +++---
 drivers/gpu/drm/i915/gvt/display.c            |  2 +-
 drivers/gpu/drm/i915/gvt/edid.c               | 11 +--
 drivers/gpu/drm/i915/gvt/gtt.c                | 15 ++--
 drivers/gpu/drm/i915/gvt/handlers.c           | 16 +++--
 drivers/gpu/drm/i915/gvt/interrupt.c          | 11 +--
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  8 ++-
 drivers/gpu/drm/i915/gvt/mmio.c               | 31 ++++----
 drivers/gpu/drm/i915/gvt/mmio_context.c       |  4 +-
 drivers/gpu/drm/i915/gvt/scheduler.c          |  5 +-
 drivers/gpu/drm/i915/gvt/vgpu.c               |  5 +-
 drivers/gpu/drm/i915/i915_perf.c              | 37 +++++-----
 drivers/gpu/drm/i915/intel_pm.c               | 71 +++++++++++--------
 20 files changed, 169 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 8f635637d61e..3b3e213303c5 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -1660,7 +1660,8 @@ static void skl_ddi_clock_get(struct intel_encoder *encoder,
 			link_clock = 270000;
 			break;
 		default:
-			WARN(1, "Unsupported link rate\n");
+			dev_WARN(enc_to_dev(encoder), 1,
+				 "Unsupported link rate\n");
 			break;
 		}
 		link_clock *= 2;
@@ -4734,7 +4735,8 @@ intel_ddi_hotplug(struct intel_encoder *encoder,
 
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
-	WARN(ret, "Acquiring modeset locks failed with %i\n", ret);
+	dev_WARN(enc_to_dev(encoder), ret,
+		 "Acquiring modeset locks failed with %i\n", ret);
 
 	/*
 	 * Unpowered type-c dongles can take some time to boot and be
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ab1fac1abf37..c71948aa4bd0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7730,7 +7730,8 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *pipe_config)
 		if (pipe_h < pfit_h)
 			pipe_h = pfit_h;
 
-		if (WARN_ON(!pfit_w || !pfit_h))
+		if (dev_WARN_ON(crtc_state_to_dev(pipe_config),
+				!pfit_w || !pfit_h))
 			return pixel_rate;
 
 		pixel_rate = div_u64(mul_u32_u32(pixel_rate, pipe_w * pipe_h),
@@ -11178,8 +11179,9 @@ static int i845_check_cursor(struct intel_crtc_state *crtc_state,
 		return -EINVAL;
 	}
 
-	WARN_ON(plane_state->uapi.visible &&
-		plane_state->color_plane[0].stride != fb->pitches[0]);
+	dev_WARN_ON(crtc_state_to_dev(crtc_state),
+		    plane_state->uapi.visible &&
+		    plane_state->color_plane[0].stride != fb->pitches[0]);
 
 	switch (fb->pitches[0]) {
 	case 256:
@@ -12888,7 +12890,9 @@ static void intel_crtc_copy_hw_to_uapi_state(struct intel_crtc_state *crtc_state
 {
 	crtc_state->uapi.enable = crtc_state->hw.enable;
 	crtc_state->uapi.active = crtc_state->hw.active;
-	WARN_ON(drm_atomic_set_mode_for_crtc(&crtc_state->uapi, &crtc_state->hw.mode) < 0);
+	dev_WARN_ON(crtc_state_to_dev(crtc_state),
+		    drm_atomic_set_mode_for_crtc(&crtc_state->uapi,
+						 &crtc_state->hw.mode) < 0);
 
 	crtc_state->uapi.adjusted_mode = crtc_state->hw.adjusted_mode;
 
@@ -13068,7 +13072,8 @@ intel_modeset_pipe_config(struct intel_crtc_state *pipe_config)
 	}
 
 	if (ret == RETRY) {
-		if (WARN(!retry, "loop in pipe configuration computation\n"))
+		if (dev_WARN(crtc_state_to_dev(pipe_config), !retry,
+			     "loop in pipe configuration computation\n"))
 			return -EINVAL;
 
 		DRM_DEBUG_KMS("CRTC bw constrained, retrying\n");
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c637929aa311..38882bc77ffa 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2226,7 +2226,7 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 						    intel_dp->max_link_rate);
 
 	/* No common link rates between source and sink */
-	WARN_ON(common_len <= 0);
+	dev_WARN_ON(enc_to_dev(encoder), common_len <= 0);
 
 	limits.min_clock = 0;
 	limits.max_clock = common_len - 1;
@@ -5220,7 +5220,8 @@ intel_dp_hotplug(struct intel_encoder *encoder,
 
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
-	WARN(ret, "Acquiring modeset locks failed with %i\n", ret);
+	dev_WARN(enc_to_dev(encoder), ret,
+		 "Acquiring modeset locks failed with %i\n", ret);
 
 	/*
 	 * Keeping it consistent with intel_ddi_hotplug() and
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 7141d5ae0ee3..8db2b31e042c 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -1777,7 +1777,7 @@ bxt_ddi_hdmi_pll_dividers(struct intel_crtc_state *crtc_state,
 
 	clk_div->p1 = best_clock.p1;
 	clk_div->p2 = best_clock.p2;
-	WARN_ON(best_clock.m1 != 2);
+	dev_WARN_ON(crtc_state_to_dev(crtc_state), best_clock.m1 != 2);
 	clk_div->n = best_clock.n;
 	clk_div->m2_int = best_clock.m2 >> 22;
 	clk_div->m2_frac = best_clock.m2 & ((1 << 22) - 1);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 7dbd30c65d62..8fb3ea5d3fe4 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -665,12 +665,12 @@ static void intel_write_infoframe(struct intel_encoder *encoder,
 	     intel_hdmi_infoframe_enable(type)) == 0)
 		return;
 
-	if (WARN_ON(frame->any.type != type))
+	if (dev_WARN_ON(enc_to_dev(encoder), frame->any.type != type))
 		return;
 
 	/* see comment above for the reason for this offset */
 	len = hdmi_infoframe_pack_only(frame, buffer + 1, sizeof(buffer) - 1);
-	if (WARN_ON(len < 0))
+	if (dev_WARN_ON(enc_to_dev(encoder), len < 0))
 		return;
 
 	/* Insert the 'hole' (see big comment above) at position 3 */
@@ -744,8 +744,8 @@ intel_hdmi_compute_avi_infoframe(struct intel_encoder *encoder,
 	drm_hdmi_avi_infoframe_colorspace(frame, conn_state);
 
 	/* nonsense combination */
-	WARN_ON(crtc_state->limited_color_range &&
-		crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
+	dev_WARN_ON(enc_to_dev(encoder), crtc_state->limited_color_range &&
+		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
 
 	if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_RGB) {
 		drm_hdmi_avi_infoframe_quant_range(frame, connector,
@@ -763,7 +763,7 @@ intel_hdmi_compute_avi_infoframe(struct intel_encoder *encoder,
 	/* TODO: handle pixel repetition for YCBCR420 outputs */
 
 	ret = hdmi_avi_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (dev_WARN_ON(enc_to_dev(encoder), ret))
 		return false;
 
 	return true;
@@ -784,13 +784,13 @@ intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
 		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_SPD);
 
 	ret = hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx");
-	if (WARN_ON(ret))
+	if (dev_WARN_ON(enc_to_dev(encoder), ret))
 		return false;
 
 	frame->sdi = HDMI_SPD_SDI_PC;
 
 	ret = hdmi_spd_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (dev_WARN_ON(enc_to_dev(encoder), ret))
 		return false;
 
 	return true;
@@ -816,11 +816,11 @@ intel_hdmi_compute_hdmi_infoframe(struct intel_encoder *encoder,
 	ret = drm_hdmi_vendor_infoframe_from_display_mode(frame,
 							  conn_state->connector,
 							  &crtc_state->hw.adjusted_mode);
-	if (WARN_ON(ret))
+	if (dev_WARN_ON(enc_to_dev(encoder), ret))
 		return false;
 
 	ret = hdmi_vendor_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (dev_WARN_ON(enc_to_dev(encoder), ret))
 		return false;
 
 	return true;
@@ -1876,7 +1876,7 @@ static void intel_enable_hdmi_audio(struct intel_encoder *encoder,
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 
-	WARN_ON(!pipe_config->has_hdmi_sink);
+	dev_WARN_ON(enc_to_dev(encoder), !pipe_config->has_hdmi_sink);
 	DRM_DEBUG_DRIVER("Enabling HDMI audio on pipe %c\n",
 			 pipe_name(crtc->pipe));
 	intel_audio_codec_enable(encoder, pipe_config, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index c108e4934fbf..8558ed990937 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -1172,7 +1172,7 @@ static void __intel_panel_enable_backlight(const struct intel_crtc_state *crtc_s
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
 
-	WARN_ON(panel->backlight.max == 0);
+	dev_WARN_ON(crtc_state_to_dev(crtc_state), panel->backlight.max == 0);
 
 	if (panel->backlight.level <= panel->backlight.min) {
 		panel->backlight.level = panel->backlight.max;
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 2ceb0c72db33..5330e51f5bbb 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1261,7 +1261,8 @@ static void i9xx_adjust_sdvo_tv_clock(struct intel_crtc_state *pipe_config)
 		clock->m1 = 12;
 		clock->m2 = 8;
 	} else {
-		WARN(1, "SDVO TV clock out of range: %i\n", dotclock);
+		dev_WARN(crtc_state_to_dev(pipe_config), 1,
+			 "SDVO TV clock out of range: %i\n", dotclock);
 	}
 
 	pipe_config->clock_set = true;
diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index 19cf1bbe059d..20775c9ee33a 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -106,10 +106,11 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu *vgpu, unsigned int off,
 int intel_vgpu_emulate_cfg_read(struct intel_vgpu *vgpu, unsigned int offset,
 	void *p_data, unsigned int bytes)
 {
-	if (WARN_ON(bytes > 4))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), bytes > 4))
 		return -EINVAL;
 
-	if (WARN_ON(offset + bytes > vgpu->gvt->device_info.cfg_space_size))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu),
+			offset + bytes > vgpu->gvt->device_info.cfg_space_size))
 		return -EINVAL;
 
 	memcpy(p_data, vgpu_cfg_space(vgpu) + offset, bytes);
@@ -299,32 +300,33 @@ int intel_vgpu_emulate_cfg_write(struct intel_vgpu *vgpu, unsigned int offset,
 {
 	int ret;
 
-	if (WARN_ON(bytes > 4))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), bytes > 4))
 		return -EINVAL;
 
-	if (WARN_ON(offset + bytes > vgpu->gvt->device_info.cfg_space_size))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu),
+			offset + bytes > vgpu->gvt->device_info.cfg_space_size))
 		return -EINVAL;
 
 	/* First check if it's PCI_COMMAND */
 	if (IS_ALIGNED(offset, 2) && offset == PCI_COMMAND) {
-		if (WARN_ON(bytes > 2))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu), bytes > 2))
 			return -EINVAL;
 		return emulate_pci_command_write(vgpu, offset, p_data, bytes);
 	}
 
 	switch (rounddown(offset, 4)) {
 	case PCI_ROM_ADDRESS:
-		if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu), !IS_ALIGNED(offset, 4)))
 			return -EINVAL;
 		return emulate_pci_rom_bar_write(vgpu, offset, p_data, bytes);
 
 	case PCI_BASE_ADDRESS_0 ... PCI_BASE_ADDRESS_5:
-		if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu), !IS_ALIGNED(offset, 4)))
 			return -EINVAL;
 		return emulate_pci_bar_write(vgpu, offset, p_data, bytes);
 
 	case INTEL_GVT_PCI_SWSCI:
-		if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu), !IS_ALIGNED(offset, 4)))
 			return -EINVAL;
 		ret = intel_vgpu_emulate_opregion_request(vgpu, *(u32 *)p_data);
 		if (ret)
@@ -332,7 +334,7 @@ int intel_vgpu_emulate_cfg_write(struct intel_vgpu *vgpu, unsigned int offset,
 		break;
 
 	case INTEL_GVT_PCI_OPREGION:
-		if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu), !IS_ALIGNED(offset, 4)))
 			return -EINVAL;
 		ret = intel_vgpu_opregion_base_write_handler(vgpu,
 						   *(u32 *)p_data);
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 66516d6f8811..0bb7058a4bfb 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -322,7 +322,7 @@ static int setup_virtual_dp_monitor(struct intel_vgpu *vgpu, int port_num,
 {
 	struct intel_vgpu_port *port = intel_vgpu_port(vgpu, port_num);
 
-	if (WARN_ON(resolution >= GVT_EDID_NUM))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), resolution >= GVT_EDID_NUM))
 		return -EINVAL;
 
 	port->edid = kzalloc(sizeof(*(port->edid)), GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index e8541b50ab21..cf601fee73dc 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -277,7 +277,7 @@ static int gmbus1_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 static int gmbus3_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	void *p_data, unsigned int bytes)
 {
-	WARN_ON(1);
+	dev_WARN_ON(vgpu_to_dev(vgpu), 1);
 	return 0;
 }
 
@@ -372,7 +372,7 @@ static int gmbus2_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 int intel_gvt_i2c_handle_gmbus_read(struct intel_vgpu *vgpu,
 	unsigned int offset, void *p_data, unsigned int bytes)
 {
-	if (WARN_ON(bytes > 8 && (offset & (bytes - 1))))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), bytes > 8 && (offset & (bytes - 1))))
 		return -EINVAL;
 
 	if (offset == i915_mmio_reg_offset(PCH_GMBUS2))
@@ -400,7 +400,7 @@ int intel_gvt_i2c_handle_gmbus_read(struct intel_vgpu *vgpu,
 int intel_gvt_i2c_handle_gmbus_write(struct intel_vgpu *vgpu,
 		unsigned int offset, void *p_data, unsigned int bytes)
 {
-	if (WARN_ON(bytes > 8 && (offset & (bytes - 1))))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), bytes > 8 && (offset & (bytes - 1))))
 		return -EINVAL;
 
 	if (offset == i915_mmio_reg_offset(PCH_GMBUS0))
@@ -533,9 +533,10 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
 		 * support the gfx driver to do EDID access.
 		 */
 	} else {
-		if (WARN_ON((op & 0x1) != GVT_AUX_I2C_READ))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu),
+				(op & 0x1) != GVT_AUX_I2C_READ))
 			return;
-		if (WARN_ON(msg_length != 4))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu), msg_length != 4))
 			return;
 		if (i2c_edid->edid_available && i2c_edid->slave_selected) {
 			unsigned char val = edid_get_byte(vgpu);
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 34cb404ba4b7..c9ed76456c01 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -71,8 +71,8 @@ bool intel_gvt_ggtt_validate_range(struct intel_vgpu *vgpu, u64 addr, u32 size)
 /* translate a guest gmadr to host gmadr */
 int intel_gvt_ggtt_gmadr_g2h(struct intel_vgpu *vgpu, u64 g_addr, u64 *h_addr)
 {
-	if (WARN(!vgpu_gmadr_is_valid(vgpu, g_addr),
-		 "invalid guest gmadr %llx\n", g_addr))
+	if (dev_WARN(vgpu_to_dev(vgpu), !vgpu_gmadr_is_valid(vgpu, g_addr),
+		     "invalid guest gmadr %llx\n", g_addr))
 		return -EACCES;
 
 	if (vgpu_gmadr_is_aperture(vgpu, g_addr))
@@ -87,8 +87,8 @@ int intel_gvt_ggtt_gmadr_g2h(struct intel_vgpu *vgpu, u64 g_addr, u64 *h_addr)
 /* translate a host gmadr to guest gmadr */
 int intel_gvt_ggtt_gmadr_h2g(struct intel_vgpu *vgpu, u64 h_addr, u64 *g_addr)
 {
-	if (WARN(!gvt_gmadr_is_valid(vgpu->gvt, h_addr),
-		 "invalid host gmadr %llx\n", h_addr))
+	if (dev_WARN(vgpu_to_dev(vgpu), !gvt_gmadr_is_valid(vgpu->gvt, h_addr),
+		     "invalid host gmadr %llx\n", h_addr))
 		return -EACCES;
 
 	if (gvt_gmadr_is_aperture(vgpu->gvt, h_addr))
@@ -952,7 +952,9 @@ static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
 
 		if (!gtt_type_is_pt(cur_pt_type) ||
 				!gtt_type_is_pt(cur_pt_type + 1)) {
-			WARN(1, "Invalid page table type, cur_pt_type is: %d\n", cur_pt_type);
+			dev_WARN(vgpu_to_dev(vgpu), 1,
+				 "Invalid page table type, cur_pt_type is: %d\n",
+				 cur_pt_type);
 			return -EINVAL;
 		}
 
@@ -2352,7 +2354,8 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
 	struct device *dev = &vgpu->gvt->dev_priv->drm.pdev->dev;
 	dma_addr_t daddr;
 
-	if (WARN_ON(type < GTT_TYPE_PPGTT_PTE_PT || type >= GTT_TYPE_MAX))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu),
+			type < GTT_TYPE_PPGTT_PTE_PT || type >= GTT_TYPE_MAX))
 		return -EINVAL;
 
 	scratch_pt = (void *)get_zeroed_page(GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 73f668885bea..2fd23d25f506 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1312,8 +1312,9 @@ static int pf_write(struct intel_vgpu *vgpu,
 	if ((offset == _PS_1A_CTRL || offset == _PS_2A_CTRL ||
 	   offset == _PS_1B_CTRL || offset == _PS_2B_CTRL ||
 	   offset == _PS_1C_CTRL) && (val & PS_PLANE_SEL_MASK) != 0) {
-		WARN_ONCE(true, "VM(%d): guest is trying to scaling a plane\n",
-			  vgpu->id);
+		dev_WARN_ONCE(vgpu_to_dev(vgpu), true,
+			      "VM(%d): guest is trying to scaling a plane\n",
+			      vgpu->id);
 		return 0;
 	}
 
@@ -1367,7 +1368,8 @@ static int dma_ctrl_write(struct intel_vgpu *vgpu, unsigned int offset,
 	mode = vgpu_vreg(vgpu, offset);
 
 	if (GFX_MODE_BIT_SET_IN_MASK(mode, START_DMA)) {
-		WARN_ONCE(1, "VM(%d): iGVT-g doesn't support GuC\n",
+		dev_WARN_ONCE(vgpu_to_dev(vgpu), 1,
+				"VM(%d): iGVT-g doesn't support GuC\n",
 				vgpu->id);
 		return 0;
 	}
@@ -1381,7 +1383,8 @@ static int gen9_trtte_write(struct intel_vgpu *vgpu, unsigned int offset,
 	u32 trtte = *(u32 *)p_data;
 
 	if ((trtte & 1) && (trtte & (1 << 1)) == 0) {
-		WARN(1, "VM(%d): Use physical address for TRTT!\n",
+		dev_WARN(vgpu_to_dev(vgpu), 1,
+				"VM(%d): Use physical address for TRTT!\n",
 				vgpu->id);
 		return -EINVAL;
 	}
@@ -1688,7 +1691,8 @@ static int elsp_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	u32 data = *(u32 *)p_data;
 	int ret = 0;
 
-	if (WARN_ON(ring_id < 0 || ring_id >= I915_NUM_ENGINES))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu),
+			ring_id < 0 || ring_id >= I915_NUM_ENGINES))
 		return -EINVAL;
 
 	execlist = &vgpu->submission.execlist[ring_id];
@@ -3548,7 +3552,7 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, unsigned int offset,
 	gvt_mmio_func func;
 	int ret;
 
-	if (WARN_ON(bytes > 8))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), bytes > 8))
 		return -EINVAL;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index 11accd3e1023..965b5459e8b3 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -255,7 +255,7 @@ int intel_vgpu_reg_ier_handler(struct intel_vgpu *vgpu,
 	vgpu_vreg(vgpu, reg) = ier;
 
 	info = regbase_to_irq_info(gvt, ier_to_regbase(reg));
-	if (WARN_ON(!info))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), !info))
 		return -EINVAL;
 
 	if (info->has_upstream_irq)
@@ -289,7 +289,7 @@ int intel_vgpu_reg_iir_handler(struct intel_vgpu *vgpu, unsigned int reg,
 	trace_write_ir(vgpu->id, "IIR", reg, iir, vgpu_vreg(vgpu, reg),
 		       (vgpu_vreg(vgpu, reg) ^ iir));
 
-	if (WARN_ON(!info))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), !info))
 		return -EINVAL;
 
 	vgpu_vreg(vgpu, reg) &= ~iir;
@@ -340,7 +340,8 @@ static void update_upstream_irq(struct intel_vgpu *vgpu,
 		if (!up_irq_info)
 			up_irq_info = irq->info[map->up_irq_group];
 		else
-			WARN_ON(up_irq_info != irq->info[map->up_irq_group]);
+			dev_WARN_ON(vgpu_to_dev(vgpu),
+				up_irq_info != irq->info[map->up_irq_group]);
 
 		bit = map->up_irq_bit;
 
@@ -350,7 +351,7 @@ static void update_upstream_irq(struct intel_vgpu *vgpu,
 			clear_bits |= (1 << bit);
 	}
 
-	if (WARN_ON(!up_irq_info))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), !up_irq_info))
 		return;
 
 	if (up_irq_info->group == INTEL_GVT_IRQ_INFO_MASTER) {
@@ -624,7 +625,7 @@ void intel_vgpu_trigger_virtual_event(struct intel_vgpu *vgpu,
 	struct intel_gvt_irq_ops *ops = gvt->irq.ops;
 
 	handler = get_event_virt_handler(irq, event);
-	WARN_ON(!handler);
+	dev_WARN_ON(vgpu_to_dev(vgpu), !handler);
 
 	handler(irq, event, vgpu);
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 3259a1fa69e1..8e8ff6cce237 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -130,7 +130,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long cur_gfn = gfn + npage;
 
 		ret = vfio_unpin_pages(mdev_dev(vgpu->vdev.mdev), &cur_gfn, 1);
-		WARN_ON(ret != 1);
+		dev_WARN_ON(vgpu_to_dev(vgpu), ret != 1);
 	}
 }
 
@@ -821,11 +821,13 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 
 	ret = vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_IOMMU_NOTIFY,
 					&vgpu->vdev.iommu_notifier);
-	WARN(ret, "vfio_unregister_notifier for iommu failed: %d\n", ret);
+	dev_WARN(vgpu_to_dev(vgpu), ret,
+		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
 
 	ret = vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_GROUP_NOTIFY,
 					&vgpu->vdev.group_notifier);
-	WARN(ret, "vfio_unregister_notifier for group failed: %d\n", ret);
+	dev_WARN(vgpu_to_dev(vgpu), ret,
+		 "vfio_unregister_notifier for group failed: %d\n", ret);
 
 	/* dereference module reference taken at open */
 	module_put(THIS_MODULE);
diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/mmio.c
index a55178884d67..1b06f341102d 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.c
+++ b/drivers/gpu/drm/i915/gvt/mmio.c
@@ -114,15 +114,18 @@ int intel_vgpu_emulate_mmio_read(struct intel_vgpu *vgpu, u64 pa,
 
 	offset = intel_vgpu_gpa_to_mmio_offset(vgpu, pa);
 
-	if (WARN_ON(bytes > 8))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), bytes > 8))
 		goto err;
 
 	if (reg_is_gtt(gvt, offset)) {
-		if (WARN_ON(!IS_ALIGNED(offset, 4) && !IS_ALIGNED(offset, 8)))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu),
+				!IS_ALIGNED(offset, 4) &&
+				!IS_ALIGNED(offset, 8)))
 			goto err;
-		if (WARN_ON(bytes != 4 && bytes != 8))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu), bytes != 4 && bytes != 8))
 			goto err;
-		if (WARN_ON(!reg_is_gtt(gvt, offset + bytes - 1)))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu),
+				!reg_is_gtt(gvt, offset + bytes - 1)))
 			goto err;
 
 		ret = intel_vgpu_emulate_ggtt_mmio_read(vgpu, offset,
@@ -132,16 +135,17 @@ int intel_vgpu_emulate_mmio_read(struct intel_vgpu *vgpu, u64 pa,
 		goto out;
 	}
 
-	if (WARN_ON_ONCE(!reg_is_mmio(gvt, offset))) {
+	if (dev_WARN_ON_ONCE(vgpu_to_dev(vgpu), !reg_is_mmio(gvt, offset))) {
 		ret = intel_gvt_hypervisor_read_gpa(vgpu, pa, p_data, bytes);
 		goto out;
 	}
 
-	if (WARN_ON(!reg_is_mmio(gvt, offset + bytes - 1)))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu),
+			!reg_is_mmio(gvt, offset + bytes - 1)))
 		goto err;
 
 	if (!intel_gvt_mmio_is_unalign(gvt, offset)) {
-		if (WARN_ON(!IS_ALIGNED(offset, bytes)))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu), !IS_ALIGNED(offset, bytes)))
 			goto err;
 	}
 
@@ -187,15 +191,18 @@ int intel_vgpu_emulate_mmio_write(struct intel_vgpu *vgpu, u64 pa,
 
 	offset = intel_vgpu_gpa_to_mmio_offset(vgpu, pa);
 
-	if (WARN_ON(bytes > 8))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), bytes > 8))
 		goto err;
 
 	if (reg_is_gtt(gvt, offset)) {
-		if (WARN_ON(!IS_ALIGNED(offset, 4) && !IS_ALIGNED(offset, 8)))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu),
+				!IS_ALIGNED(offset, 4) &&
+				!IS_ALIGNED(offset, 8)))
 			goto err;
-		if (WARN_ON(bytes != 4 && bytes != 8))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu), bytes != 4 && bytes != 8))
 			goto err;
-		if (WARN_ON(!reg_is_gtt(gvt, offset + bytes - 1)))
+		if (dev_WARN_ON(vgpu_to_dev(vgpu),
+				!reg_is_gtt(gvt, offset + bytes - 1)))
 			goto err;
 
 		ret = intel_vgpu_emulate_ggtt_mmio_write(vgpu, offset,
@@ -205,7 +212,7 @@ int intel_vgpu_emulate_mmio_write(struct intel_vgpu *vgpu, u64 pa,
 		goto out;
 	}
 
-	if (WARN_ON_ONCE(!reg_is_mmio(gvt, offset))) {
+	if (dev_WARN_ON_ONCE(vgpu_to_dev(vgpu), !reg_is_mmio(gvt, offset))) {
 		ret = intel_gvt_hypervisor_write_gpa(vgpu, pa, p_data, bytes);
 		goto out;
 	}
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index 82dbcd091f5b..6132093fdcd9 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -407,7 +407,7 @@ static void switch_mocs(struct intel_vgpu *pre, struct intel_vgpu *next,
 	int i;
 
 	dev_priv = pre ? pre->gvt->dev_priv : next->gvt->dev_priv;
-	if (WARN_ON(ring_id >= ARRAY_SIZE(regs)))
+	if (dev_WARN_ON(vgpu_to_dev(pre), ring_id >= ARRAY_SIZE(regs)))
 		return;
 
 	if (ring_id == RCS0 && IS_GEN(dev_priv, 9))
@@ -554,7 +554,7 @@ void intel_gvt_switch_mmio(struct intel_vgpu *pre,
 {
 	struct drm_i915_private *dev_priv;
 
-	if (WARN_ON(!pre && !next))
+	if (dev_WARN_ON(vgpu_to_dev(pre), !pre && !next))
 		return;
 
 	gvt_dbg_render("switch ring %d from %s to %s\n", ring_id,
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index b3299f88e24e..2fcef0869bcd 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1316,10 +1316,11 @@ int intel_vgpu_select_submission_ops(struct intel_vgpu *vgpu,
 	};
 	int ret;
 
-	if (WARN_ON(interface >= ARRAY_SIZE(ops)))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu), interface >= ARRAY_SIZE(ops)))
 		return -EINVAL;
 
-	if (WARN_ON(interface == 0 && engine_mask != ALL_ENGINES))
+	if (dev_WARN_ON(vgpu_to_dev(vgpu),
+			interface == 0 && engine_mask != ALL_ENGINES))
 		return -EINVAL;
 
 	if (s->active)
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 85bd9bf4f6ee..a97a143e82b6 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -69,7 +69,8 @@ void populate_pvinfo_page(struct intel_vgpu *vgpu)
 		vgpu_hidden_gmadr_base(vgpu), vgpu_hidden_sz(vgpu));
 	gvt_dbg_core("fence size %d\n", vgpu_fence_sz(vgpu));
 
-	WARN_ON(sizeof(struct vgt_if) != VGT_PVINFO_SIZE);
+	dev_WARN_ON(vgpu_to_dev(vgpu),
+		    sizeof(struct vgt_if) != VGT_PVINFO_SIZE);
 }
 
 #define VGPU_MAX_WEIGHT 16
@@ -274,7 +275,7 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
 
 	mutex_lock(&vgpu->vgpu_lock);
 
-	WARN(vgpu->active, "vGPU is still active!\n");
+	dev_WARN(vgpu_to_dev(vgpu), vgpu->active, "vGPU is still active!\n");
 
 	intel_gvt_debugfs_remove_vgpu(vgpu);
 	intel_vgpu_clean_sched_policy(vgpu);
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 51006169a285..585bf47fc555 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -686,7 +686,7 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
 	u32 taken;
 	int ret = 0;
 
-	if (WARN_ON(!stream->enabled))
+	if (dev_WARN_ON(perf_stream_to_dev(stream), !stream->enabled))
 		return -EIO;
 
 	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
@@ -718,10 +718,11 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
 	 * only be incremented by multiples of the report size (notably also
 	 * all a power of two).
 	 */
-	if (WARN_ONCE(head > OA_BUFFER_SIZE || head % report_size ||
-		      tail > OA_BUFFER_SIZE || tail % report_size,
-		      "Inconsistent OA buffer pointers: head = %u, tail = %u\n",
-		      head, tail))
+	if (dev_WARN_ONCE(perf_stream_to_dev(stream),
+			  head > OA_BUFFER_SIZE || head % report_size ||
+			  tail > OA_BUFFER_SIZE || tail % report_size,
+			  "Inconsistent OA buffer pointers: head = %u, tail = %u\n",
+			  head, tail))
 		return -EIO;
 
 
@@ -742,7 +743,8 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
 		 * here would imply a driver bug that would result
 		 * in an overrun.
 		 */
-		if (WARN_ON((OA_BUFFER_SIZE - head) < report_size)) {
+		if (dev_WARN_ON(perf_stream_to_dev(stream),
+				(OA_BUFFER_SIZE - head) < report_size)) {
 			DRM_ERROR("Spurious OA head ptr: non-integral report offset\n");
 			break;
 		}
@@ -896,7 +898,7 @@ static int gen8_oa_read(struct i915_perf_stream *stream,
 	i915_reg_t oastatus_reg;
 	int ret;
 
-	if (WARN_ON(!stream->oa_buffer.vaddr))
+	if (dev_WARN_ON(perf_stream_to_dev(stream), !stream->oa_buffer.vaddr))
 		return -EIO;
 
 	oastatus_reg = IS_GEN(stream->perf->i915, 12) ?
@@ -986,7 +988,7 @@ static int gen7_append_oa_reports(struct i915_perf_stream *stream,
 	u32 taken;
 	int ret = 0;
 
-	if (WARN_ON(!stream->enabled))
+	if (dev_WARN_ON(perf_stream_to_dev(stream), !stream->enabled))
 		return -EIO;
 
 	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
@@ -1015,10 +1017,11 @@ static int gen7_append_oa_reports(struct i915_perf_stream *stream,
 	 * only be incremented by multiples of the report size (notably also
 	 * all a power of two).
 	 */
-	if (WARN_ONCE(head > OA_BUFFER_SIZE || head % report_size ||
-		      tail > OA_BUFFER_SIZE || tail % report_size,
-		      "Inconsistent OA buffer pointers: head = %u, tail = %u\n",
-		      head, tail))
+	if (dev_WARN_ONCE(perf_stream_to_dev(stream),
+			  head > OA_BUFFER_SIZE || head % report_size ||
+			  tail > OA_BUFFER_SIZE || tail % report_size,
+			  "Inconsistent OA buffer pointers: head = %u, tail = %u\n",
+			  head, tail))
 		return -EIO;
 
 
@@ -1036,7 +1039,8 @@ static int gen7_append_oa_reports(struct i915_perf_stream *stream,
 		 * here would imply a driver bug that would result
 		 * in an overrun.
 		 */
-		if (WARN_ON((OA_BUFFER_SIZE - head) < report_size)) {
+		if (dev_WARN_ON(perf_stream_to_dev(stream),
+				(OA_BUFFER_SIZE - head) < report_size)) {
 			DRM_ERROR("Spurious OA head ptr: non-integral report offset\n");
 			break;
 		}
@@ -1110,7 +1114,7 @@ static int gen7_oa_read(struct i915_perf_stream *stream,
 	u32 oastatus1;
 	int ret;
 
-	if (WARN_ON(!stream->oa_buffer.vaddr))
+	if (dev_WARN_ON(perf_stream_to_dev(stream), !stream->oa_buffer.vaddr))
 		return -EIO;
 
 	oastatus1 = intel_uncore_read(uncore, GEN7_OASTATUS1);
@@ -1579,7 +1583,7 @@ static int alloc_oa_buffer(struct i915_perf_stream *stream)
 	struct i915_vma *vma;
 	int ret;
 
-	if (WARN_ON(stream->oa_buffer.vma))
+	if (dev_WARN_ON(perf_stream_to_dev(stream), stream->oa_buffer.vma))
 		return -ENODEV;
 
 	BUILD_BUG_ON_NOT_POWER_OF_2(OA_BUFFER_SIZE);
@@ -2779,7 +2783,8 @@ static int i915_oa_stream_init(struct i915_perf_stream *stream,
 	stream->sample_size += format_size;
 
 	stream->oa_buffer.format_size = format_size;
-	if (WARN_ON(stream->oa_buffer.format_size == 0))
+	if (dev_WARN_ON(perf_stream_to_dev(stream),
+			stream->oa_buffer.format_size == 0))
 		return -EINVAL;
 
 	stream->hold_preemption = props->hold_preemption;
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 227c35d1c395..3c6089058557 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -1445,8 +1445,9 @@ static int g4x_compute_intermediate_wm(struct intel_crtc_state *new_crtc_state)
 			max(optimal->wm.plane[plane_id],
 			    active->wm.plane[plane_id]);
 
-		WARN_ON(intermediate->wm.plane[plane_id] >
-			g4x_plane_fifo_size(plane_id, G4X_WM_LEVEL_NORMAL));
+		dev_WARN_ON(crtc_state_to_dev(new_crtc_state),
+			    intermediate->wm.plane[plane_id] >
+			    g4x_plane_fifo_size(plane_id, G4X_WM_LEVEL_NORMAL));
 	}
 
 	intermediate->sr.plane = max(optimal->sr.plane,
@@ -1463,21 +1464,25 @@ static int g4x_compute_intermediate_wm(struct intel_crtc_state *new_crtc_state)
 	intermediate->hpll.fbc = max(optimal->hpll.fbc,
 				     active->hpll.fbc);
 
-	WARN_ON((intermediate->sr.plane >
-		 g4x_plane_fifo_size(PLANE_PRIMARY, G4X_WM_LEVEL_SR) ||
-		 intermediate->sr.cursor >
-		 g4x_plane_fifo_size(PLANE_CURSOR, G4X_WM_LEVEL_SR)) &&
-		intermediate->cxsr);
-	WARN_ON((intermediate->sr.plane >
-		 g4x_plane_fifo_size(PLANE_PRIMARY, G4X_WM_LEVEL_HPLL) ||
-		 intermediate->sr.cursor >
-		 g4x_plane_fifo_size(PLANE_CURSOR, G4X_WM_LEVEL_HPLL)) &&
-		intermediate->hpll_en);
-
-	WARN_ON(intermediate->sr.fbc > g4x_fbc_fifo_size(1) &&
-		intermediate->fbc_en && intermediate->cxsr);
-	WARN_ON(intermediate->hpll.fbc > g4x_fbc_fifo_size(2) &&
-		intermediate->fbc_en && intermediate->hpll_en);
+	dev_WARN_ON(crtc_state_to_dev(new_crtc_state),
+		    (intermediate->sr.plane >
+		     g4x_plane_fifo_size(PLANE_PRIMARY, G4X_WM_LEVEL_SR) ||
+		     intermediate->sr.cursor >
+		     g4x_plane_fifo_size(PLANE_CURSOR, G4X_WM_LEVEL_SR)) &&
+		    intermediate->cxsr);
+	dev_WARN_ON(crtc_state_to_dev(new_crtc_state),
+		    (intermediate->sr.plane >
+		     g4x_plane_fifo_size(PLANE_PRIMARY, G4X_WM_LEVEL_HPLL) ||
+		     intermediate->sr.cursor >
+		     g4x_plane_fifo_size(PLANE_CURSOR, G4X_WM_LEVEL_HPLL)) &&
+		    intermediate->hpll_en);
+
+	dev_WARN_ON(crtc_state_to_dev(new_crtc_state),
+		    intermediate->sr.fbc > g4x_fbc_fifo_size(1) &&
+		    intermediate->fbc_en && intermediate->cxsr);
+	dev_WARN_ON(crtc_state_to_dev(new_crtc_state),
+		    intermediate->hpll.fbc > g4x_fbc_fifo_size(2) &&
+		    intermediate->fbc_en && intermediate->hpll_en);
 
 out:
 	/*
@@ -1729,11 +1734,13 @@ static int vlv_compute_fifo(struct intel_crtc_state *crtc_state)
 		fifo_left -= plane_extra;
 	}
 
-	WARN_ON(active_planes != 0 && fifo_left != 0);
+	dev_WARN_ON(crtc_state_to_dev(crtc_state),
+		    active_planes != 0 && fifo_left != 0);
 
 	/* give it all to the first plane if none are active */
 	if (active_planes == 0) {
-		WARN_ON(fifo_left != fifo_size);
+		dev_WARN_ON(crtc_state_to_dev(crtc_state),
+			    fifo_left != fifo_size);
 		fifo_state->plane[PLANE_PRIMARY] = fifo_left;
 	}
 
@@ -2808,9 +2815,11 @@ hsw_compute_linetime_wm(const struct intel_crtc_state *crtc_state)
 
 	if (!crtc_state->hw.active)
 		return 0;
-	if (WARN_ON(adjusted_mode->crtc_clock == 0))
+	if (dev_WARN_ON(crtc_state_to_dev(crtc_state),
+			adjusted_mode->crtc_clock == 0))
 		return 0;
-	if (WARN_ON(intel_state->cdclk.logical.cdclk == 0))
+	if (dev_WARN_ON(crtc_state_to_dev(crtc_state),
+			intel_state->cdclk.logical.cdclk == 0))
 		return 0;
 
 	/* The WM are computed with base on how long it takes to fill a single
@@ -4107,7 +4116,8 @@ skl_plane_downscale_amount(const struct intel_crtc_state *crtc_state,
 	uint_fixed_16_16_t fp_w_ratio, fp_h_ratio;
 	uint_fixed_16_16_t downscale_h, downscale_w;
 
-	if (WARN_ON(!intel_wm_plane_visible(crtc_state, plane_state)))
+	if (dev_WARN_ON(crtc_state_to_dev(crtc_state),
+			!intel_wm_plane_visible(crtc_state, plane_state)))
 		return u32_to_fixed16(0);
 
 	/*
@@ -4186,7 +4196,7 @@ skl_get_total_relative_data_rate(struct intel_crtc_state *crtc_state,
 	const struct intel_plane_state *plane_state;
 	u64 total_data_rate = 0;
 
-	if (WARN_ON(!state))
+	if (dev_WARN_ON(crtc_state_to_dev(crtc_state), !state))
 		return 0;
 
 	/* Calculate and cache data rate for each plane */
@@ -4216,7 +4226,7 @@ icl_get_total_relative_data_rate(struct intel_crtc_state *crtc_state,
 	const struct intel_plane_state *plane_state;
 	u64 total_data_rate = 0;
 
-	if (WARN_ON(!crtc_state->uapi.state))
+	if (dev_WARN_ON(crtc_state_to_dev(crtc_state), !crtc_state->uapi.state))
 		return 0;
 
 	/* Calculate and cache data rate for each plane */
@@ -4533,7 +4543,7 @@ intel_get_linetime_us(const struct intel_crtc_state *crtc_state)
 
 	pixel_rate = crtc_state->pixel_rate;
 
-	if (WARN_ON(pixel_rate == 0))
+	if (dev_WARN_ON(crtc_state_to_dev(crtc_state), pixel_rate == 0))
 		return u32_to_fixed16(0);
 
 	crtc_htotal = crtc_state->hw.adjusted_mode.crtc_htotal;
@@ -4550,7 +4560,8 @@ skl_adjusted_plane_pixel_rate(const struct intel_crtc_state *crtc_state,
 	uint_fixed_16_16_t downscale_amount;
 
 	/* Shouldn't reach here on disabled planes... */
-	if (WARN_ON(!intel_wm_plane_visible(crtc_state, plane_state)))
+	if (dev_WARN_ON(crtc_state_to_dev(crtc_state),
+			!intel_wm_plane_visible(crtc_state, plane_state)))
 		return 0;
 
 	/*
@@ -4988,9 +4999,11 @@ static int icl_build_plane_wm(struct intel_crtc_state *crtc_state,
 		const struct drm_framebuffer *fb = plane_state->hw.fb;
 		enum plane_id y_plane_id = plane_state->planar_linked_plane->id;
 
-		WARN_ON(!intel_wm_plane_visible(crtc_state, plane_state));
-		WARN_ON(!fb->format->is_yuv ||
-			fb->format->num_planes == 1);
+		dev_WARN_ON(crtc_state_to_dev(crtc_state),
+			    !intel_wm_plane_visible(crtc_state, plane_state));
+		dev_WARN_ON(crtc_state_to_dev(crtc_state),
+			    !fb->format->is_yuv ||
+			    fb->format->num_planes == 1);
 
 		ret = skl_build_plane_wm_single(crtc_state, plane_state,
 						y_plane_id, 0);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
