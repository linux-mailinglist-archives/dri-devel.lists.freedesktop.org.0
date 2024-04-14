Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9398A43EA
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3E11120EC;
	Sun, 14 Apr 2024 16:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mvk23GC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1796B1120E7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:37:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 795E760B67;
 Sun, 14 Apr 2024 16:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378A8C2BD10;
 Sun, 14 Apr 2024 16:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112640;
 bh=tv/dXn/1EbAmlxq0rha4TdMh0Fw2XbAyNvTO8VxWrfY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Mvk23GC5o/KR5hw1yWUHcOQ0JLquZS2XLwKhnOVYMKdirBuGyTwcfaN+spOOlHrFV
 a6cr5vzIwlqB5egzmrQwYLc6P1H2wfSvzfHvfKIBoeX1CEmuxxeFb56EI76gmNQaEI
 OBtOj7EPggVqyMDdUXVBH4BZMNlUSgmmFZwe2oEq+82xrXyFNF0ONBA5HfMU1NFNS5
 HTksyUGRMQnqSn/vCP90kw5M3HLyAelC6oth20SikqrU9jreuozYkWligLWjHHRHil
 W/yQCP+mrAw4PHkL1cQMy6q9N1hs/r2E7CDUcwFH23dAdsV6P24WfPebZwAzJaK1Dc
 bRckeg1m5mLVQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:09 +0200
Subject: [PATCH 11/18] backlight: ltv350qv: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-11-9b37fcbf546a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=749; i=krzk@kernel.org;
 h=from:subject:message-id; bh=tv/dXn/1EbAmlxq0rha4TdMh0Fw2XbAyNvTO8VxWrfY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX8wDeoy2AroJzqYcLrxCU3NYrvz7HErxPGr
 bgi9VsTRwOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF/AAKCRDBN2bmhouD
 1wjsD/9/W97+MJ3uicCNV/2XKOLdqkedzANr6kez8MtBavyVmvfC7h0iTZH5yIeMMNDuVPLg9xT
 ZWPrX9sav1psnR44KEwM0h1eamFmVqIBcO49w6A6yA2mEdaC5PI2UggRle/lrpMJfNx7z89k6HL
 yRZEGh1dG9p+OfIccTjIy2p3+e4nvjUA8eshh4buTQhZgD8k3e6P2fwE7zpVP3jUkabpT3I7g4z
 Brc6v1wX/cqVTD1A8f7kf7nF68Ocb5f/ZN7hxrFl+9ljz7aaNrLVswNe0EuA3sX22q4sqooOtRj
 x2DFZHEEJCICFDYwINUTGTYi7EbSz5Ne/o2zv6r1//DGOENjl100DakAHSx3mqoETEQv1ohC4HK
 yGsqQrCfUqH02396CosOrt/6DzZZnjXi7yrNUjW7CYeeBOC+cY/L+lOmi7uMVETNBaNz08HtntL
 xyXS9SnIZnlmBDh3wrdJgfrAKeYQJyCjc0pBm+IVcehLZgR9TbbBGo1NshoJ7Y4pMDN+EiaebtW
 PB/y2PzhKkgcvcZEQhO8OHrBMapLFrsW+Y637iBopoU3U5XfZ504XV7CouHJpbUO/ai+iIyQakX
 YaQ/v7cjq3l+OEHiFPm6iXt4ip1pXARzNmoevjl1yM1B8x+Ehfp7CMmB9A+lRahHdaJJmIz4I+L
 fPjRr4wPjGU4WZw==
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
 drivers/video/backlight/ltv350qv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/ltv350qv.c b/drivers/video/backlight/ltv350qv.c
index d54f501e4285..cdc4c087f230 100644
--- a/drivers/video/backlight/ltv350qv.c
+++ b/drivers/video/backlight/ltv350qv.c
@@ -217,7 +217,7 @@ static int ltv350qv_get_power(struct lcd_device *ld)
 	return lcd->power;
 }
 
-static struct lcd_ops ltv_ops = {
+static const struct lcd_ops ltv_ops = {
 	.get_power	= ltv350qv_get_power,
 	.set_power	= ltv350qv_set_power,
 };

-- 
2.34.1

