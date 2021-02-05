Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5049331174F
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 00:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1746F52B;
	Fri,  5 Feb 2021 23:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202236F528
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 23:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612568739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pi8Hf74rn2dmTK981l7BYxbMKFxcdKL1LkLfF5WogWk=;
 b=RRoyXQxZSeG5+JWLlBxm9ph/eDQRTnaEJhGbMLvF2LWqVq9asjMYIxZi02F9yZyu0yAMc1
 spCguZZrZLeVjktSoV8HCXXy4clyB/UvZKTgKRjeNg4ST6iZ8wP7rrxFN2bO30P2EuAGNV
 onBbBohFzBps0GwrEjbWITUgISHrfLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-5ti3J_XFNIeKgw-HwbdxjQ-1; Fri, 05 Feb 2021 18:45:37 -0500
X-MC-Unique: 5ti3J_XFNIeKgw-HwbdxjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C33DA1800D41;
 Fri,  5 Feb 2021 23:45:35 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-116-79.rdu2.redhat.com
 [10.10.116.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DB4119727;
 Fri,  5 Feb 2021 23:45:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC v3 04/10] drm/i915/dpcd_bl: Handle drm_dpcd_read/write() return
 values correctly
Date: Fri,  5 Feb 2021 18:45:08 -0500
Message-Id: <20210205234515.1216538-5-lyude@redhat.com>
In-Reply-To: <20210205234515.1216538-1-lyude@redhat.com>
References: <20210205234515.1216538-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is kind of an annoying aspect of DRM's DP helpers:
drm_dp_dpcd_readb/writeb() return the size of bytes read/written on
success, thus we want to check against that instead of checking if the
return value is less than 0.

I'll probably be fixing this in the near future once I start doing DP work
again, also because I'd rather not mix a tree-wide refactor like that in
with a patch series intended to be around introducing DP backlight helpers.
So, for now let's just handle the return values from each function
correctly.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 41 +++++++++----------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 62294967f430..c37ccc8538cb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -107,7 +107,7 @@ intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
 	u8 tcon_cap[4];
 
 	ret = drm_dp_dpcd_read(aux, INTEL_EDP_HDR_TCON_CAP0, tcon_cap, sizeof(tcon_cap));
-	if (ret < 0)
+	if (ret != sizeof(tcon_cap))
 		return false;
 
 	if (!(tcon_cap[1] & INTEL_EDP_HDR_TCON_BRIGHTNESS_NITS_CAP))
@@ -137,7 +137,7 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe
 	u8 tmp;
 	u8 buf[2] = { 0 };
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp) < 0) {
+	if (drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp) != 1) {
 		drm_err(&i915->drm, "Failed to read current backlight mode from DPCD\n");
 		return 0;
 	}
@@ -153,7 +153,8 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe
 		return panel->backlight.max;
 	}
 
-	if (drm_dp_dpcd_read(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf, sizeof(buf)) < 0) {
+	if (drm_dp_dpcd_read(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
+			     sizeof(buf)) != sizeof(buf)) {
 		drm_err(&i915->drm, "Failed to read brightness from DPCD\n");
 		return 0;
 	}
@@ -172,7 +173,8 @@ intel_dp_aux_hdr_set_aux_backlight(const struct drm_connector_state *conn_state,
 	buf[0] = level & 0xFF;
 	buf[1] = (level & 0xFF00) >> 8;
 
-	if (drm_dp_dpcd_write(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf, 4) < 0)
+	if (drm_dp_dpcd_write(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
+			      sizeof(buf)) != sizeof(buf))
 		drm_err(dev, "Failed to write brightness level to DPCD\n");
 }
 
@@ -203,7 +205,7 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
 	u8 old_ctrl, ctrl;
 
 	ret = drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &old_ctrl);
-	if (ret < 0) {
+	if (ret != 1) {
 		drm_err(&i915->drm, "Failed to read current backlight control mode: %d\n", ret);
 		return;
 	}
@@ -221,7 +223,7 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
 	}
 
 	if (ctrl != old_ctrl)
-		if (drm_dp_dpcd_writeb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) < 0)
+		if (drm_dp_dpcd_writeb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) != 1)
 			drm_err(&i915->drm, "Failed to configure DPCD brightness controls\n");
 }
 
@@ -277,8 +279,7 @@ static void set_vesa_backlight_enable(struct intel_dp *intel_dp, bool enable)
 	if (!(intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP))
 		return;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
-			      &reg_val) < 0) {
+	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &reg_val) != 1) {
 		drm_dbg_kms(&i915->drm, "Failed to read DPCD register 0x%x\n",
 			    DP_EDP_DISPLAY_CONTROL_REGISTER);
 		return;
@@ -332,8 +333,8 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 	if (!intel_dp_aux_vesa_backlight_dpcd_mode(connector))
 		return connector->panel.backlight.max;
 
-	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
-			     &read_val, sizeof(read_val)) < 0) {
+	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, &read_val,
+			     sizeof(read_val)) != sizeof(read_val)) {
 		drm_dbg_kms(&i915->drm, "Failed to read DPCD register 0x%x\n",
 			    DP_EDP_BACKLIGHT_BRIGHTNESS_MSB);
 		return 0;
@@ -365,8 +366,8 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
 		vals[0] = (level & 0xFF00) >> 8;
 		vals[1] = (level & 0xFF);
 	}
-	if (drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
-			      vals, sizeof(vals)) < 0) {
+	if (drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, vals,
+			      sizeof(vals)) != sizeof(vals)) {
 		drm_dbg_kms(&i915->drm,
 			    "Failed to write aux backlight level\n");
 		return;
@@ -401,9 +402,8 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
 		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
 
-		if (drm_dp_dpcd_writeb(&intel_dp->aux,
-				       DP_EDP_PWMGEN_BIT_COUNT,
-				       pwmgen_bit_count) < 0)
+		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT,
+				       pwmgen_bit_count) != 1)
 			drm_dbg_kms(&i915->drm,
 				    "Failed to write aux pwmgen bit count\n");
 
@@ -424,11 +424,9 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	}
 
 	if (new_dpcd_buf != dpcd_buf) {
-		if (drm_dp_dpcd_writeb(&intel_dp->aux,
-			DP_EDP_BACKLIGHT_MODE_SET_REGISTER, new_dpcd_buf) < 0) {
-			drm_dbg_kms(&i915->drm,
-				    "Failed to write aux backlight mode\n");
-		}
+		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
+				       new_dpcd_buf) != 1)
+			drm_dbg_kms(&i915->drm, "Failed to write aux backlight mode\n");
 	}
 
 	intel_dp_aux_vesa_set_backlight(conn_state, level);
@@ -519,8 +517,7 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
 	}
 
 	drm_dbg_kms(&i915->drm, "Using eDP pwmgen bit count of %d\n", pn);
-	if (drm_dp_dpcd_writeb(&intel_dp->aux,
-			       DP_EDP_PWMGEN_BIT_COUNT, pn) < 0) {
+	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, pn) != 1) {
 		drm_dbg_kms(&i915->drm,
 			    "Failed to write aux pwmgen bit count\n");
 		return max_backlight;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
