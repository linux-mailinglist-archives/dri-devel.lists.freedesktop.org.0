Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EFBAA3C2D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB20210E472;
	Tue, 29 Apr 2025 23:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YAefKIPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE2410E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 23:29:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C03119DE;
 Wed, 30 Apr 2025 01:29:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745969358;
 bh=G4mR0T4QXAobaLYQreC+Pkhgic1JC7pUgVbD8hJMe78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YAefKIPHQ/gh+6sPK3vh3u8QFAhHsqz3dIeDdtuUPdzyFWqVF8ime4KXIzPA39xC1
 Zkc8xgts944+BCSFro2p17+3ANgfjSaa4yD4oP2GcRD02LcAZcicl7VEDb2ZPhyjg6
 IGP6jyYjUqVda8aaUaBDTiuGRJHjgCxMOGZaFkQo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 9/9] drm: rcar-du: Create plane color properties
Date: Wed, 30 Apr 2025 02:29:04 +0300
Message-ID: <20250429232904.26413-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the VSP1 driver allows setting per-plance color encoding and
color range for its DRM pipeline, create the corresponding DRM
properties in the DU driver and wire them to the VSP. This completes
support for plane color space.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 7aa0373563a4..09f9ab2111a2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -10,6 +10,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -251,6 +252,12 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 
 	cfg.premult = state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI;
 
+	cfg.color_encoding = state->state.color_encoding == DRM_COLOR_YCBCR_BT601
+			   ? V4L2_YCBCR_ENC_601 : V4L2_YCBCR_ENC_709;
+	cfg.color_range = state->state.color_range == DRM_COLOR_YCBCR_LIMITED_RANGE
+			? V4L2_QUANTIZATION_LIM_RANGE
+			: V4L2_QUANTIZATION_FULL_RANGE;
+
 	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
 			      plane->index, &cfg);
 }
@@ -530,6 +537,14 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 					BIT(DRM_MODE_BLEND_PREMULTI) |
 					BIT(DRM_MODE_BLEND_COVERAGE));
 
+		drm_plane_create_color_properties(&plane->plane,
+						  BIT(DRM_COLOR_YCBCR_BT601) |
+						  BIT(DRM_COLOR_YCBCR_BT709),
+						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+						  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+						  DRM_COLOR_YCBCR_BT601,
+						  DRM_COLOR_YCBCR_LIMITED_RANGE);
+
 		vsp->num_planes++;
 	}
 
-- 
Regards,

Laurent Pinchart

