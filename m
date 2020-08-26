Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C854F253E56
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D737F6EB28;
	Thu, 27 Aug 2020 06:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554F76EA05
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 08:15:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 6D63B2969DF
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] drm/bridge: ps8640: Get the EDID from eDP control
Date: Wed, 26 Aug 2020 10:15:23 +0200
Message-Id: <20200826081526.674866-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826081526.674866-1-enric.balletbo@collabora.com>
References: <20200826081526.674866-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PS8640 DSI-to-eDP bridge can retrieve the EDID, so implement the
.get_edid callback and set the flag to indicate the core to use it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2:
- Included the patch `drm/bridge: ps8640: Get the EDID from eDP control`

 drivers/gpu/drm/bridge/parade-ps8640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 4b099196afeb..13755d278db6 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -242,8 +242,18 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 	return ret;
 }
 
+static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
+					   struct drm_connector *connector)
+{
+	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
+
+	return drm_get_edid(connector,
+			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
+}
+
 static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.attach = ps8640_bridge_attach,
+	.get_edid = ps8640_bridge_get_edid,
 	.post_disable = ps8640_post_disable,
 	.pre_enable = ps8640_pre_enable,
 };
@@ -294,6 +304,8 @@ static int ps8640_probe(struct i2c_client *client)
 
 	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
 	ps_bridge->bridge.of_node = dev->of_node;
+	ps_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
+	ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
 
 	ps_bridge->page[PAGE0_DP_CNTL] = client;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
