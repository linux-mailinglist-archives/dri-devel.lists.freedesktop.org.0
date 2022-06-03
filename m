Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3353CAF8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 15:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D7410E039;
	Fri,  3 Jun 2022 13:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F001710E039
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 13:56:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2539FhGn004989;
 Fri, 3 Jun 2022 15:56:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=zxXBZIxiiFU9jTGOLwVu6wmqjFEBW5aoI6bWAI0F5LU=;
 b=MoK2Uli10VlY7rIqB4YzbPWTkoD9tZ9ClcT5R/bUlHWehXQIseiP4S6eOGuwY580t3f9
 jvIa4aSRwQUI8znXxhh4LIHWR6UCOf5KeQU4Kou66QN0ySWhssXBFk0gNJYDJrDGHSjA
 Lz2+X/52dK1Fs1RMYy6DN9W6nD3FSnANB+t2VQLPR/CIwPjwHhJi6roPtMgXpSAnSuik
 /lTVKOrOwUK1BnPhdEoOlo+Lge6zum27A5yudTo2retXFcnDGm0hrT27nbU1Phs5M6kp
 uB2lpmLmtx7dqeOLrpLIAm6vzSN/LDxyihKmI+hRAVv8e9iX+1yIcTsCfzE56zwnKYMQ yg== 
Received: from beta.dmz-eu.st.com ([164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gbc516e9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jun 2022 15:56:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2831410007C;
 Fri,  3 Jun 2022 15:47:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DF8B226FB3;
 Fri,  3 Jun 2022 15:46:57 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 3 Jun
 2022 15:46:57 +0200
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: ltdc: update hardware error management
Date: Fri, 3 Jun 2022 15:46:54 +0200
Message-ID: <20220603134654.594373-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_04,2022-06-03_01,2022-02-23_01
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

The latest hardware version (0x40100) supports a hardware threshold
register (aka FUTR) to trigger a fifo underrun interrupt.
A software threshold has been implemented for other hardware versions.
The threshold is set to 128 by default.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 90 ++++++++++++++++++++++++++++++--------
 drivers/gpu/drm/stm/ltdc.h |  6 ++-
 2 files changed, 77 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index ff2075dd9474..42a3bd515477 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -162,16 +162,20 @@
 #define BCCR_BCWHITE	GENMASK(23, 0)	/* Background Color WHITE */
 
 #define IER_LIE		BIT(0)		/* Line Interrupt Enable */
-#define IER_FUIE	BIT(1)		/* Fifo Underrun Interrupt Enable */
+#define IER_FUWIE	BIT(1)		/* Fifo Underrun Warning Interrupt Enable */
 #define IER_TERRIE	BIT(2)		/* Transfer ERRor Interrupt Enable */
-#define IER_RRIE	BIT(3)		/* Register Reload Interrupt enable */
+#define IER_RRIE	BIT(3)		/* Register Reload Interrupt Enable */
+#define IER_FUEIE	BIT(6)		/* Fifo Underrun Error Interrupt Enable */
+#define IER_CRCIE	BIT(7)		/* CRC Error Interrupt Enable */
 
 #define CPSR_CYPOS	GENMASK(15, 0)	/* Current Y position */
 
 #define ISR_LIF		BIT(0)		/* Line Interrupt Flag */
-#define ISR_FUIF	BIT(1)		/* Fifo Underrun Interrupt Flag */
+#define ISR_FUWIF	BIT(1)		/* Fifo Underrun Warning Interrupt Flag */
 #define ISR_TERRIF	BIT(2)		/* Transfer ERRor Interrupt Flag */
 #define ISR_RRIF	BIT(3)		/* Register Reload Interrupt Flag */
+#define ISR_FUEIF	BIT(6)		/* Fifo Underrun Error Interrupt Flag */
+#define ISR_CRCIF	BIT(7)		/* CRC Error Interrupt Flag */
 
 #define EDCR_OCYEN	BIT(25)		/* Output Conversion to YCbCr 422: ENable */
 #define EDCR_OCYSEL	BIT(26)		/* Output Conversion to YCbCr 422: SELection of the CCIR */
@@ -231,6 +235,8 @@
 
 #define NB_PF		8		/* Max nb of HW pixel format */
 
+#define FUT_DFT		128		/* Default value of fifo underrun threshold */
+
 /*
  * Skip the first value and the second in case CRC was enabled during
  * the thread irq. This is to be sure CRC value is relevant for the
@@ -711,12 +717,13 @@ static irqreturn_t ltdc_irq_thread(int irq, void *arg)
 			ltdc_irq_crc_handle(ldev, crtc);
 	}
 
-	/* Save FIFO Underrun & Transfer Error status */
 	mutex_lock(&ldev->err_lock);
-	if (ldev->irq_status & ISR_FUIF)
-		ldev->error_status |= ISR_FUIF;
 	if (ldev->irq_status & ISR_TERRIF)
-		ldev->error_status |= ISR_TERRIF;
+		ldev->transfer_err++;
+	if (ldev->irq_status & ISR_FUEIF)
+		ldev->fifo_err++;
+	if (ldev->irq_status & ISR_FUWIF)
+		ldev->fifo_warn++;
 	mutex_unlock(&ldev->err_lock);
 
 	return IRQ_HANDLED;
@@ -775,7 +782,7 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
 	regmap_write(ldev->regmap, LTDC_BCCR, BCCR_BCBLACK);
 
 	/* Enable IRQ */
-	regmap_set_bits(ldev->regmap, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
+	regmap_set_bits(ldev->regmap, LTDC_IER, IER_FUWIE | IER_FUEIE | IER_RRIE | IER_TERRIE);
 
 	/* Commit shadow registers = update planes at next vblank */
 	if (!ldev->caps.plane_reg_shadow)
@@ -801,13 +808,20 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc *crtc,
 				  LXCR_CLUTEN | LXCR_LEN, 0);
 
 	/* disable IRQ */
-	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
+	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_FUWIE | IER_FUEIE | IER_RRIE | IER_TERRIE);
 
 	/* immediately commit disable of layers before switching off LTDC */
 	if (!ldev->caps.plane_reg_shadow)
 		regmap_set_bits(ldev->regmap, LTDC_SRCR, SRCR_IMR);
 
 	pm_runtime_put_sync(ddev->dev);
+
+	/*  clear interrupt error counters */
+	mutex_lock(&ldev->err_lock);
+	ldev->transfer_err = 0;
+	ldev->fifo_err = 0;
+	ldev->fifo_warn = 0;
+	mutex_unlock(&ldev->err_lock);
 }
 
 #define CLK_TOLERANCE_HZ 50
@@ -1168,6 +1182,18 @@ static int ltdc_crtc_verify_crc_source(struct drm_crtc *crtc,
 	return 0;
 }
 
+static void ltdc_crtc_atomic_print_state(struct drm_printer *p,
+					 const struct drm_crtc_state *state)
+{
+	struct drm_crtc *crtc = state->crtc;
+	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
+
+	drm_printf(p, "\ttransfer_error=%d\n", ldev->transfer_err);
+	drm_printf(p, "\tfifo_underrun_error=%d\n", ldev->fifo_err);
+	drm_printf(p, "\tfifo_underrun_warning=%d\n", ldev->fifo_warn);
+	drm_printf(p, "\tfifo_underrun_threshold=%d\n", ldev->fifo_threshold);
+}
+
 static const struct drm_crtc_funcs ltdc_crtc_funcs = {
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
@@ -1178,6 +1204,7 @@ static const struct drm_crtc_funcs ltdc_crtc_funcs = {
 	.enable_vblank = ltdc_crtc_enable_vblank,
 	.disable_vblank = ltdc_crtc_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+	.atomic_print_state = ltdc_crtc_atomic_print_state,
 };
 
 static const struct drm_crtc_funcs ltdc_crtc_with_crc_support_funcs = {
@@ -1192,6 +1219,7 @@ static const struct drm_crtc_funcs ltdc_crtc_with_crc_support_funcs = {
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 	.set_crc_source = ltdc_crtc_set_crc_source,
 	.verify_crc_source = ltdc_crtc_verify_crc_source,
+	.atomic_print_state = ltdc_crtc_atomic_print_state,
 };
 
 /*
@@ -1452,13 +1480,21 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	ldev->plane_fpsi[plane->index].counter++;
 
 	mutex_lock(&ldev->err_lock);
-	if (ldev->error_status & ISR_FUIF) {
-		DRM_WARN("ltdc fifo underrun: please verify display mode\n");
-		ldev->error_status &= ~ISR_FUIF;
+	if (ldev->transfer_err) {
+		DRM_WARN("ltdc transfer error: %d\n", ldev->transfer_err);
+		ldev->transfer_err = 0;
 	}
-	if (ldev->error_status & ISR_TERRIF) {
-		DRM_WARN("ltdc transfer error\n");
-		ldev->error_status &= ~ISR_TERRIF;
+
+	if (ldev->caps.fifo_threshold) {
+		if (ldev->fifo_err) {
+			DRM_WARN("ltdc fifo underrun: please verify display mode\n");
+			ldev->fifo_err = 0;
+		}
+	} else {
+		if (ldev->fifo_warn >= ldev->fifo_threshold) {
+			DRM_WARN("ltdc fifo underrun: please verify display mode\n");
+			ldev->fifo_warn = 0;
+		}
 	}
 	mutex_unlock(&ldev->err_lock);
 }
@@ -1700,6 +1736,10 @@ static void ltdc_encoder_enable(struct drm_encoder *encoder)
 
 	DRM_DEBUG_DRIVER("\n");
 
+	/* set fifo underrun threshold register */
+	if (ldev->caps.fifo_threshold)
+		regmap_write(ldev->regmap, LTDC_FUT, ldev->fifo_threshold);
+
 	/* Enable LTDC */
 	regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_LTDCEN);
 }
@@ -1801,6 +1841,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.crc = false;
 		ldev->caps.dynamic_zorder = false;
 		ldev->caps.plane_rotation = false;
+		ldev->caps.fifo_threshold = false;
 		break;
 	case HWVER_20101:
 		ldev->caps.layer_ofs = LAY_OFS_0;
@@ -1818,6 +1859,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.crc = false;
 		ldev->caps.dynamic_zorder = false;
 		ldev->caps.plane_rotation = false;
+		ldev->caps.fifo_threshold = false;
 		break;
 	case HWVER_40100:
 		ldev->caps.layer_ofs = LAY_OFS_1;
@@ -1835,6 +1877,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.crc = true;
 		ldev->caps.dynamic_zorder = true;
 		ldev->caps.plane_rotation = true;
+		ldev->caps.fifo_threshold = true;
 		break;
 	default:
 		return -ENODEV;
@@ -1959,9 +2002,6 @@ int ltdc_load(struct drm_device *ddev)
 		goto err;
 	}
 
-	/* Disable interrupts */
-	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_LIE | IER_RRIE | IER_FUIE | IER_TERRIE);
-
 	ret = ltdc_get_caps(ddev);
 	if (ret) {
 		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
@@ -1969,8 +2009,22 @@ int ltdc_load(struct drm_device *ddev)
 		goto err;
 	}
 
+	/* Disable interrupts */
+	if (ldev->caps.fifo_threshold)
+		regmap_clear_bits(ldev->regmap, LTDC_IER, IER_LIE | IER_RRIE | IER_FUWIE |
+				  IER_TERRIE);
+	else
+		regmap_clear_bits(ldev->regmap, LTDC_IER, IER_LIE | IER_RRIE | IER_FUWIE |
+				  IER_TERRIE | IER_FUEIE);
+
 	DRM_DEBUG_DRIVER("ltdc hw version 0x%08x\n", ldev->caps.hw_version);
 
+	/* initialize default value for fifo underrun threshold & clear interrupt error counters */
+	ldev->transfer_err = 0;
+	ldev->fifo_err = 0;
+	ldev->fifo_warn = 0;
+	ldev->fifo_threshold = FUT_DFT;
+
 	for (i = 0; i < ldev->caps.nb_irq; i++) {
 		irq = platform_get_irq(pdev, i);
 		if (irq < 0) {
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index 15139980d8ea..9d488043ffdb 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -30,6 +30,7 @@ struct ltdc_caps {
 	bool crc;		/* cyclic redundancy check supported */
 	bool dynamic_zorder;	/* dynamic z-order */
 	bool plane_rotation;	/* plane rotation */
+	bool fifo_threshold;	/* fifo underrun threshold supported */
 };
 
 #define LTDC_MAX_LAYER	4
@@ -45,8 +46,11 @@ struct ltdc_device {
 	struct clk *pixel_clk;	/* lcd pixel clock */
 	struct mutex err_lock;	/* protecting error_status */
 	struct ltdc_caps caps;
-	u32 error_status;
 	u32 irq_status;
+	u32 fifo_err;		/* fifo underrun error counter */
+	u32 fifo_warn;		/* fifo underrun warning counter */
+	u32 fifo_threshold;	/* fifo underrun threshold */
+	u32 transfer_err;	/* transfer error counter */
 	struct fps_info plane_fpsi[LTDC_MAX_LAYER];
 	struct drm_atomic_state *suspend_state;
 	int crc_skip_count;
-- 
2.25.1

