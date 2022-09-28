Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6845EE9AD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A250110E7A9;
	Wed, 28 Sep 2022 22:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACADC10E4A5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 296E76BE;
 Thu, 29 Sep 2022 00:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405270;
 bh=yeMAoOfio3534JxA7aUOgOGk2o+Hcr2RqkbhgQXS1JI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rFA1HvtF6gvFAVDPbrpbAbInwJnSxaBcsTPdlYslW9bSdBiEvbjYikmY6w48gcoD0
 2uyIvZmONEgM1E07MwBFG8Usx98oXKxCBe0hzTE6ODrTvwxkMNBgxJilYEcC2p4u25
 vHgK+g6BYFNftLpCSA13oRJ6j2hsv0v0kzuMIU5c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/37] drm: xlnx: zynqmp_dpsub: Remplace hardcoded values
 with ARRAY_SIZE()
Date: Thu, 29 Sep 2022 01:46:59 +0300
Message-Id: <20220928224719.3291-18-laurent.pinchart@ideasonboard.com>
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

Use the ARRAY_SIZE() macro to iterate over arrays, instead of hardcoding
their size. This makes the code less error-prone should the array size
change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 426e1a3b795f..a88313ac29a7 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1223,7 +1223,7 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 	unsigned int i, j;
 	int ret;
 
-	for (i = 0; i < ZYNQMP_DISP_NUM_LAYERS; i++) {
+	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
 		struct zynqmp_disp_layer *layer = &disp->layers[i];
 		enum drm_plane_type type;
 		u32 *drm_formats;
@@ -1294,7 +1294,7 @@ static void zynqmp_disp_destroy_layers(struct zynqmp_disp *disp)
 {
 	unsigned int i;
 
-	for (i = 0; i < ZYNQMP_DISP_NUM_LAYERS; i++)
+	for (i = 0; i < ARRAY_SIZE(disp->layers); i++)
 		zynqmp_disp_layer_release_dma(disp, &disp->layers[i]);
 }
 
@@ -1356,7 +1356,7 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < ZYNQMP_DISP_NUM_LAYERS; i++) {
+	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
 		struct zynqmp_disp_layer *layer = &disp->layers[i];
 
 		layer->id = i;
@@ -1593,7 +1593,7 @@ static void zynqmp_disp_map_crtc_to_plane(struct zynqmp_disp *disp)
 	u32 possible_crtcs = drm_crtc_mask(&disp->crtc);
 	unsigned int i;
 
-	for (i = 0; i < ZYNQMP_DISP_NUM_LAYERS; i++)
+	for (i = 0; i < ARRAY_SIZE(disp->layers); i++)
 		disp->layers[i].plane.possible_crtcs = possible_crtcs;
 }
 
-- 
Regards,

Laurent Pinchart

