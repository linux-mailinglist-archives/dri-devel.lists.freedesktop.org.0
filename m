Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A138AD9AB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 01:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22F7112E88;
	Mon, 22 Apr 2024 23:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I5worMO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1A9112E85;
 Mon, 22 Apr 2024 23:56:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 85E8C611E3;
 Mon, 22 Apr 2024 23:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE39C113CC;
 Mon, 22 Apr 2024 23:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713830217;
 bh=xGDyZcsvL01giqwU9B+2OU3WWvIKJ8Cs+d5IjoK078Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I5worMO2j2zK1VU3q2j7VXHUubZ3gqXGV39O4BuTblmdY6Ag3982/0NwYeAec7Bre
 eByIonWCJzmQByguyh8Qj5BA1xMnRGLP+sGukoUDhD9WQIqP2CEhFDOLzqY0mMpgy1
 Rq+ScSzepM/EvConhUMWQsJAf9+WSsrJxo8zwwDDxpqwzGCXC5KqnNyHP6uIMx5ZAb
 3znnBirr8HblRSauKv2OJp/k8SaCXNA/US/tQ8q5Bq8ZQW6m8tzONymUhPiOoSIh0a
 jahE79PyZqkoxx81lFU8Sp00it9Uwg3F/EOQvmARSoNeJfyEiJMv3KHuq6UzfN57KM
 LbGwRDwalIB4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lijo Lazar <lijo.lazar@amd.com>, James Zhu <James.Zhu@amd.com>,
 Asad Kamal <asad.kamal@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, le.ma@amd.com, Philip.Yang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 20/29] drm/amdgpu: Fix VCN allocation in CPX
 partition
Date: Mon, 22 Apr 2024 19:17:01 -0400
Message-ID: <20240422231730.1601976-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231730.1601976-1-sashal@kernel.org>
References: <20240422231730.1601976-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.28
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

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit f7e232de51bb1b45646e5b7dc4ebcf13510f2630 ]

VCN need not be shared in CPX mode always for all GFX 9.4.3 SOC SKUs. In
certain configs, VCN instance can be exclusively allocated to a
partition even under CPX mode.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: James Zhu <James.Zhu@amd.com>
Reviewed-by: Asad Kamal <asad.kamal@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
index d0fc62784e821..0284c9198a04a 100644
--- a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
+++ b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
@@ -61,6 +61,11 @@ void aqua_vanjaram_doorbell_index_init(struct amdgpu_device *adev)
 	adev->doorbell_index.max_assignment = AMDGPU_DOORBELL_LAYOUT1_MAX_ASSIGNMENT << 1;
 }
 
+static bool aqua_vanjaram_xcp_vcn_shared(struct amdgpu_device *adev)
+{
+	return (adev->xcp_mgr->num_xcps > adev->vcn.num_vcn_inst);
+}
+
 static void aqua_vanjaram_set_xcp_id(struct amdgpu_device *adev,
 			     uint32_t inst_idx, struct amdgpu_ring *ring)
 {
@@ -86,7 +91,7 @@ static void aqua_vanjaram_set_xcp_id(struct amdgpu_device *adev,
 	case AMDGPU_RING_TYPE_VCN_ENC:
 	case AMDGPU_RING_TYPE_VCN_JPEG:
 		ip_blk = AMDGPU_XCP_VCN;
-		if (adev->xcp_mgr->mode == AMDGPU_CPX_PARTITION_MODE)
+		if (aqua_vanjaram_xcp_vcn_shared(adev))
 			inst_mask = 1 << (inst_idx * 2);
 		break;
 	default:
@@ -139,10 +144,12 @@ static int aqua_vanjaram_xcp_sched_list_update(
 
 		aqua_vanjaram_xcp_gpu_sched_update(adev, ring, ring->xcp_id);
 
-		/* VCN is shared by two partitions under CPX MODE */
+		/* VCN may be shared by two partitions under CPX MODE in certain
+		 * configs.
+		 */
 		if ((ring->funcs->type == AMDGPU_RING_TYPE_VCN_ENC ||
-			ring->funcs->type == AMDGPU_RING_TYPE_VCN_JPEG) &&
-			adev->xcp_mgr->mode == AMDGPU_CPX_PARTITION_MODE)
+		     ring->funcs->type == AMDGPU_RING_TYPE_VCN_JPEG) &&
+		    aqua_vanjaram_xcp_vcn_shared(adev))
 			aqua_vanjaram_xcp_gpu_sched_update(adev, ring, ring->xcp_id + 1);
 	}
 
-- 
2.43.0

