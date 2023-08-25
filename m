Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0107880D0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 09:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFEE10E617;
	Fri, 25 Aug 2023 07:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DF510E617
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 07:23:43 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RXBDw5qNQzJrrB;
 Fri, 25 Aug 2023 15:20:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 15:23:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Michal Simek
 <michal.simek@amd.com>
Subject: [PATCH -next] drm: xlnx: zynqmp_dpsub: Use devm_clk_get_enabled()
 helper function
Date: Fri, 25 Aug 2023 15:23:24 +0800
Message-ID: <20230825072324.2809260-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devm_clk_get_enabled() helper:
    - calls devm_clk_get()
    - calls clk_prepare_enable() and registers what is needed in order to
      call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 88eb33acd5f0..92e61434473f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -92,16 +92,10 @@ unsigned int zynqmp_dpsub_get_audio_clk_rate(struct zynqmp_dpsub *dpsub)
 
 static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
 {
-	int ret;
-
-	dpsub->apb_clk = devm_clk_get(dpsub->dev, "dp_apb_clk");
-	if (IS_ERR(dpsub->apb_clk))
-		return PTR_ERR(dpsub->apb_clk);
-
-	ret = clk_prepare_enable(dpsub->apb_clk);
-	if (ret) {
+	dpsub->apb_clk = devm_clk_get_enabled(dpsub->dev, "dp_apb_clk");
+	if (IS_ERR(dpsub->apb_clk)) {
 		dev_err(dpsub->dev, "failed to enable the APB clock\n");
-		return ret;
+		return PTR_ERR(dpsub->apb_clk);
 	}
 
 	/*
@@ -274,7 +268,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	zynqmp_dp_remove(dpsub);
 err_pm:
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(dpsub->apb_clk);
 err_mem:
 	of_reserved_mem_device_release(&pdev->dev);
 	if (!dpsub->drm)
@@ -295,7 +288,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
 	zynqmp_dp_remove(dpsub);
 
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(dpsub->apb_clk);
 	of_reserved_mem_device_release(&pdev->dev);
 
 	if (!dpsub->drm)
-- 
2.34.1

