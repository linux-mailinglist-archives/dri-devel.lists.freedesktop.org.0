Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217719BDBDF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 03:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC2F10E647;
	Wed,  6 Nov 2024 02:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gj28V6pB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CCE10E647;
 Wed,  6 Nov 2024 02:09:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DC7F2A41BD8;
 Wed,  6 Nov 2024 02:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD45C4CECF;
 Wed,  6 Nov 2024 02:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730858996;
 bh=kOLAwUvIL2dyE5vEwHs72gGgdtVM5z29R9bEbSjh1Gc=;
 h=From:To:Cc:Subject:Date:From;
 b=gj28V6pBFzRLTdbWqDuG46lHT6zLWxWyLLydVidhG6tLDGbNhvajy86KINRZWBo1r
 coj8YGqZBvzvKUL9Pn5VyYfvLhVn34bYAYwAjOtlcoCeFY6siJmgs4yatPBP9lqZMn
 PNtKGGR2wNne5BVpKO7a7vsXRkMaiqtWKZYEj+bAQkSqYbVWzS7c3RzULCIDuEH8N3
 Et/eN6O0qBGCoi7OQdklKl+TY328Om594wLu3nXBjrnIumRBBiXqM83k7XZxzJEwHL
 89F6Bzs/IBGCGfGBJ16bkrZTXyifRi/odXHHkVIUEqGIrk/qMTlIs1Gqkz3LlwdtCX
 K0R51BwsMGbVg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	tvrtko.ursulin@igalia.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Evan Quan <evan.quan@amd.com>, Wenyou Yang <WenYou.Yang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/pm: Vangogh: Fix kernel memory out of bounds
 write" failed to apply to v6.6-stable tree
Date: Tue,  5 Nov 2024 21:09:52 -0500
Message-ID: <20241106020953.174611-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the v6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 4aa923a6e6406b43566ef6ac35a3d9a3197fa3e8 Mon Sep 17 00:00:00 2001
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Fri, 25 Oct 2024 15:56:39 +0100
Subject: [PATCH] drm/amd/pm: Vangogh: Fix kernel memory out of bounds write

KASAN reports that the GPU metrics table allocated in
vangogh_tables_init() is not large enough for the memset done in
smu_cmn_init_soft_gpu_metrics(). Condensed report follows:

[   33.861314] BUG: KASAN: slab-out-of-bounds in smu_cmn_init_soft_gpu_metrics+0x73/0x200 [amdgpu]
[   33.861799] Write of size 168 at addr ffff888129f59500 by task mangoapp/1067
...
[   33.861808] CPU: 6 UID: 1000 PID: 1067 Comm: mangoapp Tainted: G        W          6.12.0-rc4 #356 1a56f59a8b5182eeaf67eb7cb8b13594dd23b544
[   33.861816] Tainted: [W]=WARN
[   33.861818] Hardware name: Valve Galileo/Galileo, BIOS F7G0107 12/01/2023
[   33.861822] Call Trace:
[   33.861826]  <TASK>
[   33.861829]  dump_stack_lvl+0x66/0x90
[   33.861838]  print_report+0xce/0x620
[   33.861853]  kasan_report+0xda/0x110
[   33.862794]  kasan_check_range+0xfd/0x1a0
[   33.862799]  __asan_memset+0x23/0x40
[   33.862803]  smu_cmn_init_soft_gpu_metrics+0x73/0x200 [amdgpu 13b1bc364ec578808f676eba412c20eaab792779]
[   33.863306]  vangogh_get_gpu_metrics_v2_4+0x123/0xad0 [amdgpu 13b1bc364ec578808f676eba412c20eaab792779]
[   33.864257]  vangogh_common_get_gpu_metrics+0xb0c/0xbc0 [amdgpu 13b1bc364ec578808f676eba412c20eaab792779]
[   33.865682]  amdgpu_dpm_get_gpu_metrics+0xcc/0x110 [amdgpu 13b1bc364ec578808f676eba412c20eaab792779]
[   33.866160]  amdgpu_get_gpu_metrics+0x154/0x2d0 [amdgpu 13b1bc364ec578808f676eba412c20eaab792779]
[   33.867135]  dev_attr_show+0x43/0xc0
[   33.867147]  sysfs_kf_seq_show+0x1f1/0x3b0
[   33.867155]  seq_read_iter+0x3f8/0x1140
[   33.867173]  vfs_read+0x76c/0xc50
[   33.867198]  ksys_read+0xfb/0x1d0
[   33.867214]  do_syscall_64+0x90/0x160
...
[   33.867353] Allocated by task 378 on cpu 7 at 22.794876s:
[   33.867358]  kasan_save_stack+0x33/0x50
[   33.867364]  kasan_save_track+0x17/0x60
[   33.867367]  __kasan_kmalloc+0x87/0x90
[   33.867371]  vangogh_init_smc_tables+0x3f9/0x840 [amdgpu]
[   33.867835]  smu_sw_init+0xa32/0x1850 [amdgpu]
[   33.868299]  amdgpu_device_init+0x467b/0x8d90 [amdgpu]
[   33.868733]  amdgpu_driver_load_kms+0x19/0xf0 [amdgpu]
[   33.869167]  amdgpu_pci_probe+0x2d6/0xcd0 [amdgpu]
[   33.869608]  local_pci_probe+0xda/0x180
[   33.869614]  pci_device_probe+0x43f/0x6b0

Empirically we can confirm that the former allocates 152 bytes for the
table, while the latter memsets the 168 large block.

Root cause appears that when GPU metrics tables for v2_4 parts were added
it was not considered to enlarge the table to fit.

The fix in this patch is rather "brute force" and perhaps later should be
done in a smarter way, by extracting and consolidating the part version to
size logic to a common helper, instead of brute forcing the largest
possible allocation. Nevertheless, for now this works and fixes the out of
bounds write.

v2:
 * Drop impossible v3_0 case. (Mario)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 41cec40bc9ba ("drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire gpu_metrics")
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Evan Quan <evan.quan@amd.com>
Cc: Wenyou Yang <WenYou.Yang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://lore.kernel.org/r/20241025145639.19124-1-tursulin@igalia.com
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 0880f58f9609f0200483a49429af0f050d281703)
Cc: stable@vger.kernel.org # v6.6+
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 22737b11b1bfb..1fe020f1f4dbe 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -242,7 +242,9 @@ static int vangogh_tables_init(struct smu_context *smu)
 		goto err0_out;
 	smu_table->metrics_time = 0;
 
-	smu_table->gpu_metrics_table_size = max(sizeof(struct gpu_metrics_v2_3), sizeof(struct gpu_metrics_v2_2));
+	smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v2_2);
+	smu_table->gpu_metrics_table_size = max(smu_table->gpu_metrics_table_size, sizeof(struct gpu_metrics_v2_3));
+	smu_table->gpu_metrics_table_size = max(smu_table->gpu_metrics_table_size, sizeof(struct gpu_metrics_v2_4));
 	smu_table->gpu_metrics_table = kzalloc(smu_table->gpu_metrics_table_size, GFP_KERNEL);
 	if (!smu_table->gpu_metrics_table)
 		goto err1_out;
-- 
2.43.0




