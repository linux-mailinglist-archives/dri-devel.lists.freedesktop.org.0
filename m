Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429842A7DD8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB4E6EA48;
	Thu,  5 Nov 2020 12:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F636EA48
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:04:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C4M5P056579;
 Thu, 5 Nov 2020 06:04:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604577862;
 bh=+XwRx5tsm7aDYHRrmEUc9vK+Z7kVezsD4fxXX3KSYxY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=eTMiIMnweSXxmibbUPvdusA7grRbh3AtMUyYOW7wILDU0CZ4GOtsK0Ka2+m6rQf0r
 BuiIk69oKKVjIG9mpAK7yaoe1HAeXyCAIWstOBWX4FhBYQVeAtT9BTV+YMXTVL/6tX
 f+TPGorAejM3KRUyZkuXZInCldQxDfIzzesjbtIM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C4MKw123383
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 06:04:22 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:04:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:04:22 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rf9039111;
 Thu, 5 Nov 2020 06:04:20 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 11/56] drm/omap: dsi: simplify read functions
Date: Thu, 5 Nov 2020 14:02:48 +0200
Message-ID: <20201105120333.947408-12-tomi.valkeinen@ti.com>
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

Simplify the read related message handling by using the functionality
provided by CONFIG_DRM_MIPI_DSI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 110 +++++++++---------------------
 1 file changed, 34 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index e1595c0608f2..bbdc52ee3559 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2742,60 +2742,6 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
 	return 0;
 }
 
-static int dsi_vc_dcs_send_read_request(struct dsi_data *dsi, int channel,
-					u8 dcs_cmd)
-{
-	int r;
-
-	if (dsi->debug_read)
-		DSSDBG("dsi_vc_dcs_send_read_request(ch%d, dcs_cmd %x)\n",
-			channel, dcs_cmd);
-
-	r = dsi_vc_send_short(dsi, channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
-	if (r) {
-		DSSERR("dsi_vc_dcs_send_read_request(ch %d, cmd 0x%02x)"
-			" failed\n", channel, dcs_cmd);
-		return r;
-	}
-
-	return 0;
-}
-
-static int dsi_vc_generic_send_read_request(struct dsi_data *dsi, int channel,
-					    const u8 *reqdata, int reqlen)
-{
-	u16 data;
-	u8 data_type;
-	int r;
-
-	if (dsi->debug_read)
-		DSSDBG("dsi_vc_generic_send_read_request(ch %d, reqlen %d)\n",
-			channel, reqlen);
-
-	if (reqlen == 0) {
-		data_type = MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM;
-		data = 0;
-	} else if (reqlen == 1) {
-		data_type = MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM;
-		data = reqdata[0];
-	} else if (reqlen == 2) {
-		data_type = MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM;
-		data = reqdata[0] | (reqdata[1] << 8);
-	} else {
-		BUG();
-		return -EINVAL;
-	}
-
-	r = dsi_vc_send_short(dsi, channel, data_type, data, 0);
-	if (r) {
-		DSSERR("dsi_vc_generic_send_read_request(ch %d, reqlen %d)"
-			" failed\n", channel, reqlen);
-		return r;
-	}
-
-	return 0;
-}
-
 static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
 			       int buflen, enum dss_dsi_content_type type)
 {
@@ -2904,13 +2850,18 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
 	return r;
 }
 
-static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
-		u8 *buf, int buflen)
+static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
+			   const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
+	u8 dcs_cmd = ((u8 *)msg->tx_buf)[0];
+	u8 channel = msg->channel;
 	int r;
 
-	r = dsi_vc_dcs_send_read_request(dsi, channel, dcs_cmd);
+	if (dsi->debug_read)
+		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, dcs_cmd);
+
+	r = dsi_vc_send_short(dsi, channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
 	if (r)
 		goto err;
 
@@ -2918,47 +2869,58 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_c
 	if (r)
 		goto err;
 
-	r = dsi_vc_read_rx_fifo(dsi, channel, buf, buflen,
+	r = dsi_vc_read_rx_fifo(dsi, channel, msg->rx_buf, msg->rx_len,
 		DSS_DSI_CONTENT_DCS);
 	if (r < 0)
 		goto err;
 
-	if (r != buflen) {
+	if (r != msg->rx_len) {
 		r = -EIO;
 		goto err;
 	}
 
 	return 0;
 err:
-	DSSERR("dsi_vc_dcs_read(ch %d, cmd 0x%02x) failed\n", channel, dcs_cmd);
+	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__, msg->channel, dcs_cmd);
 	return r;
 }
 
-static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
-		const u8 *reqdata, int reqlen, u8 *buf, int buflen)
+static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
+			       const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
+	struct mipi_dsi_packet packet;
+	u16 data;
 	int r;
 
-	r = dsi_vc_generic_send_read_request(dsi, channel, reqdata, reqlen);
+	r = mipi_dsi_create_packet(&packet, msg);
+	if (r < 0)
+		goto err;
+
+	data = packet.header[1] | (packet.header[2] << 8);
+
+	r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
 	if (r)
-		return r;
+		goto err;
 
-	r = dsi_vc_send_bta_sync(dssdev, channel);
+	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
 	if (r)
-		return r;
+		goto err;
 
-	r = dsi_vc_read_rx_fifo(dsi, channel, buf, buflen,
+	r = dsi_vc_read_rx_fifo(dsi, msg->channel, msg->rx_buf, msg->rx_len,
 		DSS_DSI_CONTENT_GENERIC);
 	if (r < 0)
-		return r;
+		goto err;
 
-	if (r != buflen) {
+	if (r != msg->rx_len) {
 		r = -EIO;
-		return r;
+		goto err;
 	}
 
 	return 0;
+err:
+	DSSERR("%s(ch %d, reqlen %d) failed\n", __func__,  msg->channel, msg->tx_len);
+	return r;
 }
 
 static int dsi_enter_ulps(struct dsi_data *dsi)
@@ -4775,13 +4737,9 @@ static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
 	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
-		return dsi_vc_generic_read(dssdev, msg->channel,
-					   msg->tx_buf, msg->tx_len,
-					   msg->rx_buf, msg->rx_len);
+		return dsi_vc_generic_read(dssdev, msg);
 	case MIPI_DSI_DCS_READ:
-		return dsi_vc_dcs_read(dssdev, msg->channel,
-				       ((u8 *)msg->tx_buf)[0],
-				       msg->rx_buf, msg->rx_len);
+		return dsi_vc_dcs_read(dssdev, msg);
 	}
 
 	return -EINVAL;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
