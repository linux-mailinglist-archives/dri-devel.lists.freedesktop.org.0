Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAC41E18E0
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45B789DE1;
	Tue, 26 May 2020 01:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B97689CC4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:33 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65D4E1184;
 Tue, 26 May 2020 03:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455730;
 bh=l1FrC1ZMgvnMXyYYkzQSVw3akBKKxcrW9BC/q6YkcII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=miXw5LJYSgmfdN5C1bWk92G9TahiR7JSvRUlM1y5ywHjbeU7k5rExREczK6sSe3R3
 MZjgquF9+7MTWm2RHS2nRENtNpMIdAT8IPx5imLViKhCLIqombv5YnZXDh/NaPTzGw
 qnPxE5soSZJYiU0euvdYdPHO5nRCwa1/goStpjsU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/27] drm: bridge: simple-bridge: Make connector creation
 optional
Date: Tue, 26 May 2020 04:14:45 +0300
Message-Id: <20200526011505.31884-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the connector creation optional to enable usage of the
simple-bridge with the DRM bridge connector helper.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index a1be269d833a..d974282c12b2 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -105,16 +105,14 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
 	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
 		return -ENODEV;
@@ -131,8 +129,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	drm_connector_attach_encoder(&sbridge->connector,
-					  bridge->encoder);
+	drm_connector_attach_encoder(&sbridge->connector, bridge->encoder);
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
