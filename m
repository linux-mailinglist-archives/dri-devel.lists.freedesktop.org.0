Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97972AA9F7D
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD4710E46D;
	Mon,  5 May 2025 22:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nL3xPGlA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D919110E469;
 Mon,  5 May 2025 22:24:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7CBE4A4CCF3;
 Mon,  5 May 2025 22:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2EDC4CEEE;
 Mon,  5 May 2025 22:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483846;
 bh=x11mW6LLxkPY69nFvys0J8U5iF/dViBEqwt9cs3nL7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nL3xPGlA5LxZl3S/Y4CG/ayLwiXrW4DUjMOsw5jPK9SjvhL2/y7Qawx6d/qAEjy7w
 Q7xtqhnTOQAlFf04PrRN/naaJ+esjMei9/QzReLKLaRRjATQGm9cMcQIRccZSsz1dE
 waps7m/ua2QFboyEgp0A+TyPT4gV2jhwoYSSObbMkZ5V4hcCSqOuSSmBTUn595wCxa
 nhl9TCHIKy2xPu48/dPMTRR51RdoUTX0bj2bY0FpeIubr8SGvR6V9VQMIdu0G5w+Nt
 mcxKffrND2QWLazmM8nxlo5CX6gBY+cn8yVTd4HT64/V6WG4gS9uNeW5klNf1QBMw3
 m7/VTaT0V/0LQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 Boyuan.Zhang@amd.com, sonny.jiang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 247/642] drm/amdgpu: Reinit FW shared flags on
 VCN v5.0.1
Date: Mon,  5 May 2025 18:07:43 -0400
Message-Id: <20250505221419.2672473-247-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

[ Upstream commit 6ef5ccaad76d907d4257f20de992f89c0f7a7f8e ]

After a full device reset, shared memory region will clear out and it's
not possible to reliably save the region in case of RAS errors.
Reinitialize the flags if required.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c | 28 ++++++++++++++++++-------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
index 8b0b3739a5377..cdbc10d7c9fb7 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
@@ -65,6 +65,22 @@ static int vcn_v5_0_1_early_init(struct amdgpu_ip_block *ip_block)
 	return amdgpu_vcn_early_init(adev);
 }
 
+static void vcn_v5_0_1_fw_shared_init(struct amdgpu_device *adev, int inst_idx)
+{
+	struct amdgpu_vcn5_fw_shared *fw_shared;
+
+	fw_shared = adev->vcn.inst[inst_idx].fw_shared.cpu_addr;
+
+	if (fw_shared->sq.is_enabled)
+		return;
+	fw_shared->present_flag_0 =
+		cpu_to_le32(AMDGPU_FW_SHARED_FLAG_0_UNIFIED_QUEUE);
+	fw_shared->sq.is_enabled = 1;
+
+	if (amdgpu_vcnfw_log)
+		amdgpu_vcn_fwlog_init(&adev->vcn.inst[inst_idx]);
+}
+
 /**
  * vcn_v5_0_1_sw_init - sw init for VCN block
  *
@@ -95,8 +111,6 @@ static int vcn_v5_0_1_sw_init(struct amdgpu_ip_block *ip_block)
 		return r;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
-		volatile struct amdgpu_vcn5_fw_shared *fw_shared;
-
 		vcn_inst = GET_INST(VCN, i);
 
 		ring = &adev->vcn.inst[i].ring_enc[0];
@@ -111,12 +125,7 @@ static int vcn_v5_0_1_sw_init(struct amdgpu_ip_block *ip_block)
 		if (r)
 			return r;
 
-		fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
-		fw_shared->present_flag_0 = cpu_to_le32(AMDGPU_FW_SHARED_FLAG_0_UNIFIED_QUEUE);
-		fw_shared->sq.is_enabled = true;
-
-		if (amdgpu_vcnfw_log)
-			amdgpu_vcn_fwlog_init(&adev->vcn.inst[i]);
+		vcn_v5_0_1_fw_shared_init(adev, i);
 	}
 
 	/* TODO: Add queue reset mask when FW fully supports it */
@@ -188,6 +197,9 @@ static int vcn_v5_0_1_hw_init(struct amdgpu_ip_block *ip_block)
 				 9 * vcn_inst),
 				adev->vcn.inst[i].aid_id);
 
+		/* Re-init fw_shared, if required */
+		vcn_v5_0_1_fw_shared_init(adev, i);
+
 		r = amdgpu_ring_test_helper(ring);
 		if (r)
 			return r;
-- 
2.39.5

