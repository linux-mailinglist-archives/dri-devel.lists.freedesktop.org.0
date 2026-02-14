Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCV5OoLKj2ntTgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:06:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6264113A6C6
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C2E10E85B;
	Sat, 14 Feb 2026 01:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W/XzT3LV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60E310E85B
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 01:06:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4895360054;
 Sat, 14 Feb 2026 01:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B6CC16AAE;
 Sat, 14 Feb 2026 01:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771031167;
 bh=6d2F1iemyx6CzwrtExH+AjJ2wpUOfKWHrGqdnb+VdrQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W/XzT3LVHBFoTM/z1XLMZUVQ1nsD+SSJIpGACdQK7FoOLBtCo8RLGf7+Q74879SEQ
 BPOGJkosj7/QyAiGy9MnRqukxrq7IO9ulh9Lj+ebmPEOqIs8bm+i//D439tQMB70NQ
 Myoa5rXWGjaWyw6Sluq4a7hhekNyZ2Yl1wepAyjomlMf8lhvQrrNQ2C29LAU5A5L0O
 nvZ1RhJQuTrLqO1ADEKFWw4T7BZnO9qF024zRjw1uMXHX3rzKY6k5NxKeuArAX6Zx5
 rLydvnjD/KP3W6gWb1UtE8oBX1UO0Me8f/v0qhvRRw17hLF33KGA5Mc8gBR26kTk6B
 OylTv/7bkdvZQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, sumit.semwal@linaro.org,
 Arvind.Yadav@amd.com, shashank.sharma@amd.com, sunil.khatri@amd.com,
 tzimmermann@suse.de, David.Francis@amd.com,
 yelangyan@huaqin.corp-partner.google.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.19-6.18] drm/amdgpu: Refactor amdgpu_gem_va_ioctl
 for Handling Last Fence Update and Timeline Management v4
Date: Fri, 13 Feb 2026 19:59:26 -0500
Message-ID: <20260214010245.3671907-86-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:srinivasan.shanmugam@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:sashal@kernel.org,m:sumit.semwal@linaro.org,m:Arvind.Yadav@amd.com,m:shashank.sharma@amd.com,m:sunil.khatri@amd.com,m:tzimmermann@suse.de,m:David.Francis@amd.com,m:yelangyan@huaqin.corp-partner.google.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6264113A6C6
X-Rspamd-Action: no action

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit bd8150a1b3370a9f7761c5814202a3fe5a79f44f ]

This commit simplifies the amdgpu_gem_va_ioctl function, key updates
include:
 - Moved the logic for managing the last update fence directly into
   amdgpu_gem_va_update_vm.
 - Introduced checks for the timeline point to enable conditional
   replacement or addition of fences.

v2: Addressed review comments from Christian.
v3: Updated comments (Christian).
v4: The previous version selected the fence too early and did not manage its
    reference correctly, which could lead to stale or freed fences being used.
    This resulted in refcount underflows and could crash when updating GPU
    timelines.
    The fence is now chosen only after the VA mapping work is completed, and its
    reference is taken safely. After exporting it to the VM timeline syncobj, the
    driver always drops its local fence reference, ensuring balanced refcounting
    and avoiding use-after-free on dma_fence.

	Crash signature:
	[  205.828135] refcount_t: underflow; use-after-free.
	[  205.832963] WARNING: CPU: 30 PID: 7274 at lib/refcount.c:28 refcount_warn_saturate+0xbe/0x110
	...
	[  206.074014] Call Trace:
	[  206.076488]  <TASK>
	[  206.078608]  amdgpu_gem_va_ioctl+0x6ea/0x740 [amdgpu]
	[  206.084040]  ? __pfx_amdgpu_gem_va_ioctl+0x10/0x10 [amdgpu]
	[  206.089994]  drm_ioctl_kernel+0x86/0xe0 [drm]
	[  206.094415]  drm_ioctl+0x26e/0x520 [drm]
	[  206.098424]  ? __pfx_amdgpu_gem_va_ioctl+0x10/0x10 [amdgpu]
	[  206.104402]  amdgpu_drm_ioctl+0x4b/0x80 [amdgpu]
	[  206.109387]  __x64_sys_ioctl+0x96/0xe0
	[  206.113156]  do_syscall_64+0x66/0x2d0
	...
	[  206.553351] BUG: unable to handle page fault for address: ffffffffc0dfde90
	...
	[  206.553378] RIP: 0010:dma_fence_signal_timestamp_locked+0x39/0xe0
	...
	[  206.553405] Call Trace:
	[  206.553409]  <IRQ>
	[  206.553415]  ? __pfx_drm_sched_fence_free_rcu+0x10/0x10 [gpu_sched]
	[  206.553424]  dma_fence_signal+0x30/0x60
	[  206.553427]  drm_sched_job_done.isra.0+0x123/0x150 [gpu_sched]
	[  206.553434]  dma_fence_signal_timestamp_locked+0x6e/0xe0
	[  206.553437]  dma_fence_signal+0x30/0x60
	[  206.553441]  amdgpu_fence_process+0xd8/0x150 [amdgpu]
	[  206.553854]  sdma_v4_0_process_trap_irq+0x97/0xb0 [amdgpu]
	[  206.554353]  edac_mce_amd(E) ee1004(E)
	[  206.554270]  amdgpu_irq_dispatch+0x150/0x230 [amdgpu]
	[  206.554702]  amdgpu_ih_process+0x6a/0x180 [amdgpu]
	[  206.555101]  amdgpu_irq_handler+0x23/0x60 [amdgpu]
	[  206.555500]  __handle_irq_event_percpu+0x4a/0x1c0
	[  206.555506]  handle_irq_event+0x38/0x80
	[  206.555509]  handle_edge_irq+0x92/0x1e0
	[  206.555513]  __common_interrupt+0x3e/0xb0
	[  206.555519]  common_interrupt+0x80/0xa0
	[  206.555525]  </IRQ>
	[  206.555527]  <TASK>
	...
	[  206.555650] RIP: 0010:dma_fence_signal_timestamp_locked+0x39/0xe0
	...
	[  206.555667] Kernel panic - not syncing: Fatal exception in interrupt

Link: https://patchwork.freedesktop.org/patch/654669/
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

I now have a thorough understanding of this commit. Let me compile my
complete analysis.

---

## Complete Analysis

### 1. COMMIT MESSAGE ANALYSIS

The commit title says "Refactor" but the v4 description reveals this is
a **critical bug fix**:

> "The previous version selected the fence too early and did not manage
its reference correctly, which could lead to stale or freed fences being
used. This resulted in refcount underflows and could crash when updating
GPU timelines."

The commit includes a **concrete crash signature** showing:
- `refcount_t: underflow; use-after-free` in `amdgpu_gem_va_ioctl`
- `BUG: unable to handle page fault` in
  `dma_fence_signal_timestamp_locked` from IRQ context
- `Kernel panic - not syncing: Fatal exception in interrupt`

This is a **kernel panic** triggered via a userspace ioctl path
(`amdgpu_gem_va_ioctl`).

### 2. CODE CHANGE ANALYSIS - THE BUG

The bug is in `amdgpu_gem_update_bo_mapping()`, which was introduced by
commit 70773bef4e091 ("drm/amdgpu: update userqueue BOs and PDs") in
v6.16-rc1.

**Bug mechanism** in the old code at lines 115-154 of the current file:

```132:154:drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
        /* Find the last update fence */
        switch (operation) {
        case AMDGPU_VA_OP_MAP:
        case AMDGPU_VA_OP_REPLACE:
                if (bo && (bo->tbo.base.resv ==
vm->root.bo->tbo.base.resv))
                        last_update = vm->last_update;
                else
                        last_update = bo_va->last_pt_update;
                break;
        case AMDGPU_VA_OP_UNMAP:
        case AMDGPU_VA_OP_CLEAR:
                last_update = fence;
                break;
        default:
                return;
        }

        /* Add fence to timeline */
        if (!point)
                drm_syncobj_replace_fence(syncobj, last_update);
        else
                drm_syncobj_add_point(syncobj, chain, last_update,
point);
```

**Problem 1 - Missing dma_fence references**: `last_update =
vm->last_update` and `last_update = bo_va->last_pt_update` read fence
pointers **without taking a reference** via `dma_fence_get()`. These
fences can be replaced and their references dropped by concurrent VM
operations or fence signaling. The bare pointer is then passed to
`drm_syncobj_replace_fence()` or `drm_syncobj_add_point()`, which
attempt `dma_fence_get()` on a potentially freed fence - **use-after-
free**.

I verified that `vm->last_update` is replaced via `swap()` in
`amdgpu_vm_sdma_commit()` (line 106-146 of `amdgpu_vm_sdma.c`), which
puts the old fence. If the fence was already signaled and no other
holders exist, it's freed.

**Problem 2 - Fence leak**: In the calling code (lines 971-983 of
6.16.y), when `timeline_syncobj` is set and the operation is
MAP/REPLACE, the `fence` (clear_freed fence) returned from
`amdgpu_gem_va_update_vm()` is **never put** - it's passed to
`amdgpu_gem_update_bo_mapping()` which ignores it for MAP/REPLACE
operations.

**The fix** properly addresses both issues:
- Moves fence selection into `amdgpu_gem_va_update_vm()`, which runs
  immediately after the VM operations complete
- Takes explicit references with `dma_fence_get()` on the selected fence
- Returns the properly referenced fence to the caller
- The caller **always** calls `dma_fence_put(fence)` regardless of
  whether a timeline syncobj is used

### 3. CLASSIFICATION

This is a **use-after-free / refcount underflow bug fix** disguised as a
"refactor." The crash is a kernel panic from interrupt context - one of
the most severe possible outcomes. It's reachable from userspace via the
`amdgpu_gem_va_ioctl` ioctl.

### 4. AFFECTED VERSIONS

- Feature introduced: commit 70773bef4e091, first in **v6.16-rc1** (not
  in v6.15 or earlier)
- Partial memleak fix: commit ad6c120f68880, also in v6.16-rc1
- **Stable trees affected**: 6.16.y, 6.17.y, 6.18.y (all confirmed to
  have the buggy code)
- **NOT affected**: 6.12.y LTS, 6.6.y LTS, 6.1.y LTS, 5.15.y LTS (no
  timeline syncobj code)

### 5. SCOPE AND RISK

- **Lines changed**: ~+70/-41 (net ~+30 lines, mostly restructuring)
- **Files changed**: 1 (`amdgpu_gem.c`)
- **Risk**: Moderate - it's a structural change, but well-contained and
  well-reviewed
- **Review quality**: Reviewed-by Christian König (the top DRM
  fence/amdgpu expert), Suggested-by Christian König
- **Dependency**: Uses `amdgpu_vm_is_bo_always_valid()` which exists
  since v6.11 - available in all affected trees
- **Backport concern**: The diff may need minor adaptation for
  6.16.y/6.17.y due to `va_flags` changes (6716a823d18d4 in v6.18-rc1)

### 6. USER IMPACT

- **Severity**: Kernel panic (fatal exception in interrupt handler)
- **Trigger**: Userspace GPU applications using the VM timeline syncobj
  feature (usermode queues)
- **Who is affected**: AMD GPU users on 6.16+ kernels using MESA/AMDVLK
  with timeline synchronization

### 7. VERDICT

Despite being titled "Refactor," this commit fixes:
1. A **use-after-free** on `dma_fence` objects (accessing freed memory)
2. A **refcount underflow** leading to premature fence destruction
3. A **kernel panic** in interrupt context
   (`dma_fence_signal_timestamp_locked`)
4. A **fence memory leak** (clear_freed fence never put when timeline is
   used)

The fix is well-reviewed by the subsystem expert, self-contained to one
file, and addresses a real crash that users hit. The affected code
exists in 6.16.y, 6.17.y, and 6.18.y stable trees.

**YES**

 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 135 ++++++++++++++----------
 1 file changed, 82 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 3e38c5db29871..c5570a9698ed2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -112,47 +112,6 @@ amdgpu_gem_update_timeline_node(struct drm_file *filp,
 	return 0;
 }
 
-static void
-amdgpu_gem_update_bo_mapping(struct drm_file *filp,
-			     struct amdgpu_bo_va *bo_va,
-			     uint32_t operation,
-			     uint64_t point,
-			     struct dma_fence *fence,
-			     struct drm_syncobj *syncobj,
-			     struct dma_fence_chain *chain)
-{
-	struct amdgpu_bo *bo = bo_va ? bo_va->base.bo : NULL;
-	struct amdgpu_fpriv *fpriv = filp->driver_priv;
-	struct amdgpu_vm *vm = &fpriv->vm;
-	struct dma_fence *last_update;
-
-	if (!syncobj)
-		return;
-
-	/* Find the last update fence */
-	switch (operation) {
-	case AMDGPU_VA_OP_MAP:
-	case AMDGPU_VA_OP_REPLACE:
-		if (bo && (bo->tbo.base.resv == vm->root.bo->tbo.base.resv))
-			last_update = vm->last_update;
-		else
-			last_update = bo_va->last_pt_update;
-		break;
-	case AMDGPU_VA_OP_UNMAP:
-	case AMDGPU_VA_OP_CLEAR:
-		last_update = fence;
-		break;
-	default:
-		return;
-	}
-
-	/* Add fence to timeline */
-	if (!point)
-		drm_syncobj_replace_fence(syncobj, last_update);
-	else
-		drm_syncobj_add_point(syncobj, chain, last_update, point);
-}
-
 static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
@@ -764,16 +723,19 @@ amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
 			struct amdgpu_bo_va *bo_va,
 			uint32_t operation)
 {
-	struct dma_fence *fence = dma_fence_get_stub();
+	struct dma_fence *clear_fence = dma_fence_get_stub();
+	struct dma_fence *last_update = NULL;
 	int r;
 
 	if (!amdgpu_vm_ready(vm))
-		return fence;
+		return clear_fence;
 
-	r = amdgpu_vm_clear_freed(adev, vm, &fence);
+	/* First clear freed BOs and get a fence for that work, if any. */
+	r = amdgpu_vm_clear_freed(adev, vm, &clear_fence);
 	if (r)
 		goto error;
 
+	/* For MAP/REPLACE we also need to update the BO mappings. */
 	if (operation == AMDGPU_VA_OP_MAP ||
 	    operation == AMDGPU_VA_OP_REPLACE) {
 		r = amdgpu_vm_bo_update(adev, bo_va, false);
@@ -781,13 +743,59 @@ amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
 			goto error;
 	}
 
+	/* Always update PDEs after we touched the mappings. */
 	r = amdgpu_vm_update_pdes(adev, vm, false);
+	if (r)
+		goto error;
+
+	/*
+	 * Decide which fence represents the "last update" for this VM/BO:
+	 *
+	 * - For MAP/REPLACE we want the PT update fence, which is tracked as
+	 *   either vm->last_update (for always-valid BOs) or bo_va->last_pt_update
+	 *   (for per-BO updates).
+	 *
+	 * - For UNMAP/CLEAR we rely on the fence returned by
+	 *   amdgpu_vm_clear_freed(), which already covers the page table work
+	 *   for the removed mappings.
+	 */
+	switch (operation) {
+	case AMDGPU_VA_OP_MAP:
+	case AMDGPU_VA_OP_REPLACE:
+		if (bo_va && bo_va->base.bo) {
+			if (amdgpu_vm_is_bo_always_valid(vm, bo_va->base.bo)) {
+				if (vm->last_update)
+					last_update = dma_fence_get(vm->last_update);
+			} else {
+				if (bo_va->last_pt_update)
+					last_update = dma_fence_get(bo_va->last_pt_update);
+			}
+		}
+		break;
+	case AMDGPU_VA_OP_UNMAP:
+	case AMDGPU_VA_OP_CLEAR:
+		if (clear_fence)
+			last_update = dma_fence_get(clear_fence);
+		break;
+	default:
+		break;
+	}
 
 error:
 	if (r && r != -ERESTARTSYS)
 		DRM_ERROR("Couldn't update BO_VA (%d)\n", r);
 
-	return fence;
+	/*
+	 * If we managed to pick a more specific last-update fence, prefer it
+	 * over the generic clear_fence and drop the extra reference to the
+	 * latter.
+	 */
+	if (last_update) {
+		dma_fence_put(clear_fence);
+		return last_update;
+	}
+
+	return clear_fence;
 }
 
 int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
@@ -813,6 +821,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	uint64_t vm_size;
 	int r = 0;
 
+	/* Validate virtual address range against reserved regions. */
 	if (args->va_address < AMDGPU_VA_RESERVED_BOTTOM) {
 		dev_dbg(dev->dev,
 			"va_address 0x%llx is in reserved area 0x%llx\n",
@@ -846,6 +855,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
+	/* Validate operation type. */
 	switch (args->operation) {
 	case AMDGPU_VA_OP_MAP:
 	case AMDGPU_VA_OP_UNMAP:
@@ -869,6 +879,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		abo = NULL;
 	}
 
+	/* Add input syncobj fences (if any) for synchronization. */
 	r = amdgpu_gem_add_input_fence(filp,
 				       args->input_fence_syncobj_handles,
 				       args->num_syncobj_handles);
@@ -891,6 +902,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 			goto error;
 	}
 
+	/* Resolve the BO-VA mapping for this VM/BO combination. */
 	if (abo) {
 		bo_va = amdgpu_vm_bo_find(&fpriv->vm, abo);
 		if (!bo_va) {
@@ -903,6 +915,11 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		bo_va = NULL;
 	}
 
+	/*
+	 * Prepare the timeline syncobj node if the user requested a VM
+	 * timeline update. This only allocates/looks up the syncobj and
+	 * chain node; the actual fence is attached later.
+	 */
 	r = amdgpu_gem_update_timeline_node(filp,
 					    args->vm_timeline_syncobj_out,
 					    args->vm_timeline_point,
@@ -934,18 +951,30 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	default:
 		break;
 	}
+
+	/*
+	 * Once the VA operation is done, update the VM and obtain the fence
+	 * that represents the last relevant update for this mapping. This
+	 * fence can then be exported to the user-visible VM timeline.
+	 */
 	if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) && !adev->debug_vm) {
 		fence = amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
 						args->operation);
 
-		if (timeline_syncobj)
-			amdgpu_gem_update_bo_mapping(filp, bo_va,
-					     args->operation,
-					     args->vm_timeline_point,
-					     fence, timeline_syncobj,
-					     timeline_chain);
-		else
-			dma_fence_put(fence);
+		if (timeline_syncobj && fence) {
+			if (!args->vm_timeline_point) {
+				/* Replace the existing fence when no point is given. */
+				drm_syncobj_replace_fence(timeline_syncobj,
+							  fence);
+			} else {
+				/* Attach the last-update fence at a specific point. */
+				drm_syncobj_add_point(timeline_syncobj,
+						      timeline_chain,
+						      fence,
+						      args->vm_timeline_point);
+			}
+		}
+		dma_fence_put(fence);
 
 	}
 
-- 
2.51.0

