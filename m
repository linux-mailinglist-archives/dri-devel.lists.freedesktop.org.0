Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42232A7DD9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E4F6EA4C;
	Thu,  5 Nov 2020 12:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE246EA4C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:04:32 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C4PVM070056;
 Thu, 5 Nov 2020 06:04:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604577865;
 bh=daKFusBY/H8bgRqaCCI+B4jl2oplZMdpXZytPqt4wdE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=FHItT/YZUgXev1OPXa/8zOPaR3sUDAp9IVcKoF6AWtA66pVRrsBKVE/yK80lmyqVA
 uurzF4NsJOzfexhevr/cCxs8MFHaFim+/NdWi5/LAQDs7Q4elGoYYcPIMGoQ8N7R/u
 QIMlo43WwZmbgNmcmI4KvfSIJ2rAPc8hKSDGNKgE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C4PCD123405
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 06:04:25 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:04:24 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:04:25 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfA039111;
 Thu, 5 Nov 2020 06:04:22 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 12/56] drm/omap: dsi: switch dsi_vc_send_long/short to
 mipi_dsi_msg
Date: Thu, 5 Nov 2020 14:02:49 +0200
Message-ID: <20201105120333.947408-13-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
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
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 89 ++++++++++++++-----------------
 1 file changed, 40 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index bbdc52ee3559..6fa7833e32ad 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2599,8 +2599,8 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
 	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(channel), val);
 }
 
-static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
-			    const u8 *data, u16 len, u8 ecc)
+static int dsi_vc_send_long(struct dsi_data *dsi,
+			    const struct mipi_dsi_msg *msg)
 {
 	/*u32 val; */
 	int i;
@@ -2609,20 +2609,20 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
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
 
@@ -2631,10 +2631,10 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
 		b3 = *p++;
 		b4 = *p++;
 
-		dsi_vc_write_long_payload(dsi, channel, b1, b2, b3, b4);
+		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, b4);
 	}
 
-	i = len % 4;
+	i = msg->tx_len % 4;
 	if (i) {
 		b1 = 0; b2 = 0; b3 = 0;
 
@@ -2656,65 +2656,64 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
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
+				msg->channel,
+				msg->type, pkt.header[1], pkt.header[2]);
 
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
@@ -2854,14 +2853,14 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
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
 
@@ -2881,7 +2880,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
 
 	return 0;
 err:
-	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__, msg->channel, dcs_cmd);
+	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__,  msg->channel, cmd);
 	return r;
 }
 
@@ -2889,17 +2888,9 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
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
