Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A583C750E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5D06E0FC;
	Tue, 13 Jul 2021 16:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EF76E0D8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 14:49:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DEhi08026083; Tue, 13 Jul 2021 16:49:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=7iogho2MPvmeERAslTdZvt0AwKrPJiklnLgTcqL++t4=;
 b=CdFhfAHZ96LBfujeF5x+52cXoKRn8LNQVASe402H+6akQ391PamDYFxr1fyS58guiHLt
 20JYVMn3K4GpeXeug/gMV+RCith/1zNKczjiZHbp9DH3kPY3WigZWWHWjEWS2mefiBYI
 FnSk9ctjVqNQjKpHyZkr24phFQpGfK4Fk2XGpziBcr7k3j60hs6O8UT9+oocAQzmJ2iK
 dXO75e2gxh8WH2MwwlsJD9sjyQICBwhV7eoCJYxGDrrI6hWlpc4fhdAQ/sBXpnbs1e5i
 gGW6Eet83LZbpbd5CPkAecJYgaSaae4cLQHIEVnVnMBnMW8ZfdRjn3lmYy+on/kP1eAP UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39s6csth38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 16:49:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A00C610002A;
 Tue, 13 Jul 2021 16:49:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78C7A22AD4A;
 Tue, 13 Jul 2021 16:49:47 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Jul 2021 16:49:47
 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] drm/stm: dsi: compute the transition time from LP to HS and
 back
Date: Tue, 13 Jul 2021 16:49:41 +0200
Message-ID: <20210713144941.3599-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_07:2021-07-13,
 2021-07-13 signatures=0
X-Mailman-Approved-At: Tue, 13 Jul 2021 16:39:59 +0000
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver uses a conservative set of hardcoded values for the
maximum time delay of the transitions between LP and HS, either
for data and clock lanes.

By using the info in STM32MP157 datasheet, valid also for other ST
devices, compute the actual delay from the lane's bps.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
To: Yannick Fertre <yannick.fertre@foss.st.com>
To: Philippe Cornu <philippe.cornu@foss.st.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
To: David Airlie <airlied@linux.ie>
To: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: dri-devel@lists.freedesktop.org
To: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 8399d337589d..32cb41b2202f 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -309,14 +309,23 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 	return 0;
 }
 
+#define DSI_PHY_DELAY(fp, vp, mbps) DIV_ROUND_UP((fp) * (mbps) + 1000 * (vp), 8000)
+
 static int
 dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
 			   struct dw_mipi_dsi_dphy_timing *timing)
 {
-	timing->clk_hs2lp = 0x40;
-	timing->clk_lp2hs = 0x40;
-	timing->data_hs2lp = 0x40;
-	timing->data_lp2hs = 0x40;
+	/*
+	 * From STM32MP157 datasheet, valid for STM32F469, STM32F7x9, STM32H747
+	 * phy_clkhs2lp_time = (272+136*UI)/(8*UI)
+	 * phy_clklp2hs_time = (512+40*UI)/(8*UI)
+	 * phy_hs2lp_time = (192+64*UI)/(8*UI)
+	 * phy_lp2hs_time = (256+32*UI)/(8*UI)
+	 */
+	timing->clk_hs2lp = DSI_PHY_DELAY(272, 136, lane_mbps);
+	timing->clk_lp2hs = DSI_PHY_DELAY(512, 40, lane_mbps);
+	timing->data_hs2lp = DSI_PHY_DELAY(192, 64, lane_mbps);
+	timing->data_lp2hs = DSI_PHY_DELAY(256, 32, lane_mbps);
 
 	return 0;
 }

base-commit: 35d283658a6196b2057be562096610c6793e1219
-- 
2.32.0

