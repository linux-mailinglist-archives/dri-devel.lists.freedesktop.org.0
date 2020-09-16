Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA3426C5C9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 19:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA696EAA3;
	Wed, 16 Sep 2020 17:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951DA6EAA5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600276788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lyx36WMHRsGiiJu366iOAUHmwFCp7ig/T6xHCostHnU=;
 b=JrizRBmwizztlINKyTUHefMTdvbG83z0KrOljfQBRAj1LquNlYzQ5lb6Y3cNkUCa4dYkMO
 SiFTLIUam/dhkGrwTiaAffEb6nafXI5eotGhmiUVHEIMwMEOuFM4sPsGVAk4k6XuNoFViF
 9nH8zNs4CwnZkGejEqvsb/2/r8LdsV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ygl5PSujOOqpvfHOLkjX6A-1; Wed, 16 Sep 2020 13:19:43 -0400
X-MC-Unique: ygl5PSujOOqpvfHOLkjX6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C8908030B9;
 Wed, 16 Sep 2020 17:19:41 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-66.rdu2.redhat.com
 [10.10.120.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7463C1C4;
 Wed, 16 Sep 2020 17:19:40 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v2 4/8] drm/i915/dp: Rename eDP VESA backlight interface
 functions
Date: Wed, 16 Sep 2020 13:18:51 -0400
Message-Id: <20200916171855.129511-5-lyude@redhat.com>
In-Reply-To: <20200916171855.129511-1-lyude@redhat.com>
References: <20200916171855.129511-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 Vasily Khoruzhick <anarsoul@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we're about to add support for a second type of backlight control
interface over DP AUX (specifically, Intel's proprietary HDR backlight
controls) let's rename all of the current backlight hooks we have for
vesa to make it clear that they're specific to the VESA interface and
not Intel's.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: thaytan@noraisin.net
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 51 ++++++++++---------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index acbd7eb66cbe3..f601bcbe8ee46 100644
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
@@ -56,7 +56,7 @@ static void set_aux_backlight_enable(struct intel_dp *intel_dp, bool enable)
  * Read the current backlight value from DPCD register(s) based
  * on if 8-bit(MSB) or 16-bit(MSB and LSB) values are supported
  */
-static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
+static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -99,7 +99,8 @@ static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
  * 8-bit or 16 bit value (MSB and LSB)
  */
 static void
-intel_dp_aux_set_backlight(const struct drm_connector_state *conn_state, u32 level)
+intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
+				u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
@@ -129,7 +130,7 @@ intel_dp_aux_set_backlight(const struct drm_connector_state *conn_state, u32 lev
  * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
  *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
  */
-static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
+static bool intel_dp_aux_vesa_set_pwm_freq(struct intel_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
@@ -165,8 +166,8 @@ static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
 	return true;
 }
 
-static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_state,
-					  const struct drm_connector_state *conn_state)
+static void intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
+					       const struct drm_connector_state *conn_state)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
@@ -206,7 +207,7 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
 	}
 
 	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
-		if (intel_dp_aux_set_pwm_freq(connector))
+		if (intel_dp_aux_vesa_set_pwm_freq(connector))
 			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
 
 	if (new_dpcd_buf != dpcd_buf) {
@@ -217,18 +218,18 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
 		}
 	}
 
-	intel_dp_aux_set_backlight(conn_state,
-				   connector->panel.backlight.level);
-	set_aux_backlight_enable(intel_dp, true);
+	intel_dp_aux_vesa_set_backlight(conn_state,
+					connector->panel.backlight.level);
+	set_vesa_backlight_enable(intel_dp, true);
 }
 
-static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state *old_conn_state)
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
@@ -308,24 +309,24 @@ static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
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
+	panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector);
 	panel->backlight.enabled = panel->backlight.level != 0;
 
 	return 0;
 }
 
 static bool
-intel_dp_aux_display_control_capable(struct intel_connector *connector)
+intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
@@ -349,7 +350,7 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
 	if (i915->params.enable_dpcd_backlight == 0 ||
-	    !intel_dp_aux_display_control_capable(intel_connector))
+	    !intel_dp_aux_supports_vesa_backlight(intel_connector))
 		return -ENODEV;
 
 	/*
@@ -371,11 +372,11 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
 		return -ENODEV;
 	}
 
-	panel->backlight.setup = intel_dp_aux_setup_backlight;
-	panel->backlight.enable = intel_dp_aux_enable_backlight;
-	panel->backlight.disable = intel_dp_aux_disable_backlight;
-	panel->backlight.set = intel_dp_aux_set_backlight;
-	panel->backlight.get = intel_dp_aux_get_backlight;
+	panel->backlight.setup = intel_dp_aux_vesa_setup_backlight;
+	panel->backlight.enable = intel_dp_aux_vesa_enable_backlight;
+	panel->backlight.disable = intel_dp_aux_vesa_disable_backlight;
+	panel->backlight.set = intel_dp_aux_vesa_set_backlight;
+	panel->backlight.get = intel_dp_aux_vesa_get_backlight;
 
 	return 0;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
