Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD355A65841
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 17:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CCF10E0F0;
	Mon, 17 Mar 2025 16:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S68RN/lM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7F410E0F0;
 Mon, 17 Mar 2025 16:37:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5365FA488CD;
 Mon, 17 Mar 2025 16:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976FBC4CEED;
 Mon, 17 Mar 2025 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742229469;
 bh=fTI6mTD6U6HzrRMuMomzwSD7v9bc+QEXsntyHFlOg0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S68RN/lMhLIYyBIMxhnUlqppbUHp/zkCipphcWRHxMrrbJFGmNOtWY2JLmjfxFemL
 RdcDiawHcUThOxQpdCNrgz+H5ovVcqFOXP2jDm2fVtXhzZiVfCIpdsBV/WIZWl4TV9
 Oeb13m43qY7bg0q9ZRglCqZR4nQ+bxKqusN4vjOCoTsyS5rjVHRKmJRezH0DVDI3sX
 yGb7YAeey3a9qDmvwG6kMJmGVIi0XDhDwhDQuqM7YyW9//+em9oT69x0jH2iHvRnF5
 k6w7eEqDR0yiqfsQzzqmYRHFzT9ENRAZ6AwETgFSOpbIzujVL850JR1PVaFb/tfLE+
 vjk50d4akC3SA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 10/16] drm/xe/guc_pc: Retry and wait longer for
 GuC PC start
Date: Mon, 17 Mar 2025 12:37:19 -0400
Message-Id: <20250317163725.1892824-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317163725.1892824-1-sashal@kernel.org>
References: <20250317163725.1892824-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.7
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

[ Upstream commit c605acb53f449f6289f042790307d7dc9e62d03d ]

In a rare situation of thermal limit during resume, GuC can
be slow and run into delays like this:

xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
   		 [status = 0x8002F034, timeouts = 0]
xe 0000:00:02.0: [drm] GT1: excessive init time: \
   		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
   		 perf_limit_reasons = 0x1C001000]
xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
------------[ cut here ]------------
xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO

When this happens, it will block entirely the GPU to be used.
So, let's try and with a huge timeout in the hope it comes back.

Also, let's collect some information on how long it is usually
taking on situations like this, so perhaps the time can be tuned
later.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250307160307.1093391-1-rodrigo.vivi@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(cherry picked from commit b4b05e53b550a886b4754b87fd0dd2b304579e85)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 53 +++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e8b9faeaef645..467d8a2879ecb 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -6,6 +6,7 @@
 #include "xe_guc_pc.h"
 
 #include <linux/delay.h>
+#include <linux/ktime.h>
 
 #include <drm/drm_managed.h>
 #include <generated/xe_wa_oob.h>
@@ -19,6 +20,7 @@
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_throttle.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -48,6 +50,9 @@
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
 
+#define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
+#define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
+
 /**
  * DOC: GuC Power Conservation (PC)
  *
@@ -112,9 +117,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
 	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
 
 static int wait_for_pc_state(struct xe_guc_pc *pc,
-			     enum slpc_global_state state)
+			     enum slpc_global_state state,
+			     int timeout_ms)
 {
-	int timeout_us = 5000; /* rought 5ms, but no need for precision */
+	int timeout_us = 1000 * timeout_ms;
 	int slept, wait = 10;
 
 	xe_device_assert_mem_access(pc_to_xe(pc));
@@ -163,7 +169,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 	};
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	/* Blocking here to ensure the results are ready before reading them */
@@ -186,7 +193,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 	};
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -207,7 +215,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -404,6 +413,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
 	return freq;
 }
 
+static u32 get_cur_freq(struct xe_gt *gt)
+{
+	u32 freq;
+
+	freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
+	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
+	return decode_freq(freq);
+}
+
 /**
  * xe_guc_pc_get_cur_freq - Get Current requested frequency
  * @pc: The GuC PC
@@ -427,10 +445,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 		return -ETIMEDOUT;
 	}
 
-	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
-
-	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
-	*freq = decode_freq(*freq);
+	*freq = get_cur_freq(gt);
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
@@ -965,6 +980,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	unsigned int fw_ref;
+	ktime_t earlier;
 	int ret;
 
 	xe_gt_assert(gt, xe_device_uc_enabled(xe));
@@ -989,14 +1005,25 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	memset(pc->bo->vmap.vaddr, 0, size);
 	slpc_shared_data_write(pc, header.size, size);
 
+	earlier = ktime_get();
 	ret = pc_action_reset(pc);
 	if (ret)
 		goto out;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
-		xe_gt_err(gt, "GuC PC Start failed\n");
-		ret = -EIO;
-		goto out;
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS)) {
+		xe_gt_warn(gt, "GuC PC start taking longer than normal [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
+			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
+			   xe_gt_throttle_get_limit_reasons(gt));
+
+		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+				      SLPC_RESET_EXTENDED_TIMEOUT_MS)) {
+			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
+			goto out;
+		}
+
+		xe_gt_warn(gt, "GuC PC excessive start time: %lldms",
+			   ktime_ms_delta(ktime_get(), earlier));
 	}
 
 	ret = pc_init_freqs(pc);
-- 
2.39.5

