Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405E6504602
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 04:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA16110EBD5;
	Sun, 17 Apr 2022 02:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A894F10EBD5
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 02:10:27 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DEFF7839E7;
 Sun, 17 Apr 2022 04:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650161426;
 bh=2YbxAjB3qjYh4obROlq3NREaJRjWrR/Z6j1tKOUtIcc=;
 h=From:To:Cc:Subject:Date:From;
 b=n55NPL2rRURZL+74G8M09NA9rgXRvRnU29+qEHFBn0MppYDExpNcAMsgMgDiInsdP
 e9FwcmUJ8Y6AjCrFfa/K/aW6Jvs9dbTBup6S7AadKVNMtD3gfO3KkheUE1yMaSWP0r
 xFNSxJ0bGuX2CE+PumWXRPDZ5fAbcJQNOy8Jwxowejys11KW1lSRnH4j6DuBvRaxxD
 2TsCNAmftE8bA8juD/Va8u+vhQFJIQX/113OZ7EFRh3Avu3xEHXXO505ujfvBsYXu9
 1BnnMG42qVuAcS5CeTVZ4VPBVJ1xJMzAeqJ+ikwf8ddARWKZ7cnn2TyrSG5rXzqzWV
 +iLxlqVgG2TCw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: mxsfb: Obtain bus flags from bridge state
Date: Sun, 17 Apr 2022 04:10:11 +0200
Message-Id: <20220417021011.337066-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case the MXSFB is connected to a bridge, attempt to obtain bus flags
from that bridge state too. The bus flags may specify e.g. the DE signal
polarity.

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V2: Add AB from Alexander
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index b7c70d269d2cb..cd2a59e110c3a 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -275,6 +275,7 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 }
 
 static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
+				     struct drm_bridge_state *bridge_state,
 				     const u32 bus_format)
 {
 	struct drm_device *drm = mxsfb->crtc.dev;
@@ -284,6 +285,8 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 
 	if (mxsfb->bridge && mxsfb->bridge->timings)
 		bus_flags = mxsfb->bridge->timings->input_bus_flags;
+	else if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
 
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
 			     m->crtc_clock,
@@ -345,7 +348,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    crtc->primary);
-	struct drm_bridge_state *bridge_state;
+	struct drm_bridge_state *bridge_state = NULL;
 	struct drm_device *drm = mxsfb->drm;
 	u32 bus_format = 0;
 	dma_addr_t paddr;
@@ -381,7 +384,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (!bus_format)
 		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
-	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
+	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
 	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
-- 
2.35.1

