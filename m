Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE88A43E3
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736711120E4;
	Sun, 14 Apr 2024 16:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WOOC5Ont";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8043A1120E4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:37:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E2CC060B2C;
 Sun, 14 Apr 2024 16:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161F9C2BD10;
 Sun, 14 Apr 2024 16:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112624;
 bh=YPzrDayne4RsVvwgv+6Amz6T/hPNpbOfbV29tRkK+J4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WOOC5Ont5LDbeveY1rWMpV/B4eo9u0qhC0DiseQeuSnr9mS8HWXEzcrg1yM/zwJ8A
 Hp2yOH03ZGLwy0Awwa2cgdCCuNrzMft8pSKHZP7FEdDqAw3PC9BYMoaTEqYSSzds7I
 Csc3BozrAJ5tS5Sip69P2PzL8pBLR/yEMHyZiDg5/OTFR7zTZH/duuDoj512vRGQNy
 9QKOZwobNyXmCePZ8GfDT9YZuWjh24wC2dlZph/pSq1UW6LKMpcCiE516LxO54QYxm
 qBBh1hvllwVI/L4mv6b+JSJy7/TI5k4gkjPq+XzO0+dk8YBxd2ZPIX05urVQUZ15ud
 iogfjO/gVHqnQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:06 +0200
Subject: [PATCH 08/18] backlight: l4f00242t03: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-8-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=787; i=krzk@kernel.org;
 h=from:subject:message-id; bh=YPzrDayne4RsVvwgv+6Amz6T/hPNpbOfbV29tRkK+J4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX5+G2r4LHJsJWz/AdfA9TXepPdHYib8tDLf
 NkIDcO22GqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF+QAKCRDBN2bmhouD
 1/LKD/9VWjfNPWPT125xSZyzNAAkWwa1XpfFmw9kMbYwZXaaL+DSmFpJSbBGFn7KSp3nyDQLlmy
 YKCulZJMLmFMcQ0XQyTTZnlTLS/TxrjKqbi55mGJ6IOKwqDnqyekHpcZgrVGyyuZBbV9ibilzUU
 BsCB20lUn1qXZ3Igk+phQmEv1OzfhQN6V44uoAmiTj/IW0o28iNW6G2SWBX3b4HiLhv6vquqHAI
 6u5++V1d3TNqBs4nWy95JdchIqVAd5u+EgCC+3M//c/AbLNdJ7nQlqZ9oE31cuAhLovB6VL5Lke
 iQJD6pUfLs5UUVJCZowUbHjunADEgAY29AInndLpn9S8VmyoWWCC33v4c2SMLajz/3pxEpxm3If
 7ApIB+KRFZ+21zt0uDxchqnEEd5FVIM+ulxi7HSiTjgjLeN5DBGPlSFjNm6QllGQFZ+1q2caMMZ
 eZcZPhfSv38aAGie8sgrrtPUQt6NrtcFcEeulKnJN5+ldxEAz1ogGj+ccbdYiRWejGXpAgk2OC0
 QTypNgYJo38zrZqNBKem8jWkwNRvA288D6tYXj3PnCAPobUkWxc3cvCq2pue9v9XlgZ5/NsOHtP
 z2d1pTDtY25H/5J5/FJVj8+tSA6Fnc2U2SG3kkc7dgMaVVzX8XH595u7m9SV+Sj+MjfqfH1jLE3
 dISSCZSKXV0lKmA==
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
 drivers/video/backlight/l4f00242t03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
index bd5137ee203b..dd0874f8c7ff 100644
--- a/drivers/video/backlight/l4f00242t03.c
+++ b/drivers/video/backlight/l4f00242t03.c
@@ -158,7 +158,7 @@ static int l4f00242t03_lcd_power_set(struct lcd_device *ld, int power)
 	return 0;
 }
 
-static struct lcd_ops l4f_ops = {
+static const struct lcd_ops l4f_ops = {
 	.set_power	= l4f00242t03_lcd_power_set,
 	.get_power	= l4f00242t03_lcd_power_get,
 };

-- 
2.34.1

