Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18439AD1F71
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 15:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F7710E38F;
	Mon,  9 Jun 2025 13:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PRtIz9Br";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F06D10E38F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 13:46:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 877885C5522;
 Mon,  9 Jun 2025 13:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F9FC4CEEB;
 Mon,  9 Jun 2025 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749476781;
 bh=N15FAyzt7MMYc8Spk0zWPQIRL21MN1ZoTF3KScracOM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PRtIz9BriiPmBg4psKTKNeXLGFNHikE52cNq0+zHPSzuqlRDn1HlIaoHIV0HqA2zQ
 r6LIBEsMUrNzFVztGCW+i6w42bxRxtdK5ZPRFSLFrQmL7t+YVgHuSBgVpQnaF/Csjz
 6M5iPYX/gcHpXnXqQP+I7Ns0uAFUFibJQKMDn+XFDQjGDwejg6yK49rSHbowQXoyzR
 btGZF9nBB8pW9ujvb5t/MXut2HjAS3PiYUc9Um38g3fTJ4+OP1hKILqOMsO89qmroF
 Ne3tpqlFzmOZBpIZ+rd+BHGpqvhRywcyLePEtn0Zve5GpxLHPQNTc8jyTUdou0RR0+
 lhx3j8No6HiMQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Lin.Cao" <lincao12@amd.com>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, matthew.brost@intel.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 07/23] drm/scheduler: signal scheduled fence when
 kill job
Date: Mon,  9 Jun 2025 09:45:54 -0400
Message-Id: <20250609134610.1343777-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609134610.1343777-1-sashal@kernel.org>
References: <20250609134610.1343777-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.32
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
index 002057be0d84a..c9c50e3b18a23 100644
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

