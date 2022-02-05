Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8624AA4EE
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 01:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F6C10E233;
	Sat,  5 Feb 2022 00:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393FB10E172
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 00:14:11 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id y5so5490683pfe.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 16:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yhbxh7kkqGGusGWBNx2mCA04d+nWExRaG4eT8COW5H4=;
 b=lW6XJL1GStnh11sxE6c3AEle1jPDq08bgs8pl3Qpl/pK4zYtnr+ztxBX07afHyB6nu
 wSLkzJT/NtirEqBGto3hq3t4fbxaHfhHfEj7wRY6raIcpc0Jpb5eG0m4HIIvOxX+Ez6v
 QTdow9MsyanB+ZzJUlBgqSf5f9qWQJEzMJwPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yhbxh7kkqGGusGWBNx2mCA04d+nWExRaG4eT8COW5H4=;
 b=s/sDk2ZzB/ISKmx+5m787VBrnR8MZCimigdDU4if6x6a1TUkmRwF7vWEQ4mYvUX1Fh
 GtVUnUsI5jm/F6TBRHMoQEW0PfiywI8r+yV1RRsCB4+xx5pcw5D47jeWuIn32t7razpq
 VtymYPO0O43qaY/uDXVK2LuOvqGBf7syo1J7AIv/H1a9G6quvHbtn6ux/J+NUEbAaQWm
 cjrg7nepNx+uzNFaA3s4u3HRtSxINfk/+DOrZXP65AxU0S+wZJ8Bxa90LNoGqocu/gl6
 fGk4OXe6cQfVoThVrLSi74xX0RSmYkvxVcxzJiGKyOCCo4RA7+Pwyi6h7b1S1Vv0GmHq
 oy3w==
X-Gm-Message-State: AOAM532O66YfwjEuSn/e4jQbyqjUeg7vgqaQtHqGnzeAo6p1XZccpli8
 QjOTMnNxThKGjoxKPVksgDBQlUi+ab4Dew==
X-Google-Smtp-Source: ABdhPJwHbENOYwTwkFtmdn6y83vbJk6FTR1NFcvBdcuuTC/JSeQWcPm1Se3dFMTqcxl6aZvQHwe4dQ==
X-Received: by 2002:a63:690a:: with SMTP id e10mr1171147pgc.599.1644020050659; 
 Fri, 04 Feb 2022 16:14:10 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:d668:55ac:a465:88bf])
 by smtp.gmail.com with ESMTPSA id q13sm3720231pfj.44.2022.02.04.16.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 16:14:10 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/bridge: ti-sn65dsi86: Use drm_bridge_connector
Date: Fri,  4 Feb 2022 16:13:40 -0800
Message-Id: <20220204161245.v2.1.I3ab26b7f197cc56c874246a43e57913e9c2c1028@changeid>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220205001342.3155839-1-dianders@chromium.org>
References: <20220205001342.3155839-1-dianders@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>, robert.foss@linaro.org,
 Douglas Anderson <dianders@chromium.org>, jjsu@chromium.org,
 lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ti-sn65dsi86 driver shouldn't hand-roll its own bridge
connector. It should use the normal drm_bridge_connector. Let's switch
to do that, removing all of the custom code.

NOTE: this still _doesn't_ implement DRM_BRIDGE_ATTACH_NO_CONNECTOR
support for ti-sn65dsi86 and that would still be a useful thing to do
in the future. It was attempted in the past [1] but put on the back
burner. However, unless we instantly change ti-sn65dsi86 fully from
not supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR at all to _only_
supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR then we'll still need a bit
of time when we support both. This is a better way to support the old
way where the driver hand rolls things itself.

A new notes about the implementation here:
* When using the drm_bridge_connector the connector should be created
  after all the bridges, so we change the ordering a bit.
* I'm reasonably certain that we don't need to do anything to "free"
  the new drm_bridge_connector. If drm_bridge_connector_init() returns
  success then we know drm_connector_init() was called with the
  `drm_bridge_connector_funcs`. The `drm_bridge_connector_funcs` has a
  .destroy() that does all the cleanup. drm_connector_init() calls
  __drm_mode_object_add() with a drm_connector_free() that will call
  the .destroy().
* I'm also reasonably certain that I don't need to "undo" the
  drm_bridge_attach() if drm_bridge_connector_init() fails. The
  "detach" function is private and other similar code doesn't try to
  undo the drm_bridge_attach() in error cases. There's also a comment
  indicating the lack of balance at the top of drm_bridge_attach().

[1] https://lore.kernel.org/r/20210920225801.227211-4-robdclark@gmail.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("ti-sn65dsi86: Use drm_bridge_connector") new for v2.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 72 ++++++---------------------
 1 file changed, 14 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ba136a188be7..38616aab12ac 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -26,6 +26,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/dp/drm_dp_aux_bus.h>
 #include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
@@ -174,7 +175,7 @@ struct ti_sn65dsi86 {
 	struct regmap			*regmap;
 	struct drm_dp_aux		aux;
 	struct drm_bridge		bridge;
-	struct drm_connector		connector;
+	struct drm_connector		*connector;
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
@@ -646,54 +647,6 @@ static struct auxiliary_driver ti_sn_aux_driver = {
 	.id_table = ti_sn_aux_id_table,
 };
 
-/* -----------------------------------------------------------------------------
- * DRM Connector Operations
- */
-
-static struct ti_sn65dsi86 *
-connector_to_ti_sn65dsi86(struct drm_connector *connector)
-{
-	return container_of(connector, struct ti_sn65dsi86, connector);
-}
-
-static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
-{
-	struct ti_sn65dsi86 *pdata = connector_to_ti_sn65dsi86(connector);
-
-	return drm_bridge_get_modes(pdata->next_bridge, connector);
-}
-
-static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
-	.get_modes = ti_sn_bridge_connector_get_modes,
-};
-
-static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int ti_sn_bridge_connector_init(struct ti_sn65dsi86 *pdata)
-{
-	int ret;
-
-	ret = drm_connector_init(pdata->bridge.dev, &pdata->connector,
-				 &ti_sn_bridge_connector_funcs,
-				 DRM_MODE_CONNECTOR_eDP);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(&pdata->connector,
-				 &ti_sn_bridge_connector_helper_funcs);
-	drm_connector_attach_encoder(&pdata->connector, pdata->bridge.encoder);
-
-	return 0;
-}
-
 /*------------------------------------------------------------------------------
  * DRM Bridge
  */
@@ -757,10 +710,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	ret = ti_sn_bridge_connector_init(pdata);
-	if (ret < 0)
-		goto err_conn_init;
-
 	/* We never want the next bridge to *also* create a connector: */
 	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
 
@@ -768,13 +717,20 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
 				&pdata->bridge, flags);
 	if (ret < 0)
-		goto err_dsi_host;
+		goto err_initted_aux;
+
+	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
+						     pdata->bridge.encoder);
+	if (IS_ERR(pdata->connector)) {
+		ret = PTR_ERR(pdata->connector);
+		goto err_initted_aux;
+	}
+
+	drm_connector_attach_encoder(pdata->connector, pdata->bridge.encoder);
 
 	return 0;
 
-err_dsi_host:
-	drm_connector_cleanup(&pdata->connector);
-err_conn_init:
+err_initted_aux:
 	drm_dp_aux_unregister(&pdata->aux);
 	return ret;
 }
@@ -824,7 +780,7 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
 
 static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
 {
-	if (pdata->connector.display_info.bpc <= 6)
+	if (pdata->connector->display_info.bpc <= 6)
 		return 18;
 	else
 		return 24;
-- 
2.35.0.263.gb82422642f-goog

