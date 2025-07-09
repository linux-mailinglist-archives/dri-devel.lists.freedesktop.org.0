Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1BBAFE93E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A792010E1F9;
	Wed,  9 Jul 2025 12:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sL1zhxns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DD810E1F9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:45:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4A2C243898;
 Wed,  9 Jul 2025 12:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D9AC4CEF5;
 Wed,  9 Jul 2025 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752065107;
 bh=j+rGaVFrKh/wTsIEN6Y/GVKJC3e6Fd+LYTBCSBZnuHw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sL1zhxnslztVR22EPFjnTP6BdUV5LwKMHzA3KxXOgOvl/b6YkoPfXPm8aysatlzru
 NrY5V62cE/KFyEZBYQnKluajc/VbrV6xEfVN50Rr+THqg0a1rk+P3M+yiEMnrLJnXt
 egMjis+tIKukv4U4z/7sDF9mQUteQGv2JvkLC66LiP8ggXOMMy3pY8vbkItOviitPC
 Ge4SbRIx0xV886Gqcl7Dr0DshooNtOPMQij6rs1pWCWQkLISbJ9SDWpL23XRXsJufg
 ie0FdGcuWkV6/JoCrlU1bo6BLlaG2KHTBSmEj2KaDLzCPV3y+Z3SxB0OcTEMqjrPnn
 KQ8Gc/GBZgatQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 09 Jul 2025 14:44:51 +0200
Subject: [PATCH v6 1/2] dma/contiguous: Add helper to test reserved memory type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-dma-buf-ecc-heap-v6-1-dac9bf80f35d@kernel.org>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
In-Reply-To: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2383; i=mripard@kernel.org;
 h=from:subject:message-id; bh=j+rGaVFrKh/wTsIEN6Y/GVKJC3e6Fd+LYTBCSBZnuHw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBl5KT4HohnkJMt+6Nb9K714wOrC4+ebL4qcKzJMCZN74
 LfVMXVCx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiI1zTGhgNi7EItlyQL2mL0
 7Lf8smE4lOX7Zur/3KVHN06+vqJ8Qez8gnvzXlqo1a9apzT/1Ju4uYz1wUmqAZsvSvFpcXVNVL+
 3wov5hs/EfbmNuwVuVjJ9+q4575hJFs+NYz9Wls1wcjwdknIQAA==
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

A given reserved-memory region can be of multiple types.

We have currently four types defined in the tree: contiguous, backed by
CMA, coherent and swiotlb, backed by their respective allocators, and a
platform-specific one for tegra.

However, some users, like dma-buf heaps, might be interested in the
exact type of a reserved memory region they are getting. It would thus
be useful to have helpers to test if a given region is of a given type.

Since we only care about CMA for now though, let's create one for CMA
only.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-map-ops.h | 13 +++++++++++++
 kernel/dma/contiguous.c     |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index f48e5fb88bd5dd346094bbf2ce1b79e5f5bfe1a6..ea646acb6367bd062619b337013db221749f85ab 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -153,10 +153,23 @@ static inline void dma_free_contiguous(struct device *dev, struct page *page,
 {
 	__free_pages(page, get_order(size));
 }
 #endif /* CONFIG_DMA_CMA*/
 
+#if defined(CONFIG_DMA_CMA) && defined(CONFIG_OF_RESERVED_MEM)
+struct reserved_mem;
+
+bool of_reserved_mem_is_contiguous(const struct reserved_mem *rmem);
+#else
+struct reserved_mem;
+
+static inline bool of_reserved_mem_is_contiguous(const struct reserved_mem *rmem)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_DMA_DECLARE_COHERENT
 int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 		dma_addr_t device_addr, size_t size);
 void dma_release_coherent_memory(struct device *dev);
 int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 8df0dfaaca18eeb0a20145512ba64425d2e7601e..ace4982e928e404315cf38551e1596f7ed445156 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -493,6 +493,13 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
 
 	return 0;
 }
 RESERVEDMEM_OF_DECLARE(cma, "shared-dma-pool", rmem_cma_setup);
+
+bool of_reserved_mem_is_contiguous(const struct reserved_mem *rmem)
+{
+	return rmem->ops == &rmem_cma_ops;
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_is_contiguous);
+
 #endif

-- 
2.50.0

