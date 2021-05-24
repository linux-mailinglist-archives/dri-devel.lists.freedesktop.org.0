Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE74838E9AC
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 16:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84CF6E867;
	Mon, 24 May 2021 14:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7686E866;
 Mon, 24 May 2021 14:48:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBF1161430;
 Mon, 24 May 2021 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867737;
 bh=o19B04rDSAAxX/tFaxndazizN7mBByLIkn3rVKEeiCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mjuTiqyzadpvajVMyYrkhRSKT3rLwuUFWdeMA5FGNJ4s4lZ/RdUtSfOcv8FpCf5Qc
 eFU1GireSlOIX+08Ok2DErKdNGfVJR9uvwij9n9KfzXewKT2efcXBuXKGQu5dTcQzz
 x+MempL+YVxB+SdscHSgbd9fIxc1eZ5XgZ8SOzLpO8FXaSWqY4BVcO8Kf8EB1J7slA
 6CJm5AoE2qB0MRlAR4lha+0Ko0/fxo1kZj0SU17FP8o+dvn34uU4GSFFmGe4C3nYro
 I9qae0D8mTFsaOCOlszgIulc6ud6bIdIFLhfiWVuRCyw3kVwhYramQMOzexavWkuFF
 wmh7woswd0Mfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 59/62] drm/amdgpu: stop touching sched.ready in
 the backend
Date: Mon, 24 May 2021 10:47:40 -0400
Message-Id: <20210524144744.2497894-59-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144744.2497894-1-sashal@kernel.org>
References: <20210524144744.2497894-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <christian.koenig@amd.com>

[ Upstream commit a2b4785f01280a4291edb9fda69032fc2e4bfd3f ]

This unfortunately comes up in regular intervals and breaks
GPU reset for the engine in question.

The sched.ready flag controls if an engine can't get working
during hw_init, but should never be set to false during hw_fini.

v2: squash in unused variable fix (Alex)

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c | 2 --
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c | 2 --
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 5 -----
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c  | 8 +-------
 4 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index 845306f63cdb..63b350182389 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -198,8 +198,6 @@ static int jpeg_v2_5_hw_fini(void *handle)
 		if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
 		      RREG32_SOC15(JPEG, i, mmUVD_JRBC_STATUS))
 			jpeg_v2_5_set_powergating_state(adev, AMD_PG_STATE_GATE);
-
-		ring->sched.ready = false;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index 3a0dff53654d..9259e35f0f55 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -166,8 +166,6 @@ static int jpeg_v3_0_hw_fini(void *handle)
 	      RREG32_SOC15(JPEG, 0, mmUVD_JRBC_STATUS))
 		jpeg_v3_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
 
-	ring->sched.ready = false;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 2a485052e3ab..1bd330d43147 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -476,11 +476,6 @@ static void sdma_v5_2_gfx_stop(struct amdgpu_device *adev)
 		ib_cntl = REG_SET_FIELD(ib_cntl, SDMA0_GFX_IB_CNTL, IB_ENABLE, 0);
 		WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_IB_CNTL), ib_cntl);
 	}
-
-	sdma0->sched.ready = false;
-	sdma1->sched.ready = false;
-	sdma2->sched.ready = false;
-	sdma3->sched.ready = false;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index b5f8f3d731cb..700621ddc02e 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -346,7 +346,7 @@ static int vcn_v3_0_hw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct amdgpu_ring *ring;
-	int i, j;
+	int i;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
 		if (adev->vcn.harvest_config & (1 << i))
@@ -361,12 +361,6 @@ static int vcn_v3_0_hw_fini(void *handle)
 				vcn_v3_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
 			}
 		}
-		ring->sched.ready = false;
-
-		for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
-			ring = &adev->vcn.inst[i].ring_enc[j];
-			ring->sched.ready = false;
-		}
 	}
 
 	return 0;
-- 
2.30.2

