Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3A80B50B
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 16:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374AC10E19C;
	Sat,  9 Dec 2023 15:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B4210E19C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 15:25:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rBzCs-0003ND-PR; Sat, 09 Dec 2023 16:25:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rBzCq-00Efi6-4I; Sat, 09 Dec 2023 16:25:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rBzCp-00H8eS-R9; Sat, 09 Dec 2023 16:25:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH v2] drm/bridge: ti-sn65dsi86: Associate PWM device to
 auxiliary device
Date: Sat,  9 Dec 2023 16:25:20 +0100
Message-ID: <20231209152520.1987483-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=wnEeX8LEEe0Iz/aG6AgcL6ifNCSEgYFw0IO+CAXvM7w=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBldIbgMljm63BTIJrAbxqEIljXt2FO8RMq8eqOJ
 fZtehwAC3uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXSG4AAKCRCPgPtYfRL+
 TiZFB/91jCTYRLXpVmS877wuHTqBVfA+TR840BO4N4DgwmRUx6QNV+PVw7Q0ZzfuWUATL0kcgmN
 x5Rf/pG6HpOB1hELmwQ9oGQk/ovZUH6riH2SG/oUSPQ+MI1hh12I2AX331NphKiWpedOuAXsdn6
 qldHgvAmIBxuPlUCM5m4KYAAkjQwCVk7t+M3Xrp+qb1uIjQAV21un3zcm+i//Jsv7toLhNkaNZu
 Z/puDT7YaEHORWIVv9x8ugxFrBUDWIJIuD3XqVjQUt/KrqrNthUfG8PeSQzX94xjc7Li0upt4Mx
 cWu2dw30pdM/2hQAw8nVcyIoNLkSv5Lk3bE1uzQ0+d1yZGfu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's the ti_sn65dsi86.pwm auxiliary driver that creates the pwmchip, so
let the auxiliary device be the parent of the pwm device.

Note that getting a reference to the ti-sn65dsi86's pwm using pwm_get()
isn't affected by this change as ti_sn65dsi86_add_aux_device() sets the
auxiliary device's of_node to that of the main device.

Also change PM runtime tracking and diagnostic messages to use that one.
After enabling runtime PM operation for the auxiliary device, all works
as expected as parent devices are handled just fine.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since (implicit) v1
(https://lore.kernel.org/dri-devel/20231127101547.734061-2-u.kleine-koenig@pengutronix.de):

 - Add a call to pm_runtime_enable() for the aux device
   (tested and diagnosed by Nikita Travkin).
 - Rebased to yesterday's next, which required some (easy) conflict
   resolution for commit c9d99c73940e ("drm/bridge: ti-sn65dsi86:
   Simplify using pm_runtime_resume_and_get()").

The first submission got a Reviewed-by tag from Douglas Anderson. I'd
expect he is fine with the changes in this v2, but to not suggest in his
name, I didn't add the tag here. Also it's easier to readd the tag than
to drop it if there are new concerns.

Best regards
Uwe

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5b8e1dfc458d..c8a913d6f699 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1413,7 +1413,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int ret;
 
 	if (!pdata->pwm_enabled) {
-		ret = pm_runtime_resume_and_get(pdata->dev);
+		ret = pm_runtime_resume_and_get(chip->dev);
 		if (ret < 0)
 			return ret;
 	}
@@ -1429,7 +1429,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
 						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
 			if (ret) {
-				dev_err(pdata->dev, "failed to mux in PWM function\n");
+				dev_err(chip->dev, "failed to mux in PWM function\n");
 				goto out;
 			}
 		}
@@ -1505,7 +1505,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
 		if (ret) {
-			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
+			dev_err(chip->dev, "failed to update PWM_PRE_DIV\n");
 			goto out;
 		}
 
@@ -1517,7 +1517,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
 	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
 	if (ret) {
-		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
+		dev_err(chip->dev, "failed to update PWM_EN/PWM_INV\n");
 		goto out;
 	}
 
@@ -1525,7 +1525,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 out:
 
 	if (!pdata->pwm_enabled)
-		pm_runtime_put_sync(pdata->dev);
+		pm_runtime_put_sync(chip->dev);
 
 	return ret;
 }
@@ -1585,12 +1585,14 @@ static int ti_sn_pwm_probe(struct auxiliary_device *adev,
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
 
-	pdata->pchip.dev = pdata->dev;
+	pdata->pchip.dev = &adev->dev;
 	pdata->pchip.ops = &ti_sn_pwm_ops;
 	pdata->pchip.npwm = 1;
 	pdata->pchip.of_xlate = of_pwm_single_xlate;
 	pdata->pchip.of_pwm_n_cells = 1;
 
+	pm_runtime_enable(&adev->dev);
+
 	return pwmchip_add(&pdata->pchip);
 }
 
@@ -1601,7 +1603,7 @@ static void ti_sn_pwm_remove(struct auxiliary_device *adev)
 	pwmchip_remove(&pdata->pchip);
 
 	if (pdata->pwm_enabled)
-		pm_runtime_put_sync(pdata->dev);
+		pm_runtime_put_sync(&adev->dev);
 }
 
 static const struct auxiliary_device_id ti_sn_pwm_id_table[] = {

base-commit: bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
-- 
2.42.0

