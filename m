Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F220251603
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 12:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C239A6E8A6;
	Tue, 25 Aug 2020 10:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F2B6E8A2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 10:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598349693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+iL0S8ORO2sibR8s+wLFkvCJSbjQA2ggoJWqfR/GnX0=;
 b=D0jnd9tE8eEhIuVZczSRlRVJ6wfqrr+gCAj8E52Obctkky32RZoXM4cfxDPO5DXewrUFfF
 44d/cdxSl7/bTsbaPNWHx1CBsCFQXqswiqAIDEST37cHoqyOfWx0SdeuqJEhpAujrC5Zeu
 dqT61w21I6i2OXK5/LIlpz7ZuQyhFnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-eo3u8jb3MqqWwvSlAdXruA-1; Tue, 25 Aug 2020 06:01:29 -0400
X-MC-Unique: eo3u8jb3MqqWwvSlAdXruA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E972C800050;
 Tue, 25 Aug 2020 10:01:26 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-132.ams2.redhat.com
 [10.36.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E17C1808BB;
 Tue, 25 Aug 2020 10:01:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v7 05/16] pwm: lpss: Add pwm_lpss_prepare_enable() helper
Date: Tue, 25 Aug 2020 12:00:55 +0200
Message-Id: <20200825100106.61941-6-hdegoede@redhat.com>
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

In the not-enabled -> enabled path pwm_lpss_apply() needs to get a
runtime-pm reference; and then on any errors it needs to release it
again.

This leads to somewhat hard to read code. This commit introduces a new
pwm_lpss_prepare_enable() helper and moves all the steps necessary for
the not-enabled -> enabled transition there, so that we can error check
the entire transition in a single place and only have one pm_runtime_put()
on failure call site.

While working on this I noticed that the enabled -> enabled (update
settings) path was quite similar, so I've added an enable parameter to
the new pwm_lpss_prepare_enable() helper, which allows using it in that
path too.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pwm/pwm-lpss.c | 45 ++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index da9bc3d10104..8a136ba2a583 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -122,41 +122,48 @@ static inline void pwm_lpss_cond_enable(struct pwm_device *pwm, bool cond)
 		pwm_lpss_write(pwm, pwm_lpss_read(pwm) | PWM_ENABLE);
 }
 
+static int pwm_lpss_prepare_enable(struct pwm_lpss_chip *lpwm,
+				   struct pwm_device *pwm,
+				   const struct pwm_state *state,
+				   bool enable)
+{
+	int ret;
+
+	ret = pwm_lpss_is_updating(pwm);
+	if (ret)
+		return ret;
+
+	pwm_lpss_prepare(lpwm, pwm, state->duty_cycle, state->period);
+	pwm_lpss_cond_enable(pwm, enable && lpwm->info->bypass == false);
+	ret = pwm_lpss_wait_for_update(pwm);
+	if (ret)
+		return ret;
+
+	pwm_lpss_cond_enable(pwm, enable && lpwm->info->bypass == true);
+	return 0;
+}
+
 static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			  const struct pwm_state *state)
 {
 	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
-	int ret;
+	int ret = 0;
 
 	if (state->enabled) {
 		if (!pwm_is_enabled(pwm)) {
 			pm_runtime_get_sync(chip->dev);
-			ret = pwm_lpss_is_updating(pwm);
-			if (ret) {
-				pm_runtime_put(chip->dev);
-				return ret;
-			}
-			pwm_lpss_prepare(lpwm, pwm, state->duty_cycle, state->period);
-			pwm_lpss_cond_enable(pwm, lpwm->info->bypass == false);
-			ret = pwm_lpss_wait_for_update(pwm);
-			if (ret) {
+			ret = pwm_lpss_prepare_enable(lpwm, pwm, state, true);
+			if (ret)
 				pm_runtime_put(chip->dev);
-				return ret;
-			}
-			pwm_lpss_cond_enable(pwm, lpwm->info->bypass == true);
 		} else {
-			ret = pwm_lpss_is_updating(pwm);
-			if (ret)
-				return ret;
-			pwm_lpss_prepare(lpwm, pwm, state->duty_cycle, state->period);
-			return pwm_lpss_wait_for_update(pwm);
+			ret = pwm_lpss_prepare_enable(lpwm, pwm, state, false);
 		}
 	} else if (pwm_is_enabled(pwm)) {
 		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
 		pm_runtime_put(chip->dev);
 	}
 
-	return 0;
+	return ret;
 }
 
 static void pwm_lpss_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
