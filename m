Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15931CD54
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 16:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4432C89DBC;
	Tue, 16 Feb 2021 15:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu
 [IPv6:2a01:4f9:c010:4572::81:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785FB89D42
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 15:57:27 +0000 (UTC)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
 by hillosipuli.retiisi.eu (Postfix) with ESMTP id 6ED02634CC1;
 Tue, 16 Feb 2021 17:56:20 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 2/4] v4l: ioctl: Use %p4cc printk modifier to print FourCC
 codes
Date: Tue, 16 Feb 2021 17:57:21 +0200
Message-Id: <20210216155723.17109-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
References: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 laurent.pinchart@ideasonboard.com, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we can print FourCC codes directly using printk, make use of the
feature in V4L2 core.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 85 +++++++---------------------
 1 file changed, 21 insertions(+), 64 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d1342e61e8..31662c3a8c9e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -265,13 +265,9 @@ static void v4l_print_fmtdesc(const void *arg, bool write_only)
 {
 	const struct v4l2_fmtdesc *p = arg;
 
-	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, mbus_code=0x%04x, description='%.*s'\n",
+	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%p4cc, mbus_code=0x%04x, description='%.*s'\n",
 		p->index, prt_names(p->type, v4l2_type_names),
-		p->flags, (p->pixelformat & 0xff),
-		(p->pixelformat >>  8) & 0xff,
-		(p->pixelformat >> 16) & 0xff,
-		(p->pixelformat >> 24) & 0xff,
-		p->mbus_code,
+		p->flags, &p->pixelformat, p->mbus_code,
 		(int)sizeof(p->description), p->description);
 }
 
@@ -293,12 +289,8 @@ static void v4l_print_format(const void *arg, bool write_only)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 		pix = &p->fmt.pix;
-		pr_cont(", width=%u, height=%u, pixelformat=%c%c%c%c, field=%s, bytesperline=%u, sizeimage=%u, colorspace=%d, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
-			pix->width, pix->height,
-			(pix->pixelformat & 0xff),
-			(pix->pixelformat >>  8) & 0xff,
-			(pix->pixelformat >> 16) & 0xff,
-			(pix->pixelformat >> 24) & 0xff,
+		pr_cont(", width=%u, height=%u, pixelformat=%p4cc, field=%s, bytesperline=%u, sizeimage=%u, colorspace=%d, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
+			pix->width, pix->height, &pix->pixelformat,
 			prt_names(pix->field, v4l2_field_names),
 			pix->bytesperline, pix->sizeimage,
 			pix->colorspace, pix->flags, pix->ycbcr_enc,
@@ -307,12 +299,8 @@ static void v4l_print_format(const void *arg, bool write_only)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		mp = &p->fmt.pix_mp;
-		pr_cont(", width=%u, height=%u, format=%c%c%c%c, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
-			mp->width, mp->height,
-			(mp->pixelformat & 0xff),
-			(mp->pixelformat >>  8) & 0xff,
-			(mp->pixelformat >> 16) & 0xff,
-			(mp->pixelformat >> 24) & 0xff,
+		pr_cont(", width=%u, height=%u, format=%p4cc, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
+			mp->width, mp->height, &mp->pixelformat,
 			prt_names(mp->field, v4l2_field_names),
 			mp->colorspace, mp->num_planes, mp->flags,
 			mp->ycbcr_enc, mp->quantization, mp->xfer_func);
@@ -337,13 +325,9 @@ static void v4l_print_format(const void *arg, bool write_only)
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
 		vbi = &p->fmt.vbi;
-		pr_cont(", sampling_rate=%u, offset=%u, samples_per_line=%u, sample_format=%c%c%c%c, start=%u,%u, count=%u,%u\n",
+		pr_cont(", sampling_rate=%u, offset=%u, samples_per_line=%u, sample_format=%p4cc, start=%u,%u, count=%u,%u\n",
 			vbi->sampling_rate, vbi->offset,
-			vbi->samples_per_line,
-			(vbi->sample_format & 0xff),
-			(vbi->sample_format >>  8) & 0xff,
-			(vbi->sample_format >> 16) & 0xff,
-			(vbi->sample_format >> 24) & 0xff,
+			vbi->samples_per_line, &vbi->sample_format,
 			vbi->start[0], vbi->start[1],
 			vbi->count[0], vbi->count[1]);
 		break;
@@ -360,21 +344,13 @@ static void v4l_print_format(const void *arg, bool write_only)
 	case V4L2_BUF_TYPE_SDR_CAPTURE:
 	case V4L2_BUF_TYPE_SDR_OUTPUT:
 		sdr = &p->fmt.sdr;
-		pr_cont(", pixelformat=%c%c%c%c\n",
-			(sdr->pixelformat >>  0) & 0xff,
-			(sdr->pixelformat >>  8) & 0xff,
-			(sdr->pixelformat >> 16) & 0xff,
-			(sdr->pixelformat >> 24) & 0xff);
+		pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		meta = &p->fmt.meta;
-		pr_cont(", dataformat=%c%c%c%c, buffersize=%u\n",
-			(meta->dataformat >>  0) & 0xff,
-			(meta->dataformat >>  8) & 0xff,
-			(meta->dataformat >> 16) & 0xff,
-			(meta->dataformat >> 24) & 0xff,
-			meta->buffersize);
+		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
+			&meta->dataformat, meta->buffersize);
 		break;
 	}
 }
@@ -383,15 +359,10 @@ static void v4l_print_framebuffer(const void *arg, bool write_only)
 {
 	const struct v4l2_framebuffer *p = arg;
 
-	pr_cont("capability=0x%x, flags=0x%x, base=0x%p, width=%u, height=%u, pixelformat=%c%c%c%c, bytesperline=%u, sizeimage=%u, colorspace=%d\n",
-			p->capability, p->flags, p->base,
-			p->fmt.width, p->fmt.height,
-			(p->fmt.pixelformat & 0xff),
-			(p->fmt.pixelformat >>  8) & 0xff,
-			(p->fmt.pixelformat >> 16) & 0xff,
-			(p->fmt.pixelformat >> 24) & 0xff,
-			p->fmt.bytesperline, p->fmt.sizeimage,
-			p->fmt.colorspace);
+	pr_cont("capability=0x%x, flags=0x%x, base=0x%p, width=%u, height=%u, pixelformat=%p4cc, bytesperline=%u, sizeimage=%u, colorspace=%d\n",
+		p->capability, p->flags, p->base, p->fmt.width, p->fmt.height,
+		&p->fmt.pixelformat, p->fmt.bytesperline, p->fmt.sizeimage,
+		p->fmt.colorspace);
 }
 
 static void v4l_print_buftype(const void *arg, bool write_only)
@@ -761,13 +732,8 @@ static void v4l_print_frmsizeenum(const void *arg, bool write_only)
 {
 	const struct v4l2_frmsizeenum *p = arg;
 
-	pr_cont("index=%u, pixelformat=%c%c%c%c, type=%u",
-			p->index,
-			(p->pixel_format & 0xff),
-			(p->pixel_format >>  8) & 0xff,
-			(p->pixel_format >> 16) & 0xff,
-			(p->pixel_format >> 24) & 0xff,
-			p->type);
+	pr_cont("index=%u, pixelformat=%p4cc, type=%u",
+		p->index, &p->pixel_format, p->type);
 	switch (p->type) {
 	case V4L2_FRMSIZE_TYPE_DISCRETE:
 		pr_cont(", wxh=%ux%u\n",
@@ -793,13 +759,8 @@ static void v4l_print_frmivalenum(const void *arg, bool write_only)
 {
 	const struct v4l2_frmivalenum *p = arg;
 
-	pr_cont("index=%u, pixelformat=%c%c%c%c, wxh=%ux%u, type=%u",
-			p->index,
-			(p->pixel_format & 0xff),
-			(p->pixel_format >>  8) & 0xff,
-			(p->pixel_format >> 16) & 0xff,
-			(p->pixel_format >> 24) & 0xff,
-			p->width, p->height, p->type);
+	pr_cont("index=%u, pixelformat=%p4cc, wxh=%ux%u, type=%u",
+		p->index, &p->pixel_format, p->width, p->height, p->type);
 	switch (p->type) {
 	case V4L2_FRMIVAL_TYPE_DISCRETE:
 		pr_cont(", fps=%d/%d\n",
@@ -1459,12 +1420,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 				return;
 			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
 			flags = 0;
-			snprintf(fmt->description, sz, "%c%c%c%c%s",
-					(char)(fmt->pixelformat & 0x7f),
-					(char)((fmt->pixelformat >> 8) & 0x7f),
-					(char)((fmt->pixelformat >> 16) & 0x7f),
-					(char)((fmt->pixelformat >> 24) & 0x7f),
-					(fmt->pixelformat & (1UL << 31)) ? "-BE" : "");
+			snprintf(fmt->description, sz, "%p4cc",
+				 &fmt->pixelformat);
 			break;
 		}
 	}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
