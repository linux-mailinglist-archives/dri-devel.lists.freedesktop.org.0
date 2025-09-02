Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D899B4097E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F7510E7D8;
	Tue,  2 Sep 2025 15:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YTj6uIuv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687A110E7DB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:47:01 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-61cb9e039d9so11064439a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756828020; x=1757432820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OYuucEV+T24+u0DRFcF+IL1sfMs9QC6miqmiv7tTdXY=;
 b=YTj6uIuvULK7ZaOwdW+ITo7V4KcIL2ywTv7+U2rIbJMN+Dw8EztqyCNg41HUinadBy
 AHyRQmkIzDDljsTC3h0WFDMOgvU2MEu6j6KsvUCB2pF1U7yPjKPR5XJcWuhlDLVD4Fci
 c8zDKCueEIQ/P3GqTvcvNfe8bBrxomXWYUo1IKkcYXU9Ep2RXZd3E3uXiTbVznLOFVUR
 bnQGLbPMSZknVn58lG38NH9Z4auKC6vTlAYi7IJ5bICWXkeEC0XTE3LJ1NX1K32rYAUi
 YyM9Stq9y4rJUpqhP7YxXI6XDahAp8MGwF6Alf0E9CxI9dCiJMTYaEfX/KPm6IPBROLS
 NSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828020; x=1757432820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OYuucEV+T24+u0DRFcF+IL1sfMs9QC6miqmiv7tTdXY=;
 b=hfyRPNJDzQJRTtoZ3w25neKF64Ci4UtgaEgbISuZ6PnL/Aum1sufugoPqjfm+YxQul
 3TCwV5/60PPXwb54vVrmXzAexLma444eNwlDBWRZbjH+ANcWt05qJBksGB00wMkbV2fK
 lzy9mdfj7OJcLVgMBKQMHn/rhl3lBPGt9kmq/vJC/lgzjSunRrlj9xVEsUgbqzOdkPBA
 vzi+6zk4UBospQ7MIbKFCVjiBswRzhy9PW8cJrdt6uRRGPKJGVS6+CgRiPMzlO3TOn+T
 GF/9bi+XGEk7kKhsSqKY/gZi4oeCyRRyOEmRcy7XwX8mvNTUFzM6oDpliRERDwKCaz0s
 hwSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC9ncmVsI6JDHhWUQenuCTI/nA8YD5DupoujQx5gqZhm2WCQOr+jNypcJwHjo+2xl22JSqKOOWQL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ3llaagEJt9DxyzjNOIPmW4X2O1yXDINgDbBfCR2WAh4M0y8D
 D3Y/0ZGTjgPUh0axCn3J9eiWybSSO49LtWWaMWzDd/WTLHliZCdIGhV2
X-Gm-Gg: ASbGncuHUdSCvPw+DwNMDqDugUsqaJu9jrSat7YW2PwA/nSecSglFYlsfmOMoyvMhjK
 fde+jdDIP/5xmbs0JgXxqN6JAXEPDoYohX98WgviwwYweMnrNjS9icZEhM0ajxzVIqNS8z4JdNi
 QW1427/DUSQowzGYCVXCh2rFYwn0uWl7AK/eKm4AxKEdUe9MlkKkdvWNgZdsjx0jW0c6OfuJsJ5
 rcASSSJ0f9B6okVFV8otbONdDah9P9quTxBATGk8pInrClWcLZUn/uER6CLqo23IkATdpeEKQKA
 czHPwNYbEX5P42uXDYboo0ALAOLzeuNzv2mcvktdNxbgq/dnu9fvqmzWRXgyZjWYFfpMn6S0UgM
 YXYpNDfn3vsbzuhE3/+WQ2NtR+7uVRi6uOvOpdYAAsbCvz80pZ1OtLu5ajNdUda0Y3m+mP4SOek
 mmeXmpVL5SCRdxww==
X-Google-Smtp-Source: AGHT+IHDLjwCmuAnP5Vi14ZMWLeQeHOJop7Yqiiag3q+GLo9vvAbZuBNctTPzCghs1ZFkZDLl1I3UQ==
X-Received: by 2002:a17:907:94c9:b0:b04:2f81:5c35 with SMTP id
 a640c23a62f3a-b042f817f8cmr743278466b.34.1756828019499; 
 Tue, 02 Sep 2025 08:46:59 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-aff10eb1ee3sm986916066b.19.2025.09.02.08.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:46:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org
Subject: [PATCH 5/9] dma-buf: heaps: Add support for Tegra VPR
Date: Tue,  2 Sep 2025 17:46:25 +0200
Message-ID: <20250902154630.4032984-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902154630.4032984-1-thierry.reding@gmail.com>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

NVIDIA Tegra SoCs commonly define a Video-Protection-Region, which is a
region of memory dedicated to content-protected video decode and
playback. This memory cannot be accessed by the CPU and only certain
hardware devices have access to it.

Expose the VPR as a DMA heap so that applications and drivers can
allocate buffers from this region for use-cases that require this kind
of protected memory.

VPR has a few very critical peculiarities. First, it must be a single
contiguous region of memory (there is a single pair of registers that
set the base address and size of the region), which is configured by
calling back into the secure monitor. The memory region also needs to
quite large for some use-cases because it needs to fit multiple video
frames (8K video should be supported), so VPR sizes of ~2 GiB are
expected. However, some devices cannot afford to reserve this amount
of memory for a particular use-case, and therefore the VPR must be
resizable.

Unfortunately, resizing the VPR is slightly tricky because the GPU found
on Tegra SoCs must be in reset during the VPR resize operation. This is
currently implemented by freezing all userspace processes and calling
invoking the GPU's freeze() implementation, resizing and the thawing the
GPU and userspace processes. This is quite heavy-handed, so eventually
it might be better to implement thawing/freezing in the GPU driver in
such a way that they block accesses to the GPU so that the VPR resize
operation can happen without suspending all userspace.

In order to balance the memory usage versus the amount of resizing that
needs to happen, the VPR is divided into multiple chunks. Each chunk is
implemented as a CMA area that is completely allocated on first use to
guarantee the contiguity of the VPR. Once all buffers from a chunk have
been freed, the CMA area is deallocated and the memory returned to the
system.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/dma-buf/heaps/Kconfig     |   7 +
 drivers/dma-buf/heaps/Makefile    |   1 +
 drivers/dma-buf/heaps/tegra-vpr.c | 831 ++++++++++++++++++++++++++++++
 include/trace/events/tegra_vpr.h  |  57 ++
 4 files changed, 896 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/tegra-vpr.c
 create mode 100644 include/trace/events/tegra_vpr.h

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index bb369b38b001..af97af1bb420 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -22,3 +22,10 @@ config DMABUF_HEAPS_CMA_LEGACY
 	  from the CMA area's devicetree node, or "reserved" if the area is not
 	  defined in the devicetree. This uses the same underlying allocator as
 	  CONFIG_DMABUF_HEAPS_CMA.
+
+config DMABUF_HEAPS_TEGRA_VPR
+	bool "NVIDIA Tegra Video-Protected-Region DMA-BUF Heap"
+	depends on DMABUF_HEAPS && DMA_CMA
+	help
+	  Choose this option to enable Video-Protected-Region (VPR) support on
+	  a range of NVIDIA Tegra devices.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 974467791032..265b77a7b889 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_TEGRA_VPR)	+= tegra-vpr.o
diff --git a/drivers/dma-buf/heaps/tegra-vpr.c b/drivers/dma-buf/heaps/tegra-vpr.c
new file mode 100644
index 000000000000..a36efeb031b8
--- /dev/null
+++ b/drivers/dma-buf/heaps/tegra-vpr.c
@@ -0,0 +1,831 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMA-BUF restricted heap exporter for NVIDIA Video-Protection-Region (VPR)
+ *
+ * Copyright (C) 2024-2025 NVIDIA Corporation
+ */
+
+#define pr_fmt(fmt) "tegra-vpr: " fmt
+
+#include <linux/arm-smccc.h>
+#include <linux/cma.h>
+#include <linux/debugfs.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/of_reserved_mem.h>
+
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <linux/freezer.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/tegra_vpr.h>
+
+struct tegra_vpr;
+
+struct tegra_vpr_device {
+	struct list_head node;
+	struct device *dev;
+};
+
+struct tegra_vpr_chunk {
+	phys_addr_t start;
+	phys_addr_t limit;
+	size_t size;
+
+	struct tegra_vpr *vpr;
+	struct cma *cma;
+	bool active;
+
+	struct page *start_page;
+	unsigned long *bitmap;
+	unsigned long virt;
+	pgoff_t num_pages;
+
+	struct list_head buffers;
+	struct mutex lock;
+};
+
+struct tegra_vpr {
+	struct device_node *dev_node;
+	unsigned long align;
+	phys_addr_t base;
+	phys_addr_t size;
+	bool use_freezer;
+
+	struct tegra_vpr_chunk *chunks;
+	unsigned int num_chunks;
+
+	struct list_head devices;
+	struct mutex lock;
+};
+
+struct tegra_vpr_buffer {
+	struct tegra_vpr_chunk *chunk;
+	struct list_head attachments;
+	struct list_head list;
+	struct mutex lock;
+
+	struct page *start_page;
+	struct page **pages;
+	pgoff_t num_pages;
+	phys_addr_t start;
+	phys_addr_t limit;
+	size_t size;
+	int pageno;
+	int order;
+
+	unsigned long virt;
+};
+
+struct tegra_vpr_attachment {
+	struct device *dev;
+	struct sg_table sgt;
+	struct list_head list;
+};
+
+#define ARM_SMCCC_TE_FUNC_PROGRAM_VPR 0x3
+
+#define ARM_SMCCC_VENDOR_SIP_TE_PROGRAM_VPR_FUNC_ID		\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
+			   ARM_SMCCC_SMC_32,			\
+			   ARM_SMCCC_OWNER_SIP,			\
+			   ARM_SMCCC_TE_FUNC_PROGRAM_VPR)
+
+static int tegra_vpr_set(phys_addr_t base, phys_addr_t size)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(ARM_SMCCC_VENDOR_SIP_TE_PROGRAM_VPR_FUNC_ID, base, size,
+		      0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+static int tegra_vpr_get_extents(struct tegra_vpr *vpr, phys_addr_t *base,
+				 phys_addr_t *size)
+{
+	phys_addr_t start = ~0, limit = 0;
+	unsigned int i;
+
+	for (i = 0; i < vpr->num_chunks; i++) {
+		struct tegra_vpr_chunk *chunk = &vpr->chunks[i];
+
+		if (!chunk->active)
+			break;
+
+		if (chunk->start < start)
+			start = chunk->start;
+
+		if (chunk->limit > limit)
+			limit = chunk->limit;
+	}
+
+	if (limit > start) {
+		*size = limit - start;
+		*base = start;
+	} else {
+		*base = *size = 0;
+	}
+
+	return 0;
+}
+
+static int tegra_vpr_resize(struct tegra_vpr *vpr)
+{
+	struct tegra_vpr_device *node;
+	phys_addr_t base, size;
+	int err;
+
+	err = tegra_vpr_get_extents(vpr, &base, &size);
+	if (err < 0) {
+		pr_err("%s(): failed to get VPR extents: %d\n", __func__, err);
+		return err;
+	}
+
+	if (vpr->use_freezer) {
+		err = freeze_processes();
+		if (err < 0) {
+			pr_err("%s(): failed to freeze processes: %d\n",
+			       __func__, err);
+			return err;
+		}
+	}
+
+	list_for_each_entry(node, &vpr->devices, node) {
+		err = pm_generic_freeze(node->dev);
+		if (err < 0) {
+			pr_err("failed to runtime suspend %s\n",
+			       dev_name(node->dev));
+			continue;
+		}
+	}
+
+	trace_tegra_vpr_set(base, size);
+
+	err = tegra_vpr_set(base, size);
+	if (err < 0) {
+		pr_err("failed to secure VPR: %d\n", err);
+		return err;
+	}
+
+	list_for_each_entry(node, &vpr->devices, node) {
+		err = pm_generic_thaw(node->dev);
+		if (err < 0) {
+			pr_err("failed to runtime resume %s\n",
+			       dev_name(node->dev));
+			continue;
+		}
+	}
+
+	if (vpr->use_freezer)
+		thaw_processes();
+
+	return 0;
+}
+
+static int tegra_vpr_protect_pages(pte_t *ptep, unsigned long addr,
+				   void *unused)
+{
+	pte_t pte = __ptep_get(ptep);
+
+	pte = clear_pte_bit(pte, __pgprot(PROT_NORMAL));
+	pte = set_pte_bit(pte, __pgprot(PROT_DEVICE_nGnRnE));
+
+	__set_pte(ptep, pte);
+
+	return 0;
+}
+
+static int tegra_vpr_unprotect_pages(pte_t *ptep, unsigned long addr,
+				     void *unused)
+{
+	pte_t pte = __ptep_get(ptep);
+
+	pte = clear_pte_bit(pte, __pgprot(PROT_DEVICE_nGnRnE));
+	pte = set_pte_bit(pte, __pgprot(PROT_NORMAL));
+
+	__set_pte(ptep, pte);
+
+	return 0;
+}
+
+static int tegra_vpr_chunk_init(struct tegra_vpr *vpr,
+				struct tegra_vpr_chunk *chunk,
+				phys_addr_t start, size_t size,
+				unsigned int order, const char *name)
+{
+	INIT_LIST_HEAD(&chunk->buffers);
+	chunk->start = start;
+	chunk->limit = start + size;
+	chunk->size = size;
+	chunk->vpr = vpr;
+
+	chunk->cma = cma_create(start, size, order, name);
+	if (IS_ERR(chunk->cma))
+		return PTR_ERR(chunk->cma);
+
+	chunk->num_pages = size >> PAGE_SHIFT;
+
+	chunk->bitmap = bitmap_zalloc(chunk->num_pages, GFP_KERNEL);
+	if (!chunk->bitmap) {
+		cma_free(chunk->cma);
+		return -ENOMEM;
+	}
+
+	/* CMA area is not reserved yet */
+	chunk->start_page = NULL;
+	chunk->virt = 0;
+
+	return 0;
+}
+
+static void tegra_vpr_chunk_free(struct tegra_vpr_chunk *chunk)
+{
+	kfree(chunk->bitmap);
+	cma_free(chunk->cma);
+}
+
+static inline bool tegra_vpr_chunk_is_last(const struct tegra_vpr_chunk *chunk)
+{
+	phys_addr_t limit = chunk->vpr->base + chunk->vpr->size;
+
+	return chunk->limit == limit;
+}
+
+static inline bool tegra_vpr_chunk_is_leaf(const struct tegra_vpr_chunk *chunk)
+{
+	const struct tegra_vpr_chunk *next = chunk + 1;
+
+	if (tegra_vpr_chunk_is_last(chunk))
+		return true;
+
+	return !next->active;
+}
+
+static int tegra_vpr_chunk_activate(struct tegra_vpr_chunk *chunk)
+{
+	unsigned long align = get_order(chunk->vpr->align);
+	int err;
+
+	if (chunk->active)
+		return 0;
+
+	trace_tegra_vpr_chunk_activate(chunk->start, chunk->limit);
+
+	chunk->start_page = cma_alloc(chunk->cma, chunk->num_pages, align,
+				      false);
+	if (!chunk->start_page) {
+		err = -ENOMEM;
+		goto free;
+	}
+
+	chunk->virt = (unsigned long)page_to_virt(chunk->start_page);
+
+	apply_to_existing_page_range(&init_mm, chunk->virt, chunk->size,
+				     tegra_vpr_protect_pages, NULL);
+	flush_tlb_kernel_range(chunk->virt, chunk->virt + chunk->size);
+
+	chunk->active = true;
+
+	err = tegra_vpr_resize(chunk->vpr);
+	if (err < 0)
+		goto unprotect;
+
+	bitmap_zero(chunk->bitmap, chunk->num_pages);
+
+	return 0;
+
+unprotect:
+	chunk->active = false;
+	apply_to_existing_page_range(&init_mm, chunk->virt, chunk->size,
+				     tegra_vpr_unprotect_pages, NULL);
+	flush_tlb_kernel_range(chunk->virt, chunk->virt + chunk->size);
+free:
+	cma_release(chunk->cma, chunk->start_page, chunk->num_pages);
+	chunk->start_page = NULL;
+	chunk->virt = 0;
+	return err;
+}
+
+static int tegra_vpr_chunk_deactivate(struct tegra_vpr_chunk *chunk)
+{
+	int err;
+
+	if (!chunk->active || !tegra_vpr_chunk_is_leaf(chunk))
+		return 0;
+
+	/* do not deactivate if there are buffers left in this chunk */
+	if (WARN_ON(!list_empty(&chunk->buffers)))
+		return 0;
+
+	trace_tegra_vpr_chunk_deactivate(chunk->start, chunk->limit);
+
+	chunk->active = false;
+
+	err = tegra_vpr_resize(chunk->vpr);
+	if (err < 0) {
+		chunk->active = true;
+		return err;
+	}
+
+	apply_to_existing_page_range(&init_mm, chunk->virt, chunk->size,
+				     tegra_vpr_unprotect_pages, NULL);
+	flush_tlb_kernel_range(chunk->virt, chunk->virt + chunk->size);
+
+	cma_release(chunk->cma, chunk->start_page, chunk->num_pages);
+	chunk->start_page = NULL;
+	chunk->virt = 0;
+
+	return 0;
+}
+
+static struct tegra_vpr_buffer *
+tegra_vpr_chunk_allocate(struct tegra_vpr_chunk *chunk, size_t size)
+{
+	unsigned int order = get_order(size);
+	struct tegra_vpr_buffer *buffer;
+	int pageno, err;
+	pgoff_t i;
+
+	err = tegra_vpr_chunk_activate(chunk);
+	if (err < 0)
+		return ERR_PTR(err);
+
+	/*
+	 * "order" defines the alignment and size, so this may result in
+	 * fragmented memory depending on the allocation patterns. However,
+	 * since this is used primarily for video frames, it is expected that
+	 * a number of buffers of the same size will be allocated, so
+	 * fragmentation should be negligible.
+	 */
+	pageno = bitmap_find_free_region(chunk->bitmap, chunk->num_pages,
+					 order);
+	if (pageno < 0)
+		return ERR_PTR(-ENOSPC);
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer) {
+		err = -ENOMEM;
+		goto release;
+	}
+
+	INIT_LIST_HEAD(&buffer->attachments);
+	mutex_init(&buffer->lock);
+	buffer->chunk = chunk;
+	buffer->start = chunk->start + (pageno << PAGE_SHIFT);
+	buffer->limit = buffer->start + size;
+	buffer->size = size;
+	buffer->num_pages = buffer->size >> PAGE_SHIFT;
+	buffer->pageno = pageno;
+	buffer->order = order;
+
+	buffer->virt = (unsigned long)page_to_virt(chunk->start_page + pageno);
+
+	buffer->pages = kmalloc_array(buffer->num_pages,
+				      sizeof(*buffer->pages),
+				      GFP_KERNEL);
+	if (!buffer->pages) {
+		err = -ENOMEM;
+		goto free;
+	}
+
+	for (i = 0; i < buffer->num_pages; i++)
+		buffer->pages[i] = &chunk->start_page[pageno + i];
+
+	list_add_tail(&buffer->list, &chunk->buffers);
+
+	return buffer;
+
+free:
+	kfree(buffer);
+release:
+	bitmap_release_region(chunk->bitmap, pageno, order);
+	return ERR_PTR(err);
+}
+
+static void tegra_vpr_chunk_release(struct tegra_vpr_chunk *chunk,
+				    struct tegra_vpr_buffer *buffer)
+{
+	list_del(&buffer->list);
+	kfree(buffer->pages);
+	kfree(buffer);
+
+	bitmap_release_region(chunk->bitmap, buffer->pageno, buffer->order);
+}
+
+static int tegra_vpr_attach(struct dma_buf *buf,
+			    struct dma_buf_attachment *attachment)
+{
+	struct tegra_vpr_buffer *buffer = buf->priv;
+	struct tegra_vpr_attachment *attach;
+	int err;
+
+	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
+	if (!attach)
+		return -ENOMEM;
+
+	err = sg_alloc_table_from_pages(&attach->sgt, buffer->pages,
+					buffer->num_pages, 0, buffer->size,
+					GFP_KERNEL);
+	if (err < 0)
+		goto free;
+
+	attach->dev = attach->dev;
+	INIT_LIST_HEAD(&attach->list);
+	attachment->priv = attach;
+
+	mutex_lock(&buffer->lock);
+	list_add(&attach->list, &buffer->attachments);
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+
+free:
+	kfree(attach);
+	return err;
+}
+
+static void tegra_vpr_detach(struct dma_buf *buf,
+			     struct dma_buf_attachment *attachment)
+{
+	struct tegra_vpr_buffer *buffer = buf->priv;
+	struct tegra_vpr_attachment *attach = attachment->priv;
+
+	mutex_lock(&buffer->lock);
+	list_del(&attach->list);
+	mutex_unlock(&buffer->lock);
+
+	sg_free_table(&attach->sgt);
+	kfree(attach);
+}
+
+static struct sg_table *
+tegra_vpr_map_dma_buf(struct dma_buf_attachment *attachment,
+		      enum dma_data_direction direction)
+{
+	struct tegra_vpr_attachment *attach = attachment->priv;
+	struct sg_table *sgt = &attach->sgt;
+	int err;
+
+	err = dma_map_sgtable(attachment->dev, sgt, direction,
+			      DMA_ATTR_SKIP_CPU_SYNC);
+	if (err < 0)
+		return ERR_PTR(err);
+
+	return sgt;
+}
+
+static void tegra_vpr_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				    struct sg_table *sgt,
+				    enum dma_data_direction direction)
+{
+	dma_unmap_sgtable(attachment->dev, sgt, direction,
+			  DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static void tegra_vpr_recycle(struct tegra_vpr *vpr)
+{
+	unsigned int i;
+	int err;
+
+	/*
+	 * Walk the list of chunks in reverse order and check if they can be
+	 * deactivated.
+	 */
+	for (i = 0; i < vpr->num_chunks; i++) {
+		unsigned int index = vpr->num_chunks - i - 1;
+		struct tegra_vpr_chunk *chunk = &vpr->chunks[index];
+
+		/*
+		 * Stop at any chunk that has remaining buffers. We cannot
+		 * deactivate any chunks at lower addresses because the
+		 * protected region needs to remain contiguous. Technically we
+		 * could shrink from top and bottom, but for the sake of
+		 * simplicity we'll only shrink from the top for now.
+		 */
+		if (!list_empty(&chunk->buffers))
+			break;
+
+		err = tegra_vpr_chunk_deactivate(chunk);
+		if (err < 0)
+			pr_err("failed to deactivate chunk\n");
+	}
+}
+
+static void tegra_vpr_release(struct dma_buf *buf)
+{
+	struct tegra_vpr_buffer *buffer = buf->priv;
+	struct tegra_vpr_chunk *chunk = buffer->chunk;
+	struct tegra_vpr *vpr = chunk->vpr;
+
+	mutex_lock(&vpr->lock);
+
+	tegra_vpr_chunk_release(chunk, buffer);
+	tegra_vpr_recycle(vpr);
+
+	mutex_unlock(&vpr->lock);
+}
+
+/*
+ * Prohibit userspace mapping because the CPU cannot access this memory
+ * anyway.
+ */
+static int tegra_vpr_begin_cpu_access(struct dma_buf *buf,
+				      enum dma_data_direction direction)
+{
+	return -EPERM;
+}
+
+static int tegra_vpr_end_cpu_access(struct dma_buf *buf,
+				    enum dma_data_direction direction)
+{
+	return -EPERM;
+}
+
+static int tegra_vpr_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
+{
+	return -EPERM;
+}
+
+static const struct dma_buf_ops tegra_vpr_buf_ops = {
+	.attach = tegra_vpr_attach,
+	.detach = tegra_vpr_detach,
+	.map_dma_buf = tegra_vpr_map_dma_buf,
+	.unmap_dma_buf = tegra_vpr_unmap_dma_buf,
+	.release = tegra_vpr_release,
+	.begin_cpu_access = tegra_vpr_begin_cpu_access,
+	.end_cpu_access = tegra_vpr_end_cpu_access,
+	.mmap = tegra_vpr_mmap,
+};
+
+static struct dma_buf *tegra_vpr_allocate(struct dma_heap *heap,
+					  unsigned long len, u32 fd_flags,
+					  u64 heap_flags)
+{
+	struct tegra_vpr *vpr = dma_heap_get_drvdata(heap);
+	DEFINE_DMA_BUF_EXPORT_INFO(export);
+	struct tegra_vpr_buffer *buffer;
+	struct dma_buf *buf;
+	unsigned int i;
+
+	mutex_lock(&vpr->lock);
+
+	for (i = 0; i < vpr->num_chunks; i++) {
+		struct tegra_vpr_chunk *chunk = &vpr->chunks[i];
+		size_t size = ALIGN(len, vpr->align);
+
+		buffer = tegra_vpr_chunk_allocate(chunk, size);
+		if (IS_ERR(buffer)) {
+			/* try the next chunk if the current one is exhausted */
+			if (PTR_ERR(buffer) == -ENOSPC)
+				continue;
+
+			mutex_unlock(&vpr->lock);
+			return ERR_CAST(buffer);
+		}
+
+		/*
+		 * If a valid buffer was allocated, wrap it in a dma_buf and
+		 * return it.
+		 */
+		if (buffer) {
+			export.exp_name = dma_heap_get_name(heap);
+			export.ops = &tegra_vpr_buf_ops;
+			export.size = buffer->size;
+			export.flags = fd_flags;
+			export.priv = buffer;
+
+			buf = dma_buf_export(&export);
+			if (IS_ERR(buf)) {
+				tegra_vpr_chunk_release(chunk, buffer);
+				return ERR_CAST(buf);
+			}
+
+			mutex_unlock(&vpr->lock);
+			return buf;
+		}
+	}
+
+	mutex_unlock(&vpr->lock);
+
+	/*
+	 * If we get here, none of the chunks could allocate a buffer, so
+	 * there's nothing else we can do.
+	 */
+	return ERR_PTR(-ENOMEM);
+}
+
+static int tegra_vpr_debugfs_show(struct seq_file *s, struct dma_heap *heap)
+{
+	struct tegra_vpr *vpr = dma_heap_get_drvdata(heap);
+	phys_addr_t limit = vpr->base + vpr->size;
+	unsigned int i;
+	char buf[16];
+
+	string_get_size(vpr->size, 1, STRING_UNITS_2, buf, sizeof(buf));
+	seq_printf(s, "%pap-%pap (%s)\n", &vpr->base, &limit, buf);
+
+	for (i = 0; i < vpr->num_chunks; i++) {
+		const struct tegra_vpr_chunk *chunk = &vpr->chunks[i];
+		struct tegra_vpr_buffer *buffer;
+
+		string_get_size(chunk->size, 1, STRING_UNITS_2, buf,
+				sizeof(buf));
+		seq_printf(s, "  %pap-%pap (%s)\n", &chunk->start,
+			   &chunk->limit, buf);
+
+		list_for_each_entry(buffer, &chunk->buffers, list) {
+			string_get_size(buffer->size, 1, STRING_UNITS_2, buf,
+					sizeof(buf));
+			seq_printf(s, "    %pap-%pap (%s)\n", &buffer->start,
+				   &buffer->limit, buf);
+		}
+	}
+
+	return 0;
+}
+
+static const struct dma_heap_ops tegra_vpr_heap_ops = {
+	.allocate = tegra_vpr_allocate,
+	.show = tegra_vpr_debugfs_show,
+};
+
+static int __init tegra_vpr_add_heap(struct reserved_mem *rmem,
+				     struct device_node *np)
+{
+	struct dma_heap_export_info info = {};
+	phys_addr_t start, limit;
+	struct dma_heap *heap;
+	struct tegra_vpr *vpr;
+	unsigned int order, i;
+	size_t max_size;
+	int err;
+
+	vpr = kzalloc(sizeof(*vpr), GFP_KERNEL);
+	if (!vpr) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	INIT_LIST_HEAD(&vpr->devices);
+	vpr->use_freezer = true;
+	vpr->dev_node = np;
+	vpr->align = SZ_1M;
+	vpr->base = rmem->base;
+	vpr->size = rmem->size;
+	vpr->num_chunks = 4;
+
+	max_size = PAGE_SIZE << (get_order(vpr->size) - ilog2(vpr->num_chunks));
+	order = get_order(vpr->align);
+
+	vpr->chunks = kcalloc(vpr->num_chunks, sizeof(*vpr->chunks),
+			      GFP_KERNEL);
+	if (!vpr) {
+		err = -ENOMEM;
+		goto free;
+	}
+
+	/*
+	 * Allocate CMA areas for VPR. All areas will be roughtly the same
+	 * size, with the last area taking up the rest.
+	 */
+	start = vpr->base;
+	limit = vpr->base + vpr->size;
+
+	pr_debug("VPR: %pap-%pap (%u chunks, %lu MiB)\n", &start, &limit,
+		 vpr->num_chunks, (unsigned long)vpr->size / 1024 / 1024);
+
+	for (i = 0; i < vpr->num_chunks; i++) {
+		size_t size = limit - start;
+		phys_addr_t end;
+
+		size = min_t(size_t, size, max_size);
+		end = start + size - 1;
+
+		err = tegra_vpr_chunk_init(vpr, &vpr->chunks[i], start, size,
+					   order, rmem->name);
+		if (err < 0) {
+			pr_err("failed to create VPR chunk: %d\n", err);
+			goto free;
+		}
+
+		pr_debug("  %2u: %pap-%pap (%lu MiB)\n", i, &start, &end,
+			 size / 1024 / 1024);
+		start += size;
+	}
+
+	info.name = vpr->dev_node->name;
+	info.ops = &tegra_vpr_heap_ops;
+	info.priv = vpr;
+
+	heap = dma_heap_add(&info);
+	if (IS_ERR(heap)) {
+		err = PTR_ERR(heap);
+		goto cma_free;
+	}
+
+	rmem->priv = heap;
+
+	return 0;
+
+cma_free:
+	while (i--)
+		tegra_vpr_chunk_free(&vpr->chunks[i]);
+free:
+	kfree(vpr->chunks);
+	kfree(vpr);
+out:
+	return err;
+}
+
+static int __init tegra_vpr_init(void)
+{
+	const char *compatible = "nvidia,tegra-video-protection-region";
+	struct device_node *parent;
+	struct reserved_mem *rmem;
+	int err;
+
+	parent = of_find_node_by_path("/reserved-memory");
+	if (!parent)
+		return 0;
+
+	for_each_child_of_node_scoped(parent, child) {
+		if (!of_device_is_compatible(child, compatible))
+			continue;
+
+		rmem = of_reserved_mem_lookup(child);
+		if (!rmem)
+			continue;
+
+		err = tegra_vpr_add_heap(rmem, child);
+		if (err < 0)
+			pr_err("failed to add VPR heap for %pOF: %d\n", child,
+			       err);
+
+		/* only a single VPR heap is supported */
+		break;
+	}
+
+	return 0;
+}
+module_init(tegra_vpr_init);
+
+static int tegra_vpr_device_init(struct reserved_mem *rmem, struct device *dev)
+{
+	struct dma_heap *heap = rmem->priv;
+	struct tegra_vpr *vpr = dma_heap_get_drvdata(heap);
+	struct tegra_vpr_device *node;
+	int err = 0;
+
+	if (!dev->driver->pm->freeze || !dev->driver->pm->thaw)
+		return -EINVAL;
+
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	if (!node) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	INIT_LIST_HEAD(&node->node);
+	node->dev = dev;
+
+	list_add_tail(&node->node, &vpr->devices);
+
+out:
+	return err;
+}
+
+static void tegra_vpr_device_release(struct reserved_mem *rmem,
+				     struct device *dev)
+{
+	struct dma_heap *heap = rmem->priv;
+	struct tegra_vpr *vpr = dma_heap_get_drvdata(heap);
+	struct tegra_vpr_device *node, *tmp;
+
+	list_for_each_entry_safe(node, tmp, &vpr->devices, node) {
+		if (node->dev == dev) {
+			list_del(&node->node);
+			kfree(node);
+		}
+	}
+}
+
+static const struct reserved_mem_ops tegra_vpr_ops = {
+	.device_init = tegra_vpr_device_init,
+	.device_release = tegra_vpr_device_release,
+};
+
+static int tegra_vpr_rmem_init(struct reserved_mem *rmem)
+{
+	rmem->ops = &tegra_vpr_ops;
+
+	return 0;
+}
+RESERVEDMEM_OF_DECLARE(tegra_vpr, "nvidia,tegra-video-protection-region",
+		       tegra_vpr_rmem_init);
+
+MODULE_DESCRIPTION("NVIDIA Tegra Video-Protection-Region DMA-BUF heap driver");
+MODULE_LICENSE("GPL");
diff --git a/include/trace/events/tegra_vpr.h b/include/trace/events/tegra_vpr.h
new file mode 100644
index 000000000000..f8ceb17679fe
--- /dev/null
+++ b/include/trace/events/tegra_vpr.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#if !defined(_TRACE_TEGRA_VPR_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_TEGRA_VPR_H
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM tegra_vpr
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(tegra_vpr_chunk_activate,
+	TP_PROTO(phys_addr_t start, phys_addr_t limit),
+	TP_ARGS(start, limit),
+	TP_STRUCT__entry(
+		__field(phys_addr_t, start)
+		__field(phys_addr_t, limit)
+	),
+	TP_fast_assign(
+		__entry->start = start;
+		__entry->limit = limit;
+	),
+	TP_printk("%pap-%pap", &__entry->start,
+		  &__entry->limit)
+);
+
+TRACE_EVENT(tegra_vpr_chunk_deactivate,
+	TP_PROTO(phys_addr_t start, phys_addr_t limit),
+	TP_ARGS(start, limit),
+	TP_STRUCT__entry(
+		__field(phys_addr_t, start)
+		__field(phys_addr_t, limit)
+	),
+	TP_fast_assign(
+		__entry->start = start;
+		__entry->limit = limit;
+	),
+	TP_printk("%pap-%pap", &__entry->start,
+		  &__entry->limit)
+);
+
+TRACE_EVENT(tegra_vpr_set,
+	TP_PROTO(phys_addr_t base, phys_addr_t size),
+	TP_ARGS(base, size),
+	TP_STRUCT__entry(
+		__field(phys_addr_t, start)
+		__field(phys_addr_t, limit)
+	),
+	TP_fast_assign(
+		__entry->start = base;
+		__entry->limit = base + size;
+	),
+	TP_printk("%pap-%pap", &__entry->start, &__entry->limit)
+);
+
+#endif /* _TRACE_TEGRA_VPR_H */
+
+#include <trace/define_trace.h>
-- 
2.50.0

