Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4CB2F608
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8989710E92E;
	Thu, 21 Aug 2025 11:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="3GEp5mHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFAB10E929
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:12:30 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LAJcpq012185;
 Thu, 21 Aug 2025 13:12:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 uVfCJbInqjmalxCX55tfF2G5Qmv+BXNDRy6gsYqLKtg=; b=3GEp5mHQGqeJ2OHk
 8qXUT3pMhnigUDyMC3rO0TZ28BtYYqUOaM9TMOVTQwYLorOg2LgTKFuiYFKIVlos
 W2NH2Z1zuZkBSZ4tWuw/TEtLcrIBp6K6PSjJJDk/7KXpo5WW5SYsfibIvXibUAPC
 gnbDBC2BxBH34hViCqCS+KtJd0z/NkPl3W2hOk6HK9TzU9q4GLy7+GXd5aOnS1ou
 cnyp712S3TtSa1DIvleQMDHgZBWrsBrQY7zjZYuE5zNqvpGVwNtYIW9A1bKVbrc3
 sUKEH/sdT4CkxDFoRHL2Y4cZ7jJb9mA0hb9r7C3Y7ITyjMEBN2vOlCWpKddQ0eyv
 YwkoCA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nj3v3n8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Aug 2025 13:12:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE11340055;
 Thu, 21 Aug 2025 13:10:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6303974EF09;
 Thu, 21 Aug 2025 13:09:58 +0200 (CEST)
Received: from localhost (10.252.7.99) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 13:09:58 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 21 Aug 2025 13:08:58 +0200
Subject: [PATCH v4 08/13] drm/stm: ltdc: handle lvds pixel clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-drm-misc-next-v4-8-7060500f8fd3@foss.st.com>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.7.99]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
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

Handle LVDS pixel clock.

The LTDC operates with multiple clock domains for register access,
requiring all clocks to be provided during read/write operations.  This
imposes a dependency between the LVDS and LTDC to access correctly all
LTDC registers.  And because both IPs' pixel rates must be synchronized,
the LTDC has to handle the LVDS clock.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/stm/ltdc.h |  1 +
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 17548dd3484a0a3e1015c58c752b80f8892a0ff7..f84a9a8590f0653e422798ff61804d7c3966caef 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -837,6 +837,12 @@ ltdc_crtc_mode_valid(struct drm_crtc *crtc,
 	int target_max = target + CLK_TOLERANCE_HZ;
 	int result;
 
+	if (ldev->lvds_clk) {
+		result = clk_round_rate(ldev->lvds_clk, target);
+		drm_dbg_driver(crtc->dev, "lvds pixclk rate target %d, available %d\n",
+			       target, result);
+	}
+
 	result = clk_round_rate(ldev->pixel_clk, target);
 
 	DRM_DEBUG_DRIVER("clk rate target %d, available %d\n", target, result);
@@ -1878,6 +1884,8 @@ void ltdc_suspend(struct drm_device *ddev)
 	clk_disable_unprepare(ldev->pixel_clk);
 	if (ldev->bus_clk)
 		clk_disable_unprepare(ldev->bus_clk);
+	if (ldev->lvds_clk)
+		clk_disable_unprepare(ldev->lvds_clk);
 }
 
 int ltdc_resume(struct drm_device *ddev)
@@ -1895,8 +1903,16 @@ int ltdc_resume(struct drm_device *ddev)
 
 	if (ldev->bus_clk) {
 		ret = clk_prepare_enable(ldev->bus_clk);
-		if (ret)
+		if (ret) {
 			drm_err(ddev, "failed to enable bus clock (%d)\n", ret);
+			return ret;
+		}
+	}
+
+	if (ldev->lvds_clk) {
+		ret = clk_prepare_enable(ldev->lvds_clk);
+		if (ret)
+			drm_err(ddev, "failed to prepare lvds clock\n");
 	}
 
 	return ret;
@@ -1981,6 +1997,10 @@ int ltdc_load(struct drm_device *ddev)
 		}
 	}
 
+	ldev->lvds_clk = devm_clk_get(dev, "lvds");
+	if (IS_ERR(ldev->lvds_clk))
+		ldev->lvds_clk = NULL;
+
 	rstc = devm_reset_control_get_exclusive(dev, NULL);
 
 	mutex_init(&ldev->err_lock);
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index ddfa8ae61a7ba5dc446fae647562d0ec8e6953e1..17b51a7ce28eee5de6d24ca943ca3b1f48695dfd 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -48,6 +48,7 @@ struct ltdc_device {
 	void __iomem *regs;
 	struct regmap *regmap;
 	struct clk *pixel_clk;	/* lcd pixel clock */
+	struct clk *lvds_clk;	/* lvds pixel clock */
 	struct clk *bus_clk;	/* bus clock */
 	struct mutex err_lock;	/* protecting error_status */
 	struct ltdc_caps caps;

-- 
2.25.1

