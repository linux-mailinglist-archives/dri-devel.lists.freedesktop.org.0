Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9792D5532
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178566E2C7;
	Thu, 10 Dec 2020 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45086E2C7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 08:19:05 +0000 (UTC)
From: Shawn Guo <shawnguo@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: rename GPIO register bits
Date: Thu, 10 Dec 2020 16:18:53 +0800
Message-Id: <20201210081853.17060-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shawn Guo <shawn.guo@linaro.org>

It renames GPIO register bits to drop 'SN_' prefix, so that they are
consistent to other definitions - prefixing register name with 'SN_' but
not for bit fields.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f27306c51e4d..8eac9d77eba1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -63,13 +63,13 @@
 #define SN_HPD_DISABLE_REG			0x5C
 #define  HPD_DISABLE				BIT(0)
 #define SN_GPIO_IO_REG				0x5E
-#define  SN_GPIO_INPUT_SHIFT			4
-#define  SN_GPIO_OUTPUT_SHIFT			0
+#define  GPIO_INPUT_SHIFT			4
+#define  GPIO_OUTPUT_SHIFT			0
 #define SN_GPIO_CTRL_REG			0x5F
-#define  SN_GPIO_MUX_INPUT			0
-#define  SN_GPIO_MUX_OUTPUT			1
-#define  SN_GPIO_MUX_SPECIAL			2
-#define  SN_GPIO_MUX_MASK			0x3
+#define  GPIO_MUX_INPUT				0
+#define  GPIO_MUX_OUTPUT			1
+#define  GPIO_MUX_SPECIAL			2
+#define  GPIO_MUX_MASK				0x3
 #define SN_AUX_WDATA_REG(x)			(0x64 + (x))
 #define SN_AUX_ADDR_19_16_REG			0x74
 #define SN_AUX_ADDR_15_8_REG			0x75
@@ -1035,7 +1035,7 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	return !!(val & BIT(SN_GPIO_INPUT_SHIFT + offset));
+	return !!(val & BIT(GPIO_INPUT_SHIFT + offset));
 }
 
 static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
@@ -1051,8 +1051,8 @@ static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 	val &= 1;
 	ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
-				 BIT(SN_GPIO_OUTPUT_SHIFT + offset),
-				 val << (SN_GPIO_OUTPUT_SHIFT + offset));
+				 BIT(GPIO_OUTPUT_SHIFT + offset),
+				 val << (GPIO_OUTPUT_SHIFT + offset));
 	if (ret)
 		dev_warn(pdata->dev,
 			 "Failed to set bridge GPIO %u: %d\n", offset, ret);
@@ -1069,8 +1069,8 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
 		return 0;
 
 	ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
-				 SN_GPIO_MUX_MASK << shift,
-				 SN_GPIO_MUX_INPUT << shift);
+				 GPIO_MUX_MASK << shift,
+				 GPIO_MUX_INPUT << shift);
 	if (ret) {
 		set_bit(offset, pdata->gchip_output);
 		return ret;
@@ -1103,8 +1103,8 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 
 	/* Set direction */
 	ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
-				 SN_GPIO_MUX_MASK << shift,
-				 SN_GPIO_MUX_OUTPUT << shift);
+				 GPIO_MUX_MASK << shift,
+				 GPIO_MUX_OUTPUT << shift);
 	if (ret) {
 		clear_bit(offset, pdata->gchip_output);
 		pm_runtime_put(pdata->dev);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
