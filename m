Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1921C38ADFB
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF666F44E;
	Thu, 20 May 2021 12:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721176F44B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:19:50 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 128C7DEE;
 Thu, 20 May 2021 14:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621513188;
 bh=lVMwJGi7fB9wvbiNSjSIrNoPbk7RggZz7LPwm3zgsRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZKKl+p+BWP9/kR3QEl/6DeFuvhV3XUV90YQnFtEpOp03PZhLkBmPLY0dj8GO+wU+T
 FSrgB1qtwBlG+EXGalRZI8qQWdc11zNFXojdTvaQpEqRFh0AA4670wE5xwFAf5NaHj
 0ycp4A4oD73ZC8Avz9fG+Sj7EJ3y77xmIJXH9rEo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm: xlnx: zynqmp_dpsub: Add global alpha support
Date: Thu, 20 May 2021 15:19:41 +0300
Message-Id: <20210520121942.26686-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210520121942.26686-1-laurent.pinchart@ideasonboard.com>
References: <20210520121942.26686-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@xilinx.com>, Rohit Visavalia <RVISAVAL@xilinx.com>,
 Quanyang Wang <quanyang.wang@windriver.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The graphics plane has a global alpha setting. Expose it through the
plane's alpha property.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 27b3829fb7e0..d87af7cb3340 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1164,7 +1164,8 @@ zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
 	zynqmp_disp_layer_disable(layer);
 
 	if (zynqmp_disp_layer_is_gfx(layer))
-		zynqmp_disp_blend_set_global_alpha(layer->disp, false, 0);
+		zynqmp_disp_blend_set_global_alpha(layer->disp, false,
+						   plane->state->alpha >> 8);
 }
 
 static void
@@ -1195,7 +1196,8 @@ zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
 	zynqmp_disp_layer_update(layer, new_state);
 
 	if (zynqmp_disp_layer_is_gfx(layer))
-		zynqmp_disp_blend_set_global_alpha(layer->disp, true, 255);
+		zynqmp_disp_blend_set_global_alpha(layer->disp, true,
+						   plane->state->alpha >> 8);
 
 	/* Enable or re-enable the plane is the format has changed. */
 	if (format_changed)
@@ -1249,6 +1251,9 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 
 		drm_plane_helper_add(&layer->plane,
 				     &zynqmp_disp_plane_helper_funcs);
+
+		if (zynqmp_disp_layer_is_gfx(layer))
+			drm_plane_create_alpha_property(&layer->plane);
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

