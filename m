Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1331AEB47
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8716EC64;
	Sat, 18 Apr 2020 09:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE116E3F3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:06:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 2C4E42A1998
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org,
	Collabora Kernel ML <kernel@collabora.com>
Subject: [PATCH v3 1/7] drm/bridge: ps8640: Get the EDID from eDP control
Date: Fri, 17 Apr 2020 17:06:08 +0200
Message-Id: <20200417150614.2631786-2-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200417150614.2631786-1-enric.balletbo@collabora.com>
References: <20200417150614.2631786-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PS8640 DSI-to-eDP bridge can retrieve the EDID, so implement the
.get_edid callback and set the flag to indicate the core to use it.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v3: None
Changes in v2: None

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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
