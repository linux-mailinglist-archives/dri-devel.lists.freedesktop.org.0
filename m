Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512CF16BC79
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB20F6EA6C;
	Tue, 25 Feb 2020 08:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525A26E9B7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:28:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id EE0D62935F4
Received: by earth.universe (Postfix, from userid 1000)
 id 364BB3C0C9E; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 27/56] drm/omap: dsi: drop custom enable_te() API
Date: Tue, 25 Feb 2020 00:20:57 +0100
Message-Id: <20200224232126.3385250-28-sebastian.reichel@collabora.com>
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

Instead of using the custon enable_te() API, this automatically
enables/disables TE core support when a matching packet is send
to the panel.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  3 --
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 33 ++++++++++++++-----
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  2 --
 3 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 30e48d0de961..e4ffe34324f8 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -772,7 +772,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
-	struct omap_dss_device *src = ddata->src;
 	struct mipi_dsi_device *dsi = ddata->dsi;
 	int r;
 
@@ -781,8 +780,6 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 	else
 		r = mipi_dsi_dcs_set_tear_off(dsi);
 
-	src->ops->dsi.enable_te(src, enable);
-
 	/* possible panel bug */
 	msleep(100);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 7c160512c886..50a567ebfb86 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4117,10 +4117,8 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
 	mutex_unlock(&dsi->lock);
 }
 
-static int dsi_enable_te(struct omap_dss_device *dssdev, bool enable)
+static int dsi_enable_te(struct dsi_data *dsi, bool enable)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
 	dsi->te_enabled = enable;
 
 	if (dsi->te_gpio) {
@@ -4730,6 +4728,7 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 {
 	struct dsi_data *dsi = host_to_omap(host);
 	struct omap_dss_device *dssdev = &dsi->output;
+	int r;
 
 	if (NEQV(msg->flags & MIPI_DSI_MSG_USE_LPM, dsi->in_lp_mode)) {
 		dsi_vc_enable_hs(dssdev, msg->channel,
@@ -4746,16 +4745,34 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 	case MIPI_DSI_DCS_LONG_WRITE:
 	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
 	case MIPI_DSI_NULL_PACKET:
-		return dsi_vc_write_common(dssdev, msg);
+		r = dsi_vc_write_common(dssdev, msg);
+		break;
 	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
-		return dsi_vc_generic_read(dssdev, msg);
+		r = dsi_vc_generic_read(dssdev, msg);
+		break;
 	case MIPI_DSI_DCS_READ:
-		return dsi_vc_dcs_read(dssdev, msg);
+		r = dsi_vc_dcs_read(dssdev, msg);
+		break;
+	default:
+		r = -EINVAL;
+		break;
 	}
 
-	return -EINVAL;
+	if (r < 0)
+		return r;
+
+	if (msg->type == MIPI_DSI_DCS_SHORT_WRITE ||
+	    msg->type == MIPI_DSI_DCS_SHORT_WRITE_PARAM) {
+		u8 cmd = ((u8*) msg->tx_buf)[0];
+		if (cmd == MIPI_DCS_SET_TEAR_OFF)
+			dsi_enable_te(dsi, false);
+		else if(cmd == MIPI_DCS_SET_TEAR_ON)
+			dsi_enable_te(dsi, true);
+	}
+
+	return 0;
 }
 
 static int dsi_get_clocks(struct dsi_data *dsi)
@@ -4802,8 +4819,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.disable_video_output = dsi_disable_video_output,
 
 		.update = dsi_update,
-
-		.enable_te = dsi_enable_te,
 	},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 355aa235c23c..dc41f982a082 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -287,8 +287,6 @@ struct omapdss_dsi_ops {
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
 
-	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
-
 	int (*update)(struct omap_dss_device *dssdev, int channel,
 			void (*callback)(int, void *), void *data);
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
