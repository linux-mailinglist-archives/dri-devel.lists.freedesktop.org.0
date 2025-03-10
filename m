Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E03A59373
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA7A10E405;
	Mon, 10 Mar 2025 12:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fd8MwOI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AEC10E3FF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:06:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 64EAB5C6122;
 Mon, 10 Mar 2025 12:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59344C4CEED;
 Mon, 10 Mar 2025 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741608389;
 bh=MHX69KTowxgUBaIq2U0nJk1Dh2Qpf931EJ3Gm20lDzU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Fd8MwOI6Gr4g8BxyrBDoPe5CkR6LxWSS86cWJnaVKQOIKhwpyInBkAsVLEqZkg+Wb
 92kysW/uU1DvJxhXvHDYryxQcl3F3RW8iCg7E3r49YcFoC0joeuTsIlwEf2tyc1CNQ
 bm5BMdZG6Wdemat7usQFs9xfPoIcoavti+dtm/KPA+l8DVWGohgUkhECakNgp7YyGk
 skf2qKyhtWb0v7FHzEEToVkb+KYzmvqOptZkOO/efesCe/PhU/vWxW3fznUnDzM+TC
 4fJfyO59HAxcIcLLolGaqV65cB2wXS0MRBKmBdOFpi+X98F+pVQCGw+kCDg250k8t5
 HlmHQEHBVHCbQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:10 +0100
Subject: [PATCH RFC 04/12] dma: coherent: Provide accessor to dmem region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-4-2984c1bc9312@kernel.org>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2413; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MHX69KTowxgUBaIq2U0nJk1Dh2Qpf931EJ3Gm20lDzU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm56E/7yxj4HNfHYzFPqWVsnsExuXHlz2uHEp0wf5
 4tcjNRa11HCwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJCF9k+B899/qseSLBUSsv
 u3VNuPdaYHmEpcNpV5fGg7++GJWmq6sx/LgUnqF8xVvbKyHQrUnf1ZLllVSE0cWvT9SnbvsRnOj
 NCAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Consumers of the coherent DMA API will have to know which coherent
region their device allocate from in order for them to charge the memory
allocation in the right one.

Let's provide an accessor for that region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-map-ops.h | 11 +++++++++++
 kernel/dma/coherent.c       | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index e172522cd93651594607e16461fac56e4d67cbce..a2c10ed186efb6e08f64df0954b4d389589b6e35 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -199,10 +199,21 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
 {
 	return 0;
 }
 #endif /* CONFIG_DMA_GLOBAL_POOL */
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM) && IS_ENABLED(CONFIG_DMA_DECLARE_COHERENT)
+struct dmem_cgroup_region *
+dma_coherent_get_dmem_cgroup_region(struct device *dev);
+#else /* CONFIG_CGROUP_DMEM && CONFIG_DMA_DECLARE_COHERENT */
+static inline struct dmem_cgroup_region *
+dma_coherent_get_dmem_cgroup_region(struct device *dev)
+{
+	return NULL;
+}
+#endif /* CONFIG_CGROUP_DMEM && CONFIG_DMA_DECLARE_COHERENT */
+
 int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
 int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 2a2d515e43acbdef19c14d8840ed90e48e7ebb43..74c5ff5105110487770c1b73812eefe8b3d7eb3c 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -28,10 +28,24 @@ static inline struct dma_coherent_mem *dev_get_coherent_memory(struct device *de
 	if (dev && dev->dma_mem)
 		return dev->dma_mem;
 	return NULL;
 }
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *
+dma_coherent_get_dmem_cgroup_region(struct device *dev)
+{
+	struct dma_coherent_mem *mem;
+
+	mem = dev_get_coherent_memory(dev);
+	if (!mem)
+		return NULL;
+
+	return mem->dmem_cgroup_region;
+}
+#endif
+
 static inline dma_addr_t dma_get_device_base(struct device *dev,
 					     struct dma_coherent_mem * mem)
 {
 	if (mem->use_dev_dma_pfn_offset)
 		return phys_to_dma(dev, PFN_PHYS(mem->pfn_base));

-- 
2.48.1

