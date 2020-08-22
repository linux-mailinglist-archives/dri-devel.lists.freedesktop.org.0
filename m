Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB0224F2C6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9B26EC69;
	Mon, 24 Aug 2020 06:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392A66E49F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1598113988; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WfNRbEJZEnZc9fPSpxagPZ7k9KHz4hXzsq1mWzAp208=;
 b=NCRk5hkRilgxRq0Rsghrw0pYFe2GgMPQ2b2bd1C6qDeg+dSdFiccudS0g0qjqoNNhwbtvb
 xb4kaVhnlY5WGyFh49dh/nBrC0fRzIqthhwkKDb2vppclFoywaFOhl9WeIZFMIc1bAr5Wc
 bicCCERlHhxA7tGgYAo7+CgjtSwlvnI=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Noralf Tronnes <noralf@tronnes.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 2/6] drm: dsi: Let host and device specify supported bus
Date: Sat, 22 Aug 2020 18:32:46 +0200
Message-Id: <20200822163250.63664-3-paul@crapouillou.net>
In-Reply-To: <20200822163250.63664-1-paul@crapouillou.net>
References: <20200822163250.63664-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current MIPI DSI framework can very well be used to support MIPI DBI
panels. In order to add support for the various bus types supported by
DBI, the DRM panel drivers should specify the bus type they will use,
and the DSI host drivers should specify the bus types they are
compatible with.

The DSI host driver can then use the information provided by the DBI/DSI
device driver, such as the bus type and the number of lanes, to
configure its hardware properly.

v2: - Remove the WARN_ON_ONCE() if (dbi->bus_types == 0), because it
      will trigger for every panel out there. Just default to
      MIPI_DCS_BUS_TYPE_DSI if the bitmask is not populated.
    - Create a 'enum mipi_dcs_bus_type' instead of macros
    - Rename values to avoid confusion about SPI modes

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_mipi_dsi.c |  9 +++++++++
 include/drm/drm_mipi_dsi.h     | 25 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 5dd475e82995..a3cbea8019cc 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -281,6 +281,9 @@ int mipi_dsi_host_register(struct mipi_dsi_host *host)
 {
 	struct device_node *node;
 
+	if (!host->bus_types)
+		host->bus_types = MIPI_DCS_BUS_TYPE_DSI;
+
 	for_each_available_child_of_node(host->dev->of_node, node) {
 		/* skip nodes without reg property */
 		if (!of_find_property(node, "reg", NULL))
@@ -323,6 +326,12 @@ int mipi_dsi_attach(struct mipi_dsi_device *dsi)
 {
 	const struct mipi_dsi_host_ops *ops = dsi->host->ops;
 
+	if (!dsi->bus_type)
+		dsi->bus_type = MIPI_DCS_BUS_TYPE_DSI;
+
+	if (!(dsi->bus_type & dsi->host->bus_types))
+		return -EINVAL;
+
 	if (!ops || !ops->attach)
 		return -ENOSYS;
 
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 360e6377e84b..802644c4c0c4 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -63,6 +63,27 @@ struct mipi_dsi_packet {
 int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
 			   const struct mipi_dsi_msg *msg);
 
+/**
+ * enum mipi_dcs_bus_type - MIPI DCS bus types
+ * @MIPI_DCS_BUS_TYPE_DSI: MIPI DSI
+ * @MIPI_DCS_BUS_TYPE_DBI_SPI_C1: DBI with SPI carrier, 9 bits per word, with
+ *    the data/command information in the 9th (MSB) bit
+ * @MIPI_DCS_BUS_TYPE_DBI_SPI_C2: DBI with SPI carrier, 16 bits per word, with
+ *    the data/command information in the 9th bit, and 7 MSB bits of padding
+ * @MIPI_DCS_BUS_TYPE_DBI_SPI_C3: DBI with SPI carrier, 8 bits per word, with
+ *    the data/command information carried by a separate GPIO
+ * @MIPI_DCS_BUS_TYPE_DBI_M6800: Motorola 6800 type parallel bus
+ * @MIPI_DCS_BUS_TYPE_DBI_I8080: Intel 8080 type parallel bus
+ */
+enum mipi_dcs_bus_type {
+	MIPI_DCS_BUS_TYPE_DSI		= BIT(0),
+	MIPI_DCS_BUS_TYPE_DBI_SPI_C1	= BIT(1),
+	MIPI_DCS_BUS_TYPE_DBI_SPI_C2	= BIT(2),
+	MIPI_DCS_BUS_TYPE_DBI_SPI_C3	= BIT(3),
+	MIPI_DCS_BUS_TYPE_DBI_M6800	= BIT(4),
+	MIPI_DCS_BUS_TYPE_DBI_I8080	= BIT(5),
+};
+
 /**
  * struct mipi_dsi_host_ops - DSI bus operations
  * @attach: attach DSI device to DSI host
@@ -94,11 +115,13 @@ struct mipi_dsi_host_ops {
  * struct mipi_dsi_host - DSI host device
  * @dev: driver model device node for this DSI host
  * @ops: DSI host operations
+ * @bus_types: Bitmask of supported MIPI bus types (enum mipi_dcs_bus_type)
  * @list: list management
  */
 struct mipi_dsi_host {
 	struct device *dev;
 	const struct mipi_dsi_host_ops *ops;
+	unsigned int bus_types;
 	struct list_head list;
 };
 
@@ -162,6 +185,7 @@ struct mipi_dsi_device_info {
  * @host: DSI host for this peripheral
  * @dev: driver model device node for this peripheral
  * @name: DSI peripheral chip type
+ * @bus_type: MIPI bus type
  * @channel: virtual channel assigned to the peripheral
  * @format: pixel format for video mode
  * @lanes: number of active data lanes
@@ -178,6 +202,7 @@ struct mipi_dsi_device {
 	struct device dev;
 
 	char name[DSI_DEV_NAME_SIZE];
+	enum mipi_dcs_bus_type bus_type;
 	unsigned int channel;
 	unsigned int lanes;
 	enum mipi_dsi_pixel_format format;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
