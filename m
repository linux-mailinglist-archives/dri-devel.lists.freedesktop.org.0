Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA992FB06
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 15:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD7010EC8D;
	Fri, 12 Jul 2024 13:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="EirIIQ5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333CB10EC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 13:15:51 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46CCPFPl001787;
 Fri, 12 Jul 2024 15:15:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=S8i/Lg8lwGkalhd/HZ5Iw9
 958NPeO5Y47s52u8cAvsc=; b=EirIIQ5c6DNgea278fp+a/clNaD2qis0b5UGJf
 zwZhn7fx1MjcPWVB3IssJVnhhYLrm8CX4x3knkA+mfI84jI2yTl5WLxdJQMmZGnq
 9ENQP1yDkOKhNcsyQU8XI5JK5wKEILL//VMXpV3jyQ2h7Qel5IkVKbrcVzo9/Hl9
 esVqCCG6BoeD19VSrSMiiptQz/Jsmj9LWCo5CYzk2fCe6BYVen+m5rlt358dC2c8
 ao9nZqtCPPc5jnGdVs7CbXOoeP0zShjEouNZe0oYfiZ93rs51sqlZVGy34W9hBZC
 XBlrFImsXbn+qY6P+6h8hRw2LVAApM4zBAVxQcMnBhCsF52w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 406wj3anaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jul 2024 15:15:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AC8D14002D;
 Fri, 12 Jul 2024 15:15:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C35020CB2E;
 Fri, 12 Jul 2024 15:14:56 +0200 (CEST)
Received: from localhost (10.252.16.177) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 12 Jul
 2024 15:14:55 +0200
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: ltdc: remove reload interrupt
Date: Fri, 12 Jul 2024 15:14:53 +0200
Message-ID: <20240712131453.98597-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.16.177]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_09,2024-07-11_01,2024-05-17_01
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

The reload interrupt is not used by the driver. To avoid
unnecessary calls of the interrupt routine, don't enable it.
Solve small typo and add mask to simplify the driver.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 3876346a1303..3d9842427083 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -169,6 +169,7 @@
 #define IER_RRIE	BIT(3)		/* Register Reload Interrupt Enable */
 #define IER_FUEIE	BIT(6)		/* Fifo Underrun Error Interrupt Enable */
 #define IER_CRCIE	BIT(7)		/* CRC Error Interrupt Enable */
+#define IER_MASK (IER_LIE | IER_FUWIE | IER_TERRIE | IER_RRIE | IER_FUEIE | IER_CRCIE)
 
 #define CPSR_CYPOS	GENMASK(15, 0)	/* Current Y position */
 
@@ -785,7 +786,7 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
 	regmap_write(ldev->regmap, LTDC_BCCR, BCCR_BCBLACK);
 
 	/* Enable IRQ */
-	regmap_set_bits(ldev->regmap, LTDC_IER, IER_FUWIE | IER_FUEIE | IER_RRIE | IER_TERRIE);
+	regmap_set_bits(ldev->regmap, LTDC_IER, IER_FUWIE | IER_FUEIE | IER_TERRIE);
 
 	/* Commit shadow registers = update planes at next vblank */
 	if (!ldev->caps.plane_reg_shadow)
@@ -809,8 +810,8 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc *crtc,
 	for (layer_index = 0; layer_index < ldev->caps.nb_layers; layer_index++)
 		regmap_write_bits(ldev->regmap, LTDC_L1CR + layer_index * LAY_OFS, LXCR_MASK, 0);
 
-	/* disable IRQ */
-	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_FUWIE | IER_FUEIE | IER_RRIE | IER_TERRIE);
+	/* Disable IRQ */
+	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_FUWIE | IER_FUEIE | IER_TERRIE);
 
 	/* immediately commit disable of layers before switching off LTDC */
 	if (!ldev->caps.plane_reg_shadow)
@@ -2016,13 +2017,8 @@ int ltdc_load(struct drm_device *ddev)
 		goto err;
 	}
 
-	/* Disable interrupts */
-	if (ldev->caps.fifo_threshold)
-		regmap_clear_bits(ldev->regmap, LTDC_IER, IER_LIE | IER_RRIE | IER_FUWIE |
-				  IER_TERRIE);
-	else
-		regmap_clear_bits(ldev->regmap, LTDC_IER, IER_LIE | IER_RRIE | IER_FUWIE |
-				  IER_TERRIE | IER_FUEIE);
+	/* Disable all interrupts */
+	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_MASK);
 
 	DRM_DEBUG_DRIVER("ltdc hw version 0x%08x\n", ldev->caps.hw_version);
 
-- 
2.34.1

