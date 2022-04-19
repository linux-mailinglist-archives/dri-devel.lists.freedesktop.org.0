Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8919507039
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718EB10EF2D;
	Tue, 19 Apr 2022 14:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C648410EF29
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:25:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,272,1643641200"; d="scan'208";a="118458035"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 19 Apr 2022 23:25:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.37])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0D0EE40078C5;
 Tue, 19 Apr 2022 23:24:56 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: bridge: adv7511: Enable DRM_BRIDGE_OP_HPD based on HPD
 interrupt
Date: Tue, 19 Apr 2022 15:24:53 +0100
Message-Id: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Connector detection using poll method won't work in case of bridge
attached to the encoder with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR, as
the code defaults to HPD.

Enable DRM_BRIDGE_OP_HPD based on HPD interrupt availability, so that
it will fall back to polling, if HPD is not available.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 668dcefbae17..b3f10c54e064 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1292,8 +1292,10 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 		goto err_unregister_cec;
 
 	adv7511->bridge.funcs = &adv7511_bridge_funcs;
-	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
-			    | DRM_BRIDGE_OP_HPD;
+	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	if (adv7511->i2c_main->irq)
+		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
+
 	adv7511->bridge.of_node = dev->of_node;
 	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
-- 
2.25.1

