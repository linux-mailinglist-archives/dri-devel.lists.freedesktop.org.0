Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E65794EB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D8F11A211;
	Tue, 19 Jul 2022 08:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB2411A1E9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:09:17 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26J88tLk051076;
 Tue, 19 Jul 2022 03:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1658218135;
 bh=WYUiiaIyxWcoo74LixAH8gcE40YxTMjsX7Qghw4CW60=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=IUOM6Udkmic745vevN5St5UdRqnYH3YyhVIh4xgmaqnWxM4ncU/Cnty4feCconh5s
 btU37evplcndIAPPkdIoFUyc6fcIndTrZdJjEcpz8PhVgP5ednMPtecgy/FRyc3p+5
 ya/3Nw+kMegtZqSwu+eMe5zE/qvp85jLbwsbo7Tg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26J88twK084620
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Jul 2022 03:08:55 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 03:08:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 03:08:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26J88s4a020218;
 Tue, 19 Jul 2022 03:08:55 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 6/8] drm/tidss: Add IO CTRL and Power support for OLDI TX in
 AM625
Date: Tue, 19 Jul 2022 13:38:43 +0530
Message-ID: <20220719080845.22122-7-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220719080845.22122-1-a-bhatia1@ti.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
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
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ctrl MMR module of the AM625 is different from the AM65X SoC. As a
result, the memory-mapped regsiters that control the OLDI TX power and
loopback have diverged in AM625 SoC.

Add support for the controller in AM625 and control OLDI.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c      | 70 +++++++++++++++++++-----
 drivers/gpu/drm/tidss/tidss_dispc_regs.h |  6 ++
 2 files changed, 62 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 94fce035c1d7..c4a5f808648f 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -934,21 +934,57 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
 
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
+			case OLDI_SINGLE_LINK_SINGLE_MODE_0:
+				/* Power down OLDI TX 1*/
+				val = OLDI1_PWRDN_TX;
+				break;
+
+			case OLDI_SINGLE_LINK_SINGLE_MODE_1:
+				/* Power down OLDI TX 0*/
+				val = OLDI0_PWRDN_TX;
+				break;
+
+			case OLDI_SINGLE_LINK_DUPLICATE_MODE:
+			case OLDI_DUAL_LINK:
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
@@ -2701,9 +2737,15 @@ static int dispc_iomap_resource(struct platform_device *pdev, const char *name,
 static int dispc_init_am65x_oldi_io_ctrl(struct device *dev,
 					 struct dispc_device *dispc)
 {
-	dispc->oldi_io_ctrl =
-		syscon_regmap_lookup_by_phandle(dev->of_node,
-						"ti,am65x-oldi-io-ctrl");
+	if (dispc->feat->subrev == DISPC_AM65X)
+		dispc->oldi_io_ctrl =
+			syscon_regmap_lookup_by_phandle(dev->of_node,
+							"ti,am65x-oldi-io-ctrl");
+	else
+		dispc->oldi_io_ctrl =
+			syscon_regmap_lookup_by_phandle(dev->of_node,
+							"ti,am625-oldi-io-ctrl");
+
 	if (PTR_ERR(dispc->oldi_io_ctrl) == -ENODEV) {
 		dispc->oldi_io_ctrl = NULL;
 	} else if (IS_ERR(dispc->oldi_io_ctrl)) {
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

