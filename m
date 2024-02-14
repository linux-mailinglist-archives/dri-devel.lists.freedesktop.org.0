Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632C6854576
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 10:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7902210E6F2;
	Wed, 14 Feb 2024 09:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE6E10E6F2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 09:34:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBfB-0006DG-MA; Wed, 14 Feb 2024 10:34:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf7-000fIE-63; Wed, 14 Feb 2024 10:34:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf7-004YA7-0I;
 Wed, 14 Feb 2024 10:34:41 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH v6 152/164] drm/bridge: ti-sn65dsi86: Make use of
 pwmchip_parent() accessor
Date: Wed, 14 Feb 2024 10:33:19 +0100
Message-ID: <10a8d55110fc48a4759e65cc19556858587e94cc.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=2+hJgDZGRGeHwqsJ+7Px8E61TwsuuVMs8shyuEiYZzI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIj5veMJ7VhcEhur/rsYCIXXSOXhsBGd4Qx/O
 PO0yl9/xxWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyI+QAKCRCPgPtYfRL+
 TvkyCACoY5vx3iORKfSejqvdD8itZS9gscua0geIv2xXYusWqviv7b9vgml4EFiltRYWRJgHyD0
 hMI4TgDXt6n30Xydtp4jBd5433F/eTJf25fHJnNBjcebZ6OnsdaziDrU60+fODSCzW4CuCdZW1z
 p5Jc/pJ0jsrFu/DuUPJtJjLXBbr5whoojSulnGogm9HC1shJBSGaUCtLi//cTuv0NZ/Sg/HSZm6
 7Dg5n5MSrdxp0K3oCDvgysP3UTE9rWDnerZlLKa7/V/j4Y1mvIoDnE6W81o+CseyQWyQk33yhIZ
 j3n5QItrwQ0yEJyvXTTovdZZzJSCQ/aqJaeB/R15CaGpdNcy
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct pwm_chip::dev is about to change. To not have to touch this
driver in the same commit as struct pwm_chip::dev, use the accessor
function provided for exactly this purpose.

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

