Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DB6631CF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 21:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E112810E50B;
	Mon,  9 Jan 2023 20:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCAD10E50B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 20:48:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pEz3y-0000Nu-Kz; Mon, 09 Jan 2023 21:48:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pEz3x-004vYW-WB; Mon, 09 Jan 2023 21:48:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pEz3w-00BVa9-Tf; Mon, 09 Jan 2023 21:48:08 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH 2/2] backlight: pwm_bl: Don't disable the PWM to disable the
 backlight
Date: Mon,  9 Jan 2023 21:47:58 +0100
Message-Id: <20230109204758.610400-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109204758.610400-1-u.kleine-koenig@pengutronix.de>
References: <20230109204758.610400-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=K182eXs0FIJkxQAaRAKrrXsKyv+L1JtRVd73xZhidGE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjvH17hfZUIb1uV/8b1gFdT4Y1akwDIWdJGLGRG7SU
 FFufiY2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY7x9ewAKCRDB/BR4rcrsCcJLB/
 4nj26IEAvX2aZRvaG1eNO7r9knhkFvIFMDbgs53nU1is2FVVI2Uo+tRqgE8sX0EhMhWEycVAAYli7u
 /a5LKL/oDPaX4W9w8WLxW/z4EVtjYPf0lcXTaMiKUif3Cuzi1bnYCJUXU0bogsS4cMSnN4Olv2chWP
 2EUxAAfNslEcznjR0kioW0T19AZM1IqukxtRD5QA9JmEM6Xgjre58kzJEykC/U0rqo46F86S2GTNDU
 KoEnY1BgEKBW/pidmr/MhcNajx+HdLZ4JBcHxGaj9zMAK9970K3st/SKmYOsyBpefelEycRdeCsX0I
 KFAy+CjptU7QDJp5gBLgsMMCvHNClU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most but not all PWMs drive the PWM pin to its inactive state when
disabled. Rely on the lowlevel PWM implementation to implement
duty_cycle = 0 in an energy efficient way and don't disable the PWM.

This fixes backlight disabling e.g. on i.MX6 when an inverted PWM is
used.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/backlight/pwm_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 0509fecd5715..7bdc5d570a12 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -109,7 +109,7 @@ static int pwm_backlight_update_status(struct backlight_device *bl)
 		pwm_backlight_power_off(pb);
 
 		pwm_get_state(pb->pwm, &state);
-		state.enabled = false;
+		state.enabled = true;
 		state.duty_cycle = 0;
 		pwm_apply_state(pb->pwm, &state);
 	}
-- 
2.39.0

