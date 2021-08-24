Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFF83F6734
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921456E0A5;
	Tue, 24 Aug 2021 17:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1FC6E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:31:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9C5EA1F42820;
 Tue, 24 Aug 2021 18:30:59 +0100 (BST)
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 2/4] drm/panfrost: Use u64 for size in lock_region
Date: Tue, 24 Aug 2021 13:30:26 -0400
Message-Id: <20210824173028.7528-3-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
References: <20210824173028.7528-1-alyssa.rosenzweig@collabora.com>
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

Mali virtual addresses are 48-bit. Use a u64 instead of size_t to ensure
we can express the "lock everything" condition as ~0ULL without
overflow. This code was silently broken on any platform where a size_t
is less than 48-bits; in particular, it was broken on 32-bit armv7
platforms which remain in use with panfrost. (Mainly RK3288)

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Suggested-by: Rob Herring <robh@kernel.org>
Tested-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index f6e02d0392f4..3a795273e505 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -58,7 +58,7 @@ static int write_cmd(struct panfrost_device *pfdev, u32 as_nr, u32 cmd)
 }
 
 static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
-			u64 iova, size_t size)
+			u64 iova, u64 size)
 {
 	u8 region_width;
 	u64 region = iova & PAGE_MASK;
@@ -78,7 +78,7 @@ static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
 
 
 static int mmu_hw_do_operation_locked(struct panfrost_device *pfdev, int as_nr,
-				      u64 iova, size_t size, u32 op)
+				      u64 iova, u64 size, u32 op)
 {
 	if (as_nr < 0)
 		return 0;
@@ -95,7 +95,7 @@ static int mmu_hw_do_operation_locked(struct panfrost_device *pfdev, int as_nr,
 
 static int mmu_hw_do_operation(struct panfrost_device *pfdev,
 			       struct panfrost_mmu *mmu,
-			       u64 iova, size_t size, u32 op)
+			       u64 iova, u64 size, u32 op)
 {
 	int ret;
 
@@ -112,7 +112,7 @@ static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_m
 	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
 	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
 
-	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0UL, AS_COMMAND_FLUSH_MEM);
+	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
 
 	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), transtab & 0xffffffffUL);
 	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), transtab >> 32);
@@ -128,7 +128,7 @@ static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_m
 
 static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
 {
-	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0UL, AS_COMMAND_FLUSH_MEM);
+	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
 
 	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), 0);
 	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), 0);
@@ -242,7 +242,7 @@ static size_t get_pgsize(u64 addr, size_t size)
 
 static void panfrost_mmu_flush_range(struct panfrost_device *pfdev,
 				     struct panfrost_mmu *mmu,
-				     u64 iova, size_t size)
+				     u64 iova, u64 size)
 {
 	if (mmu->as < 0)
 		return;
-- 
2.30.2

