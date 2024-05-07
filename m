Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892A88BF003
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 00:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E80E1126F6;
	Tue,  7 May 2024 22:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DJi+IDoP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0781126FB;
 Tue,  7 May 2024 22:57:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 99FB5619FA;
 Tue,  7 May 2024 22:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10017C2BBFC;
 Tue,  7 May 2024 22:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715122676;
 bh=45Ctv6QKcT69IleXOGmx/lkPXJ7GAVZJKpVT221zneY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DJi+IDoPvzymqz6B8nXnSWPtU5Bskg8mxETGeQSBVlxWihdZx2eG5ZPl0oG0N6uHw
 LshG6mQjZ+txRUefyrFdJ5Q3Hrv4fWYcy1YcPZPv9IU7Y2meqRmT7lz479/vKiBzzr
 IrWE70Q27tmp4xeZJwz1Hz0X7gNy6mGM+ZlRst5b2/1n2sLHh2YJnlvTgx/KqW8CuJ
 2pEiHoEOvpmuQN8ZQLF6KQRnZXKY0JvZGYR1emCd38z5+4I5W+IDShze9iB7aGaF32
 L2Bb649/jLSL42ejAID2mWvQ0fXwDhkw0byPOS6t+Deb9AidsPJo2w+mBpqzrY6wHk
 9XXzZpiq0CcZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mukul Joshi <mukul.joshi@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 12/23] drm/amdkfd: Add VRAM accounting for SVM
 migration
Date: Tue,  7 May 2024 18:56:38 -0400
Message-ID: <20240507225725.390306-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507225725.390306-1-sashal@kernel.org>
References: <20240507225725.390306-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
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

From: Mukul Joshi <mukul.joshi@amd.com>

[ Upstream commit 1e214f7faaf5d842754cd5cfcd76308bfedab3b5 ]

Do VRAM accounting when doing migrations to vram to make sure
there is enough available VRAM and migrating to VRAM doesn't evict
other possible non-unified memory BOs. If migrating to VRAM fails,
driver can fall back to using system memory seamlessly.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 16 +++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     |  2 +-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index bdc01ca9609a7..5c8d81bfce7ab 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -509,10 +509,19 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	start = start_mgr << PAGE_SHIFT;
 	end = (last_mgr + 1) << PAGE_SHIFT;
 
+	r = amdgpu_amdkfd_reserve_mem_limit(node->adev,
+					prange->npages * PAGE_SIZE,
+					KFD_IOC_ALLOC_MEM_FLAGS_VRAM,
+					node->xcp ? node->xcp->id : 0);
+	if (r) {
+		dev_dbg(node->adev->dev, "failed to reserve VRAM, r: %ld\n", r);
+		return -ENOSPC;
+	}
+
 	r = svm_range_vram_node_new(node, prange, true);
 	if (r) {
 		dev_dbg(node->adev->dev, "fail %ld to alloc vram\n", r);
-		return r;
+		goto out;
 	}
 	ttm_res_offset = (start_mgr - prange->start + prange->offset) << PAGE_SHIFT;
 
@@ -545,6 +554,11 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 		svm_range_vram_node_free(prange);
 	}
 
+out:
+	amdgpu_amdkfd_unreserve_mem_limit(node->adev,
+					prange->npages * PAGE_SIZE,
+					KFD_IOC_ALLOC_MEM_FLAGS_VRAM,
+					node->xcp ? node->xcp->id : 0);
 	return r < 0 ? r : 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index c50a0dc9c9c07..33205078202b5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3424,7 +3424,7 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 				mm, KFD_MIGRATE_TRIGGER_PREFETCH);
 	*migrated = !r;
 
-	return r;
+	return 0;
 }
 
 int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence)
-- 
2.43.0

