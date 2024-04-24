Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726608B01F4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8394011386B;
	Wed, 24 Apr 2024 06:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DZ6xIdW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED2B113858
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:36:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9015E60BA2;
 Wed, 24 Apr 2024 06:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2B8C113CE;
 Wed, 24 Apr 2024 06:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940563;
 bh=vOCgFXE0yZtrMeCN/DmcJGN2jbuTcHFP/HtJfH739cc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DZ6xIdW3H4qldDXElBNvIpjA80XivxCnNEwvb1nqQ1Lmsm3r5l9t6QI1lEY+4jkg9
 zFm8bpiz9k9EnztfU51sUq0iqS3lp4XmKDskoa/TuTO4qQgj4+hrQEjJxGeGMwaR+t
 H+Tg9Hzmu2CaxMJGl+QL7kWUZVN057SFR4kxIV4Eet0YeWDPQxGaliSyDwLL7KPz20
 JqpzSQ0x4YkKWLrSvm/ddc/jZN/t4dD9zn1dZSG0owYi1eqmKtCJ/PHMmifjxYYHgc
 mwkiejg82pco13UrjhTiv/wcRvfcMOJmZ3TN4Bb2Re09iKiCVGITp7Qx4zZcDXj1GY
 asroXTakL3Xgw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:41 +0200
Subject: [PATCH v2 15/19] HID: picoLCD: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-15-1aaa82b07bc6@kernel.org>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=krzk@kernel.org;
 h=from:subject:message-id; bh=vOCgFXE0yZtrMeCN/DmcJGN2jbuTcHFP/HtJfH739cc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfq4M1IDJPlPFMkIXlVPIEqNDgxTDlWKP8ND
 FrU8RWlF9aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin6gAKCRDBN2bmhouD
 1/N4D/0WVW8jUjibDXsx8n2ptJVAi3ksr8AEwnSVXriRdjkWTmuFQgyDS+D6O4h0tbeNHlR6onO
 KGMgPoa8V6ptLHP9BU0icb2AgC4D9Kh8q+OkjfvfQzaAudoiyEVHG9ztnyq5qxl+AhOBWvmi8wT
 vmMYcToLDq/W+QsSe9mlRXAJrQTlF6V8kWo6yUHh80ANHEJH6o8Ret/wz04WXFJz3VlVCGPSwaV
 iKgGVP3HOzosrJU5tDq0ucAUbHnykIh6BZhYGsUH+Asr+S4i+v2VlaD2FPkJIWTmEJgIvBBfyet
 XklLq6y8iLRl4GfOkU78HTFkSxTftPz1/5e4unxcMYP53jfWgoHYwWNoLWxhY4UtSjpNMne7/za
 8Z+0+CkqHAbylhE8WZNg9DGsXTrI7V3G35JjLVETvCEkDBvPrNopn79LKKRzO2Ma38px+20z8ri
 u3Vbgsxn3OpX62sNaIComZ9U7JnigtjrRz4MjR1laKEbHRpk2THeV6W+1ec1M9OHWTPfHShNBuM
 7wS8NyXRAHov5RvAE9OzuRwMMMLk7hPefhtdDBK7goKDuQAIzumwLRBOP7tyaf1MkHmnTUfwKEC
 oo3dP4Jlf+M0js9uJHJINT5J4cwD/qdhqlnJNVEeENiXW9PUl9/rhQgMNRcEKxP1ikkdksx9TSO
 VH0W6ULF+Aee9Yw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

'struct lcd_ops' is not modified by core backlight code, so it can be
made const for increased code safety.

Reviewed-by: Bruno Prémont <bonbons@linux-vserver.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Depends on the first patch in the series.
---
 drivers/hid/hid-picolcd_lcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-picolcd_lcd.c b/drivers/hid/hid-picolcd_lcd.c
index 0c4b76de8ae5..061a33ba7b1d 100644
--- a/drivers/hid/hid-picolcd_lcd.c
+++ b/drivers/hid/hid-picolcd_lcd.c
@@ -46,7 +46,7 @@ static int picolcd_check_lcd_fb(struct lcd_device *ldev, struct fb_info *fb)
 	return fb && fb == picolcd_fbinfo((struct picolcd_data *)lcd_get_data(ldev));
 }
 
-static struct lcd_ops picolcd_lcdops = {
+static const struct lcd_ops picolcd_lcdops = {
 	.get_contrast   = picolcd_get_contrast,
 	.set_contrast   = picolcd_set_contrast,
 	.check_fb       = picolcd_check_lcd_fb,

-- 
2.43.0

