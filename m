Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B616BC54
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C1B6EA31;
	Tue, 25 Feb 2020 08:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812E86E9B9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 4B12C293679
Received: by earth.universe (Postfix, from userid 1000)
 id CE3053C0C8E; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 11/56] drm/omap: dsi: simplify write function
Date: Tue, 25 Feb 2020 00:20:41 +0100
Message-Id: <20200224232126.3385250-12-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify the write related messages handling by using the functionality
provided by CONFIG_DRM_MIPI_DSI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/Kconfig |   1 +
 drivers/gpu/drm/omapdrm/dss/dsi.c   | 144 +++++++---------------------
 2 files changed, 33 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
index 72ae79c0c9b4..90e2dd522896 100644
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
index 8c223b808740..e5589e615808 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2696,97 +2696,49 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
 	return dsi_vc_send_long(dsi, channel, MIPI_DSI_NULL_PACKET, NULL, 0, 0);
 }
 
-static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
-				      const u8 *data, int len,
-				      enum dss_dsi_content_type type)
+static int dsi_vc_write_common(struct omap_dss_device *dssdev,
+			       const struct mipi_dsi_msg *msg)
 {
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	struct mipi_dsi_packet packet;
 	int r;
 
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
+	r = mipi_dsi_create_packet(&packet, msg);
+	if (r < 0)
+		return r;
+
+	if (mipi_dsi_packet_format_is_short(msg->type)) {
+		u16 data = packet.header[1] | (packet.header[2] << 8);
+		r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
 	} else {
-		r = dsi_vc_send_long(dsi, channel,
-				type == DSS_DSI_CONTENT_GENERIC ?
-				MIPI_DSI_GENERIC_LONG_WRITE :
-				MIPI_DSI_DCS_LONG_WRITE, data, len, 0);
+		r = dsi_vc_send_long(dsi, msg->channel, msg->type,
+						   msg->tx_buf, msg->tx_len, 0);
 	}
 
-	return r;
-}
-
-static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
-		const u8 *data, int len)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	return dsi_vc_write_nosync_common(dsi, channel, data, len,
-			DSS_DSI_CONTENT_DCS);
-}
-
-static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int channel,
-		const u8 *data, int len)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	return dsi_vc_write_nosync_common(dsi, channel, data, len,
-			DSS_DSI_CONTENT_GENERIC);
-}
-
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
+	 * we do not always have to do the BTA sync, for example we can
+	 * improve performance by setting the update window information
+	 * without sending BTA sync between the commands. In that case
+	 * we can return earily.
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
@@ -3008,15 +2960,6 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
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
@@ -4811,35 +4754,17 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
 static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
 				 const struct mipi_dsi_msg *msg)
 {
-	/*
-	 * no_sync can be used to optimize performance by sending
-	 * e.g. column and page information without syncing in
-	 * between. It's not absolutley required, so postpone this
-	 * feature for now.
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
-				                      msg->tx_buf, msg->tx_len);
-		else
-			return dsi_vc_generic_write(dssdev, msg->channel,
-						    msg->tx_buf, msg->tx_len);
 	case MIPI_DSI_DCS_SHORT_WRITE:
 	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
 	case MIPI_DSI_DCS_LONG_WRITE:
-		if (no_sync)
-			return dsi_vc_dcs_write_nosync(dssdev, msg->channel,
-						      msg->tx_buf, msg->tx_len);
-		else
-			return dsi_vc_dcs_write(dssdev, msg->channel,
-						msg->tx_buf, msg->tx_len);
+	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
+	case MIPI_DSI_NULL_PACKET:
+		return dsi_vc_write_common(dssdev, msg);
 	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
@@ -4849,11 +4774,6 @@ static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
 		return dsi_vc_dcs_read(dssdev, msg->channel,
 				((u8*) msg->tx_buf)[0],
 				msg->rx_buf, msg->rx_len);
-	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
-		val = le16_to_cpu(*((__le16*) msg->tx_buf));
-		return dsi_vc_set_max_rx_packet_size(dssdev, msg->channel, val);
-	case MIPI_DSI_NULL_PACKET:
-		return dsi_vc_send_null(to_dsi_data(dssdev), msg->channel);
 	}
 
 	return -EINVAL;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
