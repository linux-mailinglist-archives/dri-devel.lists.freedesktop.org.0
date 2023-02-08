Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65C68E93A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 08:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBBE10E6B3;
	Wed,  8 Feb 2023 07:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B4810E6B3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 07:44:55 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4PBX8N5qqNz4xq2B;
 Wed,  8 Feb 2023 15:44:52 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl2.zte.com.cn with SMTP id 3187iiKe043732;
 Wed, 8 Feb 2023 15:44:44 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Wed, 8 Feb 2023 15:44:46 +0800 (CST)
Date: Wed, 8 Feb 2023 15:44:46 +0800 (CST)
X-Zmail-TransId: 2af963e352ee3d05f5f6
X-Mailer: Zmail v1.0
Message-ID: <202302081544467680272@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <p.zabel@pengutronix.de>
Subject: =?UTF-8?B?W1BBVENIXSBncHU6IGlwdS12MzogcHJnOiB1c2XCoGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 3187iiKe043732
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63E352F4.000/4PBX8N5qqNz4xq2B
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/ipu-v3/ipu-prg.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-prg.c b/drivers/gpu/ipu-v3/ipu-prg.c
index 196797c1b4b3..3e888c5f62d3 100644
--- a/drivers/gpu/ipu-v3/ipu-prg.c
+++ b/drivers/gpu/ipu-v3/ipu-prg.c
@@ -358,7 +358,6 @@ EXPORT_SYMBOL_GPL(ipu_prg_channel_configure_pending);
 static int ipu_prg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct ipu_prg *prg;
 	u32 val;
 	int i, ret;
@@ -367,8 +366,7 @@ static int ipu_prg_probe(struct platform_device *pdev)
 	if (!prg)
 		return -ENOMEM;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	prg->regs = devm_ioremap_resource(&pdev->dev, res);
+	prg->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(prg->regs))
 		return PTR_ERR(prg->regs);

-- 
2.25.1
