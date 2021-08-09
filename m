Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3CC3E3DA7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6044D899BE;
	Mon,  9 Aug 2021 01:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA9E8991D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:11 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 537D31D72;
 Mon,  9 Aug 2021 03:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472910;
 bh=oJ71SJUsQJ61oul+ffwS2OWXZgPrVRFJKeBz4iWIBGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=szsma+1l1N4+vzMx2YFfJqU6i7bsWSYAZ4Wegbb6T5Cn6o+TSWn/5i90u8384/6hP
 LUcRzTKXy1ynjG9CTThEmANBTeDi9uI5rhSyHLX/w3L1zHkW1g0rNtDsnlLnj4MhCq
 pdvhwTHxxl8BlMa8PFwxCUC3iNT/0au8hJiX1uyo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 16/36] drm: xlnx: zynqmp_dpsub: Pass format info to
 zynqmp_disp_layer_set_format()
Date: Mon,  9 Aug 2021 04:34:37 +0300
Message-Id: <20210809013457.11266-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
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

The zynqmp_disp_layer_set_format() function only needs format
information, not a full plane state. Get the necessary info from the
plane state in the caller and pass it to zynqmp_disp_layer_set_format().
This prepares for calling the function from non-DRM code. This doesn't
introduce any functional change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 9b36dcc4ffd9..54aa9772e9b9 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1036,15 +1036,13 @@ static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 /**
  * zynqmp_disp_layer_set_format - Set the layer format
  * @layer: The layer
- * @state: The plane state
+ * @info: The format info
  *
- * Set the format for @layer based on @state->fb->format. The layer must be
- * disabled.
+ * Set the format for @layer to @info. The layer must be disabled.
  */
 static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
-					 struct drm_plane_state *state)
+					 const struct drm_format_info *info)
 {
-	const struct drm_format_info *info = state->fb->format;
 	unsigned int i;
 
 	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
@@ -1185,7 +1183,7 @@ zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
 		if (old_state->fb)
 			zynqmp_disp_layer_disable(layer);
 
-		zynqmp_disp_layer_set_format(layer, new_state);
+		zynqmp_disp_layer_set_format(layer, new_state->fb->format);
 	}
 
 	zynqmp_disp_layer_update(layer, new_state);
-- 
Regards,

Laurent Pinchart

