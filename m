Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6869E25BF7D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 12:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26176E983;
	Thu,  3 Sep 2020 10:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02036E982
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 10:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599130302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVk4/afJyWb9pRR5r2+53kQrVqN8NW1p5YVuK1f/Xj0=;
 b=K5xpnHL+X9zNPuC13IOycrtviOaau/fNsRAXEWqwFol9FdlawaC20EuUmW8g2BdQCGrBPT
 D7nfc5CEWx39hBcuRCVyopP7ZVtD6p6NWVglvwZ1rnIgCFiN8M7zuCPuYZVXt/Sp075wIA
 YF7CfjO0ZQj1rZyUzBREO6UV/iH2I7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-2Rz00j7dMPaimYbtNsUGlw-1; Thu, 03 Sep 2020 06:51:41 -0400
X-MC-Unique: 2Rz00j7dMPaimYbtNsUGlw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B9301091062;
 Thu,  3 Sep 2020 10:51:39 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 858D6784A8;
 Thu,  3 Sep 2020 10:51:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v9 06/17] pwm: lpss: Make pwm_lpss_apply() not rely on
 existing hardware state
Date: Thu,  3 Sep 2020 12:51:03 +0200
Message-Id: <20200903105114.9969-7-hdegoede@redhat.com>
In-Reply-To: <20200903105114.9969-1-hdegoede@redhat.com>
References: <20200903105114.9969-1-hdegoede@redhat.com>
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

Before this commit pwm_lpss_apply() was making 2 assuming
2 pre-conditions were met by the existing hardware state:

1. That the base-unit and on-time-div read back from the
control register are those actually in use, so that it
can skip setting the update bit if the read-back value
matches the desired values.

2. That the controller is enabled when the cached
pwm_state.enabled says that the controller is enabled.

As the long history of fixes for subtle (often suspend/resume)
lpss-pwm issues shows, this assumptions are not necessary
always true.

1. Specifically is not true on some (*) Cherry Trail devices
with a nasty GFX0._PS3 method which: a. saves the ctrl reg value.
b. sets the base-unit to 0 and writes the update bit to apply/commit
c. restores the original ctrl value without setting the update bit,
so that the 0 base-unit value is still in use.

2. Assumption 2. currently is true, but only because of the code which
saves/restores the state on suspend/resume. By convention restoring the
PWM state should be done by the PWM consumer and the presence of this
code in the pmw-lpss driver is a bug. Therefor the save/restore code will
be dropped in the next patch in this series, after which this assumption
also is no longer true.

This commit changes the pwm_lpss_apply() to make any assumptions about the
state the hardware is in. Instead it makes pwm_lpss_apply() always fully
program the PWM controller, making it much less fragile.

*) Seen on the Acer One 10 S1003, Lenovo Ideapad Miix 310 and 320 models
and various Medion models.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pwm/pwm-lpss.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 8a136ba2a583..9c5c7217c9b6 100644
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
@@ -124,8 +122,7 @@ static inline void pwm_lpss_cond_enable(struct pwm_device *pwm, bool cond)
 
 static int pwm_lpss_prepare_enable(struct pwm_lpss_chip *lpwm,
 				   struct pwm_device *pwm,
-				   const struct pwm_state *state,
-				   bool enable)
+				   const struct pwm_state *state)
 {
 	int ret;
 
@@ -134,12 +131,12 @@ static int pwm_lpss_prepare_enable(struct pwm_lpss_chip *lpwm,
 		return ret;
 
 	pwm_lpss_prepare(lpwm, pwm, state->duty_cycle, state->period);
-	pwm_lpss_cond_enable(pwm, enable && lpwm->info->bypass == false);
+	pwm_lpss_cond_enable(pwm, lpwm->info->bypass == false);
 	ret = pwm_lpss_wait_for_update(pwm);
 	if (ret)
 		return ret;
 
-	pwm_lpss_cond_enable(pwm, enable && lpwm->info->bypass == true);
+	pwm_lpss_cond_enable(pwm, lpwm->info->bypass == true);
 	return 0;
 }
 
@@ -152,11 +149,11 @@ static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (state->enabled) {
 		if (!pwm_is_enabled(pwm)) {
 			pm_runtime_get_sync(chip->dev);
-			ret = pwm_lpss_prepare_enable(lpwm, pwm, state, true);
+			ret = pwm_lpss_prepare_enable(lpwm, pwm, state);
 			if (ret)
 				pm_runtime_put(chip->dev);
 		} else {
-			ret = pwm_lpss_prepare_enable(lpwm, pwm, state, false);
+			ret = pwm_lpss_prepare_enable(lpwm, pwm, state);
 		}
 	} else if (pwm_is_enabled(pwm)) {
 		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
