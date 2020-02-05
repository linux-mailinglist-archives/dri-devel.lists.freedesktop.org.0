Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0DB1536EA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 18:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71C76F901;
	Wed,  5 Feb 2020 17:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDD86F8FE;
 Wed,  5 Feb 2020 17:46:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 09:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; d="scan'208";a="343803784"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2020 09:45:56 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [Intel-gfx] [PATCH v6 4/7] drm/i915/display/power: Make WARN* drm
 specific where drm_priv ptr is available
Date: Wed,  5 Feb 2020 23:04:16 +0530
Message-Id: <20200205173419.1695-5-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200205173419.1695-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200205173419.1695-1-pankaj.laxminarayan.bharadiya@intel.com>
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

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
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

@rule2@
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
 .../drm/i915/display/intel_display_power.c    | 174 ++++++++++--------
 1 file changed, 101 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 41aec2998ada..4643f92f7434 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -182,8 +182,9 @@ static void intel_power_well_get(struct drm_i915_private *dev_priv,
 static void intel_power_well_put(struct drm_i915_private *dev_priv,
 				 struct i915_power_well *power_well)
 {
-	WARN(!power_well->count, "Use count on power well %s is already zero",
-	     power_well->desc->name);
+	drm_WARN(&dev_priv->drm, !power_well->count,
+		 "Use count on power well %s is already zero",
+		 power_well->desc->name);
 
 	if (!--power_well->count)
 		intel_power_well_disable(dev_priv, power_well);
@@ -293,7 +294,7 @@ static void hsw_wait_for_power_well_enable(struct drm_i915_private *dev_priv,
 			    power_well->desc->name);
 
 		/* An AUX timeout is expected if the TBT DP tunnel is down. */
-		WARN_ON(!power_well->desc->hsw.is_tc_tbt);
+		drm_WARN_ON(&dev_priv->drm, !power_well->desc->hsw.is_tc_tbt);
 	}
 }
 
@@ -346,8 +347,9 @@ static void gen9_wait_for_power_well_fuses(struct drm_i915_private *dev_priv,
 					   enum skl_power_gate pg)
 {
 	/* Timeout 5us for PG#0, for other PGs 1us */
-	WARN_ON(intel_de_wait_for_set(dev_priv, SKL_FUSE_STATUS,
-				      SKL_FUSE_PG_DIST_STATUS(pg), 1));
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_wait_for_set(dev_priv, SKL_FUSE_STATUS,
+					  SKL_FUSE_PG_DIST_STATUS(pg), 1));
 }
 
 static void hsw_power_well_enable(struct drm_i915_private *dev_priv,
@@ -422,7 +424,7 @@ icl_combo_phy_aux_power_well_enable(struct drm_i915_private *dev_priv,
 	enum phy phy = ICL_AUX_PW_TO_PHY(pw_idx);
 	u32 val;
 
-	WARN_ON(!IS_ICELAKE(dev_priv));
+	drm_WARN_ON(&dev_priv->drm, !IS_ICELAKE(dev_priv));
 
 	val = intel_de_read(dev_priv, regs->driver);
 	intel_de_write(dev_priv, regs->driver,
@@ -454,7 +456,7 @@ icl_combo_phy_aux_power_well_disable(struct drm_i915_private *dev_priv,
 	enum phy phy = ICL_AUX_PW_TO_PHY(pw_idx);
 	u32 val;
 
-	WARN_ON(!IS_ICELAKE(dev_priv));
+	drm_WARN_ON(&dev_priv->drm, !IS_ICELAKE(dev_priv));
 
 	val = intel_de_read(dev_priv, ICL_PORT_CL_DW12(phy));
 	intel_de_write(dev_priv, ICL_PORT_CL_DW12(phy),
@@ -492,7 +494,7 @@ static int power_well_async_ref_count(struct drm_i915_private *dev_priv,
 	int refs = hweight64(power_well->desc->domains &
 			     async_put_domains_mask(&dev_priv->power_domains));
 
-	WARN_ON(refs > power_well->count);
+	drm_WARN_ON(&dev_priv->drm, refs > power_well->count);
 
 	return refs;
 }
@@ -522,7 +524,7 @@ static void icl_tc_port_assert_ref_held(struct drm_i915_private *dev_priv,
 			continue;
 
 		dig_port = enc_to_dig_port(encoder);
-		if (WARN_ON(!dig_port))
+		if (drm_WARN_ON(&dev_priv->drm, !dig_port))
 			continue;
 
 		if (dig_port->aux_ch != aux_ch) {
@@ -533,10 +535,10 @@ static void icl_tc_port_assert_ref_held(struct drm_i915_private *dev_priv,
 		break;
 	}
 
-	if (WARN_ON(!dig_port))
+	if (drm_WARN_ON(&dev_priv->drm, !dig_port))
 		return;
 
-	WARN_ON(!intel_tc_port_ref_held(dig_port));
+	drm_WARN_ON(&dev_priv->drm, !intel_tc_port_ref_held(dig_port));
 }
 
 #else
@@ -622,15 +624,19 @@ static bool hsw_power_well_enabled(struct drm_i915_private *dev_priv,
 
 static void assert_can_enable_dc9(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE((intel_de_read(dev_priv, DC_STATE_EN) & DC_STATE_EN_DC9),
-		  "DC9 already programmed to be enabled.\n");
-	WARN_ONCE(intel_de_read(dev_priv, DC_STATE_EN) & DC_STATE_EN_UPTO_DC5,
-		  "DC5 still not disabled to enable DC9.\n");
-	WARN_ONCE(intel_de_read(dev_priv, HSW_PWR_WELL_CTL2) &
-		  HSW_PWR_WELL_CTL_REQ(SKL_PW_CTL_IDX_PW_2),
-		  "Power well 2 on.\n");
-	WARN_ONCE(intel_irqs_enabled(dev_priv),
-		  "Interrupts not disabled yet.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      (intel_de_read(dev_priv, DC_STATE_EN) & DC_STATE_EN_DC9),
+		      "DC9 already programmed to be enabled.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      intel_de_read(dev_priv, DC_STATE_EN) &
+		      DC_STATE_EN_UPTO_DC5,
+		      "DC5 still not disabled to enable DC9.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      intel_de_read(dev_priv, HSW_PWR_WELL_CTL2) &
+		      HSW_PWR_WELL_CTL_REQ(SKL_PW_CTL_IDX_PW_2),
+		      "Power well 2 on.\n");
+	drm_WARN_ONCE(&dev_priv->drm, intel_irqs_enabled(dev_priv),
+		      "Interrupts not disabled yet.\n");
 
 	 /*
 	  * TODO: check for the following to verify the conditions to enter DC9
@@ -643,10 +649,12 @@ static void assert_can_enable_dc9(struct drm_i915_private *dev_priv)
 
 static void assert_can_disable_dc9(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE(intel_irqs_enabled(dev_priv),
-		  "Interrupts not disabled yet.\n");
-	WARN_ONCE(intel_de_read(dev_priv, DC_STATE_EN) & DC_STATE_EN_UPTO_DC5,
-		  "DC5 still not disabled.\n");
+	drm_WARN_ONCE(&dev_priv->drm, intel_irqs_enabled(dev_priv),
+		      "Interrupts not disabled yet.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      intel_de_read(dev_priv, DC_STATE_EN) &
+		      DC_STATE_EN_UPTO_DC5,
+		      "DC5 still not disabled.\n");
 
 	 /*
 	  * TODO: check for the following to verify DC9 state was indeed
@@ -755,7 +763,8 @@ static void gen9_set_dc_state(struct drm_i915_private *dev_priv, u32 state)
 	u32 val;
 	u32 mask;
 
-	if (WARN_ON_ONCE(state & ~dev_priv->csr.allowed_dc_mask))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm,
+			     state & ~dev_priv->csr.allowed_dc_mask))
 		state &= dev_priv->csr.allowed_dc_mask;
 
 	val = intel_de_read(dev_priv, DC_STATE_EN);
@@ -850,11 +859,13 @@ static void bxt_disable_dc9(struct drm_i915_private *dev_priv)
 
 static void assert_csr_loaded(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE(!intel_de_read(dev_priv, CSR_PROGRAM(0)),
-		  "CSR program storage start is NULL\n");
-	WARN_ONCE(!intel_de_read(dev_priv, CSR_SSP_BASE),
-		  "CSR SSP Base Not fine\n");
-	WARN_ONCE(!intel_de_read(dev_priv, CSR_HTP_SKL), "CSR HTP Not fine\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      !intel_de_read(dev_priv, CSR_PROGRAM(0)),
+		      "CSR program storage start is NULL\n");
+	drm_WARN_ONCE(&dev_priv->drm, !intel_de_read(dev_priv, CSR_SSP_BASE),
+		      "CSR SSP Base Not fine\n");
+	drm_WARN_ONCE(&dev_priv->drm, !intel_de_read(dev_priv, CSR_HTP_SKL),
+		      "CSR HTP Not fine\n");
 }
 
 static struct i915_power_well *
@@ -874,7 +885,9 @@ lookup_power_well(struct drm_i915_private *dev_priv,
 	 * the first power well and hope the WARN gets reported so we can fix
 	 * our driver.
 	 */
-	WARN(1, "Power well %d not defined for this platform\n", power_well_id);
+	drm_WARN(&dev_priv->drm, 1,
+		 "Power well %d not defined for this platform\n",
+		 power_well_id);
 	return &dev_priv->power_domains.power_wells[0];
 }
 
@@ -897,7 +910,7 @@ void intel_display_power_set_target_dc_state(struct drm_i915_private *dev_priv,
 	mutex_lock(&power_domains->lock);
 	power_well = lookup_power_well(dev_priv, SKL_DISP_DC_OFF);
 
-	if (WARN_ON(!power_well))
+	if (drm_WARN_ON(&dev_priv->drm, !power_well))
 		goto unlock;
 
 	state = sanitize_target_dc_state(dev_priv, state);
@@ -928,10 +941,13 @@ static void assert_can_enable_dc5(struct drm_i915_private *dev_priv)
 	bool pg2_enabled = intel_display_power_well_is_enabled(dev_priv,
 					SKL_DISP_PW_2);
 
-	WARN_ONCE(pg2_enabled, "PG2 not disabled to enable DC5.\n");
+	drm_WARN_ONCE(&dev_priv->drm, pg2_enabled,
+		      "PG2 not disabled to enable DC5.\n");
 
-	WARN_ONCE((intel_de_read(dev_priv, DC_STATE_EN) & DC_STATE_EN_UPTO_DC5),
-		  "DC5 already programmed to be enabled.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      (intel_de_read(dev_priv, DC_STATE_EN) &
+		       DC_STATE_EN_UPTO_DC5),
+		      "DC5 already programmed to be enabled.\n");
 	assert_rpm_wakelock_held(&dev_priv->runtime_pm);
 
 	assert_csr_loaded(dev_priv);
@@ -953,10 +969,13 @@ static void gen9_enable_dc5(struct drm_i915_private *dev_priv)
 
 static void assert_can_enable_dc6(struct drm_i915_private *dev_priv)
 {
-	WARN_ONCE(intel_de_read(dev_priv, UTIL_PIN_CTL) & UTIL_PIN_ENABLE,
-		  "Backlight is not disabled.\n");
-	WARN_ONCE((intel_de_read(dev_priv, DC_STATE_EN) & DC_STATE_EN_UPTO_DC6),
-		  "DC6 already programmed to be enabled.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      intel_de_read(dev_priv, UTIL_PIN_CTL) & UTIL_PIN_ENABLE,
+		      "Backlight is not disabled.\n");
+	drm_WARN_ONCE(&dev_priv->drm,
+		      (intel_de_read(dev_priv, DC_STATE_EN) &
+		       DC_STATE_EN_UPTO_DC6),
+		      "DC6 already programmed to be enabled.\n");
 
 	assert_csr_loaded(dev_priv);
 }
@@ -1043,9 +1062,10 @@ static void gen9_assert_dbuf_enabled(struct drm_i915_private *dev_priv)
 {
 	u32 tmp = intel_de_read(dev_priv, DBUF_CTL);
 
-	WARN((tmp & (DBUF_POWER_STATE | DBUF_POWER_REQUEST)) !=
-	     (DBUF_POWER_STATE | DBUF_POWER_REQUEST),
-	     "Unexpected DBuf power power state (0x%08x)\n", tmp);
+	drm_WARN(&dev_priv->drm,
+		 (tmp & (DBUF_POWER_STATE | DBUF_POWER_REQUEST)) !=
+		 (DBUF_POWER_STATE | DBUF_POWER_REQUEST),
+		 "Unexpected DBuf power power state (0x%08x)\n", tmp);
 }
 
 static void gen9_disable_dc_states(struct drm_i915_private *dev_priv)
@@ -1061,7 +1081,8 @@ static void gen9_disable_dc_states(struct drm_i915_private *dev_priv)
 
 	dev_priv->display.get_cdclk(dev_priv, &cdclk_config);
 	/* Can't read out voltage_level so can't use intel_cdclk_changed() */
-	WARN_ON(intel_cdclk_needs_modeset(&dev_priv->cdclk.hw, &cdclk_config));
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_cdclk_needs_modeset(&dev_priv->cdclk.hw, &cdclk_config));
 
 	gen9_assert_dbuf_enabled(dev_priv);
 
@@ -1218,8 +1239,8 @@ static bool vlv_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * We only ever set the power-on and power-gate states, anything
 	 * else is unexpected.
 	 */
-	WARN_ON(state != PUNIT_PWRGT_PWR_ON(pw_idx) &&
-		state != PUNIT_PWRGT_PWR_GATE(pw_idx));
+	drm_WARN_ON(&dev_priv->drm, state != PUNIT_PWRGT_PWR_ON(pw_idx) &&
+		    state != PUNIT_PWRGT_PWR_GATE(pw_idx));
 	if (state == ctrl)
 		enabled = true;
 
@@ -1228,7 +1249,7 @@ static bool vlv_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * is poking at the power controls too.
 	 */
 	ctrl = vlv_punit_read(dev_priv, PUNIT_REG_PWRGT_CTRL) & mask;
-	WARN_ON(ctrl != state);
+	drm_WARN_ON(&dev_priv->drm, ctrl != state);
 
 	vlv_punit_put(dev_priv);
 
@@ -1257,7 +1278,7 @@ static void vlv_init_display_clock_gating(struct drm_i915_private *dev_priv)
 		       MI_ARB_DISPLAY_TRICKLE_FEED_DISABLE);
 	intel_de_write(dev_priv, CBR1_VLV, 0);
 
-	WARN_ON(dev_priv->rawclk_freq == 0);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->rawclk_freq == 0);
 
 	intel_de_write(dev_priv, RAWCLK_FREQ_VLV,
 		       DIV_ROUND_CLOSEST(dev_priv->rawclk_freq, 1000));
@@ -1499,8 +1520,9 @@ static void chv_dpio_cmn_power_well_enable(struct drm_i915_private *dev_priv,
 	enum pipe pipe;
 	u32 tmp;
 
-	WARN_ON_ONCE(power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
-		     power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
+	drm_WARN_ON_ONCE(&dev_priv->drm,
+			 power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
+			 power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
 
 	if (power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC) {
 		pipe = PIPE_A;
@@ -1561,8 +1583,9 @@ static void chv_dpio_cmn_power_well_disable(struct drm_i915_private *dev_priv,
 {
 	enum dpio_phy phy;
 
-	WARN_ON_ONCE(power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
-		     power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
+	drm_WARN_ON_ONCE(&dev_priv->drm,
+			 power_well->desc->id != VLV_DISP_PW_DPIO_CMN_BC &&
+			 power_well->desc->id != CHV_DISP_PW_DPIO_CMN_D);
 
 	if (power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC) {
 		phy = DPIO_PHY0;
@@ -1644,11 +1667,13 @@ static void assert_chv_phy_powergate(struct drm_i915_private *dev_priv, enum dpi
 		actual = val >> DPIO_ANYDL_POWERDOWN_SHIFT_CH1;
 	actual &= DPIO_ALLDL_POWERDOWN | DPIO_ANYDL_POWERDOWN;
 
-	WARN(actual != expected,
-	     "Unexpected DPIO lane power down: all %d, any %d. Expected: all %d, any %d. (0x%x = 0x%08x)\n",
-	     !!(actual & DPIO_ALLDL_POWERDOWN), !!(actual & DPIO_ANYDL_POWERDOWN),
-	     !!(expected & DPIO_ALLDL_POWERDOWN), !!(expected & DPIO_ANYDL_POWERDOWN),
-	     reg, val);
+	drm_WARN(&dev_priv->drm, actual != expected,
+		 "Unexpected DPIO lane power down: all %d, any %d. Expected: all %d, any %d. (0x%x = 0x%08x)\n",
+		 !!(actual & DPIO_ALLDL_POWERDOWN),
+		 !!(actual & DPIO_ANYDL_POWERDOWN),
+		 !!(expected & DPIO_ALLDL_POWERDOWN),
+		 !!(expected & DPIO_ANYDL_POWERDOWN),
+		 reg, val);
 }
 
 bool chv_phy_powergate_ch(struct drm_i915_private *dev_priv, enum dpio_phy phy,
@@ -1730,7 +1755,8 @@ static bool chv_pipe_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * We only ever set the power-on and power-gate states, anything
 	 * else is unexpected.
 	 */
-	WARN_ON(state != DP_SSS_PWR_ON(pipe) && state != DP_SSS_PWR_GATE(pipe));
+	drm_WARN_ON(&dev_priv->drm, state != DP_SSS_PWR_ON(pipe) &&
+		    state != DP_SSS_PWR_GATE(pipe));
 	enabled = state == DP_SSS_PWR_ON(pipe);
 
 	/*
@@ -1738,7 +1764,7 @@ static bool chv_pipe_power_well_enabled(struct drm_i915_private *dev_priv,
 	 * is poking at the power controls too.
 	 */
 	ctrl = vlv_punit_read(dev_priv, PUNIT_REG_DSPSSPM) & DP_SSC_MASK(pipe);
-	WARN_ON(ctrl << 16 != state);
+	drm_WARN_ON(&dev_priv->drm, ctrl << 16 != state);
 
 	vlv_punit_put(dev_priv);
 
@@ -2016,12 +2042,13 @@ __intel_display_power_put_domain(struct drm_i915_private *dev_priv,
 
 	power_domains = &dev_priv->power_domains;
 
-	WARN(!power_domains->domain_use_count[domain],
-	     "Use count on domain %s is already zero\n",
-	     name);
-	WARN(async_put_domains_mask(power_domains) & BIT_ULL(domain),
-	     "Async disabling of domain %s is pending\n",
-	     name);
+	drm_WARN(&dev_priv->drm, !power_domains->domain_use_count[domain],
+		 "Use count on domain %s is already zero\n",
+		 name);
+	drm_WARN(&dev_priv->drm,
+		 async_put_domains_mask(power_domains) & BIT_ULL(domain),
+		 "Async disabling of domain %s is pending\n",
+		 name);
 
 	power_domains->domain_use_count[domain]--;
 
@@ -2166,7 +2193,7 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 		goto out_verify;
 	}
 
-	WARN_ON(power_domains->domain_use_count[domain] != 1);
+	drm_WARN_ON(&i915->drm, power_domains->domain_use_count[domain] != 1);
 
 	/* Let a pending work requeue itself or queue a new one. */
 	if (power_domains->async_put_wakeref) {
@@ -2241,7 +2268,7 @@ intel_display_power_flush_work_sync(struct drm_i915_private *i915)
 
 	verify_async_put_domains_state(power_domains);
 
-	WARN_ON(power_domains->async_put_wakeref);
+	drm_WARN_ON(&i915->drm, power_domains->async_put_wakeref);
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
@@ -5217,8 +5244,9 @@ static bool vlv_punit_is_power_gated(struct drm_i915_private *dev_priv, u32 reg0
 
 static void assert_ved_power_gated(struct drm_i915_private *dev_priv)
 {
-	WARN(!vlv_punit_is_power_gated(dev_priv, PUNIT_REG_VEDSSPM0),
-	     "VED not power gated\n");
+	drm_WARN(&dev_priv->drm,
+		 !vlv_punit_is_power_gated(dev_priv, PUNIT_REG_VEDSSPM0),
+		 "VED not power gated\n");
 }
 
 static void assert_isp_power_gated(struct drm_i915_private *dev_priv)
@@ -5229,9 +5257,9 @@ static void assert_isp_power_gated(struct drm_i915_private *dev_priv)
 		{}
 	};
 
-	WARN(!pci_dev_present(isp_ids) &&
-	     !vlv_punit_is_power_gated(dev_priv, PUNIT_REG_ISPSSPM0),
-	     "ISP not power gated\n");
+	drm_WARN(&dev_priv->drm, !pci_dev_present(isp_ids) &&
+		 !vlv_punit_is_power_gated(dev_priv, PUNIT_REG_ISPSSPM0),
+		 "ISP not power gated\n");
 }
 
 static void intel_power_domains_verify_state(struct drm_i915_private *dev_priv);
@@ -5364,7 +5392,7 @@ void intel_power_domains_disable(struct drm_i915_private *i915)
 {
 	struct i915_power_domains *power_domains = &i915->power_domains;
 
-	WARN_ON(power_domains->wakeref);
+	drm_WARN_ON(&i915->drm, power_domains->wakeref);
 	power_domains->wakeref =
 		intel_display_power_get(i915, POWER_DOMAIN_INIT);
 
@@ -5446,7 +5474,7 @@ void intel_power_domains_resume(struct drm_i915_private *i915)
 		intel_power_domains_init_hw(i915, true);
 		power_domains->display_core_suspended = false;
 	} else {
-		WARN_ON(power_domains->wakeref);
+		drm_WARN_ON(&i915->drm, power_domains->wakeref);
 		power_domains->wakeref =
 			intel_display_power_get(i915, POWER_DOMAIN_INIT);
 	}
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
