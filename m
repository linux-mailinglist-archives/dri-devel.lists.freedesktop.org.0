Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B992C260B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39ED96E406;
	Tue, 24 Nov 2020 12:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08946E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:46:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCkrdk123556;
 Tue, 24 Nov 2020 06:46:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222013;
 bh=JVl0vgYBqgsC/2PI/8IXGB9sw0WmwA3diEdq0vA5hLg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=RXIIX+OGE9UNFYFVUZW+0o5Yd6IZIO6ZK3G0gXym6NrlJhJwQQQnp1/hSnvKGemuG
 o5ka2B5jWchne2HYEo/m8nryh4/TbRxNSrN6M7WKNEhdnns383JEmmQIRX3Id9gDTv
 uVMqgqfpZAzweipCjETbLqFa2lctrXP7cs1zFVR0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCkrIn042191
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:46:53 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:53 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpE040922;
 Tue, 24 Nov 2020 06:46:50 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 25/80] drm/omap: dsi: drop custom enable_te() API
Date: Tue, 24 Nov 2020 14:44:43 +0200
Message-ID: <20201124124538.660710-26-tomi.valkeinen@ti.com>
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

Instead of using the custom enable_te() API, this automatically
enables/disables TE core support when a matching packet is sent
to the panel.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  3 --
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 34 ++++++++++++++-----
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  2 --
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 35810ec65b7a..766edeecdd79 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -769,7 +769,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
-	struct omap_dss_device *src = ddata->src;
 	struct mipi_dsi_device *dsi = ddata->dsi;
 	int r;
 
@@ -778,8 +777,6 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 	else
 		r = mipi_dsi_dcs_set_tear_off(dsi);
 
-	src->ops->dsi.enable_te(src, enable);
-
 	/* possible panel bug */
 	msleep(100);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index b26cbedd7e76..e0d0efffd923 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4110,10 +4110,8 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
 	mutex_unlock(&dsi->lock);
 }
 
-static int dsi_enable_te(struct omap_dss_device *dssdev, bool enable)
+static int dsi_enable_te(struct dsi_data *dsi, bool enable)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
 	dsi->te_enabled = enable;
 
 	if (dsi->te_gpio) {
@@ -4723,6 +4721,7 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 {
 	struct dsi_data *dsi = host_to_omap(host);
 	struct omap_dss_device *dssdev = &dsi->output;
+	int r;
 
 	if (!!(msg->flags & MIPI_DSI_MSG_USE_LPM) != dsi->in_lp_mode)
 		dsi_vc_enable_hs(dssdev, msg->channel,
@@ -4738,16 +4737,35 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
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
+		u8 cmd = ((u8 *)msg->tx_buf)[0];
+
+		if (cmd == MIPI_DCS_SET_TEAR_OFF)
+			dsi_enable_te(dsi, false);
+		else if (cmd == MIPI_DCS_SET_TEAR_ON)
+			dsi_enable_te(dsi, true);
+	}
+
+	return 0;
 }
 
 static int dsi_get_clocks(struct dsi_data *dsi)
@@ -4794,8 +4812,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.disable_video_output = dsi_disable_video_output,
 
 		.update = dsi_update,
-
-		.enable_te = dsi_enable_te,
 	},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 2d44a8e32fcc..1520a5f752b7 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -288,8 +288,6 @@ struct omapdss_dsi_ops {
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
 
-	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
-
 	int (*update)(struct omap_dss_device *dssdev, int channel,
 			void (*callback)(int, void *), void *data);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
