Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B078114BFD7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 19:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B096F37F;
	Tue, 28 Jan 2020 18:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBA7882B5;
 Tue, 28 Jan 2020 18:30:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="310826046"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2020 10:30:01 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 Swati Sharma <swati2.sharma@intel.com>, Imre Deak <imre.deak@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Shashank Sharma <shashank.sharma@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rajat Jain <rajatja@google.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 David Francis <David.Francis@amd.com>
Subject: [Intel-gfx] [PATCH v5 19/21] drm/i915/display: Make WARN* drm
 specific where drm_device ptr is available
Date: Tue, 28 Jan 2020 23:46:01 +0530
Message-Id: <20200128181603.27767-20-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_device or drm_i915_private struct
pointer is readily available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_device *T = ...;
<...
(
-WARN(
+drm_WARN(T,
...)
|
-WARN_ON(
+drm_WARN_ON(T,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(T,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(T,
...)
)
...>
}

@rule2@
identifier func, T;
@@
func(struct drm_device *T,...) {
<...
(
-WARN(
+drm_WARN(T,
...)
|
-WARN_ON(
+drm_WARN_ON(T,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(T,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(T,
...)
)
...>
}

@rule3@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule4@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c            |  6 ++++--
 drivers/gpu/drm/i915/display/intel_bios.c              | 10 ++++++----
 drivers/gpu/drm/i915/display/intel_bw.c                |  3 ++-
 drivers/gpu/drm/i915/display/intel_color.c             |  3 ++-
 drivers/gpu/drm/i915/display/intel_combo_phy.c         |  2 +-
 drivers/gpu/drm/i915/display/intel_connector.c         |  3 ++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c            | 10 ++++++----
 drivers/gpu/drm/i915/display/intel_dpio_phy.c          |  3 ++-
 drivers/gpu/drm/i915/display/intel_dsb.c               |  6 +++---
 drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c           |  5 +++--
 drivers/gpu/drm/i915/display/intel_gmbus.c             |  3 ++-
 drivers/gpu/drm/i915/display/intel_hotplug.c           |  7 ++++---
 drivers/gpu/drm/i915/display/intel_lpe_audio.c         |  2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c              |  7 ++++---
 drivers/gpu/drm/i915/display/intel_opregion.c          |  7 ++++---
 drivers/gpu/drm/i915/display/intel_pipe_crc.c          |  7 ++++---
 drivers/gpu/drm/i915/display/intel_sprite.c            |  5 +++--
 drivers/gpu/drm/i915/display/intel_vdsc.c              |  2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c                 |  2 +-
 20 files changed, 56 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 9921b1fa4e70..42f4483d0f84 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -316,7 +316,8 @@ static void intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_sta
 		}
 	}
 
-	if (WARN(*scaler_id < 0, "Cannot find scaler for %s:%d\n", name, idx))
+	if (drm_WARN(&dev_priv->drm, *scaler_id < 0,
+		     "Cannot find scaler for %s:%d\n", name, idx))
 		return;
 
 	/* set scaler mode */
@@ -467,7 +468,8 @@ int intel_atomic_setup_scalers(struct drm_i915_private *dev_priv,
 			idx = plane->base.id;
 
 			/* plane on different crtc cannot be a scaler user of this crtc */
-			if (WARN_ON(intel_plane->pipe != intel_crtc->pipe))
+			if (drm_WARN_ON(&dev_priv->drm,
+					intel_plane->pipe != intel_crtc->pipe))
 				continue;
 
 			plane_state = intel_atomic_get_new_plane_state(intel_state,
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 942a073d5768..2049cf5b54f3 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -228,7 +228,7 @@ parse_panel_options(struct drm_i915_private *dev_priv,
 
 	ret = intel_opregion_get_panel_type(dev_priv);
 	if (ret >= 0) {
-		WARN_ON(ret > 0xf);
+		drm_WARN_ON(&dev_priv->drm, ret > 0xf);
 		panel_type = ret;
 		drm_dbg_kms(&dev_priv->drm, "Panel type: %d (OpRegion)\n",
 			    panel_type);
@@ -1248,7 +1248,8 @@ static int get_init_otp_deassert_fragment_len(struct drm_i915_private *dev_priv)
 	const u8 *data = dev_priv->vbt.dsi.sequence[MIPI_SEQ_INIT_OTP];
 	int index, len;
 
-	if (WARN_ON(!data || dev_priv->vbt.dsi.seq_version != 1))
+	if (drm_WARN_ON(&dev_priv->drm,
+			!data || dev_priv->vbt.dsi.seq_version != 1))
 		return 0;
 
 	/* index = 1 to skip sequence byte */
@@ -2305,7 +2306,8 @@ bool intel_bios_is_port_present(struct drm_i915_private *dev_priv, enum port por
 	}
 
 	/* FIXME maybe deal with port A as well? */
-	if (WARN_ON(port == PORT_A) || port >= ARRAY_SIZE(port_mapping))
+	if (drm_WARN_ON(&dev_priv->drm,
+			port == PORT_A) || port >= ARRAY_SIZE(port_mapping))
 		return false;
 
 	list_for_each_entry(devdata, &dev_priv->vbt.display_devices, node) {
@@ -2555,7 +2557,7 @@ intel_bios_is_port_hpd_inverted(const struct drm_i915_private *i915,
 	const struct child_device_config *child =
 		i915->vbt.ddi_port_info[port].child;
 
-	if (WARN_ON_ONCE(!IS_GEN9_LP(i915)))
+	if (drm_WARN_ON_ONCE(&i915->drm, !IS_GEN9_LP(i915)))
 		return false;
 
 	return child && child->hpd_invert;
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 9c40ad52dd73..0cb426993403 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -122,7 +122,8 @@ static int icl_get_qgv_points(struct drm_i915_private *dev_priv,
 	if (ret)
 		return ret;
 
-	if (WARN_ON(qi->num_points > ARRAY_SIZE(qi->points)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			qi->num_points > ARRAY_SIZE(qi->points)))
 		qi->num_points = ARRAY_SIZE(qi->points);
 
 	for (i = 0; i < qi->num_points; i++) {
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index b5d9ff56a8eb..2087a1852486 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -309,7 +309,8 @@ static void ilk_load_csc_matrix(const struct intel_crtc_state *crtc_state)
 		 * LUT is needed but CSC is not we need to load an
 		 * identity matrix.
 		 */
-		WARN_ON(!IS_CANNONLAKE(dev_priv) && !IS_GEMINILAKE(dev_priv));
+		drm_WARN_ON(&dev_priv->drm, !IS_CANNONLAKE(dev_priv) &&
+			    !IS_GEMINILAKE(dev_priv));
 
 		ilk_update_pipe_csc(crtc, ilk_csc_off_zero,
 				    ilk_csc_coeff_identity,
diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
index ec63c2657923..02e34cd2e195 100644
--- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
@@ -256,7 +256,7 @@ void intel_combo_phy_power_up_lanes(struct drm_i915_private *dev_priv,
 	u32 val;
 
 	if (is_dsi) {
-		WARN_ON(lane_reversal);
+		drm_WARN_ON(&dev_priv->drm, lane_reversal);
 
 		switch (lane_count) {
 		case 1:
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 54891a4ed2f3..903e49659f56 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -162,7 +162,8 @@ enum pipe intel_connector_get_pipe(struct intel_connector *connector)
 {
 	struct drm_device *dev = connector->base.dev;
 
-	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
+	drm_WARN_ON(dev,
+		    !drm_modeset_is_locked(&dev->mode_config.connection_mutex));
 
 	if (!connector->base.state->crtc)
 		return INVALID_PIPE;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 5e82fa3d0704..b8aee506d595 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -352,8 +352,9 @@ static void intel_mst_post_disable_dp(struct intel_encoder *encoder,
 
 	intel_dp->active_mst_links--;
 	last_mst_stream = intel_dp->active_mst_links == 0;
-	WARN_ON(INTEL_GEN(dev_priv) >= 12 && last_mst_stream &&
-		!intel_dp_mst_is_master_trans(old_crtc_state));
+	drm_WARN_ON(&dev_priv->drm,
+		    INTEL_GEN(dev_priv) >= 12 && last_mst_stream &&
+		    !intel_dp_mst_is_master_trans(old_crtc_state));
 
 	intel_crtc_vblank_off(old_crtc_state);
 
@@ -440,8 +441,9 @@ static void intel_mst_pre_enable_dp(struct intel_encoder *encoder,
 	connector->encoder = encoder;
 	intel_mst->connector = connector;
 	first_mst_stream = intel_dp->active_mst_links == 0;
-	WARN_ON(INTEL_GEN(dev_priv) >= 12 && first_mst_stream &&
-		!intel_dp_mst_is_master_trans(pipe_config));
+	drm_WARN_ON(&dev_priv->drm,
+		    INTEL_GEN(dev_priv) >= 12 && first_mst_stream &&
+		    !intel_dp_mst_is_master_trans(pipe_config));
 
 	DRM_DEBUG_KMS("active links %d\n", intel_dp->active_mst_links);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.c b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
index e9d46ae75377..85d6471ac357 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
@@ -259,7 +259,8 @@ void bxt_port_to_phy_channel(struct drm_i915_private *dev_priv, enum port port,
 		}
 	}
 
-	WARN(1, "PHY not found for PORT %c", port_name(port));
+	drm_WARN(&dev_priv->drm, 1, "PHY not found for PORT %c",
+		 port_name(port));
 	*phy = DPIO_PHY0;
 	*ch = DPIO_CH0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 9dd18144a664..76ae01277fd6 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -165,7 +165,7 @@ void intel_dsb_put(struct intel_dsb *dsb)
 	if (!HAS_DSB(i915))
 		return;
 
-	if (WARN_ON(dsb->refcount == 0))
+	if (drm_WARN_ON(&i915->drm, dsb->refcount == 0))
 		return;
 
 	if (--dsb->refcount == 0) {
@@ -202,7 +202,7 @@ void intel_dsb_indexed_reg_write(struct intel_dsb *dsb, i915_reg_t reg,
 		return;
 	}
 
-	if (WARN_ON(dsb->free_pos >= DSB_BUF_SIZE)) {
+	if (drm_WARN_ON(&dev_priv->drm, dsb->free_pos >= DSB_BUF_SIZE)) {
 		DRM_DEBUG_KMS("DSB buffer overflow\n");
 		return;
 	}
@@ -276,7 +276,7 @@ void intel_dsb_reg_write(struct intel_dsb *dsb, i915_reg_t reg, u32 val)
 		return;
 	}
 
-	if (WARN_ON(dsb->free_pos >= DSB_BUF_SIZE)) {
+	if (drm_WARN_ON(&dev_priv->drm, dsb->free_pos >= DSB_BUF_SIZE)) {
 		DRM_DEBUG_KMS("DSB buffer overflow\n");
 		return;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
index ac3eff26df12..b53c50372918 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
@@ -166,7 +166,7 @@ int intel_dsi_dcs_init_backlight_funcs(struct intel_connector *intel_connector)
 	if (dev_priv->vbt.backlight.type != INTEL_BACKLIGHT_DSI_DCS)
 		return -ENODEV;
 
-	if (WARN_ON(encoder->type != INTEL_OUTPUT_DSI))
+	if (drm_WARN_ON(dev, encoder->type != INTEL_OUTPUT_DSI))
 		return -EINVAL;
 
 	panel->backlight.setup = dcs_setup_backlight;
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 04f953ba8f00..3914cfdab511 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -570,14 +570,15 @@ static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
 	const u8 *data;
 	fn_mipi_elem_exec mipi_elem_exec;
 
-	if (WARN_ON(seq_id >= ARRAY_SIZE(dev_priv->vbt.dsi.sequence)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			seq_id >= ARRAY_SIZE(dev_priv->vbt.dsi.sequence)))
 		return;
 
 	data = dev_priv->vbt.dsi.sequence[seq_id];
 	if (!data)
 		return;
 
-	WARN_ON(*data != seq_id);
+	drm_WARN_ON(&dev_priv->drm, *data != seq_id);
 
 	DRM_DEBUG_KMS("Starting MIPI sequence %d - %s\n",
 		      seq_id, sequence_name(seq_id));
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 508308555dc6..4ef8a81ae0ad 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -904,7 +904,8 @@ int intel_gmbus_setup(struct drm_i915_private *dev_priv)
 struct i2c_adapter *intel_gmbus_get_adapter(struct drm_i915_private *dev_priv,
 					    unsigned int pin)
 {
-	if (WARN_ON(!intel_gmbus_is_valid_pin(dev_priv, pin)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			!intel_gmbus_is_valid_pin(dev_priv, pin)))
 		return NULL;
 
 	return &dev_priv->gmbus[pin].adapter;
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 042d98bae1ea..6f98440355e1 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -278,7 +278,7 @@ intel_encoder_hotplug(struct intel_encoder *encoder,
 	struct drm_device *dev = connector->base.dev;
 	enum drm_connector_status old_status;
 
-	WARN_ON(!mutex_is_locked(&dev->mode_config.mutex));
+	drm_WARN_ON(dev, !mutex_is_locked(&dev->mode_config.mutex));
 	old_status = connector->base.status;
 
 	connector->base.status =
@@ -504,8 +504,9 @@ void intel_hpd_irq_handler(struct drm_i915_private *dev_priv,
 			 * hotplug bits itself. So only WARN about unexpected
 			 * interrupts on saner platforms.
 			 */
-			WARN_ONCE(!HAS_GMCH(dev_priv),
-				  "Received HPD interrupt on pin %d although disabled\n", pin);
+			drm_WARN_ONCE(&dev_priv->drm, !HAS_GMCH(dev_priv),
+				      "Received HPD interrupt on pin %d although disabled\n",
+				      pin);
 			continue;
 		}
 
diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index 09591ba27e2e..516e7179a5a4 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -167,7 +167,7 @@ static int lpe_audio_irq_init(struct drm_i915_private *dev_priv)
 {
 	int irq = dev_priv->lpe_audio.irq;
 
-	WARN_ON(!intel_irqs_enabled(dev_priv));
+	drm_WARN_ON(&dev_priv->drm, !intel_irqs_enabled(dev_priv));
 	irq_set_chip_and_handler_name(irq,
 				&lpe_audio_irqchip,
 				handle_simple_irq,
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 47c49f317e07..b7ad0b534790 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -204,7 +204,8 @@ static void intel_lvds_pps_init_hw(struct drm_i915_private *dev_priv,
 	u32 val;
 
 	val = intel_de_read(dev_priv, PP_CONTROL(0));
-	WARN_ON((val & PANEL_UNLOCK_MASK) != PANEL_UNLOCK_REGS);
+	drm_WARN_ON(&dev_priv->drm,
+		    (val & PANEL_UNLOCK_MASK) != PANEL_UNLOCK_REGS);
 	if (pps->powerdown_on_reset)
 		val |= PANEL_POWER_RESET;
 	intel_de_write(dev_priv, PP_CONTROL(0), val);
@@ -826,8 +827,8 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 
 	/* Skip init on machines we know falsely report LVDS */
 	if (dmi_check_system(intel_no_lvds)) {
-		WARN(!dev_priv->vbt.int_lvds_support,
-		     "Useless DMI match. Internal LVDS support disabled by VBT\n");
+		drm_WARN(dev, !dev_priv->vbt.int_lvds_support,
+			 "Useless DMI match. Internal LVDS support disabled by VBT\n");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 8d9e691e0906..dfd78fccd456 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -381,8 +381,9 @@ int intel_opregion_notify_encoder(struct intel_encoder *intel_encoder,
 		type = DISPLAY_TYPE_INTERNAL_FLAT_PANEL;
 		break;
 	default:
-		WARN_ONCE(1, "unsupported intel_encoder type %d\n",
-			  intel_encoder->type);
+		drm_WARN_ONCE(&dev_priv->drm, 1,
+			      "unsupported intel_encoder type %d\n",
+			      intel_encoder->type);
 		return -EINVAL;
 	}
 
@@ -931,7 +932,7 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 		 */
 		if (opregion->header->over.major > 2 ||
 		    opregion->header->over.minor >= 1) {
-			WARN_ON(rvda < OPREGION_SIZE);
+			drm_WARN_ON(&dev_priv->drm, rvda < OPREGION_SIZE);
 
 			rvda += asls;
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index b83062201212..d0f05857e4b0 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -110,8 +110,8 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 				*source = INTEL_PIPE_CRC_SOURCE_DP_D;
 				break;
 			default:
-				WARN(1, "nonexisting DP port %c\n",
-				     port_name(dig_port->base.port));
+				drm_WARN(dev, 1, "nonexisting DP port %c\n",
+					 port_name(dig_port->base.port));
 				break;
 			}
 			break;
@@ -328,7 +328,8 @@ intel_crtc_crc_setup_workarounds(struct intel_crtc *crtc, bool enable)
 
 	drm_atomic_state_put(state);
 unlock:
-	WARN(ret, "Toggling workaround to %i returns %i\n", enable, ret);
+	drm_WARN(&dev_priv->drm, ret,
+		 "Toggling workaround to %i returns %i\n", enable, ret);
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 2f277d1fc6f1..4760a9fe8331 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -104,7 +104,7 @@ void intel_pipe_update_start(const struct intel_crtc_state *new_crtc_state)
 	if (min <= 0 || max <= 0)
 		goto irq_disable;
 
-	if (WARN_ON(drm_crtc_vblank_get(&crtc->base)))
+	if (drm_WARN_ON(&dev_priv->drm, drm_crtc_vblank_get(&crtc->base)))
 		goto irq_disable;
 
 	/*
@@ -204,7 +204,8 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 	 * event outside of the critical section - the spinlock might spin for a
 	 * while ... */
 	if (new_crtc_state->uapi.event) {
-		WARN_ON(drm_crtc_vblank_get(&crtc->base) != 0);
+		drm_WARN_ON(&dev_priv->drm,
+			    drm_crtc_vblank_get(&crtc->base) != 0);
 
 		spin_lock(&crtc->base.dev->event_lock);
 		drm_crtc_arm_vblank_event(&crtc->base,
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index a81abadb067f..6ad57ae39db9 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -374,7 +374,7 @@ static bool is_pipe_dsc(const struct intel_crtc_state *crtc_state)
 		return false;
 
 	/* There's no pipe A DSC engine on ICL */
-	WARN_ON(crtc->pipe == PIPE_A);
+	drm_WARN_ON(&i915->drm, crtc->pipe == PIPE_A);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index a101a4513c65..3d0edb9d05a2 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1021,7 +1021,7 @@ static bool intel_dsi_get_hw_state(struct intel_encoder *encoder,
 			tmp &= BXT_PIPE_SELECT_MASK;
 			tmp >>= BXT_PIPE_SELECT_SHIFT;
 
-			if (WARN_ON(tmp > PIPE_C))
+			if (drm_WARN_ON(&dev_priv->drm, tmp > PIPE_C))
 				continue;
 
 			*pipe = tmp;
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
