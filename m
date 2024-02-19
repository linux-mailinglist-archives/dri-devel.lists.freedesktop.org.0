Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041D085AFB0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 00:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEB910E095;
	Mon, 19 Feb 2024 23:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="vGsHYTAa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A89E10E08D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 23:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
 t=1708384300; bh=tgSDAwlrVTzUIqiZyqw7iiUTatrOj4HaquGU5a8EzIU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=vGsHYTAaubBzb2bYsXKkzfudGfH7qgOPou2A89bhFI7dVoNZtUuqZKndldkTDoges
 m4nnpyNEXOtzzLO2I2n/E4w505BcJhS81oI3ojXv3bqGQRX+7bAU0fVpqfiIyixtEZ
 IudaTj5Wajeq1MYkLlTuMhbRd3/PbV7BGms8PvcU=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Tue, 20 Feb 2024 00:11:21 +0100
Subject: [PATCH 3/4] backlight: lm3630a: Use backlight_get_brightness
 helper in update_status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-lm3630a-fixups-v1-3-9ca62f7e4a33@z3ntu.xyz>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
In-Reply-To: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "G.Shark Jeong" <gshark.jeong@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maximilian Weigand <mweigand@mweigand.net>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2663; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=tgSDAwlrVTzUIqiZyqw7iiUTatrOj4HaquGU5a8EzIU=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBl0+AoTixhJbLZliq9WxIhxRszJgCAbf5dK6Uaz
 3FQbTd6OhKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZdPgKAAKCRBy2EO4nU3X
 Vul3D/40hfXK/hCXfw+Oi4sNLlrVTWbF3wGBLJv0EYE+UIYALtzpvViG6lquEEohZzR8nJOGd5m
 SOCn4lYVrh69CX4YGafx/Z035y23A3f7lOGlhkCZHxCmC7TkCz7jUZDIESfH2TGyxYG4im6sVnn
 71RPTiAzOyD89Qv8Tr0TKWPgA/K8bbf+U2BtESebvJpkVMcWuMHtSiE67fqAacK7iheq+glGzjc
 DHwBzbL7/3YFJKZL9j18yXpSoKNZJZEFTtvWKPzCv75tB9Hd6h3Q7zbkN6cvOPsO9PWdjkFa/NI
 QCfymKnd9v1CPuENWvC5ADh+6z+j3N6l/moHLDtMLu6t1HTbDLYz9nVi1EplW/ECfW5LRKMM3Aw
 KvoArTl1OzAZ7kVLFAR7U9kCRYsrRUD28dcVJ9dK8Rm1ce4svScTKNQA7VtlfpogEzQlrbcB/BY
 09cpxfGmPN8exdgSWL8cOhY89TSZqQgHVN+YzhE+COLgm0LExv7pp4wzTr4DAejtjeQxjIwfcSy
 +2UJrKAhEIz3mFyQw9t7aj8dlmiNey9T0lemmUXe+PJpnwHYcmyndCRiiYw8j0FE08de3ECwrBL
 837t9lFnkz1VbucT4TL+uSBfcB4qjUqDAEkb2w1uUsOSrSSJIHubbZsL/JjrCaK7jST+ZPV4ICW
 fv/vS9d1qz9CyDg==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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

As per documentation "drivers are expected to use this function in their
update_status() operation to get the brightness value.".

With this we can also drop the manual backlight_is_blank() handling
since backlight_get_brightness() is already handling this correctly.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/video/backlight/lm3630a_bl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 26ff4178cc16..e6c0916ec88b 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -189,10 +189,11 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
 	int ret;
 	struct lm3630a_chip *pchip = bl_get_data(bl);
 	enum lm3630a_pwm_ctrl pwm_ctrl = pchip->pdata->pwm_ctrl;
+	int brightness = backlight_get_brightness(bl);
 
 	/* pwm control */
 	if ((pwm_ctrl & LM3630A_PWM_BANK_A) != 0)
-		return lm3630a_pwm_ctrl(pchip, bl->props.brightness,
+		return lm3630a_pwm_ctrl(pchip, brightness,
 					bl->props.max_brightness);
 
 	/* disable sleep */
@@ -201,9 +202,9 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
 		goto out_i2c_err;
 	usleep_range(1000, 2000);
 	/* minimum brightness is 0x04 */
-	ret = lm3630a_write(pchip, REG_BRT_A, bl->props.brightness);
+	ret = lm3630a_write(pchip, REG_BRT_A, brightness);
 
-	if (backlight_is_blank(bl) || (backlight_get_brightness(bl) < 0x4))
+	if (brightness < 0x4)
 		/* turn the string off  */
 		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDA_ENABLE, 0);
 	else
@@ -263,10 +264,11 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
 	int ret;
 	struct lm3630a_chip *pchip = bl_get_data(bl);
 	enum lm3630a_pwm_ctrl pwm_ctrl = pchip->pdata->pwm_ctrl;
+	int brightness = backlight_get_brightness(bl);
 
 	/* pwm control */
 	if ((pwm_ctrl & LM3630A_PWM_BANK_B) != 0)
-		return lm3630a_pwm_ctrl(pchip, bl->props.brightness,
+		return lm3630a_pwm_ctrl(pchip, brightness,
 					bl->props.max_brightness);
 
 	/* disable sleep */
@@ -275,9 +277,9 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
 		goto out_i2c_err;
 	usleep_range(1000, 2000);
 	/* minimum brightness is 0x04 */
-	ret = lm3630a_write(pchip, REG_BRT_B, bl->props.brightness);
+	ret = lm3630a_write(pchip, REG_BRT_B, brightness);
 
-	if (backlight_is_blank(bl) || (backlight_get_brightness(bl) < 0x4))
+	if (brightness < 0x4)
 		/* turn the string off  */
 		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDB_ENABLE, 0);
 	else

-- 
2.43.2

