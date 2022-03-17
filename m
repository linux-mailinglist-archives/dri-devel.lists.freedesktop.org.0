Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A854DC74F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 14:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6103B10EBB9;
	Thu, 17 Mar 2022 13:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1CA10EBB1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 13:13:05 +0000 (UTC)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC63448F;
 Thu, 17 Mar 2022 14:13:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1647522784;
 bh=K6t6ybVcm9ml9nZnpnQaFZ2JXtZPtX0gN85GefxQ+5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NMZ1ThbkIs75ThenSdb98d4ISHVFqFegKMXSS7Gw1bfkcjgw3woyYm/gagghSy5UQ
 c85EOWt2S8bOb+VnclEnf5s7MCiJf0SFE4txBROV0NkaYo7mMiE1KuCTsFsEV4S2db
 1daE5wuPctNHIyrznxMqNDhNOui+FMhXlAci09gs=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/3] drm/bridge: ti-sn65dsi86: Implement bridge connector
 operations
Date: Thu, 17 Mar 2022 13:12:49 +0000
Message-Id: <20220317131250.1481275-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Implement the bridge connector-related .get_edid() operation, and report
the related bridge capabilities and type.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- The connector .get_modes() operation doesn't rely on EDID anymore,
  __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
  together
 - Fix on top of Sam Ravnborg's DRM_BRIDGE_STATE_OPS

Changes since v2: [Kieran]
 - Only support EDID on DRM_MODE_CONNECTOR_DisplayPort modes.

Changes since v3: [Kieran]
 - Remove PM calls in ti_sn_bridge_get_edid() and simplify

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c5f020a2d0d3..910bf3d41d2f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1134,10 +1134,19 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(pdata->dev);
 }
 
+static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	return drm_get_edid(connector, &pdata->aux.ddc);
+}
+
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
+	.get_edid = ti_sn_bridge_get_edid,
 	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
 	.atomic_enable = ti_sn_bridge_atomic_enable,
 	.atomic_disable = ti_sn_bridge_atomic_disable,
@@ -1232,6 +1241,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
+		pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
+
 	drm_bridge_add(&pdata->bridge);
 
 	ret = ti_sn_attach_host(pdata);
-- 
2.32.0

