Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22427BF0F0A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC7D10E42C;
	Mon, 20 Oct 2025 11:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kOmNS5bn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60EE10E426;
 Mon, 20 Oct 2025 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9JgYi8qUTRzXFtuM0qYjPjxyadAWgx2CoCdWPzKtF3s=; b=kOmNS5bnXEKFskWZjME07VgUQp
 iLEgpZBoaKxZs49je9l94sm7Q3mzipBanvGwohxfXfq5iy0Orbxi1Iv62ZHZjGciG5oIVQ09+pIMI
 1nifYg4h3oShC3Yqr9QSWfOPH52iDtUtA0jYdnOFzlkPB+4RQkHjf8VwLhPIxUpd1Z3f/HTI9DlvH
 jpWRAAbZgle3BhzWTiwSZTVje0cpkvfkUrM4NQvcY2m3wurcp6xwMWHAaEaelQsgJzqUvTlsbc5lr
 dcf7Hp6MLoj6TTOvt7fkNfOvf6LiIz6qYIyMsvkRYDqiiML6+1WTtTQaHwWzM+yI0MPlQmVSC18GB
 //3eJlyQ==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vAoSv-00C5bK-Vg; Mon, 20 Oct 2025 13:54:18 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH v5 5/6] drm/amdgpu: Configure max beneficial TTM pool
 allocation order
Date: Mon, 20 Oct 2025 12:54:10 +0100
Message-ID: <20251020115411.36818-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
References: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Let the TTM pool allocator know that we can afford for it to expend less
effort for satisfying contiguous allocations larger than 2MiB. The latter
is the maximum relevant PTE entry size and the driver and hardware are
happy to get larger blocks only opportunistically.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com> # v1
---
v2:
 * Rebase for rename and move of flags to alloc_flags / TTM_ALLOCATION_.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 7b144ddea268..8e82163981f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1837,7 +1837,7 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
 	for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
 		ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
 			      adev->gmc.mem_partitions[i].numa.node,
-			      0);
+			      TTM_ALLOCATION_POOL_BENEFICIAL_ORDER(get_order(SZ_2M)));
 	}
 	return 0;
 }
@@ -1933,7 +1933,8 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 			       (adev->need_swiotlb ?
 				TTM_ALLOCATION_POOL_USE_DMA_ALLOC : 0) |
 			       (dma_addressing_limited(adev->dev) ?
-				TTM_ALLOCATION_POOL_USE_DMA32 : 0));
+				TTM_ALLOCATION_POOL_USE_DMA32 : 0) |
+			       TTM_ALLOCATION_POOL_BENEFICIAL_ORDER(get_order(SZ_2M)));
 	if (r) {
 		dev_err(adev->dev,
 			"failed initializing buffer object driver(%d).\n", r);
-- 
2.48.0

