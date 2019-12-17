Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B70E124132
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECABB6E22A;
	Wed, 18 Dec 2019 08:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04C746E9E3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 13:46:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,325,1571670000"; d="scan'208";a="34441870"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 17 Dec 2019 22:46:32 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1A7D84841A47;
 Tue, 17 Dec 2019 22:46:26 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v6 4/6] drm: rcar-du: lvds: Allow for even and odd pixels swap
Date: Tue, 17 Dec 2019 13:45:59 +0000
Message-Id: <1576590361-28244-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:03 +0000
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

DT properties dual-lvds-even-pixels and dual-lvds-odd-pixels
can be used to work out if the driver needs to swap even
and odd pixels around.

This patch makes use of the return value from function
drm_of_lvds_get_dual_link_pixel_order to determine if we
need to swap odd and even pixels around for things to work
properly.

The dual_link boolean field from struct rcar_lvds is not
sufficient to describe the type of LVDS link anymore, since
we now have information related to pixel order, therefore
rename it to link_type and repurpose its usage to fit the
new requirements.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v5->v6:
* Renamed dual_link to link_type and reworked its usage

v4->v5:
* Addressed comments from Laurent's review

v3->v4:
* New patch extracted from patch:
  "drm: rcar-du: lvds: Add dual-LVDS panels support"
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 77 ++++++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index fdbd36b..8ffa4fb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -37,6 +37,12 @@ enum rcar_lvds_mode {
 	RCAR_LVDS_MODE_VESA = 4,
 };
 
+enum rcar_lvds_link_type {
+	RCAR_LVDS_SINGLE_LINK = 0,
+	RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS = 1,
+	RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS = 2,
+};
+
 #define RCAR_LVDS_QUIRK_LANES		BIT(0)	/* LVDS lanes 1 and 3 inverted */
 #define RCAR_LVDS_QUIRK_GEN3_LVEN	BIT(1)	/* LVEN bit needs to be set on R8A77970/R8A7799x */
 #define RCAR_LVDS_QUIRK_PWD		BIT(2)	/* PWD bit available (all of Gen3 but E3) */
@@ -67,7 +73,7 @@ struct rcar_lvds {
 	} clocks;
 
 	struct drm_bridge *companion;
-	bool dual_link;
+	enum rcar_lvds_link_type link_type;
 };
 
 #define bridge_to_rcar_lvds(b) \
@@ -456,7 +462,7 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
 		return;
 
 	/* Enable the companion LVDS encoder in dual-link mode. */
-	if (lvds->dual_link && lvds->companion)
+	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
 		__rcar_lvds_atomic_enable(lvds->companion, state, crtc,
 					  connector);
 
@@ -482,19 +488,38 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
 	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
 
 	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
-		/*
-		 * Configure vertical stripe based on the mode of operation of
-		 * the connected device.
-		 */
-		rcar_lvds_write(lvds, LVDSTRIPE,
-				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
+		u32 lvdstripe = 0;
+
+		if (lvds->link_type != RCAR_LVDS_SINGLE_LINK) {
+			/*
+			 * By default we generate even pixels from the primary
+			 * encoder and odd pixels from the companion encoder.
+			 * Swap pixels around if the sink requires odd pixels
+			 * from the primary encoder and even pixels from the
+			 * companion encoder.
+			 */
+			bool swap_pixels = lvds->link_type ==
+				RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
+
+			/*
+			 * Configure vertical stripe since we are dealing with
+			 * an LVDS dual-link connection.
+			 *
+			 * ST_SWAP is reserved for the companion encoder, only
+			 * set it in the primary encoder.
+			 */
+			lvdstripe = LVDSTRIPE_ST_ON
+				  | (lvds->companion && swap_pixels ?
+				     LVDSTRIPE_ST_SWAP : 0);
+		}
+		rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
 	}
 
 	/*
 	 * PLL clock configuration on all instances but the companion in
 	 * dual-link mode.
 	 */
-	if (!lvds->dual_link || lvds->companion) {
+	if (lvds->link_type == RCAR_LVDS_SINGLE_LINK || lvds->companion) {
 		const struct drm_crtc_state *crtc_state =
 			drm_atomic_get_new_crtc_state(state, crtc);
 		const struct drm_display_mode *mode =
@@ -592,7 +617,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
 	/* Disable the companion LVDS encoder in dual-link mode. */
-	if (lvds->dual_link && lvds->companion)
+	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
 		lvds->companion->funcs->atomic_disable(lvds->companion, state);
 
 	clk_disable_unprepare(lvds->clocks.mod);
@@ -666,7 +691,7 @@ bool rcar_lvds_dual_link(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
-	return lvds->dual_link;
+	return lvds->link_type != RCAR_LVDS_SINGLE_LINK;
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
 
@@ -712,17 +737,28 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 	of_node_put(port0);
 	of_node_put(port1);
 
-	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS)
-		lvds->dual_link = true;
-	else if (lvds->next_bridge && lvds->next_bridge->timings)
+	switch (dual_link) {
+	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
+		lvds->link_type = RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
+		break;
+	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
+		lvds->link_type = RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
+		break;
+	default:
 		/*
 		 * Early dual-link bridge specific implementations populate the
-		 * timings field of drm_bridge, read the dual_link flag off the
-		 * bridge directly for backward compatibility.
+		 * timings field of drm_bridge. If the flag is set, we assume
+		 * that we are expected to generate even pixels from the primary
+		 * encoder, and odd pixels from the companion encoder.
 		 */
-		lvds->dual_link = lvds->next_bridge->timings->dual_link;
+		if (lvds->next_bridge && lvds->next_bridge->timings &&
+		    lvds->next_bridge->timings->dual_link)
+			lvds->link_type = RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
+		else
+			lvds->link_type = RCAR_LVDS_SINGLE_LINK;
+	}
 
-	if (!lvds->dual_link) {
+	if (lvds->link_type == RCAR_LVDS_SINGLE_LINK) {
 		dev_dbg(dev, "Single-link configuration detected\n");
 		goto done;
 	}
@@ -737,6 +773,9 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 		"Dual-link configuration detected (companion encoder %pOF)\n",
 		companion);
 
+	if (lvds->link_type == RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS)
+		dev_dbg(dev, "Data swapping required\n");
+
 	/*
 	 * FIXME: We should not be messing with the companion encoder private
 	 * data from the primary encoder, we should rather let the companion
@@ -747,7 +786,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 	 * for the time being.
 	 */
 	companion_lvds = bridge_to_rcar_lvds(lvds->companion);
-	companion_lvds->dual_link = true;
+	companion_lvds->link_type = lvds->link_type;
 
 done:
 	of_node_put(companion);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
