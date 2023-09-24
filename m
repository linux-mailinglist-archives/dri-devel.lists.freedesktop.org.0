Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835317AC87E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 15:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195D010E14A;
	Sun, 24 Sep 2023 13:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3FC10E10F;
 Sun, 24 Sep 2023 13:17:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 60F95B80AD9;
 Sun, 24 Sep 2023 13:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764FFC433CA;
 Sun, 24 Sep 2023 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695561418;
 bh=J12u98I8qiggXGuy3u2RDnYVUU2rV/5bXr1RF7MliBc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JcGUhOpPS+TZcVR4LKbpv2z6D6TwzHsaJszDbEMNYSxmPBfLPjAmOK/k7KvUbPB9B
 OagPqW6osktVf5GuqSVQSyo85/AsoH700hL3kxoyxT+V9V+6Ge068jR1exWZXfy9v2
 17eKVQuUXPfrDQwdxZz6sZxGn7hsXoNN9dHuHpfXZyRdC8PvyWElzERSdl81fEawrp
 AG5sqEffSUHlP087sb/A6XSi8f1eu90ZE7bavI0G5rhn7kG8ueuTHidUQ0gHcaQY7B
 Tz1pT9lpLbFD8SXYHPcbQxIs28VNnGgtUJGopQWwh6MITdf7cOfqXmms1TyWlsdvCy
 xc7I/+20eREwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 26/41] drm/amdkfd: Update CU masking for GFX 9.4.3
Date: Sun, 24 Sep 2023 09:15:14 -0400
Message-Id: <20230924131529.1275335-26-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131529.1275335-1-sashal@kernel.org>
References: <20230924131529.1275335-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.5
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
Cc: Sasha Levin <sashal@kernel.org>, Mukul Joshi <mukul.joshi@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mukul Joshi <mukul.joshi@amd.com>

[ Upstream commit fc6efed2c728c9c10b058512fc9c1613f870a8e8 ]

The CU mask passed from user-space will change based on
different spatial partitioning mode. As a result, update
CU masking code for GFX9.4.3 to work for all partitioning
modes.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c  | 28 ++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |  2 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |  2 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  2 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  |  2 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   | 46 ++++++++++++-------
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |  2 +-
 7 files changed, 56 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
index 35e05ee89eac5..254f343f967a3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
@@ -97,14 +97,16 @@ void free_mqd_hiq_sdma(struct mqd_manager *mm, void *mqd,
 
 void mqd_symmetrically_map_cu_mask(struct mqd_manager *mm,
 		const uint32_t *cu_mask, uint32_t cu_mask_count,
-		uint32_t *se_mask)
+		uint32_t *se_mask, uint32_t inst)
 {
 	struct kfd_cu_info cu_info;
 	uint32_t cu_per_sh[KFD_MAX_NUM_SE][KFD_MAX_NUM_SH_PER_SE] = {0};
 	bool wgp_mode_req = KFD_GC_VERSION(mm->dev) >= IP_VERSION(10, 0, 0);
 	uint32_t en_mask = wgp_mode_req ? 0x3 : 0x1;
-	int i, se, sh, cu, cu_bitmap_sh_mul, inc = wgp_mode_req ? 2 : 1;
+	int i, se, sh, cu, cu_bitmap_sh_mul, cu_inc = wgp_mode_req ? 2 : 1;
 	uint32_t cu_active_per_node;
+	int inc = cu_inc * NUM_XCC(mm->dev->xcc_mask);
+	int xcc_inst = inst + ffs(mm->dev->xcc_mask) - 1;
 
 	amdgpu_amdkfd_get_cu_info(mm->dev->adev, &cu_info);
 
@@ -143,7 +145,8 @@ void mqd_symmetrically_map_cu_mask(struct mqd_manager *mm,
 	for (se = 0; se < cu_info.num_shader_engines; se++)
 		for (sh = 0; sh < cu_info.num_shader_arrays_per_engine; sh++)
 			cu_per_sh[se][sh] = hweight32(
-				cu_info.cu_bitmap[0][se % 4][sh + (se / 4) * cu_bitmap_sh_mul]);
+				cu_info.cu_bitmap[xcc_inst][se % 4][sh + (se / 4) *
+				cu_bitmap_sh_mul]);
 
 	/* Symmetrically map cu_mask to all SEs & SHs:
 	 * se_mask programs up to 2 SH in the upper and lower 16 bits.
@@ -166,20 +169,33 @@ void mqd_symmetrically_map_cu_mask(struct mqd_manager *mm,
 	 * cu_mask[0] bit8 -> se_mask[0] bit1 (SE0,SH0,CU1)
 	 * ...
 	 *
+	 * For GFX 9.4.3, the following code only looks at a
+	 * subset of the cu_mask corresponding to the inst parameter.
+	 * If we have n XCCs under one GPU node
+	 * cu_mask[0] bit0 -> XCC0 se_mask[0] bit0 (XCC0,SE0,SH0,CU0)
+	 * cu_mask[0] bit1 -> XCC1 se_mask[0] bit0 (XCC1,SE0,SH0,CU0)
+	 * ..
+	 * cu_mask[0] bitn -> XCCn se_mask[0] bit0 (XCCn,SE0,SH0,CU0)
+	 * cu_mask[0] bit n+1 -> XCC0 se_mask[1] bit0 (XCC0,SE1,SH0,CU0)
+	 *
+	 * For example, if there are 6 XCCs under 1 KFD node, this code
+	 * running for each inst, will look at the bits as:
+	 * inst, inst + 6, inst + 12...
+	 *
 	 * First ensure all CUs are disabled, then enable user specified CUs.
 	 */
 	for (i = 0; i < cu_info.num_shader_engines; i++)
 		se_mask[i] = 0;
 
-	i = 0;
-	for (cu = 0; cu < 16; cu += inc) {
+	i = inst;
+	for (cu = 0; cu < 16; cu += cu_inc) {
 		for (sh = 0; sh < cu_info.num_shader_arrays_per_engine; sh++) {
 			for (se = 0; se < cu_info.num_shader_engines; se++) {
 				if (cu_per_sh[se][sh] > cu) {
 					if (cu_mask[i / 32] & (en_mask << (i % 32)))
 						se_mask[se] |= en_mask << (cu + sh * 16);
 					i += inc;
-					if (i == cu_mask_count)
+					if (i >= cu_mask_count)
 						return;
 				}
 			}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
index 23158db7da035..57bf5e513f4d1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
@@ -138,7 +138,7 @@ void free_mqd_hiq_sdma(struct mqd_manager *mm, void *mqd,
 
 void mqd_symmetrically_map_cu_mask(struct mqd_manager *mm,
 		const uint32_t *cu_mask, uint32_t cu_mask_count,
-		uint32_t *se_mask);
+		uint32_t *se_mask, uint32_t inst);
 
 int kfd_hiq_load_mqd_kiq(struct mqd_manager *mm, void *mqd,
 		uint32_t pipe_id, uint32_t queue_id,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
index 65c9f01a1f86c..faa01ee0d1655 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -52,7 +52,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 		return;
 
 	mqd_symmetrically_map_cu_mask(mm,
-		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask);
+		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask, 0);
 
 	m = get_mqd(mqd);
 	m->compute_static_thread_mgmt_se0 = se_mask[0];
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index 94c0fc2e57b7f..0fcb176601295 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -52,7 +52,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 		return;
 
 	mqd_symmetrically_map_cu_mask(mm,
-		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask);
+		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask, 0);
 
 	m = get_mqd(mqd);
 	m->compute_static_thread_mgmt_se0 = se_mask[0];
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
index 23b30783dce31..97f754949ca92 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
@@ -71,7 +71,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 	}
 
 	mqd_symmetrically_map_cu_mask(mm,
-		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask);
+		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask, 0);
 
 	m->compute_static_thread_mgmt_se0 = se_mask[0];
 	m->compute_static_thread_mgmt_se1 = se_mask[1];
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 601bb9f68048c..a76ae27c8a919 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -60,7 +60,7 @@ static inline struct v9_sdma_mqd *get_sdma_mqd(void *mqd)
 }
 
 static void update_cu_mask(struct mqd_manager *mm, void *mqd,
-			struct mqd_update_info *minfo)
+			struct mqd_update_info *minfo, uint32_t inst)
 {
 	struct v9_mqd *m;
 	uint32_t se_mask[KFD_MAX_NUM_SE] = {0};
@@ -69,27 +69,36 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 		return;
 
 	mqd_symmetrically_map_cu_mask(mm,
-		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask);
+		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask, inst);
 
 	m = get_mqd(mqd);
+
 	m->compute_static_thread_mgmt_se0 = se_mask[0];
 	m->compute_static_thread_mgmt_se1 = se_mask[1];
 	m->compute_static_thread_mgmt_se2 = se_mask[2];
 	m->compute_static_thread_mgmt_se3 = se_mask[3];
-	m->compute_static_thread_mgmt_se4 = se_mask[4];
-	m->compute_static_thread_mgmt_se5 = se_mask[5];
-	m->compute_static_thread_mgmt_se6 = se_mask[6];
-	m->compute_static_thread_mgmt_se7 = se_mask[7];
-
-	pr_debug("update cu mask to %#x %#x %#x %#x %#x %#x %#x %#x\n",
-		m->compute_static_thread_mgmt_se0,
-		m->compute_static_thread_mgmt_se1,
-		m->compute_static_thread_mgmt_se2,
-		m->compute_static_thread_mgmt_se3,
-		m->compute_static_thread_mgmt_se4,
-		m->compute_static_thread_mgmt_se5,
-		m->compute_static_thread_mgmt_se6,
-		m->compute_static_thread_mgmt_se7);
+	if (KFD_GC_VERSION(mm->dev) != IP_VERSION(9, 4, 3)) {
+		m->compute_static_thread_mgmt_se4 = se_mask[4];
+		m->compute_static_thread_mgmt_se5 = se_mask[5];
+		m->compute_static_thread_mgmt_se6 = se_mask[6];
+		m->compute_static_thread_mgmt_se7 = se_mask[7];
+
+		pr_debug("update cu mask to %#x %#x %#x %#x %#x %#x %#x %#x\n",
+			m->compute_static_thread_mgmt_se0,
+			m->compute_static_thread_mgmt_se1,
+			m->compute_static_thread_mgmt_se2,
+			m->compute_static_thread_mgmt_se3,
+			m->compute_static_thread_mgmt_se4,
+			m->compute_static_thread_mgmt_se5,
+			m->compute_static_thread_mgmt_se6,
+			m->compute_static_thread_mgmt_se7);
+	} else {
+		pr_debug("inst: %u, update cu mask to %#x %#x %#x %#x\n",
+			inst, m->compute_static_thread_mgmt_se0,
+			m->compute_static_thread_mgmt_se1,
+			m->compute_static_thread_mgmt_se2,
+			m->compute_static_thread_mgmt_se3);
+	}
 }
 
 static void set_priority(struct v9_mqd *m, struct queue_properties *q)
@@ -290,7 +299,8 @@ static void update_mqd(struct mqd_manager *mm, void *mqd,
 	if (mm->dev->kfd->cwsr_enabled && q->ctx_save_restore_area_address)
 		m->cp_hqd_ctx_save_control = 0;
 
-	update_cu_mask(mm, mqd, minfo);
+	if (KFD_GC_VERSION(mm->dev) != IP_VERSION(9, 4, 3))
+		update_cu_mask(mm, mqd, minfo, 0);
 	set_priority(m, q);
 
 	q->is_active = QUEUE_IS_ACTIVE(*q);
@@ -654,6 +664,8 @@ static void update_mqd_v9_4_3(struct mqd_manager *mm, void *mqd,
 		m = get_mqd(mqd + size * xcc);
 		update_mqd(mm, m, q, minfo);
 
+		update_cu_mask(mm, mqd, minfo, xcc);
+
 		if (q->format == KFD_QUEUE_FORMAT_AQL) {
 			switch (xcc) {
 			case 0:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index d1e962da51dd3..2551a7529b5e0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
@@ -55,7 +55,7 @@ static void update_cu_mask(struct mqd_manager *mm, void *mqd,
 		return;
 
 	mqd_symmetrically_map_cu_mask(mm,
-		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask);
+		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask, 0);
 
 	m = get_mqd(mqd);
 	m->compute_static_thread_mgmt_se0 = se_mask[0];
-- 
2.40.1

