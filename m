Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DBB442ED4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 14:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F346FD53;
	Tue,  2 Nov 2021 13:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F636FD53
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 13:08:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B42891F4490B
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: a.hajda@samsung.com
Subject: [PATCH] drm/bridge: parade-ps8640: Link device to ensure
 suspend/resume order
Date: Tue,  2 Nov 2021 14:04:28 +0100
Message-Id: <20211102130428.444795-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Entering suspend while the display attached to this bridge is still on
makes the resume sequence to resume the bridge first, display last:
when this happens, we get a timeout while resuming the bridge, as its
MCU will get stuck due to the display being unpowered.

On the other hand, on mt8173-elm, closing the lid makes the display to
get powered off first, bridge last, so at resume time the sequence is
swapped (compared to the first example) and everything just works
as expected.

Add a stateless device link to the DRM device that this bridge belongs
to, ensuring a correct resume sequence and solving the unability to
correctly resume bridge operation in the first mentioned example.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 45100edd745b..191cc196c9d1 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -100,6 +100,7 @@ struct ps8640 {
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *gpio_reset;
 	struct gpio_desc *gpio_powerdown;
+	struct device_link *link;
 	bool powered;
 };
 
@@ -460,10 +461,23 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 		goto err_aux_register;
 	}
 
+	ps_bridge->link = device_link_add(bridge->dev->dev, dev, DL_FLAG_STATELESS);
+	if (!ps_bridge->link) {
+		dev_err(dev, "failed to create device link");
+		ret = -EINVAL;
+		goto err_devlink;
+	}
+
 	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
+	ret = drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
 				 &ps_bridge->bridge, flags);
+	if (ret)
+		goto err_bridge_attach;
 
+err_bridge_attach:
+	device_link_del(ps_bridge->link);
+err_devlink:
+	drm_dp_aux_unregister(&ps_bridge->aux);
 err_aux_register:
 	mipi_dsi_detach(dsi);
 err_dsi_attach:
@@ -473,7 +487,11 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 
 static void ps8640_bridge_detach(struct drm_bridge *bridge)
 {
-	drm_dp_aux_unregister(&bridge_to_ps8640(bridge)->aux);
+	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
+
+	drm_dp_aux_unregister(&ps_bridge->aux);
+	if (ps_bridge->link)
+		device_link_del(ps_bridge->link);
 }
 
 static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
-- 
2.33.1

