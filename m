Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7AE32FE9D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 05:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85C66E103;
	Sun,  7 Mar 2021 04:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656666E0FB
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 04:06:51 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C541CE70;
 Sun,  7 Mar 2021 05:06:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615090009;
 bh=5oUioxpIWh45byxinnlW6XWcggRHtOQm2iBohwTGfVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R3Sj0N/zFyZTuYqaCuhk8AmQq5KDqv2B6yNxIakUG9xtJRrTxoSn+5EkESP1nY6LX
 F5Q1PfWJFn0yKr8B84C1filr3ywy2uSDEuSbfFpfRmaMrXA/I3crpdUthA71/LHFPG
 5C8FblDUVebRkhkkhRVizUZsqARLxtMLWbKAwX5A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm: xlnx: zynqmp_dpsub: Fix graphics layer blending
Date: Sun,  7 Mar 2021 06:06:10 +0200
Message-Id: <20210307040611.29246-3-laurent.pinchart@ideasonboard.com>
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

To display the graphics layer, the global alpha needs to be enabled.
Enable it when the graphics plane is enabled (with full opacity), and
disable it otherwise.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 6296f6d5acbc..4c23ffc75343 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1170,6 +1170,10 @@ zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
 		return;
 
 	zynqmp_disp_layer_disable(layer);
+
+	if (layer->id == ZYNQMP_DISP_LAYER_GFX)
+		zynqmp_disp_blend_set_global_alpha(&layer->disp->blend, false,
+						   0);
 }
 
 static void
@@ -1197,6 +1201,10 @@ zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
 
 	zynqmp_disp_layer_update(layer, plane->state);
 
+	if (layer->id == ZYNQMP_DISP_LAYER_GFX)
+		zynqmp_disp_blend_set_global_alpha(&layer->disp->blend, true,
+						   255);
+
 	/* Enable or re-enable the plane is the format has changed. */
 	if (format_changed)
 		zynqmp_disp_layer_enable(layer);
@@ -1463,7 +1471,6 @@ zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
 	zynqmp_disp_blend_set_output_format(&disp->blend,
 					    ZYNQMP_DPSUB_FORMAT_RGB);
 	zynqmp_disp_blend_set_bg_color(&disp->blend, 0, 0, 0);
-	zynqmp_disp_blend_set_global_alpha(&disp->blend, false, 0);
 
 	zynqmp_disp_enable(disp);
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
