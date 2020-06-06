Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B40F1F08A5
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jun 2020 22:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112616E228;
	Sat,  6 Jun 2020 20:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176BA6E227
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jun 2020 20:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591475197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OyDeV0Z/UvojkUctUmW3EntL3TMpO41rrKpUP7M6VZg=;
 b=SC+gse6rps+oczl2t0sWCJ2u6rvnQJ8XHP0gdkNXT/PdACpZNX3k7ecVl29Hcg2jaYkstF
 GIc9BMPjO6kg2gEIy75wpkx3cpGOpxCCoGgvHAwr/qmR4Thye2E9spaHz9A1Dut/u8M7dH
 mQvPdacz+8zkHvvvISAd7KMRbcKgVG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-YakesdgHOR6dhfC8jZVQYw-1; Sat, 06 Jun 2020 16:26:26 -0400
X-MC-Unique: YakesdgHOR6dhfC8jZVQYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D436B1853578;
 Sat,  6 Jun 2020 20:26:24 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-50.ams2.redhat.com [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6081D5C557;
 Sat,  6 Jun 2020 20:26:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH 07/16] pwm: crc: Fix period / duty_cycle times being off by a
 factor of 256
Date: Sat,  6 Jun 2020 22:25:52 +0200
Message-Id: <20200606202601.48410-8-hdegoede@redhat.com>
In-Reply-To: <20200606202601.48410-1-hdegoede@redhat.com>
References: <20200606202601.48410-1-hdegoede@redhat.com>
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
Cc: linux-pwm@vger.kernel.org, linux-acpi@vger.kernel.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While looking into adding atomic-pwm support to the pwm-crc driver I
noticed something odd, there is a PWM_BASE_CLK define of 6 MHz and
there is a clock-divider which divides this with a value between 1-128,
and there are 256 duty-cycle steps.

The pwm-crc code before this commit assumed that a clock-divider
setting of 1 means that the PWM output is running at 6 MHZ, if that
is true, where do these 256 duty-cycle steps come from?

This would require an internal frequency of 256 * 6 MHz = 1.5 GHz, that
seems unlikely for a PMIC which is using a silicon process optimized for
power-switching transistors. It is way more likely that there is an 8
bit counter for the duty cycle which acts as an extra fixed divider
wrt the PWM output frequency.

The main user of the pwm-crc driver is the i915 GPU driver which uses it
for backlight control. Lets compare the PWM register values set by the
video-BIOS (the GOP), assuming the extra fixed divider is present versus
the PWM frequency specified in the Video-BIOS-Tables:

Device:		PWM Hz set by BIOS	PWM Hz specified in VBT
Asus T100TA 	200			200
Asus T100HA 	200			200
Lenovo Miix 2 8	23437			20000
Toshiba WT8-A	23437			20000

So as we can see if we assume the extra division by 256 then the register
values set by the GOP are an exact match for the VBT values, where as
otherwise the values would be of by a factor of 256.

This commit fixes the period / duty_cycle calculations to take the
extra division by 256 into account.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pwm/pwm-crc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
index 272eeb071147..43fc912c1fe9 100644
--- a/drivers/pwm/pwm-crc.c
+++ b/drivers/pwm/pwm-crc.c
@@ -21,8 +21,10 @@
 
 #define PWM_MAX_LEVEL		0xFF
 
-#define PWM_BASE_CLK		6000000  /* 6 MHz */
-#define PWM_MAX_PERIOD_NS	21333    /* 46.875KHz */
+#define PWM_BASE_CLK_MHZ	6	/* 6 MHz */
+#define PWM_MAX_PERIOD_NS	5461333	/* 183 Hz */
+
+#define NSEC_PER_MHZ		1000
 
 /**
  * struct crystalcove_pwm - Crystal Cove PWM controller
@@ -72,7 +74,7 @@ static int crc_pwm_config(struct pwm_chip *c, struct pwm_device *pwm,
 
 		/* changing the clk divisor, need to disable fisrt */
 		crc_pwm_disable(c, pwm);
-		clk_div = PWM_BASE_CLK * period_ns / NSEC_PER_SEC;
+		clk_div = PWM_BASE_CLK_MHZ * period_ns / (256 * NSEC_PER_MHZ);
 
 		regmap_write(crc_pwm->regmap, PWM0_CLK_DIV,
 					clk_div | PWM_OUTPUT_ENABLE);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
