Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F3341EF90
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D1F6ED09;
	Fri,  1 Oct 2021 14:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700606ECFF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:34:36 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CD7811F457AB;
 Fri,  1 Oct 2021 15:34:34 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 2/5] [RFC]iommu/io-pgtable-arm: Take the DEVONLY flag into
 account on ARM_MALI_LPAE
Date: Fri,  1 Oct 2021 16:34:24 +0200
Message-Id: <20211001143427.1564786-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211001143427.1564786-1-boris.brezillon@collabora.com>
References: <20211001143427.1564786-1-boris.brezillon@collabora.com>
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

Restrict the shareability domain when mapping buffers that are
GPU-visible only.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Flagged RFC because I'm not sure adding a new flag is the right
way to convey the 'dev-private buffer' information.
---
 drivers/iommu/io-pgtable-arm.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index dd9e47189d0d..6ac3defb9ae1 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -450,16 +450,25 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
 	}
 
-	/*
-	 * Also Mali has its own notions of shareability wherein its Inner
-	 * domain covers the cores within the GPU, and its Outer domain is
-	 * "outside the GPU" (i.e. either the Inner or System domain in CPU
-	 * terms, depending on coherency).
-	 */
-	if (prot & IOMMU_CACHE && data->iop.fmt != ARM_MALI_LPAE)
+	if (data->iop.fmt == ARM_MALI_LPAE) {
+		/*
+		 * Mali has its own notions of shareability wherein its Inner
+		 * domain covers the cores within the GPU, and its Outer domain
+		 * is "outside the GPU" (i.e. either the Inner or System domain
+		 * in CPU terms, depending on coherency).
+		 * If the mapping is only device-visible, we can use the Inner
+		 * domain, otherwise we need to stick to Outer domain
+		 * shareability.
+		 */
+		if (prot & IOMMU_DEVONLY)
+			pte |= ARM_LPAE_PTE_SH_IS;
+		else
+			pte |= ARM_LPAE_PTE_SH_OS;
+	} else if (prot & IOMMU_CACHE) {
 		pte |= ARM_LPAE_PTE_SH_IS;
-	else
+	} else {
 		pte |= ARM_LPAE_PTE_SH_OS;
+	}
 
 	if (prot & IOMMU_NOEXEC)
 		pte |= ARM_LPAE_PTE_XN;
-- 
2.31.1

