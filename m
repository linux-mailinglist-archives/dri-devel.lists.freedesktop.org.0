Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E54153E3D9F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE20E8996E;
	Mon,  9 Aug 2021 01:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2058991D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:11 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D08811C15;
 Mon,  9 Aug 2021 03:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472910;
 bh=nXl0tEsPtQYQUn+NMA/HhF/jc0KrFTRHkkg5t45B0n4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VbKOXM4F/uPjOla+hQaSuCqEKzx3y0lPhmKCgrlUcrv/4wio0Vc/TWc2/kN7w3c8Y
 M6CBnSCJrInxT1TzNmhkEZ1d/oeHQFBkow4yXGPAz+BeX8/tJZtk5RqmhYwKRJySsH
 rltI4VyQOGCAmavUltLXRo+oPIzU8repwqWhvZ5w=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 15/36] drm: xlnx: zynqmp_dpsub: Use local variable in
 zynqmp_disp_layer_update()
Date: Mon,  9 Aug 2021 04:34:36 +0300
Message-Id: <20210809013457.11266-16-laurent.pinchart@ideasonboard.com>
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

Reuse the local info variable instead of going through the layer pointer
in zynqmp_disp_layer_update(). This doesn't introduce any functional
change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index bfa38a0b5199..9b36dcc4ffd9 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1083,7 +1083,7 @@ static int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 	const struct drm_format_info *info = layer->drm_fmt;
 	unsigned int i;
 
-	for (i = 0; i < layer->drm_fmt->num_planes; i++) {
+	for (i = 0; i < info->num_planes; i++) {
 		unsigned int width = state->crtc_w / (i ? info->hsub : 1);
 		unsigned int height = state->crtc_h / (i ? info->vsub : 1);
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
-- 
Regards,

Laurent Pinchart

