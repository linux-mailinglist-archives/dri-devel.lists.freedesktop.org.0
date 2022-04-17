Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6575045FC
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 04:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20C910E657;
	Sun, 17 Apr 2022 02:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEF810E657
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 02:08:22 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 872A583DD4;
 Sun, 17 Apr 2022 04:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650161300;
 bh=bjCUsVBBct0ugoP4cGqCtBzlW07d9+cbqPWEUVl63ec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r85hsoaPopZIg/A6T424Pb2fPwGYWznjBuYSpFPPK57TCJ7klL2WSGyHkK0BM7lGn
 8TgsV8fPqaF/0B0aZz6qj7XaVsNVRb5MuFC1x2itDVSxNvGLSJPuLmtTv0xAS3/PRo
 YGWMxmWZh5D4V+brE8kmqjsnhfVCYoA+B8g3QKRc7pyiHAxlbMTp6de4GAXsHzb4rD
 y1gPNJlsP2THb87LKoMNAEo4vUAZMwBLMgt5OgQzMxGrFYHAiXklC2tndrubgs+eNy
 QovsaZB27Z8zxjM6grKksg0D+ZN7SQObaqQgeSRFwnFUh+vFzX/vUe9aYi1V+hWnwj
 gJJ2+2+gCwR4w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm: mxsfb: Replace mxsfb_get_fb_paddr() with
 drm_fb_cma_get_gem_addr()
Date: Sun, 17 Apr 2022 04:07:58 +0200
Message-Id: <20220417020800.336675-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220417020800.336675-1-marex@denx.de>
References: <20220417020800.336675-1-marex@denx.de>
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

Replace mxsfb_get_fb_paddr() with drm_fb_cma_get_gem_addr() to correctly handle
FB offset.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V3: New patch
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 45cabe0960769..6697a600b36f4 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -223,21 +223,6 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 	return 0;
 }
 
-static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
-{
-	struct drm_framebuffer *fb = plane->state->fb;
-	struct drm_gem_cma_object *gem;
-
-	if (!fb)
-		return 0;
-
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
-	if (!gem)
-		return 0;
-
-	return gem->paddr;
-}
-
 static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 				     const u32 bus_format)
 {
@@ -350,6 +335,8 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
+									    crtc->primary);
 	struct drm_bridge_state *bridge_state;
 	struct drm_device *drm = mxsfb->drm;
 	u32 bus_format = 0;
@@ -389,7 +376,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	paddr = mxsfb_get_fb_paddr(crtc->primary);
+	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (paddr) {
 		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
@@ -492,9 +479,11 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
 					      struct drm_atomic_state *state)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
+	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
+									    plane);
 	dma_addr_t paddr;
 
-	paddr = mxsfb_get_fb_paddr(plane);
+	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (paddr)
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
 }
@@ -510,7 +499,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	dma_addr_t paddr;
 	u32 ctrl;
 
-	paddr = mxsfb_get_fb_paddr(plane);
+	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (!paddr) {
 		writel(0, mxsfb->base + LCDC_AS_CTRL);
 		return;
-- 
2.35.1

