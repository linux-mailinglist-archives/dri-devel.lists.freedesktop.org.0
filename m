Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A8483C211
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 13:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66D710E272;
	Thu, 25 Jan 2024 12:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AFF10E272
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 12:11:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZF-00045G-2Y; Thu, 25 Jan 2024 13:10:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZD-002HR0-Ad; Thu, 25 Jan 2024 13:10:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rSyZD-007n0c-0m;
 Thu, 25 Jan 2024 13:10:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 037/111] drm/bridge: ti-sn65dsi86: Make use of
 pwmchip_parent() macro
Date: Thu, 25 Jan 2024 13:08:59 +0100
Message-ID: <5ff5120f2b4ef6442a1d7c05916a772ec59a8c34.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2250;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=7IG8wfvHCOJH3K3/yOTYTJM4JaoDv3CFCpzCirHdo4E=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9lfViN0vegWZuJE5rA76ty/8Qo1LarD0ujm
 x/9P68wriiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPZQAKCRCPgPtYfRL+
 TpSxCACLbB7R5/2sLgTLZfA8X5UTdP1wpbAMo291mpVd5tdBK/cvGVq0S7SzHeAi/ZoN2xS8O/t
 pn9YpbiA31JC2Y4ETQfvB8t7emosTt+88F0xpLRwXhipgA/OVfJ5P2saMsG1uWt3otA5/wev4Np
 NNL5wp6Ux3B/rlT8oKlqmN394du8S3nWF6Xcbs7KLlF7xj8fbGaaAcP+Xvh9aciJh4NGhsojmpQ
 oIOztOg35h1gUggfUDf35B56krXAnZInJho3NX6U7rWbkL19O9/BafgyPpEIOeI8Y7KPQK+NvmA
 Uq1uWZUsVsOHDXW9C0kq4Q+T0lHqSAu0YpOu30cJ7DIC5zxp
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 kernel@pengutronix.de, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct pwm_chip::dev is about to change. To not have to touch this
driver in the same commit as struct pwm_chip::dev, use the macro
provided for exactly this purpose.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1f6e929c2f6a..f1fffbef3324 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1415,7 +1415,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int ret;
 
 	if (!pdata->pwm_enabled) {
-		ret = pm_runtime_resume_and_get(chip->dev);
+		ret = pm_runtime_resume_and_get(pwmchip_parent(chip));
 		if (ret < 0)
 			return ret;
 	}
@@ -1431,7 +1431,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
 						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
 			if (ret) {
-				dev_err(chip->dev, "failed to mux in PWM function\n");
+				dev_err(pwmchip_parent(chip), "failed to mux in PWM function\n");
 				goto out;
 			}
 		}
@@ -1507,7 +1507,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
 		if (ret) {
-			dev_err(chip->dev, "failed to update PWM_PRE_DIV\n");
+			dev_err(pwmchip_parent(chip), "failed to update PWM_PRE_DIV\n");
 			goto out;
 		}
 
@@ -1519,7 +1519,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
 	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
 	if (ret) {
-		dev_err(chip->dev, "failed to update PWM_EN/PWM_INV\n");
+		dev_err(pwmchip_parent(chip), "failed to update PWM_EN/PWM_INV\n");
 		goto out;
 	}
 
@@ -1527,7 +1527,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 out:
 
 	if (!pdata->pwm_enabled)
-		pm_runtime_put_sync(chip->dev);
+		pm_runtime_put_sync(pwmchip_parent(chip));
 
 	return ret;
 }
-- 
2.43.0

