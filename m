Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA4838E9F7
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 16:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68596E87A;
	Mon, 24 May 2021 14:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845C06E870;
 Mon, 24 May 2021 14:50:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8612B61585;
 Mon, 24 May 2021 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867839;
 bh=k5C6B80V97/999w9lzY6hsrf7kvKwJWQtz5GjPSoiEQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NW5XykB43nvs9YK2vOiQLnhR1Lk0YgFI6vyh/bSV64uHqFEfb3Q3teFeFV7i4mZX4
 Qpg4W81BjEZtj8uk47vq4a8ZetcPSG44M39jFeI9ysp45qNhMKI0of7iGOj3vN8nVP
 bfxEfVJqHejQhdMV/mqlCtDbD44Xit0Y9LxXof7E0TDZeQnmFMEL0Uj+ff/iZzSyaR
 c7+TdGAGeXUGrubv4MHUIE9nsjIXICSUeSQxeNmswmWKLWXWlrvXB91Dg8OX9hK3Lb
 iN6xpFmPLCOhonzgTKSx5cXBau05rfMHUlduxLPHVbvIVZVV5NPTEdrTF/ZdFSFeMd
 pVXohdo7VNS4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 25/25] drm/amdgpu: Fix a use-after-free
Date: Mon, 24 May 2021 10:50:08 -0400
Message-Id: <20210524145008.2499049-25-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524145008.2499049-1-sashal@kernel.org>
References: <20210524145008.2499049-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, xinhui pan <xinhui.pan@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: xinhui pan <xinhui.pan@amd.com>

[ Upstream commit 1e5c37385097c35911b0f8a0c67ffd10ee1af9a2 ]

looks like we forget to set ttm->sg to NULL.
Hit panic below

[ 1235.844104] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b7b4b: 0000 [#1] SMP DEBUG_PAGEALLOC NOPTI
[ 1235.989074] Call Trace:
[ 1235.991751]  sg_free_table+0x17/0x20
[ 1235.995667]  amdgpu_ttm_backend_unbind.cold+0x4d/0xf7 [amdgpu]
[ 1236.002288]  amdgpu_ttm_backend_destroy+0x29/0x130 [amdgpu]
[ 1236.008464]  ttm_tt_destroy+0x1e/0x30 [ttm]
[ 1236.013066]  ttm_bo_cleanup_memtype_use+0x51/0xa0 [ttm]
[ 1236.018783]  ttm_bo_release+0x262/0xa50 [ttm]
[ 1236.023547]  ttm_bo_put+0x82/0xd0 [ttm]
[ 1236.027766]  amdgpu_bo_unref+0x26/0x50 [amdgpu]
[ 1236.032809]  amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu+0x7aa/0xd90 [amdgpu]
[ 1236.040400]  kfd_ioctl_alloc_memory_of_gpu+0xe2/0x330 [amdgpu]
[ 1236.046912]  kfd_ioctl+0x463/0x690 [amdgpu]

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 757fa486aac4..50807d621eca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1277,6 +1277,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_tt *ttm)
 	if (gtt && gtt->userptr) {
 		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
 		kfree(ttm->sg);
+		ttm->sg = NULL;
 		ttm->page_flags &= ~TTM_PAGE_FLAG_SG;
 		return;
 	}
-- 
2.30.2

