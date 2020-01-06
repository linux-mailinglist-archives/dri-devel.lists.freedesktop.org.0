Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED76B1320F1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E6289BA5;
	Tue,  7 Jan 2020 08:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793926E4C9;
 Mon,  6 Jan 2020 17:28:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 09:28:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; 
 d="scan'208,217";a="225496119"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2020 09:28:32 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: rodrigo.vivi@intel.com, irlied@linux.ie, daniel@ffwll.ch,
 sudeep.dutt@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [RFC 5/7] drm/i915: Make WARN* device specific where
 drm_priv ptr is available
Date: Mon,  6 Jan 2020 22:53:24 +0530
Message-Id: <20200106172326.32592-6-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
variants in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
+struct device *dev = i915_to_dev(T);
<+...
(
-WARN(
+dev_WARN(dev,
...)
|
-WARN_ON(
+dev_WARN_ON(dev,
...)
|
-WARN_ONCE(
+dev_WARN_ONCE(dev,
...)
|
-WARN_ON_ONCE(
+dev_WARN_ON_ONCE(dev,
...)
)
...+>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
+struct device *dev = i915_to_dev(T);
<+...
(
-WARN(
+dev_WARN(dev,
...)
|
-WARN_ON(
+dev_WARN_ON(dev,
...)
|
-WARN_ONCE(
+dev_WARN_ONCE(dev,
...)
|
-WARN_ON_ONCE(
+dev_WARN_ON_ONCE(dev,
...)
)
...+>
}

command: spatch --sp-file <script> --dir drivers/gpu/drm/i915 \
					--linux-spacing --in-place
Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c        |  14 +-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  23 ++-
 drivers/gpu/drm/i915/display/intel_bios.c     |  13 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |   3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  85 ++++----
 drivers/gpu/drm/i915/display/intel_color.c    |   4 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  15 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 102 ++++++----
 drivers/gpu/drm/i915/display/intel_display.c  | 180 ++++++++++-------
 .../drm/i915/display/intel_display_power.c    | 190 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp.c       | 112 +++++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  10 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |   3 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  45 +++--
 drivers/gpu/drm/i915/display/intel_dsb.c      |   9 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |  30 ++-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  26 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  47 +++--
 drivers/gpu/drm/i915/display/intel_hotplug.c  |   6 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |   3 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |   8 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  17 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  28 ++-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |   4 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  38 ++--
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   8 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |  24 ++-
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   3 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c        |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  15 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   9 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |   3 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c          |   5 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   3 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   8 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  23 ++-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   3 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c        |   8 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |   5 +-
 drivers/gpu/drm/i915/gvt/display.c            |   3 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |   5 +-
 drivers/gpu/drm/i915/gvt/edid.c               |   3 +-
 drivers/gpu/drm/i915/gvt/gvt.c                |   6 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |   3 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |   3 +-
 drivers/gpu/drm/i915/i915_drv.c               |  23 ++-
 drivers/gpu/drm/i915/i915_gem.c               |   9 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |   7 +-
 drivers/gpu/drm/i915/i915_irq.c               |  83 ++++----
 drivers/gpu/drm/i915/i915_pmu.c               |   9 +-
 drivers/gpu/drm/i915/intel_csr.c              |   7 +-
 drivers/gpu/drm/i915/intel_pch.c              |  65 +++---
 drivers/gpu/drm/i915/intel_pm.c               |  30 ++-
 drivers/gpu/drm/i915/intel_sideband.c         |   9 +-
 drivers/gpu/drm/i915/intel_uncore.c           |   3 +-
 64 files changed, 918 insertions(+), 536 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 8435bc5a7a74..8648569793f6 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -345,10 +345,11 @@ static void gen11_dsi_program_esc_clk_div(struct intel_encoder *encoder,
 static void get_dsi_io_power_domains(struct drm_i915_private *dev_priv,
 				     struct intel_dsi *intel_dsi)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum port port;
 
 	for_each_dsi_port(port, intel_dsi->ports) {
-		WARN_ON(intel_dsi->io_wakeref[port]);
+		dev_WARN_ON(dev, intel_dsi->io_wakeref[port]);
 		intel_dsi->io_wakeref[port] =
 			intel_display_power_get(dev_priv,
 						port == PORT_A ?
@@ -1334,6 +1335,7 @@ static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
 					struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	int dsc_max_bpc = INTEL_GEN(dev_priv) >= 12 ? 12 : 10;
 	bool use_dsc;
@@ -1357,11 +1359,11 @@ static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
 		return ret;
 
 	/* DSI specific sanity checks on the common code */
-	WARN_ON(vdsc_cfg->vbr_enable);
-	WARN_ON(vdsc_cfg->simple_422);
-	WARN_ON(vdsc_cfg->pic_width % vdsc_cfg->slice_width);
-	WARN_ON(vdsc_cfg->slice_height < 8);
-	WARN_ON(vdsc_cfg->pic_height % vdsc_cfg->slice_height);
+	dev_WARN_ON(dev, vdsc_cfg->vbr_enable);
+	dev_WARN_ON(dev, vdsc_cfg->simple_422);
+	dev_WARN_ON(dev, vdsc_cfg->pic_width % vdsc_cfg->slice_width);
+	dev_WARN_ON(dev, vdsc_cfg->slice_height < 8);
+	dev_WARN_ON(dev, vdsc_cfg->pic_height % vdsc_cfg->slice_height);
 
 	ret = drm_dsc_compute_rc_parameters(vdsc_cfg);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 0eb973f65977..ecc18390cf47 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -297,6 +297,7 @@ static void intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_sta
 				      int *scaler_id)
 {
 	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	int j;
 	u32 mode;
 
@@ -312,7 +313,8 @@ static void intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_sta
 		}
 	}
 
-	if (WARN(*scaler_id < 0, "Cannot find scaler for %s:%d\n", name, idx))
+	if (dev_WARN(dev, *scaler_id < 0,
+		     "Cannot find scaler for %s:%d\n", name, idx))
 		return;
 
 	/* set scaler mode */
@@ -381,6 +383,7 @@ int intel_atomic_setup_scalers(struct drm_i915_private *dev_priv,
 			       struct intel_crtc *intel_crtc,
 			       struct intel_crtc_state *crtc_state)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct drm_plane *plane = NULL;
 	struct intel_plane *intel_plane;
 	struct intel_plane_state *plane_state = NULL;
@@ -463,7 +466,8 @@ int intel_atomic_setup_scalers(struct drm_i915_private *dev_priv,
 			idx = plane->base.id;
 
 			/* plane on different crtc cannot be a scaler user of this crtc */
-			if (WARN_ON(intel_plane->pipe != intel_crtc->pipe))
+			if (dev_WARN_ON(dev,
+					intel_plane->pipe != intel_crtc->pipe))
 				continue;
 
 			plane_state = intel_atomic_get_new_plane_state(intel_state,
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 27710098d056..0221c954f09d 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -555,6 +555,7 @@ static void ilk_audio_codec_disable(struct intel_encoder *encoder,
 				    const struct drm_connector_state *old_conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
 	enum port port = encoder->port;
@@ -565,7 +566,7 @@ static void ilk_audio_codec_disable(struct intel_encoder *encoder,
 		      encoder->base.base.id, encoder->base.name,
 		      pipe_name(pipe));
 
-	if (WARN_ON(port == PORT_A))
+	if (dev_WARN_ON(dev, port == PORT_A))
 		return;
 
 	if (HAS_PCH_IBX(dev_priv)) {
@@ -602,6 +603,7 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
 				   const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_connector *connector = conn_state->connector;
 	enum pipe pipe = crtc->pipe;
@@ -615,7 +617,7 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
 		      encoder->base.base.id, encoder->base.name,
 		      pipe_name(pipe), drm_eld_size(eld));
 
-	if (WARN_ON(port == PORT_A))
+	if (dev_WARN_ON(dev, port == PORT_A))
 		return;
 
 	/*
@@ -803,13 +805,14 @@ void intel_init_audio_hooks(struct drm_i915_private *dev_priv)
 static void glk_force_audio_cdclk(struct drm_i915_private *dev_priv,
 				  bool enable)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_atomic_state *state;
 	int ret;
 
 	drm_modeset_acquire_init(&ctx, 0);
 	state = drm_atomic_state_alloc(&dev_priv->drm);
-	if (WARN_ON(!state))
+	if (dev_WARN_ON(dev, !state))
 		return;
 
 	state->acquire_ctx = &ctx;
@@ -830,7 +833,7 @@ static void glk_force_audio_cdclk(struct drm_i915_private *dev_priv,
 		goto retry;
 	}
 
-	WARN_ON(ret);
+	dev_WARN_ON(dev, ret);
 
 	drm_atomic_state_put(state);
 
@@ -916,8 +919,9 @@ static void i915_audio_component_codec_wake_override(struct device *kdev,
 static int i915_audio_component_get_cdclk_freq(struct device *kdev)
 {
 	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
+	struct device *dev = i915_to_dev(dev_priv);
 
-	if (WARN_ON_ONCE(!HAS_DDI(dev_priv)))
+	if (dev_WARN_ON_ONCE(dev, !HAS_DDI(dev_priv)))
 		return -ENODEV;
 
 	return dev_priv->cdclk.hw.cdclk;
@@ -936,11 +940,12 @@ static int i915_audio_component_get_cdclk_freq(struct device *kdev)
 static struct intel_encoder *get_saved_enc(struct drm_i915_private *dev_priv,
 					       int port, int pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_encoder *encoder;
 
 	/* MST */
 	if (pipe >= 0) {
-		if (WARN_ON(pipe >= ARRAY_SIZE(dev_priv->av_enc_map)))
+		if (dev_WARN_ON(dev, pipe >= ARRAY_SIZE(dev_priv->av_enc_map)))
 			return NULL;
 
 		encoder = dev_priv->av_enc_map[pipe];
@@ -1055,12 +1060,14 @@ static int i915_audio_component_bind(struct device *i915_kdev,
 {
 	struct i915_audio_component *acomp = data;
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
+	struct device *dev = i915_to_dev(dev_priv);
 	int i;
 
-	if (WARN_ON(acomp->base.ops || acomp->base.dev))
+	if (dev_WARN_ON(dev, acomp->base.ops || acomp->base.dev))
 		return -EEXIST;
 
-	if (WARN_ON(!device_link_add(hda_kdev, i915_kdev, DL_FLAG_STATELESS)))
+	if (dev_WARN_ON(dev, !device_link_add(hda_kdev, i915_kdev,
+					      DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
 	drm_modeset_lock_all(&dev_priv->drm);
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 8beac06e3f10..de6bc97a81ba 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -215,6 +215,7 @@ static void
 parse_panel_options(struct drm_i915_private *dev_priv,
 		    const struct bdb_header *bdb)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct bdb_lvds_options *lvds_options;
 	int panel_type;
 	int drrs_mode;
@@ -228,7 +229,7 @@ parse_panel_options(struct drm_i915_private *dev_priv,
 
 	ret = intel_opregion_get_panel_type(dev_priv);
 	if (ret >= 0) {
-		WARN_ON(ret > 0xf);
+		dev_WARN_ON(dev, ret > 0xf);
 		panel_type = ret;
 		DRM_DEBUG_KMS("Panel type: %d (OpRegion)\n", panel_type);
 	} else {
@@ -1215,10 +1216,11 @@ static int goto_next_sequence_v3(const u8 *data, int index, int total)
  */
 static int get_init_otp_deassert_fragment_len(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const u8 *data = dev_priv->vbt.dsi.sequence[MIPI_SEQ_INIT_OTP];
 	int index, len;
 
-	if (WARN_ON(!data || dev_priv->vbt.dsi.seq_version != 1))
+	if (dev_WARN_ON(dev, !data || dev_priv->vbt.dsi.seq_version != 1))
 		return 0;
 
 	/* index = 1 to skip sequence byte */
@@ -2220,6 +2222,7 @@ bool intel_bios_is_lvds_present(struct drm_i915_private *dev_priv, u8 *i2c_pin)
  */
 bool intel_bios_is_port_present(struct drm_i915_private *dev_priv, enum port port)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct display_device_data *devdata;
 	const struct child_device_config *child;
 	static const struct {
@@ -2242,7 +2245,8 @@ bool intel_bios_is_port_present(struct drm_i915_private *dev_priv, enum port por
 	}
 
 	/* FIXME maybe deal with port A as well? */
-	if (WARN_ON(port == PORT_A) || port >= ARRAY_SIZE(port_mapping))
+	if (dev_WARN_ON(dev, port == PORT_A) ||
+	    port >= ARRAY_SIZE(port_mapping))
 		return false;
 
 	list_for_each_entry(devdata, &dev_priv->vbt.display_devices, node) {
@@ -2488,10 +2492,11 @@ bool
 intel_bios_is_port_hpd_inverted(const struct drm_i915_private *i915,
 				enum port port)
 {
+	struct device *dev = i915_to_dev(i915);
 	const struct child_device_config *child =
 		i915->vbt.ddi_port_info[port].child;
 
-	if (WARN_ON_ONCE(!IS_GEN9_LP(i915)))
+	if (dev_WARN_ON_ONCE(dev, !IS_GEN9_LP(i915)))
 		return false;
 
 	return child && child->hpd_invert;
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index b228671d5a5d..ec9419373fc2 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -116,13 +116,14 @@ static int icl_pcode_read_qgv_point_info(struct drm_i915_private *dev_priv,
 static int icl_get_qgv_points(struct drm_i915_private *dev_priv,
 			      struct intel_qgv_info *qi)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	int i, ret;
 
 	ret = icl_pcode_read_mem_global_info(dev_priv, qi);
 	if (ret)
 		return ret;
 
-	if (WARN_ON(qi->num_points > ARRAY_SIZE(qi->points)))
+	if (dev_WARN_ON(dev, qi->num_points > ARRAY_SIZE(qi->points)))
 		qi->num_points = ARRAY_SIZE(qi->points);
 
 	for (i = 0; i < qi->num_points; i++) {
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 7d1ab1e5b7c3..ee884e3ec2e1 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -489,6 +489,7 @@ static void vlv_get_cdclk(struct drm_i915_private *dev_priv,
 
 static void vlv_program_pfi_credits(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	unsigned int credits, default_credits;
 
 	if (IS_CHERRYVIEW(dev_priv))
@@ -520,7 +521,7 @@ static void vlv_program_pfi_credits(struct drm_i915_private *dev_priv)
 	 * FIXME is this guaranteed to clear
 	 * immediately or should we poll for it?
 	 */
-	WARN_ON(I915_READ(GCI_CONTROL) & PFI_CREDIT_RESEND);
+	dev_WARN_ON(dev, I915_READ(GCI_CONTROL) & PFI_CREDIT_RESEND);
 }
 
 static void vlv_set_cdclk(struct drm_i915_private *dev_priv,
@@ -715,16 +716,18 @@ static void bdw_set_cdclk(struct drm_i915_private *dev_priv,
 			  const struct intel_cdclk_state *cdclk_state,
 			  enum pipe pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	int cdclk = cdclk_state->cdclk;
 	u32 val;
 	int ret;
 
-	if (WARN((I915_READ(LCPLL_CTL) &
-		  (LCPLL_PLL_DISABLE | LCPLL_PLL_LOCK |
-		   LCPLL_CD_CLOCK_DISABLE | LCPLL_ROOT_CD_CLOCK_DISABLE |
-		   LCPLL_CD2X_CLOCK_DISABLE | LCPLL_POWER_DOWN_ALLOW |
-		   LCPLL_CD_SOURCE_FCLK)) != LCPLL_PLL_LOCK,
-		 "trying to change cdclk frequency with cdclk not enabled\n"))
+	if (dev_WARN(dev, (I915_READ(LCPLL_CTL) &
+			   (LCPLL_PLL_DISABLE | LCPLL_PLL_LOCK |
+			    LCPLL_CD_CLOCK_DISABLE |
+			    LCPLL_ROOT_CD_CLOCK_DISABLE |
+			    LCPLL_CD2X_CLOCK_DISABLE | LCPLL_POWER_DOWN_ALLOW |
+			    LCPLL_CD_SOURCE_FCLK)) != LCPLL_PLL_LOCK,
+		     "trying to change cdclk frequency with cdclk not enabled\n"))
 		return;
 
 	ret = sandybridge_pcode_write(dev_priv,
@@ -823,6 +826,7 @@ static u8 skl_calc_voltage_level(int cdclk)
 static void skl_dpll0_update(struct drm_i915_private *dev_priv,
 			     struct intel_cdclk_state *cdclk_state)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 val;
 
 	cdclk_state->ref = 24000;
@@ -832,15 +836,15 @@ static void skl_dpll0_update(struct drm_i915_private *dev_priv,
 	if ((val & LCPLL_PLL_ENABLE) == 0)
 		return;
 
-	if (WARN_ON((val & LCPLL_PLL_LOCK) == 0))
+	if (dev_WARN_ON(dev, (val & LCPLL_PLL_LOCK) == 0))
 		return;
 
 	val = I915_READ(DPLL_CTRL1);
 
-	if (WARN_ON((val & (DPLL_CTRL1_HDMI_MODE(SKL_DPLL0) |
-			    DPLL_CTRL1_SSC(SKL_DPLL0) |
-			    DPLL_CTRL1_OVERRIDE(SKL_DPLL0))) !=
-		    DPLL_CTRL1_OVERRIDE(SKL_DPLL0)))
+	if (dev_WARN_ON(dev, (val & (DPLL_CTRL1_HDMI_MODE(SKL_DPLL0) |
+				     DPLL_CTRL1_SSC(SKL_DPLL0) |
+				     DPLL_CTRL1_OVERRIDE(SKL_DPLL0))) !=
+			DPLL_CTRL1_OVERRIDE(SKL_DPLL0)))
 		return;
 
 	switch (val & DPLL_CTRL1_LINK_RATE_MASK(SKL_DPLL0)) {
@@ -940,9 +944,10 @@ static void skl_set_preferred_cdclk_vco(struct drm_i915_private *dev_priv,
 
 static void skl_dpll0_enable(struct drm_i915_private *dev_priv, int vco)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 val;
 
-	WARN_ON(vco != 8100000 && vco != 8640000);
+	dev_WARN_ON(dev, vco != 8100000 && vco != 8640000);
 
 	/*
 	 * We always enable DPLL0 with the lowest link rate possible, but still
@@ -992,6 +997,7 @@ static void skl_set_cdclk(struct drm_i915_private *dev_priv,
 			  const struct intel_cdclk_state *cdclk_state,
 			  enum pipe pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	int cdclk = cdclk_state->cdclk;
 	int vco = cdclk_state->vco;
 	u32 freq_select, cdclk_ctl;
@@ -1005,7 +1011,7 @@ static void skl_set_cdclk(struct drm_i915_private *dev_priv,
 	 * use the corresponding VCO freq as that always leads to using the
 	 * minimum 308MHz CDCLK.
 	 */
-	WARN_ON_ONCE(IS_SKYLAKE(dev_priv) && vco == 8640000);
+	dev_WARN_ON_ONCE(dev, IS_SKYLAKE(dev_priv) && vco == 8640000);
 
 	ret = skl_pcode_request(dev_priv, SKL_PCODE_CDCLK_CONTROL,
 				SKL_CDCLK_PREPARE_FOR_CHANGE,
@@ -1020,8 +1026,8 @@ static void skl_set_cdclk(struct drm_i915_private *dev_priv,
 	/* Choose frequency for this cdclk */
 	switch (cdclk) {
 	default:
-		WARN_ON(cdclk != dev_priv->cdclk.hw.bypass);
-		WARN_ON(vco != 0);
+		dev_WARN_ON(dev, cdclk != dev_priv->cdclk.hw.bypass);
+		dev_WARN_ON(dev, vco != 0);
 		/* fall through */
 	case 308571:
 	case 337500:
@@ -1215,6 +1221,7 @@ static const struct intel_cdclk_vals icl_cdclk_table[] = {
 
 static int bxt_calc_cdclk(struct drm_i915_private *dev_priv, int min_cdclk)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct intel_cdclk_vals *table = dev_priv->cdclk.table;
 	int i;
 
@@ -1223,13 +1230,14 @@ static int bxt_calc_cdclk(struct drm_i915_private *dev_priv, int min_cdclk)
 		    table[i].cdclk >= min_cdclk)
 			return table[i].cdclk;
 
-	WARN(1, "Cannot satisfy minimum cdclk %d with refclk %u\n",
-	     min_cdclk, dev_priv->cdclk.hw.ref);
+	dev_WARN(dev, 1, "Cannot satisfy minimum cdclk %d with refclk %u\n",
+		 min_cdclk, dev_priv->cdclk.hw.ref);
 	return 0;
 }
 
 static int bxt_calc_cdclk_pll_vco(struct drm_i915_private *dev_priv, int cdclk)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct intel_cdclk_vals *table = dev_priv->cdclk.table;
 	int i;
 
@@ -1241,8 +1249,8 @@ static int bxt_calc_cdclk_pll_vco(struct drm_i915_private *dev_priv, int cdclk)
 		    table[i].cdclk == cdclk)
 			return dev_priv->cdclk.hw.ref * table[i].ratio;
 
-	WARN(1, "cdclk %d not valid for refclk %u\n",
-	     cdclk, dev_priv->cdclk.hw.ref);
+	dev_WARN(dev, 1, "cdclk %d not valid for refclk %u\n",
+		 cdclk, dev_priv->cdclk.hw.ref);
 	return 0;
 }
 
@@ -1351,6 +1359,7 @@ static void bxt_de_pll_readout(struct drm_i915_private *dev_priv,
 static void bxt_get_cdclk(struct drm_i915_private *dev_priv,
 			  struct intel_cdclk_state *cdclk_state)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 divider;
 	int div;
 
@@ -1375,15 +1384,17 @@ static void bxt_get_cdclk(struct drm_i915_private *dev_priv,
 		div = 2;
 		break;
 	case BXT_CDCLK_CD2X_DIV_SEL_1_5:
-		WARN(IS_GEMINILAKE(dev_priv) || INTEL_GEN(dev_priv) >= 10,
-		     "Unsupported divider\n");
+		dev_WARN(dev,
+			 IS_GEMINILAKE(dev_priv) || INTEL_GEN(dev_priv) >= 10,
+			 "Unsupported divider\n");
 		div = 3;
 		break;
 	case BXT_CDCLK_CD2X_DIV_SEL_2:
 		div = 4;
 		break;
 	case BXT_CDCLK_CD2X_DIV_SEL_4:
-		WARN(INTEL_GEN(dev_priv) >= 10, "Unsupported divider\n");
+		dev_WARN(dev, INTEL_GEN(dev_priv) >= 10,
+			 "Unsupported divider\n");
 		div = 8;
 		break;
 	default:
@@ -1491,6 +1502,7 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
 			  const struct intel_cdclk_state *cdclk_state,
 			  enum pipe pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	int cdclk = cdclk_state->cdclk;
 	int vco = cdclk_state->vco;
 	u32 val, divider;
@@ -1520,22 +1532,24 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
 	/* cdclk = vco / 2 / div{1,1.5,2,4} */
 	switch (DIV_ROUND_CLOSEST(vco, cdclk)) {
 	default:
-		WARN_ON(cdclk != dev_priv->cdclk.hw.bypass);
-		WARN_ON(vco != 0);
+		dev_WARN_ON(dev, cdclk != dev_priv->cdclk.hw.bypass);
+		dev_WARN_ON(dev, vco != 0);
 		/* fall through */
 	case 2:
 		divider = BXT_CDCLK_CD2X_DIV_SEL_1;
 		break;
 	case 3:
-		WARN(IS_GEMINILAKE(dev_priv) || INTEL_GEN(dev_priv) >= 10,
-		     "Unsupported divider\n");
+		dev_WARN(dev,
+			 IS_GEMINILAKE(dev_priv) || INTEL_GEN(dev_priv) >= 10,
+			 "Unsupported divider\n");
 		divider = BXT_CDCLK_CD2X_DIV_SEL_1_5;
 		break;
 	case 4:
 		divider = BXT_CDCLK_CD2X_DIV_SEL_2;
 		break;
 	case 8:
-		WARN(INTEL_GEN(dev_priv) >= 10, "Unsupported divider\n");
+		dev_WARN(dev, INTEL_GEN(dev_priv) >= 10,
+			 "Unsupported divider\n");
 		divider = BXT_CDCLK_CD2X_DIV_SEL_4;
 		break;
 	}
@@ -1845,18 +1859,19 @@ static void intel_set_cdclk(struct drm_i915_private *dev_priv,
 			    const struct intel_cdclk_state *cdclk_state,
 			    enum pipe pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	if (!intel_cdclk_changed(&dev_priv->cdclk.hw, cdclk_state))
 		return;
 
-	if (WARN_ON_ONCE(!dev_priv->display.set_cdclk))
+	if (dev_WARN_ON_ONCE(dev, !dev_priv->display.set_cdclk))
 		return;
 
 	intel_dump_cdclk_state(cdclk_state, "Changing CDCLK to");
 
 	dev_priv->display.set_cdclk(dev_priv, cdclk_state, pipe);
 
-	if (WARN(intel_cdclk_changed(&dev_priv->cdclk.hw, cdclk_state),
-		 "cdclk state doesn't match!\n")) {
+	if (dev_WARN(dev, intel_cdclk_changed(&dev_priv->cdclk.hw, cdclk_state),
+		     "cdclk state doesn't match!\n")) {
 		intel_dump_cdclk_state(&dev_priv->cdclk.hw, "[hw state]");
 		intel_dump_cdclk_state(cdclk_state, "[sw state]");
 	}
@@ -2428,6 +2443,7 @@ static int intel_compute_max_dotclk(struct drm_i915_private *dev_priv)
  */
 void intel_update_max_cdclk(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	if (IS_ELKHARTLAKE(dev_priv)) {
 		if (dev_priv->cdclk.hw.ref == 24000)
 			dev_priv->max_cdclk_freq = 552000;
@@ -2445,7 +2461,7 @@ void intel_update_max_cdclk(struct drm_i915_private *dev_priv)
 		int max_cdclk, vco;
 
 		vco = dev_priv->skl_preferred_vco_freq;
-		WARN_ON(vco != 8100000 && vco != 8640000);
+		dev_WARN_ON(dev, vco != 8100000 && vco != 8640000);
 
 		/*
 		 * Use the lower (vco 8640) cdclk values as a
@@ -2617,6 +2633,7 @@ void intel_update_rawclk(struct drm_i915_private *dev_priv)
  */
 void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	if (IS_ELKHARTLAKE(dev_priv)) {
 		dev_priv->display.set_cdclk = bxt_set_cdclk;
 		dev_priv->display.modeset_calc_cdclk = bxt_modeset_calc_cdclk;
@@ -2697,8 +2714,8 @@ void intel_init_cdclk_hooks(struct drm_i915_private *dev_priv)
 	else if (IS_I845G(dev_priv))
 		dev_priv->display.get_cdclk = fixed_200mhz_get_cdclk;
 	else { /* 830 */
-		WARN(!IS_I830(dev_priv),
-		     "Unknown platform. Assuming 133 MHz CDCLK\n");
+		dev_WARN(dev, !IS_I830(dev_priv),
+			 "Unknown platform. Assuming 133 MHz CDCLK\n");
 		dev_priv->display.get_cdclk = fixed_133mhz_get_cdclk;
 	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 3980e8b50c28..4a38b53b1e2b 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -272,6 +272,7 @@ static void ilk_load_csc_matrix(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	bool limited_color_range = ilk_csc_limited_range(crtc_state);
 
 	if (crtc_state->hw.ctm) {
@@ -297,7 +298,8 @@ static void ilk_load_csc_matrix(const struct intel_crtc_state *crtc_state)
 		 * LUT is needed but CSC is not we need to load an
 		 * identity matrix.
 		 */
-		WARN_ON(!IS_CANNONLAKE(dev_priv) && !IS_GEMINILAKE(dev_priv));
+		dev_WARN_ON(dev, !IS_CANNONLAKE(dev_priv) &&
+			    !IS_GEMINILAKE(dev_priv));
 
 		ilk_update_pipe_csc(crtc, ilk_csc_off_zero,
 				    ilk_csc_coeff_identity,
diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
index 44bbc7e74fc3..011610a9bcd4 100644
--- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
@@ -215,11 +215,12 @@ void intel_combo_phy_power_up_lanes(struct drm_i915_private *dev_priv,
 				    enum phy phy, bool is_dsi,
 				    int lane_count, bool lane_reversal)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u8 lane_mask;
 	u32 val;
 
 	if (is_dsi) {
-		WARN_ON(lane_reversal);
+		dev_WARN_ON(dev, lane_reversal);
 
 		switch (lane_count) {
 		case 1:
diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index cbe5978e7fb5..5aa3a69f5ec6 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -229,8 +229,9 @@ static void hsw_disable_crt(struct intel_encoder *encoder,
 			    const struct drm_connector_state *old_conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 
-	WARN_ON(!old_crtc_state->has_pch_encoder);
+	dev_WARN_ON(dev, !old_crtc_state->has_pch_encoder);
 
 	intel_set_pch_fifo_underrun_reporting(dev_priv, PIPE_A, false);
 }
@@ -240,6 +241,7 @@ static void hsw_post_disable_crt(struct intel_encoder *encoder,
 				 const struct drm_connector_state *old_conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 
 	intel_crtc_vblank_off(old_crtc_state);
 
@@ -258,7 +260,7 @@ static void hsw_post_disable_crt(struct intel_encoder *encoder,
 
 	intel_ddi_fdi_post_disable(encoder, old_crtc_state, old_conn_state);
 
-	WARN_ON(!old_crtc_state->has_pch_encoder);
+	dev_WARN_ON(dev, !old_crtc_state->has_pch_encoder);
 
 	intel_set_pch_fifo_underrun_reporting(dev_priv, PIPE_A, true);
 }
@@ -268,8 +270,9 @@ static void hsw_pre_pll_enable_crt(struct intel_encoder *encoder,
 				   const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 
-	WARN_ON(!crtc_state->has_pch_encoder);
+	dev_WARN_ON(dev, !crtc_state->has_pch_encoder);
 
 	intel_set_pch_fifo_underrun_reporting(dev_priv, PIPE_A, false);
 }
@@ -279,10 +282,11 @@ static void hsw_pre_enable_crt(struct intel_encoder *encoder,
 			       const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
 
-	WARN_ON(!crtc_state->has_pch_encoder);
+	dev_WARN_ON(dev, !crtc_state->has_pch_encoder);
 
 	intel_set_cpu_fifo_underrun_reporting(dev_priv, pipe, false);
 
@@ -296,10 +300,11 @@ static void hsw_enable_crt(struct intel_encoder *encoder,
 			   const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum pipe pipe = crtc->pipe;
 
-	WARN_ON(!crtc_state->has_pch_encoder);
+	dev_WARN_ON(dev, !crtc_state->has_pch_encoder);
 
 	intel_crt_set_dpms(encoder, crtc_state, DRM_MODE_DPMS_ON);
 
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 5832faf74fdf..8f635637d61e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -903,6 +903,7 @@ icl_get_combo_buf_trans(struct drm_i915_private *dev_priv, int type, int rate,
 
 static int intel_ddi_hdmi_level(struct drm_i915_private *dev_priv, enum port port)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct ddi_vbt_port_info *port_info = &dev_priv->vbt.ddi_port_info[port];
 	int n_entries, level, default_entry;
 	enum phy phy = intel_port_to_phy(dev_priv, port);
@@ -937,11 +938,11 @@ static int intel_ddi_hdmi_level(struct drm_i915_private *dev_priv, enum port por
 		intel_ddi_get_buf_trans_hdmi(dev_priv, &n_entries);
 		default_entry = 6;
 	} else {
-		WARN(1, "ddi translation table missing\n");
+		dev_WARN(dev, 1, "ddi translation table missing\n");
 		return 0;
 	}
 
-	if (WARN_ON_ONCE(n_entries == 0))
+	if (dev_WARN_ON_ONCE(dev, n_entries == 0))
 		return 0;
 
 	if (port_info->hdmi_level_shift_set)
@@ -949,7 +950,7 @@ static int intel_ddi_hdmi_level(struct drm_i915_private *dev_priv, enum port por
 	else
 		level = default_entry;
 
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (dev_WARN_ON_ONCE(dev, level >= n_entries))
 		level = n_entries - 1;
 
 	return level;
@@ -1001,6 +1002,7 @@ static void intel_prepare_hdmi_ddi_buffers(struct intel_encoder *encoder,
 					   int level)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 iboost_bit = 0;
 	int n_entries;
 	enum port port = encoder->port;
@@ -1008,9 +1010,9 @@ static void intel_prepare_hdmi_ddi_buffers(struct intel_encoder *encoder,
 
 	ddi_translations = intel_ddi_get_buf_trans_hdmi(dev_priv, &n_entries);
 
-	if (WARN_ON_ONCE(!ddi_translations))
+	if (dev_WARN_ON_ONCE(dev, !ddi_translations))
 		return;
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (dev_WARN_ON_ONCE(dev, level >= n_entries))
 		level = n_entries - 1;
 
 	/* If we're boosting the current, set bit 31 of trans1 */
@@ -1113,6 +1115,7 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 temp, i, rx_ctl_val, ddi_pll_sel;
 
 	intel_prepare_dp_ddi_buffers(encoder, crtc_state);
@@ -1143,7 +1146,7 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 	/* Configure Port Clock Select */
 	ddi_pll_sel = hsw_pll_to_ddi_pll_sel(crtc_state->shared_dpll);
 	I915_WRITE(PORT_CLK_SEL(PORT_E), ddi_pll_sel);
-	WARN_ON(ddi_pll_sel != PORT_CLK_SEL_SPLL);
+	dev_WARN_ON(dev, ddi_pll_sel != PORT_CLK_SEL_SPLL);
 
 	/* Start the training iterating through available voltages and emphasis,
 	 * testing each value twice. */
@@ -1373,6 +1376,7 @@ static int skl_calc_wrpll_link(const struct intel_dpll_hw_state *pll_state)
 int cnl_calc_wrpll_link(struct drm_i915_private *dev_priv,
 			struct intel_dpll_hw_state *pll_state)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 p0, p1, p2, dco_freq, ref_clock;
 
 	p0 = pll_state->cfgcr1 & DPLL_CFGCR1_PDIV_MASK;
@@ -1420,7 +1424,7 @@ int cnl_calc_wrpll_link(struct drm_i915_private *dev_priv,
 	dco_freq += (((pll_state->cfgcr0 & DPLL_CFGCR0_DCO_FRACTION_MASK) >>
 		      DPLL_CFGCR0_DCO_FRACTION_SHIFT) * ref_clock) / 0x8000;
 
-	if (WARN_ON(p0 == 0 || p1 == 0 || p2 == 0))
+	if (dev_WARN_ON(dev, p0 == 0 || p1 == 0 || p2 == 0))
 		return 0;
 
 	return dco_freq / (p0 * p1 * p2 * 5);
@@ -1574,6 +1578,7 @@ static void cnl_ddi_clock_get(struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_dpll_hw_state *pll_state = &pipe_config->dpll_hw_state;
 	int link_clock;
 
@@ -1608,7 +1613,7 @@ static void cnl_ddi_clock_get(struct intel_encoder *encoder,
 			link_clock = 405000;
 			break;
 		default:
-			WARN(1, "Unsupported link rate\n");
+			dev_WARN(dev, 1, "Unsupported link rate\n");
 			break;
 		}
 		link_clock *= 2;
@@ -1670,6 +1675,7 @@ static void hsw_ddi_clock_get(struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	int link_clock = 0;
 	u32 val, pll;
 
@@ -1699,12 +1705,12 @@ static void hsw_ddi_clock_get(struct intel_encoder *encoder,
 		else if (pll == SPLL_FREQ_2700MHz)
 			link_clock = 270000;
 		else {
-			WARN(1, "bad spll freq\n");
+			dev_WARN(dev, 1, "bad spll freq\n");
 			return;
 		}
 		break;
 	default:
-		WARN(1, "bad port clock sel\n");
+		dev_WARN(dev, 1, "bad port clock sel\n");
 		return;
 	}
 
@@ -1759,13 +1765,14 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 temp;
 
 	if (!intel_crtc_has_dp_encoder(crtc_state))
 		return;
 
-	WARN_ON(transcoder_is_dsi(cpu_transcoder));
+	dev_WARN_ON(dev, transcoder_is_dsi(cpu_transcoder));
 
 	temp = DP_MSA_MISC_SYNC_CLOCK;
 
@@ -1788,8 +1795,8 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
 	}
 
 	/* nonsense combination */
-	WARN_ON(crtc_state->limited_color_range &&
-		crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
+	dev_WARN_ON(dev, crtc_state->limited_color_range &&
+		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
 
 	if (crtc_state->limited_color_range)
 		temp |= DP_MSA_MISC_COLOR_CEA_RGB;
@@ -1826,6 +1833,7 @@ intel_ddi_transcoder_func_reg_val_get(const struct intel_crtc_state *crtc_state)
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_encoder *encoder = intel_ddi_get_crtc_encoder(crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = crtc->pipe;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum port port = encoder->port;
@@ -1905,7 +1913,7 @@ intel_ddi_transcoder_func_reg_val_get(const struct intel_crtc_state *crtc_state)
 			enum transcoder master;
 
 			master = crtc_state->mst_master_transcoder;
-			WARN_ON(master == INVALID_TRANSCODER);
+			dev_WARN_ON(dev, master == INVALID_TRANSCODER);
 			temp |= TRANS_DDI_MST_TRANSPORT_SELECT(master);
 		}
 	} else {
@@ -2215,6 +2223,7 @@ static void intel_ddi_get_power_domains(struct intel_encoder *encoder,
 					struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_digital_port *dig_port;
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 
@@ -2223,7 +2232,8 @@ static void intel_ddi_get_power_domains(struct intel_encoder *encoder,
 	 * happen since fake-MST encoders don't set their get_power_domains()
 	 * hook.
 	 */
-	if (WARN_ON(intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)))
+	if (dev_WARN_ON(dev,
+			intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)))
 		return;
 
 	dig_port = enc_to_dig_port(&encoder->base);
@@ -2298,6 +2308,7 @@ static void skl_ddi_set_iboost(struct intel_encoder *encoder,
 {
 	struct intel_digital_port *intel_dig_port = enc_to_dig_port(&encoder->base);
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum port port = encoder->port;
 	u8 iboost;
 
@@ -2317,9 +2328,9 @@ static void skl_ddi_set_iboost(struct intel_encoder *encoder,
 		else
 			ddi_translations = intel_ddi_get_buf_trans_dp(dev_priv, port, &n_entries);
 
-		if (WARN_ON_ONCE(!ddi_translations))
+		if (dev_WARN_ON_ONCE(dev, !ddi_translations))
 			return;
-		if (WARN_ON_ONCE(level >= n_entries))
+		if (dev_WARN_ON_ONCE(dev, level >= n_entries))
 			level = n_entries - 1;
 
 		iboost = ddi_translations[level].i_boost;
@@ -2341,6 +2352,7 @@ static void bxt_ddi_vswing_sequence(struct intel_encoder *encoder,
 				    int level, enum intel_output_type type)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct bxt_ddi_buf_trans *ddi_translations;
 	enum port port = encoder->port;
 	int n_entries;
@@ -2352,9 +2364,9 @@ static void bxt_ddi_vswing_sequence(struct intel_encoder *encoder,
 	else
 		ddi_translations = bxt_get_buf_trans_dp(dev_priv, &n_entries);
 
-	if (WARN_ON_ONCE(!ddi_translations))
+	if (dev_WARN_ON_ONCE(dev, !ddi_translations))
 		return;
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (dev_WARN_ON_ONCE(dev, level >= n_entries))
 		level = n_entries - 1;
 
 	bxt_ddi_phy_set_signal_level(dev_priv, port,
@@ -2367,6 +2379,7 @@ static void bxt_ddi_vswing_sequence(struct intel_encoder *encoder,
 u8 intel_ddi_dp_voltage_max(struct intel_encoder *encoder)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 	enum port port = encoder->port;
 	enum phy phy = intel_port_to_phy(dev_priv, port);
@@ -2401,9 +2414,9 @@ u8 intel_ddi_dp_voltage_max(struct intel_encoder *encoder)
 			intel_ddi_get_buf_trans_dp(dev_priv, port, &n_entries);
 	}
 
-	if (WARN_ON(n_entries < 1))
+	if (dev_WARN_ON(dev, n_entries < 1))
 		n_entries = 1;
-	if (WARN_ON(n_entries > ARRAY_SIZE(index_to_dp_signal_levels)))
+	if (dev_WARN_ON(dev, n_entries > ARRAY_SIZE(index_to_dp_signal_levels)))
 		n_entries = ARRAY_SIZE(index_to_dp_signal_levels);
 
 	return index_to_dp_signal_levels[n_entries - 1] &
@@ -2434,6 +2447,7 @@ static void cnl_ddi_vswing_program(struct intel_encoder *encoder,
 				   int level, enum intel_output_type type)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct cnl_ddi_buf_trans *ddi_translations;
 	enum port port = encoder->port;
 	int n_entries, ln;
@@ -2446,9 +2460,9 @@ static void cnl_ddi_vswing_program(struct intel_encoder *encoder,
 	else
 		ddi_translations = cnl_get_buf_trans_dp(dev_priv, &n_entries);
 
-	if (WARN_ON_ONCE(!ddi_translations))
+	if (dev_WARN_ON_ONCE(dev, !ddi_translations))
 		return;
-	if (WARN_ON_ONCE(level >= n_entries))
+	if (dev_WARN_ON_ONCE(dev, level >= n_entries))
 		level = n_entries - 1;
 
 	/* Set PORT_TX_DW5 Scaling Mode Sel to 010b. */
@@ -2961,6 +2975,7 @@ static void icl_map_plls_to_ports(struct intel_encoder *encoder,
 				  const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 	u32 val;
@@ -2968,7 +2983,8 @@ static void icl_map_plls_to_ports(struct intel_encoder *encoder,
 	mutex_lock(&dev_priv->dpll_lock);
 
 	val = I915_READ(ICL_DPCLKA_CFGCR0);
-	WARN_ON((val & icl_dpclka_cfgcr0_clk_off(dev_priv, phy)) == 0);
+	dev_WARN_ON(dev,
+		    (val & icl_dpclka_cfgcr0_clk_off(dev_priv, phy)) == 0);
 
 	if (intel_phy_is_combo(dev_priv, phy)) {
 		/*
@@ -3011,6 +3027,7 @@ static void icl_unmap_plls_to_ports(struct intel_encoder *encoder)
 static void icl_sanitize_port_clk_off(struct drm_i915_private *dev_priv,
 				      u32 port_mask, bool ddi_clk_needed)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum port port;
 	u32 val;
 
@@ -3027,7 +3044,7 @@ static void icl_sanitize_port_clk_off(struct drm_i915_private *dev_priv,
 		 * Punt on the case now where clock is gated, but it would
 		 * be needed by the port. Something else is really broken then.
 		 */
-		if (WARN_ON(ddi_clk_needed))
+		if (dev_WARN_ON(dev, ddi_clk_needed))
 			continue;
 
 		DRM_NOTE("PHY %c is disabled/in DSI mode with an ungated DDI clock, gate it\n",
@@ -3040,6 +3057,7 @@ static void icl_sanitize_port_clk_off(struct drm_i915_private *dev_priv,
 void icl_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 port_mask;
 	bool ddi_clk_needed;
 
@@ -3059,7 +3077,7 @@ void icl_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
 		 * In the unlikely case that BIOS enables DP in MST mode, just
 		 * warn since our MST HW readout is incomplete.
 		 */
-		if (WARN_ON(is_mst))
+		if (dev_WARN_ON(dev, is_mst))
 			return;
 	}
 
@@ -3078,7 +3096,8 @@ void icl_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
 			if (other_encoder == encoder)
 				continue;
 
-			if (WARN_ON(port_mask & BIT(other_encoder->port)))
+			if (dev_WARN_ON(dev, port_mask &
+					BIT(other_encoder->port)))
 				return;
 		}
 		/*
@@ -3095,12 +3114,13 @@ static void intel_ddi_clk_select(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum port port = encoder->port;
 	enum phy phy = intel_port_to_phy(dev_priv, port);
 	u32 val;
 	const struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 
-	if (WARN_ON(!pll))
+	if (dev_WARN_ON(dev, !pll))
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
@@ -3225,6 +3245,7 @@ icl_program_mg_dp_mode(struct intel_digital_port *intel_dig_port,
 		       const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(intel_dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum tc_port tc_port = intel_port_to_tc(dev_priv, intel_dig_port->base.port);
 	u32 ln0, ln1, pin_assignment;
 	u8 width;
@@ -3251,7 +3272,7 @@ icl_program_mg_dp_mode(struct intel_digital_port *intel_dig_port,
 
 	switch (pin_assignment) {
 	case 0x0:
-		WARN_ON(intel_dig_port->tc_mode != TC_PORT_LEGACY);
+		dev_WARN_ON(dev, intel_dig_port->tc_mode != TC_PORT_LEGACY);
 		if (width == 1) {
 			ln1 |= MG_DP_MODE_CFG_DP_X1_MODE;
 		} else {
@@ -3390,6 +3411,7 @@ static void tgl_dc3co_exitline_compute_config(struct intel_encoder *encoder,
 {
 	u32 exit_scanlines;
 	struct drm_i915_private *dev_priv = to_i915(cstate->uapi.crtc->dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 crtc_vdisplay = cstate->hw.adjusted_mode.crtc_vdisplay;
 
 	cstate->dc3co_exitline = 0;
@@ -3412,7 +3434,7 @@ static void tgl_dc3co_exitline_compute_config(struct intel_encoder *encoder,
 	exit_scanlines =
 		intel_usecs_to_scanlines(&cstate->hw.adjusted_mode, 200) + 1;
 
-	if (WARN_ON(exit_scanlines > crtc_vdisplay))
+	if (dev_WARN_ON(dev, exit_scanlines > crtc_vdisplay))
 		return;
 
 	cstate->dc3co_exitline = crtc_vdisplay - exit_scanlines;
@@ -3595,13 +3617,14 @@ static void hsw_ddi_pre_enable_dp(struct intel_encoder *encoder,
 {
 	struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum port port = encoder->port;
 	enum phy phy = intel_port_to_phy(dev_priv, port);
 	struct intel_digital_port *dig_port = enc_to_dig_port(&encoder->base);
 	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
 	int level = intel_ddi_dp_level(intel_dp);
 
-	WARN_ON(is_mst && (port == PORT_A || port == PORT_E));
+	dev_WARN_ON(dev, is_mst && (port == PORT_A || port == PORT_E));
 
 	intel_dp_set_link_params(intel_dp, crtc_state->port_clock,
 				 crtc_state->lane_count, is_mst);
@@ -3729,6 +3752,7 @@ static void intel_ddi_pre_enable(struct intel_encoder *encoder,
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -3744,7 +3768,7 @@ static void intel_ddi_pre_enable(struct intel_encoder *encoder,
 	 *   the DP link parameteres
 	 */
 
-	WARN_ON(crtc_state->has_pch_encoder);
+	dev_WARN_ON(dev, crtc_state->has_pch_encoder);
 
 	if (INTEL_GEN(dev_priv) >= 11)
 		icl_map_plls_to_ports(encoder, crtc_state);
@@ -4010,6 +4034,7 @@ static i915_reg_t
 gen9_chicken_trans_reg_by_port(struct drm_i915_private *dev_priv,
 			       enum port port)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	static const enum transcoder trans[] = {
 		[PORT_A] = TRANSCODER_EDP,
 		[PORT_B] = TRANSCODER_A,
@@ -4018,9 +4043,9 @@ gen9_chicken_trans_reg_by_port(struct drm_i915_private *dev_priv,
 		[PORT_E] = TRANSCODER_A,
 	};
 
-	WARN_ON(INTEL_GEN(dev_priv) < 9);
+	dev_WARN_ON(dev, INTEL_GEN(dev_priv) < 9);
 
-	if (WARN_ON(port < PORT_A || port > PORT_E))
+	if (dev_WARN_ON(dev, port < PORT_A || port > PORT_E))
 		port = PORT_A;
 
 	return CHICKEN_TRANS(trans[port]);
@@ -4334,12 +4359,13 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 			  struct intel_crtc_state *pipe_config)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *intel_crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	enum transcoder cpu_transcoder = pipe_config->cpu_transcoder;
 	u32 temp, flags = 0;
 
 	/* XXX: DSI transcoder paranoia */
-	if (WARN_ON(transcoder_is_dsi(cpu_transcoder)))
+	if (dev_WARN_ON(dev, transcoder_is_dsi(cpu_transcoder)))
 		return;
 
 	intel_dsc_get_config(encoder, pipe_config);
@@ -4610,6 +4636,7 @@ static int intel_hdmi_reset_link(struct intel_encoder *encoder,
 				 struct drm_modeset_acquire_ctx *ctx)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_hdmi *hdmi = enc_to_intel_hdmi(&encoder->base);
 	struct intel_connector *connector = hdmi->attached_connector;
 	struct i2c_adapter *adapter =
@@ -4640,7 +4667,7 @@ static int intel_hdmi_reset_link(struct intel_encoder *encoder,
 
 	crtc_state = to_intel_crtc_state(crtc->base.state);
 
-	WARN_ON(!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI));
+	dev_WARN_ON(dev, !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI));
 
 	if (!crtc_state->hw.active)
 		return 0;
@@ -4810,6 +4837,7 @@ intel_ddi_max_lanes(struct intel_digital_port *intel_dport)
 
 void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct ddi_vbt_port_info *port_info =
 		&dev_priv->vbt.ddi_port_info[port];
 	struct intel_digital_port *intel_dig_port;
@@ -4888,7 +4916,7 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
 		encoder->update_complete = intel_ddi_update_complete;
 	}
 
-	WARN_ON(port > PORT_I);
+	dev_WARN_ON(dev, port > PORT_I);
 	intel_dig_port->ddi_io_power_domain = POWER_DOMAIN_PORT_DDI_A_IO +
 					      port - PORT_A;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 817f49425bfb..ab1fac1abf37 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -197,15 +197,16 @@ int vlv_get_hpll_vco(struct drm_i915_private *dev_priv)
 int vlv_get_cck_clock(struct drm_i915_private *dev_priv,
 		      const char *name, u32 reg, int ref_freq)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 val;
 	int divider;
 
 	val = vlv_cck_read(dev_priv, reg);
 	divider = val & CCK_FREQUENCY_VALUES;
 
-	WARN((val & CCK_FREQUENCY_STATUS) !=
-	     (divider << CCK_FREQUENCY_STATUS_SHIFT),
-	     "%s change in progress\n", name);
+	dev_WARN(dev, (val & CCK_FREQUENCY_STATUS) !=
+		 (divider << CCK_FREQUENCY_STATUS_SHIFT),
+		 "%s change in progress\n", name);
 
 	return DIV_ROUND_CLOSEST(ref_freq << 1, divider + 1);
 }
@@ -1089,6 +1090,7 @@ intel_wait_for_pipe_off(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 
 	if (INTEL_GEN(dev_priv) >= 4) {
 		enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
@@ -1097,7 +1099,7 @@ intel_wait_for_pipe_off(const struct intel_crtc_state *old_crtc_state)
 		/* Wait for the Pipe State to go off */
 		if (intel_de_wait_for_clear(dev_priv, reg,
 					    I965_PIPECONF_ACTIVE, 100))
-			WARN(1, "pipe_off wait timed out\n");
+			dev_WARN(dev, 1, "pipe_off wait timed out\n");
 	} else {
 		intel_wait_for_pipe_scanline_stopped(crtc);
 	}
@@ -1206,12 +1208,13 @@ void assert_fdi_rx_pll(struct drm_i915_private *dev_priv,
 
 void assert_panel_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	i915_reg_t pp_reg;
 	u32 val;
 	enum pipe panel_pipe = INVALID_PIPE;
 	bool locked = true;
 
-	if (WARN_ON(HAS_DDI(dev_priv)))
+	if (dev_WARN_ON(dev, HAS_DDI(dev_priv)))
 		return;
 
 	if (HAS_PCH_SPLIT(dev_priv)) {
@@ -1247,7 +1250,7 @@ void assert_panel_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 		pp_reg = PP_CONTROL(0);
 		port_sel = I915_READ(PP_ON_DELAYS(0)) & PANEL_PORT_SELECT_MASK;
 
-		WARN_ON(port_sel != PANEL_PORT_SELECT_LVDS);
+		dev_WARN_ON(dev, port_sel != PANEL_PORT_SELECT_LVDS);
 		intel_lvds_port_enabled(dev_priv, LVDS, &panel_pipe);
 	}
 
@@ -1460,6 +1463,7 @@ static void chv_enable_pll(struct intel_crtc *crtc,
 			   const struct intel_crtc_state *pipe_config)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = crtc->pipe;
 
 	assert_pipe_disabled(dev_priv, pipe_config->cpu_transcoder);
@@ -1486,7 +1490,8 @@ static void chv_enable_pll(struct intel_crtc *crtc,
 		 * DPLLB VGA mode also seems to cause problems.
 		 * We should always have it disabled.
 		 */
-		WARN_ON((I915_READ(DPLL(PIPE_B)) & DPLL_VGA_MODE_DIS) == 0);
+		dev_WARN_ON(dev,
+			    (I915_READ(DPLL(PIPE_B)) & DPLL_VGA_MODE_DIS) == 0);
 	} else {
 		I915_WRITE(DPLL_MD(pipe), pipe_config->dpll_hw_state.dpll_md);
 		POSTING_READ(DPLL_MD(pipe));
@@ -1610,6 +1615,7 @@ void vlv_wait_port_ready(struct drm_i915_private *dev_priv,
 			 struct intel_digital_port *dport,
 			 unsigned int expected_mask)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 port_mask;
 	i915_reg_t dpll_reg;
 
@@ -1633,9 +1639,10 @@ void vlv_wait_port_ready(struct drm_i915_private *dev_priv,
 
 	if (intel_de_wait_for_register(dev_priv, dpll_reg,
 				       port_mask, expected_mask, 1000))
-		WARN(1, "timed out waiting for [ENCODER:%d:%s] port ready: got 0x%x, expected 0x%x\n",
-		     dport->base.base.base.id, dport->base.base.name,
-		     I915_READ(dpll_reg) & port_mask, expected_mask);
+		dev_WARN(dev, 1,
+			 "timed out waiting for [ENCODER:%d:%s] port ready: got 0x%x, expected 0x%x\n",
+			 dport->base.base.base.id, dport->base.base.name,
+			 I915_READ(dpll_reg) & port_mask, expected_mask);
 }
 
 static void ilk_enable_pch_transcoder(const struct intel_crtc_state *crtc_state)
@@ -1836,6 +1843,7 @@ static void intel_enable_pipe(const struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -1872,7 +1880,7 @@ static void intel_enable_pipe(const struct intel_crtc_state *new_crtc_state)
 	val = I915_READ(reg);
 	if (val & PIPECONF_ENABLE) {
 		/* we keep both pipes enabled on 830 */
-		WARN_ON(!IS_I830(dev_priv));
+		dev_WARN_ON(dev, !IS_I830(dev_priv));
 		return;
 	}
 
@@ -2361,9 +2369,10 @@ static u32 intel_adjust_aligned_offset(int *x, int *y,
 				       u32 old_offset, u32 new_offset)
 {
 	struct drm_i915_private *dev_priv = to_i915(fb->dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	unsigned int cpp = fb->format->cpp[color_plane];
 
-	WARN_ON(new_offset > old_offset);
+	dev_WARN_ON(dev, new_offset > old_offset);
 
 	if (!is_surface_linear(fb, color_plane)) {
 		unsigned int tile_size, tile_width, tile_height;
@@ -3058,6 +3067,7 @@ intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv =
 		to_i915(plane_state->uapi.plane->dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct drm_framebuffer *fb = plane_state->hw.fb;
 	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
 	struct intel_rotation_info *info = &plane_state->view.rotated;
@@ -3077,7 +3087,7 @@ intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 	src_w = drm_rect_width(&plane_state->uapi.src) >> 16;
 	src_h = drm_rect_height(&plane_state->uapi.src) >> 16;
 
-	WARN_ON(is_ccs_modifier(fb->modifier));
+	dev_WARN_ON(dev, is_ccs_modifier(fb->modifier));
 
 	/* Make src coordinates relative to the viewport */
 	drm_rect_translate(&plane_state->uapi.src,
@@ -3118,7 +3128,7 @@ intel_plane_remap_gtt(struct intel_plane_state *plane_state)
 						      DRM_MODE_ROTATE_0, tile_size);
 		offset /= tile_size;
 
-		WARN_ON(i >= ARRAY_SIZE(info->plane));
+		dev_WARN_ON(dev, i >= ARRAY_SIZE(info->plane));
 		info->plane[i].offset = offset;
 		info->plane[i].stride = DIV_ROUND_UP(fb->pitches[i],
 						     tile_width * cpp);
@@ -5386,6 +5396,7 @@ static void lpt_program_iclkip(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	int clock = crtc_state->hw.adjusted_mode.crtc_clock;
 	u32 divsel, phaseinc, auxdiv, phasedir = 0;
 	u32 temp;
@@ -5417,10 +5428,10 @@ static void lpt_program_iclkip(const struct intel_crtc_state *crtc_state)
 	}
 
 	/* This should not happen with any sane values */
-	WARN_ON(SBI_SSCDIVINTPHASE_DIVSEL(divsel) &
-		~SBI_SSCDIVINTPHASE_DIVSEL_MASK);
-	WARN_ON(SBI_SSCDIVINTPHASE_DIR(phasedir) &
-		~SBI_SSCDIVINTPHASE_INCVAL_MASK);
+	dev_WARN_ON(dev, SBI_SSCDIVINTPHASE_DIVSEL(divsel) &
+		    ~SBI_SSCDIVINTPHASE_DIVSEL_MASK);
+	dev_WARN_ON(dev, SBI_SSCDIVINTPHASE_DIR(phasedir) &
+		    ~SBI_SSCDIVINTPHASE_INCVAL_MASK);
 
 	DRM_DEBUG_KMS("iCLKIP clock: found settings for %dKHz refresh rate: auxdiv=%x, divsel=%x, phasedir=%x, phaseinc=%x\n",
 			clock,
@@ -5523,14 +5534,15 @@ static void ilk_pch_transcoder_set_timings(const struct intel_crtc_state *crtc_s
 
 static void cpt_set_fdi_bc_bifurcation(struct drm_i915_private *dev_priv, bool enable)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 temp;
 
 	temp = I915_READ(SOUTH_CHICKEN1);
 	if (!!(temp & FDI_BC_BIFURCATION_SELECT) == enable)
 		return;
 
-	WARN_ON(I915_READ(FDI_RX_CTL(PIPE_B)) & FDI_RX_ENABLE);
-	WARN_ON(I915_READ(FDI_RX_CTL(PIPE_C)) & FDI_RX_ENABLE);
+	dev_WARN_ON(dev, I915_READ(FDI_RX_CTL(PIPE_B)) & FDI_RX_ENABLE);
+	dev_WARN_ON(dev, I915_READ(FDI_RX_CTL(PIPE_C)) & FDI_RX_ENABLE);
 
 	temp &= ~FDI_BC_BIFURCATION_SELECT;
 	if (enable)
@@ -6015,6 +6027,7 @@ static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = crtc->pipe;
 	const struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
@@ -6024,7 +6037,7 @@ static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 		int pfit_w, pfit_h, hscale, vscale;
 		int id;
 
-		if (WARN_ON(crtc_state->scaler_state.scaler_id < 0))
+		if (dev_WARN_ON(dev, crtc_state->scaler_state.scaler_id < 0))
 			return;
 
 		pfit_w = (crtc_state->pch_pfit.size >> 16) & 0xFFFF;
@@ -6639,9 +6652,10 @@ static void ilk_crtc_enable(struct intel_atomic_state *state,
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = crtc->pipe;
 
-	if (WARN_ON(crtc->active))
+	if (dev_WARN_ON(dev, crtc->active))
 		return;
 
 	/*
@@ -6783,11 +6797,12 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = crtc->pipe, hsw_workaround_pipe;
 	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	bool psl_clkgate_wa;
 
-	if (WARN_ON(crtc->active))
+	if (dev_WARN_ON(dev, crtc->active))
 		return;
 
 	intel_encoders_pre_pll_enable(state, crtc);
@@ -6972,6 +6987,7 @@ static void i9xx_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 
 	if (!crtc_state->gmch_pfit.control)
 		return;
@@ -6980,7 +6996,7 @@ static void i9xx_pfit_enable(const struct intel_crtc_state *crtc_state)
 	 * The panel fitter should only be adjusted whilst the pipe is disabled,
 	 * according to register description and PRM.
 	 */
-	WARN_ON(I915_READ(PFIT_CONTROL) & PFIT_ENABLE);
+	dev_WARN_ON(dev, I915_READ(PFIT_CONTROL) & PFIT_ENABLE);
 	assert_pipe_disabled(dev_priv, crtc_state->cpu_transcoder);
 
 	I915_WRITE(PFIT_PGM_RATIOS, crtc_state->gmch_pfit.pgm_ratios);
@@ -7173,9 +7189,10 @@ static void valleyview_crtc_enable(struct intel_atomic_state *state,
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = crtc->pipe;
 
-	if (WARN_ON(crtc->active))
+	if (dev_WARN_ON(dev, crtc->active))
 		return;
 
 	if (intel_crtc_has_dp_encoder(new_crtc_state))
@@ -7237,9 +7254,10 @@ static void i9xx_crtc_enable(struct intel_atomic_state *state,
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = crtc->pipe;
 
-	if (WARN_ON(crtc->active))
+	if (dev_WARN_ON(dev, crtc->active))
 		return;
 
 	i9xx_set_pll_dividers(new_crtc_state);
@@ -7346,6 +7364,7 @@ static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 {
 	struct intel_encoder *encoder;
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_bw_state *bw_state =
 		to_intel_bw_state(dev_priv->bw_obj.state);
 	struct intel_crtc_state *crtc_state =
@@ -7382,7 +7401,7 @@ static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 	temp_crtc_state = intel_atomic_get_crtc_state(state, crtc);
 	ret = drm_atomic_add_affected_connectors(state, &crtc->base);
 
-	WARN_ON(IS_ERR(temp_crtc_state) || ret);
+	dev_WARN_ON(dev, IS_ERR(temp_crtc_state) || ret);
 
 	dev_priv->display.crtc_disable(to_intel_atomic_state(state), crtc);
 
@@ -7394,7 +7413,8 @@ static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 	crtc->active = false;
 	crtc->base.enabled = false;
 
-	WARN_ON(drm_atomic_set_mode_for_crtc(&crtc_state->uapi, NULL) < 0);
+	dev_WARN_ON(dev,
+		    drm_atomic_set_mode_for_crtc(&crtc_state->uapi, NULL) < 0);
 	crtc_state->uapi.active = false;
 	crtc_state->uapi.connector_mask = 0;
 	crtc_state->uapi.encoder_mask = 0;
@@ -9061,13 +9081,14 @@ static enum intel_output_format
 bdw_get_pipemisc_output_format(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 tmp;
 
 	tmp = I915_READ(PIPEMISC(crtc->pipe));
 
 	if (tmp & PIPEMISC_YUV420_ENABLE) {
 		/* We support 4:2:0 in full blend mode only */
-		WARN_ON((tmp & PIPEMISC_YUV420_MODE_FULL_BLEND) == 0);
+		dev_WARN_ON(dev, (tmp & PIPEMISC_YUV420_MODE_FULL_BLEND) == 0);
 
 		return INTEL_OUTPUT_FORMAT_YCBCR420;
 	} else if (tmp & PIPEMISC_OUTPUT_COLORSPACE_YUV) {
@@ -9486,12 +9507,14 @@ static void lpt_program_fdi_mphy(struct drm_i915_private *dev_priv)
 static void lpt_enable_clkout_dp(struct drm_i915_private *dev_priv,
 				 bool with_spread, bool with_fdi)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 reg, tmp;
 
-	if (WARN(with_fdi && !with_spread, "FDI requires downspread\n"))
+	if (dev_WARN(dev, with_fdi && !with_spread,
+		     "FDI requires downspread\n"))
 		with_spread = true;
-	if (WARN(HAS_PCH_LPT_LP(dev_priv) &&
-	    with_fdi, "LP PCH doesn't have FDI\n"))
+	if (dev_WARN(dev, HAS_PCH_LPT_LP(dev_priv) &&
+		     with_fdi, "LP PCH doesn't have FDI\n"))
 		with_fdi = false;
 
 	mutex_lock(&dev_priv->sb_lock);
@@ -9582,13 +9605,14 @@ static const u16 sscdivintphase[] = {
  */
 static void lpt_bend_clkout_dp(struct drm_i915_private *dev_priv, int steps)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 tmp;
 	int idx = BEND_IDX(steps);
 
-	if (WARN_ON(steps % 5 != 0))
+	if (dev_WARN_ON(dev, steps % 5 != 0))
 		return;
 
-	if (WARN_ON(idx >= ARRAY_SIZE(sscdivintphase)))
+	if (dev_WARN_ON(dev, idx >= ARRAY_SIZE(sscdivintphase)))
 		return;
 
 	mutex_lock(&dev_priv->sb_lock);
@@ -9721,6 +9745,7 @@ static void ilk_set_pipeconf(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = crtc->pipe;
 	u32 val;
 
@@ -9756,8 +9781,8 @@ static void ilk_set_pipeconf(const struct intel_crtc_state *crtc_state)
 	 * This would end up with an odd purple hue over
 	 * the entire display. Make sure we don't do it.
 	 */
-	WARN_ON(crtc_state->limited_color_range &&
-		crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
+	dev_WARN_ON(dev, crtc_state->limited_color_range &&
+		    crtc_state->output_format != INTEL_OUTPUT_FORMAT_RGB);
 
 	if (crtc_state->limited_color_range)
 		val |= PIPECONF_COLOR_RANGE_SELECT;
@@ -10434,13 +10459,14 @@ static int hsw_crtc_compute_clock(struct intel_crtc *crtc,
 static void cnl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 			    struct intel_crtc_state *pipe_config)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum intel_dpll_id id;
 	u32 temp;
 
 	temp = I915_READ(DPCLKA_CFGCR0) & DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(port);
 	id = temp >> DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(port);
 
-	if (WARN_ON(id < SKL_DPLL0 || id > SKL_DPLL2))
+	if (dev_WARN_ON(dev, id < SKL_DPLL0 || id > SKL_DPLL2))
 		return;
 
 	pipe_config->shared_dpll = intel_get_shared_dpll_by_id(dev_priv, id);
@@ -10449,6 +10475,7 @@ static void cnl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 static void icl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 			    struct intel_crtc_state *pipe_config)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum phy phy = intel_port_to_phy(dev_priv, port);
 	enum icl_port_dpll_id port_dpll_id;
 	enum intel_dpll_id id;
@@ -10467,12 +10494,12 @@ static void icl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 								    port));
 			port_dpll_id = ICL_PORT_DPLL_MG_PHY;
 		} else {
-			WARN_ON(clk_sel < DDI_CLK_SEL_TBT_162);
+			dev_WARN_ON(dev, clk_sel < DDI_CLK_SEL_TBT_162);
 			id = DPLL_ID_ICL_TBTPLL;
 			port_dpll_id = ICL_PORT_DPLL_DEFAULT;
 		}
 	} else {
-		WARN(1, "Invalid port %x\n", port);
+		dev_WARN(dev, 1, "Invalid port %x\n", port);
 		return;
 	}
 
@@ -10509,13 +10536,14 @@ static void bxt_get_ddi_pll(struct drm_i915_private *dev_priv,
 static void skl_get_ddi_pll(struct drm_i915_private *dev_priv, enum port port,
 			    struct intel_crtc_state *pipe_config)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum intel_dpll_id id;
 	u32 temp;
 
 	temp = I915_READ(DPLL_CTRL2) & DPLL_CTRL2_DDI_CLK_SEL_MASK(port);
 	id = temp >> (port * 3 + 1);
 
-	if (WARN_ON(id < SKL_DPLL0 || id > SKL_DPLL3))
+	if (dev_WARN_ON(dev, id < SKL_DPLL0 || id > SKL_DPLL3))
 		return;
 
 	pipe_config->shared_dpll = intel_get_shared_dpll_by_id(dev_priv, id);
@@ -10717,6 +10745,7 @@ static void hsw_get_ddi_port_state(struct intel_crtc *crtc,
 				   struct intel_crtc_state *pipe_config)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum transcoder cpu_transcoder = pipe_config->cpu_transcoder;
 	struct intel_shared_dpll *pll;
 	enum port port;
@@ -10746,8 +10775,8 @@ static void hsw_get_ddi_port_state(struct intel_crtc *crtc,
 
 	pll = pipe_config->shared_dpll;
 	if (pll) {
-		WARN_ON(!pll->info->funcs->get_hw_state(dev_priv, pll,
-						&pipe_config->dpll_hw_state));
+		dev_WARN_ON(dev, !pll->info->funcs->get_hw_state(dev_priv, pll,
+								 &pipe_config->dpll_hw_state));
 	}
 
 	/*
@@ -10788,6 +10817,7 @@ static enum transcoder transcoder_master_readout(struct drm_i915_private *dev_pr
 static void icl_get_trans_port_sync_config(struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 transcoders;
 	enum transcoder cpu_transcoder;
 
@@ -10816,14 +10846,16 @@ static void icl_get_trans_port_sync_config(struct intel_crtc_state *crtc_state)
 		intel_display_power_put(dev_priv, power_domain, trans_wakeref);
 	}
 
-	WARN_ON(crtc_state->master_transcoder != INVALID_TRANSCODER &&
-		crtc_state->sync_mode_slaves_mask);
+	dev_WARN_ON(dev,
+		    crtc_state->master_transcoder != INVALID_TRANSCODER &&
+		    crtc_state->sync_mode_slaves_mask);
 }
 
 static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 				struct intel_crtc_state *pipe_config)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	intel_wakeref_t wakerefs[POWER_DOMAIN_NUM], wf;
 	enum intel_display_power_domain power_domain;
 	u64 power_domain_mask;
@@ -10847,7 +10879,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 	if (IS_GEN9_LP(dev_priv) &&
 	    bxt_get_dsi_transcoder_state(crtc, pipe_config,
 					 &power_domain_mask, wakerefs)) {
-		WARN_ON(active);
+		dev_WARN_ON(dev, active);
 		active = true;
 	}
 
@@ -10905,7 +10937,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 	intel_color_get_config(pipe_config);
 
 	power_domain = POWER_DOMAIN_PIPE_PANEL_FITTER(crtc->pipe);
-	WARN_ON(power_domain_mask & BIT_ULL(power_domain));
+	dev_WARN_ON(dev, power_domain_mask & BIT_ULL(power_domain));
 
 	wf = intel_display_power_get_if_enabled(dev_priv, power_domain);
 	if (wf) {
@@ -11342,6 +11374,7 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	enum pipe pipe = plane->pipe;
 	int ret;
@@ -11362,8 +11395,8 @@ static int i9xx_check_cursor(struct intel_crtc_state *crtc_state,
 		return -EINVAL;
 	}
 
-	WARN_ON(plane_state->uapi.visible &&
-		plane_state->color_plane[0].stride != fb->pitches[0]);
+	dev_WARN_ON(dev, plane_state->uapi.visible &&
+		    plane_state->color_plane[0].stride != fb->pitches[0]);
 
 	if (fb->pitches[0] !=
 	    drm_rect_width(&plane_state->uapi.dst) * fb->format->cpp[0]) {
@@ -12001,6 +12034,7 @@ int intel_plane_atomic_calc_changes(const struct intel_crtc_state *old_crtc_stat
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	bool mode_changed = needs_modeset(crtc_state);
 	bool was_crtc_enabled = old_crtc_state->hw.active;
 	bool is_crtc_enabled = crtc_state->hw.active;
@@ -12016,7 +12050,7 @@ int intel_plane_atomic_calc_changes(const struct intel_crtc_state *old_crtc_stat
 	was_visible = old_plane_state->uapi.visible;
 	visible = plane_state->uapi.visible;
 
-	if (!was_crtc_enabled && WARN_ON(was_visible))
+	if (!was_crtc_enabled && dev_WARN_ON(dev, was_visible))
 		was_visible = false;
 
 	/*
@@ -12360,6 +12394,7 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	bool mode_changed = needs_modeset(crtc_state);
@@ -12371,7 +12406,7 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 
 	if (mode_changed && crtc_state->hw.enable &&
 	    dev_priv->display.crtc_compute_clock &&
-	    !WARN_ON(crtc_state->shared_dpll)) {
+	    !dev_WARN_ON(dev, crtc_state->shared_dpll)) {
 		ret = dev_priv->display.crtc_compute_clock(crtc, crtc_state);
 		if (ret)
 			return ret;
@@ -12401,7 +12436,7 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 	}
 
 	if (dev_priv->display.compute_intermediate_wm) {
-		if (WARN_ON(!dev_priv->display.compute_pipe_wm))
+		if (dev_WARN_ON(dev, !dev_priv->display.compute_pipe_wm))
 			return 0;
 
 		/*
@@ -13549,6 +13584,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 static void intel_pipe_config_sanity_check(struct drm_i915_private *dev_priv,
 					   const struct intel_crtc_state *pipe_config)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	if (pipe_config->has_pch_encoder) {
 		int fdi_dotclock = intel_dotclock_calculate(intel_fdi_link_freq(dev_priv, pipe_config),
 							    &pipe_config->fdi_m_n);
@@ -13558,9 +13594,10 @@ static void intel_pipe_config_sanity_check(struct drm_i915_private *dev_priv,
 		 * FDI already provided one idea for the dotclock.
 		 * Yell if the encoder disagrees.
 		 */
-		WARN(!intel_fuzzy_clock_check(fdi_dotclock, dotclock),
-		     "FDI dotclock and encoder dotclock mismatch, fdi: %i, encoder: %i\n",
-		     fdi_dotclock, dotclock);
+		dev_WARN(dev,
+			 !intel_fuzzy_clock_check(fdi_dotclock, dotclock),
+			 "FDI dotclock and encoder dotclock mismatch, fdi: %i, encoder: %i\n",
+			 fdi_dotclock, dotclock);
 	}
 }
 
@@ -14622,9 +14659,11 @@ static void intel_update_crtc(struct intel_crtc *crtc,
 static struct intel_crtc *intel_get_slave_crtc(const struct intel_crtc_state *new_crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(new_crtc_state->uapi.crtc->dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum transcoder slave_transcoder;
 
-	WARN_ON(!is_power_of_2(new_crtc_state->sync_mode_slaves_mask));
+	dev_WARN_ON(dev,
+		    !is_power_of_2(new_crtc_state->sync_mode_slaves_mask));
 
 	slave_transcoder = ffs(new_crtc_state->sync_mode_slaves_mask) - 1;
 	return intel_get_crtc_for_pipe(dev_priv,
@@ -14832,6 +14871,7 @@ static void intel_update_trans_port_sync_crtcs(struct intel_crtc *crtc,
 static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 {
 	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *crtc;
 	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
 	u8 hw_enabled_slices = dev_priv->wm.skl_hw.ddb.enabled_slices;
@@ -14913,8 +14953,8 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 		    is_trans_port_sync_slave(new_crtc_state))
 			continue;
 
-		WARN_ON(skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
-						    entries, num_pipes, i));
+		dev_WARN_ON(dev, skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
+							     entries, num_pipes, i));
 
 		entries[i] = new_crtc_state->wm.skl.ddb;
 		modeset_pipes &= ~BIT(pipe);
@@ -14948,8 +14988,8 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 		if ((modeset_pipes & BIT(pipe)) == 0)
 			continue;
 
-		WARN_ON(skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
-						    entries, num_pipes, i));
+		dev_WARN_ON(dev, skl_ddb_allocation_overlaps(&new_crtc_state->wm.skl.ddb,
+							     entries, num_pipes, i));
 
 		entries[i] = new_crtc_state->wm.skl.ddb;
 		modeset_pipes &= ~BIT(pipe);
@@ -14957,7 +14997,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 		intel_update_crtc(crtc, state, old_crtc_state, new_crtc_state);
 	}
 
-	WARN_ON(modeset_pipes);
+	dev_WARN_ON(dev, modeset_pipes);
 
 	/* If 2nd DBuf slice is no more required disable it */
 	if (INTEL_GEN(dev_priv) >= 11 && required_slices < hw_enabled_slices)
@@ -16127,6 +16167,7 @@ static void intel_crtc_free(struct intel_crtc *crtc)
 
 static int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_plane *primary, *cursor;
 	const struct drm_crtc_funcs *funcs;
 	struct intel_crtc *crtc;
@@ -16203,7 +16244,7 @@ static int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 
 	intel_color_init(crtc);
 
-	WARN_ON(drm_crtc_index(&crtc->base) != crtc->pipe);
+	dev_WARN_ON(dev, drm_crtc_index(&crtc->base) != crtc->pipe);
 
 	return 0;
 
@@ -17326,6 +17367,7 @@ int intel_modeset_init(struct drm_i915_private *i915)
 
 void i830_enable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *crtc = intel_get_crtc_for_pipe(dev_priv, pipe);
 	/* 640x480@60Hz, ~25175 kHz */
 	struct dpll clock = {
@@ -17338,7 +17380,7 @@ void i830_enable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 	u32 dpll, fp;
 	int i;
 
-	WARN_ON(i9xx_calc_dpll_params(48000, &clock) != 25154);
+	dev_WARN_ON(dev, i9xx_calc_dpll_params(48000, &clock) != 25154);
 
 	DRM_DEBUG_KMS("enabling pipe %c due to force quirk (vco=%d dot=%d)\n",
 		      pipe_name(pipe), clock.vco, clock.dot);
@@ -17396,16 +17438,17 @@ void i830_enable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 
 void i830_disable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *crtc = intel_get_crtc_for_pipe(dev_priv, pipe);
 
 	DRM_DEBUG_KMS("disabling pipe %c due to force quirk\n",
 		      pipe_name(pipe));
 
-	WARN_ON(I915_READ(DSPCNTR(PLANE_A)) & DISPLAY_PLANE_ENABLE);
-	WARN_ON(I915_READ(DSPCNTR(PLANE_B)) & DISPLAY_PLANE_ENABLE);
-	WARN_ON(I915_READ(DSPCNTR(PLANE_C)) & DISPLAY_PLANE_ENABLE);
-	WARN_ON(I915_READ(CURCNTR(PIPE_A)) & MCURSOR_MODE);
-	WARN_ON(I915_READ(CURCNTR(PIPE_B)) & MCURSOR_MODE);
+	dev_WARN_ON(dev, I915_READ(DSPCNTR(PLANE_A)) & DISPLAY_PLANE_ENABLE);
+	dev_WARN_ON(dev, I915_READ(DSPCNTR(PLANE_B)) & DISPLAY_PLANE_ENABLE);
+	dev_WARN_ON(dev, I915_READ(DSPCNTR(PLANE_C)) & DISPLAY_PLANE_ENABLE);
+	dev_WARN_ON(dev, I915_READ(CURCNTR(PIPE_A)) & MCURSOR_MODE);
+	dev_WARN_ON(dev, I915_READ(CURCNTR(PIPE_B)) & MCURSOR_MODE);
 
 	I915_WRITE(PIPECONF(pipe), 0);
 	POSTING_READ(PIPECONF(pipe));
@@ -18169,11 +18212,12 @@ static void intel_hpd_poll_fini(struct drm_i915_private *i915)
 
 void intel_modeset_driver_remove(struct drm_i915_private *i915)
 {
+	struct device *dev = i915_to_dev(i915);
 	flush_workqueue(i915->flip_wq);
 	flush_workqueue(i915->modeset_wq);
 
 	flush_work(&i915->atomic_helper.free_work);
-	WARN_ON(!llist_empty(&i915->atomic_helper.free_list));
+	dev_WARN_ON(dev, !llist_empty(&i915->atomic_helper.free_list));
 
 	/*
 	 * Interrupts and polling as the first thing to avoid creating havoc.
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 679457156797..ea1609fe8557 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -182,8 +182,11 @@ static void intel_power_well_get(struct drm_i915_private *dev_priv,
 static void intel_power_well_put(struct drm_i915_private *dev_priv,
 				 struct i915_power_well *power_well)
 {
-	WARN(!power_well->count, "Use count on power well %s is already zero",
-	     power_well->desc->name);
+	struct device *dev = i915_to_dev(dev_priv);
+
+	dev_WARN(dev, !power_well->count,
+		 "Use count on power well %s is already zero",
+		 power_well->desc->name);
 
 	if (!--power_well->count)
 		intel_power_well_disable(dev_priv, power_well);
@@ -283,6 +286,7 @@ static void hsw_power_well_pre_disable(struct drm_i915_private *dev_priv,
 static void hsw_wait_for_power_well_enable(struct drm_i915_private *dev_priv,
 					   struct i915_power_well *power_well)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct i915_power_well_regs *regs = power_well->desc->hsw.regs;
 	int pw_idx = power_well->desc->hsw.idx;
 
@@ -293,7 +297,7 @@ static void hsw_wait_for_power_well_enable(struct drm_i915_private *dev_priv,
 			      power_well->desc->name);
 
 		/* An AUX timeout is expected if the TBT DP tunnel is down. */
-		WARN_ON(!power_well->desc->hsw.is_tc_tbt);
+		dev_WARN_ON(dev, !power_well->desc->hsw.is_tc_tbt);
 	}
 }
 
@@ -344,9 +348,10 @@ static void hsw_wait_for_power_well_disable(struct drm_i915_private *dev_priv,
 static void gen9_wait_for_power_well_fuses(struct drm_i915_private *dev_priv,
 					   enum skl_power_gate pg)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	/* Timeout 5us for PG#0, for other PGs 1us */
-	WARN_ON(intel_de_wait_for_set(dev_priv, SKL_FUSE_STATUS,
-				      SKL_FUSE_PG_DIST_STATUS(pg), 1));
+	dev_WARN_ON(dev, intel_de_wait_for_set(dev_priv, SKL_FUSE_STATUS,
+					       SKL_FUSE_PG_DIST_STATUS(pg), 1));
 }
 
 static void hsw_power_well_enable(struct drm_i915_private *dev_priv,
@@ -414,12 +419,13 @@ static void
 icl_combo_phy_aux_power_well_enable(struct drm_i915_private *dev_priv,
 				    struct i915_power_well *power_well)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct i915_power_well_regs *regs = power_well->desc->hsw.regs;
 	int pw_idx = power_well->desc->hsw.idx;
 	enum phy phy = ICL_AUX_PW_TO_PHY(pw_idx);
 	u32 val;
 
-	WARN_ON(!IS_ICELAKE(dev_priv));
+	dev_WARN_ON(dev, !IS_ICELAKE(dev_priv));
 
 	val = I915_READ(regs->driver);
 	I915_WRITE(regs->driver, val | HSW_PWR_WELL_CTL_REQ(pw_idx));
@@ -444,12 +450,13 @@ static void
 icl_combo_phy_aux_power_well_disable(struct drm_i915_private *dev_priv,
 				     struct i915_power_well *power_well)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct i915_power_well_regs *regs = power_well->desc->hsw.regs;
 	int pw_idx = power_well->desc->hsw.idx;
 	enum phy phy = ICL_AUX_PW_TO_PHY(pw_idx);
 	u32 val;
 
-	WARN_ON(!IS_ICELAKE(dev_priv));
+	dev_WARN_ON(dev, !IS_ICELAKE(dev_priv));
 
 	val = I915_READ(ICL_PORT_CL_DW12(phy));
 	I915_WRITE(ICL_PORT_CL_DW12(phy), val & ~ICL_LANE_ENABLE_AUX);
@@ -482,10 +489,11 @@ static u64 async_put_domains_mask(struct i915_power_domains *power_domains);
 static int power_well_async_ref_count(struct drm_i915_private *dev_priv,
 				      struct i915_power_well *power_well)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	int refs = hweight64(power_well->desc->domains &
 			     async_put_domains_mask(&dev_priv->power_domains));
 
-	WARN_ON(refs > power_well->count);
+	dev_WARN_ON(dev, refs > power_well->count);
 
 	return refs;
 }
@@ -493,6 +501,7 @@ static int power_well_async_ref_count(struct drm_i915_private *dev_priv,
 static void icl_tc_port_assert_ref_held(struct drm_i915_private *dev_priv,
 					struct i915_power_well *power_well)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum aux_ch aux_ch = icl_tc_phy_aux_ch(dev_priv, power_well);
 	struct intel_digital_port *dig_port = NULL;
 	struct intel_encoder *encoder;
@@ -515,7 +524,7 @@ static void icl_tc_port_assert_ref_held(struct drm_i915_private *dev_priv,
 			continue;
 
 		dig_port = enc_to_dig_port(&encoder->base);
-		if (WARN_ON(!dig_port))
+		if (dev_WARN_ON(dev, !dig_port))
 			continue;
 
 		if (dig_port->aux_ch != aux_ch) {
@@ -526,10 +535,10 @@ static void icl_tc_port_assert_ref_held(struct drm_i915_private *dev_priv,
 		break;
 	}
 
-	if (WARN_ON(!dig_port))
+	if (dev_WARN_ON(dev, !dig_port))
 		return;
 
-	WARN_ON(!intel_tc_port_ref_held(dig_port));
+	dev_WARN_ON(dev, !intel_tc_port_ref_held(dig_port));
 }
 
 #else
@@ -613,15 +622,17 @@ static bool hsw_power_well_enabled(struct drm_i915_private *dev_priv,
 
 static void assert_can_enable_dc9(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE((I915_READ(DC_STATE_EN) & DC_STATE_EN_DC9),
-		  "DC9 already programmed to be enabled.\n");
-	WARN_ONCE(I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5,
-		  "DC5 still not disabled to enable DC9.\n");
-	WARN_ONCE(I915_READ(HSW_PWR_WELL_CTL2) &
-		  HSW_PWR_WELL_CTL_REQ(SKL_PW_CTL_IDX_PW_2),
-		  "Power well 2 on.\n");
-	WARN_ONCE(intel_irqs_enabled(dev_priv),
-		  "Interrupts not disabled yet.\n");
+	struct device *dev = i915_to_dev(dev_priv);
+
+	dev_WARN_ONCE(dev, (I915_READ(DC_STATE_EN) & DC_STATE_EN_DC9),
+		      "DC9 already programmed to be enabled.\n");
+	dev_WARN_ONCE(dev, I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5,
+		      "DC5 still not disabled to enable DC9.\n");
+	dev_WARN_ONCE(dev, I915_READ(HSW_PWR_WELL_CTL2) &
+		      HSW_PWR_WELL_CTL_REQ(SKL_PW_CTL_IDX_PW_2),
+		      "Power well 2 on.\n");
+	dev_WARN_ONCE(dev, intel_irqs_enabled(dev_priv),
+		      "Interrupts not disabled yet.\n");
 
 	 /*
 	  * TODO: check for the following to verify the conditions to enter DC9
@@ -634,10 +645,12 @@ static void assert_can_enable_dc9(struct drm_i915_private *dev_priv)
 
 static void assert_can_disable_dc9(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE(intel_irqs_enabled(dev_priv),
-		  "Interrupts not disabled yet.\n");
-	WARN_ONCE(I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5,
-		  "DC5 still not disabled.\n");
+	struct device *dev = i915_to_dev(dev_priv);
+
+	dev_WARN_ONCE(dev, intel_irqs_enabled(dev_priv),
+		      "Interrupts not disabled yet.\n");
+	dev_WARN_ONCE(dev, I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5,
+		      "DC5 still not disabled.\n");
 
 	 /*
 	  * TODO: check for the following to verify DC9 state was indeed
@@ -740,10 +753,11 @@ static void gen9_sanitize_dc_state(struct drm_i915_private *dev_priv)
  */
 static void gen9_set_dc_state(struct drm_i915_private *dev_priv, u32 state)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 val;
 	u32 mask;
 
-	if (WARN_ON_ONCE(state & ~dev_priv->csr.allowed_dc_mask))
+	if (dev_WARN_ON_ONCE(dev, state & ~dev_priv->csr.allowed_dc_mask))
 		state &= dev_priv->csr.allowed_dc_mask;
 
 	val = I915_READ(DC_STATE_EN);
@@ -838,16 +852,20 @@ static void bxt_disable_dc9(struct drm_i915_private *dev_priv)
 
 static void assert_csr_loaded(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE(!I915_READ(CSR_PROGRAM(0)),
-		  "CSR program storage start is NULL\n");
-	WARN_ONCE(!I915_READ(CSR_SSP_BASE), "CSR SSP Base Not fine\n");
-	WARN_ONCE(!I915_READ(CSR_HTP_SKL), "CSR HTP Not fine\n");
+	struct device *dev = i915_to_dev(dev_priv);
+
+	dev_WARN_ONCE(dev, !I915_READ(CSR_PROGRAM(0)),
+		      "CSR program storage start is NULL\n");
+	dev_WARN_ONCE(dev, !I915_READ(CSR_SSP_BASE),
+		      "CSR SSP Base Not fine\n");
+	dev_WARN_ONCE(dev, !I915_READ(CSR_HTP_SKL), "CSR HTP Not fine\n");
 }
 
 static struct i915_power_well *
 lookup_power_well(struct drm_i915_private *dev_priv,
 		  enum i915_power_well_id power_well_id)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct i915_power_well *power_well;
 
 	for_each_power_well(dev_priv, power_well)
@@ -861,7 +879,8 @@ lookup_power_well(struct drm_i915_private *dev_priv,
 	 * the first power well and hope the WARN gets reported so we can fix
 	 * our driver.
 	 */
-	WARN(1, "Power well %d not defined for this platform\n", power_well_id);
+	dev_WARN(dev, 1, "Power well %d not defined for this platform\n",
+		 power_well_id);
 	return &dev_priv->power_domains.power_wells[0];
 }
 
@@ -877,6 +896,7 @@ lookup_power_well(struct drm_i915_private *dev_priv,
 void intel_display_power_set_target_dc_state(struct drm_i915_private *dev_priv,
 					     u32 state)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct i915_power_well *power_well;
 	bool dc_off_enabled;
 	struct i915_power_domains *power_domains = &dev_priv->power_domains;
@@ -884,7 +904,7 @@ void intel_display_power_set_target_dc_state(struct drm_i915_private *dev_priv,
 	mutex_lock(&power_domains->lock);
 	power_well = lookup_power_well(dev_priv, SKL_DISP_DC_OFF);
 
-	if (WARN_ON(!power_well))
+	if (dev_WARN_ON(dev, !power_well))
 		goto unlock;
 
 	state = sanitize_target_dc_state(dev_priv, state);
@@ -912,13 +932,14 @@ void intel_display_power_set_target_dc_state(struct drm_i915_private *dev_priv,
 
 static void assert_can_enable_dc5(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	bool pg2_enabled = intel_display_power_well_is_enabled(dev_priv,
 					SKL_DISP_PW_2);
 
-	WARN_ONCE(pg2_enabled, "PG2 not disabled to enable DC5.\n");
+	dev_WARN_ONCE(dev, pg2_enabled, "PG2 not disabled to enable DC5.\n");
 
-	WARN_ONCE((I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5),
-		  "DC5 already programmed to be enabled.\n");
+	dev_WARN_ONCE(dev, (I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC5),
+		      "DC5 already programmed to be enabled.\n");
 	assert_rpm_wakelock_held(&dev_priv->runtime_pm);
 
 	assert_csr_loaded(dev_priv);
@@ -940,10 +961,12 @@ static void gen9_enable_dc5(struct drm_i915_private *dev_priv)
 
 static void assert_can_enable_dc6(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE(I915_READ(UTIL_PIN_CTL) & UTIL_PIN_ENABLE,
-		  "Backlight is not disabled.\n");
-	WARN_ONCE((I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC6),
-		  "DC6 already programmed to be enabled.\n");
+	struct device *dev = i915_to_dev(dev_priv);
+
+	dev_WARN_ONCE(dev, I915_READ(UTIL_PIN_CTL) & UTIL_PIN_ENABLE,
+		      "Backlight is not disabled.\n");
+	dev_WARN_ONCE(dev, (I915_READ(DC_STATE_EN) & DC_STATE_EN_UPTO_DC6),
+		      "DC6 already programmed to be enabled.\n");
 
 	assert_csr_loaded(dev_priv);
 }
@@ -1028,15 +1051,17 @@ static bool gen9_dc_off_power_well_enabled(struct drm_i915_private *dev_priv,
 
 static void gen9_assert_dbuf_enabled(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 tmp = I915_READ(DBUF_CTL);
 
-	WARN((tmp & (DBUF_POWER_STATE | DBUF_POWER_REQUEST)) !=
-	     (DBUF_POWER_STATE | DBUF_POWER_REQUEST),
-	     "Unexpected DBuf power power state (0x%08x)\n", tmp);
+	dev_WARN(dev, (tmp & (DBUF_POWER_STATE | DBUF_POWER_REQUEST)) !=
+		 (DBUF_POWER_STATE | DBUF_POWER_REQUEST),
+		 "Unexpected DBuf power power state (0x%08x)\n", tmp);
 }
 
 static void gen9_disable_dc_states(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_cdclk_state cdclk_state = {};
 
 	if (dev_priv->csr.target_dc_state == DC_STATE_EN_DC3CO) {
@@ -1048,7 +1073,8 @@ static void gen9_disable_dc_states(struct drm_i915_private *dev_priv)
 
 	dev_priv->display.get_cdclk(dev_priv, &cdclk_state);
 	/* Can't read out voltage_level so can't use intel_cdclk_changed() */
-	WARN_ON(intel_cdclk_needs_modeset(&dev_priv->cdclk.hw, &cdclk_state));
+	dev_WARN_ON(dev, intel_cdclk_needs_modeset(&dev_priv->cdclk.hw,
+						   &cdclk_state));
 
 	gen9_assert_dbuf_enabled(dev_priv);
 
@@ -1188,6 +1214,7 @@ static void vlv_power_well_disable(struct drm_i915_private *dev_priv,
 static bool vlv_power_well_enabled(struct drm_i915_private *dev_priv,
 				   struct i915_power_well *power_well)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	int pw_idx = power_well->desc->vlv.idx;
 	bool enabled = false;
 	u32 mask;
@@ -1204,8 +1231,8 @@ static bool vlv_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * We only ever set the power-on and power-gate states, anything
 	 * else is unexpected.
 	 */
-	WARN_ON(state != PUNIT_PWRGT_PWR_ON(pw_idx) &&
-		state != PUNIT_PWRGT_PWR_GATE(pw_idx));
+	dev_WARN_ON(dev, state != PUNIT_PWRGT_PWR_ON(pw_idx) &&
+		    state != PUNIT_PWRGT_PWR_GATE(pw_idx));
 	if (state == ctrl)
 		enabled = true;
 
@@ -1214,7 +1241,7 @@ static bool vlv_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * is poking at the power controls too.
 	 */
 	ctrl = vlv_punit_read(dev_priv, PUNIT_REG_PWRGT_CTRL) & mask;
-	WARN_ON(ctrl != state);
+	dev_WARN_ON(dev, ctrl != state);
 
 	vlv_punit_put(dev_priv);
 
@@ -1223,6 +1250,7 @@ static bool vlv_power_well_enabled(struct drm_i915_private *dev_priv,
 
 static void vlv_init_display_clock_gating(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 val;
 
 	/*
@@ -1242,7 +1270,7 @@ static void vlv_init_display_clock_gating(struct drm_i915_private *dev_priv)
 	I915_WRITE(MI_ARB_VLV, MI_ARB_DISPLAY_TRICKLE_FEED_DISABLE);
 	I915_WRITE(CBR1_VLV, 0);
 
-	WARN_ON(dev_priv->rawclk_freq == 0);
+	dev_WARN_ON(dev, dev_priv->rawclk_freq == 0);
 
 	I915_WRITE(RAWCLK_FREQ_VLV,
 		   DIV_ROUND_CLOSEST(dev_priv->rawclk_freq, 1000));
@@ -1477,12 +1505,14 @@ static void assert_chv_phy_status(struct drm_i915_private *dev_priv)
 static void chv_dpio_cmn_power_well_enable(struct drm_i915_private *dev_priv,
 					   struct i915_power_well *power_well)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum dpio_phy phy;
 	enum pipe pipe;
 	u32 tmp;
 
-	WARN_ON_ONCE(power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
-		     power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
+	dev_WARN_ON_ONCE(dev,
+			 power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
+			 power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
 
 	if (power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC) {
 		pipe = PIPE_A;
@@ -1538,10 +1568,12 @@ static void chv_dpio_cmn_power_well_enable(struct drm_i915_private *dev_priv,
 static void chv_dpio_cmn_power_well_disable(struct drm_i915_private *dev_priv,
 					    struct i915_power_well *power_well)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum dpio_phy phy;
 
-	WARN_ON_ONCE(power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
-		     power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
+	dev_WARN_ON_ONCE(dev,
+			 power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
+			 power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
 
 	if (power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC) {
 		phy = DPIO_PHY0;
@@ -1569,6 +1601,7 @@ static void chv_dpio_cmn_power_well_disable(struct drm_i915_private *dev_priv,
 static void assert_chv_phy_powergate(struct drm_i915_private *dev_priv, enum dpio_phy phy,
 				     enum dpio_channel ch, bool override, unsigned int mask)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = phy == DPIO_PHY0 ? PIPE_A : PIPE_C;
 	u32 reg, val, expected, actual;
 
@@ -1621,11 +1654,13 @@ static void assert_chv_phy_powergate(struct drm_i915_private *dev_priv, enum dpi
 		actual = val >> DPIO_ANYDL_POWERDOWN_SHIFT_CH1;
 	actual &= DPIO_ALLDL_POWERDOWN | DPIO_ANYDL_POWERDOWN;
 
-	WARN(actual != expected,
-	     "Unexpected DPIO lane power down: all %d, any %d. Expected: all %d, any %d. (0x%x = 0x%08x)\n",
-	     !!(actual & DPIO_ALLDL_POWERDOWN), !!(actual & DPIO_ANYDL_POWERDOWN),
-	     !!(expected & DPIO_ALLDL_POWERDOWN), !!(expected & DPIO_ANYDL_POWERDOWN),
-	     reg, val);
+	dev_WARN(dev, actual != expected,
+		 "Unexpected DPIO lane power down: all %d, any %d. Expected: all %d, any %d. (0x%x = 0x%08x)\n",
+		 !!(actual & DPIO_ALLDL_POWERDOWN),
+		 !!(actual & DPIO_ANYDL_POWERDOWN),
+		 !!(expected & DPIO_ALLDL_POWERDOWN),
+		 !!(expected & DPIO_ANYDL_POWERDOWN),
+		 reg, val);
 }
 
 bool chv_phy_powergate_ch(struct drm_i915_private *dev_priv, enum dpio_phy phy,
@@ -1692,6 +1727,7 @@ void chv_phy_powergate_lanes(struct intel_encoder *encoder,
 static bool chv_pipe_power_well_enabled(struct drm_i915_private *dev_priv,
 					struct i915_power_well *power_well)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = PIPE_A;
 	bool enabled;
 	u32 state, ctrl;
@@ -1703,7 +1739,9 @@ static bool chv_pipe_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * We only ever set the power-on and power-gate states, anything
 	 * else is unexpected.
 	 */
-	WARN_ON(state != DP_SSS_PWR_ON(pipe) && state != DP_SSS_PWR_GATE(pipe));
+	dev_WARN_ON(dev,
+		    state != DP_SSS_PWR_ON(pipe) &&
+		    state != DP_SSS_PWR_GATE(pipe));
 	enabled = state == DP_SSS_PWR_ON(pipe);
 
 	/*
@@ -1711,7 +1749,7 @@ static bool chv_pipe_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * is poking at the power controls too.
 	 */
 	ctrl = vlv_punit_read(dev_priv, PUNIT_REG_DSPSSPM) & DP_SSC_MASK(pipe);
-	WARN_ON(ctrl << 16 != state);
+	dev_WARN_ON(dev, ctrl << 16 != state);
 
 	vlv_punit_put(dev_priv);
 
@@ -1975,18 +2013,19 @@ static void
 __intel_display_power_put_domain(struct drm_i915_private *dev_priv,
 				 enum intel_display_power_domain domain)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct i915_power_domains *power_domains;
 	struct i915_power_well *power_well;
 	const char *name = intel_display_power_domain_str(domain);
 
 	power_domains = &dev_priv->power_domains;
 
-	WARN(!power_domains->domain_use_count[domain],
-	     "Use count on domain %s is already zero\n",
-	     name);
-	WARN(async_put_domains_mask(power_domains) & BIT_ULL(domain),
-	     "Async disabling of domain %s is pending\n",
-	     name);
+	dev_WARN(dev, !power_domains->domain_use_count[domain],
+		 "Use count on domain %s is already zero\n",
+		 name);
+	dev_WARN(dev, async_put_domains_mask(power_domains) & BIT_ULL(domain),
+		 "Async disabling of domain %s is pending\n",
+		 name);
 
 	power_domains->domain_use_count[domain]--;
 
@@ -2119,6 +2158,7 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 				     enum intel_display_power_domain domain,
 				     intel_wakeref_t wakeref)
 {
+	struct device *dev = i915_to_dev(i915);
 	struct i915_power_domains *power_domains = &i915->power_domains;
 	struct intel_runtime_pm *rpm = &i915->runtime_pm;
 	intel_wakeref_t work_wakeref = intel_runtime_pm_get_raw(rpm);
@@ -2131,7 +2171,7 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 		goto out_verify;
 	}
 
-	WARN_ON(power_domains->domain_use_count[domain] != 1);
+	dev_WARN_ON(dev, power_domains->domain_use_count[domain] != 1);
 
 	/* Let a pending work requeue itself or queue a new one. */
 	if (power_domains->async_put_wakeref) {
@@ -2199,6 +2239,7 @@ void intel_display_power_flush_work(struct drm_i915_private *i915)
 static void
 intel_display_power_flush_work_sync(struct drm_i915_private *i915)
 {
+	struct device *dev = i915_to_dev(i915);
 	struct i915_power_domains *power_domains = &i915->power_domains;
 
 	intel_display_power_flush_work(i915);
@@ -2206,7 +2247,7 @@ intel_display_power_flush_work_sync(struct drm_i915_private *i915)
 
 	verify_async_put_domains_state(power_domains);
 
-	WARN_ON(power_domains->async_put_wakeref);
+	dev_WARN_ON(dev, power_domains->async_put_wakeref);
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
@@ -5170,21 +5211,24 @@ static bool vlv_punit_is_power_gated(struct drm_i915_private *dev_priv, u32 reg0
 
 static void assert_ved_power_gated(struct drm_i915_private *dev_priv)
 {
-	WARN(!vlv_punit_is_power_gated(dev_priv, PUNIT_REG_VEDSSPM0),
-	     "VED not power gated\n");
+	struct device *dev = i915_to_dev(dev_priv);
+
+	dev_WARN(dev, !vlv_punit_is_power_gated(dev_priv, PUNIT_REG_VEDSSPM0),
+		 "VED not power gated\n");
 }
 
 static void assert_isp_power_gated(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	static const struct pci_device_id isp_ids[] = {
 		{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x0f38)},
 		{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x22b8)},
 		{}
 	};
 
-	WARN(!pci_dev_present(isp_ids) &&
-	     !vlv_punit_is_power_gated(dev_priv, PUNIT_REG_ISPSSPM0),
-	     "ISP not power gated\n");
+	dev_WARN(dev, !pci_dev_present(isp_ids) &&
+		 !vlv_punit_is_power_gated(dev_priv, PUNIT_REG_ISPSSPM0),
+		 "ISP not power gated\n");
 }
 
 static void intel_power_domains_verify_state(struct drm_i915_private *dev_priv);
@@ -5315,9 +5359,10 @@ void intel_power_domains_enable(struct drm_i915_private *i915)
  */
 void intel_power_domains_disable(struct drm_i915_private *i915)
 {
+	struct device *dev = i915_to_dev(i915);
 	struct i915_power_domains *power_domains = &i915->power_domains;
 
-	WARN_ON(power_domains->wakeref);
+	dev_WARN_ON(dev, power_domains->wakeref);
 	power_domains->wakeref =
 		intel_display_power_get(i915, POWER_DOMAIN_INIT);
 
@@ -5393,13 +5438,14 @@ void intel_power_domains_suspend(struct drm_i915_private *i915,
  */
 void intel_power_domains_resume(struct drm_i915_private *i915)
 {
+	struct device *dev = i915_to_dev(i915);
 	struct i915_power_domains *power_domains = &i915->power_domains;
 
 	if (power_domains->display_core_suspended) {
 		intel_power_domains_init_hw(i915, true);
 		power_domains->display_core_suspended = false;
 	} else {
-		WARN_ON(power_domains->wakeref);
+		dev_WARN_ON(dev, power_domains->wakeref);
 		power_domains->wakeref =
 			intel_display_power_get(i915, POWER_DOMAIN_INIT);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 255de50fcf84..c637929aa311 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -324,13 +324,14 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
 	};
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct ddi_vbt_port_info *info =
 		&dev_priv->vbt.ddi_port_info[dig_port->base.port];
 	const int *source_rates;
 	int size, max_rate = 0, vbt_max_rate = info->dp_max_link_rate;
 
 	/* This should only be done once */
-	WARN_ON(intel_dp->source_rates || intel_dp->num_source_rates);
+	dev_WARN_ON(dev, intel_dp->source_rates || intel_dp->num_source_rates);
 
 	if (INTEL_GEN(dev_priv) >= 10) {
 		source_rates = cnl_rates;
@@ -753,6 +754,7 @@ static void
 vlv_power_sequencer_kick(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
 	enum pipe pipe = intel_dp->pps_pipe;
 	bool pll_enabled, release_cl_override = false;
@@ -760,10 +762,10 @@ vlv_power_sequencer_kick(struct intel_dp *intel_dp)
 	enum dpio_channel ch = vlv_pipe_to_channel(pipe);
 	u32 DP;
 
-	if (WARN(I915_READ(intel_dp->output_reg) & DP_PORT_EN,
-		 "skipping pipe %c power sequencer kick due to [ENCODER:%d:%s] being active\n",
-		 pipe_name(pipe), intel_dig_port->base.base.base.id,
-		 intel_dig_port->base.base.name))
+	if (dev_WARN(dev, I915_READ(intel_dp->output_reg) & DP_PORT_EN,
+		     "skipping pipe %c power sequencer kick due to [ENCODER:%d:%s] being active\n",
+		     pipe_name(pipe), intel_dig_port->base.base.base.id,
+		     intel_dig_port->base.base.name))
 		return;
 
 	DRM_DEBUG_KMS("kicking pipe %c power sequencer for [ENCODER:%d:%s]\n",
@@ -826,6 +828,7 @@ vlv_power_sequencer_kick(struct intel_dp *intel_dp)
 
 static enum pipe vlv_find_free_pps(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_encoder *encoder;
 	unsigned int pipes = (1 << PIPE_A) | (1 << PIPE_B);
 
@@ -837,13 +840,14 @@ static enum pipe vlv_find_free_pps(struct drm_i915_private *dev_priv)
 		struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 
 		if (encoder->type == INTEL_OUTPUT_EDP) {
-			WARN_ON(intel_dp->active_pipe != INVALID_PIPE &&
-				intel_dp->active_pipe != intel_dp->pps_pipe);
+			dev_WARN_ON(dev,
+				    intel_dp->active_pipe != INVALID_PIPE &&
+				    intel_dp->active_pipe != intel_dp->pps_pipe);
 
 			if (intel_dp->pps_pipe != INVALID_PIPE)
 				pipes &= ~(1 << intel_dp->pps_pipe);
 		} else {
-			WARN_ON(intel_dp->pps_pipe != INVALID_PIPE);
+			dev_WARN_ON(dev, intel_dp->pps_pipe != INVALID_PIPE);
 
 			if (intel_dp->active_pipe != INVALID_PIPE)
 				pipes &= ~(1 << intel_dp->active_pipe);
@@ -860,16 +864,17 @@ static enum pipe
 vlv_power_sequencer_pipe(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
 	enum pipe pipe;
 
 	lockdep_assert_held(&dev_priv->pps_mutex);
 
 	/* We should never land here with regular DP ports */
-	WARN_ON(!intel_dp_is_edp(intel_dp));
+	dev_WARN_ON(dev, !intel_dp_is_edp(intel_dp));
 
-	WARN_ON(intel_dp->active_pipe != INVALID_PIPE &&
-		intel_dp->active_pipe != intel_dp->pps_pipe);
+	dev_WARN_ON(dev, intel_dp->active_pipe != INVALID_PIPE &&
+		    intel_dp->active_pipe != intel_dp->pps_pipe);
 
 	if (intel_dp->pps_pipe != INVALID_PIPE)
 		return intel_dp->pps_pipe;
@@ -880,7 +885,7 @@ vlv_power_sequencer_pipe(struct intel_dp *intel_dp)
 	 * Didn't find one. This should not happen since there
 	 * are two power sequencers and up to two eDP ports.
 	 */
-	if (WARN_ON(pipe == INVALID_PIPE))
+	if (dev_WARN_ON(dev, pipe == INVALID_PIPE))
 		pipe = PIPE_A;
 
 	vlv_steal_power_sequencer(dev_priv, pipe);
@@ -908,12 +913,13 @@ static int
 bxt_power_sequencer_idx(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 	int backlight_controller = dev_priv->vbt.backlight.controller;
 
 	lockdep_assert_held(&dev_priv->pps_mutex);
 
 	/* We should never land here with regular DP ports */
-	WARN_ON(!intel_dp_is_edp(intel_dp));
+	dev_WARN_ON(dev, !intel_dp_is_edp(intel_dp));
 
 	if (!intel_dp->pps_reset)
 		return backlight_controller;
@@ -1014,10 +1020,12 @@ vlv_initial_power_sequencer_setup(struct intel_dp *intel_dp)
 
 void intel_power_sequencer_reset(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_encoder *encoder;
 
-	if (WARN_ON(!IS_VALLEYVIEW(dev_priv) && !IS_CHERRYVIEW(dev_priv) &&
-		    !IS_GEN9_LP(dev_priv)))
+	if (dev_WARN_ON(dev, !IS_VALLEYVIEW(dev_priv) &&
+			!IS_CHERRYVIEW(dev_priv) &&
+			!IS_GEN9_LP(dev_priv)))
 		return;
 
 	/*
@@ -1033,7 +1041,7 @@ void intel_power_sequencer_reset(struct drm_i915_private *dev_priv)
 	for_each_intel_dp(&dev_priv->drm, encoder) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 
-		WARN_ON(intel_dp->active_pipe != INVALID_PIPE);
+		dev_WARN_ON(dev, intel_dp->active_pipe != INVALID_PIPE);
 
 		if (encoder->type != INTEL_OUTPUT_EDP)
 			continue;
@@ -1162,12 +1170,14 @@ static void
 intel_dp_check_edp(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 
 	if (!intel_dp_is_edp(intel_dp))
 		return;
 
 	if (!edp_have_panel_power(intel_dp) && !edp_have_panel_vdd(intel_dp)) {
-		WARN(1, "eDP powered off while attempting aux channel communication.\n");
+		dev_WARN(dev, 1,
+			 "eDP powered off while attempting aux channel communication.\n");
 		DRM_DEBUG_KMS("Status 0x%08x Control 0x%08x\n",
 			      I915_READ(_pp_stat_reg(intel_dp)),
 			      I915_READ(_pp_ctrl_reg(intel_dp)));
@@ -1324,6 +1334,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *i915 =
 			to_i915(intel_dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(i915);
 	struct intel_uncore *uncore = &i915->uncore;
 	enum phy phy = intel_port_to_phy(i915, intel_dig_port->base.port);
 	bool is_tc_port = intel_phy_is_tc(i915, phy);
@@ -1378,8 +1389,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 		const u32 status = intel_uncore_read(uncore, ch_ctl);
 
 		if (status != intel_dp->aux_busy_last_status) {
-			WARN(1, "dp_aux_ch not started status 0x%08x\n",
-			     status);
+			dev_WARN(dev, 1,
+				 "dp_aux_ch not started status 0x%08x\n",
+				 status);
 			intel_dp->aux_busy_last_status = status;
 		}
 
@@ -1388,7 +1400,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	}
 
 	/* Only 5 data registers! */
-	if (WARN_ON(send_bytes > 20 || recv_size > 20)) {
+	if (dev_WARN_ON(dev, send_bytes > 20 || recv_size > 20)) {
 		ret = -E2BIG;
 		goto out;
 	}
@@ -2656,13 +2668,14 @@ static void edp_wait_backlight_off(struct intel_dp *intel_dp)
 static  u32 ilk_get_pp_control(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 control;
 
 	lockdep_assert_held(&dev_priv->pps_mutex);
 
 	control = I915_READ(_pp_ctrl_reg(intel_dp));
-	if (WARN_ON(!HAS_DDI(dev_priv) &&
-		    (control & PANEL_UNLOCK_MASK) != PANEL_UNLOCK_REGS)) {
+	if (dev_WARN_ON(dev, !HAS_DDI(dev_priv) &&
+			(control & PANEL_UNLOCK_MASK) != PANEL_UNLOCK_REGS)) {
 		control &= ~PANEL_UNLOCK_MASK;
 		control |= PANEL_UNLOCK_REGS;
 	}
@@ -2752,6 +2765,7 @@ void intel_edp_panel_vdd_on(struct intel_dp *intel_dp)
 static void edp_panel_vdd_off_sync(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_digital_port *intel_dig_port =
 		dp_to_dig_port(intel_dp);
 	u32 pp;
@@ -2759,7 +2773,7 @@ static void edp_panel_vdd_off_sync(struct intel_dp *intel_dp)
 
 	lockdep_assert_held(&dev_priv->pps_mutex);
 
-	WARN_ON(intel_dp->want_panel_vdd);
+	dev_WARN_ON(dev, intel_dp->want_panel_vdd);
 
 	if (!edp_have_panel_vdd(intel_dp))
 		return;
@@ -2843,6 +2857,7 @@ static void edp_panel_vdd_off(struct intel_dp *intel_dp, bool sync)
 static void edp_panel_on(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 pp;
 	i915_reg_t pp_ctrl_reg;
 
@@ -2855,10 +2870,10 @@ static void edp_panel_on(struct intel_dp *intel_dp)
 		      dp_to_dig_port(intel_dp)->base.base.base.id,
 		      dp_to_dig_port(intel_dp)->base.base.name);
 
-	if (WARN(edp_have_panel_power(intel_dp),
-		 "[ENCODER:%d:%s] panel power already on\n",
-		 dp_to_dig_port(intel_dp)->base.base.base.id,
-		 dp_to_dig_port(intel_dp)->base.base.name))
+	if (dev_WARN(dev, edp_have_panel_power(intel_dp),
+		     "[ENCODER:%d:%s] panel power already on\n",
+		     dp_to_dig_port(intel_dp)->base.base.base.id,
+		     dp_to_dig_port(intel_dp)->base.base.name))
 		return;
 
 	wait_panel_power_cycle(intel_dp);
@@ -2904,6 +2919,7 @@ void intel_edp_panel_on(struct intel_dp *intel_dp)
 static void edp_panel_off(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	u32 pp;
 	i915_reg_t pp_ctrl_reg;
@@ -2916,8 +2932,9 @@ static void edp_panel_off(struct intel_dp *intel_dp)
 	DRM_DEBUG_KMS("Turn [ENCODER:%d:%s] panel power off\n",
 		      dig_port->base.base.base.id, dig_port->base.base.name);
 
-	WARN(!intel_dp->want_panel_vdd, "Need [ENCODER:%d:%s] VDD to turn off panel\n",
-	     dig_port->base.base.base.id, dig_port->base.base.name);
+	dev_WARN(dev, !intel_dp->want_panel_vdd,
+		 "Need [ENCODER:%d:%s] VDD to turn off panel\n",
+		 dig_port->base.base.base.id, dig_port->base.base.name);
 
 	pp = ilk_get_pp_control(intel_dp);
 	/* We need to switch off panel power _and_ force vdd, for otherwise some
@@ -3548,13 +3565,14 @@ static void intel_enable_dp(struct intel_encoder *encoder,
 			    const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	u32 dp_reg = I915_READ(intel_dp->output_reg);
 	enum pipe pipe = crtc->pipe;
 	intel_wakeref_t wakeref;
 
-	if (WARN_ON(dp_reg & DP_PORT_EN))
+	if (dev_WARN_ON(dev, dp_reg & DP_PORT_EN))
 		return;
 
 	with_pps_lock(intel_dp, wakeref) {
@@ -3622,12 +3640,13 @@ static void vlv_detach_power_sequencer(struct intel_dp *intel_dp)
 {
 	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *dev_priv = to_i915(intel_dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum pipe pipe = intel_dp->pps_pipe;
 	i915_reg_t pp_on_reg = PP_ON_DELAYS(pipe);
 
-	WARN_ON(intel_dp->active_pipe != INVALID_PIPE);
+	dev_WARN_ON(dev, intel_dp->active_pipe != INVALID_PIPE);
 
-	if (WARN_ON(pipe != PIPE_A && pipe != PIPE_B))
+	if (dev_WARN_ON(dev, pipe != PIPE_A && pipe != PIPE_B))
 		return;
 
 	edp_panel_vdd_off_sync(intel_dp);
@@ -3653,6 +3672,7 @@ static void vlv_detach_power_sequencer(struct intel_dp *intel_dp)
 static void vlv_steal_power_sequencer(struct drm_i915_private *dev_priv,
 				      enum pipe pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_encoder *encoder;
 
 	lockdep_assert_held(&dev_priv->pps_mutex);
@@ -3660,10 +3680,10 @@ static void vlv_steal_power_sequencer(struct drm_i915_private *dev_priv,
 	for_each_intel_dp(&dev_priv->drm, encoder) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 
-		WARN(intel_dp->active_pipe == pipe,
-		     "stealing pipe %c power sequencer from active [ENCODER:%d:%s]\n",
-		     pipe_name(pipe), encoder->base.base.id,
-		     encoder->base.name);
+		dev_WARN(dev, intel_dp->active_pipe == pipe,
+			 "stealing pipe %c power sequencer from active [ENCODER:%d:%s]\n",
+			 pipe_name(pipe), encoder->base.base.id,
+			 encoder->base.name);
 
 		if (intel_dp->pps_pipe != pipe)
 			continue;
@@ -3681,12 +3701,13 @@ static void vlv_init_panel_power_sequencer(struct intel_encoder *encoder,
 					   const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
 	lockdep_assert_held(&dev_priv->pps_mutex);
 
-	WARN_ON(intel_dp->active_pipe != INVALID_PIPE);
+	dev_WARN_ON(dev, intel_dp->active_pipe != INVALID_PIPE);
 
 	if (intel_dp->pps_pipe != INVALID_PIPE &&
 	    intel_dp->pps_pipe != crtc->pipe) {
@@ -4203,12 +4224,14 @@ intel_dp_link_down(struct intel_encoder *encoder,
 		   const struct intel_crtc_state *old_crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	enum port port = encoder->port;
 	u32 DP = intel_dp->DP;
 
-	if (WARN_ON((I915_READ(intel_dp->output_reg) & DP_PORT_EN) == 0))
+	if (dev_WARN_ON(dev,
+			(I915_READ(intel_dp->output_reg) & DP_PORT_EN) == 0))
 		return;
 
 	DRM_DEBUG_KMS("\n");
@@ -4368,9 +4391,10 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv =
 		to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 
 	/* this function is meant to be called only once */
-	WARN_ON(intel_dp->dpcd[DP_DPCD_REV] != 0);
+	dev_WARN_ON(dev, intel_dp->dpcd[DP_DPCD_REV] != 0);
 
 	if (!intel_dp_read_dpcd(intel_dp))
 		return false;
@@ -5096,6 +5120,7 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
 			  struct drm_modeset_acquire_ctx *ctx)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
 	struct intel_connector *connector = intel_dp->attached_connector;
 	struct drm_connector_state *conn_state;
@@ -5125,7 +5150,7 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
 
 	crtc_state = to_intel_crtc_state(crtc->base.state);
 
-	WARN_ON(!intel_crtc_has_dp_encoder(crtc_state));
+	dev_WARN_ON(dev, !intel_crtc_has_dp_encoder(crtc_state));
 
 	if (!crtc_state->hw.active)
 		return 0;
@@ -5651,6 +5676,7 @@ intel_dp_detect(struct drm_connector *connector,
 		bool force)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct intel_encoder *encoder = &dig_port->base;
@@ -5658,7 +5684,8 @@ intel_dp_detect(struct drm_connector *connector,
 
 	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
 		      connector->base.id, connector->name);
-	WARN_ON(!drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
+	dev_WARN_ON(dev,
+		    !drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
 
 	/* Can't disconnect eDP */
 	if (intel_dp_is_edp(intel_dp))
@@ -6840,6 +6867,7 @@ intel_dp_init_panel_power_sequencer_registers(struct intel_dp *intel_dp,
 					      bool force_disable_vdd)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 pp_on, pp_off, port_sel = 0;
 	int div = dev_priv->rawclk_freq / 1000;
 	struct pps_registers regs;
@@ -6865,7 +6893,7 @@ intel_dp_init_panel_power_sequencer_registers(struct intel_dp *intel_dp,
 	if (force_disable_vdd) {
 		u32 pp = ilk_get_pp_control(intel_dp);
 
-		WARN(pp & PANEL_POWER_ON, "Panel power already on\n");
+		dev_WARN(dev, pp & PANEL_POWER_ON, "Panel power already on\n");
 
 		if (pp & EDP_FORCE_VDD)
 			DRM_DEBUG_KMS("VDD already on, disabling first\n");
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3b066c63816d..84d25496ed45 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -346,13 +346,14 @@ static void intel_mst_post_disable_dp(struct intel_encoder *encoder,
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	bool last_mst_stream;
 	u32 val;
 
 	intel_dp->active_mst_links--;
 	last_mst_stream = intel_dp->active_mst_links == 0;
-	WARN_ON(INTEL_GEN(dev_priv) >= 12 && last_mst_stream &&
-		!intel_dp_mst_is_master_trans(old_crtc_state));
+	dev_WARN_ON(dev, INTEL_GEN(dev_priv) >= 12 && last_mst_stream &&
+		    !intel_dp_mst_is_master_trans(old_crtc_state));
 
 	intel_crtc_vblank_off(old_crtc_state);
 
@@ -424,6 +425,7 @@ static void intel_mst_pre_enable_dp(struct intel_encoder *encoder,
 	struct intel_digital_port *intel_dig_port = intel_mst->primary;
 	struct intel_dp *intel_dp = &intel_dig_port->dp;
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 	int ret;
@@ -436,8 +438,8 @@ static void intel_mst_pre_enable_dp(struct intel_encoder *encoder,
 	connector->encoder = encoder;
 	intel_mst->connector = connector;
 	first_mst_stream = intel_dp->active_mst_links == 0;
-	WARN_ON(INTEL_GEN(dev_priv) >= 12 && first_mst_stream &&
-		!intel_dp_mst_is_master_trans(pipe_config));
+	dev_WARN_ON(dev, INTEL_GEN(dev_priv) >= 12 && first_mst_stream &&
+		    !intel_dp_mst_is_master_trans(pipe_config));
 
 	DRM_DEBUG_KMS("active links %d\n", intel_dp->active_mst_links);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.c b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
index 704f38681c4b..ed0e6c09d13a 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
@@ -237,6 +237,7 @@ bxt_get_phy_info(struct drm_i915_private *dev_priv, enum dpio_phy phy)
 void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
 			     enum dpio_phy *phy, enum dpio_channel *ch)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct bxt_ddi_phy_info *phy_info, *phys;
 	int i, count;
 
@@ -259,7 +260,7 @@ void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
 		}
 	}
 
-	WARN(1, "PHY not found for PORT %c", port_name(port));
+	dev_WARN(dev, 1, "PHY not found for PORT %c", port_name(port));
 	*phy = DPIO_PHY0;
 	*ch = DPIO_CH0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 2cae30d2669c..7141d5ae0ee3 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -103,8 +103,10 @@ enum intel_dpll_id
 intel_get_shared_dpll_id(struct drm_i915_private *dev_priv,
 			 struct intel_shared_dpll *pll)
 {
-	if (WARN_ON(pll < dev_priv->shared_dplls||
-		    pll > &dev_priv->shared_dplls[dev_priv->num_shared_dpll]))
+	struct device *dev = i915_to_dev(dev_priv);
+
+	if (dev_WARN_ON(dev, pll < dev_priv->shared_dplls ||
+			pll > &dev_priv->shared_dplls[dev_priv->num_shared_dpll]))
 		return -1;
 
 	return (enum intel_dpll_id) (pll - dev_priv->shared_dplls);
@@ -115,10 +117,12 @@ void assert_shared_dpll(struct drm_i915_private *dev_priv,
 			struct intel_shared_dpll *pll,
 			bool state)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	bool cur_state;
 	struct intel_dpll_hw_state hw_state;
 
-	if (WARN(!pll, "asserting DPLL %s with no DPLL\n", onoff(state)))
+	if (dev_WARN(dev, !pll,
+		     "asserting DPLL %s with no DPLL\n", onoff(state)))
 		return;
 
 	cur_state = pll->info->funcs->get_hw_state(dev_priv, pll, &hw_state);
@@ -138,16 +142,17 @@ void intel_prepare_shared_dpll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 
-	if (WARN_ON(pll == NULL))
+	if (dev_WARN_ON(dev, pll == NULL))
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
-	WARN_ON(!pll->state.crtc_mask);
+	dev_WARN_ON(dev, !pll->state.crtc_mask);
 	if (!pll->active_mask) {
 		DRM_DEBUG_DRIVER("setting up %s\n", pll->info->name);
-		WARN_ON(pll->on);
+		dev_WARN_ON(dev, pll->on);
 		assert_shared_dpll_disabled(dev_priv, pll);
 
 		pll->info->funcs->prepare(dev_priv, pll);
@@ -165,18 +170,19 @@ void intel_enable_shared_dpll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	unsigned int crtc_mask = drm_crtc_mask(&crtc->base);
 	unsigned int old_mask;
 
-	if (WARN_ON(pll == NULL))
+	if (dev_WARN_ON(dev, pll == NULL))
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
 	old_mask = pll->active_mask;
 
-	if (WARN_ON(!(pll->state.crtc_mask & crtc_mask)) ||
-	    WARN_ON(pll->active_mask & crtc_mask))
+	if (dev_WARN_ON(dev, !(pll->state.crtc_mask & crtc_mask)) ||
+	    dev_WARN_ON(dev, pll->active_mask & crtc_mask))
 		goto out;
 
 	pll->active_mask |= crtc_mask;
@@ -186,11 +192,11 @@ void intel_enable_shared_dpll(const struct intel_crtc_state *crtc_state)
 		      crtc->base.base.id);
 
 	if (old_mask) {
-		WARN_ON(!pll->on);
+		dev_WARN_ON(dev, !pll->on);
 		assert_shared_dpll_enabled(dev_priv, pll);
 		goto out;
 	}
-	WARN_ON(pll->on);
+	dev_WARN_ON(dev, pll->on);
 
 	DRM_DEBUG_KMS("enabling %s\n", pll->info->name);
 	pll->info->funcs->enable(dev_priv, pll);
@@ -210,6 +216,7 @@ void intel_disable_shared_dpll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	unsigned int crtc_mask = drm_crtc_mask(&crtc->base);
 
@@ -221,7 +228,7 @@ void intel_disable_shared_dpll(const struct intel_crtc_state *crtc_state)
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
-	if (WARN_ON(!(pll->active_mask & crtc_mask)))
+	if (dev_WARN_ON(dev, !(pll->active_mask & crtc_mask)))
 		goto out;
 
 	DRM_DEBUG_KMS("disable %s (active %x, on? %d) for crtc %d\n",
@@ -229,7 +236,7 @@ void intel_disable_shared_dpll(const struct intel_crtc_state *crtc_state)
 		      crtc->base.base.id);
 
 	assert_shared_dpll_enabled(dev_priv, pll);
-	WARN_ON(!pll->on);
+	dev_WARN_ON(dev, !pll->on);
 
 	pll->active_mask &= ~crtc_mask;
 	if (pll->active_mask)
@@ -250,13 +257,14 @@ intel_find_shared_dpll(struct intel_atomic_state *state,
 		       unsigned long dpll_mask)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_shared_dpll *pll, *unused_pll = NULL;
 	struct intel_shared_dpll_state *shared_dpll;
 	enum intel_dpll_id i;
 
 	shared_dpll = intel_atomic_get_shared_dpll_state(&state->base);
 
-	WARN_ON(dpll_mask & ~(BIT(I915_NUM_PLLS) - 1));
+	dev_WARN_ON(dev, dpll_mask & ~(BIT(I915_NUM_PLLS) - 1));
 
 	for_each_set_bit(i, &dpll_mask, I915_NUM_PLLS) {
 		pll = &dev_priv->shared_dplls[i];
@@ -1085,6 +1093,7 @@ static bool skl_ddi_dpll0_get_hw_state(struct drm_i915_private *dev_priv,
 				       struct intel_shared_dpll *pll,
 				       struct intel_dpll_hw_state *hw_state)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct skl_dpll_regs *regs = skl_dpll_regs;
 	const enum intel_dpll_id id = pll->info->id;
 	intel_wakeref_t wakeref;
@@ -1100,7 +1109,7 @@ static bool skl_ddi_dpll0_get_hw_state(struct drm_i915_private *dev_priv,
 
 	/* DPLL0 is always enabled since it drives CDCLK */
 	val = I915_READ(regs[id].ctl);
-	if (WARN_ON(!(val & LCPLL_PLL_ENABLE)))
+	if (dev_WARN_ON(dev, !(val & LCPLL_PLL_ENABLE)))
 		goto out;
 
 	val = I915_READ(DPLL_CTRL1);
@@ -3812,9 +3821,10 @@ bool intel_reserve_shared_dplls(struct intel_atomic_state *state,
 				struct intel_encoder *encoder)
 {
 	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct intel_dpll_mgr *dpll_mgr = dev_priv->dpll_mgr;
 
-	if (WARN_ON(!dpll_mgr))
+	if (dev_WARN_ON(dev, !dpll_mgr))
 		return false;
 
 	return dpll_mgr->get_dplls(state, crtc, encoder);
@@ -3864,9 +3874,10 @@ void intel_update_active_dpll(struct intel_atomic_state *state,
 			      struct intel_encoder *encoder)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct intel_dpll_mgr *dpll_mgr = dev_priv->dpll_mgr;
 
-	if (WARN_ON(!dpll_mgr))
+	if (dev_WARN_ON(dev, !dpll_mgr))
 		return;
 
 	dpll_mgr->update_active_dpll(state, crtc, encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index ada006a690df..9370f5031ed0 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -161,11 +161,12 @@ void intel_dsb_put(struct intel_dsb *dsb)
 {
 	struct intel_crtc *crtc = container_of(dsb, typeof(*crtc), dsb);
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(i915);
 
 	if (!HAS_DSB(i915))
 		return;
 
-	if (WARN_ON(dsb->refcount == 0))
+	if (dev_WARN_ON(dev, dsb->refcount == 0))
 		return;
 
 	if (--dsb->refcount == 0) {
@@ -194,6 +195,7 @@ void intel_dsb_indexed_reg_write(struct intel_dsb *dsb, i915_reg_t reg,
 {
 	struct intel_crtc *crtc = container_of(dsb, typeof(*crtc), dsb);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 *buf = dsb->cmd_buf;
 	u32 reg_val;
 
@@ -202,7 +204,7 @@ void intel_dsb_indexed_reg_write(struct intel_dsb *dsb, i915_reg_t reg,
 		return;
 	}
 
-	if (WARN_ON(dsb->free_pos >= DSB_BUF_SIZE)) {
+	if (dev_WARN_ON(dev, dsb->free_pos >= DSB_BUF_SIZE)) {
 		DRM_DEBUG_KMS("DSB buffer overflow\n");
 		return;
 	}
@@ -269,6 +271,7 @@ void intel_dsb_reg_write(struct intel_dsb *dsb, i915_reg_t reg, u32 val)
 {
 	struct intel_crtc *crtc = container_of(dsb, typeof(*crtc), dsb);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 *buf = dsb->cmd_buf;
 
 	if (!buf) {
@@ -276,7 +279,7 @@ void intel_dsb_reg_write(struct intel_dsb *dsb, i915_reg_t reg, u32 val)
 		return;
 	}
 
-	if (WARN_ON(dsb->free_pos >= DSB_BUF_SIZE)) {
+	if (dev_WARN_ON(dev, dsb->free_pos >= DSB_BUF_SIZE)) {
 		DRM_DEBUG_KMS("DSB buffer overflow\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index f90946c912ee..53c167cf389e 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -457,17 +457,18 @@ void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
 				 enum mipi_seq seq_id)
 {
 	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	const u8 *data;
 	fn_mipi_elem_exec mipi_elem_exec;
 
-	if (WARN_ON(seq_id >= ARRAY_SIZE(dev_priv->vbt.dsi.sequence)))
+	if (dev_WARN_ON(dev, seq_id >= ARRAY_SIZE(dev_priv->vbt.dsi.sequence)))
 		return;
 
 	data = dev_priv->vbt.dsi.sequence[seq_id];
 	if (!data)
 		return;
 
-	WARN_ON(*data != seq_id);
+	dev_WARN_ON(dev, *data != seq_id);
 
 	DRM_DEBUG_KMS("Starting MIPI sequence %d - %s\n",
 		      seq_id, sequence_name(seq_id));
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index a1048ece541e..2c4c1b6438f6 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -405,9 +405,10 @@ bool intel_fbc_is_active(struct drm_i915_private *dev_priv)
 static void intel_fbc_deactivate(struct drm_i915_private *dev_priv,
 				 const char *reason)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_fbc *fbc = &dev_priv->fbc;
 
-	WARN_ON(!mutex_is_locked(&fbc->lock));
+	dev_WARN_ON(dev, !mutex_is_locked(&fbc->lock));
 
 	if (fbc->active)
 		intel_fbc_hw_deactivate(dev_priv);
@@ -467,11 +468,12 @@ static int find_compression_threshold(struct drm_i915_private *dev_priv,
 static int intel_fbc_alloc_cfb(struct drm_i915_private *dev_priv,
 			       unsigned int size, unsigned int fb_cpp)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_fbc *fbc = &dev_priv->fbc;
 	struct drm_mm_node *uninitialized_var(compressed_llb);
 	int ret;
 
-	WARN_ON(drm_mm_node_allocated(&fbc->compressed_fb));
+	dev_WARN_ON(dev, drm_mm_node_allocated(&fbc->compressed_fb));
 
 	ret = find_compression_threshold(dev_priv, &fbc->compressed_fb,
 					 size, fb_cpp);
@@ -554,8 +556,9 @@ void intel_fbc_cleanup_cfb(struct drm_i915_private *dev_priv)
 static bool stride_is_valid(struct drm_i915_private *dev_priv,
 			    unsigned int stride)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	/* This should have been caught earlier. */
-	if (WARN_ON_ONCE((stride & (64 - 1)) != 0))
+	if (dev_WARN_ON_ONCE(dev, (stride & (64 - 1)) != 0))
 		return false;
 
 	/* Below are the additional FBC restrictions. */
@@ -634,6 +637,7 @@ static void intel_fbc_update_state_cache(struct intel_crtc *crtc,
 					 const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_fbc *fbc = &dev_priv->fbc;
 	struct intel_fbc_state_cache *cache = &fbc->state_cache;
 	struct drm_framebuffer *fb = plane_state->hw.fb;
@@ -663,8 +667,8 @@ static void intel_fbc_update_state_cache(struct intel_crtc *crtc,
 	cache->fb.format = fb->format;
 	cache->fb.stride = fb->pitches[0];
 
-	WARN_ON(plane_state->flags & PLANE_HAS_FENCE &&
-		!plane_state->vma->fence);
+	dev_WARN_ON(dev, plane_state->flags & PLANE_HAS_FENCE &&
+		    !plane_state->vma->fence);
 
 	if (plane_state->flags & PLANE_HAS_FENCE &&
 	    plane_state->vma->fence)
@@ -923,12 +927,13 @@ bool intel_fbc_pre_update(struct intel_crtc *crtc,
  */
 static void __intel_fbc_disable(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_fbc *fbc = &dev_priv->fbc;
 	struct intel_crtc *crtc = fbc->crtc;
 
-	WARN_ON(!mutex_is_locked(&fbc->lock));
-	WARN_ON(!fbc->crtc);
-	WARN_ON(fbc->active);
+	dev_WARN_ON(dev, !mutex_is_locked(&fbc->lock));
+	dev_WARN_ON(dev, !fbc->crtc);
+	dev_WARN_ON(dev, fbc->active);
 
 	DRM_DEBUG_KMS("Disabling FBC on pipe %c\n", pipe_name(crtc->pipe));
 
@@ -940,9 +945,10 @@ static void __intel_fbc_disable(struct drm_i915_private *dev_priv)
 static void __intel_fbc_post_update(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_fbc *fbc = &dev_priv->fbc;
 
-	WARN_ON(!mutex_is_locked(&fbc->lock));
+	dev_WARN_ON(dev, !mutex_is_locked(&fbc->lock));
 
 	if (fbc->crtc != crtc)
 		return;
@@ -1112,6 +1118,7 @@ void intel_fbc_enable(struct intel_crtc *crtc,
 		      const struct intel_plane_state *plane_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_fbc *fbc = &dev_priv->fbc;
 	struct intel_fbc_state_cache *cache = &fbc->state_cache;
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
@@ -1129,7 +1136,7 @@ void intel_fbc_enable(struct intel_crtc *crtc,
 		__intel_fbc_disable(dev_priv);
 	}
 
-	WARN_ON(fbc->active);
+	dev_WARN_ON(dev, fbc->active);
 
 	intel_fbc_update_state_cache(crtc, crtc_state, plane_state);
 
@@ -1188,6 +1195,7 @@ void intel_fbc_disable(struct intel_crtc *crtc)
  */
 void intel_fbc_global_disable(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_fbc *fbc = &dev_priv->fbc;
 
 	if (!fbc_supported(dev_priv))
@@ -1195,7 +1203,7 @@ void intel_fbc_global_disable(struct drm_i915_private *dev_priv)
 
 	mutex_lock(&fbc->lock);
 	if (fbc->crtc) {
-		WARN_ON(fbc->crtc->active);
+		dev_WARN_ON(dev, fbc->crtc->active);
 		__intel_fbc_disable(dev_priv);
 	}
 	mutex_unlock(&fbc->lock);
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 3d4d19ac1d14..721f7fa3008c 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -908,7 +908,9 @@ int intel_gmbus_setup(struct drm_i915_private *dev_priv)
 struct i2c_adapter *intel_gmbus_get_adapter(struct drm_i915_private *dev_priv,
 					    unsigned int pin)
 {
-	if (WARN_ON(!intel_gmbus_is_valid_pin(dev_priv, pin)))
+	struct device *dev = i915_to_dev(dev_priv);
+
+	if (dev_WARN_ON(dev, !intel_gmbus_is_valid_pin(dev_priv, pin)))
 		return NULL;
 
 	return &dev_priv->gmbus[pin].adapter;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 0fdbd39f6641..f1d9b7958e08 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -838,6 +838,7 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 {
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	struct drm_i915_private *dev_priv = connector->base.dev->dev_private;
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
 	enum port port = intel_dig_port->base.port;
 	enum transcoder cpu_transcoder;
@@ -853,7 +854,8 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	if (WARN_ON(!intel_hdcp_in_use(dev_priv, cpu_transcoder, port))) {
+	if (dev_WARN_ON(dev,
+			!intel_hdcp_in_use(dev_priv, cpu_transcoder, port))) {
 		DRM_ERROR("%s:%d HDCP link stopped encryption,%x\n",
 			  connector->base.name, connector->base.base.id,
 			  I915_READ(HDCP_STATUS(dev_priv, cpu_transcoder,
@@ -1526,13 +1528,15 @@ static int hdcp2_enable_encryption(struct intel_connector *connector)
 {
 	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = connector->encoder->port;
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
 	int ret;
 
-	WARN_ON(I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
-		LINK_ENCRYPTION_STATUS);
+	dev_WARN_ON(dev,
+		    I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
+		    LINK_ENCRYPTION_STATUS);
 	if (hdcp->shim->toggle_signalling) {
 		ret = hdcp->shim->toggle_signalling(intel_dig_port, true);
 		if (ret) {
@@ -1564,13 +1568,15 @@ static int hdcp2_disable_encryption(struct intel_connector *connector)
 {
 	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = connector->encoder->port;
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
 	int ret;
 
-	WARN_ON(!(I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
-			    LINK_ENCRYPTION_STATUS));
+	dev_WARN_ON(dev,
+		    !(I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
+		      LINK_ENCRYPTION_STATUS));
 
 	I915_WRITE(HDCP2_CTL(dev_priv, cpu_transcoder, port),
 		   I915_READ(HDCP2_CTL(dev_priv, cpu_transcoder, port)) &
@@ -1675,6 +1681,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 {
 	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = connector->encoder->port;
 	enum transcoder cpu_transcoder;
@@ -1690,7 +1697,8 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	if (WARN_ON(!intel_hdcp2_in_use(dev_priv, cpu_transcoder, port))) {
+	if (dev_WARN_ON(dev,
+			!intel_hdcp2_in_use(dev_priv, cpu_transcoder, port))) {
 		DRM_ERROR("HDCP2.2 link stopped the encryption, %x\n",
 			  I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder,
 						 port)));
@@ -1875,13 +1883,14 @@ static bool is_hdcp2_supported(struct drm_i915_private *dev_priv)
 
 void intel_hdcp_component_init(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	int ret;
 
 	if (!is_hdcp2_supported(dev_priv))
 		return;
 
 	mutex_lock(&dev_priv->hdcp_comp_mutex);
-	WARN_ON(dev_priv->hdcp_comp_added);
+	dev_WARN_ON(dev, dev_priv->hdcp_comp_added);
 
 	dev_priv->hdcp_comp_added = true;
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
@@ -1946,6 +1955,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 		      enum transcoder cpu_transcoder, u8 content_type)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
 	int ret = -EINVAL;
@@ -1954,7 +1964,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 		return -ENOENT;
 
 	mutex_lock(&hdcp->mutex);
-	WARN_ON(hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
+	dev_WARN_ON(dev, hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
 	hdcp->content_type = content_type;
 
 	if (INTEL_GEN(dev_priv) >= 12) {
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 715b854b24a0..7dbd30c65d62 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -80,9 +80,11 @@ static void
 assert_hdmi_transcoder_func_disabled(struct drm_i915_private *dev_priv,
 				     enum transcoder cpu_transcoder)
 {
-	WARN(I915_READ(TRANS_DDI_FUNC_CTL(cpu_transcoder)) &
-	     TRANS_DDI_FUNC_ENABLE,
-	     "HDMI transcoder function enabled, expecting disabled\n");
+	struct device *dev = i915_to_dev(dev_priv);
+
+	dev_WARN(dev, I915_READ(TRANS_DDI_FUNC_CTL(cpu_transcoder)) &
+		 TRANS_DDI_FUNC_ENABLE,
+		 "HDMI transcoder function enabled, expecting disabled\n");
 }
 
 struct intel_hdmi *enc_to_intel_hdmi(struct drm_encoder *encoder)
@@ -214,10 +216,12 @@ static void g4x_write_infoframe(struct intel_encoder *encoder,
 {
 	const u32 *data = frame;
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 val = I915_READ(VIDEO_DIP_CTL);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	dev_WARN(dev, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -285,12 +289,14 @@ static void ibx_write_infoframe(struct intel_encoder *encoder,
 {
 	const u32 *data = frame;
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *intel_crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	i915_reg_t reg = TVIDEO_DIP_CTL(intel_crtc->pipe);
 	u32 val = I915_READ(reg);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	dev_WARN(dev, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -362,12 +368,14 @@ static void cpt_write_infoframe(struct intel_encoder *encoder,
 {
 	const u32 *data = frame;
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *intel_crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	i915_reg_t reg = TVIDEO_DIP_CTL(intel_crtc->pipe);
 	u32 val = I915_READ(reg);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	dev_WARN(dev, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -438,12 +446,14 @@ static void vlv_write_infoframe(struct intel_encoder *encoder,
 {
 	const u32 *data = frame;
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *intel_crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	i915_reg_t reg = VLV_TVIDEO_DIP_CTL(intel_crtc->pipe);
 	u32 val = I915_READ(reg);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	dev_WARN(dev, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -514,6 +524,7 @@ static void hsw_write_infoframe(struct intel_encoder *encoder,
 {
 	const u32 *data = frame;
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	i915_reg_t ctl_reg = HSW_TVIDEO_DIP_CTL(cpu_transcoder);
 	int data_size;
@@ -522,7 +533,7 @@ static void hsw_write_infoframe(struct intel_encoder *encoder,
 
 	data_size = hsw_dip_data_size(dev_priv, type);
 
-	WARN_ON(len > data_size);
+	dev_WARN_ON(dev, len > data_size);
 
 	val &= ~hsw_infoframe_enable(type);
 	I915_WRITE(ctl_reg, val);
@@ -822,6 +833,7 @@ intel_hdmi_compute_drm_infoframe(struct intel_encoder *encoder,
 {
 	struct hdmi_drm_infoframe *frame = &crtc_state->infoframes.drm.drm;
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	int ret;
 
 	if (!(INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv)))
@@ -843,7 +855,7 @@ intel_hdmi_compute_drm_infoframe(struct intel_encoder *encoder,
 	}
 
 	ret = hdmi_drm_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (dev_WARN_ON(dev, ret))
 		return false;
 
 	return true;
@@ -1037,6 +1049,7 @@ static void ibx_set_infoframes(struct intel_encoder *encoder,
 			       const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *intel_crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_digital_port *intel_dig_port = enc_to_dig_port(&encoder->base);
 	struct intel_hdmi *intel_hdmi = &intel_dig_port->hdmi;
@@ -1061,9 +1074,9 @@ static void ibx_set_infoframes(struct intel_encoder *encoder,
 	}
 
 	if (port != (val & VIDEO_DIP_PORT_MASK)) {
-		WARN(val & VIDEO_DIP_ENABLE,
-		     "DIP already enabled on port %c\n",
-		     (val & VIDEO_DIP_PORT_MASK) >> 29);
+		dev_WARN(dev, val & VIDEO_DIP_ENABLE,
+			 "DIP already enabled on port %c\n",
+			 (val & VIDEO_DIP_PORT_MASK) >> 29);
 		val &= ~VIDEO_DIP_PORT_MASK;
 		val |= port;
 	}
@@ -1145,6 +1158,7 @@ static void vlv_set_infoframes(struct intel_encoder *encoder,
 			       const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *intel_crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(&encoder->base);
 	i915_reg_t reg = VLV_TVIDEO_DIP_CTL(intel_crtc->pipe);
@@ -1168,9 +1182,9 @@ static void vlv_set_infoframes(struct intel_encoder *encoder,
 	}
 
 	if (port != (val & VIDEO_DIP_PORT_MASK)) {
-		WARN(val & VIDEO_DIP_ENABLE,
-		     "DIP already enabled on port %c\n",
-		     (val & VIDEO_DIP_PORT_MASK) >> 29);
+		dev_WARN(dev, val & VIDEO_DIP_ENABLE,
+			 "DIP already enabled on port %c\n",
+			 (val & VIDEO_DIP_PORT_MASK) >> 29);
 		val &= ~VIDEO_DIP_PORT_MASK;
 		val |= port;
 	}
@@ -2994,6 +3008,7 @@ static u8 cnp_port_to_ddc_pin(struct drm_i915_private *dev_priv,
 
 static u8 icl_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	enum phy phy = intel_port_to_phy(dev_priv, port);
 
 	if (intel_phy_is_combo(dev_priv, phy))
@@ -3001,7 +3016,7 @@ static u8 icl_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
 	else if (intel_phy_is_tc(dev_priv, phy))
 		return GMBUS_PIN_9_TC1_ICP + intel_port_to_tc(dev_priv, port);
 
-	WARN(1, "Unknown port:%c\n", port_name(port));
+	dev_WARN(dev, 1, "Unknown port:%c\n", port_name(port));
 	return GMBUS_PIN_2_BXT;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 3a5e0db8888a..5924f0f176cc 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -449,6 +449,7 @@ static void i915_hotplug_work_func(struct work_struct *work)
 void intel_hpd_irq_handler(struct drm_i915_private *dev_priv,
 			   u32 pin_mask, u32 long_mask)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_encoder *encoder;
 	bool storm_detected = false;
 	bool queue_dig = false, queue_hp = false;
@@ -509,8 +510,9 @@ void intel_hpd_irq_handler(struct drm_i915_private *dev_priv,
 			 * hotplug bits itself. So only WARN about unexpected
 			 * interrupts on saner platforms.
 			 */
-			WARN_ONCE(!HAS_GMCH(dev_priv),
-				  "Received HPD interrupt on pin %d although disabled\n", pin);
+			dev_WARN_ONCE(dev, !HAS_GMCH(dev_priv),
+				      "Received HPD interrupt on pin %d although disabled\n",
+				      pin);
 			continue;
 		}
 
diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index 0b67f7887cd0..3b0d63874136 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -164,9 +164,10 @@ static struct irq_chip lpe_audio_irqchip = {
 
 static int lpe_audio_irq_init(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	int irq = dev_priv->lpe_audio.irq;
 
-	WARN_ON(!intel_irqs_enabled(dev_priv));
+	dev_WARN_ON(dev, !intel_irqs_enabled(dev_priv));
 	irq_set_chip_and_handler_name(irq,
 				&lpe_audio_irqchip,
 				handle_simple_irq,
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index a320b8d76a64..b6f5828cd3aa 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -201,10 +201,11 @@ static void intel_lvds_pps_get_hw_state(struct drm_i915_private *dev_priv,
 static void intel_lvds_pps_init_hw(struct drm_i915_private *dev_priv,
 				   struct intel_lvds_pps *pps)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 val;
 
 	val = I915_READ(PP_CONTROL(0));
-	WARN_ON((val & PANEL_UNLOCK_MASK) != PANEL_UNLOCK_REGS);
+	dev_WARN_ON(dev, (val & PANEL_UNLOCK_MASK) != PANEL_UNLOCK_REGS);
 	if (pps->powerdown_on_reset)
 		val |= PANEL_POWER_RESET;
 	I915_WRITE(PP_CONTROL(0), val);
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index e59b4992ba1b..0b6fe01c743d 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -365,6 +365,7 @@ int intel_opregion_notify_encoder(struct intel_encoder *intel_encoder,
 				  bool enable)
 {
 	struct drm_i915_private *dev_priv = to_i915(intel_encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 parm = 0;
 	u32 type = 0;
 	u32 port;
@@ -403,8 +404,8 @@ int intel_opregion_notify_encoder(struct intel_encoder *intel_encoder,
 		type = DISPLAY_TYPE_INTERNAL_FLAT_PANEL;
 		break;
 	default:
-		WARN_ONCE(1, "unsupported intel_encoder type %d\n",
-			  intel_encoder->type);
+		dev_WARN_ONCE(dev, 1, "unsupported intel_encoder type %d\n",
+			      intel_encoder->type);
 		return -EINVAL;
 	}
 
@@ -894,6 +895,7 @@ static int intel_load_vbt_firmware(struct drm_i915_private *dev_priv)
 
 int intel_opregion_setup(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_opregion *opregion = &dev_priv->opregion;
 	struct pci_dev *pdev = dev_priv->drm.pdev;
 	u32 asls, mboxes;
@@ -984,7 +986,7 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 		 */
 		if (opregion->header->over.major > 2 ||
 		    opregion->header->over.minor >= 1) {
-			WARN_ON(rvda < OPREGION_SIZE);
+			dev_WARN_ON(dev, rvda < OPREGION_SIZE);
 
 			rvda += asls;
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index e40c3a0e2cd7..d30389303f5f 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -244,10 +244,11 @@ alloc_request(struct intel_overlay *overlay, void (*fn)(struct intel_overlay *))
 static int intel_overlay_on(struct intel_overlay *overlay)
 {
 	struct drm_i915_private *dev_priv = overlay->i915;
+	struct device *dev = i915_to_dev(dev_priv);
 	struct i915_request *rq;
 	u32 *cs;
 
-	WARN_ON(overlay->active);
+	dev_WARN_ON(dev, overlay->active);
 
 	rq = alloc_request(overlay, NULL);
 	if (IS_ERR(rq))
@@ -311,11 +312,12 @@ static int intel_overlay_continue(struct intel_overlay *overlay,
 				  bool load_polyphase_filter)
 {
 	struct drm_i915_private *dev_priv = overlay->i915;
+	struct device *dev = i915_to_dev(dev_priv);
 	struct i915_request *rq;
 	u32 flip_addr = overlay->flip_addr;
 	u32 tmp, *cs;
 
-	WARN_ON(!overlay->active);
+	dev_WARN_ON(dev, !overlay->active);
 
 	if (load_polyphase_filter)
 		flip_addr |= OFC_UPDATE;
@@ -753,13 +755,15 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 {
 	struct overlay_registers __iomem *regs = overlay->regs;
 	struct drm_i915_private *dev_priv = overlay->i915;
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 swidth, swidthsw, sheight, ostride;
 	enum pipe pipe = overlay->crtc->pipe;
 	bool scale_changed = false;
 	struct i915_vma *vma;
 	int ret, tmp_width;
 
-	WARN_ON(!drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
+	dev_WARN_ON(dev,
+		    !drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
 
 	ret = intel_overlay_release_old_vid(overlay);
 	if (ret != 0)
@@ -855,9 +859,11 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 int intel_overlay_switch_off(struct intel_overlay *overlay)
 {
 	struct drm_i915_private *dev_priv = overlay->i915;
+	struct device *dev = i915_to_dev(dev_priv);
 	int ret;
 
-	WARN_ON(!drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
+	dev_WARN_ON(dev,
+		    !drm_modeset_is_locked(&dev_priv->drm.mode_config.connection_mutex));
 
 	ret = intel_overlay_recover_from_interrupt(overlay);
 	if (ret != 0)
@@ -1378,6 +1384,7 @@ void intel_overlay_setup(struct drm_i915_private *dev_priv)
 
 void intel_overlay_cleanup(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_overlay *overlay;
 
 	overlay = fetch_and_zero(&dev_priv->overlay);
@@ -1389,7 +1396,7 @@ void intel_overlay_cleanup(struct drm_i915_private *dev_priv)
 	 * Furthermore modesetting teardown happens beforehand so the
 	 * hardware should be off already.
 	 */
-	WARN_ON(overlay->active);
+	dev_WARN_ON(dev, overlay->active);
 
 	i915_gem_object_put(overlay->reg_bo);
 	i915_active_fini(&overlay->last_flip);
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 7b3ec6eb3382..c108e4934fbf 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -379,6 +379,7 @@ void intel_gmch_panel_fitting(struct intel_crtc *intel_crtc,
 			      int fitting_mode)
 {
 	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 pfit_control = 0, pfit_pgm_ratios = 0, border = 0;
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 
@@ -423,7 +424,7 @@ void intel_gmch_panel_fitting(struct intel_crtc *intel_crtc,
 		}
 		break;
 	default:
-		WARN(1, "bad panel fit mode: %d\n", fitting_mode);
+		dev_WARN(dev, 1, "bad panel fit mode: %d\n", fitting_mode);
 		return;
 	}
 
@@ -518,9 +519,10 @@ static u32 intel_panel_compute_brightness(struct intel_connector *connector,
 					  u32 val)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_panel *panel = &connector->panel;
 
-	WARN_ON(panel->backlight.max == 0);
+	dev_WARN_ON(dev, panel->backlight.max == 0);
 
 	if (i915_modparams.invert_brightness < 0)
 		return val;
@@ -569,7 +571,9 @@ static u32 i9xx_get_backlight(struct intel_connector *connector)
 
 static u32 _vlv_get_backlight(struct drm_i915_private *dev_priv, enum pipe pipe)
 {
-	if (WARN_ON(pipe != PIPE_A && pipe != PIPE_B))
+	struct device *dev = i915_to_dev(dev_priv);
+
+	if (dev_WARN_ON(dev, pipe != PIPE_A && pipe != PIPE_B))
 		return 0;
 
 	return I915_READ(VLV_BLC_PWM_CTL(pipe)) & BACKLIGHT_DUTY_CYCLE_MASK;
@@ -623,10 +627,11 @@ static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_panel *panel = &connector->panel;
 	u32 tmp, mask;
 
-	WARN_ON(panel->backlight.max == 0);
+	dev_WARN_ON(dev, panel->backlight.max == 0);
 
 	if (panel->backlight.combination_mode) {
 		u8 lbpc;
@@ -695,6 +700,7 @@ void intel_panel_set_backlight_acpi(const struct drm_connector_state *conn_state
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_panel *panel = &connector->panel;
 	u32 hw_level;
 
@@ -709,7 +715,7 @@ void intel_panel_set_backlight_acpi(const struct drm_connector_state *conn_state
 
 	mutex_lock(&dev_priv->backlight_lock);
 
-	WARN_ON(panel->backlight.max == 0);
+	dev_WARN_ON(dev, panel->backlight.max == 0);
 
 	hw_level = clamp_user_to_hw(connector, user_level, user_max);
 	panel->backlight.level = hw_level;
@@ -1229,6 +1235,7 @@ static void intel_panel_set_backlight(const struct drm_connector_state *conn_sta
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_panel *panel = &connector->panel;
 	u32 hw_level;
 
@@ -1237,7 +1244,7 @@ static void intel_panel_set_backlight(const struct drm_connector_state *conn_sta
 
 	mutex_lock(&dev_priv->backlight_lock);
 
-	WARN_ON(panel->backlight.max == 0);
+	dev_WARN_ON(dev, panel->backlight.max == 0);
 
 	hw_level = scale_user_to_hw(connector, user_level, user_max);
 	panel->backlight.level = hw_level;
@@ -1543,10 +1550,11 @@ static u32 get_backlight_max_vbt(struct intel_connector *connector)
 static u32 get_backlight_min_vbt(struct intel_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_panel *panel = &connector->panel;
 	int min;
 
-	WARN_ON(panel->backlight.max == 0);
+	dev_WARN_ON(dev, panel->backlight.max == 0);
 
 	/*
 	 * XXX: If the vbt value is 255, it makes min equal to max, which leads
@@ -1728,10 +1736,11 @@ static int i965_setup_backlight(struct intel_connector *connector, enum pipe unu
 static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_panel *panel = &connector->panel;
 	u32 ctl, ctl2, val;
 
-	if (WARN_ON(pipe != PIPE_A && pipe != PIPE_B))
+	if (dev_WARN_ON(dev, pipe != PIPE_A && pipe != PIPE_B))
 		return -ENODEV;
 
 	ctl2 = I915_READ(VLV_BLC_PWM_CTL2(pipe));
@@ -1907,6 +1916,7 @@ void intel_panel_update_backlight(struct intel_encoder *encoder,
 int intel_panel_setup_backlight(struct drm_connector *connector, enum pipe pipe)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_connector *intel_connector = to_intel_connector(connector);
 	struct intel_panel *panel = &intel_connector->panel;
 	int ret;
@@ -1921,7 +1931,7 @@ int intel_panel_setup_backlight(struct drm_connector *connector, enum pipe pipe)
 	}
 
 	/* ensure intel_panel has been initialized first */
-	if (WARN_ON(!panel->backlight.setup))
+	if (dev_WARN_ON(dev, !panel->backlight.setup))
 		return -ENODEV;
 
 	/* set level and max in panel struct */
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index 283416c73205..4e4b44323195 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -288,6 +288,7 @@ static void
 intel_crtc_crc_setup_workarounds(struct intel_crtc *crtc, bool enable)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc_state *pipe_config;
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
@@ -329,7 +330,8 @@ intel_crtc_crc_setup_workarounds(struct intel_crtc *crtc, bool enable)
 
 	drm_atomic_state_put(state);
 unlock:
-	WARN(ret, "Toggling workaround to %i returns %i\n", enable, ret);
+	dev_WARN(dev, ret, "Toggling workaround to %i returns %i\n", enable,
+		 ret);
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 16e9ff47d519..aa283cf92d50 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -76,9 +76,10 @@ static bool psr_global_enabled(u32 debug)
 static bool intel_psr2_enabled(struct drm_i915_private *dev_priv,
 			       const struct intel_crtc_state *crtc_state)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	/* Cannot enable DSC and PSR2 simultaneously */
-	WARN_ON(crtc_state->dsc.compression_enable &&
-		crtc_state->has_psr2);
+	dev_WARN_ON(dev, crtc_state->dsc.compression_enable &&
+		    crtc_state->has_psr2);
 
 	switch (dev_priv->psr.debug & I915_PSR_DEBUG_MODE_MASK) {
 	case I915_PSR_DEBUG_DISABLE:
@@ -735,12 +736,17 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 static void intel_psr_activate(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 
 	if (transcoder_has_psr2(dev_priv, dev_priv->psr.transcoder))
-		WARN_ON(I915_READ(EDP_PSR2_CTL(dev_priv->psr.transcoder)) & EDP_PSR2_ENABLE);
-
-	WARN_ON(I915_READ(EDP_PSR_CTL(dev_priv->psr.transcoder)) & EDP_PSR_ENABLE);
-	WARN_ON(dev_priv->psr.active);
+		dev_WARN_ON(dev,
+			    I915_READ(EDP_PSR2_CTL(dev_priv->psr.transcoder)) &
+			    EDP_PSR2_ENABLE);
+
+	dev_WARN_ON(dev,
+		    I915_READ(EDP_PSR_CTL(dev_priv->psr.transcoder)) &
+		    EDP_PSR_ENABLE);
+	dev_WARN_ON(dev, dev_priv->psr.active);
 	lockdep_assert_held(&dev_priv->psr.lock);
 
 	/* psr1 and psr2 are mutually exclusive.*/
@@ -797,10 +803,11 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 static void intel_psr_enable_locked(struct drm_i915_private *dev_priv,
 				    const struct intel_crtc_state *crtc_state)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_dp *intel_dp = dev_priv->psr.dp;
 	u32 val;
 
-	WARN_ON(dev_priv->psr.enabled);
+	dev_WARN_ON(dev, dev_priv->psr.enabled);
 
 	dev_priv->psr.psr2_enabled = intel_psr2_enabled(dev_priv, crtc_state);
 	dev_priv->psr.busy_frontbuffer_bits = 0;
@@ -851,14 +858,15 @@ void intel_psr_enable(struct intel_dp *intel_dp,
 		      const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 
 	if (!crtc_state->has_psr)
 		return;
 
-	if (WARN_ON(!CAN_PSR(dev_priv)))
+	if (dev_WARN_ON(dev, !CAN_PSR(dev_priv)))
 		return;
 
-	WARN_ON(dev_priv->drrs.dp);
+	dev_WARN_ON(dev, dev_priv->drrs.dp);
 
 	mutex_lock(&dev_priv->psr.lock);
 
@@ -875,16 +883,17 @@ void intel_psr_enable(struct intel_dp *intel_dp,
 
 static void intel_psr_exit(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 val;
 
 	if (!dev_priv->psr.active) {
 		if (transcoder_has_psr2(dev_priv, dev_priv->psr.transcoder)) {
 			val = I915_READ(EDP_PSR2_CTL(dev_priv->psr.transcoder));
-			WARN_ON(val & EDP_PSR2_ENABLE);
+			dev_WARN_ON(dev, val & EDP_PSR2_ENABLE);
 		}
 
 		val = I915_READ(EDP_PSR_CTL(dev_priv->psr.transcoder));
-		WARN_ON(val & EDP_PSR_ENABLE);
+		dev_WARN_ON(dev, val & EDP_PSR_ENABLE);
 
 		return;
 	}
@@ -892,12 +901,12 @@ static void intel_psr_exit(struct drm_i915_private *dev_priv)
 	if (dev_priv->psr.psr2_enabled) {
 		tgl_disallow_dc3co_on_psr2_exit(dev_priv);
 		val = I915_READ(EDP_PSR2_CTL(dev_priv->psr.transcoder));
-		WARN_ON(!(val & EDP_PSR2_ENABLE));
+		dev_WARN_ON(dev, !(val & EDP_PSR2_ENABLE));
 		val &= ~EDP_PSR2_ENABLE;
 		I915_WRITE(EDP_PSR2_CTL(dev_priv->psr.transcoder), val);
 	} else {
 		val = I915_READ(EDP_PSR_CTL(dev_priv->psr.transcoder));
-		WARN_ON(!(val & EDP_PSR_ENABLE));
+		dev_WARN_ON(dev, !(val & EDP_PSR_ENABLE));
 		val &= ~EDP_PSR_ENABLE;
 		I915_WRITE(EDP_PSR_CTL(dev_priv->psr.transcoder), val);
 	}
@@ -953,11 +962,12 @@ void intel_psr_disable(struct intel_dp *intel_dp,
 		       const struct intel_crtc_state *old_crtc_state)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
+	struct device *dev = i915_to_dev(dev_priv);
 
 	if (!old_crtc_state->has_psr)
 		return;
 
-	if (WARN_ON(!CAN_PSR(dev_priv)))
+	if (dev_WARN_ON(dev, !CAN_PSR(dev_priv)))
 		return;
 
 	mutex_lock(&dev_priv->psr.lock);
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 9b510a4cf8c5..2ceb0c72db33 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1429,6 +1429,7 @@ static void intel_sdvo_pre_enable(struct intel_encoder *intel_encoder,
 				  const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(intel_encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	const struct intel_sdvo_connector_state *sdvo_state =
@@ -1499,7 +1500,7 @@ static void intel_sdvo_pre_enable(struct intel_encoder *intel_encoder,
 
 	switch (crtc_state->pixel_multiplier) {
 	default:
-		WARN(1, "unknown pixel multiplier specified\n");
+		dev_WARN(dev, 1, "unknown pixel multiplier specified\n");
 		/* fall through */
 	case 1: rate = SDVO_CLOCK_RATE_MULT_1X; break;
 	case 2: rate = SDVO_CLOCK_RATE_MULT_2X; break;
@@ -3229,10 +3230,11 @@ intel_sdvo_init_ddc_proxy(struct intel_sdvo *sdvo,
 static void assert_sdvo_port_valid(const struct drm_i915_private *dev_priv,
 				   enum port port)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	if (HAS_PCH_SPLIT(dev_priv))
-		WARN_ON(port != PORT_B);
+		dev_WARN_ON(dev, port != PORT_B);
 	else
-		WARN_ON(port != PORT_B && port != PORT_C);
+		dev_WARN_ON(dev, port != PORT_B && port != PORT_C);
 }
 
 bool intel_sdvo_init(struct drm_i915_private *dev_priv,
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 3f7b8f2ff671..58040d4ce256 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -83,6 +83,7 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct drm_display_mode *adjusted_mode = &new_crtc_state->hw.adjusted_mode;
 	long timeout = msecs_to_jiffies_timeout(1);
 	int scanline, min, max, vblank_start;
@@ -104,7 +105,7 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
 	if (min <= 0 || max <= 0)
 		goto irq_disable;
 
-	if (WARN_ON(drm_crtc_vblank_get(&crtc->base)))
+	if (dev_WARN_ON(dev, drm_crtc_vblank_get(&crtc->base)))
 		goto irq_disable;
 
 	/*
@@ -196,6 +197,7 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
 	ktime_t end_vbl_time = ktime_get();
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 
 	trace_intel_pipe_update_end(crtc, end_vbl_count, scanline_end);
 
@@ -204,7 +206,7 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 	 * event outside of the critical section - the spinlock might spin for a
 	 * while ... */
 	if (new_crtc_state->uapi.event) {
-		WARN_ON(drm_crtc_vblank_get(&crtc->base) != 0);
+		dev_WARN_ON(dev, drm_crtc_vblank_get(&crtc->base) != 0);
 
 		spin_lock(&crtc->base.dev->event_lock);
 		drm_crtc_arm_vblank_event(&crtc->base,
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 7773169b7331..d5e3e4e6c6d2 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -55,13 +55,14 @@ tc_port_load_fia_params(struct drm_i915_private *i915,
 u32 intel_tc_port_get_lane_mask(struct intel_digital_port *dig_port)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(i915);
 	struct intel_uncore *uncore = &i915->uncore;
 	u32 lane_mask;
 
 	lane_mask = intel_uncore_read(uncore,
 				      PORT_TX_DFLEXDPSP(dig_port->tc_phy_fia));
 
-	WARN_ON(lane_mask == 0xffffffff);
+	dev_WARN_ON(dev, lane_mask == 0xffffffff);
 
 	lane_mask &= DP_LANE_ASSIGNMENT_MASK(dig_port->tc_phy_fia_idx);
 	return lane_mask >> DP_LANE_ASSIGNMENT_SHIFT(dig_port->tc_phy_fia_idx);
@@ -70,13 +71,14 @@ u32 intel_tc_port_get_lane_mask(struct intel_digital_port *dig_port)
 u32 intel_tc_port_get_pin_assignment_mask(struct intel_digital_port *dig_port)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(i915);
 	struct intel_uncore *uncore = &i915->uncore;
 	u32 pin_mask;
 
 	pin_mask = intel_uncore_read(uncore,
 				     PORT_TX_DFLEXPA1(dig_port->tc_phy_fia));
 
-	WARN_ON(pin_mask == 0xffffffff);
+	dev_WARN_ON(dev, pin_mask == 0xffffffff);
 
 	return (pin_mask & DP_PIN_ASSIGNMENT_MASK(dig_port->tc_phy_fia_idx)) >>
 	       DP_PIN_ASSIGNMENT_SHIFT(dig_port->tc_phy_fia_idx);
@@ -116,11 +118,12 @@ void intel_tc_port_set_fia_lane_count(struct intel_digital_port *dig_port,
 				      int required_lanes)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(i915);
 	bool lane_reversal = dig_port->saved_port_bits & DDI_BUF_PORT_REVERSAL;
 	struct intel_uncore *uncore = &i915->uncore;
 	u32 val;
 
-	WARN_ON(lane_reversal && dig_port->tc_mode != TC_PORT_LEGACY);
+	dev_WARN_ON(dev, lane_reversal && dig_port->tc_mode != TC_PORT_LEGACY);
 
 	val = intel_uncore_read(uncore,
 				PORT_TX_DFLEXDPMLE1(dig_port->tc_phy_fia));
@@ -172,6 +175,7 @@ static void tc_port_fixup_legacy_flag(struct intel_digital_port *dig_port,
 static u32 tc_port_live_status_mask(struct intel_digital_port *dig_port)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(i915);
 	enum tc_port tc_port = intel_port_to_tc(i915, dig_port->base.port);
 	struct intel_uncore *uncore = &i915->uncore;
 	u32 mask = 0;
@@ -195,7 +199,7 @@ static u32 tc_port_live_status_mask(struct intel_digital_port *dig_port)
 		mask |= BIT(TC_PORT_LEGACY);
 
 	/* The sink can be connected only in a single mode. */
-	if (!WARN_ON(hweight32(mask) > 1))
+	if (!dev_WARN_ON(dev, hweight32(mask) > 1))
 		tc_port_fixup_legacy_flag(dig_port, mask);
 
 	return mask;
@@ -406,11 +410,13 @@ static void intel_tc_port_reset_mode(struct intel_digital_port *dig_port,
 				     int required_lanes)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(i915);
 	enum tc_port_mode old_tc_mode = dig_port->tc_mode;
 
 	intel_display_power_flush_work(i915);
-	WARN_ON(intel_display_power_is_enabled(i915,
-					       intel_aux_power_domain(dig_port)));
+	dev_WARN_ON(dev,
+		    intel_display_power_is_enabled(i915,
+					   intel_aux_power_domain(dig_port)));
 
 	icl_tc_phy_disconnect(dig_port);
 	icl_tc_phy_connect(dig_port, required_lanes);
@@ -493,6 +499,7 @@ static void __intel_tc_port_lock(struct intel_digital_port *dig_port,
 				 int required_lanes)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(i915);
 	intel_wakeref_t wakeref;
 
 	wakeref = intel_display_power_get(i915, POWER_DOMAIN_DISPLAY_CORE);
@@ -503,7 +510,7 @@ static void __intel_tc_port_lock(struct intel_digital_port *dig_port,
 	    intel_tc_port_needs_reset(dig_port))
 		intel_tc_port_reset_mode(dig_port, required_lanes);
 
-	WARN_ON(dig_port->tc_lock_wakeref);
+	dev_WARN_ON(dev, dig_port->tc_lock_wakeref);
 	dig_port->tc_lock_wakeref = wakeref;
 }
 
@@ -547,10 +554,11 @@ void intel_tc_port_put_link(struct intel_digital_port *dig_port)
 void intel_tc_port_init(struct intel_digital_port *dig_port, bool is_legacy)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct device *dev = i915_to_dev(i915);
 	enum port port = dig_port->base.port;
 	enum tc_port tc_port = intel_port_to_tc(i915, port);
 
-	if (WARN_ON(tc_port == PORT_TC_NONE))
+	if (dev_WARN_ON(dev, tc_port == PORT_TC_NONE))
 		return;
 
 	snprintf(dig_port->tc_port_name, sizeof(dig_port->tc_port_name),
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 6bab08db5d75..44fa8f4d32db 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -363,6 +363,7 @@ static bool is_pipe_dsc(const struct intel_crtc_state *crtc_state)
 {
 	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	const struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(i915);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (INTEL_GEN(i915) >= 12)
@@ -374,7 +375,7 @@ static bool is_pipe_dsc(const struct intel_crtc_state *crtc_state)
 		return false;
 
 	/* There's no pipe A DSC engine on ICL */
-	WARN_ON(crtc->pipe == PIPE_A);
+	dev_WARN_ON(dev, crtc->pipe == PIPE_A);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 70ab378803c4..18feef4dbe13 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -962,6 +962,7 @@ static bool intel_dsi_get_hw_state(struct intel_encoder *encoder,
 				   enum pipe *pipe)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(&encoder->base);
 	intel_wakeref_t wakeref;
 	enum port port;
@@ -1014,7 +1015,7 @@ static bool intel_dsi_get_hw_state(struct intel_encoder *encoder,
 			tmp &= BXT_PIPE_SELECT_MASK;
 			tmp >>= BXT_PIPE_SELECT_SHIFT;
 
-			if (WARN_ON(tmp > PIPE_C))
+			if (dev_WARN_ON(dev, tmp > PIPE_C))
 				continue;
 
 			*pipe = tmp;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index c8264eb036bf..7116f5764cf9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -41,6 +41,7 @@ static struct drm_i915_gem_object *first_mm_object(struct list_head *list)
 
 void i915_gem_suspend_late(struct drm_i915_private *i915)
 {
+	struct device *dev = i915_to_dev(i915);
 	struct drm_i915_gem_object *obj;
 	struct list_head *phases[] = {
 		&i915->mm.shrink_list,
@@ -85,7 +86,7 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 			spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 
 			i915_gem_object_lock(obj);
-			WARN_ON(i915_gem_object_set_to_gtt_domain(obj, false));
+			dev_WARN_ON(dev, i915_gem_object_set_to_gtt_domain(obj, false));
 			i915_gem_object_unlock(obj);
 			i915_gem_object_put(obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index a2a980d9d241..6ca29707ef9a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -28,6 +28,7 @@ static void check_release_pagevec(struct pagevec *pvec)
 static int shmem_get_pages(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct device *dev = i915_to_dev(i915);
 	struct intel_memory_region *mem = obj->mm.region;
 	const unsigned long page_count = obj->base.size / PAGE_SIZE;
 	unsigned long i;
@@ -148,7 +149,8 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 		last_pfn = page_to_pfn(page);
 
 		/* Check that the i965g/gm workaround works. */
-		WARN_ON((gfp & __GFP_DMA32) && (last_pfn >= 0x00100000UL));
+		dev_WARN_ON(dev,
+			    (gfp & __GFP_DMA32) && (last_pfn >= 0x00100000UL));
 	}
 	if (sg) { /* loop terminated early; short sg table */
 		sg_page_sizes |= sg->length;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index f7e4b39c734f..09e8db629276 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -399,23 +399,28 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 
 void i915_gem_driver_register__shrinker(struct drm_i915_private *i915)
 {
+	struct device *dev = i915_to_dev(i915);
 	i915->mm.shrinker.scan_objects = i915_gem_shrinker_scan;
 	i915->mm.shrinker.count_objects = i915_gem_shrinker_count;
 	i915->mm.shrinker.seeks = DEFAULT_SEEKS;
 	i915->mm.shrinker.batch = 4096;
-	WARN_ON(register_shrinker(&i915->mm.shrinker));
+	dev_WARN_ON(dev, register_shrinker(&i915->mm.shrinker));
 
 	i915->mm.oom_notifier.notifier_call = i915_gem_shrinker_oom;
-	WARN_ON(register_oom_notifier(&i915->mm.oom_notifier));
+	dev_WARN_ON(dev, register_oom_notifier(&i915->mm.oom_notifier));
 
 	i915->mm.vmap_notifier.notifier_call = i915_gem_shrinker_vmap;
-	WARN_ON(register_vmap_purge_notifier(&i915->mm.vmap_notifier));
+	dev_WARN_ON(dev,
+		    register_vmap_purge_notifier(&i915->mm.vmap_notifier));
 }
 
 void i915_gem_driver_unregister__shrinker(struct drm_i915_private *i915)
 {
-	WARN_ON(unregister_vmap_purge_notifier(&i915->mm.vmap_notifier));
-	WARN_ON(unregister_oom_notifier(&i915->mm.oom_notifier));
+	struct device *dev = i915_to_dev(i915);
+
+	dev_WARN_ON(dev,
+		    unregister_vmap_purge_notifier(&i915->mm.vmap_notifier));
+	dev_WARN_ON(dev, unregister_oom_notifier(&i915->mm.oom_notifier));
 	unregister_shrinker(&i915->mm.shrinker);
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 451f3078d60d..75cdb869a312 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -165,6 +165,7 @@ static void g4x_get_stolen_reserved(struct drm_i915_private *i915,
 				    resource_size_t *base,
 				    resource_size_t *size)
 {
+	struct device *dev = i915_to_dev(i915);
 	u32 reg_val = intel_uncore_read(uncore,
 					IS_GM45(i915) ?
 					CTG_STOLEN_RESERVED :
@@ -181,14 +182,14 @@ static void g4x_get_stolen_reserved(struct drm_i915_private *i915,
 	 * Whether ILK really reuses the ELK register for this is unclear.
 	 * Let's see if we catch anyone with this supposedly enabled on ILK.
 	 */
-	WARN(IS_GEN(i915, 5), "ILK stolen reserved found? 0x%08x\n",
-	     reg_val);
+	dev_WARN(dev, IS_GEN(i915, 5), "ILK stolen reserved found? 0x%08x\n",
+		 reg_val);
 
 	if (!(reg_val & G4X_STOLEN_RESERVED_ADDR2_MASK))
 		return;
 
 	*base = (reg_val & G4X_STOLEN_RESERVED_ADDR2_MASK) << 16;
-	WARN_ON((reg_val & G4X_STOLEN_RESERVED_ADDR1_MASK) < *base);
+	dev_WARN_ON(dev, (reg_val & G4X_STOLEN_RESERVED_ADDR1_MASK) < *base);
 
 	*size = stolen_top - *base;
 }
@@ -680,6 +681,7 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 					       resource_size_t gtt_offset,
 					       resource_size_t size)
 {
+	struct device *dev = i915_to_dev(i915);
 	struct intel_memory_region *mem = i915->mm.regions[INTEL_REGION_STOLEN];
 	struct i915_ggtt *ggtt = &i915->ggtt;
 	struct drm_i915_gem_object *obj;
@@ -694,9 +696,10 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 			 &stolen_offset, &gtt_offset, &size);
 
 	/* KISS and expect everything to be page-aligned */
-	if (WARN_ON(size == 0) ||
-	    WARN_ON(!IS_ALIGNED(size, I915_GTT_PAGE_SIZE)) ||
-	    WARN_ON(!IS_ALIGNED(stolen_offset, I915_GTT_MIN_ALIGNMENT)))
+	if (dev_WARN_ON(dev, size == 0) ||
+	    dev_WARN_ON(dev, !IS_ALIGNED(size, I915_GTT_PAGE_SIZE)) ||
+	    dev_WARN_ON(dev,
+			!IS_ALIGNED(stolen_offset, I915_GTT_MIN_ALIGNMENT)))
 		return ERR_PTR(-EINVAL);
 
 	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 825c94e7ca0b..37869515acff 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -426,15 +426,16 @@ void intel_engines_free(struct intel_gt *gt)
 int intel_engines_init_mmio(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
+	struct device *dev = i915_to_dev(i915);
 	struct intel_device_info *device_info = mkwrite_device_info(i915);
 	const unsigned int engine_mask = INTEL_INFO(i915)->engine_mask;
 	unsigned int mask = 0;
 	unsigned int i;
 	int err;
 
-	WARN_ON(engine_mask == 0);
-	WARN_ON(engine_mask &
-		GENMASK(BITS_PER_TYPE(mask) - 1, I915_NUM_ENGINES));
+	dev_WARN_ON(dev, engine_mask == 0);
+	dev_WARN_ON(dev, engine_mask &
+		    GENMASK(BITS_PER_TYPE(mask) - 1, I915_NUM_ENGINES));
 
 	if (i915_inject_probe_failure(i915))
 		return -ENODEV;
@@ -455,7 +456,7 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 	 * are added to the driver by a warning and disabling the forgotten
 	 * engines.
 	 */
-	if (WARN_ON(mask != engine_mask))
+	if (dev_WARN_ON(dev, mask != engine_mask))
 		device_info->engine_mask = mask;
 
 	RUNTIME_INFO(i915)->num_engines = hweight32(mask);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 9e7f12bef828..2760982d14f7 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -185,6 +185,7 @@ static void add_legacy_ring(struct legacy_ring *ring,
 
 void intel_engines_driver_register(struct drm_i915_private *i915)
 {
+	struct device *dev = i915_to_dev(i915);
 	struct legacy_ring ring = {};
 	u8 uabi_instances[4] = {};
 	struct list_head *it, *next;
@@ -278,7 +279,7 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 			}
 		}
 
-		if (WARN(errors, "Invalid UABI engine mapping found"))
+		if (dev_WARN(dev, errors, "Invalid UABI engine mapping found"))
 			i915->uabi_engines = RB_ROOT;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index eeef90b55c64..847ed933fe59 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -283,6 +283,7 @@ static const struct drm_i915_mocs_entry icl_mocs_table[] = {
 static bool get_mocs_settings(const struct drm_i915_private *i915,
 			      struct drm_i915_mocs_table *table)
 {
+	struct device *dev = i915_to_dev(i915);
 	if (INTEL_GEN(i915) >= 12) {
 		table->size  = ARRAY_SIZE(tgl_mocs_table);
 		table->table = tgl_mocs_table;
@@ -300,8 +301,8 @@ static bool get_mocs_settings(const struct drm_i915_private *i915,
 		table->n_entries = GEN9_NUM_MOCS_ENTRIES;
 		table->table = broxton_mocs_table;
 	} else {
-		WARN_ONCE(INTEL_GEN(i915) >= 9,
-			  "Platform that should have a MOCS table does not.\n");
+		dev_WARN_ONCE(dev, INTEL_GEN(i915) >= 9,
+			      "Platform that should have a MOCS table does not.\n");
 		return false;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 9e303c29d6e3..2c168cd13ee2 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -694,6 +694,7 @@ static u64 vlv_residency_raw(struct intel_uncore *uncore, const i915_reg_t reg)
 u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
 {
 	struct drm_i915_private *i915 = rc6_to_i915(rc6);
+	struct device *dev = i915_to_dev(i915);
 	struct intel_uncore *uncore = rc6_to_uncore(rc6);
 	u64 time_hw, prev_hw, overflow_hw;
 	unsigned int fw_domains;
@@ -713,7 +714,7 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const i915_reg_t reg)
 	 */
 	i = (i915_mmio_reg_offset(reg) -
 	     i915_mmio_reg_offset(GEN6_GT_GFX_RC6_LOCKED)) / sizeof(u32);
-	if (WARN_ON_ONCE(i >= ARRAY_SIZE(rc6->cur_residency)))
+	if (dev_WARN_ON_ONCE(dev, i >= ARRAY_SIZE(rc6->cur_residency)))
 		return 0;
 
 	fw_domains = intel_uncore_forcewake_for_reg(uncore, reg, FW_REG_READ);
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 81f872f9ef03..0762091edb8e 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -562,12 +562,13 @@ static void set_hwsp(struct intel_engine_cs *engine, u32 offset)
 static void flush_cs_tlb(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *dev_priv = engine->i915;
+	struct device *dev = i915_to_dev(dev_priv);
 
 	if (!IS_GEN_RANGE(dev_priv, 6, 7))
 		return;
 
 	/* ring should be idle before issuing a sync flush*/
-	WARN_ON((ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
+	dev_WARN_ON(dev, (ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
 
 	ENGINE_WRITE(engine, RING_INSTPM,
 		     _MASKED_BIT_ENABLE(INSTPM_TLB_INVALIDATE |
@@ -1801,9 +1802,10 @@ static void gen6_bsd_set_default_submission(struct intel_engine_cs *engine)
 static void ring_release(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *dev_priv = engine->i915;
+	struct device *dev = i915_to_dev(dev_priv);
 
-	WARN_ON(INTEL_GEN(dev_priv) > 2 &&
-		(ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
+	dev_WARN_ON(dev, INTEL_GEN(dev_priv) > 2 &&
+		    (ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
 
 	intel_engine_cleanup_common(engine);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index f232036c3c7a..f4aacb09bdad 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -996,6 +996,7 @@ static bool chv_rps_enable(struct intel_rps *rps)
 {
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 	struct drm_i915_private *i915 = rps_to_i915(rps);
+	struct device *dev = i915_to_dev(i915);
 	u32 val;
 
 	/* 1: Program defaults and thresholds for RPS*/
@@ -1026,7 +1027,7 @@ static bool chv_rps_enable(struct intel_rps *rps)
 	vlv_punit_put(i915);
 
 	/* RPS code assumes GPLL is used */
-	WARN_ONCE((val & GPLLENABLE) == 0, "GPLL not enabled\n");
+	dev_WARN_ONCE(dev, (val & GPLLENABLE) == 0, "GPLL not enabled\n");
 
 	DRM_DEBUG_DRIVER("GPLL enabled? %s\n", yesno(val & GPLLENABLE));
 	DRM_DEBUG_DRIVER("GPU status: 0x%08x\n", val);
@@ -1094,6 +1095,7 @@ static bool vlv_rps_enable(struct intel_rps *rps)
 {
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 	struct drm_i915_private *i915 = rps_to_i915(rps);
+	struct device *dev = i915_to_dev(i915);
 	u32 val;
 
 	intel_uncore_write_fw(uncore, GEN6_RP_DOWN_TIMEOUT, 1000000);
@@ -1123,7 +1125,7 @@ static bool vlv_rps_enable(struct intel_rps *rps)
 	vlv_punit_put(i915);
 
 	/* RPS code assumes GPLL is used */
-	WARN_ONCE((val & GPLLENABLE) == 0, "GPLL not enabled\n");
+	dev_WARN_ONCE(dev, (val & GPLLENABLE) == 0, "GPLL not enabled\n");
 
 	DRM_DEBUG_DRIVER("GPLL enabled? %s\n", yesno(val & GPLLENABLE));
 	DRM_DEBUG_DRIVER("GPU status: 0x%08x\n", val);
@@ -1172,6 +1174,7 @@ static unsigned long __ips_gfx_val(struct intel_ips *ips)
 void intel_rps_enable(struct intel_rps *rps)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
+	struct device *dev = i915_to_dev(i915);
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
@@ -1191,11 +1194,11 @@ void intel_rps_enable(struct intel_rps *rps)
 	if (!rps->enabled)
 		return;
 
-	WARN_ON(rps->max_freq < rps->min_freq);
-	WARN_ON(rps->idle_freq > rps->max_freq);
+	dev_WARN_ON(dev, rps->max_freq < rps->min_freq);
+	dev_WARN_ON(dev, rps->idle_freq > rps->max_freq);
 
-	WARN_ON(rps->efficient_freq < rps->min_freq);
-	WARN_ON(rps->efficient_freq > rps->max_freq);
+	dev_WARN_ON(dev, rps->efficient_freq < rps->min_freq);
+	dev_WARN_ON(dev, rps->efficient_freq > rps->max_freq);
 }
 
 static void gen6_rps_disable(struct intel_rps *rps)
@@ -1343,6 +1346,7 @@ static void vlv_rps_init(struct intel_rps *rps)
 static void chv_rps_init(struct intel_rps *rps)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
+	struct device *dev = i915_to_dev(i915);
 	u32 val;
 
 	vlv_iosf_sb_get(i915,
@@ -1390,9 +1394,10 @@ static void chv_rps_init(struct intel_rps *rps)
 			BIT(VLV_IOSF_SB_NC) |
 			BIT(VLV_IOSF_SB_CCK));
 
-	WARN_ONCE((rps->max_freq | rps->efficient_freq | rps->rp1_freq |
-		   rps->min_freq) & 1,
-		  "Odd GPU freq values\n");
+	dev_WARN_ONCE(dev, (rps->max_freq | rps->efficient_freq |
+			    rps->rp1_freq |
+			    rps->min_freq) & 1,
+		      "Odd GPU freq values\n");
 }
 
 static void vlv_c0_read(struct intel_uncore *uncore, struct intel_rps_ei *ei)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 4e292d4bf7b9..4b11c3d2cad6 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -776,6 +776,7 @@ cfl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 static void
 wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
 {
+	struct device *dev = i915_to_dev(i915);
 	const struct sseu_dev_info *sseu = &RUNTIME_INFO(i915)->sseu;
 	unsigned int slice, subslice;
 	u32 l3_en, mcr, mcr_mask;
@@ -827,7 +828,7 @@ wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
 		DRM_WARN("No common index found between subslice mask %x and L3 bank mask %x!\n",
 			 intel_sseu_get_subslices(sseu, slice), l3_en);
 		subslice = fls(l3_en);
-		WARN_ON(!subslice);
+		dev_WARN_ON(dev, !subslice);
 	}
 	subslice--;
 
diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 771420453f82..8c7e68a1bdc5 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -129,16 +129,17 @@ void intel_vgpu_write_fence(struct intel_vgpu *vgpu,
 {
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct drm_i915_private *dev_priv = gvt->dev_priv;
+	struct device *dev = i915_to_dev(dev_priv);
 	struct i915_fence_reg *reg;
 	i915_reg_t fence_reg_lo, fence_reg_hi;
 
 	assert_rpm_wakelock_held(&dev_priv->runtime_pm);
 
-	if (WARN_ON(fence >= vgpu_fence_sz(vgpu)))
+	if (dev_WARN_ON(dev, fence >= vgpu_fence_sz(vgpu)))
 		return;
 
 	reg = vgpu->fence.regs[fence];
-	if (WARN_ON(!reg))
+	if (dev_WARN_ON(dev, !reg))
 		return;
 
 	fence_reg_lo = FENCE_REG_GEN6_LO(reg->id);
@@ -164,10 +165,11 @@ static void free_vgpu_fence(struct intel_vgpu *vgpu)
 {
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct drm_i915_private *dev_priv = gvt->dev_priv;
+	struct device *dev = i915_to_dev(dev_priv);
 	struct i915_fence_reg *reg;
 	u32 i;
 
-	if (WARN_ON(!vgpu_fence_sz(vgpu)))
+	if (dev_WARN_ON(dev, !vgpu_fence_sz(vgpu)))
 		return;
 
 	intel_runtime_pm_get(&dev_priv->runtime_pm);
diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 21a176cd8acc..c6b9e58548ed 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -1214,6 +1214,7 @@ static int gen8_decode_mi_display_flip(struct parser_exec_state *s,
 		struct mi_display_flip_command_info *info)
 {
 	struct drm_i915_private *dev_priv = s->vgpu->gvt->dev_priv;
+	struct device *dev = i915_to_dev(dev_priv);
 	struct plane_code_mapping gen8_plane_code[] = {
 		[0] = {PIPE_A, PLANE_A, PRIMARY_A_FLIP_DONE},
 		[1] = {PIPE_B, PLANE_A, PRIMARY_B_FLIP_DONE},
@@ -1230,7 +1231,7 @@ static int gen8_decode_mi_display_flip(struct parser_exec_state *s,
 	dword2 = cmd_val(s, 2);
 
 	v = (dword0 & GENMASK(21, 19)) >> 19;
-	if (WARN_ON(v >= ARRAY_SIZE(gen8_plane_code)))
+	if (dev_WARN_ON(dev, v >= ARRAY_SIZE(gen8_plane_code)))
 		return -EBADRQC;
 
 	info->pipe = gen8_plane_code[v].pipe;
@@ -1250,7 +1251,7 @@ static int gen8_decode_mi_display_flip(struct parser_exec_state *s,
 		info->stride_reg = SPRSTRIDE(info->pipe);
 		info->surf_reg = SPRSURF(info->pipe);
 	} else {
-		WARN_ON(1);
+		dev_WARN_ON(dev, 1);
 		return -EBADRQC;
 	}
 	return 0;
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index e1c313da6c00..66516d6f8811 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -70,8 +70,9 @@ static int edp_pipe_is_enabled(struct intel_vgpu *vgpu)
 int pipe_is_enabled(struct intel_vgpu *vgpu, int pipe)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->dev_priv;
+	struct device *dev = i915_to_dev(dev_priv);
 
-	if (WARN_ON(pipe < PIPE_A || pipe >= I915_MAX_PIPES))
+	if (dev_WARN_ON(dev, pipe < PIPE_A || pipe >= I915_MAX_PIPES))
 		return -EINVAL;
 
 	if (vgpu_vreg_t(vgpu, PIPECONF(pipe)) & PIPECONF_ENABLE)
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 2477a1e5a166..38bd30c2a5fe 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -58,6 +58,7 @@ static int vgpu_gem_get_pages(
 		struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_vgpu *vgpu;
 	struct sg_table *st;
 	struct scatterlist *sg;
@@ -67,11 +68,11 @@ static int vgpu_gem_get_pages(
 	u32 page_num;
 
 	fb_info = (struct intel_vgpu_fb_info *)obj->gvt_info;
-	if (WARN_ON(!fb_info))
+	if (dev_WARN_ON(dev, !fb_info))
 		return -ENODEV;
 
 	vgpu = fb_info->obj->vgpu;
-	if (WARN_ON(!vgpu))
+	if (dev_WARN_ON(dev, !vgpu))
 		return -ENODEV;
 
 	st = kmalloc(sizeof(*st), GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index 1fe6124918f1..e8541b50ab21 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -136,6 +136,7 @@ static int gmbus0_mmio_write(struct intel_vgpu *vgpu,
 			unsigned int offset, void *p_data, unsigned int bytes)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->dev_priv;
+	struct device *dev = i915_to_dev(dev_priv);
 	int port, pin_select;
 
 	memcpy(&vgpu_vreg(vgpu, offset), p_data, bytes);
@@ -153,7 +154,7 @@ static int gmbus0_mmio_write(struct intel_vgpu *vgpu,
 		port = cnp_get_port_from_gmbus0(pin_select);
 	else
 		port = get_port_from_gmbus0(pin_select);
-	if (WARN_ON(port < 0))
+	if (dev_WARN_ON(dev, port < 0))
 		return 0;
 
 	vgpu->display.i2c_edid.state = I2C_GMBUS;
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 8f37eefa0a02..58b0011786ed 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -265,9 +265,10 @@ static int init_service_thread(struct intel_gvt *gvt)
  */
 void intel_gvt_clean_device(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_gvt *gvt = to_gvt(dev_priv);
 
-	if (WARN_ON(!gvt))
+	if (dev_WARN_ON(dev, !gvt))
 		return;
 
 	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
@@ -302,11 +303,12 @@ void intel_gvt_clean_device(struct drm_i915_private *dev_priv)
  */
 int intel_gvt_init_device(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_gvt *gvt;
 	struct intel_vgpu *vgpu;
 	int ret;
 
-	if (WARN_ON(dev_priv->gvt))
+	if (dev_WARN_ON(dev, dev_priv->gvt))
 		return -EEXIST;
 
 	gvt = kzalloc(sizeof(struct intel_gvt), GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 6d28d72e6c7e..73f668885bea 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -822,6 +822,7 @@ static int trigger_aux_channel_interrupt(struct intel_vgpu *vgpu,
 		unsigned int reg)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->dev_priv;
+	struct device *dev = i915_to_dev(dev_priv);
 	enum intel_gvt_event_type event;
 
 	if (reg == i915_mmio_reg_offset(DP_AUX_CH_CTL(AUX_CH_A)))
@@ -836,7 +837,7 @@ static int trigger_aux_channel_interrupt(struct intel_vgpu *vgpu,
 		 reg == i915_mmio_reg_offset(DP_AUX_CH_CTL(AUX_CH_D)))
 		event = AUX_CHANNEL_D;
 	else {
-		WARN_ON(true);
+		dev_WARN_ON(dev, true);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index aaf15916d29a..82dbcd091f5b 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -347,6 +347,7 @@ static u32 gen8_tlb_mmio_offset_list[] = {
 static void handle_tlb_pending_event(struct intel_vgpu *vgpu, int ring_id)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->dev_priv;
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_uncore *uncore = &dev_priv->uncore;
 	struct intel_vgpu_submission *s = &vgpu->submission;
 	u32 *regs = vgpu->gvt->engine_mmio_list.tlb_mmio_offset_list;
@@ -357,7 +358,7 @@ static void handle_tlb_pending_event(struct intel_vgpu *vgpu, int ring_id)
 	if (!regs)
 		return;
 
-	if (WARN_ON(ring_id >= cnt))
+	if (dev_WARN_ON(dev, ring_id >= cnt))
 		return;
 
 	if (!test_and_clear_bit(ring_id, (void *)s->tlb_handle_pending))
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index f7385abdd74b..d466251e09d0 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -978,6 +978,7 @@ static void bxt_get_dimm_info(struct dram_dimm_info *dimm,
 static int
 bxt_get_dram_info(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct dram_info *dram_info = &dev_priv->dram_info;
 	u32 dram_channels;
 	u32 mem_freq_khz, val;
@@ -1015,9 +1016,9 @@ bxt_get_dram_info(struct drm_i915_private *dev_priv)
 		bxt_get_dimm_info(&dimm, val);
 		type = bxt_get_dimm_type(val);
 
-		WARN_ON(type != INTEL_DRAM_UNKNOWN &&
-			dram_info->type != INTEL_DRAM_UNKNOWN &&
-			dram_info->type != type);
+		dev_WARN_ON(dev, type != INTEL_DRAM_UNKNOWN &&
+			    dram_info->type != INTEL_DRAM_UNKNOWN &&
+			    dram_info->type != type);
 
 		DRM_DEBUG_KMS("CH%u DIMM size: %u GB, width: X%u, ranks: %u, type: %s\n",
 			      i - BXT_D_CR_DRP0_DUNIT_START,
@@ -1803,10 +1804,11 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 
 int i915_suspend_switcheroo(struct drm_i915_private *i915, pm_message_t state)
 {
+	struct device *dev = i915_to_dev(i915);
 	int error;
 
-	if (WARN_ON_ONCE(state.event != PM_EVENT_SUSPEND &&
-			 state.event != PM_EVENT_FREEZE))
+	if (dev_WARN_ON_ONCE(dev, state.event != PM_EVENT_SUSPEND &&
+			     state.event != PM_EVENT_FREEZE))
 		return -EINVAL;
 
 	if (i915->drm.switch_power_state == DRM_SWITCH_POWER_OFF)
@@ -2419,6 +2421,7 @@ static void vlv_check_no_gt_access(struct drm_i915_private *dev_priv)
 
 static int vlv_suspend_complete(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 mask;
 	int err;
 
@@ -2429,7 +2432,7 @@ static int vlv_suspend_complete(struct drm_i915_private *dev_priv)
 	vlv_wait_for_gt_wells(dev_priv, false);
 
 	mask = VLV_GTLC_RENDER_CTX_EXISTS | VLV_GTLC_MEDIA_CTX_EXISTS;
-	WARN_ON((I915_READ(VLV_GTLC_WAKE_CTRL) & mask) != mask);
+	dev_WARN_ON(dev, (I915_READ(VLV_GTLC_WAKE_CTRL) & mask) != mask);
 
 	vlv_check_no_gt_access(dev_priv);
 
@@ -2492,10 +2495,11 @@ static int vlv_resume_prepare(struct drm_i915_private *dev_priv,
 static int intel_runtime_suspend(struct device *kdev)
 {
 	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	int ret = 0;
 
-	if (WARN_ON_ONCE(!HAS_RUNTIME_PM(dev_priv)))
+	if (dev_WARN_ON_ONCE(dev, !HAS_RUNTIME_PM(dev_priv)))
 		return -ENODEV;
 
 	DRM_DEBUG_KMS("Suspending device\n");
@@ -2577,15 +2581,16 @@ static int intel_runtime_suspend(struct device *kdev)
 static int intel_runtime_resume(struct device *kdev)
 {
 	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	int ret = 0;
 
-	if (WARN_ON_ONCE(!HAS_RUNTIME_PM(dev_priv)))
+	if (dev_WARN_ON_ONCE(dev, !HAS_RUNTIME_PM(dev_priv)))
 		return -ENODEV;
 
 	DRM_DEBUG_KMS("Resuming device\n");
 
-	WARN_ON_ONCE(atomic_read(&rpm->wakeref_count));
+	dev_WARN_ON_ONCE(dev, atomic_read(&rpm->wakeref_count));
 	disable_rpm_wakeref_asserts(rpm);
 
 	intel_opregion_notify_adapter(dev_priv, PCI_D0);
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 9ddcf17230e6..074859d75cbb 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1172,6 +1172,7 @@ void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
 
 void i915_gem_driver_release(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	intel_gt_driver_release(&dev_priv->gt);
 
 	intel_wa_list_free(&dev_priv->gt_wa_list);
@@ -1183,7 +1184,7 @@ void i915_gem_driver_release(struct drm_i915_private *dev_priv)
 
 	i915_gem_drain_freed_objects(dev_priv);
 
-	WARN_ON(!list_empty(&dev_priv->gem.contexts.list));
+	dev_WARN_ON(dev, !list_empty(&dev_priv->gem.contexts.list));
 }
 
 static void i915_gem_init__mm(struct drm_i915_private *i915)
@@ -1208,10 +1209,11 @@ void i915_gem_init_early(struct drm_i915_private *dev_priv)
 
 void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	i915_gem_drain_freed_objects(dev_priv);
 	GEM_BUG_ON(!llist_empty(&dev_priv->mm.free_list));
 	GEM_BUG_ON(atomic_read(&dev_priv->mm.free_count));
-	WARN_ON(dev_priv->mm.shrink_count);
+	dev_WARN_ON(dev, dev_priv->mm.shrink_count);
 }
 
 int i915_gem_freeze(struct drm_i915_private *dev_priv)
@@ -1226,6 +1228,7 @@ int i915_gem_freeze(struct drm_i915_private *dev_priv)
 
 int i915_gem_freeze_late(struct drm_i915_private *i915)
 {
+	struct device *dev = i915_to_dev(i915);
 	struct drm_i915_gem_object *obj;
 	intel_wakeref_t wakeref;
 
@@ -1251,7 +1254,7 @@ int i915_gem_freeze_late(struct drm_i915_private *i915)
 
 	list_for_each_entry(obj, &i915->mm.shrink_list, mm.link) {
 		i915_gem_object_lock(obj);
-		WARN_ON(i915_gem_object_set_to_cpu_domain(obj, true));
+		dev_WARN_ON(dev, i915_gem_object_set_to_cpu_domain(obj, true));
 		i915_gem_object_unlock(obj);
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 1efe58ad0ce9..630158ee6188 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -2021,6 +2021,7 @@ static struct i915_ppgtt *gen6_ppgtt_create(struct drm_i915_private *i915)
 static void gtt_write_workarounds(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
+	struct device *dev = i915_to_dev(i915);
 	struct intel_uncore *uncore = gt->uncore;
 
 	/* This function is for gtt related workarounds. This function is
@@ -2079,9 +2080,9 @@ static void gtt_write_workarounds(struct intel_gt *gt)
 		intel_uncore_write(uncore,
 				   HSW_GTT_CACHE_EN,
 				   can_use_gtt_cache ? GTT_CACHE_EN_ALL : 0);
-		WARN_ON_ONCE(can_use_gtt_cache &&
-			     intel_uncore_read(uncore,
-					       HSW_GTT_CACHE_EN) == 0);
+		dev_WARN_ON_ONCE(dev, can_use_gtt_cache &&
+				 intel_uncore_read(uncore,
+						   HSW_GTT_CACHE_EN) == 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index d1a254de182d..0bcc3915be0d 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -259,10 +259,11 @@ i915_hotplug_interrupt_update_locked(struct drm_i915_private *dev_priv,
 				     u32 mask,
 				     u32 bits)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 val;
 
 	lockdep_assert_held(&dev_priv->irq_lock);
-	WARN_ON(bits & ~mask);
+	dev_WARN_ON(dev, bits & ~mask);
 
 	val = I915_READ(PORT_HOTPLUG_EN);
 	val &= ~mask;
@@ -301,13 +302,14 @@ void ilk_update_display_irq(struct drm_i915_private *dev_priv,
 			    u32 interrupt_mask,
 			    u32 enabled_irq_mask)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 new_val;
 
 	lockdep_assert_held(&dev_priv->irq_lock);
 
-	WARN_ON(enabled_irq_mask & ~interrupt_mask);
+	dev_WARN_ON(dev, enabled_irq_mask & ~interrupt_mask);
 
-	if (WARN_ON(!intel_irqs_enabled(dev_priv)))
+	if (dev_WARN_ON(dev, !intel_irqs_enabled(dev_priv)))
 		return;
 
 	new_val = dev_priv->irq_mask;
@@ -331,14 +333,15 @@ static void bdw_update_port_irq(struct drm_i915_private *dev_priv,
 				u32 interrupt_mask,
 				u32 enabled_irq_mask)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 new_val;
 	u32 old_val;
 
 	lockdep_assert_held(&dev_priv->irq_lock);
 
-	WARN_ON(enabled_irq_mask & ~interrupt_mask);
+	dev_WARN_ON(dev, enabled_irq_mask & ~interrupt_mask);
 
-	if (WARN_ON(!intel_irqs_enabled(dev_priv)))
+	if (dev_WARN_ON(dev, !intel_irqs_enabled(dev_priv)))
 		return;
 
 	old_val = I915_READ(GEN8_DE_PORT_IMR);
@@ -365,13 +368,14 @@ void bdw_update_pipe_irq(struct drm_i915_private *dev_priv,
 			 u32 interrupt_mask,
 			 u32 enabled_irq_mask)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 new_val;
 
 	lockdep_assert_held(&dev_priv->irq_lock);
 
-	WARN_ON(enabled_irq_mask & ~interrupt_mask);
+	dev_WARN_ON(dev, enabled_irq_mask & ~interrupt_mask);
 
-	if (WARN_ON(!intel_irqs_enabled(dev_priv)))
+	if (dev_WARN_ON(dev, !intel_irqs_enabled(dev_priv)))
 		return;
 
 	new_val = dev_priv->de_irq_mask[pipe];
@@ -395,15 +399,16 @@ void ibx_display_interrupt_update(struct drm_i915_private *dev_priv,
 				  u32 interrupt_mask,
 				  u32 enabled_irq_mask)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 sdeimr = I915_READ(SDEIMR);
 	sdeimr &= ~interrupt_mask;
 	sdeimr |= (~enabled_irq_mask & interrupt_mask);
 
-	WARN_ON(enabled_irq_mask & ~interrupt_mask);
+	dev_WARN_ON(dev, enabled_irq_mask & ~interrupt_mask);
 
 	lockdep_assert_held(&dev_priv->irq_lock);
 
-	if (WARN_ON(!intel_irqs_enabled(dev_priv)))
+	if (dev_WARN_ON(dev, !intel_irqs_enabled(dev_priv)))
 		return;
 
 	I915_WRITE(SDEIMR, sdeimr);
@@ -413,6 +418,7 @@ void ibx_display_interrupt_update(struct drm_i915_private *dev_priv,
 u32 i915_pipestat_enable_mask(struct drm_i915_private *dev_priv,
 			      enum pipe pipe)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 status_mask = dev_priv->pipestat_irq_mask[pipe];
 	u32 enable_mask = status_mask << 16;
 
@@ -425,13 +431,13 @@ u32 i915_pipestat_enable_mask(struct drm_i915_private *dev_priv,
 	 * On pipe A we don't support the PSR interrupt yet,
 	 * on pipe B and C the same bit MBZ.
 	 */
-	if (WARN_ON_ONCE(status_mask & PIPE_A_PSR_STATUS_VLV))
+	if (dev_WARN_ON_ONCE(dev, status_mask & PIPE_A_PSR_STATUS_VLV))
 		return 0;
 	/*
 	 * On pipe B and C we don't support the PSR interrupt yet, on pipe
 	 * A the same bit is for perf counters which we don't use either.
 	 */
-	if (WARN_ON_ONCE(status_mask & PIPE_B_PSR_STATUS_VLV))
+	if (dev_WARN_ON_ONCE(dev, status_mask & PIPE_B_PSR_STATUS_VLV))
 		return 0;
 
 	enable_mask &= ~(PIPE_FIFO_UNDERRUN_STATUS |
@@ -443,10 +449,10 @@ u32 i915_pipestat_enable_mask(struct drm_i915_private *dev_priv,
 		enable_mask |= SPRITE1_FLIP_DONE_INT_EN_VLV;
 
 out:
-	WARN_ONCE(enable_mask & ~PIPESTAT_INT_ENABLE_MASK ||
-		  status_mask & ~PIPESTAT_INT_STATUS_MASK,
-		  "pipe %c: enable_mask=0x%x, status_mask=0x%x\n",
-		  pipe_name(pipe), enable_mask, status_mask);
+	dev_WARN_ONCE(dev, enable_mask & ~PIPESTAT_INT_ENABLE_MASK ||
+		      status_mask & ~PIPESTAT_INT_STATUS_MASK,
+		      "pipe %c: enable_mask=0x%x, status_mask=0x%x\n",
+		      pipe_name(pipe), enable_mask, status_mask);
 
 	return enable_mask;
 }
@@ -454,15 +460,16 @@ u32 i915_pipestat_enable_mask(struct drm_i915_private *dev_priv,
 void i915_enable_pipestat(struct drm_i915_private *dev_priv,
 			  enum pipe pipe, u32 status_mask)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	i915_reg_t reg = PIPESTAT(pipe);
 	u32 enable_mask;
 
-	WARN_ONCE(status_mask & ~PIPESTAT_INT_STATUS_MASK,
-		  "pipe %c: status_mask=0x%x\n",
-		  pipe_name(pipe), status_mask);
+	dev_WARN_ONCE(dev, status_mask & ~PIPESTAT_INT_STATUS_MASK,
+		      "pipe %c: status_mask=0x%x\n",
+		      pipe_name(pipe), status_mask);
 
 	lockdep_assert_held(&dev_priv->irq_lock);
-	WARN_ON(!intel_irqs_enabled(dev_priv));
+	dev_WARN_ON(dev, !intel_irqs_enabled(dev_priv));
 
 	if ((dev_priv->pipestat_irq_mask[pipe] & status_mask) == status_mask)
 		return;
@@ -477,15 +484,16 @@ void i915_enable_pipestat(struct drm_i915_private *dev_priv,
 void i915_disable_pipestat(struct drm_i915_private *dev_priv,
 			   enum pipe pipe, u32 status_mask)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	i915_reg_t reg = PIPESTAT(pipe);
 	u32 enable_mask;
 
-	WARN_ONCE(status_mask & ~PIPESTAT_INT_STATUS_MASK,
-		  "pipe %c: status_mask=0x%x\n",
-		  pipe_name(pipe), status_mask);
+	dev_WARN_ONCE(dev, status_mask & ~PIPESTAT_INT_STATUS_MASK,
+		      "pipe %c: status_mask=0x%x\n",
+		      pipe_name(pipe), status_mask);
 
 	lockdep_assert_held(&dev_priv->irq_lock);
-	WARN_ON(!intel_irqs_enabled(dev_priv));
+	dev_WARN_ON(dev, !intel_irqs_enabled(dev_priv));
 
 	if ((dev_priv->pipestat_irq_mask[pipe] & status_mask) == 0)
 		return;
@@ -905,6 +913,7 @@ static void ivb_parity_work(struct work_struct *work)
 {
 	struct drm_i915_private *dev_priv =
 		container_of(work, typeof(*dev_priv), l3_parity.error_work);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_gt *gt = &dev_priv->gt;
 	u32 error_status, row, bank, subbank;
 	char *parity_event[6];
@@ -918,7 +927,7 @@ static void ivb_parity_work(struct work_struct *work)
 	mutex_lock(&dev_priv->drm.struct_mutex);
 
 	/* If we've screwed up tracking, just let the interrupt fire again */
-	if (WARN_ON(!dev_priv->l3_parity.which_slice))
+	if (dev_WARN_ON(dev, !dev_priv->l3_parity.which_slice))
 		goto out;
 
 	misccpctl = I915_READ(GEN7_MISCCPCTL);
@@ -929,7 +938,7 @@ static void ivb_parity_work(struct work_struct *work)
 		i915_reg_t reg;
 
 		slice--;
-		if (WARN_ON_ONCE(slice >= NUM_L3_SLICES(dev_priv)))
+		if (dev_WARN_ON_ONCE(dev, slice >= NUM_L3_SLICES(dev_priv)))
 			break;
 
 		dev_priv->l3_parity.which_slice &= ~(1<<slice);
@@ -966,7 +975,7 @@ static void ivb_parity_work(struct work_struct *work)
 	I915_WRITE(GEN7_MISCCPCTL, misccpctl);
 
 out:
-	WARN_ON(dev_priv->l3_parity.which_slice);
+	dev_WARN_ON(dev, dev_priv->l3_parity.which_slice);
 	spin_lock_irq(&gt->irq_lock);
 	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
 	spin_unlock_irq(&gt->irq_lock);
@@ -1434,6 +1443,7 @@ static void valleyview_pipestat_irq_handler(struct drm_i915_private *dev_priv,
 
 static u32 i9xx_hpd_irq_ack(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 hotplug_status = 0, hotplug_status_mask;
 	int i;
 
@@ -1463,9 +1473,9 @@ static u32 i9xx_hpd_irq_ack(struct drm_i915_private *dev_priv)
 		I915_WRITE(PORT_HOTPLUG_STAT, hotplug_status);
 	}
 
-	WARN_ONCE(1,
-		  "PORT_HOTPLUG_STAT did not clear (0x%08x)\n",
-		  I915_READ(PORT_HOTPLUG_STAT));
+	dev_WARN_ONCE(dev, 1,
+		      "PORT_HOTPLUG_STAT did not clear (0x%08x)\n",
+		      I915_READ(PORT_HOTPLUG_STAT));
 
 	return hotplug_status;
 }
@@ -1824,6 +1834,7 @@ static void cpt_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
 
 static void icp_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 ddi_hotplug_trigger, tc_hotplug_trigger;
 	u32 pin_mask = 0, long_mask = 0;
 	bool (*tc_port_hotplug_long_detect)(enum hpd_pin pin, u32 val);
@@ -1844,8 +1855,9 @@ static void icp_irq_handler(struct drm_i915_private *dev_priv, u32 pch_iir)
 		tc_port_hotplug_long_detect = icp_tc_port_hotplug_long_detect;
 		pins = hpd_icp;
 	} else {
-		WARN(!HAS_PCH_ICP(dev_priv),
-		     "Unrecognized PCH type 0x%x\n", INTEL_PCH_TYPE(dev_priv));
+		dev_WARN(dev, !HAS_PCH_ICP(dev_priv),
+			 "Unrecognized PCH type 0x%x\n",
+			 INTEL_PCH_TYPE(dev_priv));
 
 		ddi_hotplug_trigger = pch_iir & SDE_DDI_MASK_ICP;
 		tc_hotplug_trigger = pch_iir & SDE_TC_MASK_ICP;
@@ -2683,10 +2695,11 @@ static void ibx_irq_reset(struct drm_i915_private *dev_priv)
  */
 static void ibx_irq_pre_postinstall(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	if (HAS_PCH_NOP(dev_priv))
 		return;
 
-	WARN_ON(I915_READ(SDEIER) != 0);
+	dev_WARN_ON(dev, I915_READ(SDEIER) != 0);
 	I915_WRITE(SDEIER, 0xffffffff);
 	POSTING_READ(SDEIER);
 }
@@ -2711,6 +2724,7 @@ static void vlv_display_irq_reset(struct drm_i915_private *dev_priv)
 
 static void vlv_display_irq_postinstall(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_uncore *uncore = &dev_priv->uncore;
 
 	u32 pipestat_mask;
@@ -2733,7 +2747,7 @@ static void vlv_display_irq_postinstall(struct drm_i915_private *dev_priv)
 		enable_mask |= I915_DISPLAY_PIPE_C_EVENT_INTERRUPT |
 			I915_LPE_PIPE_C_INTERRUPT;
 
-	WARN_ON(dev_priv->irq_mask != ~0u);
+	dev_WARN_ON(dev, dev_priv->irq_mask != ~0u);
 
 	dev_priv->irq_mask = ~enable_mask;
 
@@ -3416,9 +3430,10 @@ static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
 
 static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	u32 mask = SDE_GMBUS_ICP;
 
-	WARN_ON(I915_READ(SDEIER) != 0);
+	dev_WARN_ON(dev, I915_READ(SDEIER) != 0);
 	I915_WRITE(SDEIER, 0xffffffff);
 	POSTING_READ(SDEIER);
 
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index f3ef6700a5f2..ca36f31509ec 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -443,12 +443,13 @@ static void engine_event_destroy(struct perf_event *event)
 {
 	struct drm_i915_private *i915 =
 		container_of(event->pmu, typeof(*i915), pmu.base);
+	struct device *dev = i915_to_dev(i915);
 	struct intel_engine_cs *engine;
 
 	engine = intel_engine_lookup_user(i915,
 					  engine_event_class(event),
 					  engine_event_instance(event));
-	if (WARN_ON_ONCE(!engine))
+	if (dev_WARN_ON_ONCE(dev, !engine))
 		return;
 
 	if (engine_event_sample(event) == I915_SAMPLE_BUSY &&
@@ -573,6 +574,7 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
 {
 	struct drm_i915_private *i915 =
 		container_of(event->pmu, typeof(*i915), pmu.base);
+	struct device *dev = i915_to_dev(i915);
 	struct i915_pmu *pmu = &i915->pmu;
 	u64 val = 0;
 
@@ -584,7 +586,7 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
 						  engine_event_class(event),
 						  engine_event_instance(event));
 
-		if (WARN_ON_ONCE(!engine)) {
+		if (dev_WARN_ON_ONCE(dev, !engine)) {
 			/* Do nothing */
 		} else if (sample == I915_SAMPLE_BUSY &&
 			   intel_engine_supports_stats(engine)) {
@@ -1164,12 +1166,13 @@ void i915_pmu_register(struct drm_i915_private *i915)
 
 void i915_pmu_unregister(struct drm_i915_private *i915)
 {
+	struct device *dev = i915_to_dev(i915);
 	struct i915_pmu *pmu = &i915->pmu;
 
 	if (!pmu->base.event_init)
 		return;
 
-	WARN_ON(pmu->enable);
+	dev_WARN_ON(dev, pmu->enable);
 
 	hrtimer_cancel(&pmu->timer);
 
diff --git a/drivers/gpu/drm/i915/intel_csr.c b/drivers/gpu/drm/i915/intel_csr.c
index 09870a31b4f0..5fc71ec804a7 100644
--- a/drivers/gpu/drm/i915/intel_csr.c
+++ b/drivers/gpu/drm/i915/intel_csr.c
@@ -607,7 +607,9 @@ static void parse_csr_fw(struct drm_i915_private *dev_priv,
 
 static void intel_csr_runtime_pm_get(struct drm_i915_private *dev_priv)
 {
-	WARN_ON(dev_priv->csr.wakeref);
+	struct device *dev = i915_to_dev(dev_priv);
+
+	dev_WARN_ON(dev, dev_priv->csr.wakeref);
 	dev_priv->csr.wakeref =
 		intel_display_power_get(dev_priv, POWER_DOMAIN_INIT);
 }
@@ -779,11 +781,12 @@ void intel_csr_ucode_resume(struct drm_i915_private *dev_priv)
  */
 void intel_csr_ucode_fini(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	if (!HAS_CSR(dev_priv))
 		return;
 
 	intel_csr_ucode_suspend(dev_priv);
-	WARN_ON(dev_priv->csr.wakeref);
+	dev_WARN_ON(dev, dev_priv->csr.wakeref);
 
 	kfree(dev_priv->csr.dmc_payload);
 }
diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/intel_pch.c
index 43b68b5fc562..1c56f81a22af 100644
--- a/drivers/gpu/drm/i915/intel_pch.c
+++ b/drivers/gpu/drm/i915/intel_pch.c
@@ -10,93 +10,107 @@
 static enum intel_pch
 intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	switch (id) {
 	case INTEL_PCH_IBX_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found Ibex Peak PCH\n");
-		WARN_ON(!IS_GEN(dev_priv, 5));
+		dev_WARN_ON(dev, !IS_GEN(dev_priv, 5));
 		return PCH_IBX;
 	case INTEL_PCH_CPT_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found CougarPoint PCH\n");
-		WARN_ON(!IS_GEN(dev_priv, 6) && !IS_IVYBRIDGE(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_GEN(dev_priv, 6) && !IS_IVYBRIDGE(dev_priv));
 		return PCH_CPT;
 	case INTEL_PCH_PPT_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found PantherPoint PCH\n");
-		WARN_ON(!IS_GEN(dev_priv, 6) && !IS_IVYBRIDGE(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_GEN(dev_priv, 6) && !IS_IVYBRIDGE(dev_priv));
 		/* PantherPoint is CPT compatible */
 		return PCH_CPT;
 	case INTEL_PCH_LPT_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found LynxPoint PCH\n");
-		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
-		WARN_ON(IS_HSW_ULT(dev_priv) || IS_BDW_ULT(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
+		dev_WARN_ON(dev, IS_HSW_ULT(dev_priv) || IS_BDW_ULT(dev_priv));
 		return PCH_LPT;
 	case INTEL_PCH_LPT_LP_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found LynxPoint LP PCH\n");
-		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
-		WARN_ON(!IS_HSW_ULT(dev_priv) && !IS_BDW_ULT(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_HSW_ULT(dev_priv) && !IS_BDW_ULT(dev_priv));
 		return PCH_LPT;
 	case INTEL_PCH_WPT_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found WildcatPoint PCH\n");
-		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
-		WARN_ON(IS_HSW_ULT(dev_priv) || IS_BDW_ULT(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
+		dev_WARN_ON(dev, IS_HSW_ULT(dev_priv) || IS_BDW_ULT(dev_priv));
 		/* WildcatPoint is LPT compatible */
 		return PCH_LPT;
 	case INTEL_PCH_WPT_LP_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found WildcatPoint LP PCH\n");
-		WARN_ON(!IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
-		WARN_ON(!IS_HSW_ULT(dev_priv) && !IS_BDW_ULT(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_HASWELL(dev_priv) && !IS_BROADWELL(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_HSW_ULT(dev_priv) && !IS_BDW_ULT(dev_priv));
 		/* WildcatPoint is LPT compatible */
 		return PCH_LPT;
 	case INTEL_PCH_SPT_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found SunrisePoint PCH\n");
-		WARN_ON(!IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv));
 		return PCH_SPT;
 	case INTEL_PCH_SPT_LP_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found SunrisePoint LP PCH\n");
-		WARN_ON(!IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
-			!IS_COFFEELAKE(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
+			    !IS_COFFEELAKE(dev_priv));
 		return PCH_SPT;
 	case INTEL_PCH_KBP_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found Kaby Lake PCH (KBP)\n");
-		WARN_ON(!IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
-			!IS_COFFEELAKE(dev_priv));
+		dev_WARN_ON(dev,
+			    !IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
+			    !IS_COFFEELAKE(dev_priv));
 		/* KBP is SPT compatible */
 		return PCH_SPT;
 	case INTEL_PCH_CNP_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found Cannon Lake PCH (CNP)\n");
-		WARN_ON(!IS_CANNONLAKE(dev_priv) && !IS_COFFEELAKE(dev_priv));
+		dev_WARN_ON(dev, !IS_CANNONLAKE(dev_priv) &&
+			    !IS_COFFEELAKE(dev_priv));
 		return PCH_CNP;
 	case INTEL_PCH_CNP_LP_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found Cannon Lake LP PCH (CNP-LP)\n");
-		WARN_ON(!IS_CANNONLAKE(dev_priv) && !IS_COFFEELAKE(dev_priv));
+		dev_WARN_ON(dev, !IS_CANNONLAKE(dev_priv) &&
+			    !IS_COFFEELAKE(dev_priv));
 		return PCH_CNP;
 	case INTEL_PCH_CMP_DEVICE_ID_TYPE:
 	case INTEL_PCH_CMP2_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found Comet Lake PCH (CMP)\n");
-		WARN_ON(!IS_COFFEELAKE(dev_priv));
+		dev_WARN_ON(dev, !IS_COFFEELAKE(dev_priv));
 		/* CometPoint is CNP Compatible */
 		return PCH_CNP;
 	case INTEL_PCH_CMP_V_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found Comet Lake V PCH (CMP-V)\n");
-		WARN_ON(!IS_COFFEELAKE(dev_priv));
+		dev_WARN_ON(dev, !IS_COFFEELAKE(dev_priv));
 		/* Comet Lake V PCH is based on KBP, which is SPT compatible */
 		return PCH_SPT;
 	case INTEL_PCH_ICP_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found Ice Lake PCH\n");
-		WARN_ON(!IS_ICELAKE(dev_priv));
+		dev_WARN_ON(dev, !IS_ICELAKE(dev_priv));
 		return PCH_ICP;
 	case INTEL_PCH_MCC_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found Mule Creek Canyon PCH\n");
-		WARN_ON(!IS_ELKHARTLAKE(dev_priv));
+		dev_WARN_ON(dev, !IS_ELKHARTLAKE(dev_priv));
 		return PCH_MCC;
 	case INTEL_PCH_TGP_DEVICE_ID_TYPE:
 	case INTEL_PCH_TGP2_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found Tiger Lake LP PCH\n");
-		WARN_ON(!IS_TIGERLAKE(dev_priv));
+		dev_WARN_ON(dev, !IS_TIGERLAKE(dev_priv));
 		return PCH_TGP;
 	case INTEL_PCH_JSP_DEVICE_ID_TYPE:
 	case INTEL_PCH_JSP2_DEVICE_ID_TYPE:
 		DRM_DEBUG_KMS("Found Jasper Lake PCH\n");
-		WARN_ON(!IS_ELKHARTLAKE(dev_priv));
+		dev_WARN_ON(dev, !IS_ELKHARTLAKE(dev_priv));
 		return PCH_JSP;
 	default:
 		return PCH_NONE;
@@ -154,6 +168,7 @@ intel_virt_detect_pch(const struct drm_i915_private *dev_priv)
 
 void intel_detect_pch(struct drm_i915_private *dev_priv)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct pci_dev *pch = NULL;
 
 	/*
@@ -187,7 +202,7 @@ void intel_detect_pch(struct drm_i915_private *dev_priv)
 			pch_type = intel_pch_type(dev_priv, id);
 
 			/* Sanity check virtual PCH id */
-			if (WARN_ON(id && pch_type == PCH_NONE))
+			if (dev_WARN_ON(dev, id && pch_type == PCH_NONE))
 				id = 0;
 
 			dev_priv->pch_type = pch_type;
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index d3dd80db8813..227c35d1c395 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -1956,6 +1956,7 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_uncore *uncore = &dev_priv->uncore;
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
@@ -1970,8 +1971,8 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 	sprite1_start = fifo_state->plane[PLANE_SPRITE0] + sprite0_start;
 	fifo_size = fifo_state->plane[PLANE_SPRITE1] + sprite1_start;
 
-	WARN_ON(fifo_state->plane[PLANE_CURSOR] != 63);
-	WARN_ON(fifo_size != 511);
+	dev_WARN_ON(dev, fifo_state->plane[PLANE_CURSOR] != 63);
+	dev_WARN_ON(dev, fifo_size != 511);
 
 	trace_vlv_fifo_size(crtc, sprite0_start, sprite1_start, fifo_size);
 
@@ -3360,6 +3361,7 @@ static void ilk_compute_wm_results(struct drm_i915_private *dev_priv,
 				   enum intel_ddb_partitioning partitioning,
 				   struct ilk_wm_values *results)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *intel_crtc;
 	int level, wm_lp;
 
@@ -3398,7 +3400,7 @@ static void ilk_compute_wm_results(struct drm_i915_private *dev_priv,
 		 * level is disabled. Doing otherwise could cause underruns.
 		 */
 		if (INTEL_GEN(dev_priv) <= 6 && r->spr_val) {
-			WARN_ON(wm_lp != 1);
+			dev_WARN_ON(dev, wm_lp != 1);
 			results->wm_lp_spr[wm_lp - 1] = WM1S_LP_EN | r->spr_val;
 		} else
 			results->wm_lp_spr[wm_lp - 1] = r->spr_val;
@@ -3410,7 +3412,7 @@ static void ilk_compute_wm_results(struct drm_i915_private *dev_priv,
 		const struct intel_wm_level *r =
 			&intel_crtc->wm.active.ilk.wm[0];
 
-		if (WARN_ON(!r->enable))
+		if (dev_WARN_ON(dev, !r->enable))
 			continue;
 
 		results->wm_linetime[pipe] = intel_crtc->wm.active.ilk.linetime;
@@ -3851,11 +3853,12 @@ static u16 intel_get_ddb_size(struct drm_i915_private *dev_priv,
 			      const int num_active,
 			      struct skl_ddb_allocation *ddb)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	const struct drm_display_mode *adjusted_mode;
 	u64 total_data_bw;
 	u16 ddb_size = INTEL_INFO(dev_priv)->ddb_size;
 
-	WARN_ON(ddb_size == 0);
+	dev_WARN_ON(dev, ddb_size == 0);
 
 	if (INTEL_GEN(dev_priv) < 11)
 		return ddb_size - 4; /* 4 blocks for bypass path allocation */
@@ -3889,6 +3892,7 @@ skl_ddb_get_pipe_allocation_limits(struct drm_i915_private *dev_priv,
 				   struct skl_ddb_entry *alloc, /* out */
 				   int *num_active /* out */)
 {
+	struct device *dev = i915_to_dev(dev_priv);
 	struct drm_atomic_state *state = crtc_state->uapi.state;
 	struct intel_atomic_state *intel_state = to_intel_atomic_state(state);
 	struct drm_crtc *for_crtc = crtc_state->uapi.crtc;
@@ -3898,7 +3902,7 @@ skl_ddb_get_pipe_allocation_limits(struct drm_i915_private *dev_priv,
 	u16 ddb_size;
 	u32 i;
 
-	if (WARN_ON(!state) || !crtc_state->hw.active) {
+	if (dev_WARN_ON(dev, !state) || !crtc_state->hw.active) {
 		alloc->start = 0;
 		alloc->end = 0;
 		*num_active = hweight8(dev_priv->active_pipes);
@@ -3973,6 +3977,7 @@ skl_cursor_allocation(const struct intel_crtc_state *crtc_state,
 		      int num_active)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	int level, max_level = ilk_wm_max_level(dev_priv);
 	struct skl_wm_level wm = {};
 	int ret, min_ddb_alloc = 0;
@@ -3983,7 +3988,7 @@ skl_cursor_allocation(const struct intel_crtc_state *crtc_state,
 				    DRM_FORMAT_MOD_LINEAR,
 				    DRM_MODE_ROTATE_0,
 				    crtc_state->pixel_rate, &wp, 0);
-	WARN_ON(ret);
+	dev_WARN_ON(dev, ret);
 
 	for (level = 0; level <= max_level; level++) {
 		skl_compute_plane_wm(crtc_state, level, &wp, &wm, &wm);
@@ -4258,6 +4263,7 @@ skl_allocate_pipe_ddb(struct intel_crtc_state *crtc_state,
 	struct drm_atomic_state *state = crtc_state->uapi.state;
 	struct drm_crtc *crtc = crtc_state->uapi.crtc;
 	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct device *dev = i915_to_dev(dev_priv);
 	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
 	struct skl_ddb_entry *alloc = &crtc_state->wm.skl.ddb;
 	u16 alloc_size, start = 0;
@@ -4275,7 +4281,7 @@ skl_allocate_pipe_ddb(struct intel_crtc_state *crtc_state,
 	memset(crtc_state->wm.skl.plane_ddb_y, 0, sizeof(crtc_state->wm.skl.plane_ddb_y));
 	memset(crtc_state->wm.skl.plane_ddb_uv, 0, sizeof(crtc_state->wm.skl.plane_ddb_uv));
 
-	if (WARN_ON(!state))
+	if (dev_WARN_ON(dev, !state))
 		return 0;
 
 	if (!crtc_state->hw.active) {
@@ -4322,7 +4328,8 @@ skl_allocate_pipe_ddb(struct intel_crtc_state *crtc_state,
 
 			if (plane_id == PLANE_CURSOR) {
 				if (wm->wm[level].min_ddb_alloc > total[PLANE_CURSOR]) {
-					WARN_ON(wm->wm[level].min_ddb_alloc != U16_MAX);
+					dev_WARN_ON(dev,
+						    wm->wm[level].min_ddb_alloc != U16_MAX);
 					blocks = U32_MAX;
 					break;
 				}
@@ -4386,7 +4393,7 @@ skl_allocate_pipe_ddb(struct intel_crtc_state *crtc_state,
 		alloc_size -= extra;
 		total_data_rate -= rate;
 	}
-	WARN_ON(alloc_size != 0 || total_data_rate != 0);
+	dev_WARN_ON(dev, alloc_size != 0 || total_data_rate != 0);
 
 	/* Set the actual DDB start/end points for each plane */
 	start = alloc->start;
@@ -4400,7 +4407,8 @@ skl_allocate_pipe_ddb(struct intel_crtc_state *crtc_state,
 			continue;
 
 		/* Gen11+ uses a separate plane for UV watermarks */
-		WARN_ON(INTEL_GEN(dev_priv) >= 11 && uv_total[plane_id]);
+		dev_WARN_ON(dev,
+			    INTEL_GEN(dev_priv) >= 11 && uv_total[plane_id]);
 
 		/* Leave disabled planes at (0,0) */
 		if (total[plane_id]) {
diff --git a/drivers/gpu/drm/i915/intel_sideband.c b/drivers/gpu/drm/i915/intel_sideband.c
index e06b35b844a0..e87b99730e43 100644
--- a/drivers/gpu/drm/i915/intel_sideband.c
+++ b/drivers/gpu/drm/i915/intel_sideband.c
@@ -232,6 +232,7 @@ void vlv_ccu_write(struct drm_i915_private *i915, u32 reg, u32 val)
 
 u32 vlv_dpio_read(struct drm_i915_private *i915, enum pipe pipe, int reg)
 {
+	struct device *dev = i915_to_dev(i915);
 	int port = i915->dpio_phy_iosf_port[DPIO_PHY(pipe)];
 	u32 val = 0;
 
@@ -241,8 +242,9 @@ u32 vlv_dpio_read(struct drm_i915_private *i915, enum pipe pipe, int reg)
 	 * FIXME: There might be some registers where all 1's is a valid value,
 	 * so ideally we should check the register offset instead...
 	 */
-	WARN(val == 0xffffffff, "DPIO read pipe %c reg 0x%x == 0x%x\n",
-	     pipe_name(pipe), reg, val);
+	dev_WARN(dev, val == 0xffffffff,
+		 "DPIO read pipe %c reg 0x%x == 0x%x\n",
+		 pipe_name(pipe), reg, val);
 
 	return val;
 }
@@ -487,6 +489,7 @@ static bool skl_pcode_try_request(struct drm_i915_private *i915, u32 mbox,
 int skl_pcode_request(struct drm_i915_private *i915, u32 mbox, u32 request,
 		      u32 reply_mask, u32 reply, int timeout_base_ms)
 {
+	struct device *dev = i915_to_dev(i915);
 	u32 status;
 	int ret;
 
@@ -520,7 +523,7 @@ int skl_pcode_request(struct drm_i915_private *i915, u32 mbox, u32 request,
 	 * the request completion.
 	 */
 	DRM_DEBUG_KMS("PCODE timeout, retrying with preemption disabled\n");
-	WARN_ON_ONCE(timeout_base_ms > 3);
+	dev_WARN_ON_ONCE(dev, timeout_base_ms > 3);
 	preempt_disable();
 	ret = wait_for_atomic(COND, 50);
 	preempt_enable();
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 94a97bf8c021..f3de70e7ee50 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1498,6 +1498,7 @@ static void intel_uncore_fw_domains_fini(struct intel_uncore *uncore)
 static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
 {
 	struct drm_i915_private *i915 = uncore->i915;
+	struct device *dev = i915_to_dev(i915);
 	int ret = 0;
 
 	GEM_BUG_ON(!intel_uncore_has_forcewake(uncore));
@@ -1612,7 +1613,7 @@ static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
 #undef fw_domain_init
 
 	/* All future platforms are expected to require complex power gating */
-	WARN_ON(!ret && uncore->fw_domains == 0);
+	dev_WARN_ON(dev, !ret && uncore->fw_domains == 0);
 
 out:
 	if (ret)
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
