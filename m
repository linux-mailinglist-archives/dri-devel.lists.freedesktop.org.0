Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD8686DB09
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 06:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AE010EAF9;
	Fri,  1 Mar 2024 05:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="dq+Dntda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEF910EAF1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 05:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709270788; x=1740806788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AL/4ZvvFwmCOmUaslwsy4E+8TUsYU2ExbAs2QfvPrCE=;
 b=dq+Dntdalrk5UnnOgyEzfMZZvcotIrEo535IGBXny9Fg4wpJcf92nD6c
 plftTtYcPcyw8dX3CbKlzd0k1k4H991G7B/TyO+C7Wa7AIXlMzhWUK372
 SRn/XvaOylzhu+YZHIUY5METK/DKLHO8J3Q3FBB5eQJZysWIfpeA69WKX
 35A3CwWLVYivRWUIG6c/ZcUFgVUHaILFhkSLEKimAtu1ixiR3TsXGBlqd
 oX7pedK4Dixnrm/mUpGUo5MBLeVzxvBXyMileHABe0Gd7sjno//5VbiCX
 LIy6MKGfpzHx2AxngNchA8ETMT35pU1ax7NIRUj39spEzXSG1UPOT9cR2 g==;
X-CSE-ConnectionGUID: epEW2Y4BQQKheh4DRATFNw==
X-CSE-MsgGUID: 2pog/TE/QoeBPFpdaKooqw==
X-IronPort-AV: E=Sophos;i="6.06,195,1705388400"; d="scan'208";a="247809237"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Feb 2024 22:26:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 22:26:11 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 22:26:02 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>, 
 <Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
 <Dharma.B@microchip.com>, <Varshini.Rajendran@microchip.com>,
 <Balakrishnan.S@microchip.com>, <Charan.Pedumuru@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>, Durai Manickam KR
 <durai.manickamkr@microchip.com>
Subject: [PATCH v9 2/8] drm: atmel-hlcdc: Define XLCDC specific registers
Date: Fri, 1 Mar 2024 10:55:28 +0530
Message-ID: <20240301052534.38651-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240301052534.38651-1-manikandan.m@microchip.com>
References: <20240301052534.38651-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

From: Durai Manickam KR <durai.manickamkr@microchip.com>

The register address of the XLCDC IP used in SAM9X7 SoC family
are different from the previous HLCDC. Defining those address
space with valid macros.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
[manikandan.m@microchip.com: Remove unused macro definitions]
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 42 ++++++++++++++++++++
 include/linux/mfd/atmel-hlcdc.h              | 10 +++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index d0ecf0f58cce..c32e5c8809d7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -15,6 +15,7 @@
 
 #include <drm/drm_plane.h>
 
+/* LCD controller common registers */
 #define ATMEL_HLCDC_LAYER_CHER			0x0
 #define ATMEL_HLCDC_LAYER_CHDR			0x4
 #define ATMEL_HLCDC_LAYER_CHSR			0x8
@@ -128,6 +129,47 @@
 
 #define ATMEL_HLCDC_MAX_LAYERS			6
 
+/* XLCDC controller specific registers */
+#define ATMEL_XLCDC_LAYER_ENR			0x10
+#define ATMEL_XLCDC_LAYER_EN			BIT(0)
+
+#define ATMEL_XLCDC_LAYER_IER			0x0
+#define ATMEL_XLCDC_LAYER_IDR			0x4
+#define ATMEL_XLCDC_LAYER_ISR			0xc
+#define ATMEL_XLCDC_LAYER_OVR_IRQ(p)		BIT(2 + (8 * (p)))
+
+#define ATMEL_XLCDC_LAYER_PLANE_ADDR(p)		(((p) * 0x4) + 0x18)
+
+#define ATMEL_XLCDC_LAYER_DMA_CFG		0
+
+#define ATMEL_XLCDC_LAYER_DMA			BIT(0)
+#define ATMEL_XLCDC_LAYER_REP			BIT(1)
+#define ATMEL_XLCDC_LAYER_DISCEN		BIT(4)
+
+#define ATMEL_XLCDC_LAYER_SFACTC_A0_MULT_AS	(4 << 6)
+#define ATMEL_XLCDC_LAYER_SFACTA_ONE		BIT(9)
+#define ATMEL_XLCDC_LAYER_DFACTC_M_A0_MULT_AS	(6 << 11)
+#define ATMEL_XLCDC_LAYER_DFACTA_ONE		BIT(14)
+
+#define ATMEL_XLCDC_LAYER_A0_SHIFT		16
+#define ATMEL_XLCDC_LAYER_A0(x)			\
+	((x) << ATMEL_XLCDC_LAYER_A0_SHIFT)
+
+#define ATMEL_XLCDC_LAYER_VSCALER_LUMA_ENABLE		BIT(0)
+#define ATMEL_XLCDC_LAYER_VSCALER_CHROMA_ENABLE		BIT(1)
+#define ATMEL_XLCDC_LAYER_HSCALER_LUMA_ENABLE		BIT(4)
+#define ATMEL_XLCDC_LAYER_HSCALER_CHROMA_ENABLE		BIT(5)
+
+#define ATMEL_XLCDC_LAYER_VXSYCFG_ONE		BIT(0)
+#define ATMEL_XLCDC_LAYER_VXSYTAP2_ENABLE	BIT(4)
+#define ATMEL_XLCDC_LAYER_VXSCCFG_ONE		BIT(16)
+#define ATMEL_XLCDC_LAYER_VXSCTAP2_ENABLE	BIT(20)
+
+#define ATMEL_XLCDC_LAYER_HXSYCFG_ONE		BIT(0)
+#define ATMEL_XLCDC_LAYER_HXSYTAP2_ENABLE	BIT(4)
+#define ATMEL_XLCDC_LAYER_HXSCCFG_ONE		BIT(16)
+#define ATMEL_XLCDC_LAYER_HXSCTAP2_ENABLE	BIT(20)
+
 /**
  * Atmel HLCDC Layer registers layout structure
  *
diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
index a186119a49b5..80d675a03b39 100644
--- a/include/linux/mfd/atmel-hlcdc.h
+++ b/include/linux/mfd/atmel-hlcdc.h
@@ -22,6 +22,8 @@
 #define ATMEL_HLCDC_DITHER		BIT(6)
 #define ATMEL_HLCDC_DISPDLY		BIT(7)
 #define ATMEL_HLCDC_MODE_MASK		GENMASK(9, 8)
+#define ATMEL_XLCDC_MODE_MASK		GENMASK(10, 8)
+#define ATMEL_XLCDC_DPI			BIT(11)
 #define ATMEL_HLCDC_PP			BIT(10)
 #define ATMEL_HLCDC_VSPSU		BIT(12)
 #define ATMEL_HLCDC_VSPHO		BIT(13)
@@ -34,6 +36,12 @@
 #define ATMEL_HLCDC_IDR			0x30
 #define ATMEL_HLCDC_IMR			0x34
 #define ATMEL_HLCDC_ISR			0x38
+#define ATMEL_XLCDC_ATTRE		0x3c
+
+#define ATMEL_XLCDC_BASE_UPDATE		BIT(0)
+#define ATMEL_XLCDC_OVR1_UPDATE		BIT(1)
+#define ATMEL_XLCDC_OVR3_UPDATE		BIT(2)
+#define ATMEL_XLCDC_HEO_UPDATE		BIT(3)
 
 #define ATMEL_HLCDC_CLKPOL		BIT(0)
 #define ATMEL_HLCDC_CLKSEL		BIT(2)
@@ -48,6 +56,8 @@
 #define ATMEL_HLCDC_DISP		BIT(2)
 #define ATMEL_HLCDC_PWM			BIT(3)
 #define ATMEL_HLCDC_SIP			BIT(4)
+#define ATMEL_XLCDC_SD			BIT(5)
+#define ATMEL_XLCDC_CM			BIT(6)
 
 #define ATMEL_HLCDC_SOF			BIT(0)
 #define ATMEL_HLCDC_SYNCDIS		BIT(1)
-- 
2.25.1

