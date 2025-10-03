Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BAEBB7174
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 15:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EED10E90B;
	Fri,  3 Oct 2025 13:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BiFhSXO/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B1D10E90F;
 Fri,  3 Oct 2025 13:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GL7kFzmCX0tpmIR2VnGR8VDnDgA+UMiizCX42vA9ZiQ=; b=BiFhSXO/WkqY8yCro8rj06hwiz
 G3JvkZ9Zh/xq2ez3Od/gRuNpvjGVyo8tbc9mdIdB7Xe8xD2k40xbeThLAzyG3vcjeKLGJYaQks0Ni
 GWUNOQZjuhZvY5E9DrNH9MMXIQay830XvPkd8rpV251LY6M0PWnwnyh5Wk040LcT26q2hkl6L5Mw/
 5rjx1v/cpIbRuGm6m5HieWWsaPv4U1azmveH10KDXOenh0SObeN7U6t3L1sErrOdP6NLAQf2oLZ8I
 sKmO5mVDvqB/eEM5jySnDSvVb1GOGnoDIlLCVSVSMQ/ntHnWfuOnuMgCcByCgyh7Ybi8jLi+K+8qG
 IiUavCHA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v4gJ1-003ume-KE; Fri, 03 Oct 2025 15:58:43 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [RFC v2 5/5] drm/amdgpu: Configure max beneficial TTM pool allocation
 order
Date: Fri,  3 Oct 2025 14:58:36 +0100
Message-ID: <20251003135836.41116-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
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
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 948c6d0a422b..723b885210a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1837,7 +1837,7 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
 	for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
 		ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
 			      adev->gmc.mem_partitions[i].numa.node,
-			      0);
+			      TTM_POOL_BENEFICIAL_ORDER(get_order(2 * SZ_1M)));
 	}
 	return 0;
 }
@@ -1931,7 +1931,8 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 			       adev_to_drm(adev)->anon_inode->i_mapping,
 			       adev_to_drm(adev)->vma_offset_manager,
 			       (adev->need_swiotlb ? TTM_POOL_USE_DMA_ALLOC : 0) |
-			       (dma_addressing_limited(adev->dev) ? TTM_POOL_USE_DMA32 : 0));
+			       (dma_addressing_limited(adev->dev) ? TTM_POOL_USE_DMA32 : 0) |
+			       TTM_POOL_BENEFICIAL_ORDER(get_order(2 * SZ_1M)));
 	if (r) {
 		dev_err(adev->dev,
 			"failed initializing buffer object driver(%d).\n", r);
-- 
2.48.0

