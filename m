Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87408256DD5
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 14:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47D36E2F2;
	Sun, 30 Aug 2020 12:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2093E6E2E6
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598792307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sL+jByNDV2GBlQ72/Hf5linnOG6oA5dOJnHUKFCOLME=;
 b=ap2MlKiXE5YYrU1JgSPS8sEHbKdTDta1vuq5uk+yq2kOlB80+k6IUD7RN7kvmKeSlyFATx
 nYjIrlqry0bdii8K5XL72QLt2M6vOi0Rl+g/TFuHiZAclF/KUh7dbnRGgKwk/scOI91fhC
 f4SLLyHS6TzIn3DiuL2WjOHx2UuckTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-Bk9voESCM1OtViAZKhZ31w-1; Sun, 30 Aug 2020 08:58:23 -0400
X-MC-Unique: Bk9voESCM1OtViAZKhZ31w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDE5E1005E5E;
 Sun, 30 Aug 2020 12:58:20 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CA04171C6;
 Sun, 30 Aug 2020 12:58:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v8 07/17] pwm: lpss: Always update state and set update bit
Date: Sun, 30 Aug 2020 14:57:43 +0200
Message-Id: <20200830125753.230420-8-hdegoede@redhat.com>
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

This commit removes a check where we would skip writing the ctrl register
and then setting the update bit in case the ctrl register already contains
the correct values.

In a perfect world skipping the update should be fine in these cases, but
on Cherry Trail devices the AML code in the GFX0 devices' PS0 and PS3
methods messes with the PWM controller.

The "ACPI / LPSS: Resume Cherry Trail PWM controller in no-irq phase" patch
earlier in this series stops the GFX0._PS0 method from messing with the PWM
controller and on the DSDT-s inspected sofar the _PS3 method only reads
from the PWM controller (and turns it off before we get a change to do so):

    {
        PWMB = PWMC /* \_SB_.PCI0.GFX0.PWMC */
        PSAT |= 0x03
        Local0 = PSAT /* \_SB_.PCI0.GFX0.PSAT */
    }

The PWM controller getting turning off before we do this ourselves is
a bit annoying but not really an issue.

The problem this patch fixes comes from a new variant of the GFX0._PS3 code
messing with the PWM controller found on the Acer One 10 S1003 (1):

    {
        PWMB = PWMC /* \_SB_.PCI0.GFX0.PWMC */
        PWMT = PWMC /* \_SB_.PCI0.GFX0.PWMC */
        PWMT &= 0xFF0000FF
        PWMT |= 0xC0000000
        PWMC = PWMT /* \_SB_.PCI0.GFX0.PWMT */
        PWMT = PWMC /* \_SB_.PCI0.GFX0.PWMC */
        Sleep (0x64)
        PWMB &= 0x3FFFFFFF
        PWMC = PWMB /* \_SB_.PCI0.GFX0.PWMB */
        PSAT |= 0x03
        Local0 = PSAT /* \_SB_.PCI0.GFX0.PSAT */
    }

This "beautiful" piece of code clears the base-unit part of the ctrl-reg,
which effectively disables the controller, and it sets the update flag
to apply this change. Then after this it restores the original ctrl-reg
value, so we do not see it has mucked with the controller.

*But* it does not set the update flag when restoring the original value.
So the check to see if we can skip writing the ctrl register succeeds
but since the update flag was not set, the old base-unit value of 0 is
still in use and the PWM controller is effectively disabled.

IOW this PWM controller poking means that we cannot trust the base-unit /
on-time-div value we read back from the PWM controller since it may not
have been applied/committed. Thus we must always update the ctrl-register
and set the update bit.

1) And once I knew what to look for also in a bunch of other devices
including the popular Lenovo Ideapad Miix 310 and 320 models and
various Medion models.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v8:
- New patch in v8 of this patch-set
---
 drivers/pwm/pwm-lpss.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 9a7400c6fb6e..20f6b6d6f874 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -85,7 +85,7 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *lpwm, struct pwm_device *pwm,
 	unsigned long long on_time_div;
 	unsigned long c = lpwm->info->clk_rate, base_unit_range;
 	unsigned long long base_unit, freq = NSEC_PER_SEC;
-	u32 orig_ctrl, ctrl;
+	u32 ctrl;
 
 	do_div(freq, period_ns);
 
@@ -104,16 +104,14 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *lpwm, struct pwm_device *pwm,
 	do_div(on_time_div, period_ns);
 	on_time_div = 255ULL - on_time_div;
 
-	orig_ctrl = ctrl = pwm_lpss_read(pwm);
+	ctrl = pwm_lpss_read(pwm);
 	ctrl &= ~PWM_ON_TIME_DIV_MASK;
 	ctrl &= ~((base_unit_range - 1) << PWM_BASE_UNIT_SHIFT);
 	ctrl |= (u32) base_unit << PWM_BASE_UNIT_SHIFT;
 	ctrl |= on_time_div;
 
-	if (orig_ctrl != ctrl) {
-		pwm_lpss_write(pwm, ctrl);
-		pwm_lpss_write(pwm, ctrl | PWM_SW_UPDATE);
-	}
+	pwm_lpss_write(pwm, ctrl);
+	pwm_lpss_write(pwm, ctrl | PWM_SW_UPDATE);
 }
 
 static inline void pwm_lpss_cond_enable(struct pwm_device *pwm, bool cond)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
