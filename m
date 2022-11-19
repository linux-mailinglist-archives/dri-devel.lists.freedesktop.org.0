Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683BE630FCC
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B9C10E265;
	Sat, 19 Nov 2022 17:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E9A10E223
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:30:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AJHURfD044530;
 Sat, 19 Nov 2022 11:30:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1668879027;
 bh=D9ZyX0wBs3EplpLG15CONOiel8aVOX8ofYFMqLgEwAg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=uMOf1I7LmJURNGIdSj6/Bn2hg0CnterCpMOBoywVhToR74LyoDJN735sjAHToYNwl
 wFBMgkfL+4navuM9BgKlxJRqbdpBG8sRkDvdMt2QUGxrjreKpdf9uH89tiTa18Shmi
 VoBFcleb9hByX/FcmmdFGQfWXLl5TMcRO4tb+mY8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AJHURHi011376
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 19 Nov 2022 11:30:27 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 19
 Nov 2022 11:30:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 19 Nov 2022 11:30:27 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AJHUQIn080179;
 Sat, 19 Nov 2022 11:30:26 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 4/5] drm/tidss: Add IO CTRL and Power support for OLDI TX
 in am625
Date: Sat, 19 Nov 2022 23:00:18 +0530
Message-ID: <20221119173019.15643-5-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119173019.15643-1-a-bhatia1@ti.com>
References: <20221119173019.15643-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ctrl mmr module of the AM625 is different from the AM65X SoC. Thus
the ctrl mmr registers that supported the OLDI TX power have become
different in AM625 SoC.

Add IO CTRL support and control the OLDI TX power for AM625.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c      | 55 ++++++++++++++++++------
 drivers/gpu/drm/tidss/tidss_dispc_regs.h | 37 +++++++++++-----
 2 files changed, 70 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 472226a83251..f26129fb1d8f 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -930,21 +930,52 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
 
 static void dispc_oldi_tx_power(struct dispc_device *dispc, bool power)
 {
-	u32 val = power ? 0 : OLDI_PWRDN_TX;
+	u32 val;
 
 	if (WARN_ON(!dispc->oldi_io_ctrl))
 		return;
 
-	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT0_IO_CTRL,
-			   OLDI_PWRDN_TX, val);
-	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT1_IO_CTRL,
-			   OLDI_PWRDN_TX, val);
-	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT2_IO_CTRL,
-			   OLDI_PWRDN_TX, val);
-	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT3_IO_CTRL,
-			   OLDI_PWRDN_TX, val);
-	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_CLK_IO_CTRL,
-			   OLDI_PWRDN_TX, val);
+	if (dispc->feat->subrev == DISPC_AM65X) {
+		val = power ? 0 : AM65X_OLDI_PWRDN_TX;
+
+		regmap_update_bits(dispc->oldi_io_ctrl, AM65X_OLDI_DAT0_IO_CTRL,
+				   AM65X_OLDI_PWRDN_TX, val);
+		regmap_update_bits(dispc->oldi_io_ctrl, AM65X_OLDI_DAT1_IO_CTRL,
+				   AM65X_OLDI_PWRDN_TX, val);
+		regmap_update_bits(dispc->oldi_io_ctrl, AM65X_OLDI_DAT2_IO_CTRL,
+				   AM65X_OLDI_PWRDN_TX, val);
+		regmap_update_bits(dispc->oldi_io_ctrl, AM65X_OLDI_DAT3_IO_CTRL,
+				   AM65X_OLDI_PWRDN_TX, val);
+		regmap_update_bits(dispc->oldi_io_ctrl, AM65X_OLDI_CLK_IO_CTRL,
+				   AM65X_OLDI_PWRDN_TX, val);
+
+	} else if (dispc->feat->subrev == DISPC_AM625) {
+		if (power) {
+			switch (dispc->oldi_mode) {
+			case OLDI_SINGLE_LINK_SINGLE_MODE:
+				/* Power down OLDI TX 1 */
+				val = AM625_OLDI1_PWRDN_TX;
+				break;
+
+			case OLDI_SINGLE_LINK_CLONE_MODE:
+			case OLDI_DUAL_LINK_MODE:
+				/* No Power down */
+				val = 0;
+				break;
+
+			default:
+				/* Power down both the OLDI TXes */
+				val = AM625_OLDI0_PWRDN_TX | AM625_OLDI1_PWRDN_TX;
+				break;
+			}
+		} else {
+			/* Power down both the OLDI TXes */
+			val = AM625_OLDI0_PWRDN_TX | AM625_OLDI1_PWRDN_TX;
+		}
+
+		regmap_update_bits(dispc->oldi_io_ctrl, AM625_OLDI_PD_CTRL,
+				   AM625_OLDI0_PWRDN_TX | AM625_OLDI1_PWRDN_TX, val);
+	}
 }
 
 static void dispc_set_num_datalines(struct dispc_device *dispc,
@@ -2841,7 +2872,7 @@ int dispc_init(struct tidss_device *tidss)
 		dispc->vp_data[i].gamma_table = gamma_table;
 	}
 
-	if (feat->subrev == DISPC_AM65X) {
+	if (feat->oldi_supported) {
 		r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
 		if (r)
 			return r;
diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
index 13feedfe5d6d..ccc4f29b7f1b 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
@@ -227,17 +227,34 @@ enum dispc_common_regs {
 #define DISPC_VP_DSS_DMA_THREADSIZE_STATUS	0x174 /* J721E */
 
 /*
- * OLDI IO_CTRL register offsets. On AM654 the registers are found
- * from CTRL_MMR0, there the syscon regmap should map 0x14 bytes from
- * CTRLMMR0P1_OLDI_DAT0_IO_CTRL to CTRLMMR0P1_OLDI_CLK_IO_CTRL
- * register range.
+ * OLDI IO and PD CTRL register offsets.
+ * These registers are found in the CTRL_MMR0, where the syscon regmap should map
+ *
+ * 1. 0x14 bytes from CTRLMMR0P1_OLDI_DAT0_IO_CTRL to CTRLMMR0P1_OLDI_CLK_IO_CTRL
+ * register range for the AM65X DSS, and
+ *
+ * 2. 0x200 bytes from OLDI0_DAT0_IO_CTRL to OLDI_LB_CTRL register range for the
+ * AM625 DSS.
  */
-#define OLDI_DAT0_IO_CTRL			0x00
-#define OLDI_DAT1_IO_CTRL			0x04
-#define OLDI_DAT2_IO_CTRL			0x08
-#define OLDI_DAT3_IO_CTRL			0x0C
-#define OLDI_CLK_IO_CTRL			0x10
 
-#define OLDI_PWRDN_TX				BIT(8)
+/* -- For AM65X OLDI TX -- */
+/* Register offsets */
+#define AM65X_OLDI_DAT0_IO_CTRL			0x00
+#define AM65X_OLDI_DAT1_IO_CTRL			0x04
+#define AM65X_OLDI_DAT2_IO_CTRL			0x08
+#define AM65X_OLDI_DAT3_IO_CTRL			0x0C
+#define AM65X_OLDI_CLK_IO_CTRL			0x10
+
+/* Power control bits */
+#define AM65X_OLDI_PWRDN_TX			BIT(8)
+
+/* -- For AM625 OLDI TX -- */
+/* Register offsets */
+#define AM625_OLDI_PD_CTRL			0x100
+#define AM625_OLDI_LB_CTRL			0x104
+
+/* Power control bits */
+#define AM625_OLDI0_PWRDN_TX			BIT(0)
+#define AM625_OLDI1_PWRDN_TX			BIT(1)
 
 #endif /* __TIDSS_DISPC_REGS_H */
-- 
2.38.1

