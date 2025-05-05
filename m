Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC738AAA0A2
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CA710E4EA;
	Mon,  5 May 2025 22:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EPsYuB37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2CF10E4E9;
 Mon,  5 May 2025 22:37:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F0655C594E;
 Mon,  5 May 2025 22:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1424C4CEED;
 Mon,  5 May 2025 22:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484665;
 bh=8X9ddNDbU0jcoiFuiqpuu0HcacA5iDHnbRDAr8bUjsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EPsYuB37rImoTlqeEiI5aTjbXng9ezT+1xAqRKpUOyI02fu3PnsIdDXhy0EQvZ0+X
 KwVRMnLZcJqkf4prtrtKJxHCRNJKY/0OqVLU6ALVkjvkVpcE4gvSptoDUQjtubj8/I
 JeklYRyH+wtA0LOs8yEJHJVTySgIHNI5dqCK+JIFYg/yAWxBMAMO/7cYYBbz8NsTRO
 ANfxLKg+s8My1wzxbl+fVkfZnz03QJa7yAUJdHaFwXX+SmZ+dqPtaz7TafP1mVOG/g
 sKpNQE2vV4EaxrIVHxZ3lZQJnjvx54iVU21QhDxpRS9J9nXxkAE2wbY61cz5aVAc0q
 WId/Dkv2dJzoQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 594/642] drm/xe/pf: Reset GuC VF config when
 unprovisioning critical resource
Date: Mon,  5 May 2025 18:13:30 -0400
Message-Id: <20250505221419.2672473-594-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

[ Upstream commit 33f17e2cbd930a2a00eb007d9b241b6db010a880 ]

GuC firmware counts received VF configuration KLVs and may start
validation of the complete VF config even if some resources where
unprovisioned in the meantime, leading to unexpected errors like:

 $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/contexts_quota
 $ echo 0 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/contexts_quota
 $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/doorbells_quota
 $ echo 0 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/doorbells_quota
 $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/ggtt_quota
 tee: '/sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/ggtt_quota': Input/output error

To mitigate this problem trigger explicit VF config reset after
unprovisioning any of the critical resources (GGTT, context or
doorbell IDs) that GuC is monitoring.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250129195947.764-3-michal.wajdeczko@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 +++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index aaca54b40091f..27f309e3a76e6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -336,6 +336,26 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 	return err;
 }
 
+static int pf_push_vf_cfg(struct xe_gt *gt, unsigned int vfid, bool reset)
+{
+	int err = 0;
+
+	xe_gt_assert(gt, vfid);
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	if (reset)
+		err = pf_send_vf_cfg_reset(gt, vfid);
+	if (!err)
+		err = pf_push_full_vf_config(gt, vfid);
+
+	return err;
+}
+
+static int pf_refresh_vf_cfg(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_push_vf_cfg(gt, vfid, true);
+}
+
 static u64 pf_get_ggtt_alignment(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -432,6 +452,10 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 			return err;
 
 		pf_release_vf_config_ggtt(gt, config);
+
+		err = pf_refresh_vf_cfg(gt, vfid);
+		if (unlikely(err))
+			return err;
 	}
 	xe_gt_assert(gt, !xe_ggtt_node_allocated(config->ggtt_region));
 
@@ -757,6 +781,10 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
 			return ret;
 
 		pf_release_config_ctxs(gt, config);
+
+		ret = pf_refresh_vf_cfg(gt, vfid);
+		if (unlikely(ret))
+			return ret;
 	}
 
 	if (!num_ctxs)
@@ -1054,6 +1082,10 @@ static int pf_provision_vf_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs)
 			return ret;
 
 		pf_release_config_dbs(gt, config);
+
+		ret = pf_refresh_vf_cfg(gt, vfid);
+		if (unlikely(ret))
+			return ret;
 	}
 
 	if (!num_dbs)
@@ -2085,10 +2117,7 @@ int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh
 	xe_gt_assert(gt, vfid);
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
-	if (refresh)
-		err = pf_send_vf_cfg_reset(gt, vfid);
-	if (!err)
-		err = pf_push_full_vf_config(gt, vfid);
+	err = pf_push_vf_cfg(gt, vfid, refresh);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	if (unlikely(err)) {
-- 
2.39.5

