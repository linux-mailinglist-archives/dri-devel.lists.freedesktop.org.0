Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F80B1BCDF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 00:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9987910E701;
	Tue,  5 Aug 2025 22:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d+NfAI0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1865210E6FC;
 Tue,  5 Aug 2025 22:56:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 45DEA5C5E74;
 Tue,  5 Aug 2025 22:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFED4C4CEF0;
 Tue,  5 Aug 2025 22:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754434562;
 bh=+al342bVs+POurrkFCVBYQ90F4lkUhb3/Od3XV/5kIk=;
 h=From:To:Cc:Subject:Date:From;
 b=d+NfAI0C7M3SIMcRYMsBp571UxwDaQUyX6t4JIy6Q6Mmc7Ar1CWpPVraFpkOuKcdH
 l2Lpw6slA1d9W/GYWNiRgqEr09524WJjUoNhm/7bBeAA9tXvO90R6RcwTVdwwttE+H
 OVJzV0wk2thXCwMK7eVO8JPcgRqtr7BxjBs2+MtHatnZktnmGiVJUwCVJT/ol+1vt8
 j+obV2Iupe9FF/QHFre/vV7K46J4mXd3bdtAVphXPlaUUNQEdpZPYACRAukm0kodCs
 n+KGf8mr4bhifvFc1lepkylJrTMhjhtj+C2sogfznQohzOZpfdftWLO/hTOqY9ck3T
 wq42afdDnnl3A==
From: Sasha Levin <sashal@kernel.org>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH] drm/msm: Fix objtool warning in submit_lock_objects()
Date: Tue,  5 Aug 2025 18:55:57 -0400
Message-Id: <20250805225557.593192-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

Restructure submit_lock_objects() to use a single loop with break
statements to fix objtool warning:

  drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
  sibling call from callable instruction with modified stack frame

The drm_exec_until_all_locked() macro uses computed gotos internally
for its retry loop. Having return statements inside this macro, or
immediately after it in certain code paths, confuses objtool's static
analysis of stack frames, causing it to incorrectly flag tail call
optimizations.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 43 ++++++++++++----------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5f8e939a5906..253347b6e328 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -276,46 +276,41 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 {
 	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
 	struct drm_exec *exec = &submit->exec;
-	int ret;
+	int ret = 0;
 
-	if (msm_context_is_vmbind(submit->queue->ctx)) {
+	if (msm_context_is_vmbind(submit->queue->ctx))
 		flags |= DRM_EXEC_IGNORE_DUPLICATES;
 
-		drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
-		drm_exec_until_all_locked (&submit->exec) {
+	drm_exec_until_all_locked (&submit->exec) {
+		if (msm_context_is_vmbind(submit->queue->ctx)) {
 			ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
 			drm_exec_retry_on_contention(exec);
 			if (ret)
-				return ret;
+				break;
 
 			ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
 			drm_exec_retry_on_contention(exec);
 			if (ret)
-				return ret;
-		}
-
-		return 0;
-	}
-
-	drm_exec_init(&submit->exec, flags, submit->nr_bos);
-
-	drm_exec_until_all_locked (&submit->exec) {
-		ret = drm_exec_lock_obj(&submit->exec,
-					drm_gpuvm_resv_obj(submit->vm));
-		drm_exec_retry_on_contention(&submit->exec);
-		if (ret)
-			return ret;
-		for (unsigned i = 0; i < submit->nr_bos; i++) {
-			struct drm_gem_object *obj = submit->bos[i].obj;
-			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
+				break;
+		} else {
+			ret = drm_exec_lock_obj(&submit->exec,
+						drm_gpuvm_resv_obj(submit->vm));
 			drm_exec_retry_on_contention(&submit->exec);
 			if (ret)
-				return ret;
+				break;
+			for (unsigned i = 0; i < submit->nr_bos; i++) {
+				struct drm_gem_object *obj = submit->bos[i].obj;
+				ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
+				drm_exec_retry_on_contention(&submit->exec);
+				if (ret)
+					break;
+			}
 		}
 	}
 
-	return 0;
+	return ret;
 }
 
 static int submit_fence_sync(struct msm_gem_submit *submit)
-- 
2.39.5

