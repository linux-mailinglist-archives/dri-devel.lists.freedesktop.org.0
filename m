Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CCF47ED24
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A372510E411;
	Fri, 24 Dec 2021 08:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BE510E30C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 11:12:39 +0000 (UTC)
Received: by air.basealt.ru (Postfix, from userid 490)
 id 3A349589823; Thu, 23 Dec 2021 11:06:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
 sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.1
Received: from asheplyakov-rocket.smb.basealt.ru (unknown [193.43.9.4])
 by air.basealt.ru (Postfix) with ESMTPSA id 261E4589548;
 Thu, 23 Dec 2021 11:06:55 +0000 (UTC)
From: asheplyakov@basealt.ru
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/panfrost: mmu: improved memory attributes
Date: Thu, 23 Dec 2021 15:06:15 +0400
Message-Id: <20211223110616.2589851-2-asheplyakov@basealt.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211223110616.2589851-1-asheplyakov@basealt.ru>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>,
 Steven Price <steven.price@arm.com>,
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexey Sheplyakov <asheplyakov@basealt.ru>

T62x/T60x GPUs are known to not work with panfrost as of now.
One of the reasons is wrong/incomplete memory attributes which
the panfrost driver sets in the page tables:

- MEMATTR_IMP_DEF should be 0x48ULL, not 0x88ULL.
  0x88ULL is MEMATTR_OUTER_IMP_DEF
- MEMATTR_FORCE_CACHE_ALL and MEMATTR_OUTER_WA are missing.

T72x and newer GPUs work just fine with such incomplete/wrong memory
attributes. However T62x are quite picky and quickly lock up.

To avoid the problem set the same memory attributes (in LPAE page
tables) as mali_kbase.

The patch has been tested (for regressions) with T860 GPU (rk3399 SoC).
At the first glance (using GNOME desktop, running glmark) it does
not cause any changes for this GPU.

Note: this patch is necessary, but *not* enough to get panfrost
working with T62x

Signed-off-by: Alexey Sheplyakov <asheplyakov@basealt.ru>
Signed-off-by: Vadim V. Vlasov <vadim.vlasov@elpitech.ru>

Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Vadim V. Vlasov <vadim.vlasov@elpitech.ru>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  3 ---
 drivers/iommu/io-pgtable-arm.c          | 16 ++++++++++++----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 39562f2d11a4..2f4f8a17bc82 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -133,9 +133,6 @@ static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_m
 	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
 	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
 
-	/* Need to revisit mem attrs.
-	 * NC is the default, Mali driver is inner WT.
-	 */
 	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
 	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
 
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index dd9e47189d0d..15b39c337e20 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -122,13 +122,17 @@
 #define ARM_LPAE_MAIR_ATTR_IDX_CACHE	1
 #define ARM_LPAE_MAIR_ATTR_IDX_DEV	2
 #define ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE	3
+#define ARM_LPAE_MAIR_ATTR_IDX_OUTER_WA 4
 
 #define ARM_MALI_LPAE_TTBR_ADRMODE_TABLE (3u << 0)
 #define ARM_MALI_LPAE_TTBR_READ_INNER	BIT(2)
 #define ARM_MALI_LPAE_TTBR_SHARE_OUTER	BIT(4)
 
-#define ARM_MALI_LPAE_MEMATTR_IMP_DEF	0x88ULL
-#define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x8DULL
+#define ARM_MALI_LPAE_MEMATTR_IMP_DEF	0x48ULL
+#define ARM_MALI_LPAE_MEMATTR_FORCE_CACHE_ALL 0x4FULL
+#define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x4DULL
+#define ARM_MALI_LPAE_MEMATTR_OUTER_IMP_DEF 0x88ULL
+#define ARM_MALI_LPAE_MEMATTR_OUTER_WA 0x8DULL
 
 #define APPLE_DART_PTE_PROT_NO_WRITE (1<<7)
 #define APPLE_DART_PTE_PROT_NO_READ (1<<8)
@@ -1080,10 +1084,14 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	cfg->arm_mali_lpae_cfg.memattr =
 		(ARM_MALI_LPAE_MEMATTR_IMP_DEF
 		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_NC)) |
+		(ARM_MALI_LPAE_MEMATTR_FORCE_CACHE_ALL
+		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
 		(ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC
 		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
-		(ARM_MALI_LPAE_MEMATTR_IMP_DEF
-		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV));
+		(ARM_MALI_LPAE_MEMATTR_OUTER_IMP_DEF
+		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV)) |
+		(ARM_MALI_LPAE_MEMATTR_OUTER_WA
+		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_OUTER_WA));
 
 	data->pgd = __arm_lpae_alloc_pages(ARM_LPAE_PGD_SIZE(data), GFP_KERNEL,
 					   cfg);
-- 
2.30.2

