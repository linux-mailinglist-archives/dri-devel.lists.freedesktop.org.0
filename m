Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6D92A79C7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE126E17A;
	Thu,  5 Nov 2020 08:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBCB6E17F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 08:39:18 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/ingenic: ipu: Search for scaling coefs up to 102% of the
 screen
Date: Thu,  5 Nov 2020 08:39:05 +0000
Message-Id: <20201105083905.8780-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:56:48 +0000
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

Increase the scaled image's theorical width/height until we find a
configuration that has valid scaling coefficients, up to 102% of the
screen's resolution. This makes sure that we can scale from almost
every resolution possible at the cost of a very small distorsion.
The CRTC_W / CRTC_H are not modified.

This algorithm was already in place but would not try to go above the
screen's resolution, and as a result would only work if the CRTC_W /
CRTC_H were smaller than the screen resolution. It will now try until it
reaches 102% of the screen's resolution.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-ipu.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index fc8c6e970ee3..e52777ef85fd 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -516,7 +516,7 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 					  struct drm_plane_state *state)
 {
-	unsigned int num_w, denom_w, num_h, denom_h, xres, yres;
+	unsigned int num_w, denom_w, num_h, denom_h, xres, yres, max_w, max_h;
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
 	struct drm_crtc *crtc = state->crtc ?: plane->state->crtc;
 	struct drm_crtc_state *crtc_state;
@@ -558,19 +558,26 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	xres = state->src_w >> 16;
 	yres = state->src_h >> 16;
 
-	/* Adjust the coefficients until we find a valid configuration */
-	for (denom_w = xres, num_w = state->crtc_w;
-	     num_w <= crtc_state->mode.hdisplay; num_w++)
+	/*
+	 * Increase the scaled image's theorical width/height until we find a
+	 * configuration that has valid scaling coefficients, up to 102% of the
+	 * screen's resolution. This makes sure that we can scale from almost
+	 * every resolution possible at the cost of a very small distorsion.
+	 * The CRTC_W / CRTC_H are not modified.
+	 */
+	max_w = crtc_state->mode.hdisplay * 102 / 100;
+	max_h = crtc_state->mode.vdisplay * 102 / 100;
+
+	for (denom_w = xres, num_w = state->crtc_w; num_w <= max_w; num_w++)
 		if (!reduce_fraction(&num_w, &denom_w))
 			break;
-	if (num_w > crtc_state->mode.hdisplay)
+	if (num_w > max_w)
 		return -EINVAL;
 
-	for (denom_h = yres, num_h = state->crtc_h;
-	     num_h <= crtc_state->mode.vdisplay; num_h++)
+	for (denom_h = yres, num_h = state->crtc_h; num_h <= max_h; num_h++)
 		if (!reduce_fraction(&num_h, &denom_h))
 			break;
-	if (num_h > crtc_state->mode.vdisplay)
+	if (num_h > max_h)
 		return -EINVAL;
 
 	ipu->num_w = num_w;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
