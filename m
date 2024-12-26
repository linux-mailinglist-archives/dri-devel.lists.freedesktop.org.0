Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B49FC7A3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 03:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630EB10E680;
	Thu, 26 Dec 2024 02:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Hbo+h+Qc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF11610E680
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 02:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=0Ys/6PWadFMMf0CT+9doN3qX4Fu8/PHNQBlHP0QonJA=; b=Hbo+h+Qc0gFhN1uU
 cZP9vtV4n77mGEgq0ULpbgkp2GX2pwmOezeKICNdTVBJuZY4YP8I5kvcnrfYVWW8FVaQ4A8QM2b8f
 Ia1ktdvHqRvY4289h4MVl2fgToBWNrbk1obRuO4/7wFgKylJjid04Mdjq9ugjLjhHH6dPDoNGPhsy
 FqYPOgdRPir/ydaTQi6p6i1nAs2xBg/JLqo7Csa19G6x3H49KkzVCCSsZoU/UueKECoKFsBzTYBWR
 f8oNAHV+2lQFWaqLaoBNyn5C2K0n3LI/ULy/BY9KO0dyO6PqRaG8rxFdUeHTLsmT0YSyPWbf95vNG
 5BahjFGcmuqsFUPl9w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tQdbQ-007F0L-1Z;
 Thu, 26 Dec 2024 02:27:56 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, deller@gmx.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/7] gpu: ipu-v3: Remove unused ipu_image_convert_* functions
Date: Thu, 26 Dec 2024 02:27:49 +0000
Message-ID: <20241226022752.219399-5-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ipu_image_convert_enum_format() and ipu_image_convert_sync() were both
added in 2016 by
commit cd98e85a6b78 ("gpu: ipu-v3: Add queued image conversion support")

but have remained unused.

Remove them.

ipu_image_convert_sync() was the last user of
image_convert_sync_complete().

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 48 --------------------------
 include/video/imx-ipu-image-convert.h  | 32 -----------------
 2 files changed, 80 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index 841316582ea9..3c33b4defab5 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -355,20 +355,6 @@ static void dump_format(struct ipu_image_convert_ctx *ctx,
 		(ic_image->fmt->fourcc >> 24) & 0xff);
 }
 
-int ipu_image_convert_enum_format(int index, u32 *fourcc)
-{
-	const struct ipu_image_pixfmt *fmt;
-
-	if (index >= (int)ARRAY_SIZE(image_convert_formats))
-		return -EINVAL;
-
-	/* Format found */
-	fmt = &image_convert_formats[index];
-	*fourcc = fmt->fourcc;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(ipu_image_convert_enum_format);
-
 static void free_dma_buf(struct ipu_image_convert_priv *priv,
 			 struct ipu_image_convert_dma_buf *buf)
 {
@@ -2437,40 +2423,6 @@ ipu_image_convert(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
 }
 EXPORT_SYMBOL_GPL(ipu_image_convert);
 
-/* "Canned" synchronous single image conversion */
-static void image_convert_sync_complete(struct ipu_image_convert_run *run,
-					void *data)
-{
-	struct completion *comp = data;
-
-	complete(comp);
-}
-
-int ipu_image_convert_sync(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
-			   struct ipu_image *in, struct ipu_image *out,
-			   enum ipu_rotate_mode rot_mode)
-{
-	struct ipu_image_convert_run *run;
-	struct completion comp;
-	int ret;
-
-	init_completion(&comp);
-
-	run = ipu_image_convert(ipu, ic_task, in, out, rot_mode,
-				image_convert_sync_complete, &comp);
-	if (IS_ERR(run))
-		return PTR_ERR(run);
-
-	ret = wait_for_completion_timeout(&comp, msecs_to_jiffies(10000));
-	ret = (ret == 0) ? -ETIMEDOUT : 0;
-
-	ipu_image_convert_unprepare(run->ctx);
-	kfree(run);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(ipu_image_convert_sync);
-
 int ipu_image_convert_init(struct ipu_soc *ipu, struct device *dev)
 {
 	struct ipu_image_convert_priv *priv;
diff --git a/include/video/imx-ipu-image-convert.h b/include/video/imx-ipu-image-convert.h
index 3c71b8b94b33..003b3927ede5 100644
--- a/include/video/imx-ipu-image-convert.h
+++ b/include/video/imx-ipu-image-convert.h
@@ -40,19 +40,6 @@ struct ipu_image_convert_run {
 typedef void (*ipu_image_convert_cb_t)(struct ipu_image_convert_run *run,
 				       void *ctx);
 
-/**
- * ipu_image_convert_enum_format() - enumerate the image converter's
- *	supported input and output pixel formats.
- *
- * @index:	pixel format index
- * @fourcc:	v4l2 fourcc for this index
- *
- * Returns 0 with a valid index and fills in v4l2 fourcc, -EINVAL otherwise.
- *
- * In V4L2, drivers can call ipu_image_enum_format() in .enum_fmt.
- */
-int ipu_image_convert_enum_format(int index, u32 *fourcc);
-
 /**
  * ipu_image_convert_adjust() - adjust input/output images to IPU restrictions.
  *
@@ -176,23 +163,4 @@ ipu_image_convert(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
 		  ipu_image_convert_cb_t complete,
 		  void *complete_context);
 
-/**
- * ipu_image_convert_sync() - synchronous single image conversion request
- *
- * @ipu:	the IPU handle to use for the conversion
- * @ic_task:	the IC task to use for the conversion
- * @in:		input image format
- * @out:	output image format
- * @rot_mode:	rotation mode
- *
- * Carry out a single image conversion. Returns when the conversion
- * completes. The input/output formats and rotation mode must already
- * meet IPU retrictions. The created context is automatically unprepared
- * and the run freed on return.
- */
-int ipu_image_convert_sync(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
-			   struct ipu_image *in, struct ipu_image *out,
-			   enum ipu_rotate_mode rot_mode);
-
-
 #endif /* __IMX_IPU_IMAGE_CONVERT_H__ */
-- 
2.47.1

