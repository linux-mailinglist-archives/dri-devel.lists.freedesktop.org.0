Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F3D2CF6DD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 23:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536DF6EC8D;
	Fri,  4 Dec 2020 22:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A44C6EC8D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607121405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYmg4aU2qSC1gUqw5yLkSFkuQZOd87jDZ+UP8kXBHwQ=;
 b=JT6sBm6omgRhKndpzYzH9yoZqWz1riv5HIztOwQ5SqGLn08IxVKTXcLVGWNZlbW1nRzrfJ
 blYl70CTtx07Oc6187vIwvmjs15Xo3LJpxPaarqnZkCLTuUqo9/+FFwFgMfUwFkIkU5bnP
 aw4x53C9MRH8BddFQXu5KdUclMt0LEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-kQtYBbN-MC-swq6F33KWAA-1; Fri, 04 Dec 2020 17:36:40 -0500
X-MC-Unique: kQtYBbN-MC-swq6F33KWAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 799EF800D53;
 Fri,  4 Dec 2020 22:36:38 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-112-159.rdu2.redhat.com
 [10.10.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27D8C1962F;
 Fri,  4 Dec 2020 22:36:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/9] drm/i915/dp: Rename eDP VESA backlight interface
 functions
Date: Fri,  4 Dec 2020 17:35:59 -0500
Message-Id: <20201204223603.249878-6-lyude@redhat.com>
In-Reply-To: <20201204223603.249878-1-lyude@redhat.com>
References: <20201204223603.249878-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: thaytan@noraisin.net, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we're about to add support for a second type of backlight control
interface over DP AUX (specifically, Intel's proprietary HDR backlight
controls) let's rename all of the current backlight hooks we have for
vesa to make it clear that they're specific to the VESA interface and
not Intel's.

v3:
* Rebase

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: thaytan@noraisin.net
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 62 ++++++++++---------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index c76287e9e91e..b102692a659d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -25,7 +25,7 @@
 #include "intel_display_types.h"
 #include "intel_dp_aux_backlight.h"
 
-static void set_aux_backlight_enable(struct intel_dp *intel_dp, bool enable)
+static void set_vesa_backlight_enable(struct intel_dp *intel_dp, bool enable)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	u8 reg_val = 0;
@@ -52,7 +52,7 @@ static void set_aux_backlight_enable(struct intel_dp *intel_dp, bool enable)
 	}
 }
 
-static bool intel_dp_aux_backlight_dpcd_mode(struct intel_connector *connector)
+static bool intel_dp_aux_vesa_backlight_dpcd_mode(struct intel_connector *connector)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -75,7 +75,7 @@ static bool intel_dp_aux_backlight_dpcd_mode(struct intel_connector *connector)
  * Read the current backlight value from DPCD register(s) based
  * on if 8-bit(MSB) or 16-bit(MSB and LSB) values are supported
  */
-static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
+static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -86,7 +86,7 @@ static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
 	 * If we're not in DPCD control mode yet, the programmed brightness
 	 * value is meaningless and we should assume max brightness
 	 */
-	if (!intel_dp_aux_backlight_dpcd_mode(connector))
+	if (!intel_dp_aux_vesa_backlight_dpcd_mode(connector))
 		return connector->panel.backlight.max;
 
 	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
@@ -107,7 +107,8 @@ static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
  * 8-bit or 16 bit value (MSB and LSB)
  */
 static void
-intel_dp_aux_set_backlight(const struct drm_connector_state *conn_state, u32 level)
+intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
+				u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
@@ -137,7 +138,7 @@ intel_dp_aux_set_backlight(const struct drm_connector_state *conn_state, u32 lev
  * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
  *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
  */
-static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
+static bool intel_dp_aux_vesa_set_pwm_freq(struct intel_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
@@ -173,8 +174,9 @@ static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
 	return true;
 }
 
-static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_state,
-					  const struct drm_connector_state *conn_state, u32 level)
+static void
+intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
+				   const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
@@ -214,7 +216,7 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
 	}
 
 	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
-		if (intel_dp_aux_set_pwm_freq(connector))
+		if (intel_dp_aux_vesa_set_pwm_freq(connector))
 			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
 
 	if (new_dpcd_buf != dpcd_buf) {
@@ -225,18 +227,18 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
 		}
 	}
 
-	intel_dp_aux_set_backlight(conn_state, level);
-	set_aux_backlight_enable(intel_dp, true);
+	intel_dp_aux_vesa_set_backlight(conn_state, level);
+	set_vesa_backlight_enable(intel_dp, true);
 }
 
-static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old_conn_state,
-					   u32 level)
+static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state *old_conn_state,
+						u32 level)
 {
-	set_aux_backlight_enable(enc_to_intel_dp(to_intel_encoder(old_conn_state->best_encoder)),
-				 false);
+	set_vesa_backlight_enable(enc_to_intel_dp(to_intel_encoder(old_conn_state->best_encoder)),
+				  false);
 }
 
-static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
+static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connector)
 {
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
@@ -316,25 +318,25 @@ static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
 	return max_backlight;
 }
 
-static int intel_dp_aux_setup_backlight(struct intel_connector *connector,
-					enum pipe pipe)
+static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
+					     enum pipe pipe)
 {
 	struct intel_panel *panel = &connector->panel;
 
-	panel->backlight.max = intel_dp_aux_calc_max_backlight(connector);
+	panel->backlight.max = intel_dp_aux_vesa_calc_max_backlight(connector);
 	if (!panel->backlight.max)
 		return -ENODEV;
 
 	panel->backlight.min = 0;
-	panel->backlight.level = intel_dp_aux_get_backlight(connector);
-	panel->backlight.enabled = intel_dp_aux_backlight_dpcd_mode(connector) &&
+	panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector);
+	panel->backlight.enabled = intel_dp_aux_vesa_backlight_dpcd_mode(connector) &&
 				   panel->backlight.level != 0;
 
 	return 0;
 }
 
 static bool
-intel_dp_aux_display_control_capable(struct intel_connector *connector)
+intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -350,12 +352,12 @@ intel_dp_aux_display_control_capable(struct intel_connector *connector)
 	return false;
 }
 
-static const struct intel_panel_bl_funcs intel_dp_bl_funcs = {
-	.setup = intel_dp_aux_setup_backlight,
-	.enable = intel_dp_aux_enable_backlight,
-	.disable = intel_dp_aux_disable_backlight,
-	.set = intel_dp_aux_set_backlight,
-	.get = intel_dp_aux_get_backlight,
+static const struct intel_panel_bl_funcs intel_dp_vesa_bl_funcs = {
+	.setup = intel_dp_aux_vesa_setup_backlight,
+	.enable = intel_dp_aux_vesa_enable_backlight,
+	.disable = intel_dp_aux_vesa_disable_backlight,
+	.set = intel_dp_aux_vesa_set_backlight,
+	.get = intel_dp_aux_vesa_get_backlight,
 };
 
 int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
@@ -365,7 +367,7 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
 	if (i915->params.enable_dpcd_backlight == 0 ||
-	    !intel_dp_aux_display_control_capable(intel_connector))
+	    !intel_dp_aux_supports_vesa_backlight(intel_connector))
 		return -ENODEV;
 
 	/*
@@ -387,7 +389,7 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
 		return -ENODEV;
 	}
 
-	panel->backlight.funcs = &intel_dp_bl_funcs;
+	panel->backlight.funcs = &intel_dp_vesa_bl_funcs;
 
 	return 0;
 }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
