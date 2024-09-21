Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB7797DC22
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 10:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E320710E27F;
	Sat, 21 Sep 2024 08:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k5palarg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126BB10E15F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 08:17:40 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-536a2759f0eso3644242e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726906658; x=1727511458; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Od53nvDeJ6X0bdgIyj/l8ko1IVye/qAo8uvg9IuTxGE=;
 b=k5palarg7HBuVQwmZt+mO383HRijbI0z1qm39ZRt9uECyWtqZ1u7VJtRO8mn1Vq/BP
 NMQl/3Vtj/urGMd0qmA25AH8NXTyN/RTHuHGkG7WtjA/Dd75jkjP4Tm7P4Wn4eaRwgXn
 KcgoixwnAokzPllFgXG2bA+efSiKl+V0soVftqxbfudog6oxMWJpuILj2wHkbdpv0NAS
 PzfeEN50DTzR01j3lHl/nwUpoD860VvZMIi8cO1Puoa8guFS99cDl/JAXuqgjZYrVekX
 oJUs/BKGvlB11pzd1InHwWbtUcmkbMqpMEPECK81WHNGIGeq7jj49ZFJEoWEJ34STdmV
 6XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726906658; x=1727511458;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Od53nvDeJ6X0bdgIyj/l8ko1IVye/qAo8uvg9IuTxGE=;
 b=N2ABAYb8+0dZgY5PMLqFf5KJ9CSfLlNjGXaEb7Z6mCVlWVlxiF8kxbOJM7N6aBIevu
 yAPZtOWqpAMViWwjMGmfDdys2nK2UsrFruK/TOZ9AB/dh2AP4eAlSIfJtoxAZWTwGcwK
 m1bguRk7lKJsSqqUenl9/3HWItHIt7PsfoQOI3bp4IOegD+zhPtuWmr+HsjVSB9EuT3c
 VIn8P3Wq4UyZaBwffgZ+nXsH25XQKXPscvioeGWuZP7qMK61Q+N6uyO2CDgQk8m+ARQh
 Y6vZsu5rMZoDrSMQutJpJOb5mc5vB9NjzC1PbGdrz+GkjtD79uSMUeILyhzxS6aUKOF/
 95KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Ajl+HzhOurzK5Z3d9o/DuDsvNEgad4jPYcf/l+ktqVIQtyMPtn9QY/vZjq8lOaSviGGp3CG98YM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKsl612sJlDWbUKKHrY/JJWrpEker6rcyEZ0tABmo/E4Y246Yg
 klNaOnEwXihVzrxzyGVHsc2UDiuF3jOxGDROKoIMdbx0lingiczSmR3FPMcJ2Po=
X-Google-Smtp-Source: AGHT+IETJ3Ky8mWo/JLPiPgVUT28m25lTztokOWEmapijuMHe9ti1rkaEQDPEbL5hoAyCuOwe3QvXQ==
X-Received: by 2002:a05:6512:2208:b0:536:14a1:d645 with SMTP id
 2adb3069b0e04-536ad3c9aefmr2997424e87.44.1726906658018; 
 Sat, 21 Sep 2024 01:17:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870968d1sm2466380e87.175.2024.09.21.01.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 01:17:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 21 Sep 2024 11:17:30 +0300
Subject: [PATCH 2/4] drm/msm/mdss: use register definitions instead of
 hand-coding them
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240921-msm-mdss-ubwc-v1-2-411dcf309d05@linaro.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
In-Reply-To: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4880;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=G6PowQr5FW3NdBDRADRSrKvw2U+ewXo5XcoYzvoJ6Pw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm7oEf05dbGt5Lc6aHVGnCmSnC98kTf0qX6d9UE
 NnCD/w7AaqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZu6BHwAKCRCLPIo+Aiko
 1dcDCACg5ArOXMPZTRiJhXhrpweO8bTOXVhdYdh/WLR70YN5xSIeKiL6XFSJMwK2Sf/5QdIPwit
 nyF2N7SRgIbtc5i6+CPjY1UnAd4jC3KbAJYj5xXbEvcse3JL7J69jyo9EjN+3fkdRpGdaebVPtJ
 gvge8Of9xdqhu4ruDUrXLtOhly39eJNgQuZp4IaSLE+7uSWXfPbUXte0KdBVEwvLKobTzVjBfn0
 xA5B6HQSvB6Jazb6SxWSGLE+lYFDlPIQdF79sOxj2e10qYxDDVY3te0rhlXJ96j6aAtZHe4z5x7
 Xu2D+JHnnr5aRg2XxLNx2zE4tc/6TsbAe2E3UD2sKbf10bkE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Move existing register definitions to mdss.xml and use generated defines
for registers access instead of hand-coding everything in the source
file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c                 | 35 +++++++++++---------------
 drivers/gpu/drm/msm/registers/display/mdss.xml |  6 +++++
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index faa88fd6eb4d..ca9b7f953ac4 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -19,13 +19,7 @@
 #include "msm_mdss.h"
 #include "msm_kms.h"
 
-#define HW_REV				0x0
-#define HW_INTR_STATUS			0x0010
-
-#define UBWC_DEC_HW_VERSION		0x58
-#define UBWC_STATIC			0x144
-#define UBWC_CTRL_2			0x150
-#define UBWC_PREDICTION_MODE		0x154
+#include <generated/mdss.xml.h>
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
@@ -83,7 +77,7 @@ static void msm_mdss_irq(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	interrupts = readl_relaxed(msm_mdss->mmio + HW_INTR_STATUS);
+	interrupts = readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_INTR_STATUS);
 
 	while (interrupts) {
 		irq_hw_number_t hwirq = fls(interrupts) - 1;
@@ -173,7 +167,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 
-	writel_relaxed(data->ubwc_static, msm_mdss->mmio + UBWC_STATIC);
+	writel_relaxed(data->ubwc_static, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
@@ -189,7 +183,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= BIT(8);
 
-	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
 static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
@@ -200,21 +194,22 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 		    (data->highest_bank_bit & 0x7) << 4 |
 		    (data->macrotile_mode & 0x1) << 12;
 
-	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
 	if (data->ubwc_enc_version == UBWC_3_0) {
-		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
-		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+		writel_relaxed(0, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 	} else {
 		if (data->ubwc_dec_version == UBWC_4_3)
-			writel_relaxed(3, msm_mdss->mmio + UBWC_CTRL_2);
+			writel_relaxed(3, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
 		else
-			writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
-		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+			writel_relaxed(2, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 	}
 }
 
-#define MDSS_HW_MAJ_MIN		GENMASK(31, 16)
+#define MDSS_HW_MAJ_MIN		\
+	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
 
 #define MDSS_HW_MSM8996		0x1007
 #define MDSS_HW_MSM8937		0x100e
@@ -235,7 +230,7 @@ static const struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_m
 	if (!data)
 		return NULL;
 
-	hw_rev = readl_relaxed(mdss->mmio + HW_REV);
+	hw_rev = readl_relaxed(mdss->mmio + REG_MDSS_HW_VERSION);
 	hw_rev = FIELD_GET(MDSS_HW_MAJ_MIN, hw_rev);
 
 	if (hw_rev == MDSS_HW_MSM8996 ||
@@ -334,9 +329,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
 		dev_err(msm_mdss->dev, "HW_REV: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + HW_REV));
+			readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION));
 		dev_err(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
+			readl_relaxed(msm_mdss->mmio + REG_MDSS_UBWC_DEC_HW_VERSION));
 		break;
 	}
 
diff --git a/drivers/gpu/drm/msm/registers/display/mdss.xml b/drivers/gpu/drm/msm/registers/display/mdss.xml
index 9354cfffb730..ac85caf1575c 100644
--- a/drivers/gpu/drm/msm/registers/display/mdss.xml
+++ b/drivers/gpu/drm/msm/registers/display/mdss.xml
@@ -18,6 +18,12 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="INTR_HDMI" pos="8"  type="boolean"/>
 		<bitfield name="INTR_EDP"  pos="12" type="boolean"/>
 	</reg32>
+
+	<reg32 offset="0x00058" name="UBWC_DEC_HW_VERSION"/>
+
+	<reg32 offset="0x00144" name="UBWC_STATIC"/>
+	<reg32 offset="0x00150" name="UBWC_CTRL_2"/>
+	<reg32 offset="0x00154" name="UBWC_PREDICTION_MODE"/>
 </domain>
 
 </database>

-- 
2.39.5

