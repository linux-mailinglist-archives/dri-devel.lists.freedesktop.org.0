Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E098FCB3C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 13:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E34F10E787;
	Wed,  5 Jun 2024 11:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P+VdVchh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D00810E773;
 Wed,  5 Jun 2024 11:56:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A29E6617BD;
 Wed,  5 Jun 2024 11:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EDFC4AF07;
 Wed,  5 Jun 2024 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717588567;
 bh=MQlafrH1ZsAWU4GMtq3xWoxO3rSPyWFUyXOPtV5F/2c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P+VdVchhTFt2D0z0ex9prF+bS85YqAHvGATE0KRJzJqNzmVYH59GcGbtvNJnL8Xzl
 c8PaE3+ycWpN/BJkNOItEcGvAT1b6huTVLG1lpfi1wir9uqfgRVsL2VqTQf2/F6nUR
 TgrAA4+c0JLI/e4dq5/1dNk+Qk7pEBpivOtGD9Bj19U8gcQEqnZZ6F1DfZXGky6OTq
 vCMPwKexAosXP8XrR8yrYCz+z5Bm+PyrgjuD7Ti8npWHNsMfVpM0XsJmiUJJQhhWeB
 ZEwgPxJuco0Hc6rT7q9PZZH6LnsCEJsqwKwQ96Yo2FHbBmTDUKVXhxnlBVyc0CP1Mz
 jQ0VYFKULz3Jg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lang Yu <Lang.Yu@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 3/6] drm/amdkfd: handle duplicate BOs in
 reserve_bo_and_cond_vms
Date: Wed,  5 Jun 2024 07:55:55 -0400
Message-ID: <20240605115602.2964993-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605115602.2964993-1-sashal@kernel.org>
References: <20240605115602.2964993-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.12
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

From: Lang Yu <Lang.Yu@amd.com>

[ Upstream commit 2a705f3e49d20b59cd9e5cc3061b2d92ebe1e5f0 ]

Observed on gfx8 ASIC where KFD_IOC_ALLOC_MEM_FLAGS_AQL_QUEUE_MEM is used.
Two attachments use the same VM, root PD would be locked twice.

[   57.910418] Call Trace:
[   57.793726]  ? reserve_bo_and_cond_vms+0x111/0x1c0 [amdgpu]
[   57.793820]  amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu+0x6c/0x1c0 [amdgpu]
[   57.793923]  ? idr_get_next_ul+0xbe/0x100
[   57.793933]  kfd_process_device_free_bos+0x7e/0xf0 [amdgpu]
[   57.794041]  kfd_process_wq_release+0x2ae/0x3c0 [amdgpu]
[   57.794141]  ? process_scheduled_works+0x29c/0x580
[   57.794147]  process_scheduled_works+0x303/0x580
[   57.794157]  ? __pfx_worker_thread+0x10/0x10
[   57.794160]  worker_thread+0x1a2/0x370
[   57.794165]  ? __pfx_worker_thread+0x10/0x10
[   57.794167]  kthread+0x11b/0x150
[   57.794172]  ? __pfx_kthread+0x10/0x10
[   57.794177]  ret_from_fork+0x3d/0x60
[   57.794181]  ? __pfx_kthread+0x10/0x10
[   57.794184]  ret_from_fork_asm+0x1b/0x30

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index daa66eb4f722b..36796fbc00315 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1186,7 +1186,8 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 	int ret;
 
 	ctx->sync = &mem->sync;
-	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
+		      DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&ctx->exec) {
 		ctx->n_vms = 0;
 		list_for_each_entry(entry, &mem->attachments, list) {
-- 
2.43.0

