Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385AA537CD4
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9485C10E9FF;
	Mon, 30 May 2022 13:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (unknown [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AF510E9B0;
 Mon, 30 May 2022 13:41:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75BBB60F14;
 Mon, 30 May 2022 13:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74842C3411A;
 Mon, 30 May 2022 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918092;
 bh=ncQfeGgnY0UBuqSIYCk3dqzB61DjWK0qKxJ9nLxTJKI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qj90oIRgJcQWZ2IvWDVAjnhSGnEhq8qNmVHc6wsLdByXWbIqTp+ljqxBPr1KYQBuz
 lptvmytwHGCthEHfEb9Oqf8uYyHxdFHSF/bcRABTJTIy31F4V+Ra0v189SLstb25rk
 /eBjujzKZXgnHnltNs2jvMSK9FS7XFoQOfXdSvvscewMTQAHchjvUOiI3GW6/t3D5j
 TSm1maRtQwo4QqNMD3To1LpjudIXnqGX/XoILnUZ4FFO7i6vL6SqitCEV7cU1Yc/4Q
 rvSCPzCcGKFh+/XNjfA6mp+4/YiA/hwOOHlT6rKozzv2lEeXtr14/xvlb9bMPV34Uu
 tssM58Cnaeh6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 057/109] drm/amdgpu/psp: move PSP memory alloc
 from hw_init to sw_init
Date: Mon, 30 May 2022 09:37:33 -0400
Message-Id: <20220530133825.1933431-57-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie, Lang.Yu@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com, candice.li@amd.com, john.clements@amd.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit b95b5391684b39695887afb4a13cccee7820f5d6 ]

Memory allocations should be done in sw_init.  hw_init should
just be hardware programming needed to initialize the IP block.
This is how most other IP blocks work.  Move the GPU memory
allocations from psp hw_init to psp sw_init and move the memory
free to sw_fini.  This also fixes a potential GPU memory leak
if psp hw_init fails.

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 95 ++++++++++++-------------
 1 file changed, 47 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 86e2090bbd6e..57e9932d8a04 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -314,7 +314,39 @@ static int psp_sw_init(void *handle)
 		}
 	}
 
+	ret = amdgpu_bo_create_kernel(adev, PSP_1_MEG, PSP_1_MEG,
+				      amdgpu_sriov_vf(adev) ?
+				      AMDGPU_GEM_DOMAIN_VRAM : AMDGPU_GEM_DOMAIN_GTT,
+				      &psp->fw_pri_bo,
+				      &psp->fw_pri_mc_addr,
+				      &psp->fw_pri_buf);
+	if (ret)
+		return ret;
+
+	ret = amdgpu_bo_create_kernel(adev, PSP_FENCE_BUFFER_SIZE, PAGE_SIZE,
+				      AMDGPU_GEM_DOMAIN_VRAM,
+				      &psp->fence_buf_bo,
+				      &psp->fence_buf_mc_addr,
+				      &psp->fence_buf);
+	if (ret)
+		goto failed1;
+
+	ret = amdgpu_bo_create_kernel(adev, PSP_CMD_BUFFER_SIZE, PAGE_SIZE,
+				      AMDGPU_GEM_DOMAIN_VRAM,
+				      &psp->cmd_buf_bo, &psp->cmd_buf_mc_addr,
+				      (void **)&psp->cmd_buf_mem);
+	if (ret)
+		goto failed2;
+
 	return 0;
+
+failed2:
+	amdgpu_bo_free_kernel(&psp->fw_pri_bo,
+			      &psp->fw_pri_mc_addr, &psp->fw_pri_buf);
+failed1:
+	amdgpu_bo_free_kernel(&psp->fence_buf_bo,
+			      &psp->fence_buf_mc_addr, &psp->fence_buf);
+	return ret;
 }
 
 static int psp_sw_fini(void *handle)
@@ -344,6 +376,13 @@ static int psp_sw_fini(void *handle)
 	kfree(cmd);
 	cmd = NULL;
 
+	amdgpu_bo_free_kernel(&psp->fw_pri_bo,
+			      &psp->fw_pri_mc_addr, &psp->fw_pri_buf);
+	amdgpu_bo_free_kernel(&psp->fence_buf_bo,
+			      &psp->fence_buf_mc_addr, &psp->fence_buf);
+	amdgpu_bo_free_kernel(&psp->cmd_buf_bo, &psp->cmd_buf_mc_addr,
+			      (void **)&psp->cmd_buf_mem);
+
 	return 0;
 }
 
@@ -2580,51 +2619,18 @@ static int psp_load_fw(struct amdgpu_device *adev)
 	struct psp_context *psp = &adev->psp;
 
 	if (amdgpu_sriov_vf(adev) && amdgpu_in_reset(adev)) {
-		psp_ring_stop(psp, PSP_RING_TYPE__KM); /* should not destroy ring, only stop */
-		goto skip_memalloc;
-	}
-
-	if (amdgpu_sriov_vf(adev)) {
-		ret = amdgpu_bo_create_kernel(adev, PSP_1_MEG, PSP_1_MEG,
-						AMDGPU_GEM_DOMAIN_VRAM,
-						&psp->fw_pri_bo,
-						&psp->fw_pri_mc_addr,
-						&psp->fw_pri_buf);
+		/* should not destroy ring, only stop */
+		psp_ring_stop(psp, PSP_RING_TYPE__KM);
 	} else {
-		ret = amdgpu_bo_create_kernel(adev, PSP_1_MEG, PSP_1_MEG,
-						AMDGPU_GEM_DOMAIN_GTT,
-						&psp->fw_pri_bo,
-						&psp->fw_pri_mc_addr,
-						&psp->fw_pri_buf);
-	}
-
-	if (ret)
-		goto failed;
-
-	ret = amdgpu_bo_create_kernel(adev, PSP_FENCE_BUFFER_SIZE, PAGE_SIZE,
-					AMDGPU_GEM_DOMAIN_VRAM,
-					&psp->fence_buf_bo,
-					&psp->fence_buf_mc_addr,
-					&psp->fence_buf);
-	if (ret)
-		goto failed;
-
-	ret = amdgpu_bo_create_kernel(adev, PSP_CMD_BUFFER_SIZE, PAGE_SIZE,
-				      AMDGPU_GEM_DOMAIN_VRAM,
-				      &psp->cmd_buf_bo, &psp->cmd_buf_mc_addr,
-				      (void **)&psp->cmd_buf_mem);
-	if (ret)
-		goto failed;
+		memset(psp->fence_buf, 0, PSP_FENCE_BUFFER_SIZE);
 
-	memset(psp->fence_buf, 0, PSP_FENCE_BUFFER_SIZE);
-
-	ret = psp_ring_init(psp, PSP_RING_TYPE__KM);
-	if (ret) {
-		DRM_ERROR("PSP ring init failed!\n");
-		goto failed;
+		ret = psp_ring_init(psp, PSP_RING_TYPE__KM);
+		if (ret) {
+			DRM_ERROR("PSP ring init failed!\n");
+			goto failed;
+		}
 	}
 
-skip_memalloc:
 	ret = psp_hw_start(psp);
 	if (ret)
 		goto failed;
@@ -2730,13 +2736,6 @@ static int psp_hw_fini(void *handle)
 	psp_tmr_terminate(psp);
 	psp_ring_destroy(psp, PSP_RING_TYPE__KM);
 
-	amdgpu_bo_free_kernel(&psp->fw_pri_bo,
-			      &psp->fw_pri_mc_addr, &psp->fw_pri_buf);
-	amdgpu_bo_free_kernel(&psp->fence_buf_bo,
-			      &psp->fence_buf_mc_addr, &psp->fence_buf);
-	amdgpu_bo_free_kernel(&psp->cmd_buf_bo, &psp->cmd_buf_mc_addr,
-			      (void **)&psp->cmd_buf_mem);
-
 	return 0;
 }
 
-- 
2.35.1

