Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9678A43D5
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F771120DA;
	Sun, 14 Apr 2024 16:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sfLqAmbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91881120D2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:36:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 367F160B32;
 Sun, 14 Apr 2024 16:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE32C072AA;
 Sun, 14 Apr 2024 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112594;
 bh=locImdr60u+fZ7AOjuj08IprumN1nXoXaa2rUh5Ga3U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sfLqAmbAeMWEejUh5U41VGNkb9k1Q2YKtH3wqONu820BgHz3Citcg4Lwk9GGBuh/X
 HUMBPoNR1NIoC6GSmdcMeAvaGxxW/r9T65EtmX8XP0dPhSxhh4EABaPZV1Q/ODLZfA
 7n2K/hCcDFks100ZjS9jTg2Ou5p1YlI2uyJKXBeeIxPLl6ygrGj3t5B7jzCnd89SpO
 bo8cuqwPKNUG1GeZikAtAlrMsTxlqjZKt5jNyCjgQ50SrYffh9UMTZn5GxUUxfECyc
 LmEhJP+P5pdwCPtq2fT3eO/olFcRNqTq9wExYTcdvbc3qk9G+qZ1gQklK6vpDwXaZ9
 wUQRlQ0f9/1wA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:00 +0200
Subject: [PATCH 02/18] backlight: ams369fg06: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-2-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=791; i=krzk@kernel.org;
 h=from:subject:message-id; bh=locImdr60u+fZ7AOjuj08IprumN1nXoXaa2rUh5Ga3U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX0G//dPGlem1jcu7wyCWx2iECQwgsLjz+Yj
 iMRFiGfU3qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF9AAKCRDBN2bmhouD
 13J0D/408JzyMPbhs0Mw1cq11iv6utAIyFxvBEUQbR2XuwCHtfstnxZOfqjhMAFI8QtQAyQmIx1
 RiXksGCaiUiokpVQHOJc6zvFll5pBn4RGyqgxPVCwlFlNPLoPnTvoYym3Z4VgjH1xupmLDYz6/D
 sUeFZwRwRiamVTRzBZ/7TJMqVxuweEmqFnY5HfaVPGJLMq1BSiK5mnfZpEiI92z/2lvtXj9AScj
 GEnyaoug1JyqbSjUWERCNKkPkNs9+8f3nbVH2fhJgrxCgakLdT3PrPrdftFzqWwaoIIxF9n9br7
 dPNhvfVAsqKaS4IMLmLVSs5imuZnr6tc62bnMNazLwENfgzxqKb8M9DI8mhr+qDsc7Uv9foYoHT
 HyRPXMUNxAPD6A9veDNODkDHJfm4ocmf4+Zx2WZ25sQ8pqPEFFY0tiYdsd2cYySpNqOoTSYetWr
 /wRI/hWv2i1eFEdtQWXlEP/TLN52GZKpL2YlwkEw9VasadFOhyY4JBI3WknQAufASV9HbQGOqxn
 Kjpxg/uj/dg8HhL3Qr5YTepKONcZXy9psyRKi286V1JEPU2JrqYhNgyUK669XCTZDlbhoDW5pZ0
 sRFKUX7DMdzrivAvdrVVwC568IterSQNqoY1cKuos++QJ7JeEkV5Ir2hXYbQh4xm9+seQ1ohSN+
 BdTYNwNnz7HvOyA==
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
2.34.1

