Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4794062D274
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 06:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5376810E52F;
	Thu, 17 Nov 2022 05:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516F010E52F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 05:00:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5so559788wmo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 21:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a0T3rjzlpFW1dw7fmW7g8x4Gy61zgYU1JKH4cxrgdu0=;
 b=JY4NfYAIbFCUofUSLplovnKa/5072s2jFLYAMFlFQTFUbXFj+lybMXgGHevupGBX7p
 QaVDIl/1Y2+6v9KgYyGo6gU/j0kak1gX8EHWtw8/22y1EJlPQ84PglSV4mSujDZPqPfE
 bp3FcH5y1InMVpXhOZp7npliwhHmefhHL9noUixdN5Sxh1zcfHcs4Ndrddj8P1q1gfC+
 SZn3/z4rgmLG2ve4UMuQKtujwgYniEUEo4KGPjXNrROT68k7dYpw7KdSh8Blzxu9QjMn
 OkZWoM17fmFmuMiE1wkw+1FKoBbY4E9MJROa6sEbJkaC9L+ADXsgWz84KfEITl3HmSqP
 iojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a0T3rjzlpFW1dw7fmW7g8x4Gy61zgYU1JKH4cxrgdu0=;
 b=AKM0x6KJ4e4ksahDN9uw8mLdlicesbQxtEJQEvfOI3iZGvNebpHXxYgfxBUTxfyIjZ
 mL77D0tqLqropn8nQOoPGeQehpxBl9VAyhREoqcJUjtWDltgJtQp1KSQmqgFk9qhdb38
 XrTFuhCcAahSrpzz8eB3qeRe2Jq5Exhzvjq1WkpKC9Py2E9jxpUp4mk2cHcmziiOET8+
 0/NwpO5vMahOsWasFadt4f366wMWY9GTYzCFJsHVXwfAbE65ntsQBfO4NldgQ8WCUjbY
 eNcggDy3W8OVqLtORmfNX86drD6Ua9viPslDMEKa+z/1svRuvvM0249PLguwpY1etR05
 AOYA==
X-Gm-Message-State: ANoB5pkzF+8uAlEvB/eAJeM40jAEguIfxyblUYz3de2hVTQhJKqulTO0
 HA7rMCZQRKw5JiuP9Eg1qlw=
X-Google-Smtp-Source: AA0mqf7zt8lCXlLCEU+O4UjtV2JiwlMTevqkPDwcLnqmw94gQJiXUrNyAhJ3EkaPswdWgtv9ry3OPw==
X-Received: by 2002:a05:600c:5010:b0:3cf:b067:416c with SMTP id
 n16-20020a05600c501000b003cfb067416cmr4064198wmr.134.1668661209301; 
 Wed, 16 Nov 2022 21:00:09 -0800 (PST)
Received: from localhost.localdomain (user-5-173-65-115.play-internet.pl.
 [5.173.65.115]) by smtp.googlemail.com with ESMTPSA id
 q10-20020adff94a000000b0022cc6b8df5esm16512143wrr.7.2022.11.16.21.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 21:00:08 -0800 (PST)
From: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>
X-Google-Original-From: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4] udmabuf: add vmap and vunmap methods to udmabuf_ops
Date: Thu, 17 Nov 2022 05:58:41 +0100
Message-Id: <20221117045842.27161-1-lukasz.wiecaszek@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reason behind that patch is associated with videobuf2 subsystem
(or more genrally with v4l2 framework) and user created
dma buffers (udmabuf). In some circumstances
when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
wants to use dma_buf_vmap() method on the attached dma buffer.
As udmabuf does not have .vmap operation implemented,
such dma_buf_vmap() natually fails.

videobuf2_common: __vb2_queue_alloc: allocated 3 buffers, 1 plane(s) each
videobuf2_common: __prepare_dmabuf: buffer for plane 0 changed
videobuf2_common: __prepare_dmabuf: failed to map dmabuf for plane 0
videobuf2_common: __buf_prepare: buffer preparation failed: -14

The patch itself seems to be strighforward.
It adds implementation of .vmap and .vunmap methods
to 'struct dma_buf_ops udmabuf_ops'.
.vmap method itself uses vm_map_ram() to map pages linearly
into the kernel virtual address space.
.vunmap removes mapping created earlier by .vmap.
All locking and 'vmapping counting' is done in dma_buf.c
so it seems to be redundant/unnecessary in .vmap/.vunmap.

Signed-off-by: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
---
v1: https://lore.kernel.org/linux-media/202211120352.G7WPASoP-lkp@intel.com/T/#t
v2: https://lore.kernel.org/linux-media/20221114052944.GA7264@thinkpad-p72/T/#t
v3: https://lore.kernel.org/linux-media/4f92e95f-a0dc-4eac-4c08-0df85de78ae7@collabora.com/T/#t

v3 -> v4: Removed line/info 'reported by kernel test robot'
v2 -> v3: Added .vunmap to 'struct dma_buf_ops udmabuf_ops'
v1 -> v2: Patch prepared and tested against 6.1.0-rc2+

 drivers/dma-buf/udmabuf.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 283816fbd72f..740d6e426ee9 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -13,6 +13,8 @@
 #include <linux/slab.h>
 #include <linux/udmabuf.h>
 #include <linux/hugetlb.h>
+#include <linux/vmalloc.h>
+#include <linux/iosys-map.h>
 
 static int list_limit = 1024;
 module_param(list_limit, int, 0644);
@@ -60,6 +62,30 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 	return 0;
 }
 
+static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
+{
+	struct udmabuf *ubuf = buf->priv;
+	void *vaddr;
+
+	dma_resv_assert_held(buf->resv);
+
+	vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
+	if (!vaddr)
+		return -EINVAL;
+
+	iosys_map_set_vaddr(map, vaddr);
+	return 0;
+}
+
+static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
+{
+	struct udmabuf *ubuf = buf->priv;
+
+	dma_resv_assert_held(buf->resv);
+
+	vm_unmap_ram(map->vaddr, ubuf->pagecount);
+}
+
 static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 				     enum dma_data_direction direction)
 {
@@ -162,6 +188,8 @@ static const struct dma_buf_ops udmabuf_ops = {
 	.unmap_dma_buf	   = unmap_udmabuf,
 	.release	   = release_udmabuf,
 	.mmap		   = mmap_udmabuf,
+	.vmap		   = vmap_udmabuf,
+	.vunmap		   = vunmap_udmabuf,
 	.begin_cpu_access  = begin_cpu_udmabuf,
 	.end_cpu_access    = end_cpu_udmabuf,
 };
-- 
2.25.1

