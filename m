Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5711D1F0DBA
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 20:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E0F6E18E;
	Sun,  7 Jun 2020 18:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241296E18E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591553941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWk/To7CyUecrdM3R5nBGROQ1lUsEmkED3rqhu0hGtk=;
 b=dDjRB/RvQ+CK4xVKtvIv7EN+ScdwMAf4sOxoPg1yW53TqyOie7mM/aZpjLwufofEqYMhnB
 qXXSni955bDIKUuVCh9BuhLqz7jORZzymAW+6GO9FAwUdQNqC+5K2mZePRm5fJpNnipqPP
 xUeXwNUOGsAdOvqS5N/MdG9Qzu9FNzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-13oHECoTMi6A5Xa-mPGvVQ-1; Sun, 07 Jun 2020 14:18:57 -0400
X-MC-Unique: 13oHECoTMi6A5Xa-mPGvVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3419D107ACCA;
 Sun,  7 Jun 2020 18:18:55 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-92.ams2.redhat.com [10.36.112.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABDB75C1BD;
 Sun,  7 Jun 2020 18:18:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v2 03/15] pwm: lpss: Add range limit check for the base_unit
 register value
Date: Sun,  7 Jun 2020 20:18:28 +0200
Message-Id: <20200607181840.13536-4-hdegoede@redhat.com>
In-Reply-To: <20200607181840.13536-1-hdegoede@redhat.com>
References: <20200607181840.13536-1-hdegoede@redhat.com>
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

When the user requests a high enough period ns value, then the
calculations in pwm_lpss_prepare() might result in a base_unit value of 0.

But according to the data-sheet the way the PWM controller works is that
each input clock-cycle the base_unit gets added to a N bit counter and
that counter overflowing determines the PWM output frequency. Adding 0
to the counter is a no-op. The data-sheet even explicitly states that
writing 0 to the base_unit bits will result in the PWM outputting a
continuous 0 signal.

base_unit values > (base_unit_range / 256), or iow base_unit values using
the 8 most significant bits, cause loss of resolution of the duty-cycle.
E.g. assuming a base_unit_range of 65536 steps, then a base_unit value of
768 (256 * 3), limits the duty-cycle resolution to 65536 / 768 = 85 steps.
Clamp the max base_unit value to base_unit_range / 32 to ensure a
duty-cycle resolution of at least 32 steps. This limits the maximum
output frequency to 600 KHz / 780 KHz depending on the base clock.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pwm/pwm-lpss.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 9d965ffe66d1..cae74ce61654 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -97,6 +97,14 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *lpwm, struct pwm_device *pwm,
 	freq *= base_unit_range;
 
 	base_unit = DIV_ROUND_CLOSEST_ULL(freq, c);
+	/*
+	 * base_unit must not be 0 and for values > (base_unit_range / 256)
+	 * (values using the 8 most significant bits) the duty-cycle resolution
+	 * degrades. Clamp the maximum value to base_unit_range / 32 which
+	 * leaves a duty-cycle resolution of 32 steps.
+	 */
+	base_unit = clamp_t(unsigned long long, base_unit, 1,
+			    base_unit_range / 32);
 
 	on_time_div = 255ULL * duty_ns;
 	do_div(on_time_div, period_ns);
@@ -105,7 +113,6 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *lpwm, struct pwm_device *pwm,
 	orig_ctrl = ctrl = pwm_lpss_read(pwm);
 	ctrl &= ~PWM_ON_TIME_DIV_MASK;
 	ctrl &= ~(base_unit_range << PWM_BASE_UNIT_SHIFT);
-	base_unit &= base_unit_range;
 	ctrl |= (u32) base_unit << PWM_BASE_UNIT_SHIFT;
 	ctrl |= on_time_div;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
