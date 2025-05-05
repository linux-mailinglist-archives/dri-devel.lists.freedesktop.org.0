Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C390DAAA3C2
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D6210E617;
	Mon,  5 May 2025 23:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CBVXtjSv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779F410E616;
 Mon,  5 May 2025 23:19:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A04FF4A2E5;
 Mon,  5 May 2025 23:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4289C4CEE4;
 Mon,  5 May 2025 23:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746487183;
 bh=IAzJGTfTulF1JxeTI5O0x8ljpx/EV1p4ipR4EZ3Kisc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CBVXtjSvix4+PfVt+7JadpUVzwKhveV8tq4LGsjggpHud358fxN5PByjz59iaQ07l
 7ao9jGC9j9PEmJdojv3vBB7mG7ZZVnaszMSqqw72+w/Bi97SyhKLoBGXwn+EdMedkT
 b34eXtnDNW5Z9lnn54ru/OxU+tINE+lggCN9KFrC4WYfCJjW4PNHD5zKQEh77Kp+on
 CtRIlTURYTdiBcW5n5zWbrUlvWYqzaLiLBiU91Dyhpoj1ttp8WYsNtEfSJMPNyS8vB
 5cUAPMRCFcnLTuYc1M6bij/duGgwR4JkBNZfTtrAWhq+bMQUtHMi5+P4sDrhjX8EJh
 AKzTtWZtbzAsQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Victor Lu <victorchengchi.lu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 tao.zhou1@amd.com, Hawking.Zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 046/114] drm/amdgpu: Do not program AGP BAR regs
 under SRIOV in gfxhub_v1_0.c
Date: Mon,  5 May 2025 19:17:09 -0400
Message-Id: <20250505231817.2697367-46-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
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

From: Victor Lu <victorchengchi.lu@amd.com>

[ Upstream commit 057fef20b8401110a7bc1c2fe9d804a8a0bf0d24 ]

SRIOV VF does not have write access to AGP BAR regs.
Skip the writes to avoid a dmesg warning.

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
index fad887a668866..7949a87b03a84 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
@@ -70,12 +70,12 @@ static void gfxhub_v1_0_init_system_aperture_regs(struct amdgpu_device *adev)
 {
 	uint64_t value;
 
-	/* Program the AGP BAR */
-	WREG32_SOC15_RLC(GC, 0, mmMC_VM_AGP_BASE, 0);
-	WREG32_SOC15_RLC(GC, 0, mmMC_VM_AGP_BOT, adev->gmc.agp_start >> 24);
-	WREG32_SOC15_RLC(GC, 0, mmMC_VM_AGP_TOP, adev->gmc.agp_end >> 24);
-
 	if (!amdgpu_sriov_vf(adev) || adev->asic_type <= CHIP_VEGA10) {
+		/* Program the AGP BAR */
+		WREG32_SOC15_RLC(GC, 0, mmMC_VM_AGP_BASE, 0);
+		WREG32_SOC15_RLC(GC, 0, mmMC_VM_AGP_BOT, adev->gmc.agp_start >> 24);
+		WREG32_SOC15_RLC(GC, 0, mmMC_VM_AGP_TOP, adev->gmc.agp_end >> 24);
+
 		/* Program the system aperture low logical page number. */
 		WREG32_SOC15_RLC(GC, 0, mmMC_VM_SYSTEM_APERTURE_LOW_ADDR,
 			min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
-- 
2.39.5

