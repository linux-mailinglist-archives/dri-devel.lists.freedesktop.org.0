Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80D511D7E2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 21:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE24188E4D;
	Thu, 12 Dec 2019 20:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E5D6E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 20:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576182595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L0FJi8yZKKSNaOeWOnKLG0D2sy8Vt1RkrFL5EZ1ETrc=;
 b=I/i6xY74Vbev+SRPCElpwhVb5dlWrfdMzkQkqtJ8Zfl0UDbI5BVZ2+35TZCASQiMLiQrGo
 H8dMvDGPLJo0G1DEPEp3R7Ok25Ry2q9ddgMBKEeFrb/pB5UhYYUwEwjCQ196oZC6vsn0+K
 JsdczXf5he185oegcvgLbuVyCahgGI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-1qDEK_6MOcOv2N_LPMblPA-1; Thu, 12 Dec 2019 15:29:53 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A71E28017DF;
 Thu, 12 Dec 2019 20:29:52 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 304CA5D9C9;
 Thu, 12 Dec 2019 20:29:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 1/2] drm/i915: panel: Use intel_panel_compute_brightness()
 from pwm_setup_backlight()
Date: Thu, 12 Dec 2019 21:29:48 +0100
Message-Id: <20191212202949.190451-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 1qDEK_6MOcOv2N_LPMblPA-1
X-Mimecast-Spam-Score: 0
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
index ddcf311d1114..ac0a1ae5fba5 100644
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
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
