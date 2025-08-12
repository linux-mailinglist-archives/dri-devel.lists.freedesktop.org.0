Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05914B22920
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 15:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C532610E5EB;
	Tue, 12 Aug 2025 13:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="BEdxDI49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A6E10E5EC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 13:51:07 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAjN57026343;
 Tue, 12 Aug 2025 15:50:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 bsmf5bLEhDcMHd8HjlloeMrrkwwKS55Kw0bi6W7zyHI=; b=BEdxDI49+ivpBhYl
 lQlrsoND1lt60NR5W6U0fJfJPvd5teua3okVdgsLT5gSPhoNLCBsFm2gYx+ovu6w
 8ToJvNbMtXXDvJEU3z7a3X/S1jolpYh+IzkfJwzGSBA25pSemXGkUnzrH7Q/TMK1
 1Bb4zknPNuTtVfUki7IH+JE0/qzId2TyhU2LLO3NbAb/xaza+cyqZlNQavjauFR0
 nJFHqgDVj6d8zppdUE0MGOM+lbSOGxMNNhvp7RStFOfkmRj5y32XbIyyHUnRsYIv
 nwsAGA4zm9ufSg45T8nArB6wEq1MkGpIoPXWIjb7H6LdwvCvDMiJxWqnuBSVZclH
 rycSiw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48eh9n8c1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Aug 2025 15:50:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D3B5940074;
 Tue, 12 Aug 2025 15:49:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 51D3B78C454;
 Tue, 12 Aug 2025 15:49:04 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 15:49:04 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 12 Aug 2025 15:49:04 +0200
Subject: [PATCH v2 07/13] drm/stm: ltdc: support new hardware version for
 STM32MP25 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-drm-misc-next-v2-7-132fd84463d7@foss.st.com>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
In-Reply-To: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
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

From: Yannick Fertre <yannick.fertre@foss.st.com>

STM32MP25 SoC features a new version of the LTDC IP.  Add its compatible
to the list of device to probe and implement its quirks.

This hardware supports a pad frequency of 150MHz and a peripheral bus
clock.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/drv.c  | 11 ++++++++++-
 drivers/gpu/drm/stm/ltdc.c | 37 ++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/stm/ltdc.h |  5 +++++
 3 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 8ebcaf953782d806a738d5a41ff1f428b0ccff78..8bfdeb486862a95df77427d25ce373e69e886c01 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -236,8 +236,17 @@ static void stm_drm_platform_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
 }
 
+static struct ltdc_plat_data stm_drm_plat_data = {
+	.pad_max_freq_hz = 90000000,
+};
+
+static struct ltdc_plat_data stm_drm_plat_data_mp25 = {
+	.pad_max_freq_hz = 150000000,
+};
+
 static const struct of_device_id drv_dt_ids[] = {
-	{ .compatible = "st,stm32-ltdc"},
+	{ .compatible = "st,stm32-ltdc", .data = &stm_drm_plat_data, },
+	{ .compatible = "st,stm32mp251-ltdc", .data = &stm_drm_plat_data_mp25, },
 	{ /* end node */ },
 };
 MODULE_DEVICE_TABLE(of, drv_dt_ids);
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index ba315c66a04d72758b9d3cfcd842432877f66d3a..74e93f076b62a46e7835985d9d330ba66d990e58 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
@@ -51,6 +52,7 @@
 #define HWVER_10300 0x010300
 #define HWVER_20101 0x020101
 #define HWVER_40100 0x040100
+#define HWVER_40101 0x040101
 
 /*
  * The address of some registers depends on the HW version: such registers have
@@ -1779,6 +1781,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 {
 	struct ltdc_device *ldev = ddev->dev_private;
 	u32 bus_width_log2, lcr, gc2r;
+	const struct ltdc_plat_data *pdata = of_device_get_match_data(ddev->dev);
 
 	/*
 	 * at least 1 layer must be managed & the number of layers
@@ -1794,6 +1797,8 @@ static int ltdc_get_caps(struct drm_device *ddev)
 	ldev->caps.bus_width = 8 << bus_width_log2;
 	regmap_read(ldev->regmap, LTDC_IDR, &ldev->caps.hw_version);
 
+	ldev->caps.pad_max_freq_hz = pdata->pad_max_freq_hz;
+
 	switch (ldev->caps.hw_version) {
 	case HWVER_10200:
 	case HWVER_10300:
@@ -1811,7 +1816,6 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		 * does not work on 2nd layer.
 		 */
 		ldev->caps.non_alpha_only_l1 = true;
-		ldev->caps.pad_max_freq_hz = 90000000;
 		if (ldev->caps.hw_version == HWVER_10200)
 			ldev->caps.pad_max_freq_hz = 65000000;
 		ldev->caps.nb_irq = 2;
@@ -1842,6 +1846,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.fifo_threshold = false;
 		break;
 	case HWVER_40100:
+	case HWVER_40101:
 		ldev->caps.layer_ofs = LAY_OFS_1;
 		ldev->caps.layer_regs = ltdc_layer_regs_a2;
 		ldev->caps.pix_fmt_hw = ltdc_pix_fmt_a2;
@@ -1849,7 +1854,6 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.pix_fmt_nb = ARRAY_SIZE(ltdc_drm_fmt_a2);
 		ldev->caps.pix_fmt_flex = true;
 		ldev->caps.non_alpha_only_l1 = false;
-		ldev->caps.pad_max_freq_hz = 90000000;
 		ldev->caps.nb_irq = 2;
 		ldev->caps.ycbcr_input = true;
 		ldev->caps.ycbcr_output = true;
@@ -1872,6 +1876,8 @@ void ltdc_suspend(struct drm_device *ddev)
 
 	DRM_DEBUG_DRIVER("\n");
 	clk_disable_unprepare(ldev->pixel_clk);
+	if (ldev->bus_clk)
+		clk_disable_unprepare(ldev->bus_clk);
 }
 
 int ltdc_resume(struct drm_device *ddev)
@@ -1887,7 +1893,13 @@ int ltdc_resume(struct drm_device *ddev)
 		return ret;
 	}
 
-	return 0;
+	if (ldev->bus_clk) {
+		ret = clk_prepare_enable(ldev->bus_clk);
+		if (ret)
+			drm_err(ddev, "failed to enable bus clock (%d)\n", ret);
+	}
+
+	return ret;
 }
 
 int ltdc_load(struct drm_device *ddev)
@@ -1922,6 +1934,19 @@ int ltdc_load(struct drm_device *ddev)
 		return -ENODEV;
 	}
 
+	if (of_device_is_compatible(np, "st,stm32mp251-ltdc")) {
+		ldev->bus_clk = devm_clk_get(dev, "bus");
+		if (IS_ERR(ldev->bus_clk))
+			return dev_err_probe(dev, PTR_ERR(ldev->bus_clk),
+					     "Unable to get bus clock\n");
+
+		ret = clk_prepare_enable(ldev->bus_clk);
+		if (ret) {
+			drm_err(ddev, "Unable to prepare bus clock\n");
+			return ret;
+		}
+	}
+
 	/* Get endpoints if any */
 	for (i = 0; i < nb_endpoints; i++) {
 		ret = drm_of_find_panel_or_bridge(np, 0, i, &panel, &bridge);
@@ -2034,6 +2059,9 @@ int ltdc_load(struct drm_device *ddev)
 
 	clk_disable_unprepare(ldev->pixel_clk);
 
+	if (ldev->bus_clk)
+		clk_disable_unprepare(ldev->bus_clk);
+
 	pinctrl_pm_select_sleep_state(ddev->dev);
 
 	pm_runtime_enable(ddev->dev);
@@ -2042,6 +2070,9 @@ int ltdc_load(struct drm_device *ddev)
 err:
 	clk_disable_unprepare(ldev->pixel_clk);
 
+	if (ldev->bus_clk)
+		clk_disable_unprepare(ldev->bus_clk);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index 9d488043ffdbc652deeede71c9d57d45fb89d3c6..ddfa8ae61a7ba5dc446fae647562d0ec8e6953e1 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -40,10 +40,15 @@ struct fps_info {
 	ktime_t last_timestamp;
 };
 
+struct ltdc_plat_data {
+	int pad_max_freq_hz;	/* max frequency supported by pad */
+};
+
 struct ltdc_device {
 	void __iomem *regs;
 	struct regmap *regmap;
 	struct clk *pixel_clk;	/* lcd pixel clock */
+	struct clk *bus_clk;	/* bus clock */
 	struct mutex err_lock;	/* protecting error_status */
 	struct ltdc_caps caps;
 	u32 irq_status;

-- 
2.25.1

