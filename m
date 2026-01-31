Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH6IFskmfmmOWAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 16:59:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3E8C2D3C
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 16:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388A210E224;
	Sat, 31 Jan 2026 15:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fzMmmqFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E338410E224
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 15:59:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D42CC1A2B63;
 Sat, 31 Jan 2026 15:58:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AA1A1606B6;
 Sat, 31 Jan 2026 15:58:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9735E119A88F3; Sat, 31 Jan 2026 16:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769875138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rN3xt3h5v4YQ9J23cLsAxFTBdfizY8hmnA3Lo4/tdxE=;
 b=fzMmmqFnipcPBSbm3bJCtchU+67qXPft4La/14Rp1esg5WA85F1cyD0Oh97WbaA3nSoQxi
 VC+LnwQ3RITlnkoto/J7GiN9FU3XnwV4UdDme37IAUj2xQA7pIHj0GC8uyP0T527anWvda
 iG+wCgUPXh7LicPwmJh2RswEAyjNkPTgVzITS6OKTBtWvhkRI3Zl7+kfZ45wgEckjOYFMT
 73jSnetbMzMzy5On+HtYhvADonMZqt71mKN1PJWHXjLDrUkS5adxxiDfX6+spKAVh/aRpy
 6EM9judsNxy0bqCJzMjsZeqDYNFfIWBErZI7aKzlzsc7aR7ZI6T5pZo9F+hWpQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sat, 31 Jan 2026 16:58:36 +0100
Subject: [PATCH v2 4/6] drm/mcde: dsi: convert to of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-4-e081bcdc1467@bootlin.com>
References: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
In-Reply-To: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:anitha.chrisanthus@intel.com,m:linusw@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tomi.valkeinen@ideasonboard.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: CF3E8C2D3C
X-Rspamd-Action: no action

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

We need to handle the two cases: when a panel is found and when it isn't,
even though the latter is not supported. So:

 * in case a panel is not found and bridge is, get a reference to the
   found bridge
 * in case a panel is found, get a reference to the panel_bridge when it
   is added, so the following code always get exactly one reference that
   it needs to put

Finally, use the next_bridge pointer in struct drm_bridge in order to
simplify putting the reference.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v2:
- Removed drm_bridge_put(), not needed after the previous patch changes:
  the loop cannot assign 'bridge' more than once now
- Not added Linus' R-by because of this change
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 5893fd2681b3..47d45897ed06 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -40,7 +40,6 @@ struct mcde_dsi {
 	struct mcde *mcde;
 	struct drm_bridge bridge;
 	struct drm_panel *panel;
-	struct drm_bridge *bridge_out;
 	struct mipi_dsi_host dsi_host;
 	struct mipi_dsi_device *mdsi;
 	const struct drm_display_mode *mode;
@@ -1060,7 +1059,7 @@ static int mcde_dsi_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	/* Attach the DSI bridge to the output (panel etc) bridge */
-	return drm_bridge_attach(encoder, d->bridge_out, bridge, flags);
+	return drm_bridge_attach(encoder, d->bridge.next_bridge, bridge, flags);
 }
 
 static const struct drm_bridge_funcs mcde_dsi_bridge_funcs = {
@@ -1076,7 +1075,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 	struct device_node *child;
 	struct drm_panel *panel = NULL;
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
 
 	if (!of_get_available_child_count(dev->of_node)) {
 		dev_info(dev, "unused DSI interface\n");
@@ -1109,7 +1108,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 				PTR_ERR(panel));
 			panel = NULL;
 
-			bridge = of_drm_find_bridge(child);
+			bridge = of_drm_find_and_get_bridge(child);
 			if (!bridge) {
 				dev_err(dev, "failed to find bridge\n");
 				of_node_put(child);
@@ -1129,6 +1128,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 			dev_err(dev, "error adding panel bridge\n");
 			return PTR_ERR(bridge);
 		}
+		drm_bridge_get(bridge);
 		dev_info(dev, "connected to panel\n");
 		d->panel = panel;
 	} else if (bridge) {
@@ -1140,7 +1140,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 		return -ENODEV;
 	}
 
-	d->bridge_out = bridge;
+	d->bridge.next_bridge = drm_bridge_get(bridge);
 
 	/* Create a bridge for this DSI channel */
 	d->bridge.of_node = dev->of_node;
@@ -1160,7 +1160,7 @@ static void mcde_dsi_unbind(struct device *dev, struct device *master,
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 
 	if (d->panel)
-		drm_panel_bridge_remove(d->bridge_out);
+		drm_panel_bridge_remove(d->bridge.next_bridge);
 	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
 			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
 }

-- 
2.52.0

