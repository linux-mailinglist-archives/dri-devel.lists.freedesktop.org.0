Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF25EE9AE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E7010E7A0;
	Wed, 28 Sep 2022 22:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4360E10E130
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B48DF47C;
 Thu, 29 Sep 2022 00:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405269;
 bh=iaKlKuK2kPlBM97C6CTd3WSM7onZK5jeZ8uW23RnSfI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EWA5QEy9oFdOTf60sXB1McDTYF/d/rMNTZ6J3sYJVT1eScDHd00lvlsZGi4SDZroA
 2+x9RZWTRjT7PMCgGNRsJM1+dM1tpAyknh8mEZUeEbrKSu9kyA3DnBfrUEJQbn1gAm
 0txjWjiG/st0ivYgDIeY6CpgZRiGJglhr/6gI7h8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/37] drm: xlnx: zynqmp_dpsub: Pass format info to
 zynqmp_disp_layer_set_format()
Date: Thu, 29 Sep 2022 01:46:58 +0300
Message-Id: <20220928224719.3291-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
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
index 1d7642b38f1f..426e1a3b795f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1038,15 +1038,13 @@ static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
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
@@ -1191,7 +1189,7 @@ zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
 		if (old_state->fb)
 			zynqmp_disp_layer_disable(layer);
 
-		zynqmp_disp_layer_set_format(layer, new_state);
+		zynqmp_disp_layer_set_format(layer, new_state->fb->format);
 	}
 
 	zynqmp_disp_layer_update(layer, new_state);
-- 
Regards,

Laurent Pinchart

