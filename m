Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56B635D25
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 13:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A4210E315;
	Wed, 23 Nov 2022 12:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DF210E2E3;
 Wed, 23 Nov 2022 12:42:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D665B81F3F;
 Wed, 23 Nov 2022 12:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E0AC433D6;
 Wed, 23 Nov 2022 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207330;
 bh=9CdGFcI6NSYYFit7v8Tf2qp4SHvPUavvWg7w2trO2Qg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SDQueprYJALAkgiJ/N91J6zEo5mBZETwnY/8vK5FNoEqo+wagX5nMJ2tOj9MISGZa
 0bmNh32AxG4br64Xv1avrk9e5Tqa9qgiwU1Mmc1rm3zoj3O7MDCcTAhLNud4aEPtRK
 CVmu438goyqB6KhTAeI9s1uP6rk3DHxqWorGVD53EUqqNXYTOxApSRKmt45qM+3qAp
 nmbfSl+NXj50vlZltcZ4uEDF/XBAiIG1e+or2Hj0nwRhdfM9XZTj9KbgsEv+lX6ZPO
 xNQNezsy+vU8zN936WEuoXoZD2p4LIOGtOgaFsMyjZ5q+rd5suZ+ybTPZLS5xP79sX
 p5wJj+YbdyJOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 28/44] drm/amdkfd: Fix a memory limit issue
Date: Wed, 23 Nov 2022 07:40:37 -0500
Message-Id: <20221123124057.264822-28-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124057.264822-1-sashal@kernel.org>
References: <20221123124057.264822-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Huang <jinhuieric.huang@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Eric Huang <jinhuieric.huang@amd.com>

[ Upstream commit 6f9eea4392a178af19360694b1db64f985d0b459 ]

It is to resolve a regression, which fails to allocate
VRAM due to no free memory in application, the reason
is we add check of vram_pin_size for memory limit, and
application is pinning the memory for Peerdirect, KFD
should not count it in memory limit. So removing
vram_pin_size will resolve it.

Signed-off-by: Eric Huang <jinhuieric.huang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 93ad00453f4b..7db4aef9c45c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -170,9 +170,7 @@ int amdgpu_amdkfd_reserve_mem_limit(struct amdgpu_device *adev,
 	    (kfd_mem_limit.ttm_mem_used + ttm_mem_needed >
 	     kfd_mem_limit.max_ttm_mem_limit) ||
 	    (adev && adev->kfd.vram_used + vram_needed >
-	     adev->gmc.real_vram_size -
-	     atomic64_read(&adev->vram_pin_size) -
-	     reserved_for_pt)) {
+	     adev->gmc.real_vram_size - reserved_for_pt)) {
 		ret = -ENOMEM;
 		goto release;
 	}
-- 
2.35.1

