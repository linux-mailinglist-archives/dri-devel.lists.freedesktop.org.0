Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F072E256DE6
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 14:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62856E34E;
	Sun, 30 Aug 2020 12:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E196E332
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598792330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVjx4EGfhRBDZlJyfOCPuAVbuYnQnae4/qIYiLWMT1M=;
 b=ecRM9Rjc/xQG6RpFH3cny6XicQ2NZXA8s2zbaCJ0f+NO1vJCkDnAHIg1qrVwne4x116ff8
 WTxXm6dnBEZkqto0MIe3qHF0DQnB18VNad0qHo+fSE+Xp1ap3/J7yA9BBi4OTMOdNYcG+E
 D5zCe7kl3nKcIXLUYRW8HbIaIZ/GsUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-vu2RpGzxPy6nNGOfR8kZeA-1; Sun, 30 Aug 2020 08:58:46 -0400
X-MC-Unique: vu2RpGzxPy6nNGOfR8kZeA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B3A78015A8;
 Sun, 30 Aug 2020 12:58:44 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C776171C6;
 Sun, 30 Aug 2020 12:58:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v8 15/17] drm/i915: panel: Honor the VBT PWM frequency for
 devs with an external PWM controller
Date: Sun, 30 Aug 2020 14:57:51 +0200
Message-Id: <20200830125753.230420-16-hdegoede@redhat.com>
In-Reply-To: <20200830125753.230420-1-hdegoede@redhat.com>
References: <20200830125753.230420-1-hdegoede@redhat.com>
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
Cc: linux-pwm@vger.kernel.org, linux-acpi@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So far for devices using an external PWM controller (devices using
pwm_setup_backlight()), we have been hardcoding the period-time passed to
pwm_config() to 21333 ns.

I suspect this was done because many VBTs set the PWM frequency to 200
which corresponds to a period-time of 5000000 ns, which greatly exceeds
the PWM_MAX_PERIOD_NS define in the Crystal Cove PMIC PWM driver, which
used to be 21333.

This PWM_MAX_PERIOD_NS define was actually based on a bug in the PWM
driver where its period and duty-cycle times where off by a factor of 256.

Due to this bug the hardcoded CRC_PMIC_PWM_PERIOD_NS value of 21333 would
result in the PWM driver using its divider of 128, which would result in
a PWM output frequency of 6000000 Hz / 256 / 128 = 183 Hz. So actually
pretty close to the default VBT value of 200 Hz.

Now that this bug in the pwm-crc driver is fixed, we can actually use
the VBT defined frequency.

This is important because:

a) With the pwm-crc driver fixed it will now translate the hardcoded
CRC_PMIC_PWM_PERIOD_NS value of 21333 ns / 46 Khz to a PWM output
frequency of 23 KHz (the max it can do).

b) The pwm-lpss driver used on many models has always honored the
21333 ns / 46 Khz request

Some panels do not like such high output frequencies. E.g. on a Terra
Pad 1061 tablet, using the LPSS PWM controller, the backlight would go
from off to max, when changing the sysfs backlight brightness value from
90-100%, anything under aprox. 90% would turn the backlight fully off.

Honoring the VBT specified PWM frequency will also hopefully fix the
various bug reports which we have received about users perceiving the
backlight to flicker after a suspend/resume cycle.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_panel.c    | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e8f809161c75..7171e7c8d928 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -223,6 +223,7 @@ struct intel_panel {
 		bool util_pin_active_low;	/* bxt+ */
 		u8 controller;		/* bxt+ only */
 		struct pwm_device *pwm;
+		int pwm_period_ns;
 
 		/* DPCD backlight */
 		u8 pwmgen_bit_count;
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index df7472a3b9f8..5a13089d2fc0 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -40,8 +40,6 @@
 #include "intel_dsi_dcs_backlight.h"
 #include "intel_panel.h"
 
-#define CRC_PMIC_PWM_PERIOD_NS	21333
-
 void
 intel_fixed_panel_mode(const struct drm_display_mode *fixed_mode,
 		       struct drm_display_mode *adjusted_mode)
@@ -597,7 +595,7 @@ static u32 pwm_get_backlight(struct intel_connector *connector)
 	int duty_ns;
 
 	duty_ns = pwm_get_duty_cycle(panel->backlight.pwm);
-	return DIV_ROUND_UP(duty_ns * 100, CRC_PMIC_PWM_PERIOD_NS);
+	return DIV_ROUND_UP(duty_ns * 100, panel->backlight.pwm_period_ns);
 }
 
 static void lpt_set_backlight(const struct drm_connector_state *conn_state, u32 level)
@@ -671,9 +669,10 @@ static void bxt_set_backlight(const struct drm_connector_state *conn_state, u32
 static void pwm_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_panel *panel = &to_intel_connector(conn_state->connector)->panel;
-	int duty_ns = DIV_ROUND_UP(level * CRC_PMIC_PWM_PERIOD_NS, 100);
+	int duty_ns = DIV_ROUND_UP(level * panel->backlight.pwm_period_ns, 100);
 
-	pwm_config(panel->backlight.pwm, duty_ns, CRC_PMIC_PWM_PERIOD_NS);
+	pwm_config(panel->backlight.pwm, duty_ns,
+		   panel->backlight.pwm_period_ns);
 }
 
 static void
@@ -1917,6 +1916,9 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 		return -ENODEV;
 	}
 
+	panel->backlight.pwm_period_ns = NSEC_PER_SEC /
+					 get_vbt_pwm_freq(dev_priv);
+
 	/*
 	 * FIXME: pwm_apply_args() should be removed when switching to
 	 * the atomic PWM API.
@@ -1926,9 +1928,10 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 	panel->backlight.min = 0; /* 0% */
 	panel->backlight.max = 100; /* 100% */
 	level = intel_panel_compute_brightness(connector, 100);
-	ns = DIV_ROUND_UP(level * CRC_PMIC_PWM_PERIOD_NS, 100);
+	ns = DIV_ROUND_UP(level * panel->backlight.pwm_period_ns, 100);
 
-	retval = pwm_config(panel->backlight.pwm, ns, CRC_PMIC_PWM_PERIOD_NS);
+	retval = pwm_config(panel->backlight.pwm, ns,
+			    panel->backlight.pwm_period_ns);
 	if (retval < 0) {
 		drm_err(&dev_priv->drm, "Failed to configure the pwm chip\n");
 		pwm_put(panel->backlight.pwm);
@@ -1937,7 +1940,7 @@ static int pwm_setup_backlight(struct intel_connector *connector,
 	}
 
 	level = DIV_ROUND_UP_ULL(pwm_get_duty_cycle(panel->backlight.pwm) * 100,
-			     CRC_PMIC_PWM_PERIOD_NS);
+				 panel->backlight.pwm_period_ns);
 	panel->backlight.level =
 		intel_panel_compute_brightness(connector, level);
 	panel->backlight.enabled = panel->backlight.level != 0;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
