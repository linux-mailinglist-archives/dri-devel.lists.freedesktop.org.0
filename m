Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12C47F65CB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AB510E002;
	Thu, 23 Nov 2023 17:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC79910E002
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:55:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Duf-0004l5-I1; Thu, 23 Nov 2023 18:54:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Dud-00B5eK-6t; Thu, 23 Nov 2023 18:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Duc-006rAy-TY; Thu, 23 Nov 2023 18:54:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify using
 pm_runtime_resume_and_get()
Date: Thu, 23 Nov 2023 18:54:27 +0100
Message-ID: <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=M2F3whZ53fZeV1tkPUxtfCf5sLaynpDgHuGMcwfXfV8=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhtT4iZfS5jWmKrBqzhDl36/yRyfs83sjcff3PvNezlt/f
 2Nj0RPBTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAm8jKQ/Z9hkIYtR8xy29j9
 B5k/M+eJMk2tPb/E0y1k8lLGF1JNmrOa6/YmX93gP23+Pdd+M6Xu7KeJkvJM2ba60VurDOzU21v
 yZJQTla8azi6xvMLHY+nJLV/Csb1zRph+f+0jodmnlW4FP+WoTKqfqFgyU7pfTea2+a0y202d9z
 bUSN+/2rzx21I71ZWxKnFqYgJ2AQ5lKftjfJTiT3BuK6rl75GMMZj+Mq7tblK+deHCh/fU/m3Nb
 yg+N9G1JJTt9NGc5V+W1Zvv0hCNZ5TbW2LSWbCi/t9kJdd8f6ECiZNp1rmf1lcsnvjrS374gp+3
 sj+yWZ4vymSXT35Tf0FP8cG7jPdi194xb2V64WvvYAMA
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

pm_runtime_resume_and_get() already drops the runtime PM usage counter
in the error case. So a call to pm_runtime_put_sync() can be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c45c07840f64..5b8e1dfc458d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1413,11 +1413,9 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int ret;
 
 	if (!pdata->pwm_enabled) {
-		ret = pm_runtime_get_sync(pdata->dev);
-		if (ret < 0) {
-			pm_runtime_put_sync(pdata->dev);
+		ret = pm_runtime_resume_and_get(pdata->dev);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	if (state->enabled) {
-- 
2.42.0

