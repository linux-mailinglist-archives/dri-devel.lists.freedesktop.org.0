Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FB27F4A6D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 16:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0690410E652;
	Wed, 22 Nov 2023 15:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75B910E2F2;
 Wed, 22 Nov 2023 15:33:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BBA5CCE1F39;
 Wed, 22 Nov 2023 15:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C83C433C8;
 Wed, 22 Nov 2023 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700667188;
 bh=2qTOvCWpzcEMq1BGkwO3St3fjrcWiejay2W1ytf8K8g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D6XKxktZkMgA5PLXSJ9+b3S59k/JKezAkMR8ANMXwRdlL6PdxvWfuOEGR2+LvY64E
 ZCQj+E/2UCOB31CCUplCfAl9C28xUg9YeKl6fwVL63eFDAcRbfJ60Prcz+To4UcOYW
 zWWhr+1w+bawXE6HJ0JIIVQZWC4Ypk1Ouwr8iLjw1UOge6woVAPoC4gxVr7fv1kn/Z
 I7r5nJOCP/aG7bUi/QXNojOPhqYOgLBObaxOGOjdqAU1XJB20V7ouFEiMLx/k7rojK
 SkQFRE81pO67ijg/rqyvgVTxiGWri1XvF9KThGqJJceN7aIyJAh/VEHcXMdJsOJJdO
 l1gCXPGAEfWDQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 15/17] drm/amdgpu: finalizing mem_partitions at
 the end of GMC v9 sw_fini
Date: Wed, 22 Nov 2023 10:31:44 -0500
Message-ID: <20231122153212.852040-15-sashal@kernel.org>
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
index f9a5a2c0573e4..89550d3df68d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -2220,8 +2220,6 @@ static int gmc_v9_0_sw_fini(void *handle)
 
 	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3))
 		amdgpu_gmc_sysfs_fini(adev);
-	adev->gmc.num_mem_partitions = 0;
-	kfree(adev->gmc.mem_partitions);
 
 	amdgpu_gmc_ras_fini(adev);
 	amdgpu_gem_force_release(adev);
@@ -2235,6 +2233,9 @@ static int gmc_v9_0_sw_fini(void *handle)
 	amdgpu_bo_free_kernel(&adev->gmc.pdb0_bo, NULL, &adev->gmc.ptr_pdb0);
 	amdgpu_bo_fini(adev);
 
+	adev->gmc.num_mem_partitions = 0;
+	kfree(adev->gmc.mem_partitions);
+
 	return 0;
 }
 
-- 
2.42.0

