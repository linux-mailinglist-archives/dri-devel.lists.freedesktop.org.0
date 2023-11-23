Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927677F65D0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068B410E16C;
	Thu, 23 Nov 2023 17:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCFF10E002
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:55:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Duf-0004l6-I0; Thu, 23 Nov 2023 18:54:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Dud-00B5eN-FA; Thu, 23 Nov 2023 18:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Dud-006rB2-5d; Thu, 23 Nov 2023 18:54:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Change parameters of
 ti_sn65dsi86_{read, write}_u16
Date: Thu, 23 Nov 2023 18:54:28 +0100
Message-ID: <20231123175425.496956-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3216;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=4IaKEJVQvlvALXvwbGHLW3bGwE/qyc/t2oNAws0WTmc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlX5HUrzffS/nID9jwMclUhmU0RvTvLOZ3nw4Xo
 RZosrZEXySJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZV+R1AAKCRCPgPtYfRL+
 TgdlCACqxbd6gMsgjpDvYK5o2Aeh4uH1EjKx8M2It+t4Gi8Z8M4dPFjnqt1yWrqe++1Y9t5a8Fw
 jthFooSztgroKnhs5MPBa0rUD+vOj4JENAMCWsvpkaqWafesmUU9sD9UUIfCHAL4tD6gcrY8aFS
 +grA9qiTayWyeU0vSCmaUHwni5+rrKKc+wZSg0gk1v/rgvqdaLDwPW9JL/tU2EdEHlw5qPfnJVx
 VS7eWp4exLq5FyfVjZmrU7zuXtiH3C2YThdMWcqfPBV6CMN20ZyuLKp0yuv8n5uITTddH35MX4a
 vi+wS6KNxcY0rDgPZ5jYmV3Qp4fkkyIgX3uPBK9qXWwq7/L2
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
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This aligns the function's parameters to regmap_{read,write} and
simplifies the next change that takes pwm driver data out of struct
ti_sn65dsi86.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5b8e1dfc458d..d6e3b1280e38 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -221,13 +221,13 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.max_register = 0xFF,
 };
 
-static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
+static int __maybe_unused ti_sn65dsi86_read_u16(struct regmap *regmap,
 						unsigned int reg, u16 *val)
 {
 	u8 buf[2];
 	int ret;
 
-	ret = regmap_bulk_read(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
+	ret = regmap_bulk_read(regmap, reg, buf, ARRAY_SIZE(buf));
 	if (ret)
 		return ret;
 
@@ -236,12 +236,12 @@ static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
 	return 0;
 }
 
-static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
+static void ti_sn65dsi86_write_u16(struct regmap *regmap,
 				   unsigned int reg, u16 val)
 {
 	u8 buf[2] = { val & 0xff, val >> 8 };
 
-	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
+	regmap_bulk_write(regmap, reg, buf, ARRAY_SIZE(buf));
 }
 
 static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
@@ -968,9 +968,9 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		vsync_polarity = CHA_VSYNC_POLARITY;
 
-	ti_sn65dsi86_write_u16(pdata, SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG,
+	ti_sn65dsi86_write_u16(pdata->regmap, SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG,
 			       mode->hdisplay);
-	ti_sn65dsi86_write_u16(pdata, SN_CHA_VERTICAL_DISPLAY_SIZE_LOW_REG,
+	ti_sn65dsi86_write_u16(pdata->regmap, SN_CHA_VERTICAL_DISPLAY_SIZE_LOW_REG,
 			       mode->vdisplay);
 	regmap_write(pdata->regmap, SN_CHA_HSYNC_PULSE_WIDTH_LOW_REG,
 		     (mode->hsync_end - mode->hsync_start) & 0xFF);
@@ -1509,8 +1509,8 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			goto out;
 		}
 
-		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
-		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
+		ti_sn65dsi86_write_u16(pdata->regmap, SN_BACKLIGHT_SCALE_REG, scale);
+		ti_sn65dsi86_write_u16(pdata->regmap, SN_BACKLIGHT_REG, backlight);
 	}
 
 	pwm_en_inv = FIELD_PREP(SN_PWM_EN_MASK, state->enabled) |
@@ -1544,11 +1544,11 @@ static int ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (ret)
 		return ret;
 
-	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
+	ret = ti_sn65dsi86_read_u16(pdata->regmap, SN_BACKLIGHT_SCALE_REG, &scale);
 	if (ret)
 		return ret;
 
-	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
+	ret = ti_sn65dsi86_read_u16(pdata->regmap, SN_BACKLIGHT_REG, &backlight);
 	if (ret)
 		return ret;
 
-- 
2.42.0

