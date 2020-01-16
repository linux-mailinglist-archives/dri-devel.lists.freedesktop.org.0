Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F261613FB2D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 22:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDB96E2B1;
	Thu, 16 Jan 2020 21:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA2B6E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 21:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579209412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkDDfygYV/dJ5JC6E6LZqeFJ3qyr4J6qXCa7+p5wB7s=;
 b=crdbNM5GKazgGHWcWHeTlG3BckisUKfMJubNCb+hUZpq9DfYR6KcZlp071a7rd+mI8uGA/
 HwHAF/39JSKvyGRuEFxygQGm8tpmBiV2hlfKHZoFIbQ5pt9G3fJzWikJiTbBeVoysPL/iK
 zru9z2GscADj/T2EOBP9lUSLai4jt3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-OvEahANrPzW9tOEDTg8l9Q-1; Thu, 16 Jan 2020 16:16:47 -0500
X-MC-Unique: OvEahANrPzW9tOEDTg8l9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51BCD800D5A;
 Thu, 16 Jan 2020 21:16:45 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BFC660C63;
 Thu, 16 Jan 2020 21:16:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/5] drm/i915: Fix eDP DPCD aux max backlight calculations
Date: Thu, 16 Jan 2020 16:16:08 -0500
Message-Id: <20200116211623.53799-2-lyude@redhat.com>
In-Reply-To: <20200116211623.53799-1-lyude@redhat.com>
References: <20200116211623.53799-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Furquan Shaikh <furquan@google.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, AceLan Kao <acelan.kao@canonical.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Perry Yuan <pyuan@redhat.com>, Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Max backlight value for the panel was being calculated using byte
count i.e. 0xffff if 2 bytes are supported for backlight brightness
and 0xff if 1 byte is supported. However, EDP_PWMGEN_BIT_COUNT
determines the number of active control bits used for the brightness
setting. Thus, even if the panel uses 2 byte setting, it might not use
all the control bits. Thus, max backlight should be set based on the
value of EDP_PWMGEN_BIT_COUNT instead of assuming 65535 or 255.

Additionally, EDP_PWMGEN_BIT_COUNT was being updated based on the VBT
frequency which results in a different max backlight value. Thus,
setting of EDP_PWMGEN_BIT_COUNT is moved to setup phase instead of
enable so that max backlight can be calculated correctly. Only the
frequency divider is set during the enable phase using the value of
EDP_PWMGEN_BIT_COUNT.

This is based off the original patch series from Furquan Shaikh
<furquan@google.com>:

https://patchwork.freedesktop.org/patch/317255/?series=62326&rev=3

Changes since original patch:
* Remove unused intel_dp variable in intel_dp_aux_setup_backlight()
* Fix checkpatch issues
* Make sure that we rewrite the pwmgen bit count whenever we bring the
  panel out of D3 mode

v2 by Jani:
* rebase
* fix readb return value check

Cc: Furquan Shaikh <furquan@google.com>
Tested-by: AceLan Kao <acelan.kao@canonical.com>
Tested-by: Perry Yuan <pyuan@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |   3 +
 .../drm/i915/display/intel_dp_aux_backlight.c | 139 ++++++++++++------
 2 files changed, 95 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index fdd943a17de3..155ce49ae764 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -214,6 +214,9 @@ struct intel_panel {
 		u8 controller;		/* bxt+ only */
 		struct pwm_device *pwm;
 
+		/* DPCD backlight */
+		u8 pwmgen_bit_count;
+
 		struct backlight_device *device;
 
 		/* Connector and platform specific backlight functions */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 7c653f8c307f..345eed641455 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -111,61 +111,28 @@ static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
-	int freq, fxp, fxp_min, fxp_max, fxp_actual, f = 1;
-	u8 pn, pn_min, pn_max;
+	const u8 pn = connector->panel.backlight.pwmgen_bit_count;
+	int freq, fxp, f, fxp_actual, fxp_min, fxp_max;
 
-	/* Find desired value of (F x P)
-	 * Note that, if F x P is out of supported range, the maximum value or
-	 * minimum value will applied automatically. So no need to check that.
-	 */
 	freq = dev_priv->vbt.backlight.pwm_freq_hz;
-	DRM_DEBUG_KMS("VBT defined backlight frequency %u Hz\n", freq);
 	if (!freq) {
 		DRM_DEBUG_KMS("Use panel default backlight frequency\n");
 		return false;
 	}
 
 	fxp = DIV_ROUND_CLOSEST(KHz(DP_EDP_BACKLIGHT_FREQ_BASE_KHZ), freq);
+	f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
+	fxp_actual = f << pn;
 
-	/* Use highest possible value of Pn for more granularity of brightness
-	 * adjustment while satifying the conditions below.
-	 * - Pn is in the range of Pn_min and Pn_max
-	 * - F is in the range of 1 and 255
-	 * - FxP is within 25% of desired value.
-	 *   Note: 25% is arbitrary value and may need some tweak.
-	 */
-	if (drm_dp_dpcd_readb(&intel_dp->aux,
-			       DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min) != 1) {
-		DRM_DEBUG_KMS("Failed to read pwmgen bit count cap min\n");
-		return false;
-	}
-	if (drm_dp_dpcd_readb(&intel_dp->aux,
-			       DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max) != 1) {
-		DRM_DEBUG_KMS("Failed to read pwmgen bit count cap max\n");
-		return false;
-	}
-	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
-	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
-
+	/* Ensure frequency is within 25% of desired value */
 	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
 	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
-	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
-		DRM_DEBUG_KMS("VBT defined backlight frequency out of range\n");
-		return false;
-	}
 
-	for (pn = pn_max; pn >= pn_min; pn--) {
-		f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
-		fxp_actual = f << pn;
-		if (fxp_min <= fxp_actual && fxp_actual <= fxp_max)
-			break;
-	}
-
-	if (drm_dp_dpcd_writeb(&intel_dp->aux,
-			       DP_EDP_PWMGEN_BIT_COUNT, pn) < 0) {
-		DRM_DEBUG_KMS("Failed to write aux pwmgen bit count\n");
+	if (fxp_min > fxp_actual || fxp_actual > fxp_max) {
+		DRM_DEBUG_KMS("Actual frequency out of range\n");
 		return false;
 	}
+
 	if (drm_dp_dpcd_writeb(&intel_dp->aux,
 			       DP_EDP_BACKLIGHT_FREQ_SET, (u8) f) < 0) {
 		DRM_DEBUG_KMS("Failed to write aux backlight freq\n");
@@ -179,6 +146,7 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
+	struct intel_panel *panel = &connector->panel;
 	u8 dpcd_buf, new_dpcd_buf, edp_backlight_mode;
 
 	if (drm_dp_dpcd_readb(&intel_dp->aux,
@@ -197,6 +165,12 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
 	case DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT:
 		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
 		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
+
+		if (drm_dp_dpcd_writeb(&intel_dp->aux,
+				       DP_EDP_PWMGEN_BIT_COUNT,
+				       panel->backlight.pwmgen_bit_count) < 0)
+			DRM_DEBUG_KMS("Failed to write aux pwmgen bit count\n");
+
 		break;
 
 	/* Do nothing when it is already DPCD mode */
@@ -226,20 +200,91 @@ static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old
 				 false);
 }
 
+static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
+{
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
+	struct intel_panel *panel = &connector->panel;
+	u32 max_backlight = 0;
+	int freq, fxp, fxp_min, fxp_max, fxp_actual, f = 1;
+	u8 pn, pn_min, pn_max;
+
+	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, &pn) == 1) {
+		pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+		max_backlight = (1 << pn) - 1;
+	}
+
+	/* Find desired value of (F x P)
+	 * Note that, if F x P is out of supported range, the maximum value or
+	 * minimum value will applied automatically. So no need to check that.
+	 */
+	freq = i915->vbt.backlight.pwm_freq_hz;
+	DRM_DEBUG_KMS("VBT defined backlight frequency %u Hz\n", freq);
+	if (!freq) {
+		DRM_DEBUG_KMS("Use panel default backlight frequency\n");
+		return max_backlight;
+	}
+
+	fxp = DIV_ROUND_CLOSEST(KHz(DP_EDP_BACKLIGHT_FREQ_BASE_KHZ), freq);
+
+	/* Use highest possible value of Pn for more granularity of brightness
+	 * adjustment while satifying the conditions below.
+	 * - Pn is in the range of Pn_min and Pn_max
+	 * - F is in the range of 1 and 255
+	 * - FxP is within 25% of desired value.
+	 *   Note: 25% is arbitrary value and may need some tweak.
+	 */
+	if (drm_dp_dpcd_readb(&intel_dp->aux,
+			      DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min) != 1) {
+		DRM_DEBUG_KMS("Failed to read pwmgen bit count cap min\n");
+		return max_backlight;
+	}
+	if (drm_dp_dpcd_readb(&intel_dp->aux,
+			      DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max) != 1) {
+		DRM_DEBUG_KMS("Failed to read pwmgen bit count cap max\n");
+		return max_backlight;
+	}
+	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
+	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
+	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
+		DRM_DEBUG_KMS("VBT defined backlight frequency out of range\n");
+		return max_backlight;
+	}
+
+	for (pn = pn_max; pn >= pn_min; pn--) {
+		f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
+		fxp_actual = f << pn;
+		if (fxp_min <= fxp_actual && fxp_actual <= fxp_max)
+			break;
+	}
+
+	DRM_DEBUG_KMS("Using eDP pwmgen bit count of %d\n", pn);
+	if (drm_dp_dpcd_writeb(&intel_dp->aux,
+			       DP_EDP_PWMGEN_BIT_COUNT, pn) < 0) {
+		DRM_DEBUG_KMS("Failed to write aux pwmgen bit count\n");
+		return max_backlight;
+	}
+	panel->backlight.pwmgen_bit_count = pn;
+
+	max_backlight = (1 << pn) - 1;
+
+	return max_backlight;
+}
+
 static int intel_dp_aux_setup_backlight(struct intel_connector *connector,
 					enum pipe pipe)
 {
-	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 	struct intel_panel *panel = &connector->panel;
 
-	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
-		panel->backlight.max = 0xFFFF;
-	else
-		panel->backlight.max = 0xFF;
+	panel->backlight.max = intel_dp_aux_calc_max_backlight(connector);
+	if (!panel->backlight.max)
+		return -ENODEV;
 
 	panel->backlight.min = 0;
 	panel->backlight.level = intel_dp_aux_get_backlight(connector);
-
 	panel->backlight.enabled = panel->backlight.level != 0;
 
 	return 0;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
