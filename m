Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB56F76C635
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BF610E4CD;
	Wed,  2 Aug 2023 07:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 982 seconds by postgrey-1.36 at gabe;
 Tue, 01 Aug 2023 08:49:18 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB03B10E36E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 08:49:18 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RFSvZ4BJkztRbF;
 Tue,  1 Aug 2023 16:29:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 16:32:50 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>
Subject: [PATCH -next] drm: xlnx: zynqmp_dpsub: Use
 devm_platform_ioremap_resource_byname()
Date: Tue, 1 Aug 2023 16:32:20 +0800
Message-ID: <20230801083220.3892883-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 02 Aug 2023 07:14:07 +0000
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
Cc: lizetao1@huawei.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert platform_get_resource_byname() + devm_ioremap_resource() to a
single call to devm_platform_ioremap_resource_byname(), as this is
exactly what this function does.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 3b87eebddc97..2b731f3eea54 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1228,7 +1228,6 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
 {
 	struct platform_device *pdev = to_platform_device(dpsub->dev);
 	struct zynqmp_disp *disp;
-	struct resource *res;
 	int ret;
 
 	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
@@ -1238,22 +1237,19 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
 	disp->dev = &pdev->dev;
 	disp->dpsub = dpsub;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "blend");
-	disp->blend.base = devm_ioremap_resource(disp->dev, res);
+	disp->blend.base = devm_platform_ioremap_resource_byname(pdev, "blend");
 	if (IS_ERR(disp->blend.base)) {
 		ret = PTR_ERR(disp->blend.base);
 		goto error;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "av_buf");
-	disp->avbuf.base = devm_ioremap_resource(disp->dev, res);
+	disp->avbuf.base = devm_platform_ioremap_resource_byname(pdev, "av_buf");
 	if (IS_ERR(disp->avbuf.base)) {
 		ret = PTR_ERR(disp->avbuf.base);
 		goto error;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aud");
-	disp->audio.base = devm_ioremap_resource(disp->dev, res);
+	disp->audio.base = devm_platform_ioremap_resource_byname(pdev, "aud");
 	if (IS_ERR(disp->audio.base)) {
 		ret = PTR_ERR(disp->audio.base);
 		goto error;
-- 
2.34.1

