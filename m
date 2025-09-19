Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14834B899EB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ECB10EA0E;
	Fri, 19 Sep 2025 13:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mFtgYd1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B44410EA0B;
 Fri, 19 Sep 2025 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5VWN8O+OfR4eWJykP0zJsMBzfdFAJifYXSylxE2abmw=; b=mFtgYd1b6yNhElINbKC0eRq9uL
 grmQtEDZ5LQrUyToElbORNvkK9JnToJReUW+putZT9ntG/Njo1bPmSBtdLFrjyNTi6s0zddFOTziM
 FkP5xfjpPJkqLwOfVSJjO6c0IIlM5V2pMVED5MJvEUhWw4FyjJtLQcF+5qdqL4KZjzUsWgCXueHjC
 wXFY36qevU/lvr88eRTzKR+1+wJvGojAuMnw9nui2MPDiOwdsOGci6kHRFe5InM0i6hlC2KBMLp0C
 fLRnGZvaiOPeYXCeN8KKby6OxdjWsji2xMZOc4kApc6F9KLK4i5UHxvvJCilrQKLALXrSZ8IL2XzZ
 ovv1lSkg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzati-00E6IO-NB; Fri, 19 Sep 2025 15:11:34 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [RFC 2/2] drm/amdgpu: Configure max beneficial TTM pool allocation
 order
Date: Fri, 19 Sep 2025 14:11:27 +0100
Message-ID: <20250919131127.90932-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250919131127.90932-1-tvrtko.ursulin@igalia.com>
References: <20250919131127.90932-1-tvrtko.ursulin@igalia.com>
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
Cc: Christian König <christian.koenig@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 428265046815..7d7b91e07a47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1812,6 +1812,9 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
 {
 	int i;
 
+	ttm_pool_set_max_beneficial_order(&adev->mman.bdev.pool,
+					  get_order(2 * SZ_1M));
+
 	if (!adev->gmc.is_app_apu || !adev->gmc.num_mem_partitions)
 		return 0;
 
@@ -1825,6 +1828,8 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
 		ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
 			      adev->gmc.mem_partitions[i].numa.node,
 			      false, false);
+		ttm_pool_set_max_beneficial_order(&adev->mman.ttm_pools[i],
+						  get_order(2 * SZ_1M));
 	}
 	return 0;
 }
-- 
2.48.0

