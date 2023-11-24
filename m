Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD57F6CB3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 08:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C58110E34F;
	Fri, 24 Nov 2023 07:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3C410E359
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 07:18:09 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AO1Bh96008879; Fri, 24 Nov 2023 08:17:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=M2W6rcTjc/x/QMuCBnXxtswimdEjnvAYEzY1ooxiUDM=; b=OS
 YSc/6BmHazSio4nm5O32h1hE99Jth2myOWe1VfOCA9yiJm0ggbf2osDk3TTTvBMa
 ZnDa/aIkcjvrDeh4XxnCZBflzFJm2C2PdgR0EhDuQjov28udhIZbgZLyHg3xeFww
 02ecTfdjNkG01HX/Fhz5kr2praT6eVcI2ivR1vpjlD7tGKlx9M538zkqJTnT6WHx
 pYk0Q8DCrlPRr1yvmHd9dxNX6s+14etmeWNtI+zDWJ9rGmb7FN97jzeMaXHuYtdr
 p9uwUS4zd1KVwpV3IeyOjygg+fe19pV2WFlE4d57UfOH71JqY5fJS8hpGBFcVONy
 rsKCAK1r/oiTEpQ4xMhw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uhr8apay9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Nov 2023 08:17:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C966100046;
 Fri, 24 Nov 2023 08:17:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02DF521513D;
 Fri, 24 Nov 2023 08:17:07 +0100 (CET)
Received: from localhost (10.252.31.103) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 24 Nov
 2023 08:17:06 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND 1/3] drm/stm: dsi: add pm runtime ops
Date: Fri, 24 Nov 2023 08:16:47 +0100
Message-ID: <20231124071649.372270-2-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124071649.372270-1-raphael.gallais-pou@foss.st.com>
References: <20231124071649.372270-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.31.103]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
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
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 28 +++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index d5f8c923d7bc..a0ca4d7f3b8a 100644
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
@@ -551,6 +552,7 @@ static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
 	DRM_DEBUG_DRIVER("\n");
 
 	clk_disable_unprepare(dsi->pllref_clk);
+	clk_disable_unprepare(dsi->pclk);
 	regulator_disable(dsi->vdd_supply);
 
 	return 0;
@@ -569,8 +571,16 @@ static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
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
@@ -580,8 +590,10 @@ static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dw_mipi_dsi_stm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_stm_suspend,
-				dw_mipi_dsi_stm_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(dw_mipi_dsi_stm_suspend,
+			   dw_mipi_dsi_stm_resume, NULL)
 };
 
 static struct platform_driver dw_mipi_dsi_stm_driver = {
-- 
2.25.1

