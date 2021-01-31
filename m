Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5C8309BAE
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69576E284;
	Sun, 31 Jan 2021 11:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Sun, 31 Jan 2021 10:02:46 UTC
Received: from aruko.org (aruko.org [45.79.249.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970E16E1F7
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 10:02:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.111.80.72])
 by aruko.org (Postfix) with ESMTPSA id 846097F490;
 Sun, 31 Jan 2021 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruko.org; s=mail;
 t=1612086979; bh=BR+v5+Lk98D4lDAW6A9QFAcr2Xt0wa+x6kocx5HNdWo=;
 h=From:To:Cc:Subject:Date;
 b=ivbh9MwRO2AXcUIv7cXD8CkWnS7ciFW5GM+j8AnnwD/ctqxV0yNwCfqLQFlh2QwC9
 KH0RvaaE2BaO0poU2GRdJesve11fj6CztTcH9LKwj+WsdyjgGrIBec0mXK0d2qEYfA
 ArQ6FoQd3nlPLjQEb/8sPSDTQRw0Fd278MZxzyXg=
From: Mykyta Poturai <ddone@aruko.org>
To: 
Subject: [PATCH 1/2] drm/bridge: dw-hdmi: Add DT binding to disable hotplug
 detect
Date: Sun, 31 Jan 2021 11:55:35 +0200
Message-Id: <20210131095537.962292-1-ddone@aruko.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:43:06 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Mykyta Poturai <ddone@aruko.org>, Liu Ying <victor.liu@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add "disable-hpd" boolean binding for the device tree. When this option
is turned on HPD-related IRQ is disabled and it is assumed that the HDMI
connector is connected all the time. This may be useful in systems where
it is impossible or undesirable to connect the HPD pin, or the
connection is broken.

Signed-off-by: Mykyta Poturai <ddone@aruko.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0c79a9ba48bb..4ca0ac130beb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -194,6 +194,7 @@ struct dw_hdmi {
 	unsigned int audio_cts;
 	unsigned int audio_n;
 	bool audio_enable;
+	bool disable_hpd;
 
 	unsigned int reg_shift;
 	struct regmap *regm;
@@ -1559,7 +1560,7 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi, void *data)
 enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
 					       void *data)
 {
-	return hdmi_readb(hdmi, HDMI_PHY_STAT0) & HDMI_PHY_HPD ?
+	return hdmi_readb(hdmi, HDMI_PHY_STAT0) & HDMI_PHY_HPD || hdmi->disable_hpd ?
 		connector_status_connected : connector_status_disconnected;
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_phy_read_hpd);
@@ -1585,6 +1586,10 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data)
 	 * Configure the PHY RX SENSE and HPD interrupts polarities and clear
 	 * any pending interrupt.
 	 */
+
+	if (hdmi->disable_hpd)
+		return;
+
 	hdmi_writeb(hdmi, HDMI_PHY_HPD | HDMI_PHY_RX_SENSE, HDMI_PHY_POL0);
 	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
 		    HDMI_IH_PHY_STAT0);
@@ -3212,6 +3217,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	mutex_init(&hdmi->cec_notifier_mutex);
 	spin_lock_init(&hdmi->audio_lock);
 
+	if (of_property_read_bool(np, "disable-hpd")) {
+		dev_info(hdmi->dev, "Disabling HPD\n");
+		hdmi->disable_hpd = true;
+	}
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
 	if (ddc_node) {
 		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
