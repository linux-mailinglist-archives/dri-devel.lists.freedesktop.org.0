Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E53B3E3DA9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1AB899D5;
	Mon,  9 Aug 2021 01:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981718991D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:12 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4CB0E04;
 Mon,  9 Aug 2021 03:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472911;
 bh=aCT7DlhWrPkaXntHdVdiSZUUTXELFCYKAHwqhD5dGGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R/q/Knr5Mf5ku1Clv+qk57aIyrw8bz05+xLe6OsriTmW+bNccb/nY67qpbAUVixGW
 YBTONzR0v8Mooo0rg7l1tpKP6o0ecv86f+g6nEF5l9rpIwuSn44d+nUfU0YDJ8WKDq
 FHslJ15dvCGt3TA1/ZGJaKKiso3tgUWibZvMdYCw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 17/36] drm: xlnx: zynqmp_dpsub: Remplace hardcoded values with
 ARRAY_SIZE()
Date: Mon,  9 Aug 2021 04:34:38 +0300
Message-Id: <20210809013457.11266-18-laurent.pinchart@ideasonboard.com>
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

Use the ARRAY_SIZE() macro to iterate over arrays, instead of hardcoding
their size. This makes the code less error-prone should the array size
change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 54aa9772e9b9..4767d3a7929a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1217,7 +1217,7 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 	unsigned int i, j;
 	int ret;
 
-	for (i = 0; i < ZYNQMP_DISP_NUM_LAYERS; i++) {
+	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
 		struct zynqmp_disp_layer *layer = &disp->layers[i];
 		enum drm_plane_type type;
 		u32 *drm_formats;
@@ -1288,7 +1288,7 @@ static void zynqmp_disp_destroy_layers(struct zynqmp_disp *disp)
 {
 	unsigned int i;
 
-	for (i = 0; i < ZYNQMP_DISP_NUM_LAYERS; i++)
+	for (i = 0; i < ARRAY_SIZE(disp->layers); i++)
 		zynqmp_disp_layer_release_dma(disp, &disp->layers[i]);
 }
 
@@ -1350,7 +1350,7 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < ZYNQMP_DISP_NUM_LAYERS; i++) {
+	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
 		struct zynqmp_disp_layer *layer = &disp->layers[i];
 
 		layer->id = i;
@@ -1587,7 +1587,7 @@ static void zynqmp_disp_map_crtc_to_plane(struct zynqmp_disp *disp)
 	u32 possible_crtcs = drm_crtc_mask(&disp->crtc);
 	unsigned int i;
 
-	for (i = 0; i < ZYNQMP_DISP_NUM_LAYERS; i++)
+	for (i = 0; i < ARRAY_SIZE(disp->layers); i++)
 		disp->layers[i].plane.possible_crtcs = possible_crtcs;
 }
 
-- 
Regards,

Laurent Pinchart

