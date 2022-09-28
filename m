Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA0E5EE9AC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B47810E791;
	Wed, 28 Sep 2022 22:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCA710E139
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32BE96DB;
 Thu, 29 Sep 2022 00:47:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405267;
 bh=0tQo/JVrlGQpbU8ZnQ6YbdjAHr4/QnBUvUg7L0r//OQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pMRQ1uXOILbziH7AbH16lqgLW8NoTAOCqA1rH+5YJjyc1Z7GBe71pCNBn4HmnFoT1
 qntaVyRaMkdvhnNTUe6GTTKu5R5wx/dEXwi2rX6g4YeH92EYM/Pqp6kDs5p4X6XeKl
 3WqMxMoyGHtd9LgbbPyeXfFUMvABohO4EWNPzwUc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/37] drm: xlnx: zynqmp_dpsub: Use local variable in
 zynqmp_disp_layer_update()
Date: Thu, 29 Sep 2022 01:46:57 +0300
Message-Id: <20220928224719.3291-16-laurent.pinchart@ideasonboard.com>
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

Reuse the local info variable instead of going through the layer pointer
in zynqmp_disp_layer_update(). This doesn't introduce any functional
change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index c21405e8f9dd..1d7642b38f1f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1089,7 +1089,7 @@ static int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
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

