Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CCD5A060C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3006AD0B41;
	Thu, 25 Aug 2022 01:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411F12A174;
 Thu, 25 Aug 2022 01:36:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C523E61A2D;
 Thu, 25 Aug 2022 01:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1702EC433D7;
 Thu, 25 Aug 2022 01:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391385;
 bh=uZjkReAqjgBhUeIjdkrARoS9pd0nnFeAmO+VjIOj7iU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nU9yMpqzcwLgg6wfzHK9v5wWWkmiNS2POob5lavuIXkZgoJDt2LPu4g8ne7vW/Z46
 Xxf3OVdLPLW+Ck/0JaawgtGE8wxuEWDBPyF5BOspQaHYrIKAvzMsmYyty4tKdHJU15
 REh0hvSKwaa+T589S8q7LUBG+UQ3O6TtBmoLV2p3PuN2PLURYpc1HoK4MHdDa/AiDj
 83mKeHN1RmKw1KMPDYjOkiQogf4hZB/VIPX1of7tHPE2xJEXOkl1MsML1Tich1UM6y
 W2Az9M1R4npCqif/2K+rk/ZMyekJ1jN/uiBlzlWDyDCfIwP88XS7h6i6133FvYd9qG
 2BYWC0p6p5nDg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 25/38] drm/amdgpu: Increase tlb flush timeout for
 sriov
Date: Wed, 24 Aug 2022 21:33:48 -0400
Message-Id: <20220825013401.22096-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Dusica Milinkovic <Dusica.Milinkovic@amd.com>, airlied@linux.ie,
 tao.zhou1@amd.com, dri-devel@lists.freedesktop.org, Prike.Liang@amd.com,
 ray.huang@amd.com, mario.limonciello@amd.com, Likun.Gao@amd.com,
 victor.skvortsov@amd.com, Sasha Levin <sashal@kernel.org>, guchun.chen@amd.com,
 amd-gfx@lists.freedesktop.org, Yuliang.Shi@amd.com, evan.quan@amd.com,
 Shaoyun Liu <shaoyun.liu@amd.com>, Jack.Xiao@amd.com, Xinhui.Pan@amd.com,
 YiPeng.Chai@amd.com, Alex Deucher <alexander.deucher@amd.com>, lang.yu@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dusica Milinkovic <Dusica.Milinkovic@amd.com>

[ Upstream commit 373008bfc9cdb0f050258947fa5a095f0657e1bc ]

[Why]
During multi-vf executing benchmark (Luxmark) observed kiq error timeout.
It happenes because all of VFs do the tlb invalidation at the same time.
Although each VF has the invalidate register set, from hardware side
the invalidate requests are queue to execute.

[How]
In case of 12 VF increase timeout on 12*100ms

Signed-off-by: Dusica Milinkovic <Dusica.Milinkovic@amd.com>
Acked-by: Shaoyun Liu <shaoyun.liu@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h    | 2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 3 ++-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 30ce6bb6fa77..310754b1f670 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -313,7 +313,7 @@ enum amdgpu_kiq_irq {
 	AMDGPU_CP_KIQ_IRQ_DRIVER0 = 0,
 	AMDGPU_CP_KIQ_IRQ_LAST
 };
-
+#define SRIOV_USEC_TIMEOUT  1200000 /* wait 12 * 100ms for SRIOV */
 #define MAX_KIQ_REG_WAIT       5000 /* in usecs, 5ms */
 #define MAX_KIQ_REG_BAILOUT_INTERVAL   5 /* in msecs, 5ms */
 #define MAX_KIQ_REG_TRY 1000
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 9077dfccaf3c..809408c8c79a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -416,6 +416,7 @@ static int gmc_v10_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 	uint32_t seq;
 	uint16_t queried_pasid;
 	bool ret;
+	u32 usec_timeout = amdgpu_sriov_vf(adev) ? SRIOV_USEC_TIMEOUT : adev->usec_timeout;
 	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
 	struct amdgpu_kiq *kiq = &adev->gfx.kiq;
 
@@ -434,7 +435,7 @@ static int gmc_v10_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 
 		amdgpu_ring_commit(ring);
 		spin_unlock(&adev->gfx.kiq.ring_lock);
-		r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
+		r = amdgpu_fence_wait_polling(ring, seq, usec_timeout);
 		if (r < 1) {
 			dev_err(adev->dev, "wait for kiq fence error: %ld.\n", r);
 			return -ETIME;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 22761a3bb818..566c1243c051 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -896,6 +896,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 	uint32_t seq;
 	uint16_t queried_pasid;
 	bool ret;
+	u32 usec_timeout = amdgpu_sriov_vf(adev) ? SRIOV_USEC_TIMEOUT : adev->usec_timeout;
 	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
 	struct amdgpu_kiq *kiq = &adev->gfx.kiq;
 
@@ -935,7 +936,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 
 		amdgpu_ring_commit(ring);
 		spin_unlock(&adev->gfx.kiq.ring_lock);
-		r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
+		r = amdgpu_fence_wait_polling(ring, seq, usec_timeout);
 		if (r < 1) {
 			dev_err(adev->dev, "wait for kiq fence error: %ld.\n", r);
 			up_read(&adev->reset_domain->sem);
-- 
2.35.1

