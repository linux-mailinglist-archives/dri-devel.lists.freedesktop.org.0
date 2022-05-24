Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 297EA53201E
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 03:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709E510E993;
	Tue, 24 May 2022 01:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B5610E8C3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 01:05:50 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D687D8421D;
 Tue, 24 May 2022 03:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653354349;
 bh=W+TeGyJol84CQFlbMVtTrJ1W7TDJcNXoe1izVFNKQto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oe4noGU+OGxDbLDWlPHwA8S1DVQ+x6pRbOpQPi192/YrECtxLV1jdhoSCsvJU6f8K
 zoqSQyn0R1E50RYQiFIzllTdtQg6dtaTt0ef7gz83wjJpa7o6mP00JFhMbtzPfuYfB
 32FvgF7kuQlWvfgbKg7kuJgv35WW2+5OQ9WFKTPbabDztLOWjMzLoBBvfVicIUngkI
 qWZIjaD9Z2qTU8MTUTgG/33WVkstiopSKM1UYyh7FjFWjIjjSeh69b7hIxNSGaYD5T
 nLpEheRjRt4rsm7zmnJnZmwwE9VVx9hcSRrFnSqTJDmJI6bymoz73y8RQoPUdwm2et
 iPgM20o0Ll73A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/11] drm/bridge: tc358775: Convert to
 drm_of_get_data_lanes_count_ep
Date: Tue, 24 May 2022 03:05:18 +0200
Message-Id: <20220524010522.528569-7-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert driver to use this new helper to standardize
OF "data-lanes" parsing.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
V2: - Rename drm_of_get_data_lanes{,_ep} to drm_of_get_data_lanes_count{,_ep}
    - Drop now unused prop and len local variables
    - Add RB from Andrzej
---
 drivers/gpu/drm/bridge/tc358775.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 62a7ef352daa5..5b1fb8e2f9a7d 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -529,8 +529,7 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 	struct device_node *endpoint;
 	struct device_node *parent;
 	struct device_node *remote;
-	struct property *prop;
-	int len = 0;
+	int dsi_lanes;
 
 	/*
 	 * To get the data-lanes of dsi, we need to access the dsi0_out of port1
@@ -544,25 +543,15 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 		of_node_put(endpoint);
 		if (parent) {
 			/* dsi0 port 1 */
-			endpoint = of_graph_get_endpoint_by_regs(parent, 1, -1);
+			dsi_lanes = drm_of_get_data_lanes_count_ep(parent, 1, -1, 1, 4);
 			of_node_put(parent);
-			if (endpoint) {
-				prop = of_find_property(endpoint, "data-lanes",
-							&len);
-				of_node_put(endpoint);
-				if (!prop) {
-					dev_err(tc->dev,
-						"failed to find data lane\n");
-					return -EPROBE_DEFER;
-				}
-			}
 		}
 	}
 
-	tc->num_dsi_lanes = len / sizeof(u32);
+	if (dsi_lanes < 0)
+		return dsi_lanes;
 
-	if (tc->num_dsi_lanes < 1 || tc->num_dsi_lanes > 4)
-		return -EINVAL;
+	tc->num_dsi_lanes = dsi_lanes;
 
 	tc->host_node = of_graph_get_remote_node(np, 0, 0);
 	if (!tc->host_node)
-- 
2.35.1

