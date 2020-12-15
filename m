Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02D2DAB19
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B556E1CD;
	Tue, 15 Dec 2020 10:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE9C6E1B2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAl95C010427
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029229;
 bh=SGL7bzars9JItjJU/6VN6MqDmx8/ZL2f81zrAZ0l6TI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=WVuNGcCuC4Oh6Ehb5GUxhLkx/tRrJOK/HX4UbT8qrFk4KlzfoS/BN1Tgn8TBxjVv3
 hZQhVgDfVQPKv5fOXR4uhj4h25XHJwLhSFnZI0M4t8mccYZuPT+9ZGywPMVxvbEk1K
 LGirEa1R4BunXp+pwqXq94M4AgoT2e+9UwvWarJg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAl89O022644
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:09 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:08 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwZt046467;
 Tue, 15 Dec 2020 04:47:07 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 09/84] drm/omap: dsi: simplify write function
Date: Tue, 15 Dec 2020 12:45:42 +0200
Message-ID: <20201215104657.802264-10-tomi.valkeinen@ti.com>
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

Simplify the write related messages handling by using the functionality
provided by CONFIG_DRM_MIPI_DSI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/Kconfig |   1 +
 drivers/gpu/drm/omapdrm/dss/dsi.c   | 146 +++++++---------------------
 2 files changed, 34 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
index e11b258a2294..311039024595 100644
--- a/drivers/gpu/drm/omapdrm/dss/Kconfig
+++ b/drivers/gpu/drm/omapdrm/dss/Kconfig
@@ -95,6 +95,7 @@ config OMAP2_DSS_SDI
 config OMAP2_DSS_DSI
 	bool "DSI support"
 	default n
+	select DRM_MIPI_DSI
 	help
 	  MIPI DSI (Display Serial Interface) support.
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 84688e977a5c..e191ed80707d 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2698,97 +2698,50 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
 	return dsi_vc_send_long(dsi, channel, MIPI_DSI_NULL_PACKET, NULL, 0, 0);
 }
 
-static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
-				      const u8 *data, int len,
-				      enum dss_dsi_content_type type)
-{
-	int r;
-
-	if (len == 0) {
-		BUG_ON(type == DSS_DSI_CONTENT_DCS);
-		r = dsi_vc_send_short(dsi, channel,
-				MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM, 0, 0);
-	} else if (len == 1) {
-		r = dsi_vc_send_short(dsi, channel,
-				type == DSS_DSI_CONTENT_GENERIC ?
-				MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM :
-				MIPI_DSI_DCS_SHORT_WRITE, data[0], 0);
-	} else if (len == 2) {
-		r = dsi_vc_send_short(dsi, channel,
-				type == DSS_DSI_CONTENT_GENERIC ?
-				MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM :
-				MIPI_DSI_DCS_SHORT_WRITE_PARAM,
-				data[0] | (data[1] << 8), 0);
-	} else {
-		r = dsi_vc_send_long(dsi, channel,
-				type == DSS_DSI_CONTENT_GENERIC ?
-				MIPI_DSI_GENERIC_LONG_WRITE :
-				MIPI_DSI_DCS_LONG_WRITE, data, len, 0);
-	}
-
-	return r;
-}
-
-static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
-		const u8 *data, int len)
+static int dsi_vc_write_common(struct omap_dss_device *dssdev,
+			       const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
+	struct mipi_dsi_packet packet;
+	int r;
 
-	return dsi_vc_write_nosync_common(dsi, channel, data, len,
-			DSS_DSI_CONTENT_DCS);
-}
+	r = mipi_dsi_create_packet(&packet, msg);
+	if (r < 0)
+		return r;
 
-static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int channel,
-		const u8 *data, int len)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
+	if (mipi_dsi_packet_format_is_short(msg->type)) {
+		u16 data = packet.header[1] | (packet.header[2] << 8);
 
-	return dsi_vc_write_nosync_common(dsi, channel, data, len,
-			DSS_DSI_CONTENT_GENERIC);
-}
+		r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
+	} else {
+		r = dsi_vc_send_long(dsi, msg->channel, msg->type,
+				     msg->tx_buf, msg->tx_len, 0);
+	}
 
-static int dsi_vc_write_common(struct omap_dss_device *dssdev,
-			       int channel, const u8 *data, int len,
-			       enum dss_dsi_content_type type)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-	int r;
+	if (r < 0)
+		return r;
 
-	r = dsi_vc_write_nosync_common(dsi, channel, data, len, type);
-	if (r)
-		goto err;
+	/*
+	 * TODO: we do not always have to do the BTA sync, for example
+	 * we can improve performance by setting the update window
+	 * information without sending BTA sync between the commands.
+	 * In that case we can return early.
+	 */
 
-	r = dsi_vc_send_bta_sync(dssdev, channel);
-	if (r)
-		goto err;
+	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
+	if (r) {
+		DSSERR("bta sync failed\n");
+		return r;
+	}
 
 	/* RX_FIFO_NOT_EMPTY */
-	if (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
+	if (REG_GET(dsi, DSI_VC_CTRL(msg->channel), 20, 20)) {
 		DSSERR("rx fifo not empty after write, dumping data:\n");
-		dsi_vc_flush_receive_data(dsi, channel);
-		r = -EIO;
-		goto err;
+		dsi_vc_flush_receive_data(dsi, msg->channel);
+		return -EIO;
 	}
 
 	return 0;
-err:
-	DSSERR("dsi_vc_write_common(ch %d, cmd 0x%02x, len %d) failed\n",
-			channel, data[0], len);
-	return r;
-}
-
-static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel,
-		const u8 *data, int len)
-{
-	return dsi_vc_write_common(dssdev, channel, data, len,
-			DSS_DSI_CONTENT_DCS);
-}
-
-static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel,
-		const u8 *data, int len)
-{
-	return dsi_vc_write_common(dssdev, channel, data, len,
-			DSS_DSI_CONTENT_GENERIC);
 }
 
 static int dsi_vc_dcs_send_read_request(struct dsi_data *dsi, int channel,
@@ -3010,15 +2963,6 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
 	return 0;
 }
 
-static int dsi_vc_set_max_rx_packet_size(struct omap_dss_device *dssdev, int channel,
-		u16 len)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	return dsi_vc_send_short(dsi, channel,
-			MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE, len, 0);
-}
-
 static int dsi_enter_ulps(struct dsi_data *dsi)
 {
 	DECLARE_COMPLETION_ONSTACK(completion);
@@ -4815,36 +4759,17 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
 static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
 				 const struct mipi_dsi_msg *msg)
 {
-	/*
-	 * TODO: no_sync can be used to optimize performance by sending e.g.
-	 * column and page information without syncing in between. It's not
-	 * absolutely required, so postpone this feature for now.
-	 */
-	bool no_sync = false;
-	u16 val;
-
 	switch (msg->type) {
 	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
 	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
 	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
 	case MIPI_DSI_GENERIC_LONG_WRITE:
-		if (no_sync)
-			return dsi_vc_generic_write_nosync(dssdev, msg->channel,
-							   msg->tx_buf,
-							   msg->tx_len);
-		else
-			return dsi_vc_generic_write(dssdev, msg->channel,
-						    msg->tx_buf, msg->tx_len);
 	case MIPI_DSI_DCS_SHORT_WRITE:
 	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
 	case MIPI_DSI_DCS_LONG_WRITE:
-		if (no_sync)
-			return dsi_vc_dcs_write_nosync(dssdev, msg->channel,
-						       msg->tx_buf,
-						       msg->tx_len);
-		else
-			return dsi_vc_dcs_write(dssdev, msg->channel,
-						msg->tx_buf, msg->tx_len);
+	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
+	case MIPI_DSI_NULL_PACKET:
+		return dsi_vc_write_common(dssdev, msg);
 	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
@@ -4855,11 +4780,6 @@ static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
 		return dsi_vc_dcs_read(dssdev, msg->channel,
 				       ((u8 *)msg->tx_buf)[0],
 				       msg->rx_buf, msg->rx_len);
-	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
-		val = le16_to_cpu(*((__le16 *)msg->tx_buf));
-		return dsi_vc_set_max_rx_packet_size(dssdev, msg->channel, val);
-	case MIPI_DSI_NULL_PACKET:
-		return dsi_vc_send_null(to_dsi_data(dssdev), msg->channel);
 	}
 
 	return -EINVAL;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
