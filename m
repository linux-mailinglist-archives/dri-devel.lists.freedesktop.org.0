Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD124311755
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 00:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE416F530;
	Fri,  5 Feb 2021 23:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492576F530
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 23:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612568747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abJsVZKJS83nZjpN17pIQlqghcCNBWa9ysfS/sE2K6o=;
 b=RaRBxOTXLUti62dAJkrIJGV3FoN9XA0pMOhjr7kDyKdpMLa1O0gxyfYnFkfjT/KReAUnJ8
 MkjewDpEZS9Xz/RlxO8H9J6BSjBDaBy6go2CWgPbvJyy9OLeGO0jGAyT+DnTAZkql8nn88
 YjHNWGjUfRacS18FBu5xxdTTln5CJUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-27wvUg0QMy6MIq7bePinPQ-1; Fri, 05 Feb 2021 18:45:45 -0500
X-MC-Unique: 27wvUg0QMy6MIq7bePinPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54DEA107ACE4;
 Fri,  5 Feb 2021 23:45:43 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-116-79.rdu2.redhat.com
 [10.10.116.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA9419727;
 Fri,  5 Feb 2021 23:45:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC v3 06/10] drm/i915/dpcd_bl: Cache some backlight capabilities in
 intel_panel.backlight
Date: Fri,  5 Feb 2021 18:45:10 -0500
Message-Id: <20210205234515.1216538-7-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we're about to be moving this code into shared DRM helpers, we might
as well start to cache certain backlight capabilities that can be
determined from the EDP DPCD, and are likely to be relevant to the majority
of drivers using said helpers. The main purpose of this is just to prevent
every driver from having to check everything against the eDP DPCD using DP
macros, which makes the code slightly easier to read (especially since the
names of some of the eDP capabilities don't exactly match up with what we
actually need to use them for, like DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT
for instance).

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../drm/i915/display/intel_display_types.h    |  2 ++
 .../drm/i915/display/intel_dp_aux_backlight.c | 29 ++++++++++++-------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f4b26e1dbaaf..16824eb3ef93 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -265,6 +265,8 @@ struct intel_panel {
 			struct {
 				u8 pwmgen_bit_count;
 				u8 pwm_freq_pre_divider;
+				bool lsb_reg_used;
+				bool aux_enable;
 			} vesa;
 			struct {
 				bool sdr_uses_aux;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 95e3e344cf40..f5ae2fb34c1f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -270,13 +270,14 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
 }
 
 /* VESA backlight callbacks */
-static void set_vesa_backlight_enable(struct intel_dp *intel_dp, bool enable)
+static void set_vesa_backlight_enable(struct intel_connector *connector, bool enable)
 {
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	u8 reg_val = 0;
 
 	/* Early return when display use other mechanism to enable backlight. */
-	if (!(intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP))
+	if (!connector->panel.backlight.edp.vesa.aux_enable)
 		return;
 
 	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &reg_val) != 1) {
@@ -339,9 +340,11 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 			    DP_EDP_BACKLIGHT_BRIGHTNESS_MSB);
 		return 0;
 	}
-	level = read_val[0];
-	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
+
+	if (connector->panel.backlight.edp.vesa.lsb_reg_used)
 		level = (read_val[0] << 8 | read_val[1]);
+	else
+		level = read_val[0];
 
 	return level;
 }
@@ -359,13 +362,14 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	u8 vals[2] = { 0x0 };
 
-	vals[0] = level;
-
 	/* Write the MSB and/or LSB */
-	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT) {
+	if (connector->panel.backlight.edp.vesa.lsb_reg_used) {
 		vals[0] = (level & 0xFF00) >> 8;
 		vals[1] = (level & 0xFF);
+	} else {
+		vals[0] = level;
 	}
+
 	if (drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, vals,
 			      sizeof(vals)) != sizeof(vals)) {
 		drm_dbg_kms(&i915->drm,
@@ -419,14 +423,13 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	}
 
 	intel_dp_aux_vesa_set_backlight(conn_state, level);
-	set_vesa_backlight_enable(intel_dp, true);
+	set_vesa_backlight_enable(connector, true);
 }
 
 static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state *old_conn_state,
 						u32 level)
 {
-	set_vesa_backlight_enable(enc_to_intel_dp(to_intel_encoder(old_conn_state->best_encoder)),
-				  false);
+	set_vesa_backlight_enable(to_intel_connector(old_conn_state->connector), false);
 }
 
 /*
@@ -524,8 +527,14 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
 static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 					     enum pipe pipe)
 {
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_panel *panel = &connector->panel;
 
+	if (intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
+		panel->backlight.edp.vesa.aux_enable = true;
+	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
+		panel->backlight.edp.vesa.lsb_reg_used = true;
+
 	panel->backlight.max = intel_dp_aux_vesa_calc_max_backlight(connector);
 	if (!panel->backlight.max)
 		return -ENODEV;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
