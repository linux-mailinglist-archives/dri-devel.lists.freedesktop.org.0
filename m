Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461277F181
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344FC10E1BD;
	Thu, 17 Aug 2023 07:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B0310E1BD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692258758; x=1723794758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oiot9TDbWPvBwQciWRZrjGsS6w9ZnO+uOVLaCyIOSpY=;
 b=B9sdTmOOIHYkMQkYJAppjroKMKRHiy5uBU45C84Eo5pLO9VcUtvKgk11
 VQykts7q2sgaPrRX27dVWhTyeZsSBxrmHQBLDMNt1LF8Sze8vZi6vqXlA
 tThL8FLIYWEmn+4Uyaba/xGjUCTf25VNxI1jo5JbeQPvCMlperQfPGPTt
 4DQ7YDemljshE+ez6kxl3v5kPjp57pul8gwPcluMyPpo6vDj+zmDd+0W9
 Ke7URQme+Z+ajfoXA2isW8ITuoIPcHYBXPTmAW/J9+Fg35480564n95r/
 Nk+VFrSJ477CKB8dIdsj377Mo9GhvAi31F3/gpBFTQwSoR5MgHTJPRUDC A==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684792800"; d="scan'208";a="32486939"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Aug 2023 09:52:35 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 93269280084;
 Thu, 17 Aug 2023 09:52:35 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/bridge: tc358767: Use dev_err_probe
Date: Thu, 17 Aug 2023 09:52:33 +0200
Message-Id: <20230817075234.1075736-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817075234.1075736-1-alexander.stein@ew.tq-group.com>
References: <20230817075234.1075736-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function calls preceding these returns can return -EPROBE_DEFER. So
use dev_err_probe to add some information to
/sys/kernel/debug/devices_deferred

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index b45bffab7c817..c07312ea9dc05 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2113,7 +2113,8 @@ static int tc_probe_dpi_bridge_endpoint(struct tc_data *tc)
 	/* port@1 is the DPI input/output port */
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &bridge);
 	if (ret && ret != -ENODEV)
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "Could not find DPI panel or bridge\n");
 
 	if (panel) {
 		bridge = devm_drm_panel_bridge_add(dev, panel);
@@ -2141,7 +2142,8 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 	/* port@2 is the output port */
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
 	if (ret && ret != -ENODEV)
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "Could not find DSI panel or bridge\n");
 
 	if (panel) {
 		struct drm_bridge *panel_bridge;
@@ -2353,7 +2355,7 @@ static int tc_probe(struct i2c_client *client)
 		ret = tc_mipi_dsi_host_attach(tc);
 		if (ret) {
 			drm_bridge_remove(&tc->bridge);
-			return ret;
+			return dev_err_probe(dev, ret, "Failed to attach DSI host\n");
 		}
 	}
 
-- 
2.34.1

