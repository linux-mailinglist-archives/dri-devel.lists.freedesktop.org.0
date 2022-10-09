Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 994395F9434
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE3B10E59B;
	Sun,  9 Oct 2022 23:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4998B10E599;
 Sun,  9 Oct 2022 23:53:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C43CC60CF5;
 Sun,  9 Oct 2022 23:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9CAC433D7;
 Sun,  9 Oct 2022 23:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359617;
 bh=Syyww4aE/A9q2YbgecUDjN7WhpYEeXohYESQpJiSY+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t/GjbnOj15vDcLlMONesQcQh3wA3K2sFz39R/OlzzT2ZXiDOdHDuKsRln1xgbVoxW
 30pISaVwuJXQ8mL4lZ0fjkAUKPlB9pnGOMCeHL+l70SL9x+crxhja8QpEwi9kgMbjd
 mwSuT5zz1D8fMKP2CYM+mDM888CsVfT8maXz4hxhypnZaEehpchjiw4PS2O4cKwRUt
 G07t82mNaDmCj/W1nfwlZCh9/9U5s8R6BKaQXu5F16sewbs7RiqXr1/o0Vm0o80itf
 GeWzSt3TLpstyPexTh3Z+DXRo/oR1b0Kj/4+R3NRqHG6ANbompPjjJPcVXmlfzLx1P
 NGnn2QeJJj3yQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 25/36] drm/amdgpu: SDMA update use unlocked
 iterator
Date: Sun,  9 Oct 2022 19:52:11 -0400
Message-Id: <20221009235222.1230786-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235222.1230786-1-sashal@kernel.org>
References: <20221009235222.1230786-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 3913f0179ba366f7d7d160c506ce00de1602bbc4 ]

SDMA update page table may be called from unlocked context, this
generate below warning. Use unlocked iterator to handle this case.

WARNING: CPU: 0 PID: 1475 at
drivers/dma-buf/dma-resv.c:483 dma_resv_iter_next
Call Trace:
 dma_resv_iter_first+0x43/0xa0
 amdgpu_vm_sdma_update+0x69/0x2d0 [amdgpu]
 amdgpu_vm_ptes_update+0x29c/0x870 [amdgpu]
 amdgpu_vm_update_range+0x2f6/0x6c0 [amdgpu]
 svm_range_unmap_from_gpus+0x115/0x300 [amdgpu]
 svm_range_cpu_invalidate_pagetables+0x510/0x5e0 [amdgpu]
 __mmu_notifier_invalidate_range_start+0x1d3/0x230
 unmap_vmas+0x140/0x150
 unmap_region+0xa8/0x110

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Suggested-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 1fd3cbca20a2..718db7d98e5a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -211,12 +211,15 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 	int r;
 
 	/* Wait for PD/PT moves to be completed */
-	dma_resv_for_each_fence(&cursor, bo->tbo.base.resv,
-				DMA_RESV_USAGE_KERNEL, fence) {
+	dma_resv_iter_begin(&cursor, bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		r = amdgpu_sync_fence(&p->job->sync, fence);
-		if (r)
+		if (r) {
+			dma_resv_iter_end(&cursor);
 			return r;
+		}
 	}
+	dma_resv_iter_end(&cursor);
 
 	do {
 		ndw = p->num_dw_left;
-- 
2.35.1

