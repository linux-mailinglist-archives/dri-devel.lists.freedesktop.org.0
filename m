Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5667F4A6B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 16:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EDD10E152;
	Wed, 22 Nov 2023 15:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A21810E149;
 Wed, 22 Nov 2023 15:33:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A6E67B8264D;
 Wed, 22 Nov 2023 15:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D7AC433C9;
 Wed, 22 Nov 2023 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700667184;
 bh=NI3biGsjUjf9hvOjQhTGPV8BLZqLm8iTMxw2iDQUTqk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sjtgvLB2LDHwURcr+Jtx0/44cNpR6HmKvPsYuVyPAW5Q0qiLwV6RYwT610DewUqrB
 Tx8Bt88iDphNjwGL653Wsfo0/BR+y6Qeq3TAQjot3wqWI7aZLaY/n54NPbEd9jFLiX
 DuzYcXx3hfSZwjjeQhXP7zyahIuH55ffbihEQTULSX94dtBJqAmYFs+TTGrWi0kX6K
 zLVJKRhpWRtTBnwnhpZKHPg254uUOHzhmphqntIcqg2/8sAMZc1pE8haLnM23bwILN
 qQtHp7XKTb9SqwP/OWgHy6xS4I/X4gRyZFDV24imzLSCrk0RtbuqaSz/XJO6HN39s6
 iVIH00l6m5cow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 14/17] drm/amdgpu: Do not program VF copy regs in
 mmhub v1.8 under SRIOV (v2)
Date: Wed, 22 Nov 2023 10:31:43 -0500
Message-ID: <20231122153212.852040-14-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122153212.852040-1-sashal@kernel.org>
References: <20231122153212.852040-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.2
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
Cc: Sasha Levin <sashal@kernel.org>, tao.zhou1@amd.com,
 srinivasan.shanmugam@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Victor Lu <victorchengchi.lu@amd.com>,
 le.ma@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Samir Dhume <samir.dhume@amd.com>,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

[ Upstream commit 0288603040c38ccfeb5342f34a52673366d90038 ]

MC_VM_AGP_* registers should not be programmed by guest driver.

v2: move early return outside of loop

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Reviewed-by: Samir Dhume <samir.dhume@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
index 784c4e0774707..3d8e579d5c4e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
@@ -130,6 +130,9 @@ static void mmhub_v1_8_init_system_aperture_regs(struct amdgpu_device *adev)
 	uint64_t value;
 	int i;
 
+	if (amdgpu_sriov_vf(adev))
+		return;
+
 	inst_mask = adev->aid_mask;
 	for_each_inst(i, inst_mask) {
 		/* Program the AGP BAR */
@@ -139,9 +142,6 @@ static void mmhub_v1_8_init_system_aperture_regs(struct amdgpu_device *adev)
 		WREG32_SOC15(MMHUB, i, regMC_VM_AGP_TOP,
 			     adev->gmc.agp_end >> 24);
 
-		if (amdgpu_sriov_vf(adev))
-			return;
-
 		/* Program the system aperture low logical page number. */
 		WREG32_SOC15(MMHUB, i, regMC_VM_SYSTEM_APERTURE_LOW_ADDR,
 			min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
-- 
2.42.0

