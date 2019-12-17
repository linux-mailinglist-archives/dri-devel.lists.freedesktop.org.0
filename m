Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 778AE124165
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A596E9CE;
	Wed, 18 Dec 2019 08:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A7206E9E3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 13:46:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,325,1571670000"; d="scan'208";a="34441862"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 17 Dec 2019 22:46:20 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 78AAA4841A47;
 Tue, 17 Dec 2019 22:46:15 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v6 2/6] drm: rcar-du: lvds: Improve identification of panels
Date: Tue, 17 Dec 2019 13:45:57 +0000
Message-Id: <1576590361-28244-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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

Dual-LVDS panels are mistakenly identified as bridges, this
commit replaces the current logic with a call to
drm_of_find_panel_or_bridge to sort that out.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v5->v6:
* No change

v4->v5:
* Addressed comments from Laurent's review

v3->v4:
* New patch extracted from patch:
  "drm: rcar-du: lvds: Add dual-LVDS panels support"
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 75 +++++--------------------------------
 1 file changed, 10 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 87a5e8e..da71107 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -21,6 +21,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
@@ -712,79 +713,23 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 
 static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 {
-	struct device_node *local_output = NULL;
-	struct device_node *remote_input = NULL;
-	struct device_node *remote = NULL;
-	struct device_node *node;
-	bool is_bridge = false;
-	int ret = 0;
-
-	local_output = of_graph_get_endpoint_by_regs(lvds->dev->of_node, 1, 0);
-	if (!local_output) {
-		dev_dbg(lvds->dev, "unconnected port@1\n");
-		ret = -ENODEV;
-		goto done;
-	}
-
-	/*
-	 * Locate the connected entity and infer its type from the number of
-	 * endpoints.
-	 */
-	remote = of_graph_get_remote_port_parent(local_output);
-	if (!remote) {
-		dev_dbg(lvds->dev, "unconnected endpoint %pOF\n", local_output);
-		ret = -ENODEV;
-		goto done;
-	}
+	int ret;
 
-	if (!of_device_is_available(remote)) {
-		dev_dbg(lvds->dev, "connected entity %pOF is disabled\n",
-			remote);
-		ret = -ENODEV;
+	ret = drm_of_find_panel_or_bridge(lvds->dev->of_node, 1, 0,
+					  &lvds->panel, &lvds->next_bridge);
+	if (ret)
 		goto done;
-	}
 
-	remote_input = of_graph_get_remote_endpoint(local_output);
-
-	for_each_endpoint_of_node(remote, node) {
-		if (node != remote_input) {
-			/*
-			 * We've found one endpoint other than the input, this
-			 * must be a bridge.
-			 */
-			is_bridge = true;
-			of_node_put(node);
-			break;
-		}
-	}
-
-	if (is_bridge) {
-		lvds->next_bridge = of_drm_find_bridge(remote);
-		if (!lvds->next_bridge) {
-			ret = -EPROBE_DEFER;
-			goto done;
-		}
-
-		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
-			lvds->dual_link = lvds->next_bridge->timings
-					? lvds->next_bridge->timings->dual_link
-					: false;
-	} else {
-		lvds->panel = of_drm_find_panel(remote);
-		if (IS_ERR(lvds->panel)) {
-			ret = PTR_ERR(lvds->panel);
-			goto done;
-		}
-	}
+	if ((lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) &&
+	    lvds->next_bridge)
+		lvds->dual_link = lvds->next_bridge->timings
+				? lvds->next_bridge->timings->dual_link
+				: false;
 
 	if (lvds->dual_link)
 		ret = rcar_lvds_parse_dt_companion(lvds);
 
 done:
-	of_node_put(local_output);
-	of_node_put(remote_input);
-	of_node_put(remote);
-
 	/*
 	 * On D3/E3 the LVDS encoder provides a clock to the DU, which can be
 	 * used for the DPAD output even when the LVDS output is not connected.
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
