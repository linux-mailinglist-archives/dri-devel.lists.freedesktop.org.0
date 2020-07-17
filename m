Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB2223CF3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 15:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7F46EDBF;
	Fri, 17 Jul 2020 13:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7678C6EDBF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594993123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMbMxst1oiHtTJmDDNK1CEbufosoaisjf4HJnYds+98=;
 b=M0CNswnJS77C27XmRxokIFwykhreIiIBpAQlTCWspGVYSRHahrntho/NFVXtnwLhaFbJwi
 agGTXBxHqyFiA8Snm3mVj8xt5X8MuIvGuN6syk7rlWpglA31Ill+hVygRHp+eHmbAqkq9p
 1uBH6lBnj2ApvgLgWNVc05/RwFSGtX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-lVeEGG9RO4Sa2zkNWDP6_w-1; Fri, 17 Jul 2020 09:38:42 -0400
X-MC-Unique: lVeEGG9RO4Sa2zkNWDP6_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A121080;
 Fri, 17 Jul 2020 13:38:39 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-162.ams2.redhat.com
 [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02D0E8FA27;
 Fri, 17 Jul 2020 13:38:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v5 09/16] pwm: crc: Fix period changes not having any effect
Date: Fri, 17 Jul 2020 15:37:46 +0200
Message-Id: <20200717133753.127282-10-hdegoede@redhat.com>
In-Reply-To: <20200717133753.127282-1-hdegoede@redhat.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
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
Cc: linux-pwm@vger.kernel.org, linux-acpi@vger.kernel.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pwm-crc code is using 2 different enable bits:
1. bit 7 of the PWM0_CLK_DIV (PWM_OUTPUT_ENABLE)
2. bit 0 of the BACKLIGHT_EN register

I strongly suspect that the BACKLIGHT_EN register at address 0x51 really
controls a separate output-only GPIO which is connected to the LCD panels
backlight-enable input. Like how the PANEL_EN register at address 0x52
controls an output-only GPIO which is earmarked for the LCD panel's
enable pin. If this is correct then this GPIO should really be added to
the gpio-crystalcove.c driver and the PWM driver should stop poking it.
But I've been unable to come up with a definitive answer here, so I'm
keeping this as is for now.

As the comment in the old code already indicates we must disable the PWM
before we can change the clock divider. But the crc_pwm_disable() and
crc_pwm_enable() calls the old code make for this only change the
BACKLIGHT_EN register; and the value of that register does not matter for
changing the period / the divider. What does matter is that the
PWM_OUTPUT_ENABLE bit must be cleared before a new value can be written.

This commit modifies crc_pwm_config() to clear PWM_OUTPUT_ENABLE instead
when changing the period, so that period changes actually work.

Note this fix will cause a significant behavior change on some devices
using the CRC PWM output to drive their backlight. Before the PWM would
always run with the output frequency configured by the BIOS at boot, now
the period time specified by the i915 driver will actually be honored.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pwm/pwm-crc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
index 44ec7d5b63e1..81232da0c767 100644
--- a/drivers/pwm/pwm-crc.c
+++ b/drivers/pwm/pwm-crc.c
@@ -82,14 +82,11 @@ static int crc_pwm_config(struct pwm_chip *c, struct pwm_device *pwm,
 	if (pwm_get_period(pwm) != period_ns) {
 		int clk_div = crc_pwm_calc_clk_div(period_ns);
 
-		/* changing the clk divisor, need to disable fisrt */
-		crc_pwm_disable(c, pwm);
+		/* changing the clk divisor, clear PWM_OUTPUT_ENABLE first */
+		regmap_write(crc_pwm->regmap, PWM0_CLK_DIV, 0);
 
 		regmap_write(crc_pwm->regmap, PWM0_CLK_DIV,
 					clk_div | PWM_OUTPUT_ENABLE);
-
-		/* enable back */
-		crc_pwm_enable(c, pwm);
 	}
 
 	/* change the pwm duty cycle */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
