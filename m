Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A466747824
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 20:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A017610E312;
	Tue,  4 Jul 2023 18:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicorn.mansr.com (unicorn.mansr.com [IPv6:2001:8b0:ca0d:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223BB10E18F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 14:08:04 +0000 (UTC)
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
 by unicorn.mansr.com (Postfix) with ESMTPS id 6C3CF15360;
 Tue,  4 Jul 2023 15:08:01 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id 253D3219FC1; Tue,  4 Jul 2023 15:08:01 +0100 (BST)
From: Mans Rullgard <mans@mansr.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH] backlight: led_bl: fix initial power state
Date: Tue,  4 Jul 2023 15:07:50 +0100
Message-ID: <20230704140750.25799-1-mans@mansr.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 04 Jul 2023 18:05:31 +0000
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
Cc: Helge Deller <deller@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The condition for the initial power state based on the default
brightness value is reversed.  Fix it.

Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/video/backlight/led_bl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index 3259292fda76..28e83618a296 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -200,8 +200,8 @@ static int led_bl_probe(struct platform_device *pdev)
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = priv->max_brightness;
 	props.brightness = priv->default_brightness;
-	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
-		      FB_BLANK_UNBLANK;
+	props.power = (priv->default_brightness > 0) ? FB_BLANK_UNBLANK :
+		      FB_BLANK_POWERDOWN;
 	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
 			&pdev->dev, priv, &led_bl_ops, &props);
 	if (IS_ERR(priv->bl_dev)) {
-- 
2.41.0

