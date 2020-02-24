Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF8616B4AC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 23:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C666E22C;
	Mon, 24 Feb 2020 22:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BEE6E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 22:57:11 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30340E89;
 Mon, 24 Feb 2020 23:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582585030;
 bh=0BYDLIIXHzuYUszryQCjJox6Ug17jkp0uymPPCJ3WWk=;
 h=From:To:Cc:Subject:Date:From;
 b=f3JYVcsAMJbsSp0ejkXnghrWsxdZugX+D4e0uNYbeOCbsRso0wjSBoJ/H1IMVvu5S
 b4LPE6WHIzxWXz+XYs2S5ILibJXG3zdd3QPSNLdwrpQPG1AnQXins/eRfwjNzfKSo+
 4oepQxXdzvwJkMU6JaeHE9FMv9T1szaE3iLaQSK8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: lvds-codec: Add to_lvds_codec() functino
Date: Tue, 25 Feb 2020 00:56:45 +0200
Message-Id: <20200224225645.28060-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Factor out the manual container_of() uses to a common to_lvds_codec()
macro to shorten lines (and provide better type safety, although that
won't matter much in this case).

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/lvds-codec.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

Boris,

This patch conflicts with "[PATCH v10 08/12] drm/bridge: lvds-codec:
Implement basic bus format negotiation" (it's actually a drive-by patch
that I wrote as I was reviewing yours series). Feel free to get it
merged first if that can help.

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 5f04cc11227e..ae173d84dc8f 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -21,10 +21,14 @@ struct lvds_codec {
 	u32 connector_type;
 };
 
+static inline struct lvds_codec *to_lvds_codec(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct lvds_codec, bridge);
+}
+
 static int lvds_codec_attach(struct drm_bridge *bridge)
 {
-	struct lvds_codec *lvds_codec = container_of(bridge,
-						     struct lvds_codec, bridge);
+	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
 
 	return drm_bridge_attach(bridge->encoder, lvds_codec->panel_bridge,
 				 bridge);
@@ -32,8 +36,7 @@ static int lvds_codec_attach(struct drm_bridge *bridge)
 
 static void lvds_codec_enable(struct drm_bridge *bridge)
 {
-	struct lvds_codec *lvds_codec = container_of(bridge,
-						     struct lvds_codec, bridge);
+	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
 
 	if (lvds_codec->powerdown_gpio)
 		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 0);
@@ -41,8 +44,7 @@ static void lvds_codec_enable(struct drm_bridge *bridge)
 
 static void lvds_codec_disable(struct drm_bridge *bridge)
 {
-	struct lvds_codec *lvds_codec = container_of(bridge,
-						     struct lvds_codec, bridge);
+	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
 
 	if (lvds_codec->powerdown_gpio)
 		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
