Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC9E8242E0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 14:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B8610E2F4;
	Thu,  4 Jan 2024 13:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEE310E471
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 13:46:14 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 404BPl4m024657; Thu, 4 Jan 2024 14:44:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=VZZBxcUbum7P76Wj0XWqOVN7boKS0FAnpWW8U/8QDpY=; b=G3
 gzjb9+jVxUZ1tJpKac3kws14zaqVkZ8tBzTC78olVK/QDU5l9FW7XE4q7IBUF+WG
 nzYA40BpHyONiJAfKubwii/nrUYeqSH3xDFP/XPtjsJEbNcWZ7RKtlg0AN2uFMUj
 j+y27OP05N5pruHrLx9VLZhGwqlskwGoGjW6p71wTreMD+/4/duwoBdYVOSwCP8m
 /3hEZRiwMrO2FSMmiO/lUnLjvnhxv5scDpc8OElOcRohnnJCj4EAohaEeS0N31OO
 YdEIv4RYx5usqGIIPBtRzGs+UABMYz//zEnCeBzxmSVkK4cUVG6+8oZk6sdwps1t
 AHAPBeMRpZxKWFrdrgaA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vawn4qhub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 14:44:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53B4510002A;
 Thu,  4 Jan 2024 14:44:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A5D42291AE;
 Thu,  4 Jan 2024 14:44:49 +0100 (CET)
Received: from localhost (10.252.5.254) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 14:44:49 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 2/4] drm/stm: dsi: add pm runtime ops
Date: Thu, 4 Jan 2024 14:44:32 +0100
Message-ID: <20240104134434.744497-3-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240104134434.744497-1-raphael.gallais-pou@foss.st.com>
References: <20240104134434.744497-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.5.254]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-04_07,2024-01-03_01,2023-05-22_02
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yannick Fertre <yannick.fertre@foss.st.com>

Update control of clocks and supply thanks to the PM runtime
mechanism to avoid kernel crash during a system suspend.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Changes in v2:
	- Changed SET_RUNTIME_PM_OPS to RUNTIME_PM_OPS and removed
	__maybe_unused
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index b1aee43d51e9..82fff9e84345 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -11,6 +11,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
 #include <video/mipi_display.h>
@@ -77,6 +78,7 @@ enum dsi_color {
 struct dw_mipi_dsi_stm {
 	void __iomem *base;
 	struct clk *pllref_clk;
+	struct clk *pclk;
 	struct dw_mipi_dsi *dsi;
 	u32 hw_version;
 	int lane_min_kbps;
@@ -443,7 +445,6 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_mipi_dsi_stm *dsi;
-	struct clk *pclk;
 	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
@@ -483,21 +484,21 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 		goto err_clk_get;
 	}
 
-	pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(pclk)) {
-		ret = PTR_ERR(pclk);
+	dsi->pclk = devm_clk_get(dev, "pclk");
+	if (IS_ERR(dsi->pclk)) {
+		ret = PTR_ERR(dsi->pclk);
 		DRM_ERROR("Unable to get peripheral clock: %d\n", ret);
 		goto err_dsi_probe;
 	}
 
-	ret = clk_prepare_enable(pclk);
+	ret = clk_prepare_enable(dsi->pclk);
 	if (ret) {
 		DRM_ERROR("%s: Failed to enable peripheral clk\n", __func__);
 		goto err_dsi_probe;
 	}
 
 	dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
-	clk_disable_unprepare(pclk);
+	clk_disable_unprepare(dsi->pclk);
 
 	if (dsi->hw_version != HWVER_130 && dsi->hw_version != HWVER_131) {
 		ret = -ENODEV;
@@ -551,6 +552,7 @@ static int dw_mipi_dsi_stm_suspend(struct device *dev)
 	DRM_DEBUG_DRIVER("\n");
 
 	clk_disable_unprepare(dsi->pllref_clk);
+	clk_disable_unprepare(dsi->pclk);
 	regulator_disable(dsi->vdd_supply);
 
 	return 0;
@@ -569,8 +571,16 @@ static int dw_mipi_dsi_stm_resume(struct device *dev)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(dsi->pclk);
+	if (ret) {
+		regulator_disable(dsi->vdd_supply);
+		DRM_ERROR("Failed to enable pclk: %d\n", ret);
+		return ret;
+	}
+
 	ret = clk_prepare_enable(dsi->pllref_clk);
 	if (ret) {
+		clk_disable_unprepare(dsi->pclk);
 		regulator_disable(dsi->vdd_supply);
 		DRM_ERROR("Failed to enable pllref_clk: %d\n", ret);
 		return ret;
@@ -582,6 +592,8 @@ static int dw_mipi_dsi_stm_resume(struct device *dev)
 static const struct dev_pm_ops dw_mipi_dsi_stm_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_stm_suspend,
 			    dw_mipi_dsi_stm_resume)
+	RUNTIME_PM_OPS(dw_mipi_dsi_stm_suspend,
+		       dw_mipi_dsi_stm_resume, NULL)
 };
 
 static struct platform_driver dw_mipi_dsi_stm_driver = {
-- 
2.25.1

