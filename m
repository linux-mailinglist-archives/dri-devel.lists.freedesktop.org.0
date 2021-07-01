Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733303B9554
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 19:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725A36E03D;
	Thu,  1 Jul 2021 17:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861D76E05F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 17:16:58 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 4921820855;
 Thu,  1 Jul 2021 19:08:13 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/gud: Use scatter-gather USB bulk transfer
Date: Thu,  1 Jul 2021 19:07:48 +0200
Message-Id: <20210701170748.58009-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210701170748.58009-1-noralf@tronnes.org>
References: <20210701170748.58009-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fOAXI6Se c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=KKAkSRfTAAAA:8 a=SJz97ENfAAAA:8
 a=R9llIbJOWVpwbuPDVz8A:9 a=wni8LWtO-K76hLLZ:21 a=ZOTHAswvuk933zv7:21
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, peter@stuge.se
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There'a limit to how big a kmalloc buffer can be, and as memory gets
fragmented it becomes more difficult to get big buffers. The downside of
smaller buffers is that the driver has to split the transfer up which
hampers performance. Compression might also take a hit because of the
splitting.

Solve this by allocating the transfer buffer using vmalloc and create a
SG table to be passed on to the USB subsystem. vmalloc_32() is used to
avoid DMA bounce buffers on USB controllers that can only access 32-bit
addresses.

This also solves the problem that split transfers can give host side
tearing since flushing is decoupled from rendering.

usb_sg_wait() doesn't have timeout handling builtin, so it is wrapped in
a timer like 4 out of 6 users in the kernel have done.

v2:
- Use DIV_ROUND_UP (Linus)
- Add timeout note to the commit log (Linus)
- Expand note about upper buffer limit (Linus)
- Change var name s/timer/ctx/ in gud_usb_bulk_timeout()

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_drv.c      | 50 +++++++++++++++++++++---------
 drivers/gpu/drm/gud/gud_internal.h |  2 ++
 drivers/gpu/drm/gud/gud_pipe.c     | 47 ++++++++++++++++++++++++----
 3 files changed, 78 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 45427c73587f..b39a54f17063 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -394,13 +394,40 @@ static const struct drm_driver gud_drm_driver = {
 	.minor			= 0,
 };
 
+static int gud_alloc_bulk_buffer(struct gud_device *gdrm)
+{
+	unsigned int i, num_pages;
+	struct page **pages;
+	void *ptr;
+	int ret;
+
+	gdrm->bulk_buf = vmalloc_32(gdrm->bulk_len);
+	if (!gdrm->bulk_buf)
+		return -ENOMEM;
+
+	num_pages = DIV_ROUND_UP(gdrm->bulk_len, PAGE_SIZE);
+	pages = kmalloc_array(num_pages, sizeof(struct page *), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	for (i = 0, ptr = gdrm->bulk_buf; i < num_pages; i++, ptr += PAGE_SIZE)
+		pages[i] = vmalloc_to_page(ptr);
+
+	ret = sg_alloc_table_from_pages(&gdrm->bulk_sgt, pages, num_pages,
+					0, gdrm->bulk_len, GFP_KERNEL);
+	kfree(pages);
+
+	return ret;
+}
+
 static void gud_free_buffers_and_mutex(void *data)
 {
 	struct gud_device *gdrm = data;
 
 	vfree(gdrm->compress_buf);
 	gdrm->compress_buf = NULL;
-	kfree(gdrm->bulk_buf);
+	sg_free_table(&gdrm->bulk_sgt);
+	vfree(gdrm->bulk_buf);
 	gdrm->bulk_buf = NULL;
 	mutex_destroy(&gdrm->ctrl_lock);
 }
@@ -537,24 +564,17 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	if (desc.max_buffer_size)
 		max_buffer_size = le32_to_cpu(desc.max_buffer_size);
-retry:
-	/*
-	 * Use plain kmalloc here since devm_kmalloc() places struct devres at the beginning
-	 * of the buffer it allocates. This wastes a lot of memory when allocating big buffers.
-	 * Asking for 2M would actually allocate 4M. This would also prevent getting the biggest
-	 * possible buffer potentially leading to split transfers.
-	 */
-	gdrm->bulk_buf = kmalloc(max_buffer_size, GFP_KERNEL | __GFP_NOWARN);
-	if (!gdrm->bulk_buf) {
-		max_buffer_size = roundup_pow_of_two(max_buffer_size) / 2;
-		if (max_buffer_size < SZ_512K)
-			return -ENOMEM;
-		goto retry;
-	}
+	/* Prevent a misbehaving device from allocating loads of RAM. 4096x4096@XRGB8888 = 64 MB */
+	if (max_buffer_size > SZ_64M)
+		max_buffer_size = SZ_64M;
 
 	gdrm->bulk_pipe = usb_sndbulkpipe(interface_to_usbdev(intf), usb_endpoint_num(bulk_out));
 	gdrm->bulk_len = max_buffer_size;
 
+	ret = gud_alloc_bulk_buffer(gdrm);
+	if (ret)
+		return ret;
+
 	if (gdrm->compression & GUD_COMPRESSION_LZ4) {
 		gdrm->lz4_comp_mem = devm_kmalloc(dev, LZ4_MEM_COMPRESS, GFP_KERNEL);
 		if (!gdrm->lz4_comp_mem)
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index de2f2d2dbc60..1bb65a46c347 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -5,6 +5,7 @@
 
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/scatterlist.h>
 #include <linux/usb.h>
 #include <linux/workqueue.h>
 #include <uapi/drm/drm_fourcc.h>
@@ -26,6 +27,7 @@ struct gud_device {
 	unsigned int bulk_pipe;
 	void *bulk_buf;
 	size_t bulk_len;
+	struct sg_table bulk_sgt;
 
 	u8 compression;
 	void *lz4_comp_mem;
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 2f83ab6b8e61..e0fb6cc969a3 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -220,13 +220,51 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 	return ret;
 }
 
+struct gud_usb_bulk_context {
+	struct timer_list timer;
+	struct usb_sg_request sgr;
+};
+
+static void gud_usb_bulk_timeout(struct timer_list *t)
+{
+	struct gud_usb_bulk_context *ctx = from_timer(ctx, t, timer);
+
+	usb_sg_cancel(&ctx->sgr);
+}
+
+static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
+{
+	struct gud_usb_bulk_context ctx;
+	int ret;
+
+	ret = usb_sg_init(&ctx.sgr, gud_to_usb_device(gdrm), gdrm->bulk_pipe, 0,
+			  gdrm->bulk_sgt.sgl, gdrm->bulk_sgt.nents, len, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	timer_setup_on_stack(&ctx.timer, gud_usb_bulk_timeout, 0);
+	mod_timer(&ctx.timer, jiffies + msecs_to_jiffies(3000));
+
+	usb_sg_wait(&ctx.sgr);
+
+	if (!del_timer_sync(&ctx.timer))
+		ret = -ETIMEDOUT;
+	else if (ctx.sgr.status < 0)
+		ret = ctx.sgr.status;
+	else if (ctx.sgr.bytes != len)
+		ret = -EIO;
+
+	destroy_timer_on_stack(&ctx.timer);
+
+	return ret;
+}
+
 static int gud_flush_rect(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			  const struct drm_format_info *format, struct drm_rect *rect)
 {
-	struct usb_device *usb = gud_to_usb_device(gdrm);
 	struct gud_set_buffer_req req;
-	int ret, actual_length;
 	size_t len, trlen;
+	int ret;
 
 	drm_dbg(&gdrm->drm, "Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
 
@@ -255,10 +293,7 @@ static int gud_flush_rect(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			return ret;
 	}
 
-	ret = usb_bulk_msg(usb, gdrm->bulk_pipe, gdrm->bulk_buf, trlen,
-			   &actual_length, msecs_to_jiffies(3000));
-	if (!ret && trlen != actual_length)
-		ret = -EIO;
+	ret = gud_usb_bulk(gdrm, trlen);
 	if (ret)
 		gdrm->stats_num_errors++;
 
-- 
2.23.0

