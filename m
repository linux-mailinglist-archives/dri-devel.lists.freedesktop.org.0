Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FD5C0284
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7763610E382;
	Wed, 21 Sep 2022 15:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B1310E382;
 Wed, 21 Sep 2022 15:53:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E03BDB830CA;
 Wed, 21 Sep 2022 15:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F95AC433D6;
 Wed, 21 Sep 2022 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663775626;
 bh=0zA5pwf1OCRIFOM7AXpOQOvVEQbh6eetXLifEDLltvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JTTXKm/qr2jTK8MVoP+dkFTYIfeN2UCdtpSSMQUQXebtNRIYG1yzOxwgn9XJQ5zjQ
 I6TpCYXlxGAphBiYQ+KuaQ7PlT85jvioU09GDQnC3R+2Qqom0gqRUBjdNJ2HpHMXBh
 vQS2sEB1oIjnK4ifO6uMluFH8pTp6cUQagxWEPH9QHDNDEcfc8SXj9oz6vpvymNNlq
 rNcqYsGgYvmIns/akc0nJiB7DnRY03HHhlEjasYJ4n9ST/fjjngC1rtXC8QMBqpgf4
 Lfz2ctbj8iLr709rjxhSYtCClpM9syR4FVfDp8VfnmPLByeAucoeLYFKrnzaH3ssRa
 X3grjCasjnrRA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 08/16] drm/amdgpu: change the alignment size of
 TMR BO to 1M
Date: Wed, 21 Sep 2022 11:53:24 -0400
Message-Id: <20220921155332.234913-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155332.234913-1-sashal@kernel.org>
References: <20220921155332.234913-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tao.zhou1@amd.com, guchun.chen@amd.com,
 Yang Wang <KevinYang.Wang@amd.com>, airlied@linux.ie, Bokun.Zhang@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, Xiaojian.Du@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com, candice.li@amd.com, john.clements@amd.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Wang <KevinYang.Wang@amd.com>

[ Upstream commit 36de13fdb04abef3ee03ade5129ab146de63983b ]

align TMR BO size TO tmr size is not necessary,
modify the size to 1M to avoid re-create BO fail
when serious VRAM fragmentation.

v2:
add new macro PSP_TMR_ALIGNMENT for TMR BO alignment size

Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 2b00f8fe15a8..7b8d4484c3c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -748,7 +748,7 @@ static int psp_tmr_init(struct psp_context *psp)
 	}
 
 	pptr = amdgpu_sriov_vf(psp->adev) ? &tmr_buf : NULL;
-	ret = amdgpu_bo_create_kernel(psp->adev, tmr_size, PSP_TMR_SIZE(psp->adev),
+	ret = amdgpu_bo_create_kernel(psp->adev, tmr_size, PSP_TMR_ALIGNMENT,
 				      AMDGPU_GEM_DOMAIN_VRAM,
 				      &psp->tmr_bo, &psp->tmr_mc_addr, pptr);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index e431f4994931..cd366c7f311f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -36,6 +36,7 @@
 #define PSP_CMD_BUFFER_SIZE	0x1000
 #define PSP_1_MEG		0x100000
 #define PSP_TMR_SIZE(adev)	((adev)->asic_type == CHIP_ALDEBARAN ? 0x800000 : 0x400000)
+#define PSP_TMR_ALIGNMENT	0x100000
 #define PSP_FW_NAME_LEN		0x24
 
 enum psp_shared_mem_size {
-- 
2.35.1

