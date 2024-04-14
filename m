Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D4F8A43ED
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABDE1120E9;
	Sun, 14 Apr 2024 16:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pe4OwOCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F7A10E177
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:37:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 524D360B2C;
 Sun, 14 Apr 2024 16:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A7AC072AA;
 Sun, 14 Apr 2024 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112651;
 bh=Omi3ScwdlpvMVIR0iuLF7YErHf7u2KyCq5AmJ3vjnBE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pe4OwOCY+VgiBiEwyJfZpyaAKr/xxy3T1yjzg5nz2S6rudyffBYb2pZ2PZQ2iAm0v
 wB2oMLVRfF8GXgC0F8cJK3Vx1sePV8pI+V0N5MZJqVp5sTyMk4eKnr3Kkl52QVjWFb
 SbkEK8VySRESGB3UWab6+exfm8Z3ljQRwBsO598QaRkO6/rKCOtoKy9pIzHwlke20N
 yEyudfSBR+Iw3eA7fJB/ubGquFGC9kua9fOMPH0s0QCv7cvTDoswtxQfwKbvihvX/4
 j7x/jMnsCxjk5irR8jhZDrqmtjnS1ZOTc9D0JdwCU3hFqxt0pyZkMwpXetAIrwd6tk
 xjdpWSQhyOZPQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:11 +0200
Subject: [PATCH 13/18] backlight: platform_lcd: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-13-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; i=krzk@kernel.org;
 h=from:subject:message-id; bh=Omi3ScwdlpvMVIR0iuLF7YErHf7u2KyCq5AmJ3vjnBE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX+JGEE7joH61NzRiMDOS5W2JAwhaw4LdAOM
 tjD6FdIfgaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF/gAKCRDBN2bmhouD
 1/kmD/9ZvtUWiVU7IXkt1bZ19RxRPacMMFa3sgxkl+wc9p3fy4n9SLCGJ/KI0bFsQsZjt+0hAIB
 PKixfmoG8T+w+kx7HMJAs+nRtj/V2bBzlPcQI5gkd9IRCFlkPv7QHqh9cBrJHzC5nxSyykZ1dcl
 AqVPCiQIGvxVrX2NMhDNv6n1FtTsMbKlpLRHh5kC3ctJc8YEJpjQ8r+Vs/HjQ1DvEYuOlwrElS7
 qkOKzQZs7mkxUBTh4DyoCGJkhmgBueB7lATvGEFgUR3mx6AV96T//aYTyMxbOHsbt+pdSkKlbLk
 3EyUEwbL7KmxvRjd0g/lvPQllaobwmc4lZsox3JI38mo+YtCtyqHHUTovGxNEqMwFmnwnRide8r
 7uROQZqfV5VOvBSuqb6yTSP7mowtAqVZeoRfxhwcYvkCcn9PJg+sVZWTekBaIcgBIErfjOdiyFY
 LsyNQDhV0wQMTSWT0d3aCeyNzAInhPtwbUyGGWe5TZrHY3iWXkueZAWmW4J+DtUyc6Gf6C0TCPk
 JAexKtmFuubczvorJNaZMoNymoptUo8RxfMDG4lB0O8qf3LCOo3XfkzBUsfNQi8MYlhrZs8um2H
 eJgz3mTizT2+fPI/2i6LYIfUaTrrN+/pI9FrrsaPopn1dMvFXoliYXKNaVXXQk33Q+u/9D3tUO1
 zxIS6UUOWmZoslg==
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

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/video/backlight/platform_lcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
index dc37494baf42..76872f5c34c5 100644
--- a/drivers/video/backlight/platform_lcd.c
+++ b/drivers/video/backlight/platform_lcd.c
@@ -62,7 +62,7 @@ static int platform_lcd_match(struct lcd_device *lcd, struct fb_info *info)
 	return plcd->us->parent == info->device;
 }
 
-static struct lcd_ops platform_lcd_ops = {
+static const struct lcd_ops platform_lcd_ops = {
 	.get_power	= platform_lcd_get_power,
 	.set_power	= platform_lcd_set_power,
 	.check_fb	= platform_lcd_match,

-- 
2.34.1

