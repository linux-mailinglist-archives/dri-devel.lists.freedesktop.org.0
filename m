Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05E616BC6A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964C56EA44;
	Tue, 25 Feb 2020 08:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567F36E9B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 44055293982
Received: by earth.universe (Postfix, from userid 1000)
 id E59D13C0C92; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 15/56] drm/omap: panel-dsi-cm: use DSI helpers
Date: Tue, 25 Feb 2020 00:20:45 +0100
Message-Id: <20200224232126.3385250-16-sebastian.reichel@collabora.com>
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

After converting the driver to mipi_dsi_device we can use the generic
message helpers to simplify the driver a lot.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 126 +++---------------
 1 file changed, 18 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index c34daecb1de5..4a4a55135494 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -138,62 +138,22 @@ static void hw_guard_wait(struct panel_drv_data *ddata)
 
 static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
 {
-	struct mipi_dsi_device *dsi = ddata->dsi;
-	const struct mipi_dsi_msg msg = {
-		.channel = ddata->channel,
-		.type = MIPI_DSI_DCS_READ,
-		.tx_len = 1,
-		.tx_buf = &dcs_cmd,
-		.rx_len = 1,
-		.rx_buf = data
-	};
-
-	return dsi->host->ops->transfer(dsi->host, &msg);
-}
-
-static int dsicm_dcs_write_0(struct panel_drv_data *ddata, u8 dcs_cmd)
-{
-	struct mipi_dsi_device *dsi = ddata->dsi;
-	const struct mipi_dsi_msg msg = {
-		.channel = ddata->channel,
-		.type = MIPI_DSI_DCS_SHORT_WRITE,
-		.tx_buf = &dcs_cmd,
-		.tx_len = 1,
-	};
-
-	return dsi->host->ops->transfer(dsi->host, &msg);
+	return mipi_dsi_dcs_read(ddata->dsi, dcs_cmd, data, 1);
 }
 
 static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
 {
-	struct mipi_dsi_device *dsi = ddata->dsi;
-	const u8 buf[] = { dcs_cmd, param };
-	const struct mipi_dsi_msg msg = {
-		.channel = ddata->channel,
-		.type = MIPI_DSI_DCS_SHORT_WRITE_PARAM,
-		.tx_buf = &buf,
-		.tx_len = 2,
-	};
-
-	return dsi->host->ops->transfer(dsi->host, &msg);
+	return mipi_dsi_dcs_write(ddata->dsi, dcs_cmd, &param, 1);
 }
 
 static int dsicm_sleep_in(struct panel_drv_data *ddata)
 
 {
-	struct mipi_dsi_device *dsi = ddata->dsi;
 	int r;
-	const u8 cmd = MIPI_DCS_ENTER_SLEEP_MODE;
-	const struct mipi_dsi_msg msg = {
-		.channel = ddata->channel,
-		.type = MIPI_DSI_DCS_SHORT_WRITE,
-		.tx_buf = &cmd,
-		.tx_len = 1,
-	};
 
 	hw_guard_wait(ddata);
 
-	r = dsi->host->ops->transfer(dsi->host, &msg);
+	r = mipi_dsi_dcs_enter_sleep_mode(ddata->dsi);
 	if (r)
 		return r;
 
@@ -210,7 +170,7 @@ static int dsicm_sleep_out(struct panel_drv_data *ddata)
 
 	hw_guard_wait(ddata);
 
-	r = dsicm_dcs_write_0(ddata, MIPI_DCS_EXIT_SLEEP_MODE);
+	r = mipi_dsi_dcs_exit_sleep_mode(ddata->dsi);
 	if (r)
 		return r;
 
@@ -248,46 +208,15 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
 	u16 y1 = y;
 	u16 y2 = y + h - 1;
 
-	const u8 paramX[] = {
-		MIPI_DCS_SET_COLUMN_ADDRESS,
-		(x1 >> 8) & 0xff,
-		(x1 >> 0) & 0xff,
-		(x2 >> 8) & 0xff,
-		(x2 >> 0) & 0xff,
-	};
-
-	const struct mipi_dsi_msg msgX = {
-		.channel = ddata->channel,
-		.type = MIPI_DSI_GENERIC_LONG_WRITE,
-		.tx_buf = paramX,
-		.tx_len = 5,
-	};
-
-	const u8 paramY[] = {
-		MIPI_DCS_SET_PAGE_ADDRESS,
-		(y1 >> 8) & 0xff,
-		(y1 >> 0) & 0xff,
-		(y2 >> 8) & 0xff,
-		(y2 >> 0) & 0xff,
-	};
-
-	const struct mipi_dsi_msg msgY = {
-		.channel = ddata->channel,
-		.type = MIPI_DSI_GENERIC_LONG_WRITE,
-		.tx_buf = paramY,
-		.tx_len = 5,
-	};
-
-
-	r = dsi->host->ops->transfer(dsi->host, &msgX);
-	if (r)
+	r = mipi_dsi_dcs_set_column_address(dsi, x1, x2);
+	if (r < 0)
 		return r;
 
-	r = dsi->host->ops->transfer(dsi->host, &msgY);
-	if (r)
+	r = mipi_dsi_dcs_set_page_address(dsi, y1, y2);
+	if (r < 0)
 		return r;
 
-	return r;
+	return 0;
 }
 
 static void dsicm_queue_ulps_work(struct panel_drv_data *ddata)
@@ -681,12 +610,11 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_PIXEL_FORMAT,
-		MIPI_DCS_PIXEL_FMT_24BIT);
+	r = mipi_dsi_dcs_set_pixel_format(ddata->dsi, MIPI_DCS_PIXEL_FMT_24BIT);
 	if (r)
 		goto err;
 
-	r = dsicm_dcs_write_0(ddata, MIPI_DCS_SET_DISPLAY_ON);
+	r = mipi_dsi_dcs_set_display_on(ddata->dsi);
 	if (r)
 		goto err;
 
@@ -732,7 +660,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 
 	src->ops->dsi.disable_video_output(src, ddata->channel);
 
-	r = dsicm_dcs_write_0(ddata, MIPI_DCS_SET_DISPLAY_OFF);
+	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
 	if (!r)
 		r = dsicm_sleep_in(ddata);
 
@@ -950,12 +878,13 @@ static int dsicm_sync(struct omap_dss_device *dssdev)
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
 	struct omap_dss_device *src = ddata->src;
+	struct mipi_dsi_device *dsi = ddata->dsi;
 	int r;
 
 	if (enable)
-		r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_TEAR_ON, 0);
+		r = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	else
-		r = dsicm_dcs_write_0(ddata, MIPI_DCS_SET_TEAR_OFF);
+		r = mipi_dsi_dcs_set_tear_off(dsi);
 
 	if (!ddata->ext_te_gpio)
 		src->ops->dsi.enable_te(src, enable);
@@ -1021,19 +950,7 @@ static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
 	struct mipi_dsi_device *dsi = ddata->dsi;
 
-	const u8 buf[] = {
-		size & 0xff,
-		size >> 8 & 0xff,
-	};
-
-	const struct mipi_dsi_msg msg = {
-		.channel = ddata->channel,
-		.type = MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
-		.tx_buf = buf,
-		.tx_len = 2,
-	};
-
-	return dsi->host->ops->transfer(dsi->host, &msg);
+	return mipi_dsi_set_maximum_return_packet_size(dsi, size);
 }
 
 static int dsicm_memory_read(struct omap_dss_device *dssdev,
@@ -1083,17 +1000,10 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 
 	while (buf_used < size) {
 		u8 dcs_cmd = first ? 0x2e : 0x3e;
-		const struct mipi_dsi_msg msg = {
-			.channel = ddata->channel,
-			.type = MIPI_DSI_DCS_READ,
-			.tx_buf = &dcs_cmd,
-			.tx_len = 1,
-			.rx_buf = buf + buf_used,
-			.rx_len = size - buf_used,
-		};
 		first = 0;
 
-		r = dsi->host->ops->transfer(dsi->host, &msg);
+		r = mipi_dsi_dcs_read(dsi, dcs_cmd,
+				      buf + buf_used, size - buf_used);
 		if (r < 0) {
 			dev_err(dssdev->dev, "read error\n");
 			goto err3;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
