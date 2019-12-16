Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A871228FB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866386E99A;
	Tue, 17 Dec 2019 10:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB4366E87B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 20:12:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,322,1571670000"; d="scan'208";a="34573548"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 17 Dec 2019 05:12:59 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2A95340CAF00;
 Tue, 17 Dec 2019 05:12:53 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v5 3/6] drm: rcar-du: lvds: Get dual link configuration from DT
Date: Mon, 16 Dec 2019 20:12:31 +0000
Message-Id: <1576527154-18391-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576527154-18391-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1576527154-18391-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 ebiharaml@si-linux.co.jp,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For dual-LVDS configurations, it is now possible to mark the
DT port nodes for the sink with boolean properties (like
dual-lvds-even-pixels and dual-lvds-odd-pixels) to let drivers
know the encoders need to be configured in dual-LVDS mode.

Rework the implementation of rcar_lvds_parse_dt_companion
to make use of the DT markers while keeping backward
compatibility.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v4->v5:
* Addressed comments from Laurent's review

v3->v4:
* New patch extracted from patch:
  "drm: rcar-du: lvds: Add dual-LVDS panels support"
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 54 +++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 4d038bd..3eb208e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -682,7 +682,10 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 {
 	const struct of_device_id *match;
 	struct device_node *companion;
+	struct device_node *port0, *port1;
+	struct rcar_lvds *companion_lvds;
 	struct device *dev = lvds->dev;
+	int dual_link;
 	int ret = 0;
 
 	/* Locate the companion LVDS encoder for dual-link operation, if any. */
@@ -701,13 +704,54 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 		goto done;
 	}
 
+	/*
+	 * We need to work out if the sink is expecting us to function in
+	 * dual-link mode. We do this by looking at the DT port nodes we are
+	 * connected to, if they are marked as expecting even pixels and
+	 * odd pixels than we need to enable vertical stripe output.
+	 */
+	port0 = of_graph_get_port_by_id(dev->of_node, 1);
+	port1 = of_graph_get_port_by_id(companion, 1);
+	dual_link = drm_of_lvds_get_dual_link_pixel_order(port0, port1);
+	of_node_put(port0);
+	of_node_put(port1);
+
+	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS)
+		lvds->dual_link = true;
+	else if (lvds->next_bridge && lvds->next_bridge->timings)
+		/*
+		 * Early dual-link bridge specific implementations populate the
+		 * timings field of drm_bridge, read the dual_link flag off the
+		 * bridge directly for backward compatibility.
+		 */
+		lvds->dual_link = lvds->next_bridge->timings->dual_link;
+
+	if (!lvds->dual_link) {
+		dev_dbg(dev, "Single-link configuration detected\n");
+		goto done;
+	}
+
 	lvds->companion = of_drm_find_bridge(companion);
 	if (!lvds->companion) {
 		ret = -EPROBE_DEFER;
 		goto done;
 	}
 
-	dev_dbg(dev, "Found companion encoder %pOF\n", companion);
+	dev_dbg(dev,
+		"Dual-link configuration detected (companion encoder %pOF)\n",
+		companion);
+
+	/*
+	 * FIXME: We should not be messing with the companion encoder private
+	 * data from the primary encoder, we should rather let the companion
+	 * encoder work things out on its own. However, the companion encoder
+	 * doesn't hold a reference to the primary encoder, and
+	 * drm_of_lvds_get_dual_link_pixel_order needs to be given references
+	 * to the output ports of both encoders, therefore leave it like this
+	 * for the time being.
+	 */
+	companion_lvds = bridge_to_rcar_lvds(lvds->companion);
+	companion_lvds->dual_link = true;
 
 done:
 	of_node_put(companion);
@@ -724,13 +768,7 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 	if (ret)
 		goto done;
 
-	if ((lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) &&
-	    lvds->next_bridge)
-		lvds->dual_link = lvds->next_bridge->timings
-				? lvds->next_bridge->timings->dual_link
-				: false;
-
-	if (lvds->dual_link)
+	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
 		ret = rcar_lvds_parse_dt_companion(lvds);
 
 done:
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
