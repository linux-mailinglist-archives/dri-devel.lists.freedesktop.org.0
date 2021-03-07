Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFE732FE9C
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 05:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859DE6E0FE;
	Sun,  7 Mar 2021 04:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99566E0FE
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 04:06:51 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D491F84;
 Sun,  7 Mar 2021 05:06:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615090009;
 bh=zaLLCEAjsGewXKdNrSZ+hi955bgK9WDM8x7x/4FrcGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rLPx2cGj8uhIGi9ahJ80YgK2MTuvpKtVnB5S9bHV19dVa8mUNsfYVINP0o2vNC56p
 R/OZaAfgk9L0z/gnL/GbI5XvAcSiuSMAl0F0KOxUjpnStm2dV4UFKKfoobcKnu9mdK
 r80RXDGL7d7w58yaQ32NJzxgMAJ1UKGsJ2yyHNg8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm: xlnx: zynqmp_dpsub: Add global alpha support
Date: Sun,  7 Mar 2021 06:06:11 +0200
Message-Id: <20210307040611.29246-4-laurent.pinchart@ideasonboard.com>
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

The top (graphics) plane has a global alpha setting. Expose it through
the plane's alpha property.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 4c23ffc75343..991dd6bebdc7 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1173,7 +1173,7 @@ zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
 
 	if (layer->id == ZYNQMP_DISP_LAYER_GFX)
 		zynqmp_disp_blend_set_global_alpha(&layer->disp->blend, false,
-						   0);
+						   plane->state->alpha >> 8);
 }
 
 static void
@@ -1203,7 +1203,7 @@ zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
 
 	if (layer->id == ZYNQMP_DISP_LAYER_GFX)
 		zynqmp_disp_blend_set_global_alpha(&layer->disp->blend, true,
-						   255);
+						   plane->state->alpha >> 8);
 
 	/* Enable or re-enable the plane is the format has changed. */
 	if (format_changed)
@@ -1262,6 +1262,8 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 				     &zynqmp_disp_plane_helper_funcs);
 
 		drm_plane_create_zpos_immutable_property(&layer->plane, i);
+		if (type == DRM_PLANE_TYPE_OVERLAY)
+			drm_plane_create_alpha_property(&layer->plane);
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
