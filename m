Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D745A8A43D4
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7131120D3;
	Sun, 14 Apr 2024 16:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kKfVuIO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A747D1120D2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:36:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E79E0CE098D;
 Sun, 14 Apr 2024 16:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E44C2BD10;
 Sun, 14 Apr 2024 16:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112589;
 bh=z5qAb/aZb4HJjU1nY0q3WFWS8153iumjRfnCENwhTpU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kKfVuIO1xTF9DBQQsqJ+6JFm4fxOw4LuXEUKEKd6tnfwwpnuRomxK+B9pljOtcD4v
 YouAYjf7moCi0CFFtrhb3alKwZwkbtZuG7Wx6wqy0TPxIgJmH/nWApc+HNtUr/L7Dm
 DGfuIEFxJy6TZHNc3KQ7WSgt7dC45P3ICGVdbeyeUhtSZhchR1cTxPHD/iZaRN4TqG
 2UBEyPTWQJzYMAIZ5Gx+ZsPeIo4WdMs6AdoAGA/OjqUWUSnpH++t24Q8QjqL2jy2eI
 ftR1iiKx0JKuZMxHz9rIFaHdHCwq1CklG3WwNnCn3sacQ/3MtLyVf4GvyWcNg1KbjT
 qvx4Kayf1OkOQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:35:59 +0200
Subject: [PATCH 01/18] backlight: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-1-9b37fcbf546a@kernel.org>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2432; i=krzk@kernel.org;
 h=from:subject:message-id; bh=z5qAb/aZb4HJjU1nY0q3WFWS8153iumjRfnCENwhTpU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAXz9nDuruVnQoZBQ+0fvh2Ilb98JS2983g+e
 dDhNnweDlKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF8wAKCRDBN2bmhouD
 1zUHD/9QO+vhmEA35mCEGjhMycJkhHR2vbsqoQiS9B393cyyor52W46seZkdDRv18gL3cbFaDq2
 GCW5CEXQE9OJa0LEsHI7ykKwU3SqAfxAxKCN0YhqB5slN79oYKV6KRlmhG8nWYjYcXFV1oPHiI9
 BJhILiYxFy6vem5nw57qJrey+rFLPDTFHkHEQkOzxwzd1unlOXoRcfoytgRIKAWu9rVk41JsCtJ
 7KxGDdzDvu58gU1auOAVNqsi8YWioXvHM19X6iz6H01pcLhyLh2WGqX+yj57jExX6ZD++m5WiTM
 2hekdsNXZFjUdKYwuCRBzFtXUNE9KTFrwBThUGXnqzOm5FGTRRGWm6FwdE11Me9AKw8BMP2/o8h
 YFIYnVZfsXpKKRBKHJQcxnNNMitFUTMCTPOo09tw7DR2AyD2Fe4uOeXwydRKcy7gq2F+elUUk9g
 OJzlWh6xG3J3JudxnCnlhoUm1KJuaC2EtnDvNAwrexCvb6vM30L57uJJ+FkG7VVQqh6ateR6Imb
 +ZDLnIWcXbCvG2yzKPCJaxult4EwJcoaGxtqter5TE2qQwH9fzTnL2ZvT2Ys7S5WpH2jxzyzGi9
 mJhk+x5ZEBYBSTkV8K+fcR892HowQF0f4HBC+KM9bRlaDZaymgrH6pVnmKj5BDTzXV+tvOY4wYD
 7R7nFE7ZkRksu7g==
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
2.34.1

