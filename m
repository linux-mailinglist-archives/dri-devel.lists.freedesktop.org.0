Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D62A210DBD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 16:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2BF6E90B;
	Wed,  1 Jul 2020 14:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B4E6E90B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 14:31:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061ET9B0010141; Wed, 1 Jul 2020 16:31:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=2H4rJcc4Kq591hNX8sznqvH4uJ8CcStcaPrDL9Edm2U=;
 b=H36JJcEbriSryEhCLbG2fojXgMHXjBhVXgP15riT/Ujyis17ISJIBmel12xC1I8o8Spc
 6kezrDHN6UuDuGW+dIedUBtnQbEbGRnxhxmmTAA1swav0MlNoMCxjA8F9fPCK0YiJhse
 80SbW9hzUFld3V6pnko5OTZ2Z2WVvfhqz+831d8DZ0wE72pXpfjFfZt1OKyXcBAUuaXD
 61Pro0G4QE+K0D+Kdm6Z2Jc4P9GQZ4vrNG8RmSJdksvZc0rWrefkr6Xa3/7dzKu+V93r
 f95DA+LKGPOIW8Ayf+WDISeIO2KxrBm4GEdTsfzVe7MTEiJ8UbjxmdoD+FtYXrC6DA3w Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu89u28x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 16:31:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0727B10002A;
 Wed,  1 Jul 2020 16:31:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DEAFE2BC7A9;
 Wed,  1 Jul 2020 16:31:33 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 1 Jul 2020 16:31:33 +0200
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/bridge/synopsys: dsi: allow sending longer LP commands
Date: Wed, 1 Jul 2020 16:31:31 +0200
Message-ID: <20200701143131.841-1-yannick.fertre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_08:2020-07-01,
 2020-07-01 signatures=0
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

Current code does not properly computes the max length of LP
commands that can be send during H or V sync, and rely on static
values.
Limiting the max LP length to 4 byte during the V-sync is overly
conservative.

Relax the limit and allows longer LP commands (16 bytes) to be
sent during V-sync.

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index d580b2aa4ce9..1a24ea648ef8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -360,6 +360,15 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
 	bool lpm = msg->flags & MIPI_DSI_MSG_USE_LPM;
 	u32 val = 0;
 
+	/*
+	 * TODO dw drv improvements
+	 * largest packet sizes during hfp or during vsa/vpb/vfp
+	 * should be computed according to byte lane, lane number and only
+	 * if sending lp cmds in high speed is enable (PHY_TXREQUESTCLKHS)
+	 */
+	dsi_write(dsi, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(16)
+		  | INVACT_LPCMD_TIME(4));
+
 	if (msg->flags & MIPI_DSI_MSG_REQ_ACK)
 		val |= ACK_RQST_EN;
 	if (lpm)
@@ -611,14 +620,6 @@ static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi *dsi,
 	dsi_write(dsi, DSI_DPI_VCID, DPI_VCID(dsi->channel));
 	dsi_write(dsi, DSI_DPI_COLOR_CODING, color);
 	dsi_write(dsi, DSI_DPI_CFG_POL, val);
-	/*
-	 * TODO dw drv improvements
-	 * largest packet sizes during hfp or during vsa/vpb/vfp
-	 * should be computed according to byte lane, lane number and only
-	 * if sending lp cmds in high speed is enable (PHY_TXREQUESTCLKHS)
-	 */
-	dsi_write(dsi, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(4)
-		  | INVACT_LPCMD_TIME(4));
 }
 
 static void dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi *dsi)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
