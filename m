Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2142023AC
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 14:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AAF6E296;
	Sat, 20 Jun 2020 12:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617946E291
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592655549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4g2+V5TcJHXgErFsppORwNNUdAdaFJfxwB69IXzmmg=;
 b=S80YI3g1YYxypIIy+k3w2R98gXCUfuztg6e6HFIMUpKmYRqwWDf0AfPNrdHPH40dSfctSE
 yrP+68dyd6zjCg0VYamJfrcXX6S8d/RDVAu0JttyoqV4Zf7WKOqESr3pva6nRlyOOVIET6
 RH18455G5NQ8h1+xGFEXmxjJv8lq2eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-qed7Yk6oPCOI8e7pW76UAQ-1; Sat, 20 Jun 2020 08:19:06 -0400
X-MC-Unique: qed7Yk6oPCOI8e7pW76UAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 357D8100AA2C;
 Sat, 20 Jun 2020 12:19:04 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB998101E67A;
 Sat, 20 Jun 2020 12:19:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v3 09/15] pwm: crc: Enable/disable PWM output on enable/disable
Date: Sat, 20 Jun 2020 14:17:52 +0200
Message-Id: <20200620121758.14836-10-hdegoede@redhat.com>
In-Reply-To: <20200620121758.14836-1-hdegoede@redhat.com>
References: <20200620121758.14836-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

So far we've kept the PWM_OUTPUT_ENABLE bit set when disabling the PWM,
this commit makes crc_pwm_disable() clear it on disable and makes
crc_pwm_enable() set it again on re-enable.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Remove paragraph about tri-stating the output from the commit message,
  we don't have a datasheet so this was just an unfounded guess
---
 drivers/pwm/pwm-crc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
index 81232da0c767..b72008c9b072 100644
--- a/drivers/pwm/pwm-crc.c
+++ b/drivers/pwm/pwm-crc.c
@@ -54,7 +54,9 @@ static int crc_pwm_calc_clk_div(int period_ns)
 static int crc_pwm_enable(struct pwm_chip *c, struct pwm_device *pwm)
 {
 	struct crystalcove_pwm *crc_pwm = to_crc_pwm(c);
+	int div = crc_pwm_calc_clk_div(pwm_get_period(pwm));
 
+	regmap_write(crc_pwm->regmap, PWM0_CLK_DIV, div | PWM_OUTPUT_ENABLE);
 	regmap_write(crc_pwm->regmap, BACKLIGHT_EN, 1);
 
 	return 0;
@@ -63,8 +65,10 @@ static int crc_pwm_enable(struct pwm_chip *c, struct pwm_device *pwm)
 static void crc_pwm_disable(struct pwm_chip *c, struct pwm_device *pwm)
 {
 	struct crystalcove_pwm *crc_pwm = to_crc_pwm(c);
+	int div = crc_pwm_calc_clk_div(pwm_get_period(pwm));
 
 	regmap_write(crc_pwm->regmap, BACKLIGHT_EN, 0);
+	regmap_write(crc_pwm->regmap, PWM0_CLK_DIV, div);
 }
 
 static int crc_pwm_config(struct pwm_chip *c, struct pwm_device *pwm,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
