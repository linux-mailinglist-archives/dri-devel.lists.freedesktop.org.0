Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44F928564E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 03:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5D36E84D;
	Wed,  7 Oct 2020 01:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B3B6E84D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 01:25:31 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44E0642C1;
 Wed,  7 Oct 2020 03:25:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602033929;
 bh=MHfduSLX31zuVOOXzvh2ussiuPmUCawVbuRbsDCAyTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AJHzLw0jJP0BrwnbDCnWP9OL5GTR/hRjL7VaaVA4TdD8TjXbECG0K05odvq4YaWnL
 0EQT5dQ1kWXvoYySakhOk0MKin/5+e7c4W9IqW+cEptHmRQ514L+9d2lMfJ09mT5k6
 lhLnILJWVRekdw+YWK+5W8rSK6/P8+QiK6O56miI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm: mxsfb: Add support for the bus-width DT property
Date: Wed,  7 Oct 2020 04:24:38 +0300
Message-Id: <20201007012438.27970-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A new bus-width DT property has been introduced in the bindings to allow
overriding the bus width. Support it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c |  8 ++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 35122aef037b..d52cf8a506a5 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -114,10 +114,36 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
 	struct drm_connector_list_iter iter;
+	struct device_node *ep;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
+	u32 bus_width = 0;
 	int ret;
 
+	ep = of_graph_get_endpoint_by_regs(drm->dev->of_node, 0, 0);
+	if (!ep)
+		return -ENODEV;
+
+	of_property_read_u32(ep, "bus-width", &bus_width);
+	of_node_put(ep);
+
+	switch (bus_width) {
+	case 16:
+		mxsfb->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
+		break;
+	case 18:
+		mxsfb->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
+		break;
+	case 24:
+		mxsfb->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case 0:
+		break;
+	default:
+		DRM_DEV_ERROR(drm->dev, "Invalid bus-width %u", bus_width);
+		return -ENODEV;
+	}
+
 	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
 					  &bridge);
 	if (ret)
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index 399d23e91ed1..c4f7a8a0c891 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -32,6 +32,8 @@ struct mxsfb_drm_private {
 	struct clk			*clk_axi;
 	struct clk			*clk_disp_axi;
 
+	u32				bus_format;
+
 	struct drm_device		*drm;
 	struct {
 		struct drm_plane	primary;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index b721b8b262ce..6d512f346918 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -50,11 +50,15 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
 	const u32 format = mxsfb->crtc.primary->state->fb->format->format;
-	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	u32 bus_format;
 	u32 ctrl, ctrl1;
 
-	if (mxsfb->connector->display_info.num_bus_formats)
+	if (mxsfb->bus_format)
+		bus_format = mxsfb->bus_format;
+	else if (mxsfb->connector->display_info.num_bus_formats)
 		bus_format = mxsfb->connector->display_info.bus_formats[0];
+	else
+		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Using bus_format: 0x%08X\n",
 			     bus_format);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
