Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818CB749676
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 09:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8864F10E44E;
	Thu,  6 Jul 2023 07:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 78882 seconds by postgrey-1.36 at gabe;
 Wed, 05 Jul 2023 14:25:00 UTC
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171B510E378
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 14:24:59 +0000 (UTC)
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
 by unicorn.mansr.com (Postfix) with ESMTPS id 162AE15360;
 Wed,  5 Jul 2023 15:24:57 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id BFC15219FC1; Wed,  5 Jul 2023 15:24:56 +0100 (BST)
From: Mans Rullgard <mans@mansr.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH] backlight: led_bl: fix initial power state
Date: Wed,  5 Jul 2023 15:24:14 +0100
Message-ID: <20230705142447.15546-1-mans@mansr.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Jul 2023 07:37:10 +0000
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
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The condition for the initial power state based on the default
brightness value is reversed.  Fix it.

Furthermore, use the actual state of the LEDs rather than the default
brightness specified in the devicetree as the latter should not cause
the backlight to be automatically turned on.

If the backlight device is not linked to any display, set the initial
power to on unconditionally.

Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
Signed-off-by: Mans Rullgard <mans@mansr.com>
---
Changes in v3:
- Add comment

Changes in v2:
- Use the reported LED state to set initial power state
- Always power on if no phandle in DT
---
 drivers/video/backlight/led_bl.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index 3259292fda76..c94843c00a30 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -176,6 +176,7 @@ static int led_bl_probe(struct platform_device *pdev)
 {
 	struct backlight_properties props;
 	struct led_bl_data *priv;
+	int init_brightness;
 	int ret, i;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -190,6 +191,8 @@ static int led_bl_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	init_brightness = priv->default_brightness;
+
 	ret = led_bl_parse_levels(&pdev->dev, priv);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to parse DT data\n");
@@ -200,8 +203,11 @@ static int led_bl_probe(struct platform_device *pdev)
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = priv->max_brightness;
 	props.brightness = priv->default_brightness;
-	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
-		      FB_BLANK_UNBLANK;
+
+	/* Set power on if LEDs already on or not linked to a display. */
+	props.power = (init_brightness || !pdev->dev.of_node->phandle) ?
+		FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
+
 	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
 			&pdev->dev, priv, &led_bl_ops, &props);
 	if (IS_ERR(priv->bl_dev)) {
-- 
2.41.0

