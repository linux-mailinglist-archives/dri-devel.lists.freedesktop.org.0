Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D42B9C16
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9618F6E830;
	Thu, 19 Nov 2020 20:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3206E56A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:56:18 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] drm/ingenic: Compute timings according to
 adjusted_mode->crtc_*
Date: Thu, 19 Nov 2020 15:55:57 +0000
Message-Id: <20201119155559.14112-2-paul@crapouillou.net>
In-Reply-To: <20201119155559.14112-1-paul@crapouillou.net>
References: <20201119155559.14112-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The adjusted_mode->crtc_* fields contain the values adjusted for the
hardware, and are the ones that should be written to the registers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 368bfef8b340..998c63061fa8 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -190,15 +190,15 @@ static void ingenic_drm_crtc_update_timings(struct ingenic_drm *priv,
 {
 	unsigned int vpe, vds, vde, vt, hpe, hds, hde, ht;
 
-	vpe = mode->vsync_end - mode->vsync_start;
-	vds = mode->vtotal - mode->vsync_start;
-	vde = vds + mode->vdisplay;
-	vt = vde + mode->vsync_start - mode->vdisplay;
+	vpe = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	vds = mode->crtc_vtotal - mode->crtc_vsync_start;
+	vde = vds + mode->crtc_vdisplay;
+	vt = vde + mode->crtc_vsync_start - mode->crtc_vdisplay;
 
-	hpe = mode->hsync_end - mode->hsync_start;
-	hds = mode->htotal - mode->hsync_start;
-	hde = hds + mode->hdisplay;
-	ht = hde + mode->hsync_start - mode->hdisplay;
+	hpe = mode->crtc_hsync_end - mode->crtc_hsync_start;
+	hds = mode->crtc_htotal - mode->crtc_hsync_start;
+	hde = hds + mode->crtc_hdisplay;
+	ht = hde + mode->crtc_hsync_start - mode->crtc_hdisplay;
 
 	regmap_write(priv->map, JZ_REG_LCD_VSYNC,
 		     0 << JZ_LCD_VSYNC_VPS_OFFSET |
@@ -333,7 +333,7 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct drm_pending_vblank_event *event = crtc_state->event;
 
 	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-		ingenic_drm_crtc_update_timings(priv, &crtc_state->mode);
+		ingenic_drm_crtc_update_timings(priv, &crtc_state->adjusted_mode);
 		priv->update_clk_rate = true;
 	}
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
