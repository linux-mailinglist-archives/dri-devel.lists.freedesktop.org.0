Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA80F70E0BE
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5229210E457;
	Tue, 23 May 2023 15:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49EB10E457
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 15:40:47 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:b0ac:7afd:272:4cff])
 by laurent.telenet-ops.be with bizsmtp
 id 0Fgi2A00U0Jkz7G01Fgi8n; Tue, 23 May 2023 17:40:46 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q1U7g-002t5B-8n;
 Tue, 23 May 2023 17:40:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q1U7u-00CkiL-KO;
 Tue, 23 May 2023 17:40:42 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] backlight: pwm_bl: Remove unneeded checks for valid GPIOs
Date: Tue, 23 May 2023 17:40:41 +0200
Message-Id: <00be8237e0e2bc9b179177b5490f175d657261a2.1684856337.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All of gpiod_set_value_cansleep() and gpiod_direction_output() handle
NULL GPIO pointers just fine, so there is no need to check for that in
the caller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/video/backlight/pwm_bl.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index fce412234d10399a..a51fbab96368053b 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -54,8 +54,7 @@ static void pwm_backlight_power_on(struct pwm_bl_data *pb)
 	if (pb->post_pwm_on_delay)
 		msleep(pb->post_pwm_on_delay);
 
-	if (pb->enable_gpio)
-		gpiod_set_value_cansleep(pb->enable_gpio, 1);
+	gpiod_set_value_cansleep(pb->enable_gpio, 1);
 
 	pb->enabled = true;
 }
@@ -65,8 +64,7 @@ static void pwm_backlight_power_off(struct pwm_bl_data *pb)
 	if (!pb->enabled)
 		return;
 
-	if (pb->enable_gpio)
-		gpiod_set_value_cansleep(pb->enable_gpio, 0);
+	gpiod_set_value_cansleep(pb->enable_gpio, 0);
 
 	if (pb->pwm_off_delay)
 		msleep(pb->pwm_off_delay);
@@ -429,8 +427,7 @@ static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
 	 * Synchronize the enable_gpio with the observed state of the
 	 * hardware.
 	 */
-	if (pb->enable_gpio)
-		gpiod_direction_output(pb->enable_gpio, active);
+	gpiod_direction_output(pb->enable_gpio, active);
 
 	/*
 	 * Do not change pb->enabled here! pb->enabled essentially
-- 
2.34.1

