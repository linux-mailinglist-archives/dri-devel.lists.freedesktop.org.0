Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AF33790C9
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 16:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6233A6E165;
	Mon, 10 May 2021 14:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1346E165
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 14:29:18 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lg6uK-0002Bs-9p; Mon, 10 May 2021 16:29:16 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] drm/imx: ipuv3-plane: use drm managed resources
Date: Mon, 10 May 2021 16:29:15 +0200
Message-Id: <20210510142915.941460-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The conversion to drm managed resources introduced two bugs: the plane is now
always initialized with the linear-only list, while the list with the Vivante
GPU modifiers should have been used when the PRG/PRE engines are present. This
masked another issue, as ipu_plane_format_mod_supported() is now called before
the private plane data is set up, so if a non-linear modifier is supplied in
the plane modifier list, we run into a NULL pointer dereference checking for
the PRG presence. To fix this just remove the check from this function, as we
know that it will only be called with a non-linear modifier, if the plane init
code has already determined that the PRG/PRE is present.

Fixes: 699e7e543f1a ("drm/imx: ipuv3-plane: use drm managed resources")
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index fa5009705365..8b6c137bf0fc 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -320,10 +320,11 @@ static bool ipu_plane_format_mod_supported(struct drm_plane *plane,
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
-	/* without a PRG there are no supported modifiers */
-	if (!ipu_prg_present(ipu))
-		return false;
-
+	/*
+	 * Without a PRG the possible modifiers list only includes the linear
+	 * modifier, so we always take the early return from this function and
+	 * only end up here if the PRG is present.
+	 */
 	return ipu_prg_format_supported(ipu, format, modifier);
 }
 
@@ -835,6 +836,9 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	DRM_DEBUG_KMS("channel %d, dp flow %d, possible_crtcs=0x%x\n",
 		      dma, dp, possible_crtcs);
 
+	if (ipu_prg_present(ipu))
+		modifiers = pre_format_modifiers;
+
 	ipu_plane = drmm_universal_plane_alloc(dev, struct ipu_plane, base,
 					       possible_crtcs, &ipu_plane_funcs,
 					       ipu_plane_formats,
@@ -850,9 +854,6 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	ipu_plane->dma = dma;
 	ipu_plane->dp_flow = dp;
 
-	if (ipu_prg_present(ipu))
-		modifiers = pre_format_modifiers;
-
 	drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
 
 	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG)
-- 
2.29.2

