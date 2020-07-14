Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E021FF03
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF956E88A;
	Tue, 14 Jul 2020 20:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C356E88A;
 Tue, 14 Jul 2020 20:58:20 +0000 (UTC)
IronPort-SDR: ABpAD+mErB+9ZaXhjgT2ZmFfgXa/+GWxo3pkG/dtYxAY1XVFDehTHa5bxkbrIMCPvJjSxqwlYk
 jGomkX+00FOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="233883718"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="233883718"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:20 -0700
IronPort-SDR: lQGIk7Pxc12mpBNObFyI/ASHlapype5MEbQn4qO5ktXqEfmc67cjNbyP9qfoSnHKbTg9Mxyt3W
 PcOweZJlVRNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504064"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:18 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 03/59] drm/kmb: Set correct values in the LAYERn_CFG
 register
Date: Tue, 14 Jul 2020 13:56:49 -0700
Message-Id: <1594760265-11618-4-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During update plane, set the layer format, bpp, fifo level,
RGB order, Cb/Cr order etc. in the LAYER_CFG register.

v2: Return val in set_pixel and set_bpp instead of passing in pointer,

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 145 ++++++++++++++++++++++++++++++----
 drivers/gpu/drm/kmb/kmb_regs.h  | 167 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 298 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 7077a4c..877314a 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -33,6 +33,119 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+unsigned int set_pixel_format(u32 format)
+{
+	unsigned int val = 0;
+
+	switch (format) {
+	/*planar formats */
+	case DRM_FORMAT_YUV444:
+		val = LCD_LAYER_FORMAT_YCBCR444PLAN | LCD_LAYER_PLANAR_STORAGE;
+		break;
+	case DRM_FORMAT_YVU444:
+		val = LCD_LAYER_FORMAT_YCBCR444PLAN | LCD_LAYER_PLANAR_STORAGE
+			| LCD_LAYER_CRCB_ORDER;
+		break;
+	case DRM_FORMAT_YUV422:
+		val = LCD_LAYER_FORMAT_YCBCR422PLAN | LCD_LAYER_PLANAR_STORAGE;
+		break;
+	case DRM_FORMAT_YVU422:
+		val = LCD_LAYER_FORMAT_YCBCR422PLAN | LCD_LAYER_PLANAR_STORAGE
+		       | LCD_LAYER_CRCB_ORDER;
+		break;
+	case DRM_FORMAT_YUV420:
+		val = LCD_LAYER_FORMAT_YCBCR420PLAN | LCD_LAYER_PLANAR_STORAGE;
+		break;
+	case DRM_FORMAT_YVU420:
+		val = LCD_LAYER_FORMAT_YCBCR420PLAN | LCD_LAYER_PLANAR_STORAGE
+		       | LCD_LAYER_CRCB_ORDER;
+		break;
+	case DRM_FORMAT_NV12:
+		val = LCD_LAYER_FORMAT_NV12 | LCD_LAYER_PLANAR_STORAGE;
+		break;
+	case DRM_FORMAT_NV21:
+		val = LCD_LAYER_FORMAT_NV12 | LCD_LAYER_PLANAR_STORAGE
+		       | LCD_LAYER_CRCB_ORDER;
+		break;
+	/* packed formats */
+	case DRM_FORMAT_RGB332:
+		val = LCD_LAYER_FORMAT_RGB332;
+		break;
+	case DRM_FORMAT_XBGR4444:
+		val = LCD_LAYER_FORMAT_RGBX4444 | LCD_LAYER_BGR_ORDER;
+		break;
+	case DRM_FORMAT_ARGB4444:
+		val = LCD_LAYER_FORMAT_RGBA4444;
+		break;
+	case DRM_FORMAT_ABGR4444:
+		val = LCD_LAYER_FORMAT_RGBA4444 | LCD_LAYER_BGR_ORDER;
+		break;
+	case DRM_FORMAT_XRGB1555:
+		val = LCD_LAYER_FORMAT_XRGB1555;
+		break;
+	case DRM_FORMAT_XBGR1555:
+		val = LCD_LAYER_FORMAT_XRGB1555 | LCD_LAYER_BGR_ORDER;
+		break;
+	case DRM_FORMAT_ARGB1555:
+		val = LCD_LAYER_FORMAT_RGBA1555;
+		break;
+	case DRM_FORMAT_ABGR1555:
+		val = LCD_LAYER_FORMAT_RGBA1555 | LCD_LAYER_BGR_ORDER;
+		break;
+	case DRM_FORMAT_RGB565:
+		val = LCD_LAYER_FORMAT_RGB565;
+		break;
+	case DRM_FORMAT_BGR565:
+		val = LCD_LAYER_FORMAT_RGB565 | LCD_LAYER_BGR_ORDER;
+		break;
+	case DRM_FORMAT_RGB888:
+		val = LCD_LAYER_FORMAT_RGB888;
+		break;
+	case DRM_FORMAT_BGR888:
+		val = LCD_LAYER_FORMAT_RGB888 | LCD_LAYER_BGR_ORDER;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		val = LCD_LAYER_FORMAT_RGBX8888;
+		break;
+	case DRM_FORMAT_XBGR8888:
+		val = LCD_LAYER_FORMAT_RGBX8888 | LCD_LAYER_BGR_ORDER;
+		break;
+	case DRM_FORMAT_ARGB8888:
+		val = LCD_LAYER_FORMAT_RGBA8888;
+		break;
+	case DRM_FORMAT_ABGR8888:
+		val = LCD_LAYER_FORMAT_RGBA8888 | LCD_LAYER_BGR_ORDER;
+		break;
+	}
+	return val;
+}
+
+unsigned int set_bits_per_pixel(const struct drm_format_info *format)
+{
+	int i;
+	u32 bpp = 0;
+	unsigned int val = 0;
+
+	for (i = 0; i < format->num_planes; i++)
+		bpp += 8*format->cpp[i];
+
+	switch (bpp) {
+	case 8:
+		val = LCD_LAYER_8BPP;
+		break;
+	case 16:
+		val = LCD_LAYER_16BPP;
+		break;
+	case 24:
+		val = LCD_LAYER_24BPP;
+		break;
+	case 32:
+		val = LCD_LAYER_32BPP;
+		break;
+	}
+	return val;
+}
+
 static void kmb_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *state)
 {
@@ -44,7 +157,8 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	unsigned int dma_len;
 	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
 	unsigned int dma_cfg;
-	unsigned int ctrl = 0;
+	unsigned int ctrl = 0, val = 0;
+	unsigned int src_w, src_h, crtc_x, crtc_y;
 	unsigned char plane_id = kmb_plane->id;
 
 	if (!fb)
@@ -52,6 +166,22 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 
 	lcd = to_kmb(plane->dev);
 
+	src_w = plane->state->src_w >> 16;
+	src_h = plane->state->src_h >> 16;
+	crtc_x = plane->state->crtc_x;
+	crtc_y = plane->state->crtc_y;
+
+	kmb_write(lcd, LCD_LAYERn_WIDTH(plane_id), src_w-1);
+	kmb_write(lcd, LCD_LAYERn_HEIGHT(plane_id), src_h-1);
+	kmb_write(lcd, LCD_LAYERn_COL_START(plane_id), crtc_x);
+	kmb_write(lcd, LCD_LAYERn_ROW_START(plane_id), crtc_y);
+
+	val = set_pixel_format(fb->format->format);
+	val |= set_bits_per_pixel(fb->format);
+	/*CHECKME Leon drvr sets it to 50 try this for now */
+	val |= LCD_LAYER_FIFO_50;
+	kmb_write(lcd, LCD_LAYERn_CFG(plane_id), val);
+
 	switch (plane_id) {
 	case LAYER_0:
 		ctrl = LCD_CTRL_VL1_ENABLE;
@@ -72,12 +202,6 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	    | LCD_CTRL_OUTPUT_ENABLED;
 	kmb_write(lcd, LCD_CONTROL, ctrl);
 
-	/* TBD */
-	/*set LCD_LAYERn_WIDTH, LCD_LAYERn_HEIGHT, LCD_LAYERn_COL_START,
-	 * LCD_LAYERn_ROW_START, LCD_LAYERn_CFG
-	 * CFG should set the pixel format, FIFO level and BPP
-	 */
-
 	/*TBD check visible? */
 
 	/* we may have to set LCD_DMA_VSTRIDE_ENABLE in the future */
@@ -182,9 +306,6 @@ static const u32 kmb_formats_g[] = {
 	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
 	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_XRGB2101010, DRM_FORMAT_XBGR2101010,
-	DRM_FORMAT_YUYV, DRM_FORMAT_YVYU,
-	DRM_FORMAT_UYVY, DRM_FORMAT_VYUY,
 };
 
 /* video layer (0 & 1) formats, packed and planar formats are supported */
@@ -199,11 +320,7 @@ static const u32 kmb_formats_v[] = {
 	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
 	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_XRGB2101010, DRM_FORMAT_XBGR2101010,
-	DRM_FORMAT_YUYV, DRM_FORMAT_YVYU,
-	DRM_FORMAT_UYVY, DRM_FORMAT_VYUY,
 	/*planar formats */
-	DRM_FORMAT_YUV411, DRM_FORMAT_YVU411,
 	DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,
 	DRM_FORMAT_YUV422, DRM_FORMAT_YVU422,
 	DRM_FORMAT_YUV444, DRM_FORMAT_YVU444,
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index ff00421..0f879b9 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -361,6 +361,173 @@
 /* bit 10 */
 #define LCD_DMA_LAYER_V_STRIDE_EN		(0x400)
 
+/******************************************************************************
+ *		   LCD controller Layer config register
+ ******************************************************************************/
+/* ---bit 1:2 */
+/* enable horizontal scaling,default is
+ * no scaling
+ */
+#define LCD_LAYER_SCALE_H			(0x0002)
+/* enable vertical scaling*/
+#define LCD_LAYER_SCALE_V			(0x0004)
+/* enable vertical and horizontal
+ * scaling
+ */
+#define LCD_LAYER_SCALE_H_V			(0x0006)
+/* --- bit 3*/
+/* enable CSC, default is bypassed*/
+#define LCD_LAYER_CSC_EN			(0x0008)
+/* --- bit 4:5*/
+/* use static alpha value for layer,
+ * default is disabled
+ */
+#define LCD_LAYER_ALPHA_STATIC			(0x10)
+/* use embedded value for alpha blending*/
+#define LCD_LAYER_ALPHA_EMBED			(0x20)
+/* use static alpha and embedded value,
+ * by multiplication
+ */
+#define LCD_LAYER_ALPHA_COMBI			(0x30)
+/* --- bit 6*/
+/* indicates that the RGB values have
+ * been multiplied with alpha
+ */
+#define LCD_LAYER_ALPHA_PREMULT			(0x40)
+/* --- bit 7*/
+#define LCD_LAYER_INVERT_COL			(0x80)
+/* enable color inversion,
+ * default is not inverted
+ */
+/* --- bit 8*/
+/* enable transparency */
+#define LCD_LAYER_TRANSPARENT_EN		(0x100)
+/* --- bit 9:13*/
+/* default Layer config */
+#define LCD_LAYER_FORMAT_YCBCR444PLAN		(0x0000)
+#define LCD_LAYER_FORMAT_YCBCR422PLAN		(0x0200)
+#define LCD_LAYER_FORMAT_YCBCR420PLAN		(0x0400)
+#define LCD_LAYER_FORMAT_RGB888PLAN		(0x0600)
+#define LCD_LAYER_FORMAT_YCBCR444LIN		(0x0800)
+#define LCD_LAYER_FORMAT_YCBCR422LIN		(0x0A00)
+#define LCD_LAYER_FORMAT_RGB888			(0x0C00)
+#define LCD_LAYER_FORMAT_RGBA8888		(0x0E00)
+#define LCD_LAYER_FORMAT_RGBX8888		(0x1000)
+#define LCD_LAYER_FORMAT_RGB565			(0x1200)
+#define LCD_LAYER_FORMAT_RGBA1555		(0x1400)
+#define LCD_LAYER_FORMAT_XRGB1555		(0x1600)
+#define LCD_LAYER_FORMAT_RGB444			(0x1800)
+#define LCD_LAYER_FORMAT_RGBA4444		(0x1A00)
+#define LCD_LAYER_FORMAT_RGBX4444		(0x1C00)
+#define LCD_LAYER_FORMAT_RGB332			(0x1E00)
+#define LCD_LAYER_FORMAT_RGBA3328		(0x2000)
+#define LCD_LAYER_FORMAT_RGBX3328		(0x2200)
+#define LCD_LAYER_FORMAT_CLUT			(0x2400)
+#define LCD_LAYER_FORMAT_NV12			(0x3800)
+/* --- bit 14*/
+/* planar storege format */
+#define LCD_LAYER_PLANAR_STORAGE		(0x4000)
+/* --- bit 15:16*/
+#define LCD_LAYER_8BPP				(0x00000)
+#define LCD_LAYER_16BPP				(0x08000)
+#define LCD_LAYER_24BPP				(0x10000)
+#define LCD_LAYER_32BPP				(0x18000)
+/* --- bit 17*/
+/* Y after CRCb,
+ * default is Y before crcb
+ */
+#define LCD_LAYER_Y_ORDER			(0x020000)
+/* --- bit 18*/
+/* CR before Cb,
+ * default is CB before Cr
+ */
+#define LCD_LAYER_CRCB_ORDER			(0x040000)
+/*--- but 19*/
+/* BGR order, default is RGB */
+#define LCD_LAYER_BGR_ORDER			(0x080000)
+/* ---bit 20:21*/
+/* 2 entry clut, 1bpp */
+#define LCD_LAYER_LUT_2ENT			(0x000000)
+/* 4 entry clut, 2bpp */
+#define LCD_LAYER_LUT_4ENT			(0x100000)
+/* 18 entry clut, 4bpp */
+#define LCD_LAYER_LUT_16ENT			(0x200000)
+/*--- bit 22:24*/
+/* no flip or rotaton */
+#define LCD_LAYER_NO_FLIP			(0x000000)
+/* flip vertical */
+#define LCD_LAYER_FLIP_V			(0x400000)
+/* flip horizontal */
+#define LCD_LAYER_FLIP_H			(0x800000)
+/* rotate right 90 */
+#define LCD_LAYER_ROT_R90			(0xC00000)
+/* rotate left 90 */
+#define LCD_LAYER_ROT_L90			(0x1000000)
+/* rotate 180 (flip H & V ) */
+#define LCD_LAYER_ROT_180			(0x1400000)
+/* --- bit 25:26*/
+/* fifo empty */
+#define LCD_LAYER_FIFO_00			(0x0000000)
+/* fifo 25% */
+#define LCD_LAYER_FIFO_25			(0x2000000)
+/* fifo 50% */
+#define LCD_LAYER_FIFO_50			(0x4000000)
+/* fifo 100% , full */
+#define LCD_LAYER_FIFO_100			(0x6000000)
+
+/* --- bit 27:29*/
+#define LCD_LAYER_INTERLEAVE_DIS		(0x00000000)
+#define LCD_LAYER_INTERLEAVE_V			(0x08000000)
+#define LCD_LAYER_INTERLEAVE_H			(0x10000000)
+#define LCD_LAYER_INTERLEAVE_CH			(0x18000000)
+#define LCD_LAYER_INTERLEAVE_V_SUB		(0x20000000)
+#define LCD_LAYER_INTERLEAVE_H_SUB		(0x28000000)
+#define LCD_LAYER_INTERLEAVE_CH_SUB		(0x30000000)
+/*bit 30*/
+#define LCD_LAYER_INTER_POS_EVEN		(0x00000000)
+#define LCD_LAYER_INTER_POS_ODD			(0x40000000)
+
+/****************************************************************************
+ *		   LCD controller output format register defines
+ ****************************************************************************/
+/* --- bits 0:4*/
+#define D_LCD_OUTF_FORMAT_RGB121212             (0x00 << 0)
+#define D_LCD_OUTF_FORMAT_RGB101010             (0x01 << 0)
+#define D_LCD_OUTF_FORMAT_RGB888                (0x02 << 0)
+#define D_LCD_OUTF_FORMAT_RGB666                (0x03 << 0)
+#define D_LCD_OUTF_FORMAT_RGB565                (0x04 << 0)
+#define D_LCD_OUTF_FORMAT_RGB444                (0x05 << 0)
+#define D_LCD_OUTF_FORMAT_MRGB121212            (0x10 << 0)
+#define D_LCD_OUTF_FORMAT_MRGB101010            (0x11 << 0)
+#define D_LCD_OUTF_FORMAT_MRGB888               (0x12 << 0)
+#define D_LCD_OUTF_FORMAT_MRGB666               (0x13 << 0)
+#define D_LCD_OUTF_FORMAT_MRGB565               (0x14 << 0)
+#define D_LCD_OUTF_FORMAT_YCBCR420_8B_LEGACY    (0x08 << 0)
+#define D_LCD_OUTF_FORMAT_YCBCR420_8B_DCI       (0x09 << 0)
+#define D_LCD_OUTF_FORMAT_YCBCR420_8B           (0x0A << 0)
+#define D_LCD_OUTF_FORMAT_YCBCR420_10B          (0x0B << 0)
+#define D_LCD_OUTF_FORMAT_YCBCR420_12B          (0x0C << 0)
+#define D_LCD_OUTF_FORMAT_YCBCR422_8B           (0x0D << 0)
+#define D_LCD_OUTF_FORMAT_YCBCR422_10B          (0x0E << 0)
+#define D_LCD_OUTF_FORMAT_YCBCR444              (0x0F << 0)
+#define D_LCD_OUTF_FORMAT_MYCBCR420_8B_LEGACY   (0x18 << 0)
+#define D_LCD_OUTF_FORMAT_MYCBCR420_8B_DCI      (0x19 << 0)
+#define D_LCD_OUTF_FORMAT_MYCBCR420_8B          (0x1A << 0)
+#define D_LCD_OUTF_FORMAT_MYCBCR420_10B         (0x1B << 0)
+#define D_LCD_OUTF_FORMAT_MYCBCR420_12B         (0x1C << 0)
+#define D_LCD_OUTF_FORMAT_MYCBCR422_8B          (0x1D << 0)
+#define D_LCD_OUTF_FORMAT_MYCBCR422_10B         (0x1E << 0)
+#define D_LCD_OUTF_FORMAT_MYCBCR444             (0x1F << 0)
+/* --- bit 5*/
+/* default is 0, RGB order */
+#define D_LCD_OUTF_BGR_ORDER			(1 << 5)
+/* --- bit 6*/
+/* Y after CB/Cr, default is Y before CB/CR */
+#define D_LCD_OUTF_Y_ORDER			(1 << 6)
+/* --- bit 7*/
+/* Cr before  Cb, default is Cb before Cr */
+#define D_LCD_OUTF_CRCB_ORDER			(1 << 7)
+
 /* **************************************************************************
  *			LCD controller control register defines
  ****************************************************************************
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
