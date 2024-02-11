Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5771850885
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 10:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEDD10E56A;
	Sun, 11 Feb 2024 09:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="ROQHbsHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CA210E56A
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 09:57:28 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id CE2FC6049B;
 Sun, 11 Feb 2024 09:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1707645448;
 bh=JJFn33AHGirXoIgP/lt+W8CNauuhz8rQHZlLCfM+t0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ROQHbsHfyo5UKrCT5rN+aksGnUyZWyfZl3E7s8hV9GY0u2pffQMwDnPP9k05kCVU/
 B942HVHzKdwrIa9/Xt3cHZsUMmdg1y0DZk48EIK0SqLrIpAhju84n5rEUSuMk4r8+K
 VUEJDN90K46Bdb29VkbgfdN7p88XykkvtCqneE3Zl07XrCmD+YXz5IiGXCTjzNFXl3
 zlZl2VfWfF2lW/yUyQkDEEk2S3crktsQCSmekbXFGljsGXUtuoHb4DFnSQ15vW3V4q
 LsXjkf49q2mFuLFzPwQKB7tKrAUVPRIqYhD/2ub7PZlr8tzn8fGrK2YtItz2ch+oXu
 i0qAxqs70GJsw==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 06/10] drm/bridge: tc358775: Get bridge data lanes instead
 of the DSI host lanes
Date: Sun, 11 Feb 2024 11:51:11 +0200
Message-ID: <20240211095144.2589-7-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240211095144.2589-1-tony@atomide.com>
References: <20240211095144.2589-1-tony@atomide.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code assumes the data-lanes property is configured on the
DSI host side instead of the bridge side, and assumes DSI host endpoint 1.

Let's standardize on what the other bridge drivers are doing and parse the
data-lanes property for the bridge. Only if data-lanes property is not found,
let's be nice and also check the DSI host for old dtb in use and warn.

And as Dmitry pointed out, the lanes for the host and the bridge may be
different because the lanes may be swapped on the host side.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -525,27 +525,24 @@ tc_mode_valid(struct drm_bridge *bridge,
 static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 {
 	struct device_node *endpoint;
-	struct device_node *parent;
 	struct device_node *remote;
 	int dsi_lanes = -1;
 
-	/*
-	 * To get the data-lanes of dsi, we need to access the dsi0_out of port1
-	 *  of dsi0 endpoint from bridge port0 of d2l_in
-	 */
 	endpoint = of_graph_get_endpoint_by_regs(tc->dev->of_node,
 						 TC358775_DSI_IN, -1);
-	if (endpoint) {
-		/* dsi0_out node */
-		parent = of_graph_get_remote_port_parent(endpoint);
-		of_node_put(endpoint);
-		if (parent) {
-			/* dsi0 port 1 */
-			dsi_lanes = drm_of_get_data_lanes_count_ep(parent, 1, -1, 1, 4);
-			of_node_put(parent);
-		}
+	dsi_lanes = drm_of_get_data_lanes_count(endpoint, 1, 4);
+
+	/* Quirk old dtb: Use data lanes from the DSI host side instead of bridge */
+	if (dsi_lanes == -EINVAL || dsi_lanes == -ENODEV) {
+		remote = of_graph_get_remote_endpoint(endpoint);
+		dsi_lanes = drm_of_get_data_lanes_count(remote, 1, 4);
+		of_node_put(remote);
+		if (dsi_lanes >= 1)
+			dev_warn(tc->dev, "no dsi-lanes for the bridge, using host lanes\n");
 	}
 
+	of_node_put(endpoint);
+
 	if (dsi_lanes < 0)
 		return dsi_lanes;
 
-- 
2.43.0
