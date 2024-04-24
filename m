Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA82C8B01D3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E40A11384A;
	Wed, 24 Apr 2024 06:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qshTr3Fb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48D611384A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:34:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 552E061883;
 Wed, 24 Apr 2024 06:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803E5C2BD11;
 Wed, 24 Apr 2024 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940488;
 bh=NOJTom4sl0/r1j3Ss+jlqEt3iVwaP7N8FtTfssrmGJs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qshTr3FbpLI37jm2msIZjP7kfx8Tj2e5f6X2eCHqQ6gMxWGzLOBVk0pASOGa5sIOW
 qKKdHN4DazQZBcMsN/NWJJvOLfCfubRm+4k2tOMCkdhE9hxkPukTW/f8dJ6HVVBuMQ
 CEV4kNznmpwWf805EK+84Y76gn7WOj72hyOAnMDwaJvIbOyvMqoQxilgGy9v2mTNr7
 Kf1VaN4XDp602S3W5t0SxKjrvwDU6Wo+VDrKZf0jmUwVAtYg3H7761gSynU26sMnwv
 gEHAyXMcF8R0qAY1DCrirSSJAtp6s2SKA0X2cIVcGY3tsZK2kfhsGcQ8FmhZct0C3r
 Zp2+TSjSyzhAw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:29 +0200
Subject: [PATCH v2 03/19] backlight: corgi_lcd: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-3-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=krzk@kernel.org;
 h=from:subject:message-id; bh=NOJTom4sl0/r1j3Ss+jlqEt3iVwaP7N8FtTfssrmGJs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfgAPBA13t4hzc75iF/9FhP/Ffy3+J0VROvv
 MQNlaGrdtSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin4AAKCRDBN2bmhouD
 1/I7D/9XENRlRBegukAR77dNn4HXPFTEUPEWKP00rQUchnrH4Ek6XbJiPJhcqD7lpz+YgLuRH1E
 ZtwQjfnlU5sCXl6G96L0EOVFdoLY3d+ht9IUEq0YGWxETNXLo5LhcnKIHTsUXWCTyhK+BI0oWyg
 gefS8iyjbuHgZEVTnODJQHFf2QsBWMuYBbjN4ibKS2hlsfeMbnG2hxMwQBYPieLC07M3RodDasn
 EjAqGnv16vtBo0TxHvn52v0bEzlugqgJJoPVtNWCtP64P3LWa6fbDrKfNIfE/W5xWYoTv73c44y
 FLa+cepeGiJej6sGZAUV+BBynGu2PHsICNlAm1vpreNep5S7r9jyBzl/0TnCeRuGZpZFm5EHzjX
 pf/ySG74FjCGokORdhS881hIf45atIpEwI8IgUzPZvgMfAtapHfIxPAtFhJWCghWHwOi6AMEjHp
 gmUrizcjO1DSPitHURvdz67bii8kQTIej7i2tE+IJfQYyEMCswqZX3n/TjoHpmeyCqscMIGObax
 r9Lft7ZwdEbszDdIW8DGRxryk10kIjKCnDOMUMj7nCG4o4QFqCdp07yCIvLLUj6e9SzOR68qyEJ
 8l3jO/b24veySctfWPbFUSg1UoAaiXRikqRP3HTtJ+gnneCnEUPC3RdsHMFWaksB7WoufEV27vu
 Hz+tElu8ckY7frw==
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
 drivers/video/backlight/corgi_lcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
index dd765098ad98..aad1680c9075 100644
--- a/drivers/video/backlight/corgi_lcd.c
+++ b/drivers/video/backlight/corgi_lcd.c
@@ -380,7 +380,7 @@ static int corgi_lcd_get_power(struct lcd_device *ld)
 	return lcd->power;
 }
 
-static struct lcd_ops corgi_lcd_ops = {
+static const struct lcd_ops corgi_lcd_ops = {
 	.get_power	= corgi_lcd_get_power,
 	.set_power	= corgi_lcd_set_power,
 	.set_mode	= corgi_lcd_set_mode,

-- 
2.43.0

