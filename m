Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FA5A18E2D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 10:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4854010E214;
	Wed, 22 Jan 2025 09:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Hdumu3wj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A710E214
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 09:19:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 478B160008;
 Wed, 22 Jan 2025 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737537562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ONL1/Ez3NsQeRw6Wk3Nm8VxztLs0ZCkJAWZTU0jWOC0=;
 b=Hdumu3wjNxjptWYwI28XoHzQVzDrcxsuMOx2d/F7frDMGU4rKmmVXkECKgxjANby0u38a+
 Bgg2nkJiCdEPDoWG8FIaFWq1bLsAoxl5E7iobmF9kWdQNGh7esj2gKL2fFScljcGCoN1Sy
 WqhPnIP6tEV1jIUhYeKf9Uvn+tK0P25OF+ou5rNZY+EMcKD8tmW8lRuTFmOxg88emlaP6+
 fbJXSbGxxmzxvDSvrKLULMG0XA33CKDvOnFZtfFYViMdoizZlXukRfW0WpZQ1hKTbpPfcl
 8HfJ4Ft/V8SBuAXHr/PR7G6PLSrJj5oPtqd0fRvOdOet8ho4GX9eTtygfbhvhw==
From: Herve Codina <herve.codina@bootlin.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, stable@vger.kernel.org
Subject: [PATCH] backlight: led_bl: Hold led_access lock when calling
 led_sysfs_disable()
Date: Wed, 22 Jan 2025 10:19:14 +0100
Message-ID: <20250122091914.309533-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

Lockdep detects the following issue on led-backlight removal:
  [  142.315935] ------------[ cut here ]------------
  [  142.315954] WARNING: CPU: 2 PID: 292 at drivers/leds/led-core.c:455 led_sysfs_enable+0x54/0x80
  ...
  [  142.500725] Call trace:
  [  142.503176]  led_sysfs_enable+0x54/0x80 (P)
  [  142.507370]  led_bl_remove+0x80/0xa8 [led_bl]
  [  142.511742]  platform_remove+0x30/0x58
  [  142.515501]  device_remove+0x54/0x90
  ...

Indeed, led_sysfs_enable() has to be called with the led_access
lock held.

Hold the lock when calling led_sysfs_disable().

Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/video/backlight/led_bl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index ae34d1ecbfbe..d2db157b2c29 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -229,8 +229,11 @@ static void led_bl_remove(struct platform_device *pdev)
 	backlight_device_unregister(bl);
 
 	led_bl_power_off(priv);
-	for (i = 0; i < priv->nb_leds; i++)
+	for (i = 0; i < priv->nb_leds; i++) {
+		mutex_lock(&priv->leds[i]->led_access);
 		led_sysfs_enable(priv->leds[i]);
+		mutex_unlock(&priv->leds[i]->led_access);
+	}
 }
 
 static const struct of_device_id led_bl_of_match[] = {
-- 
2.47.1

