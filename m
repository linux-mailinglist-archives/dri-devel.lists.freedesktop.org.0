Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E3F25160D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 12:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3B86E8AC;
	Tue, 25 Aug 2020 10:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536236E8AB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 10:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598349710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yf1u7UBfto7CRYFZUxDmMudYk5P2tT4SCbGumU5AATw=;
 b=hrbmna0zF6ZmEdyJbaCXUG3ro4PP7/qWJadwOTyWfeu0J9Sc+mpl8I96XueNDwJDq3YKqV
 m9of7IZ18FY/N+SibUXELzQrGbmyvefHmUfmhOzvOXNqQ7l/5/fOJ6K75F6kroPimJ0Miz
 CVvbobF3c/TMDz+w9YKIUqHYxuFntLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-04ytnbgINq-BEA1Kgux37w-1; Tue, 25 Aug 2020 06:01:46 -0400
X-MC-Unique: 04ytnbgINq-BEA1Kgux37w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C63D1084C96;
 Tue, 25 Aug 2020 10:01:43 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-132.ams2.redhat.com
 [10.36.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD23980931;
 Tue, 25 Aug 2020 10:01:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v7 08/16] pwm: crc: Fix off-by-one error in the clock-divider
 calculations
Date: Tue, 25 Aug 2020 12:00:58 +0200
Message-Id: <20200825100106.61941-9-hdegoede@redhat.com>
In-Reply-To: <20200825100106.61941-1-hdegoede@redhat.com>
References: <20200825100106.61941-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
