Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4CA68E931
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 08:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED27D10E6B2;
	Wed,  8 Feb 2023 07:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD47F10E6B1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 07:42:11 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4PBX594wBnz4xq27;
 Wed,  8 Feb 2023 15:42:05 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl1.zte.com.cn with SMTP id 3187fsPq028878;
 Wed, 8 Feb 2023 15:41:54 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Wed, 8 Feb 2023 15:41:56 +0800 (CST)
Date: Wed, 8 Feb 2023 15:41:56 +0800 (CST)
X-Zmail-TransId: 2af963e35244ffffffffc8658eb3
X-Mailer: Zmail v1.0
Message-ID: <202302081541565850181@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <thierry.reding@gmail.com>
Subject: =?UTF-8?B?W1BBVENIXSBncHU6IGhvc3QxeDogbWlwaTogdXNlwqBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 3187fsPq028878
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63E3524D.000/4PBX594wBnz4xq27
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/host1x/mipi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 2efe12dde8bc..4dcec535ec21 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -501,7 +501,6 @@ static int tegra_mipi_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	struct tegra_mipi *mipi;
-	struct resource *res;
 	int err;

 	match = of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
@@ -515,8 +514,7 @@ static int tegra_mipi_probe(struct platform_device *pdev)
 	mipi->soc = match->data;
 	mipi->dev = &pdev->dev;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mipi->regs = devm_ioremap_resource(&pdev->dev, res);
+	mipi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(mipi->regs))
 		return PTR_ERR(mipi->regs);

-- 
2.25.1
