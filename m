Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410371F0EFC
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88626E3D2;
	Sun,  7 Jun 2020 19:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90B76E117
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1591537134; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOWmwRmqX4DuTe+vROvPFvUfPPtiRZ4MS+mELI//ba4=;
 b=fGH9NhsbhX3Xzs6sFHEGU0tPNAbmpRB23reN1HU5EIYaIPd8t0oR4jD8vGxki4wdtbBkKn
 s3ukzGzhVR2ZLCKePgjOGbz5A1rPi/1Ny2vGz0u7OWZVkfJ6GwRWAExy7s4QYDlE1RDBdi
 qbAYb7N6G25FSnXOhQqjEYXO7ChrWq0=
From: Paul Cercueil <paul@crapouillou.net>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [RFC PATCH 1/4] gpu/drm: dsi: Let host and device specify supported
 bus
Date: Sun,  7 Jun 2020 15:38:29 +0200
Message-Id: <20200607133832.1730288-2-paul@crapouillou.net>
In-Reply-To: <20200607133832.1730288-1-paul@crapouillou.net>
References: <20200607133832.1730288-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_mipi_dsi.c |  9 +++++++++
 include/drm/drm_mipi_dsi.h     | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 55531895dde6..fe0d874d1594 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -282,6 +282,9 @@ int mipi_dsi_host_register(struct mipi_dsi_host *host)
 {
 	struct device_node *node;
 
+	if (WARN_ON_ONCE(!host->bus_types))
+		host->bus_types = MIPI_DEVICE_TYPE_DSI;
+
 	for_each_available_child_of_node(host->dev->of_node, node) {
 		/* skip nodes without reg property */
 		if (!of_find_property(node, "reg", NULL))
@@ -324,6 +327,12 @@ int mipi_dsi_attach(struct mipi_dsi_device *dsi)
 {
 	const struct mipi_dsi_host_ops *ops = dsi->host->ops;
 
+	if (WARN_ON_ONCE(!dsi->bus_type))
+		dsi->bus_type = MIPI_DEVICE_TYPE_DSI;
+
+	if (!(dsi->bus_type & dsi->host->bus_types))
+		return -ENOTSUPP;
+
 	if (!ops || !ops->attach)
 		return -ENOSYS;
 
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 360e6377e84b..65d2961fc054 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -63,6 +63,14 @@ struct mipi_dsi_packet {
 int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
 			   const struct mipi_dsi_msg *msg);
 
+/* MIPI bus types */
+#define MIPI_DEVICE_TYPE_DSI		BIT(0)
+#define MIPI_DEVICE_TYPE_DBI_SPI_MODE1	BIT(1)
+#define MIPI_DEVICE_TYPE_DBI_SPI_MODE2	BIT(2)
+#define MIPI_DEVICE_TYPE_DBI_SPI_MODE3	BIT(3)
+#define MIPI_DEVICE_TYPE_DBI_M6800	BIT(4)
+#define MIPI_DEVICE_TYPE_DBI_I8080	BIT(5)
+
 /**
  * struct mipi_dsi_host_ops - DSI bus operations
  * @attach: attach DSI device to DSI host
@@ -94,11 +102,13 @@ struct mipi_dsi_host_ops {
  * struct mipi_dsi_host - DSI host device
  * @dev: driver model device node for this DSI host
  * @ops: DSI host operations
+ * @bus_types: Bitmask of supported MIPI bus types
  * @list: list management
  */
 struct mipi_dsi_host {
 	struct device *dev;
 	const struct mipi_dsi_host_ops *ops;
+	unsigned int bus_types;
 	struct list_head list;
 };
 
@@ -162,6 +172,7 @@ struct mipi_dsi_device_info {
  * @host: DSI host for this peripheral
  * @dev: driver model device node for this peripheral
  * @name: DSI peripheral chip type
+ * @bus_type: MIPI bus type (MIPI_DEVICE_TYPE_DSI/...)
  * @channel: virtual channel assigned to the peripheral
  * @format: pixel format for video mode
  * @lanes: number of active data lanes
@@ -178,6 +189,7 @@ struct mipi_dsi_device {
 	struct device dev;
 
 	char name[DSI_DEV_NAME_SIZE];
+	unsigned int bus_type;
 	unsigned int channel;
 	unsigned int lanes;
 	enum mipi_dsi_pixel_format format;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
