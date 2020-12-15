Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738BA2DAB17
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90306E1BC;
	Tue, 15 Dec 2020 10:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821376E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlB4l010451
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029231;
 bh=99iE21zDeo9V9Jgv5qST7grAHha7kVYxDhcBBx2QRC8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Oo8o2Fwkk7sH45zZ4u6rQvThhiAqRNx2srWCeruEVKbSCSn/xJ+lEJNSXCbDWWeIX
 opeXJEQtVCRPxg/ATcNw9E0vQJNz9MVo0wolt/xhOce4qTdWNLvd5WBLs7Su67r7Pj
 Ij21JNeqxzxIguKuMg+S1/+dw2UeJLwL4jVYA4tA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlAtZ101024
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:10 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:10 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwZv046467;
 Tue, 15 Dec 2020 04:47:09 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 11/84] drm/omap: dsi: switch dsi_vc_send_long/short to
 mipi_dsi_msg
Date: Tue, 15 Dec 2020 12:45:44 +0200
Message-ID: <20201215104657.802264-12-tomi.valkeinen@ti.com>
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Simplify the DSI encoder by using mipi_dsi_msg for
dsi_vc_send_long and dsi_vc_send_short. Further improvements
require cleaning up the channel allocation code first.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 88 ++++++++++++++-----------------
 1 file changed, 39 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 7763dafb619f..70eb1f372633 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2601,8 +2601,8 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
 	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(channel), val);
 }
 
-static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
-			    const u8 *data, u16 len, u8 ecc)
+static int dsi_vc_send_long(struct dsi_data *dsi,
+			    const struct mipi_dsi_msg *msg)
 {
 	/*u32 val; */
 	int i;
@@ -2611,20 +2611,20 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
 	u8 b1, b2, b3, b4;
 
 	if (dsi->debug_write)
-		DSSDBG("dsi_vc_send_long, %d bytes\n", len);
+		DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
 
 	/* len + header */
-	if (dsi->vc[channel].tx_fifo_size * 32 * 4 < len + 4) {
+	if (dsi->vc[msg->channel].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
 		DSSERR("unable to send long packet: packet too long.\n");
 		return -EINVAL;
 	}
 
-	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_L4);
+	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
 
-	dsi_vc_write_long_header(dsi, channel, data_type, len, ecc);
+	dsi_vc_write_long_header(dsi, msg->channel, msg->type, msg->tx_len, 0);
 
-	p = data;
-	for (i = 0; i < len >> 2; i++) {
+	p = msg->tx_buf;
+	for (i = 0; i < msg->tx_len >> 2; i++) {
 		if (dsi->debug_write)
 			DSSDBG("\tsending full packet %d\n", i);
 
@@ -2633,10 +2633,10 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
 		b3 = *p++;
 		b4 = *p++;
 
-		dsi_vc_write_long_payload(dsi, channel, b1, b2, b3, b4);
+		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, b4);
 	}
 
-	i = len % 4;
+	i = msg->tx_len % 4;
 	if (i) {
 		b1 = 0; b2 = 0; b3 = 0;
 
@@ -2658,65 +2658,63 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
 			break;
 		}
 
-		dsi_vc_write_long_payload(dsi, channel, b1, b2, b3, 0);
+		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, 0);
 	}
 
 	return r;
 }
 
-static int dsi_vc_send_short(struct dsi_data *dsi, int channel, u8 data_type,
-			     u16 data, u8 ecc)
+static int dsi_vc_send_short(struct dsi_data *dsi,
+			     const struct mipi_dsi_msg *msg)
 {
+	struct mipi_dsi_packet pkt;
 	u32 r;
-	u8 data_id;
+
+	r = mipi_dsi_create_packet(&pkt, msg);
+	if (r < 0)
+		return r;
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	if (dsi->debug_write)
 		DSSDBG("dsi_vc_send_short(ch%d, dt %#x, b1 %#x, b2 %#x)\n",
-				channel,
-				data_type, data & 0xff, (data >> 8) & 0xff);
+		       msg->channel, msg->type, pkt.header[1], pkt.header[2]);
 
-	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_L4);
+	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
 
-	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(channel)), 16, 16)) {
+	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(msg->channel)), 16, 16)) {
 		DSSERR("ERROR FIFO FULL, aborting transfer\n");
 		return -EINVAL;
 	}
 
-	data_id = data_type | channel << 6;
-
-	r = (data_id << 0) | (data << 8) | (ecc << 24);
+	r = pkt.header[3] << 24 | pkt.header[2] << 16 | pkt.header[1] << 8 |
+	    pkt.header[0];
 
-	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel), r);
+	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(msg->channel), r);
 
 	return 0;
 }
 
 static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
 {
-	return dsi_vc_send_long(dsi, channel, MIPI_DSI_NULL_PACKET, NULL, 0, 0);
+	const struct mipi_dsi_msg msg = {
+		.channel = channel,
+		.type = MIPI_DSI_NULL_PACKET,
+	};
+
+	return dsi_vc_send_long(dsi, &msg);
 }
 
 static int dsi_vc_write_common(struct omap_dss_device *dssdev,
 			       const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
-	struct mipi_dsi_packet packet;
 	int r;
 
-	r = mipi_dsi_create_packet(&packet, msg);
-	if (r < 0)
-		return r;
-
-	if (mipi_dsi_packet_format_is_short(msg->type)) {
-		u16 data = packet.header[1] | (packet.header[2] << 8);
-
-		r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
-	} else {
-		r = dsi_vc_send_long(dsi, msg->channel, msg->type,
-				     msg->tx_buf, msg->tx_len, 0);
-	}
+	if (mipi_dsi_packet_format_is_short(msg->type))
+		r = dsi_vc_send_short(dsi, msg);
+	else
+		r = dsi_vc_send_long(dsi, msg);
 
 	if (r < 0)
 		return r;
@@ -2856,14 +2854,14 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
 			   const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
-	u8 dcs_cmd = ((u8 *)msg->tx_buf)[0];
+	u8 cmd = ((u8 *)msg->tx_buf)[0];
 	u8 channel = msg->channel;
 	int r;
 
 	if (dsi->debug_read)
-		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, dcs_cmd);
+		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, cmd);
 
-	r = dsi_vc_send_short(dsi, channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
+	r = dsi_vc_send_short(dsi, msg);
 	if (r)
 		goto err;
 
@@ -2883,7 +2881,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
 
 	return 0;
 err:
-	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__, msg->channel, dcs_cmd);
+	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__,  msg->channel, cmd);
 	return r;
 }
 
@@ -2891,17 +2889,9 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
 			       const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
-	struct mipi_dsi_packet packet;
-	u16 data;
 	int r;
 
-	r = mipi_dsi_create_packet(&packet, msg);
-	if (r < 0)
-		goto err;
-
-	data = packet.header[1] | (packet.header[2] << 8);
-
-	r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
+	r = dsi_vc_send_short(dsi, msg);
 	if (r)
 		goto err;
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
