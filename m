Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B462837A3E7
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 11:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06A86EA10;
	Tue, 11 May 2021 09:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02746EA10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 09:40:21 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FfXrz1SzBzkWQQ;
 Tue, 11 May 2021 17:37:39 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 17:40:09 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc
 <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH 1/1] drm/exynos: Remove redundant error printing in
 exynos_dsi_probe()
Date: Tue, 11 May 2021 17:40:04 +0800
Message-ID: <20210511094004.4726-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When devm_ioremap_resource() fails, a clear enough error message will be
printed by its subfunction __devm_ioremap_resource(). The error
information contains the device name, failure cause, and possibly resource
information.

Therefore, remove the error printing here to simplify code and reduce the
binary size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 44e402b7cdfb6e3..2d2fe5ab26e7030 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1786,10 +1786,8 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dsi->reg_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(dsi->reg_base)) {
-		dev_err(dev, "failed to remap io region\n");
+	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
-	}
 
 	dsi->phy = devm_phy_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
-- 
2.26.0.106.g9fadedd


