Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABF838ADFC
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB4F6F44D;
	Thu, 20 May 2021 12:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572916E0D5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:19:49 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FBDDD84;
 Thu, 20 May 2021 14:19:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621513187;
 bh=o+xrOwQpelxFevPl6P7FRkiGlGkfUBPKh+YVdP7GtCw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AJTp1zXXdQMO03h4IjqLCwn30zHyObZwtIum1+YAqoldI8kDDkLYM4/7mCKuPfVg8
 ilZXlrLcfXKkjM1hu/LAkSAUylsBe7TNKzT2ucHBQuj4OI2C6bPVFs6CY9KZGmVZCd
 f5LaVcdYAiFd8Am2Wkk9RJt+jNmCus7yaMX56CYY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm: xlnx: zynqmp_dpsub: Fix graphics layer blending
Date: Thu, 20 May 2021 15:19:40 +0300
Message-Id: <20210520121942.26686-2-laurent.pinchart@ideasonboard.com>
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

To display the graphics layer, the global alpha needs to be enabled.
Enable it when the graphics plane is enabled (with full opacity), and
disable it otherwise.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index a061a75a9de7..27b3829fb7e0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -415,6 +415,11 @@ static void zynqmp_disp_avbuf_write(struct zynqmp_disp *disp, int reg, u32 val)
 	writel(val, disp->avbuf.base + reg);
 }
 
+static bool zynqmp_disp_layer_is_gfx(const struct zynqmp_disp_layer *layer)
+{
+	return layer->id == ZYNQMP_DISP_LAYER_GFX;
+}
+
 static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
 {
 	return layer->id == ZYNQMP_DISP_LAYER_VID;
@@ -1157,6 +1162,9 @@ zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
 		return;
 
 	zynqmp_disp_layer_disable(layer);
+
+	if (zynqmp_disp_layer_is_gfx(layer))
+		zynqmp_disp_blend_set_global_alpha(layer->disp, false, 0);
 }
 
 static void
@@ -1186,6 +1194,9 @@ zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
 
 	zynqmp_disp_layer_update(layer, new_state);
 
+	if (zynqmp_disp_layer_is_gfx(layer))
+		zynqmp_disp_blend_set_global_alpha(layer->disp, true, 255);
+
 	/* Enable or re-enable the plane is the format has changed. */
 	if (format_changed)
 		zynqmp_disp_layer_enable(layer);
@@ -1447,7 +1458,6 @@ zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	zynqmp_disp_blend_set_output_format(disp, ZYNQMP_DPSUB_FORMAT_RGB);
 	zynqmp_disp_blend_set_bg_color(disp, 0, 0, 0);
-	zynqmp_disp_blend_set_global_alpha(disp, false, 0);
 
 	zynqmp_disp_enable(disp);
 
-- 
Regards,

Laurent Pinchart

