Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C72256DD4
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 14:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E8E6E30C;
	Sun, 30 Aug 2020 12:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21E16E2FF
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598792312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yf1u7UBfto7CRYFZUxDmMudYk5P2tT4SCbGumU5AATw=;
 b=Ma1/1iIo5lDF3iyx1IiG0Ju+U3H9JAolDnr0BKQIh+SHnKIZvALVWjVh+/LRwKFssaaErz
 wvv9K/kXXn9xjPuKHd47hzt6HJ/vZQkVihHbkRcXb197m8rF2F1lePpJqKCrFNeuwDXyNG
 TH8Rg2CMkGQDGLbl22yj3GJriidGnng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-xhyBWJZWM7Cbt-jDbLVEPQ-1; Sun, 30 Aug 2020 08:58:28 -0400
X-MC-Unique: xhyBWJZWM7Cbt-jDbLVEPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 965941005E5A;
 Sun, 30 Aug 2020 12:58:26 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0453C171C6;
 Sun, 30 Aug 2020 12:58:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v8 09/17] pwm: crc: Fix off-by-one error in the clock-divider
 calculations
Date: Sun, 30 Aug 2020 14:57:45 +0200
Message-Id: <20200830125753.230420-10-hdegoede@redhat.com>
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CRC PWM controller has a clock-divider which divides the clock with
a value between 1-128. But as can seen from the PWM_DIV_CLK_xxx
defines, this range maps to a register value of 0-127.

So after calculating the clock-divider we must subtract 1 to get the
register value, unless the requested frequency was so high that the
calculation has already resulted in a (rounded) divider value of 0.

Note that before this fix, setting a period of PWM_MAX_PERIOD_NS which
corresponds to the max. divider value of 128 could have resulted in a
bug where the code would use 128 as divider-register value which would
have resulted in an actual divider value of 0 (and the enable bit being
set). A rounding error stopped this bug from actually happen. This
same rounding error means that after the subtraction of 1 it is impossible
to set the divider to 128. Also bump PWM_MAX_PERIOD_NS by 1 ns to allow
setting a divider of 128 (register-value 127).

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Introduce crc_pwm_calc_clk_div() here instead of later in the patch-set
  to reduce the amount of churn in the patch-set a bit
---
 drivers/pwm/pwm-crc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
index c056eb9b858c..44ec7d5b63e1 100644
--- a/drivers/pwm/pwm-crc.c
+++ b/drivers/pwm/pwm-crc.c
@@ -22,7 +22,7 @@
 #define PWM_MAX_LEVEL		0xFF
 
 #define PWM_BASE_CLK_MHZ	6	/* 6 MHz */
-#define PWM_MAX_PERIOD_NS	5461333	/* 183 Hz */
+#define PWM_MAX_PERIOD_NS	5461334	/* 183 Hz */
 
 /**
  * struct crystalcove_pwm - Crystal Cove PWM controller
@@ -39,6 +39,18 @@ static inline struct crystalcove_pwm *to_crc_pwm(struct pwm_chip *pc)
 	return container_of(pc, struct crystalcove_pwm, chip);
 }
 
+static int crc_pwm_calc_clk_div(int period_ns)
+{
+	int clk_div;
+
+	clk_div = PWM_BASE_CLK_MHZ * period_ns / (256 * NSEC_PER_USEC);
+	/* clk_div 1 - 128, maps to register values 0-127 */
+	if (clk_div > 0)
+		clk_div--;
+
+	return clk_div;
+}
+
 static int crc_pwm_enable(struct pwm_chip *c, struct pwm_device *pwm)
 {
 	struct crystalcove_pwm *crc_pwm = to_crc_pwm(c);
@@ -68,11 +80,10 @@ static int crc_pwm_config(struct pwm_chip *c, struct pwm_device *pwm,
 	}
 
 	if (pwm_get_period(pwm) != period_ns) {
-		int clk_div;
+		int clk_div = crc_pwm_calc_clk_div(period_ns);
 
 		/* changing the clk divisor, need to disable fisrt */
 		crc_pwm_disable(c, pwm);
-		clk_div = PWM_BASE_CLK_MHZ * period_ns / (256 * NSEC_PER_USEC);
 
 		regmap_write(crc_pwm->regmap, PWM0_CLK_DIV,
 					clk_div | PWM_OUTPUT_ENABLE);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
