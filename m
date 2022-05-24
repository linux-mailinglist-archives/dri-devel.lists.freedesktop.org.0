Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D563532019
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 03:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036B410E8C3;
	Tue, 24 May 2022 01:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659E810E928
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 01:05:49 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 68A5883FEC;
 Tue, 24 May 2022 03:05:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653354347;
 bh=86c1TyioaKXqI7R2GwFIsReEQQX7RiiN/QRUoVOpl6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s9uZOJlVYVR6aS4u0tLkRts/0LMrOU3D+1DozElaaEZ20zmdz+mug6NFlX+YvOmV7
 YJZvTqx9WmqfmYuI6ayn++FWMpmkEvkL3hWPb2+X2tu3Vpcfqn0Vz/yJhtQH7ykXMI
 DQar/StlRVd4cDVF7O6izi3HYsPcaNXE1PaNMEkLReOnsbarz4z6cZaEuPSxJLL0Sv
 x6q0J66GUGQh1dbtOd+k7oW75LvxwHcPcFg9i+8srb3cL/AD+oOf56rw9gAnUhKK5v
 rZxsfSZZBPz5UhR0J2u8rABGNUhO44Bn2iw3BkkzSMRWO6j892le18jYOm1jppWUcv
 R3Y+w4gF5A2fA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/11] drm/bridge: lt8912: Convert to
 drm_of_get_data_lanes_count_ep
Date: Tue, 24 May 2022 03:05:15 +0200
Message-Id: <20220524010522.528569-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524010522.528569-1-marex@denx.de>
References: <20220524010522.528569-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Maxime Ripard <maxime@cerno.tech>,
 robert.foss@linaro.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert driver to use this new helper to standardize
OF "data-lanes" parsing.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
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
V2: - Rename drm_of_get_data_lanes{,_ep} to drm_of_get_data_lanes_count{,_ep}
    - Add RB from Andrzej
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index c642d1e02b2f8..c92515834ff2d 100644
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
+	data_lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, -1, 1, 4);
 	if (data_lanes < 0) {
 		dev_err(lt->dev, "%s: Bad data-lanes property\n", __func__);
 		return data_lanes;
 	}
+
 	lt->data_lanes = data_lanes;
 
 	lt->host_node = of_graph_get_remote_node(dev->of_node, 0, -1);
-- 
2.35.1

