Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5710528C527
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 01:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D8F6E84E;
	Mon, 12 Oct 2020 23:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367046E839
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 23:29:32 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E61E1A3F;
 Tue, 13 Oct 2020 01:29:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602545370;
 bh=8Kkm9+JHDsiHPyq+HeEXq8sWzn1gla75u2KB0a/+prY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ija4UAaEUKxBT4qQ6ZEoNC905YXN1jsklrebJsrSJ7+IQ+uaSj9MFhdOO+chwWfdh
 flDr4rGpZb9i9MKee+GQwuuoDw/mJ+qkeHTZA9L9SaNFRnwGieEwdbLkT6JDtTdK1x
 bwCBojqfRDrrbgISedCL11cit2aUeHoU4usDkPtQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: mxsfb: Fix format changes for primary plane
Date: Tue, 13 Oct 2020 02:28:39 +0300
Message-Id: <20201012232840.15680-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201012232840.15680-1-laurent.pinchart@ideasonboard.com>
References: <20201012232840.15680-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The primary plane's format is configured in registers that have no
shadow support for live updates. They require the display to be fully
reconfigured in order to be updated. Force a mode set when the primary
plane format changes to ensure this.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 6d512f346918..7a69d9f3a875 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -407,14 +407,28 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 	struct drm_crtc_state *crtc_state;
+	int ret;
 
 	crtc_state = drm_atomic_get_new_crtc_state(plane_state->state,
 						   &mxsfb->crtc);
 
-	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   false, true);
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  false, true);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Changing the primary plane format requires stopping the display
+	 * controller first. Force a full mode set to do so.
+	 */
+	if (plane == mxsfb->crtc.primary &&
+	    plane_state->visible && plane->state->visible &&
+	    plane_state->fb->format != plane->state->fb->format)
+		crtc_state->mode_changed = true;
+
+	return 0;
 }
 
 static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
