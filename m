Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A45CAE5AE5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 06:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F96B10E4B7;
	Tue, 24 Jun 2025 04:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UwMe/zCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A157210E043;
 Tue, 24 Jun 2025 04:12:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 85CCE43EFD;
 Tue, 24 Jun 2025 04:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A1AC4CEF0;
 Tue, 24 Jun 2025 04:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750738336;
 bh=NTvZ0DH90TlstUm/9qBPR4TFSAk+JfvQQFtyLXD7+t0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UwMe/zCK0VGkUgOfRJudC7MLTi8nq+MdvNNKZ7154Zcl97f/8kJqJodS6AqVX4fsd
 rUKiOsW6+YmpKDm59AD7LM//hL89xSi0pLFGoMVG6gr0UkWVJ/4eSeIVwlKxIsffgK
 OgCP+ZNd484PtdbD9OhS/Z9aT47E2ILo4kRqf3Q360IJIaONz7N13X5DTygT/bg0HM
 0RN0LuSWibf+O4D+1+MGDreX3sDnljDRpXjOofU6wiRwVfZjlH0vOWX3KOEBubSbby
 PM3xw9xgpJkhdsAOZNflJhjAX3uGc3Y6CZlU2pfXpgPMhwzbjyIohFO7r22+M+/AKz
 8HpYBOyLgx1eg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sasha Levin <sashal@kernel.org>,
 lumag@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 02/18] drm/msm: Fix another leak in the submit
 error path
Date: Tue, 24 Jun 2025 00:11:58 -0400
Message-Id: <20250624041214.84135-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624041214.84135-1-sashal@kernel.org>
References: <20250624041214.84135-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.94
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

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit f681c2aa8676a890eacc84044717ab0fd26e058f ]

put_unused_fd() doesn't free the installed file, if we've already done
fd_install().  So we need to also free the sync_file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Patchwork: https://patchwork.freedesktop.org/patch/653583/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis, **YES**, this commit should be backported to
stable kernel trees.

## Extensive Explanation:

This commit fixes a **resource leak** in the MSM DRM driver's submit
error path, which is a clear bug that affects users and meets the stable
tree criteria.

### The Bug:

Looking at the code changes in `msm_gem_submit.c`:

1. **Before the fix**: When an error occurs after `fd_install()` has
   been called (line 865 in the context), the error path only calls
   `put_unused_fd(out_fence_fd)` at line 895-896.

2. **The problem**: As noted in the commit message, `put_unused_fd()`
   doesn't free the installed file if `fd_install()` has already been
   executed. The `sync_file` structure created by `sync_file_create()`
   (line 861) contains a file reference that needs to be released with
   `fput()`.

3. **The fix**: The patch adds proper cleanup by:
   - Moving `sync_file` declaration to function scope (line 661)
   - Adding proper cleanup in the error path (lines 895-898) that calls
     both `put_unused_fd()` AND `fput(sync_file->file)` when needed

### Why This Is a Good Backport Candidate:

1. **Clear Bug Fix**: This fixes a resource leak that can accumulate
   over time as applications hit error conditions during fence
   submission.

2. **Small and Contained**: The fix is minimal - just 5 lines of actual
   code changes that properly clean up resources.

3. **No Architectural Changes**: This doesn't introduce new features or
   change any APIs - it simply fixes error handling.

4. **Similar to Previous Backported Fixes**: Looking at similar commit
   #3 ("drm/msm: Fix submit error-path leaks") which was marked for
   backporting, this follows the same pattern of fixing resource leaks
   in error paths.

5. **Low Risk**: The change only affects error paths and adds proper
   cleanup that was missing. It cannot break the normal success path.

6. **Documentation Confirms**: The sync_file.c documentation (line
   62-63) explicitly states that sync_files should be released with
   `fput(sync_file->file)`, confirming this is the correct fix.

### Pattern Analysis:

Comparing with the similar commits provided:
- Similar commits #1, #2, and #4 were NOT backported (they were general
  code improvements or non-critical changes)
- Similar commits #3 and #5 WERE backported (they fixed actual resource
  leaks or initialization failures)

This commit clearly falls into the same category as #3 and #5 - fixing
an actual resource leak that can impact system stability over time.

The leak occurs whenever:
1. A sync_file is successfully created
2. fd_install() succeeds
3. But then a subsequent error occurs before the submit completes

Without this fix, each occurrence leaks a file descriptor and associated
kernel memory, which could eventually exhaust resources in systems with
heavy GPU usage that encounter errors.

 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 27366304f5d59..bbe4f1665b603 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -763,6 +763,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
+	struct sync_file *sync_file = NULL;
 	int out_fence_fd = -1;
 	bool has_ww_ticket = false;
 	unsigned i;
@@ -979,7 +980,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		struct sync_file *sync_file = sync_file_create(submit->user_fence);
+		sync_file = sync_file_create(submit->user_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
 		} else {
@@ -1012,8 +1013,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out_unlock:
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (ret && (out_fence_fd >= 0))
+	if (ret && (out_fence_fd >= 0)) {
 		put_unused_fd(out_fence_fd);
+		if (sync_file)
+			fput(sync_file->file);
+	}
 
 	if (!IS_ERR_OR_NULL(submit)) {
 		msm_gem_submit_put(submit);
-- 
2.39.5

