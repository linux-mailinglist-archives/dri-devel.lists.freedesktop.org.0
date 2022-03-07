Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D754D05D9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 19:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299B910E0EA;
	Mon,  7 Mar 2022 18:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4176010E025
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 18:00:07 +0000 (UTC)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 569778EB;
 Mon,  7 Mar 2022 19:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646676005;
 bh=cMlE7TLxSpeyuuIFaKRoG+l9kmINH8LyAl/UsPH9YhM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J0BYA5p3XkDykWrmQeW4UEfDkwnVk1pNPhLvikKhPRSTlOQa/SbqLNLmG1yvgbErY
 4JGTjK4scKUkwLxesLp24l1q4NoCixcHtEIRpee8M7Wev7JUQDWLy+iEjXz3X3AYqi
 jQ6dp5951EvPxTyXodkHyNZETiYRqSO4psU772yo=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] drm/bridge: ti-sn65dsi86: Make connector creation
 optional
Date: Mon,  7 Mar 2022 17:59:53 +0000
Message-Id: <20220307175955.363057-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Now that the driver supports the connector-related bridge operations,
make the connector creation optional. This enables usage of the
sn65dsi86 with the DRM bridge connector helper.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
Changes since v1:
 - None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ffb6c04f6c46..29f5f7123ed9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -745,11 +745,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
 	pdata->aux.drm_dev = bridge->dev;
 	ret = drm_dp_aux_register(&pdata->aux);
 	if (ret < 0) {
@@ -757,12 +752,14 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	ret = ti_sn_bridge_connector_init(pdata);
-	if (ret < 0)
-		goto err_conn_init;
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		ret = ti_sn_bridge_connector_init(pdata);
+		if (ret < 0)
+			goto err_conn_init;
 
-	/* We never want the next bridge to *also* create a connector: */
-	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
+		/* We never want the next bridge to *also* create a connector: */
+		flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
+	}
 
 	/* Attach the next bridge */
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
-- 
2.32.0

