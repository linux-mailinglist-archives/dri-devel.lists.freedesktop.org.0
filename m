Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6CC3436FF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 04:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DCC89D40;
	Mon, 22 Mar 2021 03:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A552489C54
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:02:23 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E09710D2;
 Mon, 22 Mar 2021 04:02:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616382142;
 bh=tKObpVU+HZGmT+ktY1Or1lY75NR7AlArdmRjpXdcfb4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ta3b1Qvy4gJRxy9vFiCrcxJQAVQF/wO6IFvyX3D8uW1SA7xiMEsoxDo+WZJBV3Knv
 5pKUS+9AzQYzhfL+8QNmAdcj5GlxXocHOFHLhxwHY6RFdLB12ds0YDu1fWRSnxhGEM
 wIsIHVZ05ppQlBrxye6qOVn6gzSciBjG+sROedqE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 07/11] drm/bridge: ti-sn65dsi86: Split connector creation
 to a function
Date: Mon, 22 Mar 2021 05:01:24 +0200
Message-Id: <20210322030128.2283-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To prepare for making connector creation option, move connector creation
out of ti_sn_bridge_attach to a separate function.

No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 31 ++++++++++++++++++---------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 7f5d53c74978..dc300fab4319 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -331,6 +331,25 @@ static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static int ti_sn_bridge_connector_init(struct ti_sn_bridge *pdata)
+{
+	int ret;
+
+	ret = drm_connector_init(pdata->bridge.dev, &pdata->connector,
+				 &ti_sn_bridge_connector_funcs,
+				 DRM_MODE_CONNECTOR_eDP);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(&pdata->connector,
+				 &ti_sn_bridge_connector_helper_funcs);
+	drm_connector_attach_encoder(&pdata->connector, pdata->bridge.encoder);
+
+	return 0;
+}
+
 /*------------------------------------------------------------------------------
  * DRM Bridge Operations
  */
@@ -357,17 +376,9 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	ret = drm_connector_init(bridge->dev, &pdata->connector,
-				 &ti_sn_bridge_connector_funcs,
-				 DRM_MODE_CONNECTOR_eDP);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
+	ret = ti_sn_bridge_connector_init(pdata);
+	if (ret < 0)
 		return ret;
-	}
-
-	drm_connector_helper_add(&pdata->connector,
-				 &ti_sn_bridge_connector_helper_funcs);
-	drm_connector_attach_encoder(&pdata->connector, bridge->encoder);
 
 	/*
 	 * TODO: ideally finding host resource and dsi dev registration needs
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
