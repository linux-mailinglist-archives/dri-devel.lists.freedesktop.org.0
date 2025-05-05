Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41169AAA02B
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88A810E4AF;
	Mon,  5 May 2025 22:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NnBnADpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C61310E4AF;
 Mon,  5 May 2025 22:32:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B9BA961129;
 Mon,  5 May 2025 22:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AA3C4CEE4;
 Mon,  5 May 2025 22:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484340;
 bh=IalM9L5efkNTEa16hmoVEVF62GEGUp+xR1nAhVa6dc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NnBnADpuO3Jq5JFeDBw0Mf4K6mZ8fBqZjI0pfHMYA+KtrEtObLl0xe2wht2IY+M4X
 YIOjCjbYQYH8UJhsKPw5I7b5fOMEhUYOPv5mpmOf63CiMAx067a/mUMdNi04HoXgdR
 6e+XbvQ1SrQgyXhPAV3Qw1LeKB9kKetEd8unUs68sJqSurrDV7EuUYbGukxoIP5HuF
 LLhBr8s0dfz/yb3BuCtBadSAX8FvPHvTxiu5C8NQkIlLpDsFoJoIbHwsE9zp3epPFF
 enqrYz+ySwZfuR+tMZcUq/JoLrqqF4fROdnBFpuaA/me3jY3T/OSKHFq5cONdJdXD8
 xFNPxhF9N+jqw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Eric Huang <jinhuieric.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Sasha Levin <sashal@kernel.org>, Felix.Kuehling@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 459/642] drm/amdkfd: fix missing L2 cache info in
 topology
Date: Mon,  5 May 2025 18:11:15 -0400
Message-Id: <20250505221419.2672473-459-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Eric Huang <jinhuieric.huang@amd.com>

[ Upstream commit 5ffd56822a7159917306d99f18fd15dfd7288f20 ]

In some ASICs L2 cache info may miss in kfd topology,
because the first bitmap may be empty, that means
the first cu may be inactive, so to find the first
active cu will solve the issue.

v2: Only find the first active cu in the first xcc

Signed-off-by: Eric Huang <jinhuieric.huang@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 334c576a75b14..98317eda2cdb4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1683,17 +1683,32 @@ static int fill_in_l2_l3_pcache(struct kfd_cache_properties **props_ext,
 				int cache_type, unsigned int cu_processor_id,
 				struct kfd_node *knode)
 {
-	unsigned int cu_sibling_map_mask;
+	unsigned int cu_sibling_map_mask = 0;
 	int first_active_cu;
 	int i, j, k, xcc, start, end;
 	int num_xcc = NUM_XCC(knode->xcc_mask);
 	struct kfd_cache_properties *pcache = NULL;
 	enum amdgpu_memory_partition mode;
 	struct amdgpu_device *adev = knode->adev;
+	bool found = false;
 
 	start = ffs(knode->xcc_mask) - 1;
 	end = start + num_xcc;
-	cu_sibling_map_mask = cu_info->bitmap[start][0][0];
+
+	/* To find the bitmap in the first active cu in the first
+	 * xcc, it is based on the assumption that evrey xcc must
+	 * have at least one active cu.
+	 */
+	for (i = 0; i < gfx_info->max_shader_engines && !found; i++) {
+		for (j = 0; j < gfx_info->max_sh_per_se && !found; j++) {
+			if (cu_info->bitmap[start][i % 4][j % 4]) {
+				cu_sibling_map_mask =
+					cu_info->bitmap[start][i % 4][j % 4];
+				found = true;
+			}
+		}
+	}
+
 	cu_sibling_map_mask &=
 		((1 << pcache_info[cache_type].num_cu_shared) - 1);
 	first_active_cu = ffs(cu_sibling_map_mask);
-- 
2.39.5

