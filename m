Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1FA8B01D0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1506B113846;
	Wed, 24 Apr 2024 06:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QBJFB4ee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E83113846
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:34:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44B6561794;
 Wed, 24 Apr 2024 06:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F01C113CE;
 Wed, 24 Apr 2024 06:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940475;
 bh=I0CDR+UQx8pIKK08mZpMwJPZrKmFX4+NzKjWxZIyAxI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QBJFB4eeLiwx6Tk0ZFRvPcqclvVhyVA2EwZfNQSyXujJ8QtJD/n475SuWDEASe9bD
 XMZ5Z2vChp5bVOhPvB7GLWWJ7zTw1Z5UnBt2sZIcPcoCNOfl+x6IFU8H2Fih5BDX6u
 dVfpLJ2RU+9VGQy1Xr+yZf3o1NuXDCXfdNLb+/IcVc8cPuBrSMHktl+WluY+dsw7RA
 cJKAndzVhW264t+z9juKA0UiEZcXOaMoPw6A0tvpn+Q2o7ahErjYbkcm1k39goL65s
 SGmt53gd5Ss4UQVLWL5skfc5PuZhayItc58+I/lAkaCHLsBGBRcZ/KP7Bv7qKBFVXw
 v97NNQBQCHYcw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:27 +0200
Subject: [PATCH v2 01/19] backlight: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-1-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491; i=krzk@kernel.org;
 h=from:subject:message-id; bh=I0CDR+UQx8pIKK08mZpMwJPZrKmFX4+NzKjWxZIyAxI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfeToXpF7L2yVN9k2sqZfozve2s4THf0Vo2R
 epNlzurbF+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin3gAKCRDBN2bmhouD
 19p1D/99+NJcxUjp5prNBS/1AhHZ7jpcTNsKZmpAaP58DryULCGl5CfY7sVAD0rs3R/AnzX/+p4
 K64AwvGNoyqke7ajX+ZHzin8hbv8N+9C/iil1xQCl0VDFMYe8M/rplcsBp2fYe/Yb47R/8CZkmg
 WJ3+jNA3rifj9dWGXV4pMUfLEgW1gpoPNmCUhIBa3pBacJUetd4RuBgIg4jWcUT1OugVlz/H2jM
 TKgrDRbS8HsrA8s8bU423MeunN2T9+vgeOVbUtfZMZ430Fw66qm0wRQUVdyxdCWe7JDEiGA5CfL
 3lX7PProDKUMmvFLsj1kVeGi0HQEznRVIck2RrTwx+Ff8QKPXk8KKOTBHiKjrKmVErFuLg/EZzg
 bupLP1D7A4TTmrXZfHgPmlx9W1614sglt/194qIPrLe76HeSX4o4r7xEYdgOre7Y90Y+wfGyG6M
 iheqT7BDxETuYD4Y5MRcCUnTWX4fDupaDhJyruDQl4OVA6CWi6oKMAMpMf17NpHOoVpx+RM58n/
 7NLfOwkSHP2ORpqsofr6EWyxnv+/2YnS0Qj94hh136eZLVOCNA8E6HMiS8AcoYCDwWLPBpwd9CH
 3m9CRX9Am9eJa2D9BquLDAGS72/UAnrXBuVoMZNj9CEToM9aDym6N7DX0EW6LgbTRWl9KPYju+2
 KYXG6toKDyMZMkA==
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

'struct lcd_ops' passed in lcd_device_register() is not modified by core
backlight code, so it can be made const for code safety.  This allows
drivers to also define the structure as const.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/video/backlight/lcd.c | 4 ++--
 include/linux/lcd.h           | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index ba4771cbd781..ceec90ca758b 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -191,7 +191,7 @@ static const struct class lcd_class = {
  * or a pointer to the newly allocated device.
  */
 struct lcd_device *lcd_device_register(const char *name, struct device *parent,
-		void *devdata, struct lcd_ops *ops)
+		void *devdata, const struct lcd_ops *ops)
 {
 	struct lcd_device *new_ld;
 	int rc;
@@ -279,7 +279,7 @@ static int devm_lcd_device_match(struct device *dev, void *res, void *data)
  */
 struct lcd_device *devm_lcd_device_register(struct device *dev,
 		const char *name, struct device *parent,
-		void *devdata, struct lcd_ops *ops)
+		void *devdata, const struct lcd_ops *ops)
 {
 	struct lcd_device **ptr, *lcd;
 
diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index 238fb1dfed98..68703a51dc53 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -61,7 +61,7 @@ struct lcd_device {
 	   points to something in the body of that driver, it is also invalid. */
 	struct mutex ops_lock;
 	/* If this is NULL, the backing module is unloaded */
-	struct lcd_ops *ops;
+	const struct lcd_ops *ops;
 	/* Serialise access to set_power method */
 	struct mutex update_lock;
 	/* The framebuffer notifier block */
@@ -102,10 +102,10 @@ static inline void lcd_set_power(struct lcd_device *ld, int power)
 }
 
 extern struct lcd_device *lcd_device_register(const char *name,
-	struct device *parent, void *devdata, struct lcd_ops *ops);
+	struct device *parent, void *devdata, const struct lcd_ops *ops);
 extern struct lcd_device *devm_lcd_device_register(struct device *dev,
 	const char *name, struct device *parent,
-	void *devdata, struct lcd_ops *ops);
+	void *devdata, const struct lcd_ops *ops);
 extern void lcd_device_unregister(struct lcd_device *ld);
 extern void devm_lcd_device_unregister(struct device *dev,
 	struct lcd_device *ld);

-- 
2.43.0

