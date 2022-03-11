Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2634D672E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 18:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0539D10E2BB;
	Fri, 11 Mar 2022 17:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6238E10E199
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 17:06:28 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id ABBB883AD4;
 Fri, 11 Mar 2022 18:06:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647018387;
 bh=G1zvjAyPt8xTisfV4d9npqwyFz/LRwaO1gslQ1Bs76s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=krIY1cUZsSvTzhCnjv/nvKGOW/sfnHSYXplD8OVMHypdWQBmJERtlaLXho0HRZBNs
 IPVl+QqkvLMorQ6JBVXqtfFj0JBsFNoc6eORNJZbcbwhb9tS21okYTWB3g7z1ILRQw
 YEZownnL4pYxEpVQTxE+t7wN5pk5Oy0vb2NdQ1p+nXjkm1lb8T6YVCjPXUbs1ErnYc
 dq9xu2dHcIaz1aR8gWA5tdst4dRtPI3WFNwpHkn3rhV9ND+OKccJLFWVet0uuWaymc
 3X2CRcuVLcChYk52QG6TF4arUxhZZfgpiwKaSPEZIxGcWAm7iu2ISwfEpXYk9FhwQD
 /MQORS+qI8OPA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm: mxsfb: Factor out mxsfb_update_buffer()
Date: Fri, 11 Mar 2022 18:06:01 +0100
Message-Id: <20220311170601.50995-7-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311170601.50995-1-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
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

Pull functionality responsible for programming framebuffer address into
the controller into dedicated function mxsfb_update_buffer(). This is a
clean up. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V2: No change
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 497603964add8..4baa3db1f3d10 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -58,6 +58,22 @@ static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
 	return gem->paddr;
 }
 
+static void
+mxsfb_update_buffer(struct mxsfb_drm_private *mxsfb, struct drm_plane *plane,
+		    bool both)
+{
+	dma_addr_t paddr;
+
+	paddr = mxsfb_get_fb_paddr(plane);
+	if (!paddr)
+		return;
+
+	if (both)
+		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
+
+	writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
+}
+
 /*
  * Setup the MXSFB registers for decoding the pixels out of the framebuffer and
  * outputting them on the bus.
@@ -352,7 +368,6 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct drm_bridge_state *bridge_state;
 	struct drm_device *drm = mxsfb->drm;
 	u32 bus_format = 0;
-	dma_addr_t paddr;
 
 	/* If there is a bridge attached to the LCDIF, use its bus format */
 	if (mxsfb->bridge) {
@@ -387,11 +402,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	paddr = mxsfb_get_fb_paddr(crtc->primary);
-	if (paddr) {
-		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
-		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
-	}
+	mxsfb_update_buffer(mxsfb, crtc->primary, true);
 
 	mxsfb_enable_controller(mxsfb);
 
@@ -491,11 +502,8 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
 					      struct drm_atomic_state *state)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
-	dma_addr_t paddr;
 
-	paddr = mxsfb_get_fb_paddr(plane);
-	if (paddr)
-		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
+	mxsfb_update_buffer(mxsfb, plane, false);
 }
 
 static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
-- 
2.34.1

