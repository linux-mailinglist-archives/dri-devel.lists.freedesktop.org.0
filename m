Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9427F9D47
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 11:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E3710E217;
	Mon, 27 Nov 2023 10:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DD410E216
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 10:16:03 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r7Yef-00009D-AM; Mon, 27 Nov 2023 11:15:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r7Yed-00Bv4K-DO; Mon, 27 Nov 2023 11:15:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r7Yed-009F84-3q; Mon, 27 Nov 2023 11:15:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Associate PWM device to auxiliary
 device
Date: Mon, 27 Nov 2023 11:15:48 +0100
Message-ID: <20231127101547.734061-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3787;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=1Il0sDTyy+LXuzSrHWoSI16XS2xIUmTdEJYVsRu/26Y=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlZGxTFZc9emx0L8nvbnyWf8U96tet7RvwUtpY4
 2jIQ41cunCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZWRsUwAKCRCPgPtYfRL+
 Tl25B/95SjGoUWKxpG65QAHYFXZwL3WADV6ZmVCe0M/+alelmUJrXV0Zaiao7Caigu9t+j4Pgr0
 pPssTS8wu7yzk+LGrr/jsrjw0PLZOw3yw3IBAPAo24XoiFFCfQjxx2sXTxIvKbLCFK9dM6Enic/
 dMy26A4q7dBQEGj/jbgjgQSyuaXo+o9VTY4IV06Nw7BRyILQ6XorUMbeUwc3idRy7+bKEFdfggo
 TOF4Q23gFJd4vImOUSh/MpCHAq8/kR6A7m9akw21yLriG5eNkM9vHLiNcIt0ri8mWirnJKsbbC9
 YsrMMXd8rkII3PYdJEA3lv8upKBgqxEtyIfW6bsZhfUBJsX+
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's the ti_sn65dsi86.pwm auxiliary driver that creates the pwmchip, so
let the auxiliary device be the parent of the pwm device.

Note that getting a reference to the ti-sn65dsi86's pwm using pwm_get()
isn't affected by this change as ti_sn65dsi86_add_aux_device() sets the
auxiliary device's of_node to that of the main device.

Also change PM runtime tracking and diagnostic messages to use that one.
As the PM runtime functions also handle parent devices this should work
fine, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this patch has an (easy to resolve) conflict with a patch I sent earlier
"drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()"
(https://lore.kernel.org/dri-devel/20231123175425.496956-2-u.kleine-koenig@pengutronix.de).
I was unsure if I should base this new patch on that older one.

While I think the patch is fine, I'd have a better feeling about it if
someone could give feedback that the PWM still works as intended with
this change.

Best regards
Uwe

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c45c07840f64..254f0039dad2 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1413,9 +1413,9 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int ret;
 
 	if (!pdata->pwm_enabled) {
-		ret = pm_runtime_get_sync(pdata->dev);
+		ret = pm_runtime_get_sync(chip->dev);
 		if (ret < 0) {
-			pm_runtime_put_sync(pdata->dev);
+			pm_runtime_put_sync(chip->dev);
 			return ret;
 		}
 	}
@@ -1431,7 +1431,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
 						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
 			if (ret) {
-				dev_err(pdata->dev, "failed to mux in PWM function\n");
+				dev_err(chip->dev, "failed to mux in PWM function\n");
 				goto out;
 			}
 		}
@@ -1507,7 +1507,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
 		if (ret) {
-			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
+			dev_err(chip->dev, "failed to update PWM_PRE_DIV\n");
 			goto out;
 		}
 
@@ -1519,7 +1519,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
 	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
 	if (ret) {
-		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
+		dev_err(chip->dev, "failed to update PWM_EN/PWM_INV\n");
 		goto out;
 	}
 
@@ -1527,7 +1527,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 out:
 
 	if (!pdata->pwm_enabled)
-		pm_runtime_put_sync(pdata->dev);
+		pm_runtime_put_sync(chip->dev);
 
 	return ret;
 }
@@ -1587,7 +1587,7 @@ static int ti_sn_pwm_probe(struct auxiliary_device *adev,
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
 
-	pdata->pchip.dev = pdata->dev;
+	pdata->pchip.dev = &adev->dev;
 	pdata->pchip.ops = &ti_sn_pwm_ops;
 	pdata->pchip.npwm = 1;
 	pdata->pchip.of_xlate = of_pwm_single_xlate;
@@ -1603,7 +1603,7 @@ static void ti_sn_pwm_remove(struct auxiliary_device *adev)
 	pwmchip_remove(&pdata->pchip);
 
 	if (pdata->pwm_enabled)
-		pm_runtime_put_sync(pdata->dev);
+		pm_runtime_put_sync(&adev->dev);
 }
 
 static const struct auxiliary_device_id ti_sn_pwm_id_table[] = {

base-commit: 48bbaf8b793e0770798519f8ee1ea2908ff0943a
-- 
2.42.0

