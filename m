Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434073E604
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 19:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D31E10E0CA;
	Mon, 26 Jun 2023 17:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 173FE10E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 17:12:40 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxTccGx5lkmoMCAA--.3834S3;
 Tue, 27 Jun 2023 01:12:38 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxxswGx5lkYhgKAA--.21854S2; 
 Tue, 27 Jun 2023 01:12:38 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/omap: Checking the mapping returned by vmap()
Date: Tue, 27 Jun 2023 01:12:38 +0800
Message-Id: <20230626171238.667533-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxxswGx5lkYhgKAA--.21854S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr1fKrW3GFy8Kw4xurWrCrX_yoW8uFy5pF
 s0ya4Y9rW8tFW2grsrZFn8Za45Ga1IkFWfWrW8t34fKr4FyrW7ZF98AFWqyr97WrWUArsI
 gw4kKF1rZFn0kwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
 xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
 6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
 xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because vmap() function could fail.
Also don't let omap_gem_vaddr() function signature (declaration) dangling
there, as it will only get defined when CONFIG_DRM_FBDEV_EMULATION=y.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 10 ++++++++--
 drivers/gpu/drm/omapdrm/omap_gem.h   |  3 +++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b7ccce0704a3..2c88aa1008d8 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -197,6 +197,11 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 	drm_fb_helper_fill_info(fbi, helper, sizes);
 
 	fbi->screen_buffer = omap_gem_vaddr(bo);
+	if (!fbi->screen_buffer) {
+		ret = -ENOMEM;
+		goto err_release_fbi;
+	}
+
 	fbi->screen_size = bo->size;
 	fbi->fix.smem_start = dma_addr;
 	fbi->fix.smem_len = bo->size;
@@ -210,14 +215,15 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 		fbi->fix.ywrapstep = 1;
 	}
 
-
 	DBG("par=%p, %dx%d", fbi->par, fbi->var.xres, fbi->var.yres);
 	DBG("allocated %dx%d fb", fb->width, fb->height);
 
 	return 0;
 
-fail:
+err_release_fbi:
+	drm_fb_helper_release_info(helper);
 
+fail:
 	if (ret) {
 		if (fb)
 			drm_framebuffer_remove(fb);
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h b/drivers/gpu/drm/omapdrm/omap_gem.h
index 4d4488939f6b..7e8c41b72aae 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.h
+++ b/drivers/gpu/drm/omapdrm/omap_gem.h
@@ -48,7 +48,10 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 		struct sg_table *sgt);
 int omap_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		union omap_gem_size gsize, u32 flags, u32 *handle);
+
+#ifdef CONFIG_DRM_FBDEV_EMULATION
 void *omap_gem_vaddr(struct drm_gem_object *obj);
+#endif
 
 /* Dumb Buffers Interface */
 int omap_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-- 
2.25.1

