Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282A1BD423A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 17:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574F710E490;
	Mon, 13 Oct 2025 15:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IRks+DWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9BF10E490
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 15:26:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C9C9861DF2;
 Mon, 13 Oct 2025 15:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C88C4CEE7;
 Mon, 13 Oct 2025 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760369203;
 bh=/sqGzUlY70Md3kn/uqwkAy7zvckyzzhf3i23p85lfsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IRks+DWi1WAtZfZO4IdGAt75DsITSMamDbEAFdfZYPrtzEgNBjUnPFlFQdVlW2eme
 bCe5WYUJahxlCezrgNA/V97lguT2tGgDGex42ykf7U8294Yuo+cPUh07NHKpS8eOvq
 qz2awlV1qvXCCo7UVeewt3Sn6yV9nlx4UHHFNw5+M2nWz5h37jrlcFm+wwumAiJgmE
 aRDsEH4O/nJZs0YKTzRkFNHX2Jo3jUhIgtI/lUiGINgbX4J+UnD1sGivrOYVCnsMAz
 2JA0D7zRhqi2g4AQ14sYToHYl4vYxJDocUvA9r+b34jXBBMx3+uOkreQ/+cfbh8umo
 xy5t3Z2knqK4w==
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v5 2/9] PCI/P2PDMA: Simplify bus address mapping API
Date: Mon, 13 Oct 2025 18:26:04 +0300
Message-ID: <a228e188e45f40f0b4e754d37f5ea7f9d92bd0c2.1760368250.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760368250.git.leon@kernel.org>
References: <cover.1760368250.git.leon@kernel.org>
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

From: Leon Romanovsky <leonro@nvidia.com>

Update the pci_p2pdma_bus_addr_map() function to take a direct pointer
to the p2pdma_provider structure instead of the pci_p2pdma_map_state.
This simplifies the API by removing the need for callers to extract
the provider from the state structure.

The change updates all callers across the kernel (block layer, IOMMU,
DMA direct, and HMM) to pass the provider pointer directly, making
the code more explicit and reducing unnecessary indirection. This
also removes the runtime warning check since callers now have direct
control over which provider they use.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 block/blk-mq-dma.c         | 2 +-
 drivers/iommu/dma-iommu.c  | 4 ++--
 include/linux/pci-p2pdma.h | 7 +++----
 kernel/dma/direct.c        | 4 ++--
 mm/hmm.c                   | 2 +-
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/block/blk-mq-dma.c b/block/blk-mq-dma.c
index 9495b78b6fd3..badef1d925b2 100644
--- a/block/blk-mq-dma.c
+++ b/block/blk-mq-dma.c
@@ -85,7 +85,7 @@ static inline bool blk_can_dma_map_iova(struct request *req,
 
 static bool blk_dma_map_bus(struct blk_dma_iter *iter, struct phys_vec *vec)
 {
-	iter->addr = pci_p2pdma_bus_addr_map(&iter->p2pdma, vec->paddr);
+	iter->addr = pci_p2pdma_bus_addr_map(iter->p2pdma.mem, vec->paddr);
 	iter->len = vec->len;
 	return true;
 }
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7944a3af4545..e52d19d2e833 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1439,8 +1439,8 @@ int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 			 * as a bus address, __finalise_sg() will copy the dma
 			 * address into the output segment.
 			 */
-			s->dma_address = pci_p2pdma_bus_addr_map(&p2pdma_state,
-						sg_phys(s));
+			s->dma_address = pci_p2pdma_bus_addr_map(
+				p2pdma_state.mem, sg_phys(s));
 			sg_dma_len(s) = sg->length;
 			sg_dma_mark_bus_address(s);
 			continue;
diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
index 1400f3ad4299..9516ef97b17a 100644
--- a/include/linux/pci-p2pdma.h
+++ b/include/linux/pci-p2pdma.h
@@ -181,16 +181,15 @@ pci_p2pdma_state(struct pci_p2pdma_map_state *state, struct device *dev,
 /**
  * pci_p2pdma_bus_addr_map - Translate a physical address to a bus address
  *			     for a PCI_P2PDMA_MAP_BUS_ADDR transfer.
- * @state:	P2P state structure
+ * @provider:	P2P provider structure
  * @paddr:	physical address to map
  *
  * Map a physically contiguous PCI_P2PDMA_MAP_BUS_ADDR transfer.
  */
 static inline dma_addr_t
-pci_p2pdma_bus_addr_map(struct pci_p2pdma_map_state *state, phys_addr_t paddr)
+pci_p2pdma_bus_addr_map(struct p2pdma_provider *provider, phys_addr_t paddr)
 {
-	WARN_ON_ONCE(state->map != PCI_P2PDMA_MAP_BUS_ADDR);
-	return paddr + state->mem->bus_offset;
+	return paddr + provider->bus_offset;
 }
 
 #endif /* _LINUX_PCI_P2P_H */
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 1f9ee9759426..d8b3dfc598b2 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -479,8 +479,8 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 			}
 			break;
 		case PCI_P2PDMA_MAP_BUS_ADDR:
-			sg->dma_address = pci_p2pdma_bus_addr_map(&p2pdma_state,
-					sg_phys(sg));
+			sg->dma_address = pci_p2pdma_bus_addr_map(
+				p2pdma_state.mem, sg_phys(sg));
 			sg_dma_mark_bus_address(sg);
 			continue;
 		default:
diff --git a/mm/hmm.c b/mm/hmm.c
index 87562914670a..9bf0b831a029 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -811,7 +811,7 @@ dma_addr_t hmm_dma_map_pfn(struct device *dev, struct hmm_dma_map *map,
 		break;
 	case PCI_P2PDMA_MAP_BUS_ADDR:
 		pfns[idx] |= HMM_PFN_P2PDMA_BUS | HMM_PFN_DMA_MAPPED;
-		return pci_p2pdma_bus_addr_map(p2pdma_state, paddr);
+		return pci_p2pdma_bus_addr_map(p2pdma_state->mem, paddr);
 	default:
 		return DMA_MAPPING_ERROR;
 	}
-- 
2.51.0

