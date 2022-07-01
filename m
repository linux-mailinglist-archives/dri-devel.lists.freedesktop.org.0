Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EDD563501
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 16:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D93614A0BE;
	Fri,  1 Jul 2022 14:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1161 seconds by postgrey-1.36 at gabe;
 Fri, 01 Jul 2022 08:58:49 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BDC10F7D7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 08:58:49 +0000 (UTC)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LZ7qZ0DZbzkWWL;
 Fri,  1 Jul 2022 16:37:30 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Jul 2022 16:39:24 +0800
Received: from huawei.com (10.175.112.208) by dggpemm500019.china.huawei.com
 (7.185.36.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Jul
 2022 16:39:23 +0800
From: Jian Zhang <zhangjian210@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <krzysztof.kozlowski@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] drm/exynos/exynos7_drm_decon: free resources when
 clk_set_parent() failed.
Date: Fri, 1 Jul 2022 08:37:28 +0000
Message-ID: <20220701083728.66975-1-zhangjian210@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 01 Jul 2022 14:20:45 +0000
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
Cc: xuqiang36@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In exynos7_decon_resume, When it fails, we must use clk_disable_unprepare()
to free resource that have been used.

Fixes: 6f83d20838c09 ("drm/exynos: use DRM_DEV_ERROR to print out error message")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jian Zhang <zhangjian210@huawei.com>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index c04264f70ad1..3c31405600f0 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -800,31 +800,40 @@ static int exynos7_decon_resume(struct device *dev)
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to prepare_enable the pclk [%d]\n",
 			      ret);
-		return ret;
+		goto err_pclk_enable;
 	}
 
 	ret = clk_prepare_enable(ctx->aclk);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to prepare_enable the aclk [%d]\n",
 			      ret);
-		return ret;
+		goto err_aclk_enable;
 	}
 
 	ret = clk_prepare_enable(ctx->eclk);
 	if  (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to prepare_enable the eclk [%d]\n",
 			      ret);
-		return ret;
+		goto err_eclk_enable;
 	}
 
 	ret = clk_prepare_enable(ctx->vclk);
 	if  (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to prepare_enable the vclk [%d]\n",
 			      ret);
-		return ret;
+		goto err_vclk_enable;
 	}
 
 	return 0;
+
+err_vclk_enable:
+	clk_disable_unprepare(ctx->eclk);
+err_eclk_enable:
+	clk_disable_unprepare(ctx->aclk);
+err_aclk_enable:
+	clk_disable_unprepare(ctx->pclk);
+err_pclk_enable:
+	return ret;
 }
 #endif
 
-- 
2.17.1

