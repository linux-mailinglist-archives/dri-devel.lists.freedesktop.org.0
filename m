Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2248B01DC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A3D11384D;
	Wed, 24 Apr 2024 06:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O4YRGvdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C48811384D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:35:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 30A92CE139E;
 Wed, 24 Apr 2024 06:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C7EC4AF07;
 Wed, 24 Apr 2024 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940506;
 bh=wU56o6IRk+w/zyCtQAgmAtO7kC/xHPmjWsXJIiMIGjI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=O4YRGvdMrbSSd0h4kc6I4VGBW6GUmq+7POlQDRbMhkDy6tyT3wPAm0U6639BLoDy2
 pc92NlO3y4PZ7V2VYkaf3pbJbW38GzI4nIjxGc+/gml+nmkH3HfGpLjWjyiMHRS4wB
 KTK8o0Fy6OafYkVJFTgmws1G10L324yR4magSj8LZEyOZacFtnuzquLpvl0v/9uwAk
 FDbZ26+k2JbzBhW/08ACSKkkmQawRI+Xyi6hS81DIMNx69ypi5FJf28sjrfPUnLfu4
 wHWLR8LbSlHEFNyOJ6WaeZDeZCHef7srirYe73xrtDArKsUWMnQ7qUbsv+lGOOFbZ8
 NTcXj0VkFfaYQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:32 +0200
Subject: [PATCH v2 06/19] backlight: ili9320: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-6-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; i=krzk@kernel.org;
 h=from:subject:message-id; bh=wU56o6IRk+w/zyCtQAgmAtO7kC/xHPmjWsXJIiMIGjI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfi7SUmzEwFhDA3Gu4Na9Y/v/mgYOlvJtevf
 5MvxP4khJSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin4gAKCRDBN2bmhouD
 11YaD/9DWrDdngpRk03vWD8VsPY9N5ciGuLjx9uJTxNIvhRY+S/6GcCx0xFTCwnd+nuju2cigUJ
 lwo/1w51zNFSMLGcT7b7/n5ojfSSJg9mWHbdK2iKqlMkV4Oj4rjraPeA9rDgq4QaKX8ZUT3elmQ
 NVTTVF/HJuuySHnBmDnIAsEqpj+iKZmRjOpu8UFvFaZdFyf4YHtbCkcXmNktMOyvExnbiBf6dH1
 /1UyXPW+weTiRUbVhDfnxJWl7YgwjhSpZzodh8Tv/PvuSc8EsT4HmEexJMX4jbvIjFCs9t6/5lh
 8nPKK+5lCQBPeucbs+W3hJvy8ihWerEhFY72leWx25436STy0ZWN0wdVEEzTEhLAyV1mxYP6kDg
 NnYyuwEP5YHBxG1FtMR+LM7jpi1bL5k7o56s4YVw4FM5vXtAdL1lVS2YEw1BlldLKnTSs/vbKXp
 pJNYXPhn3nKfE9kf1Bwz0CcsqWFGSRKuMmiJbv5P04iUYPS7navT4z7JC9WbtBTC3zUmuXy1vUT
 d28OG0cF/xrQMIS9c5JBDvdd5I9HoIFopT7/vJBkJZmiiHVKnlKYKtbdaIVRQcc5ip9Z7v7zKqc
 14JAwE6u2traRH4NkQ5+jTcoFlTlpq6vAsMWeSxOZTPZ1XP0YFp8pySa/JItg357kCZv3b0x/MO
 gtbyed329RfSc2g==
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

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/video/backlight/ili9320.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/ili9320.c b/drivers/video/backlight/ili9320.c
index 2acd2708f8ca..3e318d1891b6 100644
--- a/drivers/video/backlight/ili9320.c
+++ b/drivers/video/backlight/ili9320.c
@@ -161,7 +161,7 @@ static int ili9320_get_power(struct lcd_device *ld)
 	return lcd->power;
 }
 
-static struct lcd_ops ili9320_ops = {
+static const struct lcd_ops ili9320_ops = {
 	.get_power	= ili9320_get_power,
 	.set_power	= ili9320_set_power,
 };

-- 
2.43.0

