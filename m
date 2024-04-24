Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CC8B01F8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698FC113859;
	Wed, 24 Apr 2024 06:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CFuT8NXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22D9113859
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:36:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1C46FCE13A3;
 Wed, 24 Apr 2024 06:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44D2C3277B;
 Wed, 24 Apr 2024 06:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940575;
 bh=/YPEE/2rx+omz6upF3/bxcsvp1W87Sbaya8j0gn1t6c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CFuT8NXJ/hHnZoY45SJJvt+s5B2CBoVVYP/YFem6QLsn0Rqlqhnmr7v79ZNARUJfR
 FNjSmuyixH77Bu9hQk07WEc08pFi5mrX8C7S55ZjWS+1BvXFuoO0IzDZT1xgKVVSfs
 QWEwGQxi9CcpxXfa1CFEGlI3ZMpjX7fBlWBvXe2zNVq2M5NTc6liA5RuBvbye5I5Nj
 09O4M9lXKLJoGSLRiQYH4jX8lFr8LrnDSU88n3w1vFkhBnj8usrATzYOAZMtig0Y8T
 z1rs8iqXKn2nkSh8BqVoZ5E5jVvGA62HCIWtmKipT5ylX83JwJX14CG2rH2lYmLR9o
 LRoxjzZmdYLXw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:43 +0200
Subject: [PATCH v2 17/19] fbdev: imx: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-17-1aaa82b07bc6@kernel.org>
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
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=881; i=krzk@kernel.org;
 h=from:subject:message-id; bh=/YPEE/2rx+omz6upF3/bxcsvp1W87Sbaya8j0gn1t6c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfs4bgpP3d2adOd0Ir7rb1GXy79RJ+CIs4xW
 9qxa5vheUWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin7AAKCRDBN2bmhouD
 1/sFD/sFck3lF4eDnbOwltOZWg+sb8FGMQ+UKhyG8MYCkP7iEPDWJ+nvoqoTam9oXUqVV2lb0WP
 9VA7xERiTmIqdf9UHS5odRp1AyWKRpjYktpYM3i+OjOfc+5zYyQsCjp1BxBGvfjUFQxW7NyND1Y
 pnkY2JR3Xzx5PT91BsutcolYkS9ikkuj8cFjPQIox996BZOqu+IqNzy8KwrIpnv5dMYIdLwsz5u
 kY+qinBwuY7ES7Pxb/kl5GsQ1FK9DrLRv+GwFtRI1xQQvAS2cHzigsq4SLZy+noZpHIElBJmVLb
 LAoOc7l4EQVD7rZ3OMHj/Clfl5u0TqZrOcqxGOt450Y/IWDnKTrLW7NyFne4chqmm5Tde/d9XM/
 gs60ono6oOct7BZJDqOnPJxMl1AGlnoC61vDdTsfDp1qGwgIPENKdMCeH0RC3tPpLXwpRqVKTTP
 iNNeWSkf8buHSq7vvu+5+pJCwcYOpvQLqDMie4P07gOr7cA2GeSPKQL/5WKCpynsOIsPv8qSkiC
 pWZ/i4WxD7ntQkg8FtBOQJWNSOEOl5bwfaktFqMRValfbmVUmi49/zuWHwYMcMpBGpSdDHnBbeB
 hXkFOFihyxRoR6n796SgSO5rLVKi7jcyZGyQnbDW60hXKR6lh5AjCiGDHcW7Anvd8cD+7STNxiK
 BOYfUd6hCxn1ZeA==
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Depends on the first patch in the series.
---
 drivers/video/fbdev/imxfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index a4dbc72f93c3..4ebfe9b9df60 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -857,7 +857,7 @@ static int imxfb_lcd_set_power(struct lcd_device *lcddev, int power)
 	return 0;
 }
 
-static struct lcd_ops imxfb_lcd_ops = {
+static const struct lcd_ops imxfb_lcd_ops = {
 	.check_fb	= imxfb_lcd_check_fb,
 	.get_contrast	= imxfb_lcd_get_contrast,
 	.set_contrast	= imxfb_lcd_set_contrast,

-- 
2.43.0

