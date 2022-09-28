Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175465EE604
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 21:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8984F10E9EF;
	Wed, 28 Sep 2022 19:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D24810E9F4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 19:51:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28SHqWVu076976;
 Wed, 28 Sep 2022 12:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1664387552;
 bh=mBeUr+2FrLtMU/X0YErPVKUhi1p1MtyXhSsg6lVpdv8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=w5ct1J+LTMSyAWHJcNZWd8AxSsfv5oKDJ7IRU20kpv2sf4l8acYo7rJTH/ujKTiou
 E7GY6vYhUOk9OozVp2VuFUSVJhN6X9KybnmCBt+uX5S2sZKKQju/sZZEeHfR8xA9Nl
 xS5dMWbCVrA9ukKtJmzuyHZ3Cd8ExKOnKTXtFZiE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28SHqWn2115184
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Sep 2022 12:52:32 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 28
 Sep 2022 12:52:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 28 Sep 2022 12:52:32 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28SHqU7v101937;
 Wed, 28 Sep 2022 12:52:31 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH v5 5/6] drm/tidss: Add IO CTRL and Power support for OLDI
 TX in am625
Date: Wed, 28 Sep 2022 23:22:22 +0530
Message-ID: <20220928175223.15225-6-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220928175223.15225-1-a-bhatia1@ti.com>
References: <20220928175223.15225-1-a-bhatia1@ti.com>
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ctrl mmr module of the AM625 is different from the AM65X SoC. Thus
the ctrl mmr registers that supported the OLDI TX power have become
different in AM625 SoC.

Add IO CTRL support and control the OLDI TX power for AM625.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c      | 55 ++++++++++++++++++------
 drivers/gpu/drm/tidss/tidss_dispc_regs.h |  6 +++
 2 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 88008ad39b55..68444e0cd8d7 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -921,21 +921,52 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
 
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
+		val = power ? 0 : OLDI_PWRDN_TX;
+
+		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT0_IO_CTRL,
+				   OLDI_PWRDN_TX, val);
+		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT1_IO_CTRL,
+				   OLDI_PWRDN_TX, val);
+		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT2_IO_CTRL,
+				   OLDI_PWRDN_TX, val);
+		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT3_IO_CTRL,
+				   OLDI_PWRDN_TX, val);
+		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_CLK_IO_CTRL,
+				   OLDI_PWRDN_TX, val);
+
+	} else if (dispc->feat->subrev == DISPC_AM625) {
+		if (power) {
+			switch (dispc->oldi_mode) {
+			case OLDI_SINGLE_LINK_SINGLE_MODE:
+				/* Power down OLDI TX 1 */
+				val = OLDI1_PWRDN_TX;
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
+				val = OLDI0_PWRDN_TX | OLDI1_PWRDN_TX;
+				break;
+			}
+		} else {
+			/* Power down both the OLDI TXes */
+			val = OLDI0_PWRDN_TX | OLDI1_PWRDN_TX;
+		}
+
+		regmap_update_bits(dispc->oldi_io_ctrl, OLDI_PD_CTRL,
+				   OLDI0_PWRDN_TX | OLDI1_PWRDN_TX, val);
+	}
 }
 
 static void dispc_set_num_datalines(struct dispc_device *dispc,
@@ -2831,7 +2862,7 @@ int dispc_init(struct tidss_device *tidss)
 		dispc->vp_data[i].gamma_table = gamma_table;
 	}
 
-	if (feat->subrev == DISPC_AM65X) {
+	if (feat->subrev == DISPC_AM65X || feat->subrev == DISPC_AM625) {
 		r = dispc_init_am65x_oldi_io_ctrl(dev, dispc);
 		if (r)
 			return r;
diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
index 13feedfe5d6d..510bee70b3b8 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
@@ -238,6 +238,12 @@ enum dispc_common_regs {
 #define OLDI_DAT3_IO_CTRL			0x0C
 #define OLDI_CLK_IO_CTRL			0x10
 
+/* Only for AM625 OLDI TX */
+#define OLDI_PD_CTRL				0x100
+#define OLDI_LB_CTRL				0x104
+
 #define OLDI_PWRDN_TX				BIT(8)
+#define OLDI0_PWRDN_TX				BIT(0)
+#define OLDI1_PWRDN_TX				BIT(1)
 
 #endif /* __TIDSS_DISPC_REGS_H */
-- 
2.37.0

