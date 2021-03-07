Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E71532FE9B
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 05:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05626E0F8;
	Sun,  7 Mar 2021 04:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656346E0DE
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 04:06:50 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B5973F5;
 Sun,  7 Mar 2021 05:06:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615090008;
 bh=2zWPeqERQPCnpjsNQtCE+XOTo+M9nNH2/DENaDSWYho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mmYm6bvBCF4XmIl0cDdZAljSKXZgZptGbApFXsR6bkNRtyiuRNxwDhoQXse2gl/Aa
 K/VooyU/WPwcTqB/A8hFuMx63exIMIQNsnji47XP+1vTRqIBoMSM71EdKf+JxrJHVJ
 zNHkqEAf1fJljlVyW+0wmFW4kyYv6f++fz4c2C4U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: xlnx: zynqmp_dpsub: Fix plane ordering
Date: Sun,  7 Mar 2021 06:06:09 +0200
Message-Id: <20210307040611.29246-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210307040611.29246-1-laurent.pinchart@ideasonboard.com>
References: <20210307040611.29246-1-laurent.pinchart@ideasonboard.com>
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
Cc: Rohit Visavalia <RVISAVAL@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPSUB has a fixed plane order, with the video plane being at the
bottom and the graphics plane at the top. Register the video plane as
the primary plane, as a bottom overlay plane doesn't make sense.

While at it, add immutable zorder properties to the planes to report
this information to userspace.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 148add0ca1d6..6296f6d5acbc 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1236,8 +1236,11 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 		for (j = 0; j < layer->info->num_formats; ++j)
 			drm_formats[j] = layer->info->formats[j].drm_fmt;
 
-		/* Graphics layer is primary, and video layer is overlay. */
-		type = i == ZYNQMP_DISP_LAYER_GFX
+		/*
+		 * The video layer is at the bottom of the stack and the
+		 * graphics layer at the top.
+		 */
+		type = i == ZYNQMP_DISP_LAYER_VID
 		     ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
 		ret = drm_universal_plane_init(disp->drm, &layer->plane, 0,
 					       &zynqmp_disp_plane_funcs,
@@ -1249,6 +1252,8 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 
 		drm_plane_helper_add(&layer->plane,
 				     &zynqmp_disp_plane_helper_funcs);
+
+		drm_plane_create_zpos_immutable_property(&layer->plane, i);
 	}
 
 	return 0;
@@ -1573,7 +1578,7 @@ static const struct drm_crtc_funcs zynqmp_disp_crtc_funcs = {
 
 static int zynqmp_disp_create_crtc(struct zynqmp_disp *disp)
 {
-	struct drm_plane *plane = &disp->layers[ZYNQMP_DISP_LAYER_GFX].plane;
+	struct drm_plane *plane = &disp->layers[ZYNQMP_DISP_LAYER_VID].plane;
 	int ret;
 
 	ret = drm_crtc_init_with_planes(disp->drm, &disp->crtc, plane,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
