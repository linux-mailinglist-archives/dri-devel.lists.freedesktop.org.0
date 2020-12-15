Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7792DAB10
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C046E1B3;
	Tue, 15 Dec 2020 10:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3006E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:05 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAl4eT123818
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029224;
 bh=HwMEREB9kst+oKhqFJnpP+wZ3mNX85Zj4XQW8pmylj4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=rRP2X3T9tXrIZSVZUKFPQkGIzfDFlcv8YuU34jY7UmxILFRv+viKO5LFMjVgl5jN/
 nDjuuMFGSy7L1Jmx5FuL/NwWDVcLDmXB3mDyoH/8lbm1F58JHGxMwbXUAjcySklNhH
 HSrTFsISZDjO1XTSu49mzFSlfjHIYZuYXKM66G38=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAl4nw022540
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:04 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:04 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwZp046467;
 Tue, 15 Dec 2020 04:47:03 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 05/84] drm/omap: dsi: add generic transfer function
Date: Tue, 15 Dec 2020 12:45:38 +0200
Message-ID: <20201215104657.802264-6-tomi.valkeinen@ti.com>
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

This prepares the driver for becoming a mipi_dsi_host implementation,
which provides a generic transfer function instead of all kind of
different read/write functions. The implementation will become more
elegant after unexporting the specific functions in the following
patches.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 54 +++++++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  3 ++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 91c8c1f29ae2..1e73fb175bfe 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4840,6 +4840,58 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
 	}
 }
 
+static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
+				 const struct mipi_dsi_msg *msg)
+{
+	/*
+	 * TODO: no_sync can be used to optimize performance by sending e.g.
+	 * column and page information without syncing in between. It's not
+	 * absolutely required, so postpone this feature for now.
+	 */
+	bool no_sync = false;
+	u16 val;
+
+	switch (msg->type) {
+	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
+	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
+	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
+	case MIPI_DSI_GENERIC_LONG_WRITE:
+		if (no_sync)
+			return dsi_vc_generic_write_nosync(dssdev, msg->channel,
+							   msg->tx_buf,
+							   msg->tx_len);
+		else
+			return dsi_vc_generic_write(dssdev, msg->channel,
+						    msg->tx_buf, msg->tx_len);
+	case MIPI_DSI_DCS_SHORT_WRITE:
+	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
+	case MIPI_DSI_DCS_LONG_WRITE:
+		if (no_sync)
+			return dsi_vc_dcs_write_nosync(dssdev, msg->channel,
+						       msg->tx_buf,
+						       msg->tx_len);
+		else
+			return dsi_vc_dcs_write(dssdev, msg->channel,
+						msg->tx_buf, msg->tx_len);
+	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
+	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
+	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
+		return dsi_vc_generic_read(dssdev, msg->channel,
+					   msg->tx_buf, msg->tx_len,
+					   msg->rx_buf, msg->rx_len);
+	case MIPI_DSI_DCS_READ:
+		return dsi_vc_dcs_read(dssdev, msg->channel,
+				       ((u8 *)msg->tx_buf)[0],
+				       msg->rx_buf, msg->rx_len);
+	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
+		val = le16_to_cpu(*((__le16 *)msg->tx_buf));
+		return dsi_vc_set_max_rx_packet_size(dssdev, msg->channel, val);
+	case MIPI_DSI_NULL_PACKET:
+		return dsi_vc_send_null(to_dsi_data(dssdev), msg->channel);
+	}
+
+	return -EINVAL;
+}
 
 static int dsi_get_clocks(struct dsi_data *dsi)
 {
@@ -4894,6 +4946,8 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.set_vc_id = dsi_set_vc_id,
 		.release_vc = dsi_release_vc,
 
+		.transfer = omap_dsi_transfer,
+
 		.dcs_write = dsi_vc_dcs_write,
 		.dcs_write_nosync = dsi_vc_dcs_write_nosync,
 		.dcs_read = dsi_vc_dcs_read,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index c3d65da2e7cf..4e1988f05a27 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -308,6 +308,9 @@ struct omapdss_dsi_ops {
 	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
 
 	/* data transfer */
+	ssize_t (*transfer)(struct omap_dss_device *dssdev,
+			    const struct mipi_dsi_msg *msg);
+
 	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
 			const u8 *data, int len);
 	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
