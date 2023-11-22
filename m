Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B427F4A97
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 16:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E1210E662;
	Wed, 22 Nov 2023 15:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A3810E65F;
 Wed, 22 Nov 2023 15:34:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6098B61E2D;
 Wed, 22 Nov 2023 15:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4FFC43391;
 Wed, 22 Nov 2023 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700667267;
 bh=mr81ezehLemTvgIgiEO/DegCCDj4ACKiftPeOfszEJw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M7krRVi4RhCKRBXwho2cmLQUZ4+cLT3Q25enwbseQ8jl6Uhj787dxJUcWEUueDWl8
 fLandjjlLZtNCjU2VvOsws9VYJQ1jlMooaVdp4HMz5Ntt5qcIIEg1vuhtRe+yc1k0w
 Omwcwpm0bCVam/KqQjhhwcCky9GJR4rnb3x01u/WAOjUJSE9lvHrXTaf7jWS2ZCXLY
 a8D1/wGahiNZqxIspKa9KGDusvvDcorSEuc1TxbFibLmuYwgMIkDiXSYAUaj4O1clU
 aSBA50rFZaMyaCPGiaj57YERb5ztNX/CyuV02alEmEEEm6mLAv5Rr+hATuhRkwrcj8
 LjMkcaM9MN77Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 13/15] drm/amdgpu: finalizing mem_partitions at
 the end of GMC v9 sw_fini
Date: Wed, 22 Nov 2023 10:33:15 -0500
Message-ID: <20231122153340.852434-13-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122153340.852434-1-sashal@kernel.org>
References: <20231122153340.852434-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.12
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
Cc: Sasha Levin <sashal@kernel.org>, lijo.lazar@amd.com, Felix.Kuehling@amd.com,
 Xinhui.Pan@amd.com, rajneesh.bhardwaj@amd.com, amd-gfx@lists.freedesktop.org,
 Le Ma <le.ma@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Le Ma <le.ma@amd.com>

[ Upstream commit bdb72185d310fc8049c7ea95221d640e9e7165e5 ]

The valid num_mem_partitions is required during ttm pool fini,
thus move the cleanup at the end of the function.

Signed-off-by: Le Ma <le.ma@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 67e669e0141cc..00c719b93c76e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -2211,8 +2211,6 @@ static int gmc_v9_0_sw_fini(void *handle)
 
 	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3))
 		amdgpu_gmc_sysfs_fini(adev);
-	adev->gmc.num_mem_partitions = 0;
-	kfree(adev->gmc.mem_partitions);
 
 	amdgpu_gmc_ras_fini(adev);
 	amdgpu_gem_force_release(adev);
@@ -2226,6 +2224,9 @@ static int gmc_v9_0_sw_fini(void *handle)
 	amdgpu_bo_free_kernel(&adev->gmc.pdb0_bo, NULL, &adev->gmc.ptr_pdb0);
 	amdgpu_bo_fini(adev);
 
+	adev->gmc.num_mem_partitions = 0;
+	kfree(adev->gmc.mem_partitions);
+
 	return 0;
 }
 
-- 
2.42.0

