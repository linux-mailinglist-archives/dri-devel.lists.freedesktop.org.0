Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6EB52D170
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCDB11A34B;
	Thu, 19 May 2022 11:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7C811A283
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:27:09 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9CDBF83C97;
 Thu, 19 May 2022 13:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652959628;
 bh=++IJTNNCnsQ0qwjSQ0d7+hNbdYUsh2L57IXb8YqDLi0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D3Zop510qMxDDy9nboHkzYIuokKzMhAZT3WK/z0JW9PbZn89jM85JniYrFkK9eydO
 28tph1L74+l22y57ykBQTnvuS1gFV+FIXvjbPzCJjVwyADjRoVWNynjbbkz4Fq2UF5
 bg+TaU0LjskS5Ko/rFqH3EzYyWGfWrE/7l4SIriTDLye5wh+v7DzuEf4vwqxZWpeP8
 DnF83dvtYIy9d5BCxgd35HvzDw1r5enD/8kszmXMANOjzl5K1Uzk6eSvVRJm2e3m/7
 e4BHx2pgL7gfqYo9mphJ8dfYgj3ZwLE2rAWi89inWADM9vd/Me4rJrnQa0T5K4kIqM
 ZzWyPkKv9TQ6Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/11] drm/bridge: lt8912: Convert to drm_of_get_data_lanes_ep
Date: Thu, 19 May 2022 13:26:50 +0200
Message-Id: <20220519112657.62283-4-marex@denx.de>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, robert.foss@linaro.org,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert driver to use this new helper to standardize
OF "data-lanes" parsing.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Adrien Grassein <adrien.grassein@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index c642d1e02b2f8..b9741de70d584 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -607,7 +607,6 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 	int ret;
 	int data_lanes;
 	struct device_node *port_node;
-	struct device_node *endpoint;
 
 	gp_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(gp_reset)) {
@@ -618,16 +617,12 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 	}
 	lt->gp_reset = gp_reset;
 
-	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
-	if (!endpoint)
-		return -ENODEV;
-
-	data_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
-	of_node_put(endpoint);
+	data_lanes = drm_of_get_data_lanes_ep(dev->of_node, 0, -1, 1, 4);
 	if (data_lanes < 0) {
 		dev_err(lt->dev, "%s: Bad data-lanes property\n", __func__);
 		return data_lanes;
 	}
+
 	lt->data_lanes = data_lanes;
 
 	lt->host_node = of_graph_get_remote_node(dev->of_node, 0, -1);
-- 
2.35.1

