Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31526AAA6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 19:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ACC6E8B5;
	Tue, 15 Sep 2020 17:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA1A6E8BB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600191004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zUMyB1rem1rvIb11Y4tpkZb1FY6sahhJeMSo+QpGOGA=;
 b=WFbqJOi+A4EYLl+yW+RFVmuZtTnSRGQYPycpxX3zhtld/MQG4ER9EmTKUV4JUeA7Cm9B9y
 U2ENv20abURuFbN7/tXPWHvGUujxUyWPWHe5JyojAvdNguGl8k2FAMAQRSuzEgkX1NUiYE
 egKvmzPSTYGdgQ88J/T+ENj85XMFk2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-vv6X4MxnO6iBl3tkWFPEjg-1; Tue, 15 Sep 2020 13:30:00 -0400
X-MC-Unique: vv6X4MxnO6iBl3tkWFPEjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1902710BBEC6;
 Tue, 15 Sep 2020 17:29:58 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46E025FC3B;
 Tue, 15 Sep 2020 17:29:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 2/5] drm/i915: Rename pwm_* backlight callbacks to ext_pwm_*
Date: Tue, 15 Sep 2020 13:29:36 -0400
Message-Id: <20200915172939.2810538-3-lyude@redhat.com>
In-Reply-To: <20200915172939.2810538-1-lyude@redhat.com>
References: <20200915172939.2810538-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: thaytan@noraisin.net, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we're going to need to add a set of lower-level PWM backlight
control hooks to be shared by normal backlight controls and HDR
backlight controls in SDR mode, let's add a prefix to the external PWM
backlight functions so that the difference between them and the high
level PWM-only backlight functions is a bit more obvious.

This introduces no functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: thaytan@noraisin.net
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 9f23bac0d7924..c0e36244bb07d 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -589,7 +589,7 @@ static u32 bxt_get_backlight(struct intel_connector *connector)
 			     BXT_BLC_PWM_DUTY(panel->backlight.controller));
 }
 
-static u32 pwm_get_backlight(struct intel_connector *connector)
+static u32 ext_pwm_get_backlight(struct intel_connector *connector)
 {
 	struct intel_panel *panel = &connector->panel;
 	struct pwm_state state;
@@ -666,7 +666,7 @@ static void bxt_set_backlight(const struct drm_connector_state *conn_state, u32
 		       BXT_BLC_PWM_DUTY(panel->backlight.controller), level);
 }
 
-static void pwm_set_backlight(const struct drm_connector_state *conn_state, u32 level)
+static void ext_pwm_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_panel *panel = &to_intel_connector(conn_state->connector)->panel;
 
@@ -835,7 +835,7 @@ static void cnp_disable_backlight(const struct drm_connector_state *old_conn_sta
 		       tmp & ~BXT_BLC_PWM_ENABLE);
 }
 
-static void pwm_disable_backlight(const struct drm_connector_state *old_conn_state)
+static void ext_pwm_disable_backlight(const struct drm_connector_state *old_conn_state)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
@@ -1168,8 +1168,8 @@ static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
 		       pwm_ctl | BXT_BLC_PWM_ENABLE);
 }
 
-static void pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
-				 const struct drm_connector_state *conn_state)
+static void ext_pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
+				     const struct drm_connector_state *conn_state)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
@@ -1890,8 +1890,8 @@ cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
 	return 0;
 }
 
-static int pwm_setup_backlight(struct intel_connector *connector,
-			       enum pipe pipe)
+static int ext_pwm_setup_backlight(struct intel_connector *connector,
+				   enum pipe pipe)
 {
 	struct drm_device *dev = connector->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -2065,11 +2065,11 @@ intel_panel_init_backlight_funcs(struct intel_panel *panel)
 		panel->backlight.hz_to_pwm = pch_hz_to_pwm;
 	} else if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
 		if (connector->base.connector_type == DRM_MODE_CONNECTOR_DSI) {
-			panel->backlight.setup = pwm_setup_backlight;
-			panel->backlight.enable = pwm_enable_backlight;
-			panel->backlight.disable = pwm_disable_backlight;
-			panel->backlight.set = pwm_set_backlight;
-			panel->backlight.get = pwm_get_backlight;
+			panel->backlight.setup = ext_pwm_setup_backlight;
+			panel->backlight.enable = ext_pwm_enable_backlight;
+			panel->backlight.disable = ext_pwm_disable_backlight;
+			panel->backlight.set = ext_pwm_set_backlight;
+			panel->backlight.get = ext_pwm_get_backlight;
 		} else {
 			panel->backlight.setup = vlv_setup_backlight;
 			panel->backlight.enable = vlv_enable_backlight;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
