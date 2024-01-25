Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992FC83C22B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 13:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB9710F8AC;
	Thu, 25 Jan 2024 12:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2789310F8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 12:11:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZR-0004e8-Sk; Thu, 25 Jan 2024 13:11:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSyZQ-002HVO-14; Thu, 25 Jan 2024 13:11:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rSyZP-007n59-30;
 Thu, 25 Jan 2024 13:10:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-pwm@vger.kernel.org
Subject: [PATCH v5 104/111] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
Date: Thu, 25 Jan 2024 13:10:06 +0100
Message-ID: <0316aaec9dbfc0c73788bcd3ee532ae7ecadb180.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=jfd7dhSo9SXhSxJXmsfOIedemR7rT5AGTOA/yBz+qOs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk+0Hn3I7mIKyDHt1G6tNUNJDqYsr2W8GJlsf
 qDxctNCWjCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPtAAKCRCPgPtYfRL+
 TqkhB/9PMw0gY/Sd9TxtH6zKb7tvvsAYnB/chUPlIXZhvx6CRKDcnOLjI5/NUuIjTrA/ZC+w4kc
 wg4C5TYcHZYkm6+Nr76mXRxD4qsH5SMh+83hDRAMIC/2XHIVK+fmXzh32qUZDYcuRsUCy2V9xFS
 0sTUm9LAFLKWXfBsLHOwQoOphkkBcZ5gLe+UUHN9edyWhPOqRzgkKVRd3nLqChwm/lXut7GgbJQ
 f6UCOOjMcvdZTbt0jMXAJO7dmJsx0WbwQpdCpePzBcMonvS8Js/iR20XWPFbXlJXzYxOwyIJTij
 PKB7H0ccVUElvO8Rdh/TG5JZUJQ/4hzAiyinQiQp8nbtoWIq
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

This prepares the pwm driver of the ti-sn65dsi86 to further changes of
the pwm core outlined in the commit introducing devm_pwmchip_alloc().
There is no intended semantical change and the driver should behave as
before.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f1fffbef3324..7fbc307cc025 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -197,7 +197,7 @@ struct ti_sn65dsi86 {
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
 #endif
 #if defined(CONFIG_PWM)
-	struct pwm_chip			pchip;
+	struct pwm_chip			*pchip;
 	bool				pwm_enabled;
 	atomic_t			pwm_pin_busy;
 #endif
@@ -1374,7 +1374,7 @@ static void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata)
 
 static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
 {
-	return container_of(chip, struct ti_sn65dsi86, pchip);
+	return pwmchip_get_drvdata(chip);
 }
 
 static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
@@ -1585,23 +1585,28 @@ static const struct pwm_ops ti_sn_pwm_ops = {
 static int ti_sn_pwm_probe(struct auxiliary_device *adev,
 			   const struct auxiliary_device_id *id)
 {
+	struct pwm_chip *chip;
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
 
-	pdata->pchip.dev = &adev->dev;
-	pdata->pchip.ops = &ti_sn_pwm_ops;
-	pdata->pchip.npwm = 1;
-	pdata->pchip.of_xlate = of_pwm_single_xlate;
+	pdata->pchip = chip = devm_pwmchip_alloc(&adev->dev, 1, 0);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	pwmchip_set_drvdata(chip, pdata);
+
+	chip->ops = &ti_sn_pwm_ops;
+	chip->of_xlate = of_pwm_single_xlate;
 
 	devm_pm_runtime_enable(&adev->dev);
 
-	return pwmchip_add(&pdata->pchip);
+	return pwmchip_add(chip);
 }
 
 static void ti_sn_pwm_remove(struct auxiliary_device *adev)
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
 
-	pwmchip_remove(&pdata->pchip);
+	pwmchip_remove(pdata->pchip);
 
 	if (pdata->pwm_enabled)
 		pm_runtime_put_sync(&adev->dev);
-- 
2.43.0

