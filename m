Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E609F256DC7
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 14:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209EC6E2E0;
	Sun, 30 Aug 2020 12:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92646E2E0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 12:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598792301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9AuNYLGu06i5bj0iiRfB2Pq9KBPBvi3vak13kj5YjA=;
 b=cQQzygEdEJH46cGYWohJuKsf4gq3riFaYrBQtZejFAaWhEarX/FAz9QNYbLkc/CZg9xAwK
 2q6iO8M7cEfL4QjPfPIZ8lYLEqjHU3y5WhDQh3KwSZwymale5pobrgKIywFJyXzogzy1Mm
 sMSWmQi+BfAswIXdwJTUZIIwo/euAec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-EUpFBF6-N0yV6g1tv4BKVQ-1; Sun, 30 Aug 2020 08:58:19 -0400
X-MC-Unique: EUpFBF6-N0yV6g1tv4BKVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9A9BADC86;
 Sun, 30 Aug 2020 12:58:17 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 596E2171C6;
 Sun, 30 Aug 2020 12:58:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v8 06/17] pwm: lpss: Use pwm_lpss_restore() when restoring
 state on resume
Date: Sun, 30 Aug 2020 14:57:42 +0200
Message-Id: <20200830125753.230420-7-hdegoede@redhat.com>
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

Before this commit a suspend + resume of the LPSS PWM controller
would result in the controller being reset to its defaults of
output-freq = clock/256, duty-cycle=100%, until someone changes
to the output-freq and/or duty-cycle are made.

This problem has been masked so far because the main consumer
(the i915 driver) was always making duty-cycle changes on resume.
With the conversion of the i915 driver to the atomic PWM API the
driver now only disables/enables the PWM on suspend/resume leaving
the output-freq and duty as is, triggering this problem.

The LPSS PWM controller has a mechanism where the ctrl register value
and the actual base-unit and on-time-div values used are latched. When
software sets the SW_UPDATE bit then at the end of the current PWM cycle,
the new values from the ctrl-register will be latched into the actual
registers, and the SW_UPDATE bit will be cleared.

The problem is that before this commit our suspend/resume handling
consisted of simply saving the PWM ctrl register on suspend and
restoring it on resume, without setting the PWM_SW_UPDATE bit.
When the controller has lost its state over a suspend/resume and thus
has been reset to the defaults, just restoring the register is not
enough. We must also set the SW_UPDATE bit to tell the controller to
latch the restored values into the actual registers.

Fixing this problem is not as simple as just or-ing in the value which
is being restored with SW_UPDATE. If the PWM was enabled before we must
write the new settings + PWM_SW_UPDATE before setting PWM_ENABLE.
We must also wait for PWM_SW_UPDATE to become 0 again and depending on the
model we must do this either before or after the setting of PWM_ENABLE.

All the necessary logic for doing this is already present inside
pwm_lpss_apply(), so instead of duplicating this inside the resume
handler, this commit adds a new pwm_lpss_restore() helper which mirrors
pwm_lpss_apply() minus the runtime-pm reference handling (which we should
not change on resume).

This fixes the output-freq and duty-cycle being reset to their defaults
on resume.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v8:
- Drop optimization to skip restore if current ctrl reg is the same as our saved
  ctrl reg value (because this causes issues on some devices)
- Simplify pwm_lpss_restore_state() to not rely on the current state
- Modify commit message to mention the new pwm_lpss_restore_state() helper

Changes in v6:
- Add a pwm_lpss_restore_state() helper for re-applying the PWM state on resume

Changes in v5:
- The changes to pwm_lpss_apply() are much cleaner now thanks to the new
  pwm_lpss_prepare_enable() helper.

Changes in v3:
- This replaces the "pwm: lpss: Set SW_UPDATE bit when enabling the PWM"
  patch from previous versions of this patch-set, which really was a hack
  working around the resume issue which this patch fixes properly.
---
 drivers/pwm/pwm-lpss.c | 40 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 8a136ba2a583..9a7400c6fb6e 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -166,6 +166,25 @@ static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
+/*
+ * This is a mirror of pwm_lpss_apply() without relying on the current state
+ * (no pwm_is_enabled() calls) and without pm_runtime reference handling,
+ * for restoring the PWM state on resume.
+ */
+static int pwm_lpss_restore_state(struct pwm_lpss_chip *lpwm,
+				  struct pwm_device *pwm,
+				  const struct pwm_state *state)
+{
+	int ret = 0;
+
+	if (state->enabled)
+		ret = pwm_lpss_prepare_enable(lpwm, pwm, state, true);
+	else
+		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
+
+	return ret;
+}
+
 static void pwm_lpss_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 			       struct pwm_state *state)
 {
@@ -278,10 +297,25 @@ EXPORT_SYMBOL_GPL(pwm_lpss_suspend);
 int pwm_lpss_resume(struct device *dev)
 {
 	struct pwm_lpss_chip *lpwm = dev_get_drvdata(dev);
-	int i;
+	struct pwm_device *pwm;
+	int i, ret;
 
-	for (i = 0; i < lpwm->info->npwm; i++)
-		writel(lpwm->saved_ctrl[i], lpwm->regs + i * PWM_SIZE + PWM);
+	for (i = 0; i < lpwm->info->npwm; i++) {
+		pwm = &lpwm->chip.pwms[i];
+
+		/*
+		 * We cannot just blindly restore the old value here. Since we
+		 * are changing the settings we must set SW_UPDATE and if the
+		 * PWM was enabled before we must write the new settings +
+		 * PWM_SW_UPDATE before setting PWM_ENABLE. We must also wait
+		 * for PWM_SW_UPDATE to become 0 again and depending on the
+		 * model we must do this either before or after the setting of
+		 * PWM_ENABLE.
+		 */
+		ret = pwm_lpss_restore_state(lpwm, pwm, &pwm->state);
+		if (ret)
+			dev_err(dev, "Error restoring state on resume\n");
+	}
 
 	return 0;
 }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
