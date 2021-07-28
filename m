Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328353D84B1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7DF6EADF;
	Wed, 28 Jul 2021 00:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5EE6EADF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 00:32:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209441990"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209441990"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634583381"
Received: from mamarti1-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.71.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:08 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH 04/14] drm/kmb : W/A for 256B cache alignment for video
Date: Tue, 27 Jul 2021 17:31:16 -0700
Message-Id: <20210728003126.1425028-4-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For B0 silicon, the media driver pads the decoded video dmabufs for 256B
alignment. This is the backing buffer of the framebuffer and info in the
drm frame buffer is not correct for these buffers as this is done
internally in the media driver. This change extracts the meta data info
from dmabuf priv structure and uses that info for programming stride and
offsets in kmb_plane_atomic_update().

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.h    |  1 +
 drivers/gpu/drm/kmb/kmb_plane.c  | 38 ++++++++++++++++++++---
 drivers/gpu/drm/kmb/kmb_vidmem.h | 52 ++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/kmb/kmb_vidmem.h

diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index ebbaa5f422d5..0904e6eb2a09 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -49,6 +49,7 @@ struct kmb_drm_private {
 	int				kmb_under_flow;
 	int				kmb_flush_done;
 	int				layer_no;
+	struct viv_vidmem_metadata	*md_info;
 };
 
 static inline struct kmb_drm_private *to_kmb(const struct drm_device *dev)
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 2888dd5dcc2c..e45419d6ed96 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -11,12 +11,16 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 
+#include <linux/dma-buf.h>
+
 #include "kmb_drv.h"
 #include "kmb_plane.h"
 #include "kmb_regs.h"
+#include "kmb_vidmem.h"
 
 const u32 layer_irqs[] = {
 	LCD_INT_VL0,
@@ -294,8 +298,10 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	unsigned int ctrl = 0, val = 0, out_format = 0;
 	unsigned int src_w, src_h, crtc_x, crtc_y;
 	unsigned char plane_id;
-	int num_planes;
+	int num_planes, i;
 	static dma_addr_t addr[MAX_SUB_PLANES];
+	struct viv_vidmem_metadata *md = NULL;
+	struct drm_gem_object *gem_obj;
 
 	if (!plane || !new_plane_state || !old_plane_state)
 		return;
@@ -325,6 +331,16 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	drm_dbg(&kmb->drm,
 		"src_w=%d src_h=%d, fb->format->format=0x%x fb->flags=0x%x\n",
 		  src_w, src_h, fb->format->format, fb->flags);
+	gem_obj = drm_gem_fb_get_obj(fb, plane_id);
+	if (gem_obj && gem_obj->import_attach &&
+	    gem_obj->import_attach->dmabuf &&
+	    gem_obj->import_attach->dmabuf->priv) {
+		md = gem_obj->import_attach->dmabuf->priv;
+
+		/* Check if metadata is coming from hantro driver */
+		if (md->magic != HANTRO_IMAGE_VIV_META_DATA_MAGIC)
+			md = NULL;
+	}
 
 	width = fb->width;
 	height = fb->height;
@@ -332,6 +348,11 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	drm_dbg(&kmb->drm, "dma_len=%d ", dma_len);
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN_SHADOW(plane_id), dma_len);
+	if (md) {
+		for (i = 0; i < 3; i++)
+			fb->pitches[i] = md->plane[i].stride;
+	}
+
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
 		      fb->pitches[0]);
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
@@ -339,18 +360,22 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 
 	addr[Y_PLANE] = drm_fb_cma_get_gem_addr(fb, new_plane_state, 0);
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),
-		      addr[Y_PLANE] + fb->offsets[0]);
+		      addr[Y_PLANE]);
 	val = get_pixel_format(fb->format->format);
 	val |= get_bits_per_pixel(fb->format);
 	/* Program Cb/Cr for planar formats */
 	if (num_planes > 1) {
 		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
-			      width * fb->format->cpp[0]);
+				fb->pitches[1]);
 		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
 			      (width * fb->format->cpp[0]));
 
 		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, new_plane_state,
 							U_PLANE);
+		if (md) {
+			addr[U_PLANE] += md->plane[1].offset -
+					 (addr[U_PLANE] - addr[Y_PLANE]);
+		}
 		/* check if Cb/Cr is swapped*/
 		if (num_planes == 3 && (val & LCD_LAYER_CRCB_ORDER))
 			kmb_write_lcd(kmb,
@@ -364,7 +389,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 		if (num_planes == 3) {
 			kmb_write_lcd(kmb,
 				      LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
-				      ((width) * fb->format->cpp[0]));
+				      fb->pitches[2]);
 
 			kmb_write_lcd(kmb,
 				      LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
@@ -373,6 +398,11 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 			addr[V_PLANE] = drm_fb_cma_get_gem_addr(fb,
 								new_plane_state,
 								V_PLANE);
+			if (md) {
+				addr[V_PLANE] +=
+					md->plane[2].offset -
+					(addr[V_PLANE] - addr[Y_PLANE]);
+			}
 
 			/* check if Cb/Cr is swapped*/
 			if (val & LCD_LAYER_CRCB_ORDER)
diff --git a/drivers/gpu/drm/kmb/kmb_vidmem.h b/drivers/gpu/drm/kmb/kmb_vidmem.h
new file mode 100644
index 000000000000..06198d413f50
--- /dev/null
+++ b/drivers/gpu/drm/kmb/kmb_vidmem.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright © 2018-2020 Intel Corporation
+ */
+
+#ifndef __KMB_VIDMEM_H__
+#define __KMB_VIDMEM_H__
+
+#define HANTRO_MAGIC(ch0, ch1, ch2, ch3) \
+	    ((unsigned long)(unsigned char)(ch0) | \
+	    ((unsigned long)(unsigned char)(ch1) << 8) | \
+	    ((unsigned long)(unsigned char)(ch2) << 16) | \
+	    ((unsigned long)(unsigned char)(ch3) << 24))
+
+#define HANTRO_IMAGE_VIV_META_DATA_MAGIC HANTRO_MAGIC('V', 'I', 'V', 'M')
+
+struct viv_vidmem_metadata {
+	u32 magic;        // __FOURCC('v', 'i', 'v', 'm')
+	u32 dmabuf_size;  // DMABUF buffer size in byte (Maximum 4GB)
+	u32 time_stamp;   // time stamp for the DMABUF buffer
+
+	u32 image_format; // ImageFormat, determined plane number.
+	u32 compressed;   // if DMABUF buffer is compressed by DEC400
+	struct {
+	u32 offset; // plane buffer address offset from DMABUF address
+	u32 stride; // pitch in bytes
+	u32 width;  // width in pixels
+	u32 height; // height in pixels
+
+	u32 tile_format; // uncompressed tile format
+	u32 compress_format; // tile mode for DEC400
+
+	/** tile status buffer offset within this plane buffer. when it is 0，
+	 *  indicates using separate tile status buffer
+	 */
+	u32 ts_offset;
+	/** fd of separate tile status buffer of the plane buffer */
+	u32 ts_fd;
+	/** valid fd of the ts buffer in consumer side. */
+	u32 ts_fd2;
+	/** the vpu virtual address for this ts data buffer */
+	u32 ts_vaddr;
+
+	/** gpu fastclear enabled for the plane buffer */
+	u32 fc_enabled;
+	/** gpu fastclear color value (lower 32 bits) for the plane buffer */
+	u32 fc_value_lower;
+	/** gpu fastclear color value (upper 32 bits) for the plane buffer */
+	u32 fc_value_upper;
+	} plane[3];
+};
+#endif /*__KMB_VIDMEM_H__*/
-- 
2.25.1

