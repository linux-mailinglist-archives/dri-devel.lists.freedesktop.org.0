Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4262C25F2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F9D6E3C6;
	Tue, 24 Nov 2020 12:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFC66E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:46:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCkNK9122985;
 Tue, 24 Nov 2020 06:46:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606221983;
 bh=u97hivnVVVpmtB/A4xhuWODhZrBF7+A/RPibRVMoC5A=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=T8QjetVLs0RbktO9WU22IrNkwR9lChY1wguoSCPBzIVM1pI9ujfzp7ku1mUrWaWGl
 Ikzyo/yu0uXV79SXXuqLp24PKqQI38ciaDS38g4Pd/F/N7VYu/hf2MKtgnlfKhsPYz
 BkP0tC2VxqGf/jnYDt5uJecuA07kcNo2C70pbC3U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCkNFj044984
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:46:23 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:23 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:23 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmp2040922;
 Tue, 24 Nov 2020 06:46:21 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 13/80] drm/omap: panel-dsi-cm: use DSI helpers
Date: Tue, 24 Nov 2020 14:44:31 +0200
Message-ID: <20201124124538.660710-14-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

After converting the driver to mipi_dsi_device we can use the generic
message helpers to simplify the driver a lot.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 125 +++---------------
 1 file changed, 18 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index c3190223d192..ec36e62ddc3a 100644
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
 
@@ -248,45 +208,15 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
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
@@ -680,12 +610,11 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
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
 
@@ -731,7 +660,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 
 	src->ops->dsi.disable_video_output(src, ddata->channel);
 
-	r = dsicm_dcs_write_0(ddata, MIPI_DCS_SET_DISPLAY_OFF);
+	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
 	if (!r)
 		r = dsicm_sleep_in(ddata);
 
@@ -949,12 +878,13 @@ static int dsicm_sync(struct omap_dss_device *dssdev)
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
@@ -1020,19 +950,7 @@ static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
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
@@ -1082,17 +1000,10 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 
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
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
