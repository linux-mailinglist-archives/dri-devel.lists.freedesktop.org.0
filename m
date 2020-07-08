Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ED22189D7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 16:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364BF6E155;
	Wed,  8 Jul 2020 14:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465F36E155
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 14:08:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 068E41hE002186; Wed, 8 Jul 2020 16:08:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Bh+DwW0TqfiKlxh43rCoh2hS/GAP9fFXbNlOjmqZ/RU=;
 b=HhcRfR4FELadkvTJvSqfWbxNG74oFekTOmzhN6PIx1rdWXNe7wBIdqiIsePZegPXchNW
 We0kikYQaHvqOwintrIQYzJxptLfJR3/yQiGS8UlQwVCkxc2v21JVOfNtG1KouO74OWx
 8Rsgc2DG11X90kCYHhQLNtfiOHPYGnUxNc6wiAxOSyoVLbeGbrmJHkH480yTM4KnfM34
 6/dT4ZwnE6EQ+gD7IsUX9H/YY/5GMd283GG/4MUz7vkKkk+DKb+98gMBZxW3aE74Dr0F
 Z/aMrym21jOBYOnpiVIcIiIrzVvkbTzdVJ0M8eiZAwek/UXKvQPBEKLowzMyizqNuEIF Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322gnfqqg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 16:08:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD417100038;
 Wed,  8 Jul 2020 16:08:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1A592C2317;
 Wed,  8 Jul 2020 16:08:40 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 8 Jul 2020 16:08:39 +0200
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/bridge/synopsys: dsi: allow LP commands in video mode
Date: Wed, 8 Jul 2020 16:08:36 +0200
Message-ID: <20200708140836.32418-1-yannick.fertre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_11:2020-07-08,
 2020-07-08 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Antonio Borneo <antonio.borneo@st.com>

Current code only sends LP commands in command mode.

Allows sending LP commands also in video mode by setting the
proper flag in DSI_VID_MODE_CFG.

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 1a24ea648ef8..e9a0f42ff99f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -89,6 +89,7 @@
 #define VID_MODE_TYPE_NON_BURST_SYNC_EVENTS	0x1
 #define VID_MODE_TYPE_BURST			0x2
 #define VID_MODE_TYPE_MASK			0x3
+#define ENABLE_LOW_POWER_CMD		BIT(15)
 #define VID_MODE_VPG_ENABLE		BIT(16)
 #define VID_MODE_VPG_HORIZONTAL		BIT(24)
 
@@ -376,6 +377,13 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
 
 	dsi_write(dsi, DSI_LPCLK_CTRL, lpm ? 0 : PHY_TXREQUESTCLKHS);
 	dsi_write(dsi, DSI_CMD_MODE_CFG, val);
+
+	val = dsi_read(dsi, DSI_VID_MODE_CFG);
+	if (lpm)
+		val |= ENABLE_LOW_POWER_CMD;
+	else
+		val &= ~ENABLE_LOW_POWER_CMD;
+	dsi_write(dsi, DSI_VID_MODE_CFG, val);
 }
 
 static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
