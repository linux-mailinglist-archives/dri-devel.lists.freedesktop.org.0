Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6473B242C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 02:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C1B6E999;
	Thu, 24 Jun 2021 00:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E847E6E993
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 00:03:45 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECB9118C1;
 Thu, 24 Jun 2021 02:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624493024;
 bh=oFPwlxYSCOaEjFtXxkzhNK7EAUyIs+bxdI9mliV3g6w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CH0W7oh0jaqHktfgILapuzHm6aWO/mTMDIJ+3U9+RKSjpx306691U4v7WT5BR9g54
 g7rdVbvlqcaU+HWSId3n/jor29wca99UK1Ii6jAyXcQTnu0nSorgOO0oMNsDWYcL85
 6d4MC8LTORqtAhsXid5dkRH2xFYmSmY8+gr+FLbI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/bridge: ti-sn65dsi86: Split connector creation to
 a function
Date: Thu, 24 Jun 2021 03:03:04 +0300
Message-Id: <20210624000304.16281-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To prepare for making connector creation option, move connector creation
out of ti_sn_bridge_attach to a separate function.

No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 31 ++++++++++++++++++---------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index feeda88c4ef0..9bf889302bcc 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -636,6 +636,25 @@ static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static int ti_sn_bridge_connector_init(struct ti_sn65dsi86 *pdata)
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
  * DRM Bridge
  */
@@ -669,17 +688,9 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	ret = drm_connector_init(bridge->dev, &pdata->connector,
-				 &ti_sn_bridge_connector_funcs,
-				 DRM_MODE_CONNECTOR_eDP);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
+	ret = ti_sn_bridge_connector_init(pdata);
+	if (ret < 0)
 		goto err_conn_init;
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

