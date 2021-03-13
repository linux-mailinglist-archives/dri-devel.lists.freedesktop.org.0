Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E3339B3D
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 03:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3206E072;
	Sat, 13 Mar 2021 02:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8A56E072
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 02:29:28 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dy65y1LBCzrVnR
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 10:27:34 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Sat, 13 Mar 2021 10:29:19 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <thierry.reding@gmail.com>
Subject: [PATCH] gpu: host1x: mipi: Simplify with dev_err_probe()
Date: Sat, 13 Mar 2021 10:30:02 +0800
Message-ID: <1615602602-46969-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/host1x/mipi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 2efe12d..4ba022f 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -523,10 +523,9 @@ static int tegra_mipi_probe(struct platform_device *pdev)
 	mutex_init(&mipi->lock);
 
 	mipi->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(mipi->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
-		return PTR_ERR(mipi->clk);
-	}
+	if (IS_ERR(mipi->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(mipi->clk),
+				     "failed to get clock\n");
 
 	err = clk_prepare(mipi->clk);
 	if (err < 0)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
