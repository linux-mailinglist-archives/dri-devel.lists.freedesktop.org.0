Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEFD16BC42
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2715B6EA1D;
	Tue, 25 Feb 2020 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151716E9B5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id EBC942935D3
Received: by earth.universe (Postfix, from userid 1000)
 id AD7103C0C88; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 05/56] drm/omap: dsi: use MIPI_DSI_FMT_* instead of
 OMAP_DSS_DSI_FMT_*
Date: Tue, 25 Feb 2020 00:20:35 +0100
Message-Id: <20200224232126.3385250-6-sebastian.reichel@collabora.com>
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

This replaces OMAP specific enum for pixel format with
common implementation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 49 +++++++------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         | 10 +---
 3 files changed, 20 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index e7fe5d702337..e6ebfc35243e 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -595,7 +595,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	int r;
 	struct omap_dss_dsi_config dsi_config = {
 		.mode = OMAP_DSS_DSI_CMD_MODE,
-		.pixel_format = OMAP_DSS_DSI_FMT_RGB888,
+		.pixel_format = MIPI_DSI_FMT_RGB888,
 		.vm = &ddata->vm,
 		.hs_clk_min = 150000000,
 		.hs_clk_max = 300000000,
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 8c39823a8295..bb2548d091ef 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -34,6 +34,7 @@
 #include <linux/sys_soc.h>
 
 #include <video/mipi_display.h>
+#include <drm/drm_mipi_dsi.h>
 
 #include "omapdss.h"
 #include "dss.h"
@@ -410,7 +411,7 @@ struct dsi_data {
 
 	struct dss_lcd_mgr_config mgr_config;
 	struct videomode vm;
-	enum omap_dss_dsi_pixel_format pix_fmt;
+	enum mipi_dsi_pixel_format pix_fmt;
 	enum omap_dss_dsi_mode mode;
 	struct omap_dss_dsi_videomode_timings vm_timings;
 
@@ -514,22 +515,6 @@ static inline bool wait_for_bit_change(struct dsi_data *dsi,
 	return false;
 }
 
-static u8 dsi_get_pixel_size(enum omap_dss_dsi_pixel_format fmt)
-{
-	switch (fmt) {
-	case OMAP_DSS_DSI_FMT_RGB888:
-	case OMAP_DSS_DSI_FMT_RGB666:
-		return 24;
-	case OMAP_DSS_DSI_FMT_RGB666_PACKED:
-		return 18;
-	case OMAP_DSS_DSI_FMT_RGB565:
-		return 16;
-	default:
-		BUG();
-		return 0;
-	}
-}
-
 #ifdef DSI_PERF_MEASURE
 static void dsi_perf_mark_setup(struct dsi_data *dsi)
 {
@@ -3239,7 +3224,7 @@ static void dsi_config_vp_num_line_buffers(struct dsi_data *dsi)
 	int num_line_buffers;
 
 	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
-		int bpp = dsi_get_pixel_size(dsi->pix_fmt);
+		int bpp = mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
 		const struct videomode *vm = &dsi->vm;
 		/*
 		 * Don't use line buffers if width is greater than the video
@@ -3370,7 +3355,7 @@ static void dsi_config_cmd_mode_interleaving(struct dsi_data *dsi)
 	int tclk_trail, ths_exit, exiths_clk;
 	bool ddr_alwon;
 	const struct videomode *vm = &dsi->vm;
-	int bpp = dsi_get_pixel_size(dsi->pix_fmt);
+	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
 	int ndl = dsi->num_lanes_used - 1;
 	int dsi_fclk_hsdiv = dsi->user_dsi_cinfo.mX[HSDIV_DSI] + 1;
 	int hsa_interleave_hs = 0, hsa_interleave_lp = 0;
@@ -3498,7 +3483,7 @@ static int dsi_proto_config(struct dsi_data *dsi)
 	dsi_set_lp_rx_timeout(dsi, 0x1fff, true, true);
 	dsi_set_hs_tx_timeout(dsi, 0x1fff, true, true);
 
-	switch (dsi_get_pixel_size(dsi->pix_fmt)) {
+	switch (mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt)) {
 	case 16:
 		buswidth = 0;
 		break;
@@ -3619,7 +3604,7 @@ static void dsi_proto_timings(struct dsi_data *dsi)
 		int window_sync = dsi->vm_timings.window_sync;
 		bool hsync_end;
 		const struct videomode *vm = &dsi->vm;
-		int bpp = dsi_get_pixel_size(dsi->pix_fmt);
+		int bpp = mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
 		int tl, t_he, width_bytes;
 
 		hsync_end = dsi->vm_timings.trans_mode == OMAP_DSS_DSI_PULSE_MODE;
@@ -3726,7 +3711,7 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
 static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
-	int bpp = dsi_get_pixel_size(dsi->pix_fmt);
+	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
 	u8 data_type;
 	u16 word_count;
 	int r;
@@ -3737,16 +3722,16 @@ static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
 
 	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
 		switch (dsi->pix_fmt) {
-		case OMAP_DSS_DSI_FMT_RGB888:
+		case MIPI_DSI_FMT_RGB888:
 			data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
 			break;
-		case OMAP_DSS_DSI_FMT_RGB666:
+		case MIPI_DSI_FMT_RGB666:
 			data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
 			break;
-		case OMAP_DSS_DSI_FMT_RGB666_PACKED:
+		case MIPI_DSI_FMT_RGB666_PACKED:
 			data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
 			break;
-		case OMAP_DSS_DSI_FMT_RGB565:
+		case MIPI_DSI_FMT_RGB565:
 			data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
 			break;
 		default:
@@ -3824,7 +3809,7 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
 
 	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_VP);
 
-	bytespp	= dsi_get_pixel_size(dsi->pix_fmt) / 8;
+	bytespp	= mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) / 8;
 	bytespl = w * bytespp;
 	bytespf = bytespl * h;
 
@@ -3954,7 +3939,7 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
 
 #ifdef DSI_PERF_MEASURE
 	dsi->update_bytes = dw * dh *
-		dsi_get_pixel_size(dsi->pix_fmt) / 8;
+		mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) / 8;
 #endif
 	dsi_update_screen_dispc(dsi);
 
@@ -4015,7 +4000,7 @@ static int dsi_display_init_dispc(struct dsi_data *dsi)
 
 	dsi->mgr_config.io_pad_mode = DSS_IO_PAD_MODE_BYPASS;
 	dsi->mgr_config.video_port_width =
-			dsi_get_pixel_size(dsi->pix_fmt);
+			mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
 	dsi->mgr_config.lcden_sig_polarity = 0;
 
 	dss_mgr_set_lcd_config(&dsi->output, &dsi->mgr_config);
@@ -4353,7 +4338,7 @@ static bool dsi_cm_calc(struct dsi_data *dsi,
 	unsigned long pck, txbyteclk;
 
 	clkin = clk_get_rate(dsi->pll.clkin);
-	bitspp = dsi_get_pixel_size(cfg->pixel_format);
+	bitspp = mipi_dsi_pixel_format_to_bpp(cfg->pixel_format);
 	ndl = dsi->num_lanes_used - 1;
 
 	/*
@@ -4386,7 +4371,7 @@ static bool dsi_vm_calc_blanking(struct dsi_clk_calc_ctx *ctx)
 {
 	struct dsi_data *dsi = ctx->dsi;
 	const struct omap_dss_dsi_config *cfg = ctx->config;
-	int bitspp = dsi_get_pixel_size(cfg->pixel_format);
+	int bitspp = mipi_dsi_pixel_format_to_bpp(cfg->pixel_format);
 	int ndl = dsi->num_lanes_used - 1;
 	unsigned long hsclk = ctx->dsi_cinfo.clkdco / 4;
 	unsigned long byteclk = hsclk / 4;
@@ -4653,7 +4638,7 @@ static bool dsi_vm_calc(struct dsi_data *dsi,
 	unsigned long pll_min;
 	unsigned long pll_max;
 	int ndl = dsi->num_lanes_used - 1;
-	int bitspp = dsi_get_pixel_size(cfg->pixel_format);
+	int bitspp = mipi_dsi_pixel_format_to_bpp(cfg->pixel_format);
 	unsigned long byteclk_min;
 
 	clkin = clk_get_rate(dsi->pll.clkin);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index b0424daaceed..53fea1cbbc2d 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -14,6 +14,7 @@
 #include <linux/platform_data/omapdss.h>
 #include <uapi/drm/drm_mode.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
 
 #define DISPC_IRQ_FRAMEDONE		(1 << 0)
 #define DISPC_IRQ_VSYNC			(1 << 1)
@@ -116,13 +117,6 @@ enum omap_dss_venc_type {
 	OMAP_DSS_VENC_TYPE_SVIDEO,
 };
 
-enum omap_dss_dsi_pixel_format {
-	OMAP_DSS_DSI_FMT_RGB888,
-	OMAP_DSS_DSI_FMT_RGB666,
-	OMAP_DSS_DSI_FMT_RGB666_PACKED,
-	OMAP_DSS_DSI_FMT_RGB565,
-};
-
 enum omap_dss_dsi_mode {
 	OMAP_DSS_DSI_CMD_MODE = 0,
 	OMAP_DSS_DSI_VIDEO_MODE,
@@ -210,7 +204,7 @@ struct omap_dss_dsi_videomode_timings {
 
 struct omap_dss_dsi_config {
 	enum omap_dss_dsi_mode mode;
-	enum omap_dss_dsi_pixel_format pixel_format;
+	enum mipi_dsi_pixel_format pixel_format;
 	const struct videomode *vm;
 
 	unsigned long hs_clk_min, hs_clk_max;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
