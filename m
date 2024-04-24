Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C78B01D2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1282113848;
	Wed, 24 Apr 2024 06:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d/LWKauu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F7D113848
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:34:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2871E61794;
 Wed, 24 Apr 2024 06:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71942C3277B;
 Wed, 24 Apr 2024 06:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940481;
 bh=ujJLvtby2juc8QEFHnS//3ayXKjJ0LbFnDL/vxd1pSE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=d/LWKauuDFveIJ13dytv+KU3xMikPpeGTnLvWjNUcOP4oWx0y5EJy67Oz7v0VukWm
 pLusQ9wKDLrzJDfEVGMH0WZLrz8yK387bcDCfQVxHPW/tLxfoTyhC7AgFOw3twNut2
 TM+r3ZGlqrU7gYxLjmuLroU4+38nLv0xc4TvvGFryL55jb68JzlcaBahtuYPrA6eyk
 BNQavvpG/Toii1onnF9zgL0rzuJ9laK++UDHJQCoJpComJONQywY9jngZyFQlbptZk
 IvVs6dCdvgnHoU85YdBjZIoxUGL6hqZ95XS8louQkYtl0sunc+6dkLl7IqKEgug2ka
 e/kkahfzucFfA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:28 +0200
Subject: [PATCH v2 02/19] backlight: ams369fg06: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-2-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=850; i=krzk@kernel.org;
 h=from:subject:message-id; bh=ujJLvtby2juc8QEFHnS//3ayXKjJ0LbFnDL/vxd1pSE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKff5jSyRPmEYqwfFNIBdCINRpn6WCm55ITCt
 haEbteXAaaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin3wAKCRDBN2bmhouD
 15u+D/9kI5cE+y9O7Co58c3g2cDXHqDrv3gMH/8aVz2pGK/qyXKonuQ4IibZF0P5hxbg5wlYUc0
 z4KXsd4+f0D/zAwwh7USdPRYNjH4jo7V+eIiSak24C3OWaHvMEoBWuoGdOGX6NNCBgAcw8ixSrz
 RgdDQ41e7BTwZ8dxzHL68AW4u6GM8ArialmSrYAltfantLdKc0UNU+xAxWGynJQCaH1s/P+EnDd
 Y1fKe7oLLHoUAt6NSu6H61ibGx/BUh7mjrbmNItm9AE5oA5N1WFJUgXL2Ryl1XerhP4T3wHqlFQ
 Cu0xDb2xWUW7in46UfG663lSypUwVCizA61i+TNMC+JiTto5vhCn5uaxWDS/sGGSFsfmnyGsDKn
 Qs7wPBmxnIghC169q3WWwXE6xqYiaOGpiosJiyCYx+He6awn4NVsc+O1EEyUZ6wH2cLvP8i+0YU
 cgr0wAYg5l60LphWowE0U/ukl2+eKGzCtyKaCgykrZ4/7+LYPWd+toI5qEG1HxlLt0m8yMCWZe/
 xprDfY0XVm5+DLVoIMPWDw4sZ8958MLnSKIidmSyrQ+f8nHigE83IwaDC1SSD2AjfAS2XTAbiUO
 ZTWU6XKMnKvRMpV5KK+WqyfBdTAORn3UYfTl0aDDVOGTYKm3Dd6Ed0xBb9mqslcYwMT5tuPCQgJ
 KYT+08BfJ3I2pXA==
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
 drivers/video/backlight/ams369fg06.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/ams369fg06.c b/drivers/video/backlight/ams369fg06.c
index 522dd81110b8..57ec205d2bd2 100644
--- a/drivers/video/backlight/ams369fg06.c
+++ b/drivers/video/backlight/ams369fg06.c
@@ -427,7 +427,7 @@ static int ams369fg06_set_brightness(struct backlight_device *bd)
 	return ret;
 }
 
-static struct lcd_ops ams369fg06_lcd_ops = {
+static const struct lcd_ops ams369fg06_lcd_ops = {
 	.get_power = ams369fg06_get_power,
 	.set_power = ams369fg06_set_power,
 };

-- 
2.43.0

