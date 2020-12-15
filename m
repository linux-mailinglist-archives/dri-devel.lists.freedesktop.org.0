Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062FF2DAB45
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146A96E247;
	Tue, 15 Dec 2020 10:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70F46E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:09 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAm9Uf124351
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029289;
 bh=R5IuWf7nHUEW/YEUqCoNa1AAc/uiXKk/XlG+4nJKgg0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=zPJlNQL/Z3Kjv7wxDGL9UEkE0X4ywBq8u0tDNbqo0855bkfQIRmzohXlyY2HrneY2
 g+/nocDkNoDctOCDORGSp0B8+WqzppT7h/9RnPAKr4/vCY/TS4inpfJlWEqgTr96yX
 ca9SUcDOQEHGsUflECAmRh6C4+6Ty/brmH0Wyqik=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAm9wU102785
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:09 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:48:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:48:08 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwar046467;
 Tue, 15 Dec 2020 04:48:08 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 67/84] drm/omap: dsi: untangle vc & channel
Date: Tue, 15 Dec 2020 12:46:40 +0200
Message-ID: <20201215104657.802264-68-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215104657.802264-1-tomi.valkeinen@ti.com>
References: <20201215104657.802264-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI virtual channel and hardware VC blocks have gotten tangled as
described in the previous commits. This has not caused any issues, as
the value for both is 0, so it happens to work.

To fix the issue, change the code to use the correct one of the two.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 45 +++++++++++++++----------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 7c8fe5da3099..9499e424ec90 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2615,7 +2615,7 @@ static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int vc,
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
-	data_id = data_type | vc << 6;
+	data_id = data_type | channel << 6;
 
 	val = FLD_VAL(data_id, 7, 0) | FLD_VAL(len, 23, 8) |
 		FLD_VAL(ecc, 31, 24);
@@ -2649,12 +2649,12 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
 		DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
 
 	/* len + header */
-	if (dsi->vc[msg->channel].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
+	if (dsi->vc[vc].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
 		DSSERR("unable to send long packet: packet too long.\n");
 		return -EINVAL;
 	}
 
-	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
+	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
 
 	dsi_vc_write_long_header(dsi, vc, msg->channel, msg->type, msg->tx_len, 0);
 
@@ -2668,7 +2668,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
 		b3 = *p++;
 		b4 = *p++;
 
-		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, b4);
+		dsi_vc_write_long_payload(dsi, vc, b1, b2, b3, b4);
 	}
 
 	i = msg->tx_len % 4;
@@ -2693,7 +2693,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
 			break;
 		}
 
-		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, 0);
+		dsi_vc_write_long_payload(dsi, vc, b1, b2, b3, 0);
 	}
 
 	return r;
@@ -2712,12 +2712,12 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	if (dsi->debug_write)
-		DSSDBG("dsi_vc_send_short(ch%d, dt %#x, b1 %#x, b2 %#x)\n",
-		       msg->channel, msg->type, pkt.header[1], pkt.header[2]);
+		DSSDBG("dsi_vc_send_short(vc%d, dt %#x, b1 %#x, b2 %#x)\n",
+		       vc, msg->type, pkt.header[1], pkt.header[2]);
 
-	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
+	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
 
-	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(msg->channel)), 16, 16)) {
+	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(vc)), 16, 16)) {
 		DSSERR("ERROR FIFO FULL, aborting transfer\n");
 		return -EINVAL;
 	}
@@ -2725,7 +2725,7 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
 	r = pkt.header[3] << 24 | pkt.header[2] << 16 | pkt.header[1] << 8 |
 	    pkt.header[0];
 
-	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(msg->channel), r);
+	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc), r);
 
 	return 0;
 }
@@ -2733,7 +2733,7 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
 static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel)
 {
 	const struct mipi_dsi_msg msg = {
-		.channel = vc,
+		.channel = channel,
 		.type = MIPI_DSI_NULL_PACKET,
 	};
 
@@ -2761,16 +2761,16 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev, int vc,
 	 * In that case we can return early.
 	 */
 
-	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
+	r = dsi_vc_send_bta_sync(dssdev, vc);
 	if (r) {
 		DSSERR("bta sync failed\n");
 		return r;
 	}
 
 	/* RX_FIFO_NOT_EMPTY */
-	if (REG_GET(dsi, DSI_VC_CTRL(msg->channel), 20, 20)) {
+	if (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
 		DSSERR("rx fifo not empty after write, dumping data:\n");
-		dsi_vc_flush_receive_data(dsi, msg->channel);
+		dsi_vc_flush_receive_data(dsi, vc);
 		return -EIO;
 	}
 
@@ -2890,21 +2890,20 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int vc,
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	u8 cmd = ((u8 *)msg->tx_buf)[0];
-	u8 channel = msg->channel;
 	int r;
 
 	if (dsi->debug_read)
-		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, cmd);
+		DSSDBG("%s(vc %d, cmd %x)\n", __func__, vc, cmd);
 
 	r = dsi_vc_send_short(dsi, vc, msg);
 	if (r)
 		goto err;
 
-	r = dsi_vc_send_bta_sync(dssdev, channel);
+	r = dsi_vc_send_bta_sync(dssdev, vc);
 	if (r)
 		goto err;
 
-	r = dsi_vc_read_rx_fifo(dsi, channel, msg->rx_buf, msg->rx_len,
+	r = dsi_vc_read_rx_fifo(dsi, vc, msg->rx_buf, msg->rx_len,
 		DSS_DSI_CONTENT_DCS);
 	if (r < 0)
 		goto err;
@@ -2916,7 +2915,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int vc,
 
 	return 0;
 err:
-	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__,  msg->channel, cmd);
+	DSSERR("%s(vc %d, cmd 0x%02x) failed\n", __func__,  vc, cmd);
 	return r;
 }
 
@@ -2930,11 +2929,11 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int vc,
 	if (r)
 		goto err;
 
-	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
+	r = dsi_vc_send_bta_sync(dssdev, vc);
 	if (r)
 		goto err;
 
-	r = dsi_vc_read_rx_fifo(dsi, msg->channel, msg->rx_buf, msg->rx_len,
+	r = dsi_vc_read_rx_fifo(dsi, vc, msg->rx_buf, msg->rx_len,
 		DSS_DSI_CONTENT_GENERIC);
 	if (r < 0)
 		goto err;
@@ -2946,7 +2945,7 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int vc,
 
 	return 0;
 err:
-	DSSERR("%s(ch %d, reqlen %d) failed\n", __func__,  msg->channel, msg->tx_len);
+	DSSERR("%s(vc %d, reqlen %d) failed\n", __func__,  vc, msg->tx_len);
 	return r;
 }
 
@@ -4890,7 +4889,7 @@ static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
 	int r;
 
 	if (!!(msg->flags & MIPI_DSI_MSG_USE_LPM) != dsi->in_lp_mode)
-		dsi_vc_enable_hs(dssdev, msg->channel,
+		dsi_vc_enable_hs(dssdev, vc,
 				 !(msg->flags & MIPI_DSI_MSG_USE_LPM));
 
 	switch (msg->type) {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
