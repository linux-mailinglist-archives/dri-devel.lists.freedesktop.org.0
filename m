Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCAE25C027
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 13:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4166E9B7;
	Thu,  3 Sep 2020 11:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200646E9B7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599132252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmcoOem2KoZYOE7FI+BWoY59LopBCPfK8+RQalR2O38=;
 b=WqWDHbaGCRvR0RWcOV/a2gTZfBBnk6K2VBuulysmQhlyMwXJQFG8cA7KqJZ/ufezNbWzBN
 u4Gl44+l/D0n7zogzr2I4Qf4y5T8vUMzEhDgN2D2UnK2t/J9PEcOrXmFQIRq2KRuwx6iy+
 mL6JIVYKKY9V9rYSCXgSWM9PWFOiqyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-mg5AhJlSOtudXCDkKVvZeA-1; Thu, 03 Sep 2020 07:24:08 -0400
X-MC-Unique: mg5AhJlSOtudXCDkKVvZeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5879A6408C;
 Thu,  3 Sep 2020 11:24:06 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-3.ams2.redhat.com [10.36.113.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC2CC5C1C2;
 Thu,  3 Sep 2020 11:24:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v10 07/17] pwm: lpss: Remove suspend/resume handlers
Date: Thu,  3 Sep 2020 13:23:27 +0200
Message-Id: <20200903112337.4113-8-hdegoede@redhat.com>
In-Reply-To: <20200903112337.4113-1-hdegoede@redhat.com>
References: <20200903112337.4113-1-hdegoede@redhat.com>
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

PWM controller drivers should not restore the PWM state on resume. The
convention is that PWM consumers do this by calling pwm_apply_state(),
so that it can be done at the exact moment when the consumer needs
the state to be stored, avoiding e.g. backlight flickering.

The only in kernel consumers of the pwm-lpss code, the i915 driver
and the pwm-class sysfs interface code both correctly restore the
state on resume, so there is no need to do this in the pwm-lpss code.

More-over the removed resume handler is buggy, since it blindly
restores the ctrl-register contents without setting the update
bit, which is necessary to get the controller to actually use/apply
the restored base-unit and on-time-div values.

Acked-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v9:
- This is a new patch in v9 of this series
---
 drivers/pwm/pwm-lpss-platform.c |  1 -
 drivers/pwm/pwm-lpss.c          | 24 ------------------------
 drivers/pwm/pwm-lpss.h          |  3 ---
 3 files changed, 28 deletions(-)

diff --git a/drivers/pwm/pwm-lpss-platform.c b/drivers/pwm/pwm-lpss-platform.c
index 48f34d20aecd..c6502cf7a7af 100644
--- a/drivers/pwm/pwm-lpss-platform.c
+++ b/drivers/pwm/pwm-lpss-platform.c
@@ -89,7 +89,6 @@ static int pwm_lpss_prepare(struct device *dev)
 
 static const struct dev_pm_ops pwm_lpss_platform_pm_ops = {
 	.prepare = pwm_lpss_prepare,
-	SET_SYSTEM_SLEEP_PM_OPS(pwm_lpss_suspend, pwm_lpss_resume)
 };
 
 static const struct acpi_device_id pwm_lpss_acpi_match[] = {
diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 9c5c7217c9b6..3444c56b4bed 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -260,30 +260,6 @@ int pwm_lpss_remove(struct pwm_lpss_chip *lpwm)
 }
 EXPORT_SYMBOL_GPL(pwm_lpss_remove);
 
-int pwm_lpss_suspend(struct device *dev)
-{
-	struct pwm_lpss_chip *lpwm = dev_get_drvdata(dev);
-	int i;
-
-	for (i = 0; i < lpwm->info->npwm; i++)
-		lpwm->saved_ctrl[i] = readl(lpwm->regs + i * PWM_SIZE + PWM);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pwm_lpss_suspend);
-
-int pwm_lpss_resume(struct device *dev)
-{
-	struct pwm_lpss_chip *lpwm = dev_get_drvdata(dev);
-	int i;
-
-	for (i = 0; i < lpwm->info->npwm; i++)
-		writel(lpwm->saved_ctrl[i], lpwm->regs + i * PWM_SIZE + PWM);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pwm_lpss_resume);
-
 MODULE_DESCRIPTION("PWM driver for Intel LPSS");
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pwm/pwm-lpss.h b/drivers/pwm/pwm-lpss.h
index 7909fa12fca2..70db7e389d66 100644
--- a/drivers/pwm/pwm-lpss.h
+++ b/drivers/pwm/pwm-lpss.h
@@ -19,7 +19,6 @@ struct pwm_lpss_chip {
 	struct pwm_chip chip;
 	void __iomem *regs;
 	const struct pwm_lpss_boardinfo *info;
-	u32 saved_ctrl[MAX_PWMS];
 };
 
 struct pwm_lpss_boardinfo {
@@ -37,7 +36,5 @@ struct pwm_lpss_boardinfo {
 struct pwm_lpss_chip *pwm_lpss_probe(struct device *dev, struct resource *r,
 				     const struct pwm_lpss_boardinfo *info);
 int pwm_lpss_remove(struct pwm_lpss_chip *lpwm);
-int pwm_lpss_suspend(struct device *dev);
-int pwm_lpss_resume(struct device *dev);
 
 #endif	/* __PWM_LPSS_H */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
