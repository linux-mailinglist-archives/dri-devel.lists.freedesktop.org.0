Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926823E3D9C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A96889938;
	Mon,  9 Aug 2021 01:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101F18991D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:13 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C0E5E51;
 Mon,  9 Aug 2021 03:35:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472911;
 bh=G1l3QSpMo/v+OU5w2ghnpUahbzNpuwG5Qn1y0T3cMIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XdCBEvwDNV0+5cQuHaoQxXwpEydUZ+aAp8ErvhHOxLkOfwTx+lXfgiGTTUrTHxXaX
 bRPY9FzYATDv+XaImdn+yeDpJNJtmhYrYrkAJSes23RFMXDm53fEfMgmSsx5FwrMbE
 SlE+LMFn9yBqbIZ9y+FwMNJHp8Utc8BchDYMpCFU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 18/36] drm: xlnx: zynqmp_dpsub: Don't use drmm_kcalloc() for
 temporary data
Date: Mon,  9 Aug 2021 04:34:39 +0300
Message-Id: <20210809013457.11266-19-laurent.pinchart@ideasonboard.com>
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

The array of formats passed to drm_universal_plane_init() doesn't need
to outlive the function call, as it's copied internally. Use kcalloc()
instead of drmm_kcalloc() to allocate it, and free it right after usage.

While at it, move the allocation and initialization of the formats array
to a separate function, to prepare for splitting the DRM plane handling
to a separate file.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 45 ++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 4767d3a7929a..b88efb6407a7 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -999,6 +999,33 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
 	return NULL;
 }
 
+/**
+ * zynqmp_disp_layer_drm_formats - Return the DRM formats supported by the layer
+ * @layer: The layer
+ * @num_formats: Pointer to the returned number of formats
+ *
+ * Return: A newly allocated u32 array that stores all the DRM formats
+ * supported by the layer. The number of formats in the array is returned
+ * through the num_formats argument.
+ */
+static u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
+					  unsigned int *num_formats)
+{
+	unsigned int i;
+	u32 *formats;
+
+	formats = kcalloc(layer->info->num_formats, sizeof(*formats),
+			  GFP_KERNEL);
+	if (!formats)
+		return NULL;
+
+	for (i = 0; i < layer->info->num_formats; ++i)
+		formats[i] = layer->info->formats[i].drm_fmt;
+
+	*num_formats = layer->info->num_formats;
+	return formats;
+}
+
 /**
  * zynqmp_disp_layer_enable - Enable a layer
  * @layer: The layer
@@ -1214,31 +1241,27 @@ static const struct drm_plane_funcs zynqmp_disp_plane_funcs = {
 
 static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 {
-	unsigned int i, j;
+	unsigned int i;
 	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
 		struct zynqmp_disp_layer *layer = &disp->layers[i];
 		enum drm_plane_type type;
-		u32 *drm_formats;
+		unsigned int num_formats;
+		u32 *formats;
 
-		drm_formats = drmm_kcalloc(disp->drm, sizeof(*drm_formats),
-					   layer->info->num_formats,
-					   GFP_KERNEL);
-		if (!drm_formats)
+		formats = zynqmp_disp_layer_drm_formats(layer, &num_formats);
+		if (!formats)
 			return -ENOMEM;
 
-		for (j = 0; j < layer->info->num_formats; ++j)
-			drm_formats[j] = layer->info->formats[j].drm_fmt;
-
 		/* Graphics layer is primary, and video layer is overlay. */
 		type = zynqmp_disp_layer_is_video(layer)
 		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
 		ret = drm_universal_plane_init(disp->drm, &layer->plane, 0,
 					       &zynqmp_disp_plane_funcs,
-					       drm_formats,
-					       layer->info->num_formats,
+					       formats, num_formats,
 					       NULL, type, NULL);
+		kfree(formats);
 		if (ret)
 			return ret;
 
-- 
Regards,

Laurent Pinchart

