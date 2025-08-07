Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EADB1D8A5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 15:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C2810E169;
	Thu,  7 Aug 2025 13:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cfcqk+2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA8810E169;
 Thu,  7 Aug 2025 13:11:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5207E601BB;
 Thu,  7 Aug 2025 13:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA39C4CEEB;
 Thu,  7 Aug 2025 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754572264;
 bh=Aaqn6wdS/DoynQGLnl7lgxbV5pDHSEtutNYoP0S1tNs=;
 h=From:To:Cc:Subject:Date:From;
 b=Cfcqk+2nCl7jdrLXeY51/6Xu1vl5bzkWjWJpErz/+Yh5N7vyHjok+3enlHAGeb4/g
 Ti3AYdvXs4bfp92WanoF2MiLWNmTq40xg/WhL3JQ6TgJBX/9FPCpAKAJmoWHmjVYdP
 MKtu1YK7qvSy6zy7z+xymGj5zVe19p5o34+/mUl8GbxHVjqlVl0WA01eB6nIMNb/bJ
 k2ih5Ywsjf4s4kUXsdGfqZ1Xkoa2rdXgEIn9SExWdqeoB47RzlC20t12I8TceyyhI/
 T3xT36DCahW9SjMMCLyUHmV3J3tE1Uqw2MeRrs6uZf68QqOT8vw/Mfu93wk7jIL3cD
 dOGWsv+QzFtCQ==
From: Sasha Levin <sashal@kernel.org>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH v2] drm/msm: Fix objtool warning in submit_lock_objects()
Date: Thu,  7 Aug 2025 09:10:58 -0400
Message-Id: <20250807131058.1013858-1-sashal@kernel.org>
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

Split the vmbind case into a separate helper function
submit_lock_objects_vmbind() to fix objtool warning:

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

Changes since v1:
 - Extract helper submit_lock_objects_vmbind() instead of refactoring
   single loop

 drivers/gpu/drm/msm/msm_gem_submit.c | 49 +++++++++++++++-------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5f8e939a5906..1ce90e351b7a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -271,32 +271,37 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 	return ret;
 }
 
-/* This is where we make sure all the bo's are reserved and pin'd: */
-static int submit_lock_objects(struct msm_gem_submit *submit)
+static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 {
-	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
+	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_DUPLICATES;
 	struct drm_exec *exec = &submit->exec;
-	int ret;
+	int ret = 0;
 
-	if (msm_context_is_vmbind(submit->queue->ctx)) {
-		flags |= DRM_EXEC_IGNORE_DUPLICATES;
+	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
-		drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	drm_exec_until_all_locked (&submit->exec) {
+		ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			break;
 
-		drm_exec_until_all_locked (&submit->exec) {
-			ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
-			drm_exec_retry_on_contention(exec);
-			if (ret)
-				return ret;
+		ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			break;
+	}
 
-			ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
-			drm_exec_retry_on_contention(exec);
-			if (ret)
-				return ret;
-		}
+	return ret;
+}
 
-		return 0;
-	}
+/* This is where we make sure all the bo's are reserved and pin'd: */
+static int submit_lock_objects(struct msm_gem_submit *submit)
+{
+	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
+	int ret = 0;
+
+	if (msm_context_is_vmbind(submit->queue->ctx))
+		return submit_lock_objects_vmbind(submit);
 
 	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
@@ -305,17 +310,17 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 					drm_gpuvm_resv_obj(submit->vm));
 		drm_exec_retry_on_contention(&submit->exec);
 		if (ret)
-			return ret;
+			break;
 		for (unsigned i = 0; i < submit->nr_bos; i++) {
 			struct drm_gem_object *obj = submit->bos[i].obj;
 			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
 			drm_exec_retry_on_contention(&submit->exec);
 			if (ret)
-				return ret;
+				break;
 		}
 	}
 
-	return 0;
+	return ret;
 }
 
 static int submit_fence_sync(struct msm_gem_submit *submit)
-- 
2.39.5

