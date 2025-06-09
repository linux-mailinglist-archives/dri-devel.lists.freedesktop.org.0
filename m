Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B2AD1F54
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 15:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A1F10E37E;
	Mon,  9 Jun 2025 13:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L0lWXsSO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E7B10E37E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 13:45:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EDF814A0E5;
 Mon,  9 Jun 2025 13:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FD4C4CEEB;
 Mon,  9 Jun 2025 13:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749476728;
 bh=qXtn8nCi3MW8fsd1N4OFL3dO8Ir2Jp99YhMv8QolANY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L0lWXsSOnJoiLyJ4AeE6Yn9jUrso6v3fS8KHouTmwQ4CebRBdnZdWg4btYfGbko7g
 dG5pJCwpiOIAS5ckWWosR1kCOfnZqCArOsC9VNNPnDGgdvMJTlZ44L9j3lybgP2ar6
 mTEcB8HSvVmh9ZaTaqsSJNgixKfd/jFs5MSlmAh8pvH+sQtoOsvHdmCsFRm+jnDUKB
 uG6kN5LihRqEbanw8oGV/v9skIR4J8x8X0WxVN1zTT9Zmy3HXw1Is0FhMFTAH0gN5Z
 GA6dTofcqbC4Dz8ue9Hz4VHxwnaPNorEAr8Lks5kzyNQz4h5xh5OJ4pATC7VvT2WzI
 84rkHNz91cMxw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Lin.Cao" <lincao12@amd.com>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, matthew.brost@intel.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 08/29] drm/scheduler: signal scheduled fence when
 kill job
Date: Mon,  9 Jun 2025 09:44:49 -0400
Message-Id: <20250609134511.1342999-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609134511.1342999-1-sashal@kernel.org>
References: <20250609134511.1342999-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.10
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

From: "Lin.Cao" <lincao12@amd.com>

[ Upstream commit 471db2c2d4f80ee94225a1ef246e4f5011733e50 ]

When an entity from application B is killed, drm_sched_entity_kill()
removes all jobs belonging to that entity through
drm_sched_entity_kill_jobs_work(). If application A's job depends on a
scheduled fence from application B's job, and that fence is not properly
signaled during the killing process, application A's dependency cannot be
cleared.

This leads to application A hanging indefinitely while waiting for a
dependency that will never be resolved. Fix this issue by ensuring that
scheduled fences are properly signaled when an entity is killed, allowing
dependent applications to continue execution.

Signed-off-by: Lin.Cao <lincao12@amd.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
Signed-off-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/r/20250515020713.1110476-1-lincao12@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## Analysis of the Commit

### 1. **This is a Critical Bug Fix**

The commit fixes a serious bug where applications can hang indefinitely
when they depend on scheduled fences from killed jobs. The specific
change adds a single line:

```c
+       drm_sched_fence_scheduled(job->s_fence, NULL);
```

This line signals the scheduled fence when killing a job, which was
previously missing and caused the hang.

### 2. **Clear User-Visible Impact**

From the commit message:
- Application A's job depends on a scheduled fence from Application B's
  job
- When Application B is killed, the fence was not properly signaled
- This causes Application A to hang indefinitely waiting for a
  dependency that will never resolve

This is a real-world scenario that affects system stability and user
experience.

### 3. **Minimal and Safe Change**

The fix is:
- **One line addition** - extremely minimal change
- **Well-contained** - only affects the job kill path
- **No API/ABI changes** - just adds a missing fence signal
- **No new features** - purely fixes existing broken behavior

### 4. **Comparison with Similar Commits**

Looking at the historical commits provided:

**Similar Commit #1 (Backported: YES)** - "drm/scheduler: fix fence ref
counting"
- Fixed dependency fence leaks when processes were killed
- Added proper fence reference management
- Similar in nature: fixing fence handling in the kill path

This commit shares key characteristics:
- Fixes fence handling bugs in entity kill path
- Prevents resource leaks/hangs
- Minimal, targeted fix

The other similar commits (NOT backported) were either:
- Large architectural changes (Commit #3 - complete rework of dependency
  handling)
- Feature additions (Commit #4 - new error handling logic)
- Less critical fixes (Commit #5 - memleak in uncommon path)

### 5. **Risk Assessment**

**Low Risk**:
- The change only affects the error/kill path, not normal operation
- Signaling a fence with NULL is a valid operation indicating no
  hardware execution
- The `drm_sched_fence_finished()` call immediately after still signals
  completion with error
- No changes to data structures or algorithms

### 6. **Follows Stable Kernel Rules**

According to stable kernel rules, this commit qualifies because it:
- ✓ Fixes a real bug that affects users (application hangs)
- ✓ Is already in Linus's tree (has proper Link: tag)
- ✓ Is small and self-contained (1 line)
- ✓ Has been reviewed (Reviewed-by: tag present)
- ✓ Doesn't introduce new features
- ✓ Has clear problem description and solution

### 7. **Technical Details**

The fix ensures proper fence signaling order:
1. `drm_sched_fence_scheduled(job->s_fence, NULL)` - signals that the
   job was "scheduled" (even though it won't run)
2. `drm_sched_fence_finished(job->s_fence, -ESRCH)` - signals completion
   with error

This allows dependent jobs waiting on the scheduled fence to proceed and
handle the error appropriately, preventing indefinite hangs.

## Conclusion

This commit is an ideal candidate for stable backporting. It fixes a
serious user-visible bug (application hangs) with a minimal, well-
understood change that follows the established fence signaling pattern
in the DRM scheduler. The fix is similar in nature to previous commits
that were successfully backported, and the risk of regression is very
low since it only affects the error handling path.

 drivers/gpu/drm/scheduler/sched_entity.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index da00572d7d42e..2f0fe8df7becc 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -189,6 +189,7 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
 {
 	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
 
+	drm_sched_fence_scheduled(job->s_fence, NULL);
 	drm_sched_fence_finished(job->s_fence, -ESRCH);
 	WARN_ON(job->s_fence->parent);
 	job->sched->ops->free_job(job);
-- 
2.39.5

