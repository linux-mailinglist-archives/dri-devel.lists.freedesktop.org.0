Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6759D8B3BDA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 17:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1859F1124D5;
	Fri, 26 Apr 2024 15:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Hu/c35Js";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E611124D2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 15:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714146132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J6Za5dqP1vNIWZF7RvMAdeAfhQe3W63OGnIUvf5n09o=;
 b=Hu/c35JsbbMlXpnmYWjv1XjCX4dspKV7+w839h/9iUefNX1kh4KlbD0vUur8nZzGdOp7ga
 jXfuNtzW4bYqFNvCWei3Y3GxUhwC+Wc9EJiZfr1V5c6AdqxEp60YaMDK6sh9F2YRnUC5Vu
 cszHaZ4w8mhbWXfxjaaztOF7J6W7rXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-qxmgJdkaO7OcV05bAC6RyA-1; Fri, 26 Apr 2024 11:42:07 -0400
X-MC-Unique: qxmgJdkaO7OcV05bAC6RyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7240780021A;
 Fri, 26 Apr 2024 15:42:06 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.8.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B165EC683;
 Fri, 26 Apr 2024 15:42:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/nouveau/gsp: Use the sg allocator for level 2 of
 radix3
Date: Fri, 26 Apr 2024 11:41:29 -0400
Message-ID: <20240426154138.64643-2-lyude@redhat.com>
In-Reply-To: <20240426154138.64643-1-lyude@redhat.com>
References: <20240426154138.64643-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Currently we allocate all 3 levels of radix3 page tables using
nvkm_gsp_mem_ctor(), which uses dma_alloc_coherent() for allocating all of
the relevant memory. This can end up failing in scenarios where the system
has very high memory fragmentation, and we can't find enough contiguous
memory to allocate level 2 of the page table.

Currently, this can result in runtime PM issues on systems where memory
fragmentation is high - as we'll fail to allocate the page table for our
suspend/resume buffer:

  kworker/10:2: page allocation failure: order:7, mode:0xcc0(GFP_KERNEL),
  nodemask=(null),cpuset=/,mems_allowed=0
  CPU: 10 PID: 479809 Comm: kworker/10:2 Not tainted
  6.8.6-201.ChopperV6.fc39.x86_64 #1
  Hardware name: SLIMBOOK Executive/Executive, BIOS N.1.10GRU06 02/02/2024
  Workqueue: pm pm_runtime_work
  Call Trace:
   <TASK>
   dump_stack_lvl+0x64/0x80
   warn_alloc+0x165/0x1e0
   ? __alloc_pages_direct_compact+0xb3/0x2b0
   __alloc_pages_slowpath.constprop.0+0xd7d/0xde0
   __alloc_pages+0x32d/0x350
   __dma_direct_alloc_pages.isra.0+0x16a/0x2b0
   dma_direct_alloc+0x70/0x270
   nvkm_gsp_radix3_sg+0x5e/0x130 [nouveau]
   r535_gsp_fini+0x1d4/0x350 [nouveau]
   nvkm_subdev_fini+0x67/0x150 [nouveau]
   nvkm_device_fini+0x95/0x1e0 [nouveau]
   nvkm_udevice_fini+0x53/0x70 [nouveau]
   nvkm_object_fini+0xb9/0x240 [nouveau]
   nvkm_object_fini+0x75/0x240 [nouveau]
   nouveau_do_suspend+0xf5/0x280 [nouveau]
   nouveau_pmops_runtime_suspend+0x3e/0xb0 [nouveau]
   pci_pm_runtime_suspend+0x67/0x1e0
   ? __pfx_pci_pm_runtime_suspend+0x10/0x10
   __rpm_callback+0x41/0x170
   ? __pfx_pci_pm_runtime_suspend+0x10/0x10
   rpm_callback+0x5d/0x70
   ? __pfx_pci_pm_runtime_suspend+0x10/0x10
   rpm_suspend+0x120/0x6a0
   pm_runtime_work+0x98/0xb0
   process_one_work+0x171/0x340
   worker_thread+0x27b/0x3a0
   ? __pfx_worker_thread+0x10/0x10
   kthread+0xe5/0x120
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x31/0x50
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1b/0x30

Luckily, we don't actually need to allocate coherent memory for the page
table thanks to being able to pass the GPU a radix3 page table for
suspend/resume data. So, let's rewrite nvkm_gsp_radix3_sg() to use the sg
allocator for level 2. We continue using coherent allocations for lvl0 and
1, since they only take a single page.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 71 ++++++++++++-------
 2 files changed, 47 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 6f5d376d8fcc1..a11d16a16c3b2 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -15,7 +15,9 @@ struct nvkm_gsp_mem {
 };
 
 struct nvkm_gsp_radix3 {
-	struct nvkm_gsp_mem mem[3];
+	struct nvkm_gsp_mem lvl0;
+	struct nvkm_gsp_mem lvl1;
+	struct sg_table lvl2;
 };
 
 int nvkm_gsp_sg(struct nvkm_device *, u64 size, struct sg_table *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 9858c1438aa7f..2bf9077d37118 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1624,7 +1624,7 @@ r535_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
 	meta->magic = GSP_FW_WPR_META_MAGIC;
 	meta->revision = GSP_FW_WPR_META_REVISION;
 
-	meta->sysmemAddrOfRadix3Elf = gsp->radix3.mem[0].addr;
+	meta->sysmemAddrOfRadix3Elf = gsp->radix3.lvl0.addr;
 	meta->sizeOfRadix3Elf = gsp->fb.wpr2.elf.size;
 
 	meta->sysmemAddrOfBootloader = gsp->boot.fw.addr;
@@ -1919,8 +1919,9 @@ nvkm_gsp_sg(struct nvkm_device *device, u64 size, struct sg_table *sgt)
 static void
 nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
 {
-	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--)
-		nvkm_gsp_mem_dtor(gsp, &rx3->mem[i]);
+	nvkm_gsp_sg_free(gsp->subdev.device, &rx3->lvl2);
+	nvkm_gsp_mem_dtor(gsp, &rx3->lvl1);
+	nvkm_gsp_mem_dtor(gsp, &rx3->lvl0);
 }
 
 /**
@@ -1960,36 +1961,52 @@ static int
 nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 		   struct nvkm_gsp_radix3 *rx3)
 {
-	u64 addr;
+	struct sg_dma_page_iter sg_dma_iter;
+	struct scatterlist *sg;
+	size_t bufsize;
+	u64 *pte;
+	int ret, i, page_idx = 0;
 
-	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--) {
-		u64 *ptes;
-		size_t bufsize;
-		int ret, idx;
-
-		bufsize = ALIGN((size / GSP_PAGE_SIZE) * sizeof(u64), GSP_PAGE_SIZE);
-		ret = nvkm_gsp_mem_ctor(gsp, bufsize, &rx3->mem[i]);
-		if (ret)
-			return ret;
+	ret = nvkm_gsp_mem_ctor(gsp, GSP_PAGE_SIZE, &rx3->lvl0);
+	if (ret)
+		return ret;
 
-		ptes = rx3->mem[i].data;
-		if (i == 2) {
-			struct scatterlist *sgl;
+	ret = nvkm_gsp_mem_ctor(gsp, GSP_PAGE_SIZE, &rx3->lvl1);
+	if (ret)
+		goto lvl1_fail;
 
-			for_each_sgtable_dma_sg(sgt, sgl, idx) {
-				for (int j = 0; j < sg_dma_len(sgl) / GSP_PAGE_SIZE; j++)
-					*ptes++ = sg_dma_address(sgl) + (GSP_PAGE_SIZE * j);
-			}
-		} else {
-			for (int j = 0; j < size / GSP_PAGE_SIZE; j++)
-				*ptes++ = addr + GSP_PAGE_SIZE * j;
+	// Allocate level 2
+	bufsize = ALIGN((size / GSP_PAGE_SIZE) * sizeof(u64), GSP_PAGE_SIZE);
+	ret = nvkm_gsp_sg(gsp->subdev.device, bufsize, &rx3->lvl2);
+	if (ret)
+		goto lvl2_fail;
+
+	// Write the bus address of level 1 to level 0
+	pte = rx3->lvl0.data;
+	*pte = rx3->lvl1.addr;
+
+	// Write the bus address of each page in level 2 to level 1
+	pte = rx3->lvl1.data;
+	for_each_sgtable_dma_page(&rx3->lvl2, &sg_dma_iter, 0)
+		*pte++ = sg_page_iter_dma_address(&sg_dma_iter);
+
+	// Finally, write the bus address of each page in sgt to level 2
+	for_each_sgtable_sg(&rx3->lvl2, sg, i) {
+		pte = sg_virt(sg);
+		for_each_sgtable_dma_page(sgt, &sg_dma_iter, page_idx) {
+			*pte++ = sg_page_iter_dma_address(&sg_dma_iter);
+			page_idx++;
 		}
+	}
 
-		size = rx3->mem[i].size;
-		addr = rx3->mem[i].addr;
+	if (ret) {
+lvl2_fail:
+		nvkm_gsp_mem_dtor(gsp, &rx3->lvl1);
+lvl1_fail:
+		nvkm_gsp_mem_dtor(gsp, &rx3->lvl0);
 	}
 
-	return 0;
+	return ret;
 }
 
 int
@@ -2021,7 +2038,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		sr = gsp->sr.meta.data;
 		sr->magic = GSP_FW_SR_META_MAGIC;
 		sr->revision = GSP_FW_SR_META_REVISION;
-		sr->sysmemAddrOfSuspendResumeData = gsp->sr.radix3.mem[0].addr;
+		sr->sysmemAddrOfSuspendResumeData = gsp->sr.radix3.lvl0.addr;
 		sr->sizeOfSuspendResumeData = len;
 
 		mbox0 = lower_32_bits(gsp->sr.meta.addr);
-- 
2.44.0

