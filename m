Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1503A59374
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E913B10E406;
	Mon, 10 Mar 2025 12:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jYajrhN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56C810E406
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:06:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B1B80A45AF0;
 Mon, 10 Mar 2025 12:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41403C4CEE5;
 Mon, 10 Mar 2025 12:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741608400;
 bh=2NdYbFXqIu49ZMyAqVsyt9MyeVTM3FWe9Y2AJpwIrVQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jYajrhN2FOK3TJWdSOSKnA5oMw9VDNtRvtBCins3Bmp0nNI7ucd/hvhBSHpBuqXnB
 DZxNW1+a2aHyxnK0A9Fhi801grDQHgLQbP9q6YSvN3TyjhiipsaoEXi4iVGNfQITLV
 z/f4jxpJmEAmk5mySweb9jjh8hKeTrCnr+SrE/WTTFy9N0QcT8yeoI77qcDcyCyy2E
 vRAFsOF5L80KPBdeA+eL3rszThdAdsNd0ShRgdkd4DQaIabptpC91PIrJzNzl6Pr0F
 DOm2EIZIbujiQev4qPzWpV6fKuoappVRYnSB2WD0v78u+e0i5g1HBvmQMQ9KMJUWuR
 zRSpjxAyz59eg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:14 +0100
Subject: [PATCH RFC 08/12] dma: Provide accessor to dmem region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-8-2984c1bc9312@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2NdYbFXqIu49ZMyAqVsyt9MyeVTM3FWe9Y2AJpwIrVQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm75peFiuvT/C+0FG88Ve/+4tJ7nMofXWwHp6uCju
 0uFJq8621HKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJHOhgZPi5Vj9p5r1FnYXK
 4WFVDrwO+/8m2DX4nU/0zHXaXl8cMIuR4VS1X+61qKWurquOzrrzfObMiw++peSIhMTvsi6Keiw
 jzAUA
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

Consumers of the DMA API will have to know which DMA region their device
allocate from in order for them to charge the memory allocation in the
right one.

Let's provide an accessor for that region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-mapping.h | 11 +++++++++++
 kernel/dma/mapping.c        | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index b79925b1c4333ce25e66c57d8ac1dae5c7b7fe37..75f5ca1d11a6297720742cea1359c7f28c23d741 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -351,10 +351,21 @@ static inline bool dma_need_sync(struct device *dev, dma_addr_t dma_addr)
 {
 	return false;
 }
 #endif /* !CONFIG_HAS_DMA || !CONFIG_DMA_NEED_SYNC */
 
+#if IS_ENABLED(CONFIG_HAS_DMA) && IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *
+dma_get_dmem_cgroup_region(struct device *dev);
+#else
+static inline struct dmem_cgroup_region *
+dma_get_dmem_cgroup_region(struct device *dev)
+{
+	return NULL;
+}
+#endif
+
 struct page *dma_alloc_pages(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
 void dma_free_pages(struct device *dev, size_t size, struct page *page,
 		dma_addr_t dma_handle, enum dma_data_direction dir);
 int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 7bc3957512fd84e0bf3a89c210338be72457b5c9..e45d63700183acb03c779f969ae33803dcf5cf1b 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -608,10 +608,26 @@ static int __init dma_init_dmem_cgroup(void)
 
 	default_dmem_cgroup_region = region;
 	return 0;
 }
 core_initcall(dma_init_dmem_cgroup);
+
+struct dmem_cgroup_region *
+dma_get_dmem_cgroup_region(struct device *dev)
+{
+	struct dmem_cgroup_region *region;
+
+	region = dma_coherent_get_dmem_cgroup_region(dev);
+	if (region)
+		return region;
+
+	if (dma_alloc_direct(dev, get_dma_ops(dev)))
+		return dma_direct_get_dmem_cgroup_region(dev);
+
+	return default_dmem_cgroup_region;
+}
+EXPORT_SYMBOL(dma_get_dmem_cgroup_region);
 #endif
 
 void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t flag, unsigned long attrs)
 {

-- 
2.48.1

