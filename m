Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5631B0F2BC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 15:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B9010E7BD;
	Wed, 23 Jul 2025 13:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ETK2qZcN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6CD10E7BD
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:02:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8FFAD601F3;
 Wed, 23 Jul 2025 13:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762A9C4CEE7;
 Wed, 23 Jul 2025 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753275720;
 bh=DdEPBcDoyZyAyQmgxVcA/USPwfaH12G0OefCJEr49ic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ETK2qZcN6+sQYJHSkoLVV0k/yH8twcRhKOYJgr93JPgv0nrXxZCzfFwSW1/G62IK+
 dHXoqPt/Wx9t/L3G4sdDyxTDD3f4GLS20xqlO/uiD8S/BJbeMCdXOYPXBGSX5rWv8h
 uU36XgMIC3kZdDlUYy2xEFpyQkWd7Ao9AI7MS+qm7TPCbsSNBulQ2TAtVt47DFfyvb
 2rHJLTEmxms3qV80raVb15Ef5YlYHRpwCIAejwL3MXphMFCzgKfNnc/M/MphZcoMgV
 btntopHEIl6egN2Hxfn87m1H+IhrWppCwky4m3zkIqrXkZG2T894pcTMD+L6pjBS5w
 +ULHryOUF5DNQ==
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: [PATCH 01/10] PCI/P2PDMA: Remove redundant bus_offset from map state
Date: Wed, 23 Jul 2025 16:00:02 +0300
Message-ID: <c1a4acd69e040fc2cc7e552849f4d922f5f66325.1753274085.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753274085.git.leonro@nvidia.com>
References: <cover.1753274085.git.leonro@nvidia.com>
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

Remove the bus_off field from pci_p2pdma_map_state since it duplicates
information already available in the pgmap structure. The bus_offset
is only used in one location (pci_p2pdma_bus_addr_map) and is always
identical to pgmap->bus_offset.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/pci/p2pdma.c       | 1 -
 include/linux/pci-p2pdma.h | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 8d955c25aed36..fe347ed7fd8f4 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -1009,7 +1009,6 @@ void __pci_p2pdma_update_state(struct pci_p2pdma_map_state *state,
 {
 	state->pgmap = page_pgmap(page);
 	state->map = pci_p2pdma_map_type(state->pgmap, dev);
-	state->bus_off = to_p2p_pgmap(state->pgmap)->bus_offset;
 }
 
 /**
diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
index 075c20b161d98..b502fc8b49bf9 100644
--- a/include/linux/pci-p2pdma.h
+++ b/include/linux/pci-p2pdma.h
@@ -146,7 +146,6 @@ enum pci_p2pdma_map_type {
 struct pci_p2pdma_map_state {
 	struct dev_pagemap *pgmap;
 	enum pci_p2pdma_map_type map;
-	u64 bus_off;
 };
 
 /* helper for pci_p2pdma_state(), do not use directly */
@@ -186,7 +185,7 @@ static inline dma_addr_t
 pci_p2pdma_bus_addr_map(struct pci_p2pdma_map_state *state, phys_addr_t paddr)
 {
 	WARN_ON_ONCE(state->map != PCI_P2PDMA_MAP_BUS_ADDR);
-	return paddr + state->bus_off;
+	return paddr + to_p2p_pgmap(state->pgmap)->bus_offsetf;
 }
 
 #endif /* _LINUX_PCI_P2P_H */
-- 
2.50.1

