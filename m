Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ABD144D71
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AA56FAFA;
	Wed, 22 Jan 2020 08:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7C26ED20;
 Tue, 21 Jan 2020 14:32:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d16so3420057wre.10;
 Tue, 21 Jan 2020 06:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=IT//qMtbtxRD3keMQqlPTrb+eQNrrlZsz6D2ttnYJck=;
 b=kUH73IJBeSl+zazqNetwsi11WxkDFHvd4JLAWEFzHR88AT6QJ8iho5nPbLXGw6MxtB
 2FvEO29diqUI52pS4V2yjoTg0DLeH6Oy3aFnVEU4SHq5rXViHM+3TMmnd53jDYgZ18Gr
 dPb0ZPq5/GriOIKzpg4XdeZ4o//9UdhrjYvWqIl8BXtqiZXkLP7mcRPtO+Ne4IQUCjGU
 P0EGwcYKzh3bkZaBkD4XmG+E0ET/a2tM67tznKb64FH+YhBEUFqU5oQPzQH0BAVsM9tX
 GVfuCKxETnX2yuLFoBCjHCrZ6FsT2tetdEpB0v2fR2SLJAxpG4dO3559InfEW3t4jm2g
 dClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=IT//qMtbtxRD3keMQqlPTrb+eQNrrlZsz6D2ttnYJck=;
 b=AV3xtJrq1G8q40dHis8lCIObOj4kqw781CKEHgB0lO0tP97lAS9oaomQ2IddsUP+po
 3wagx5oCifzH3siu/Kzpq8s+wsDAo//P7F7L1HWNptte25EtjSuY6rPP6OoiStsTU3G4
 eUESsqvPi1/A/OV5my4Op7SRmwjvFSMuYeuVTueLZNnu3G8o68iXem3A+U7Rwt7qkn9X
 tbEiT8vBWLZ72EDQ/ApTpBsjEOq2+wMQEIMfK9pE2KxhkM8zAsdUqQ0W72i7biVbQ8do
 ewdM5Rg1YKjeK5BNsv7dQ4Kz++pc4pADqw9O2aR/TuiQE3Zk7bYC/JQHm15W/osvrzEO
 bCtA==
X-Gm-Message-State: APjAAAX6IAe264JPLwd/G7guDRRkNuDiRtuLgRAzzU0eWxOFbeax4ZiO
 sa4WuJtNyXkThynlcFmpymOJ/WSm
X-Google-Smtp-Source: APXvYqw7BIr2X5mpVimNYyuIdD/GpL3p2DVRhihOq4WkPRmBwNwYDblilSKG/2c6Ssb8zv909BtxKg==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr5571291wrm.293.1579617128425; 
 Tue, 21 Jan 2020 06:32:08 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id g2sm52781284wrw.76.2020.01.21.06.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 06:32:07 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] drm/i915/ddi: convert to struct drm_device log macros.
Date: Tue, 21 Jan 2020 17:31:51 +0300
Message-Id: <20200121143155.20856-3-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121143155.20856-1-wambui.karugax@gmail.com>
References: <20200121143155.20856-1-wambui.karugax@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch converts various instances of the printk based logging macros
into the struct drm_device based macros. This was achieved using the
following coccinelle script for matching existing struct
drm_i915_private devices:
@rule1@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@rule2@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 98 +++++++++++++++---------
 1 file changed, 60 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 18a8186699f9..001e6e8fbd43 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -1076,7 +1076,8 @@ static void intel_wait_ddi_buf_idle(struct drm_i915_private *dev_priv,
 		if (I915_READ(reg) & DDI_BUF_IS_IDLE)
 			return;
 	}
-	DRM_ERROR("Timeout waiting for DDI BUF %c idle bit\n", port_name(port));
+	drm_err(&dev_priv->drm, "Timeout waiting for DDI BUF %c idle bit\n",
+		port_name(port));
 }
 
 static u32 hsw_pll_to_ddi_pll_sel(const struct intel_shared_dpll *pll)
@@ -1229,7 +1230,8 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 
 		temp = I915_READ(DP_TP_STATUS(PORT_E));
 		if (temp & DP_TP_STATUS_AUTOTRAIN_DONE) {
-			DRM_DEBUG_KMS("FDI link training done on step %d\n", i);
+			drm_dbg_kms(&dev_priv->drm,
+				    "FDI link training done on step %d\n", i);
 			break;
 		}
 
@@ -1238,7 +1240,7 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 		 * Results in less fireworks from the state checker.
 		 */
 		if (i == ARRAY_SIZE(hsw_ddi_translations_fdi) * 2 - 1) {
-			DRM_ERROR("FDI link training failed!\n");
+			drm_err(&dev_priv->drm, "FDI link training failed!\n");
 			break;
 		}
 
@@ -2005,7 +2007,8 @@ void intel_ddi_disable_transcoder_func(const struct intel_crtc_state *crtc_state
 
 	if (dev_priv->quirks & QUIRK_INCREASE_DDI_DISABLED_TIME &&
 	    intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)) {
-		DRM_DEBUG_KMS("Quirk Increase DDI disabled time\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Quirk Increase DDI disabled time\n");
 		/* Quirk time at 100ms for reliable operation */
 		msleep(100);
 	}
@@ -2183,20 +2186,23 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
 	}
 
 	if (!*pipe_mask)
-		DRM_DEBUG_KMS("No pipe for [ENCODER:%d:%s] found\n",
-			      encoder->base.base.id, encoder->base.name);
+		drm_dbg_kms(&dev_priv->drm,
+			    "No pipe for [ENCODER:%d:%s] found\n",
+			    encoder->base.base.id, encoder->base.name);
 
 	if (!mst_pipe_mask && hweight8(*pipe_mask) > 1) {
-		DRM_DEBUG_KMS("Multiple pipes for [ENCODER:%d:%s] (pipe_mask %02x)\n",
-			      encoder->base.base.id, encoder->base.name,
-			      *pipe_mask);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Multiple pipes for [ENCODER:%d:%s] (pipe_mask %02x)\n",
+			    encoder->base.base.id, encoder->base.name,
+			    *pipe_mask);
 		*pipe_mask = BIT(ffs(*pipe_mask) - 1);
 	}
 
 	if (mst_pipe_mask && mst_pipe_mask != *pipe_mask)
-		DRM_DEBUG_KMS("Conflicting MST and non-MST state for [ENCODER:%d:%s] (pipe_mask %02x mst_pipe_mask %02x)\n",
-			      encoder->base.base.id, encoder->base.name,
-			      *pipe_mask, mst_pipe_mask);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Conflicting MST and non-MST state for [ENCODER:%d:%s] (pipe_mask %02x mst_pipe_mask %02x)\n",
+			    encoder->base.base.id, encoder->base.name,
+			    *pipe_mask, mst_pipe_mask);
 	else
 		*is_dp_mst = mst_pipe_mask;
 
@@ -2206,9 +2212,10 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
 		if ((tmp & (BXT_PHY_CMNLANE_POWERDOWN_ACK |
 			    BXT_PHY_LANE_POWERDOWN_ACK |
 			    BXT_PHY_LANE_ENABLED)) != BXT_PHY_LANE_ENABLED)
-			DRM_ERROR("[ENCODER:%d:%s] enabled but PHY powered down? "
-				  "(PHY_CTL %08x)\n", encoder->base.base.id,
-				  encoder->base.name, tmp);
+			drm_err(&dev_priv->drm,
+				"[ENCODER:%d:%s] enabled but PHY powered down? "
+				"(PHY_CTL %08x)\n", encoder->base.base.id,
+				encoder->base.name, tmp);
 	}
 
 	intel_display_power_put(dev_priv, encoder->power_domain, wakeref);
@@ -2365,7 +2372,7 @@ static void skl_ddi_set_iboost(struct intel_encoder *encoder,
 
 	/* Make sure that the requested I_boost is valid */
 	if (iboost && iboost != 0x1 && iboost != 0x3 && iboost != 0x7) {
-		DRM_ERROR("Invalid I_boost value %u\n", iboost);
+		drm_err(&dev_priv->drm, "Invalid I_boost value %u\n", iboost);
 		return;
 	}
 
@@ -2617,7 +2624,9 @@ static void icl_ddi_combo_vswing_program(struct drm_i915_private *dev_priv,
 		return;
 
 	if (level >= n_entries) {
-		DRM_DEBUG_KMS("DDI translation not found for level %d. Using %d instead.", level, n_entries - 1);
+		drm_dbg_kms(&dev_priv->drm,
+			    "DDI translation not found for level %d. Using %d instead.",
+			    level, n_entries - 1);
 		level = n_entries - 1;
 	}
 
@@ -2743,8 +2752,9 @@ static void icl_mg_phy_ddi_vswing_sequence(struct intel_encoder *encoder,
 	ddi_translations = icl_mg_phy_ddi_translations;
 	/* The table does not have values for level 3 and level 9. */
 	if (level >= n_entries || level == 3 || level == 9) {
-		DRM_DEBUG_KMS("DDI translation not found for level %d. Using %d instead.",
-			      level, n_entries - 2);
+		drm_dbg_kms(&dev_priv->drm,
+			    "DDI translation not found for level %d. Using %d instead.",
+			    level, n_entries - 2);
 		level = n_entries - 2;
 	}
 
@@ -3324,7 +3334,8 @@ static void intel_ddi_enable_fec(struct intel_encoder *encoder,
 
 	if (intel_de_wait_for_set(dev_priv, intel_dp->regs.dp_tp_status,
 				  DP_TP_STATUS_FEC_ENABLE_LIVE, 1))
-		DRM_ERROR("Timed out waiting for FEC Enable Status\n");
+		drm_err(&dev_priv->drm,
+			"Timed out waiting for FEC Enable Status\n");
 }
 
 static void intel_ddi_disable_fec_state(struct intel_encoder *encoder,
@@ -3407,7 +3418,8 @@ static void tgl_dc3co_exitline_compute_config(struct intel_encoder *encoder,
 		return;
 
 	cstate->dc3co_exitline = crtc_vdisplay - exit_scanlines;
-	DRM_DEBUG_KMS("DC3CO exit scanlines %d\n", cstate->dc3co_exitline);
+	drm_dbg_kms(&dev_priv->drm, "DC3CO exit scanlines %d\n",
+		    cstate->dc3co_exitline);
 }
 
 static void tgl_dc3co_exitline_get_config(struct intel_crtc_state *crtc_state)
@@ -3856,8 +3868,9 @@ static void icl_disable_transcoder_port_sync(const struct intel_crtc_state *old_
 	if (old_crtc_state->master_transcoder == INVALID_TRANSCODER)
 		return;
 
-	DRM_DEBUG_KMS("Disabling Transcoder Port Sync on Slave Transcoder %s\n",
-		      transcoder_name(old_crtc_state->cpu_transcoder));
+	drm_dbg_kms(&dev_priv->drm,
+		    "Disabling Transcoder Port Sync on Slave Transcoder %s\n",
+		    transcoder_name(old_crtc_state->cpu_transcoder));
 
 	I915_WRITE(TRANS_DDI_FUNC_CTL2(old_crtc_state->cpu_transcoder), 0);
 }
@@ -4007,8 +4020,9 @@ static void intel_enable_ddi_hdmi(struct intel_encoder *encoder,
 	if (!intel_hdmi_handle_sink_scrambling(encoder, connector,
 					       crtc_state->hdmi_high_tmds_clock_ratio,
 					       crtc_state->hdmi_scrambling))
-		DRM_ERROR("[CONNECTOR:%d:%s] Failed to configure sink scrambling/TMDS bit clock ratio\n",
-			  connector->base.id, connector->name);
+		drm_err(&dev_priv->drm,
+			"[CONNECTOR:%d:%s] Failed to configure sink scrambling/TMDS bit clock ratio\n",
+			connector->base.id, connector->name);
 
 	/* Display WA #1143: skl,kbl,cfl */
 	if (IS_GEN9_BC(dev_priv)) {
@@ -4385,9 +4399,10 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 			pipe_config->fec_enable =
 				I915_READ(dp_tp_ctl) & DP_TP_CTL_FEC_ENABLE;
 
-			DRM_DEBUG_KMS("[ENCODER:%d:%s] Fec status: %u\n",
-				      encoder->base.base.id, encoder->base.name,
-				      pipe_config->fec_enable);
+			drm_dbg_kms(&dev_priv->drm,
+				    "[ENCODER:%d:%s] Fec status: %u\n",
+				    encoder->base.base.id, encoder->base.name,
+				    pipe_config->fec_enable);
 		}
 
 		break;
@@ -4427,8 +4442,9 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 		 * up by the BIOS, and thus we can't get the mode at module
 		 * load.
 		 */
-		DRM_DEBUG_KMS("pipe has %d bpp for eDP panel, overriding BIOS-provided max %d bpp\n",
-			      pipe_config->pipe_bpp, dev_priv->vbt.edp.bpp);
+		drm_dbg_kms(&dev_priv->drm,
+			    "pipe has %d bpp for eDP panel, overriding BIOS-provided max %d bpp\n",
+			    pipe_config->pipe_bpp, dev_priv->vbt.edp.bpp);
 		dev_priv->vbt.edp.bpp = pipe_config->pipe_bpp;
 	}
 
@@ -4625,7 +4641,8 @@ static int intel_hdmi_reset_link(struct intel_encoder *encoder,
 
 	ret = drm_scdc_readb(adapter, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
-		DRM_ERROR("Failed to read TMDS config: %d\n", ret);
+		drm_err(&dev_priv->drm, "Failed to read TMDS config: %d\n",
+			ret);
 		return 0;
 	}
 
@@ -4770,7 +4787,8 @@ intel_ddi_max_lanes(struct intel_digital_port *intel_dport)
 	 * so we use the proper lane count for our calculations.
 	 */
 	if (intel_ddi_a_force_4_lanes(intel_dport)) {
-		DRM_DEBUG_KMS("Forcing DDI_A_4_LANES for port A\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Forcing DDI_A_4_LANES for port A\n");
 		intel_dport->saved_port_bits |= DDI_A_4_LANES;
 		max_lanes = 4;
 	}
@@ -4798,12 +4816,14 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
 		init_dp = true;
 		init_lspcon = true;
 		init_hdmi = false;
-		DRM_DEBUG_KMS("VBT says port %c has lspcon\n", port_name(port));
+		drm_dbg_kms(&dev_priv->drm, "VBT says port %c has lspcon\n",
+			    port_name(port));
 	}
 
 	if (!init_dp && !init_hdmi) {
-		DRM_DEBUG_KMS("VBT says port %c is not DVI/HDMI/DP compatible, respect it\n",
-			      port_name(port));
+		drm_dbg_kms(&dev_priv->drm,
+			    "VBT says port %c is not DVI/HDMI/DP compatible, respect it\n",
+			    port_name(port));
 		return;
 	}
 
@@ -4879,14 +4899,16 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
 	if (init_lspcon) {
 		if (lspcon_init(intel_dig_port))
 			/* TODO: handle hdmi info frame part */
-			DRM_DEBUG_KMS("LSPCON init success on port %c\n",
-				port_name(port));
+			drm_dbg_kms(&dev_priv->drm,
+				    "LSPCON init success on port %c\n",
+				    port_name(port));
 		else
 			/*
 			 * LSPCON init faied, but DP init was success, so
 			 * lets try to drive as DP++ port.
 			 */
-			DRM_ERROR("LSPCON init failed on port %c\n",
+			drm_err(&dev_priv->drm,
+				"LSPCON init failed on port %c\n",
 				port_name(port));
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
