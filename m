Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8A52D16A
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE9411A283;
	Thu, 19 May 2022 11:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AEF11A283
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:27:10 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B96A383D53;
 Thu, 19 May 2022 13:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652959629;
 bh=QmZEk+g5izPHKUiLkPMFE+Qjakox6HY6gop9qLxzp08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GaQhfAIpWmnKR0zzi4Q44OlTU/Ts67jST8+0Y8XDT9KNDrDVLsRROJiSCg+6T45Ky
 K6ioPekdU0GaH+5yW6GlL5fY0c6zUSt/rowmkWa6ihBfjPpwYhglTBlEVC09IxZjQi
 VITV0khP0iEWNpayoDxDSqnSelLMMMW/Duee0swPQ1Mn8yk3mbnmGi7O4VREiiTiSt
 1/deEWzj0yQhSOBmsR5GWYsp51jpXkCJi+/CJ7SMnGNCUsBD6BvPqxIWBb9MkGoSxB
 sbRR61ymD3r7wmKBtJSFpQ4lps7OS/zdpuo6IUvwBSJwC9rvxTrlFeZPpxnv5cd0dP
 USGqlFljbURqg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] drm/bridge: tc358767: Convert to drm_of_get_data_lanes
Date: Thu, 19 May 2022 13:26:52 +0200
Message-Id: <20220519112657.62283-6-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519112657.62283-1-marex@denx.de>
References: <20220519112657.62283-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert driver to use this new helper to standardize
OF "data-lanes" parsing.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 8e210b1176906..a6990a8c08a8b 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1892,18 +1892,18 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
 	int dsi_lanes, ret;
 
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	dsi_lanes = drm_of_get_data_lanes(endpoint, 1, 4);
 	host_node = of_graph_get_remote_port_parent(endpoint);
 	host = of_find_mipi_dsi_host_by_node(host_node);
 	of_node_put(host_node);
 	of_node_put(endpoint);
 
-	if (dsi_lanes <= 0 || dsi_lanes > 4)
-		return -EINVAL;
-
 	if (!host)
 		return -EPROBE_DEFER;
 
+	if (dsi_lanes < 0)
+		return dsi_lanes;
+
 	dsi = mipi_dsi_device_register_full(host, &info);
 	if (IS_ERR(dsi))
 		return dev_err_probe(dev, PTR_ERR(dsi),
-- 
2.35.1

