Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FDA67B181
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBA310E79E;
	Wed, 25 Jan 2023 11:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A5010E797
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 11:36:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30PBZgRE120976;
 Wed, 25 Jan 2023 05:35:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1674646542;
 bh=FTzBSlhK5RUNaOUKZ3pnFEXS6CiPBc4U1DhXc8++ItA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=GSzg8IvGiNCdRbkWxof5dBN8Ig5to4fpWXX84D1easiyz13tKvOwYOptb3eOYlJNW
 ncyBytrtPZfrNu/4Ud0oYYNnFC/1FELPEZTgrF4PVxoQ8jsXGPpahRXqxLfxRiFHD8
 Obdgpf7zqRsf9rlsPkT5GExLsegTGEmmL+dUR8Tk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30PBZgYH013323
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 25 Jan 2023 05:35:42 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 05:35:42 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 05:35:41 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30PBZe69021889;
 Wed, 25 Jan 2023 05:35:41 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v7 5/6] drm/tidss: Add IO CTRL and Power support for OLDI TX
 in am625
Date: Wed, 25 Jan 2023 17:05:28 +0530
Message-ID: <20230125113529.13952-6-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125113529.13952-1-a-bhatia1@ti.com>
References: <20230125113529.13952-1-a-bhatia1@ti.com>
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
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ctrl mmr module of the AM625 is different from the AM65X SoC. Thus
the ctrl mmr registers that supported the OLDI TX power have become
different in AM625 SoC.

The common mode voltage of the LVDS buffers becomes random when the
bandgap reference is turned off. This causes uncertainity in the LVDS
Data and Clock signal outputs, making it behave differently under
different conditions and panel setups. The bandgap reference must be
powered on before using the OLDI IOs, to keep the common voltage trimmed
down to desired levels.

Add support to enable/disable OLDI IO signals as well as the bandgap
reference circuit for the LVDS signals.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---

Note:
- Dropped Tomi Valkeinen's reviewed-by tag in this patch because I did
  not implement one of his comments which suggested to remove the
  'oldi_supported' variable. While the oldi support is indeed based on
  SoC variations, keeping that variable helps take into account the case
  where an OLDI supporting SoC by-passes OLDI TXes and gives out DPI
  video signals straight from DSS.

 drivers/gpu/drm/tidss/tidss_dispc.c      | 57 +++++++++++++++++++-----
 drivers/gpu/drm/tidss/tidss_dispc_regs.h | 40 ++++++++++++-----
 2 files changed, 76 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 37a73e309330..0e03557bc142 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -934,21 +934,56 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
 
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
+			case OLDI_MODE_SINGLE_LINK:
+				/* Power down OLDI TX 1 */
+				val = AM625_OLDI1_PWRDN_TX;
+				break;
+
+			case OLDI_MODE_CLONE_SINGLE_LINK:
+			case OLDI_MODE_DUAL_LINK:
+				/* No Power down */
+				val = 0;
+				break;
+
+			default:
+				/* Power down both OLDI TXes and LVDS Bandgap */
+				val = AM625_OLDI0_PWRDN_TX | AM625_OLDI1_PWRDN_TX |
+				      AM625_OLDI_PWRDN_BG;
+				break;
+			}
+
+		} else {
+			/* Power down both OLDI TXes and LVDS Bandgap */
+			val = AM625_OLDI0_PWRDN_TX | AM625_OLDI1_PWRDN_TX |
+			      AM625_OLDI_PWRDN_BG;
+		}
+
+		regmap_update_bits(dispc->oldi_io_ctrl, AM625_OLDI_PD_CTRL,
+				   AM625_OLDI0_PWRDN_TX | AM625_OLDI1_PWRDN_TX |
+				   AM625_OLDI_PWRDN_BG, val);
+	}
 }
 
 static void dispc_set_num_datalines(struct dispc_device *dispc,
diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
index 13feedfe5d6d..b2a148e96022 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
@@ -227,17 +227,37 @@ enum dispc_common_regs {
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
+
+/* LVDS Bandgap reference Enable/Disable */
+#define AM625_OLDI_PWRDN_BG			BIT(8)
 
 #endif /* __TIDSS_DISPC_REGS_H */
-- 
2.39.0

