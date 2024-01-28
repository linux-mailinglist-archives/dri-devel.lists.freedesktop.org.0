Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F6C83F6B1
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 17:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92597112704;
	Sun, 28 Jan 2024 16:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1714D112704;
 Sun, 28 Jan 2024 16:15:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2603DCE0C6E;
 Sun, 28 Jan 2024 16:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AEFC433F1;
 Sun, 28 Jan 2024 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706458508;
 bh=h9y2lAYglnEeDHVIfLbYIRCSzH858WPaNlhqC2pj/Qs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SmRY0cx3STI3JZGtzyp3Vvwz/KxwYXVjnQ6c+d+SzPLKLovwsTQzB/+yX6kWuLj+H
 NT2vg6TVDbQuT8ba7JhGC29VGgbp+VZiy/YsKrfPnn54bXVhPmkB+un+5J4a335avp
 P+C+3CmmpHXpC5ZszXFk58TrxLGOROCTjdUasNEQjTVb38LhCrnbMlFXpFdNdz4/tZ
 sK5qStLf1pJvuSBXZm0xpaFG6+aL2gt+Pj0NGnBG6uvvVEd7n+amssq0ZcN7uP5Ogi
 hM8ndiTivRAMUDwnwZjFmOVwOMfrLeE6t/lX/OqB4X22yu6F9K7c2kNoSW+wDbVso/
 qfGsLwVeq57Gg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 24/27] drm/amdgpu: Fix with right return code
 '-EIO' in 'amdgpu_gmc_vram_checking()'
Date: Sun, 28 Jan 2024 11:14:09 -0500
Message-ID: <20240128161424.203600-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161424.203600-1-sashal@kernel.org>
References: <20240128161424.203600-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.75
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
Cc: Sasha Levin <sashal@kernel.org>, mukul.joshi@amd.com, Xinhui.Pan@amd.com,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 dri-devel@lists.freedesktop.org, Xiaojian Du <Xiaojian.Du@amd.com>,
 amd-gfx@lists.freedesktop.org, Felix.Kuehling@amd.com,
 Lijo Lazar <lijo.lazar@amd.com>, tao.zhou1@amd.com, shiwu.zhang@amd.com,
 mario.limonciello@amd.com, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, ikshwaku.chauhan@amd.com,
 airlied@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit fac4ebd79fed60e79cccafdad45a2bb8d3795044 ]

The amdgpu_gmc_vram_checking() function in emulation checks whether
all of the memory range of shared system memory could be accessed by
GPU, from this aspect, -EIO is returned for error scenarios.

Fixes the below:
drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c:919 gmc_v6_0_hw_init() warn: missing error code? 'r'
drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c:1103 gmc_v7_0_hw_init() warn: missing error code? 'r'
drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c:1223 gmc_v8_0_hw_init() warn: missing error code? 'r'
drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:2344 gmc_v9_0_hw_init() warn: missing error code? 'r'

Cc: Xiaojian Du <Xiaojian.Du@amd.com>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 2bc791ed8830..ea0fb079f942 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -808,19 +808,26 @@ int amdgpu_gmc_vram_checking(struct amdgpu_device *adev)
 	 * seconds, so here, we just pick up three parts for emulation.
 	 */
 	ret = memcmp(vram_ptr, cptr, 10);
-	if (ret)
-		return ret;
+	if (ret) {
+		ret = -EIO;
+		goto release_buffer;
+	}
 
 	ret = memcmp(vram_ptr + (size / 2), cptr, 10);
-	if (ret)
-		return ret;
+	if (ret) {
+		ret = -EIO;
+		goto release_buffer;
+	}
 
 	ret = memcmp(vram_ptr + size - 10, cptr, 10);
-	if (ret)
-		return ret;
+	if (ret) {
+		ret = -EIO;
+		goto release_buffer;
+	}
 
+release_buffer:
 	amdgpu_bo_free_kernel(&vram_bo, &vram_gpu,
 			&vram_ptr);
 
-	return 0;
+	return ret;
 }
-- 
2.43.0

