Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E116BC4F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E89C89ED6;
	Tue, 25 Feb 2020 08:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F3B6E9B4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 2666A29361E
Received: by earth.universe (Postfix, from userid 1000)
 id BD83F3C0C8B; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 08/56] drm/omap: panel-dsi-cm: convert to transfer API
Date: Tue, 25 Feb 2020 00:20:38 +0100
Message-Id: <20200224232126.3385250-9-sebastian.reichel@collabora.com>
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

This converts the panel-dsi-cm driver to use the transfer
API instead of specific functions, so that the specific
functions can be unexported and squashed into the generic
transfer function.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 133 +++++++++++++-----
 1 file changed, 96 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index e6ebfc35243e..92f510a771fe 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -140,45 +140,61 @@ static void hw_guard_wait(struct panel_drv_data *ddata)
 static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
 {
 	struct omap_dss_device *src = ddata->src;
-	int r;
-	u8 buf[1];
-
-	r = src->ops->dsi.dcs_read(src, ddata->channel, dcs_cmd, buf, 1);
-
-	if (r < 0)
-		return r;
-
-	*data = buf[0];
+	const struct mipi_dsi_msg msg = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_DCS_READ,
+		.tx_len = 1,
+		.tx_buf = &dcs_cmd,
+		.rx_len = 1,
+		.rx_buf = data
+	};
 
-	return 0;
+	return src->ops->dsi.transfer(src, &msg);
 }
 
 static int dsicm_dcs_write_0(struct panel_drv_data *ddata, u8 dcs_cmd)
 {
 	struct omap_dss_device *src = ddata->src;
+	const struct mipi_dsi_msg msg = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_DCS_SHORT_WRITE,
+		.tx_buf = &dcs_cmd,
+		.tx_len = 1,
+	};
 
-	return src->ops->dsi.dcs_write(src, ddata->channel, &dcs_cmd, 1);
+	return src->ops->dsi.transfer(src, &msg);
 }
 
 static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
 {
 	struct omap_dss_device *src = ddata->src;
-	u8 buf[2] = { dcs_cmd, param };
+	const u8 buf[] = { dcs_cmd, param };
+	const struct mipi_dsi_msg msg = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_DCS_SHORT_WRITE_PARAM,
+		.tx_buf = &buf,
+		.tx_len = 2,
+	};
 
-	return src->ops->dsi.dcs_write(src, ddata->channel, buf, 2);
+	return src->ops->dsi.transfer(src, &msg);
 }
 
 static int dsicm_sleep_in(struct panel_drv_data *ddata)
 
 {
 	struct omap_dss_device *src = ddata->src;
-	u8 cmd;
 	int r;
+	const u8 cmd = MIPI_DCS_ENTER_SLEEP_MODE;
+	const struct mipi_dsi_msg msg = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_DCS_SHORT_WRITE,
+		.tx_buf = &cmd,
+		.tx_len = 1,
+	};
 
 	hw_guard_wait(ddata);
 
-	cmd = MIPI_DCS_ENTER_SLEEP_MODE;
-	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, &cmd, 1);
+	r = src->ops->dsi.transfer(src, &msg);
 	if (r)
 		return r;
 
@@ -233,28 +249,44 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
 	u16 y1 = y;
 	u16 y2 = y + h - 1;
 
-	u8 buf[5];
-	buf[0] = MIPI_DCS_SET_COLUMN_ADDRESS;
-	buf[1] = (x1 >> 8) & 0xff;
-	buf[2] = (x1 >> 0) & 0xff;
-	buf[3] = (x2 >> 8) & 0xff;
-	buf[4] = (x2 >> 0) & 0xff;
+	const u8 paramX[] = {
+		MIPI_DCS_SET_COLUMN_ADDRESS,
+		(x1 >> 8) & 0xff,
+		(x1 >> 0) & 0xff,
+		(x2 >> 8) & 0xff,
+		(x2 >> 0) & 0xff,
+	};
 
-	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, buf, sizeof(buf));
-	if (r)
-		return r;
+	const struct mipi_dsi_msg msgX = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_GENERIC_LONG_WRITE,
+		.tx_buf = paramX,
+		.tx_len = 5,
+	};
 
-	buf[0] = MIPI_DCS_SET_PAGE_ADDRESS;
-	buf[1] = (y1 >> 8) & 0xff;
-	buf[2] = (y1 >> 0) & 0xff;
-	buf[3] = (y2 >> 8) & 0xff;
-	buf[4] = (y2 >> 0) & 0xff;
+	const u8 paramY[] = {
+		MIPI_DCS_SET_PAGE_ADDRESS,
+		(y1 >> 8) & 0xff,
+		(y1 >> 0) & 0xff,
+		(y2 >> 8) & 0xff,
+		(y2 >> 0) & 0xff,
+	};
 
-	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, buf, sizeof(buf));
+	const struct mipi_dsi_msg msgY = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_GENERIC_LONG_WRITE,
+		.tx_buf = paramY,
+		.tx_len = 5,
+	};
+
+
+	r = src->ops->dsi.transfer(src, &msgX);
 	if (r)
 		return r;
 
-	src->ops->dsi.bta_sync(src, ddata->channel);
+	r = src->ops->dsi.transfer(src, &msgY);
+	if (r)
+		return r;
 
 	return r;
 }
@@ -991,6 +1023,27 @@ static int dsicm_get_te(struct omap_dss_device *dssdev)
 	return r;
 }
 
+static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
+                                        u16 size)
+{
+	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct omap_dss_device *src = ddata->src;
+
+	const u8 buf[] = {
+		size & 0xff,
+		size >> 8 & 0xff,
+	};
+
+	const struct mipi_dsi_msg msg = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
+		.tx_buf = buf,
+		.tx_len = 2,
+	};
+
+	return src->ops->dsi.transfer(src, &msg);
+}
+
 static int dsicm_memory_read(struct omap_dss_device *dssdev,
 		void *buf, size_t size,
 		u16 x, u16 y, u16 w, u16 h)
@@ -1031,17 +1084,23 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 
 	dsicm_set_update_window(ddata, x, y, w, h);
 
-	r = src->ops->dsi.set_max_rx_packet_size(src, ddata->channel, plen);
+	r = dsicm_set_max_rx_packet_size(dssdev, plen);
 	if (r)
 		goto err2;
 
 	while (buf_used < size) {
 		u8 dcs_cmd = first ? 0x2e : 0x3e;
+		const struct mipi_dsi_msg msg = {
+			.channel = ddata->channel,
+			.type = MIPI_DSI_DCS_READ,
+			.tx_buf = &dcs_cmd,
+			.tx_len = 1,
+			.rx_buf = buf + buf_used,
+			.rx_len = size - buf_used,
+		};
 		first = 0;
 
-		r = src->ops->dsi.dcs_read(src, ddata->channel, dcs_cmd,
-				buf + buf_used, size - buf_used);
-
+		r = src->ops->dsi.transfer(src, &msg);
 		if (r < 0) {
 			dev_err(dssdev->dev, "read error\n");
 			goto err3;
@@ -1065,7 +1124,7 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 	r = buf_used;
 
 err3:
-	src->ops->dsi.set_max_rx_packet_size(src, ddata->channel, 1);
+	dsicm_set_max_rx_packet_size(dssdev, 1);
 err2:
 	src->ops->dsi.bus_unlock(src);
 err1:
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
