Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FEA87DAF4
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 18:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694DD10F769;
	Sat, 16 Mar 2024 17:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="oiRVoymT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com
 [91.218.175.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D9E10F769
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 17:05:40 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710608738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zL4myksVicIour6XUMzWlw8VhqJACYKy3DZPBN3+yT8=;
 b=oiRVoymTTXBAKlQAorVIVE6dkSEUWzfJJuFLJJkodKHUmpixANv/zxf/QbaufNMN8OCAkz
 sYqmD7PazJLMUOalwXCJwT+fMIbl1XnQBGnkKkolkrYNwWRmeKcFPNYQBVIH1ur2L2vLqf
 aPCs8ybVKSp79Nvu79iqVoynEG6lNiM=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Sandor Yu <Sandor.yu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm: bridge: dw_hdmi: Switch to of_graph_get_remote_node()
Date: Sun, 17 Mar 2024 01:05:13 +0800
Message-Id: <20240316170513.1159724-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To reduce boilerplate, use of_graph_get_remote_node() helper instead of
the hand-rolling code.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 31 +++--------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index cceb5aab6c83..9f2bc932c371 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3291,40 +3291,17 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
 
 static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
 {
-	struct device_node *endpoint;
 	struct device_node *remote;
 
 	if (!hdmi->plat_data->output_port)
 		return 0;
 
-	endpoint = of_graph_get_endpoint_by_regs(hdmi->dev->of_node,
-						 hdmi->plat_data->output_port,
-						 -1);
-	if (!endpoint) {
-		/*
-		 * On platforms whose bindings don't make the output port
-		 * mandatory (such as Rockchip) the plat_data->output_port
-		 * field isn't set, so it's safe to make this a fatal error.
-		 */
-		dev_err(hdmi->dev, "Missing endpoint in port@%u\n",
-			hdmi->plat_data->output_port);
-		return -ENODEV;
-	}
 
-	remote = of_graph_get_remote_port_parent(endpoint);
-	of_node_put(endpoint);
-	if (!remote) {
-		dev_err(hdmi->dev, "Endpoint in port@%u unconnected\n",
-			hdmi->plat_data->output_port);
+	remote = of_graph_get_remote_node(hdmi->dev->of_node,
+					  hdmi->plat_data->output_port,
+					  -1);
+	if (!remote)
 		return -ENODEV;
-	}
-
-	if (!of_device_is_available(remote)) {
-		dev_err(hdmi->dev, "port@%u remote device is disabled\n",
-			hdmi->plat_data->output_port);
-		of_node_put(remote);
-		return -ENODEV;
-	}
 
 	hdmi->next_bridge = of_drm_find_bridge(remote);
 	of_node_put(remote);
-- 
2.34.1

