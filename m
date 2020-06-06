Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A91F089C
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jun 2020 22:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27B06E20F;
	Sat,  6 Jun 2020 20:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC386E20F
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jun 2020 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591475183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2T3eRMbyvrcLqFR6Ify+n4ofIKOt8s+1Ga6XZ53Ws0g=;
 b=HeOnR3fF+tWuGwsFIyB60zc+gp9qA/mXaXVSdiOaSB1fnO/VTFNmOJZlLU019NlLnoGlcp
 OPKoBFR3DpR1fCqtqjrVcNsTNtFfgYngDNpsA2OUcOUTtmEcRJvtWuPeqk3T8UqoRd9Aal
 qIccnbDN/nZoV9lnmJede+pDVpT8s1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-t3jZfp6xPBqUXz88AqJ3Tw-1; Sat, 06 Jun 2020 16:26:21 -0400
X-MC-Unique: t3jZfp6xPBqUXz88AqJ3Tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 554141005510;
 Sat,  6 Jun 2020 20:26:19 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-50.ams2.redhat.com [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEE795C557;
 Sat,  6 Jun 2020 20:26:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH 05/16] pwm: lpss: Set SW_UPDATE bit when enabling the PWM
Date: Sat,  6 Jun 2020 22:25:50 +0200
Message-Id: <20200606202601.48410-6-hdegoede@redhat.com>
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

On the LPSS PWM controller found on Bay Trail (BYT) and Cherry Trail (CHT)
platforms, the following sequence results in an output duty-cycle of 100%
independent of what the duty-cycle requested in the ctrl-reg is:

1. Clear ENABLE bit in ctrl register
2. Let the machine reach a S0i3 low power state
3. Set the ENABLE bit in the ctrl register

The LPSS PWM controller has a mechanism where the ctrl register value
and the actual base-unit and on-time-div values used are latched. When
software sets the SW_UPDATE bit then at the end of the current PWM cycle,
the new values from the ctrl-register will be latched into the actual
registers, and the SW_UPDATE bit will be cleared.  Note on BYT and CHT
the ENABLE bit must be set before waiting for the SW_UPDATE bit to clear,
otherwise the SW_UPDATE bit will never clear (this is indicated in the
pwm-lpss.c code by lpwm->info->bypass being false).

My theory about why this is happening is that when we hit S0i3 the part
which holds the latched values gets turned off and when its turned back on
again at least the on-time-div value has been lost and gets reset to 0
which corresponds to an output duty-cycle of 100%. Testing has shown that
setting the SW_UPDATE bit to request latching the ctrl-register values into
the actual registers (again) fixes this, confirming this theory.

In the past there have been issues where setting the SW_UPDATE bit when
nothing has changed would lead to the next ctrl register changing being
ignored, see commit 2153bbc12f77 ("pwm: lpss: Only set update bit if we are
actually changing the settings"), so we should only set the SW_UPDATE bit
when actually changing the ENABLE bit from 0 to 1.

When looking into how to fix this I noticed that on platforms where
lpwm->info->bypass == false we unnecessarily do 2 read-modify-write cycles
of the ctrl register, one to set the base-unit and on-time-div, immediately
followed by another to set the ENABLE bit.

This commit fixes the 100% duty cycle issue by folding the setting of the
ENABLE bit into pwm_lpss_prepare(), which already checks if any bits in
the ctrl-register have actually changed and if that is the case then sets
the SW_UPDATE bit.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pwm/pwm-lpss.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index a764e062103b..2cb0e2a9c08c 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -80,7 +80,7 @@ static inline int pwm_lpss_is_updating(struct pwm_device *pwm)
 }
 
 static void pwm_lpss_prepare(struct pwm_lpss_chip *lpwm, struct pwm_device *pwm,
-			     int duty_ns, int period_ns)
+			     int duty_ns, int period_ns, bool enable)
 {
 	unsigned long long on_time_div;
 	unsigned long c = lpwm->info->clk_rate, base_unit_range;
@@ -115,6 +115,8 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *lpwm, struct pwm_device *pwm,
 	ctrl &= ~((base_unit_range - 1) << PWM_BASE_UNIT_SHIFT);
 	ctrl |= (u32) base_unit << PWM_BASE_UNIT_SHIFT;
 	ctrl |= on_time_div;
+	if (enable)
+		ctrl |= PWM_ENABLE;
 
 	if (orig_ctrl != ctrl) {
 		pwm_lpss_write(pwm, ctrl);
@@ -142,8 +144,9 @@ static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 				pm_runtime_put(chip->dev);
 				return ret;
 			}
-			pwm_lpss_prepare(lpwm, pwm, state->duty_cycle, state->period);
-			pwm_lpss_cond_enable(pwm, lpwm->info->bypass == false);
+			pwm_lpss_prepare(lpwm, pwm,
+					 state->duty_cycle, state->period,
+					 lpwm->info->bypass == false);
 			ret = pwm_lpss_wait_for_update(pwm);
 			if (ret) {
 				pm_runtime_put(chip->dev);
@@ -154,7 +157,8 @@ static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			ret = pwm_lpss_is_updating(pwm);
 			if (ret)
 				return ret;
-			pwm_lpss_prepare(lpwm, pwm, state->duty_cycle, state->period);
+			pwm_lpss_prepare(lpwm, pwm, state->duty_cycle,
+					 state->period, false);
 			return pwm_lpss_wait_for_update(pwm);
 		}
 	} else if (pwm_is_enabled(pwm)) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
