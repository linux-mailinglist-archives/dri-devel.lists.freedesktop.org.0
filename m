Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E24D05DA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 19:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E5110E0F2;
	Mon,  7 Mar 2022 18:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB88D10E025
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 18:00:06 +0000 (UTC)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD12C8C1;
 Mon,  7 Mar 2022 19:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646676005;
 bh=sD1oH3Anlxn9WQLfDYfbvc6dUo2C8d8M8uM9rAaJFvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z8f7HH5v4fb1Xq8do2kwKqjhlyEMjpn1EhZ/olS8jNu8uIzRAUvIzHBVbWsUkiwmf
 RBvwqAExvvuJXDIYRtbQAMVWV1eJJs80N0DG2NKv5ihv7AXSeNAjj0WhzndCOfJInX
 BE+60waWzp9rfy1gtlwkO1LKl0FdSlA9Oqo+5Me8=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/4] drm/bridge: ti-sn65dsi86: Implement bridge connector
 operations
Date: Mon,  7 Mar 2022 17:59:52 +0000
Message-Id: <20220307175955.363057-2-kieran.bingham+renesas@ideasonboard.com>
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
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Implement the bridge connector-related .get_edid() operation, and report
the related bridge capabilities and type.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v1:

- The connector .get_modes() operation doesn't rely on EDID anymore,
  __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
  together

Notes from Kieran:

RB Tags collected from:
 https://lore.kernel.org/all/20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com/

However this was over a year ago, so let me know if other patches now
superceed this one or otherwise invalidate this update.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c55848588123..ffb6c04f6c46 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1154,6 +1154,19 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 	pm_runtime_put_sync(pdata->dev);
 }
 
+static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	struct edid *edid;
+
+	pm_runtime_get_sync(pdata->dev);
+	edid = drm_get_edid(connector, &pdata->aux.ddc);
+	pm_runtime_put_autosuspend(pdata->dev);
+
+	return edid;
+}
+
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
@@ -1162,6 +1175,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.enable = ti_sn_bridge_enable,
 	.disable = ti_sn_bridge_disable,
 	.post_disable = ti_sn_bridge_post_disable,
+	.get_edid = ti_sn_bridge_get_edid,
 };
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
@@ -1248,6 +1262,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = np;
+	pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
+	pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
2.32.0

