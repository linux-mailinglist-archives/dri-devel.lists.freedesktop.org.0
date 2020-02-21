Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF61A1684EF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 18:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068E46F4E6;
	Fri, 21 Feb 2020 17:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEB86E44B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 17:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lc1NqF94incyQcopC/Dox1BDuYn451a0G+1WVUCmp8Q=;
 b=O0lPUDa6X0bUdI3p5c8gfvbyyH1zcV9AqfR0E3OOzrLZ7x5pkMQIYmeJ4BLjmcdPVWfjUx
 +FgCmBexA+cTSwCeqriOZjXp5Y00RGWJft5GHTWkbg5JpURq6F+HdtrwjXFWKxpaVBysVN
 k8ZTetlyf0m83McmODcbv1TTHYVehIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-0OQW9_xgMnOabR68oiNlmQ-1; Fri, 21 Feb 2020 12:29:32 -0500
X-MC-Unique: 0OQW9_xgMnOabR68oiNlmQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 420AE133656E;
 Fri, 21 Feb 2020 17:29:31 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-191.ams2.redhat.com
 [10.36.116.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FF14909E2;
 Fri, 21 Feb 2020 17:29:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH resend 1/2] drm/i915: panel: Use
 intel_panel_compute_brightness() from pwm_setup_backlight()
Date: Fri, 21 Feb 2020 18:29:26 +0100
Message-Id: <20200221172927.510027-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use intel_panel_compute_brightness() from pwm_setup_backlight() so that
we correctly take i915_modparams.invert_brightness and/or
QUIRK_INVERT_BRIGHTNESS into account when setting + getting the initial
brightness value.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 7b3ec6eb3382..9ebee7d93414 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -1843,6 +1843,7 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_panel *panel = &connector->panel;
 	const char *desc;
+	u32 level, ns;
 	int retval;
 
 	/* Get the right PWM chip for DSI backlight according to VBT */
@@ -1866,8 +1867,12 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 	 */
 	pwm_apply_args(panel->backlight.pwm);
 
-	retval = pwm_config(panel->backlight.pwm, CRC_PMIC_PWM_PERIOD_NS,
-			    CRC_PMIC_PWM_PERIOD_NS);
+	panel->backlight.min = 0; /* 0% */
+	panel->backlight.max = 100; /* 100% */
+	level = intel_panel_compute_brightness(connector, 100);
+	ns = DIV_ROUND_UP(level * CRC_PMIC_PWM_PERIOD_NS, 100);
+
+	retval = pwm_config(panel->backlight.pwm, ns, CRC_PMIC_PWM_PERIOD_NS);
 	if (retval < 0) {
 		DRM_ERROR("Failed to configure the pwm chip\n");
 		pwm_put(panel->backlight.pwm);
@@ -1875,11 +1880,10 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 		return retval;
 	}
 
-	panel->backlight.min = 0; /* 0% */
-	panel->backlight.max = 100; /* 100% */
-	panel->backlight.level = DIV_ROUND_UP(
-				 pwm_get_duty_cycle(panel->backlight.pwm) * 100,
-				 CRC_PMIC_PWM_PERIOD_NS);
+	level = DIV_ROUND_UP(pwm_get_duty_cycle(panel->backlight.pwm) * 100,
+			     CRC_PMIC_PWM_PERIOD_NS);
+	panel->backlight.level =
+		intel_panel_compute_brightness(connector, level);
 	panel->backlight.enabled = panel->backlight.level != 0;
 
 	DRM_INFO("Using %s PWM for LCD backlight control\n", desc);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
