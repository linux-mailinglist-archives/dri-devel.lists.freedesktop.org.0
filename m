Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLTeEsDKj2nMTgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:07:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38E413A784
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667F610E865;
	Sat, 14 Feb 2026 01:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DHklg+yv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8232210E861
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 01:07:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E89FF60140;
 Sat, 14 Feb 2026 01:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DA6C116C6;
 Sat, 14 Feb 2026 01:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771031226;
 bh=QKj6dUEnCesw0xEfA6z3Eo3aFX4Ezav57Y5BHRstK/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DHklg+yv0QGS+xm/ahnSPD+sYUIm8uQTsgi/910KUrEhM8utG8xhtaoiVdqmC1rtD
 a5ktpWxkovjraYjsib5v4LJz2RhyYBRMxOAMv8cCfGYFBj2ByRgCxhdGGMkiupb25y
 7o3P1k9ENZjdcCrCwixtd236lxkMGAtBIghRROStrnJuw9zaGXLl38lgHLu/IYptv9
 RnKfJDozIcttXUfB86EGL+KYYZbUN8SqC4Y6TtfqYePWYnJOVxQOciAjjzpAWcYsfV
 +v6i8zYR7Zzd+n0tioZQD8SyXbmiVlpzZ8FrAxXOwcp+qsZ29Js8auSn2EOlQ4TgPc
 DpdcePJffgUAw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Sasha Levin <sashal@kernel.org>,
 liviu.dudau@arm.com, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.19-6.18] drm/panthor: Always wait after sending a
 command to an AS
Date: Fri, 13 Feb 2026 19:59:51 -0500
Message-ID: <20260214010245.3671907-111-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
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
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:sashal@kernel.org,m:liviu.dudau@arm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: D38E413A784
X-Rspamd-Action: no action

From: Boris Brezillon <boris.brezillon@collabora.com>

[ Upstream commit d2c6fde56d451ca48a5e03428535ce3dbc8fc910 ]

There's currently no situation where we want to issue a command to an
AS and not wait for this command to complete. The wait is either
explicitly done (LOCK, UNLOCK) or it's missing (UPDATE). So let's
turn write_cmd() into as_send_cmd_and_wait() that has the wait after
a command is sent.

v2:
- New patch

v3:
- Collect R-b

v4:
- No changes

Reviewed-by: Steven Price <steven.price@arm.com>
Link: https://patch.msgid.link/20251128084841.3804658-2-boris.brezillon@collabora.com
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Comprehensive Analysis

### 1. COMMIT MESSAGE ANALYSIS

The commit message states: *"There's currently no situation where we
want to issue a command to an AS and not wait for this command to
complete. The wait is either explicitly done (LOCK, UNLOCK) or it's
missing (UPDATE)."*

This is a clear admission that the `AS_COMMAND_UPDATE` command paths are
**missing a required wait** for command completion. The commit author
(Boris Brezillon, the panthor subsystem author) explicitly identifies
this as a bug: the hardware requires waiting for every AS command to
complete, but `UPDATE` commands were missing this wait.

### 2. CODE CHANGE ANALYSIS - THE BUG

#### Before the fix:

The original `write_cmd()` function at line 513-523 only:
1. Waits for the MMU to be ready to accept a command (`wait_ready()`
   before writing)
2. Writes the command to the `AS_COMMAND` register
3. **Does NOT wait for the command to complete**

```507:523:drivers/gpu/drm/panthor/panthor_mmu.c
static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
{
        // ...polls AS_STATUS for AS_ACTIVE to clear...
}

static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
{
        int status;
        status = wait_ready(ptdev, as_nr);  // Wait BEFORE sending
        if (!status)
                gpu_write(ptdev, AS_COMMAND(as_nr), cmd);
        return status;  // Returns IMMEDIATELY - no wait AFTER
}
```

#### The inconsistent callers:

- **`lock_region()`** (line 556): Calls `write_cmd(AS_COMMAND_LOCK)` —
  the subsequent call to `wait_ready()` exists at line 591 in
  `mmu_hw_do_operation_locked()`. So LOCK effectively waited, but in a
  fragmented way.
- **`mmu_hw_do_operation_locked()`** (line 604): Calls
  `write_cmd(AS_COMMAND_UNLOCK)` followed by `wait_ready()` at line 607.
  So UNLOCK explicitly waited.
- **`panthor_mmu_as_enable()`** (line 636): Calls
  `write_cmd(AS_COMMAND_UPDATE)` — **NO subsequent `wait_ready()`!** The
  function returns immediately.
- **`panthor_mmu_as_disable()`** (line 651): Calls
  `write_cmd(AS_COMMAND_UPDATE)` — **NO subsequent `wait_ready()`!**
  Same bug.

#### What this means:

When the MMU address space is enabled or disabled via
`AS_COMMAND_UPDATE`, the code does not wait for the GPU hardware to
finish processing the command. This is a **hardware protocol violation**
— the software proceeds to use the address space (or assume it's been
disabled) before the GPU has actually completed the operation.

#### The consequences of this bug:

1. **`panthor_mmu_as_enable()`**: Called when activating a VM's address
   space for GPU usage (line 792 in `panthor_vm_active`). After this
   returns, the code sets `refcount_set(&vm->as.active_cnt, 1)` and
   unlocks the mutex. Subsequent GPU operations may start using this
   address space **before the UPDATE command has completed on the
   hardware**, potentially causing GPU faults, page translation
   failures, or data corruption.

2. **`panthor_mmu_as_disable()`**: Called in multiple critical paths:
   - MMU fault handler (line 1694): Disabling a faulting AS. If the
     UPDATE hasn't completed, subsequent fault handling may race.
   - Device suspend/reset (lines 1723, 2687): During orderly shutdown.
     If UPDATE doesn't complete, cleanup may be incomplete.
   - VM idle path (line 1843): Normal VM deactivation.

#### Cross-reference with panfrost driver:

The older `panfrost` driver (for earlier Mali GPUs) has the **exact same
bug pattern** at lines 188 and 204 — `panfrost_mmu_enable()` and
`panfrost_mmu_disable()` also call `write_cmd(AS_COMMAND_UPDATE)`
without waiting. This confirms it's a long-standing inherited bug from
the original code.

### 3. CLASSIFICATION

This is a **real bug fix**: it adds a missing hardware synchronization
wait after sending a command to the GPU's MMU address space hardware.
The fix ensures the software doesn't proceed until the hardware has
actually processed the address space configuration change.

However, the commit message is written more as a "cleanup/consolidation"
rather than explicitly calling out the bug's user-visible symptoms. The
author says the wait is "missing" for UPDATE, confirming it's a bug, but
doesn't describe specific symptoms (crashes, GPU faults, etc.).

### 4. SCOPE AND RISK ASSESSMENT

- **Lines changed**: ~30 lines across 1 file
- **Files touched**: 1 (`drivers/gpu/drm/panthor/panthor_mmu.c`)
- **Subsystem**: GPU driver (drm/panthor) — affects only Mali CSF GPUs
  (Valhall/5th Gen)
- **Risk**: LOW — The change adds a `wait_ready()` call (a 100μs timeout
  poll) that was already being done for all other AS commands. This is
  the correct hardware protocol.
- **Regression risk**: Very low. The only negative effect could be a
  very slight latency increase on the AS enable/disable path (up to
  100μs per operation), which is negligible.

### 5. USER IMPACT

- Panthor driver was introduced in kernel v6.10, so stable trees 6.10.y
  through 6.18.y would be affected
- Users of Mali Valhall (G710, G610) and 5th Gen (G720, G620) GPUs are
  affected
- This includes some Chromebook models, RK3588-based boards, and
  MediaTek platforms
- Without this fix, users may experience intermittent GPU faults,
  translation errors, or subtle corruption when VMs are
  activated/deactivated rapidly (e.g., during context switches,
  suspend/resume)

### 6. DEPENDENCY CHECK

The commit applies on top of `24f028b91ed3` ("drm/panthor: Simplify
mmu_hw_do_operation_locked"), which is already in the tree. The current
code in the tree already has the simplified
`mmu_hw_do_operation_locked()` with the switch statement that the diff's
context matches. The commit appears self-contained and doesn't require
other patches from its series.

However, the diff context shows it changes `lock_region()` to also
error-check and use the new combined `as_send_cmd_and_wait()`, and
`mmu_hw_do_operation_locked()` removes a now-redundant `wait_ready()`.
This is all within one function/file and is self-contained.

### 7. STABILITY INDICATORS

- **Reviewed-by: Steven Price** — ARM Mali kernel developer/maintainer
- The patch went through 4 revisions (v1 through v4), indicating careful
  review
- The author (Boris Brezillon) is the original panthor driver author

### 8. CONCERNS

- The commit is patch 2 of a series. We should check if the series has
  other critical patches. However, this specific commit is self-
  contained in its fix.
- The commit message frames this as consolidation rather than urgent
  bugfix. But the actual code change fixes a real, documented missing
  wait.
- The bug may be hard to trigger in practice if the hardware is fast
  enough to process UPDATE commands before subsequent operations happen.
  But under load or on slower hardware, it could manifest as
  intermittent GPU faults.

### VERDICT

This commit fixes a **real hardware synchronization bug** — a missing
`wait_ready()` after `AS_COMMAND_UPDATE` in the MMU address space
management. The fix is:
- Small and contained (1 file, ~30 lines)
- Obviously correct (all other AS commands already waited; this makes
  UPDATE consistent)
- Fixes a potential race between software and hardware that could cause
  GPU faults
- Low regression risk (just adds a hardware completion poll)
- Self-contained (no external dependencies beyond what's already in
  stable)
- Reviewed by the ARM Mali maintainer

While the bug may be hard to trigger in practice, the consequences (GPU
translation faults, potential data corruption) are serious when it does
trigger, and the fix is minimal and safe.

**YES**

 drivers/gpu/drm/panthor/panthor_mmu.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index f6339963e4960..d70acff33d41e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -510,27 +510,29 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
 	return ret;
 }
 
-static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
+static int as_send_cmd_and_wait(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
 {
 	int status;
 
 	/* write AS_COMMAND when MMU is ready to accept another command */
 	status = wait_ready(ptdev, as_nr);
-	if (!status)
+	if (!status) {
 		gpu_write(ptdev, AS_COMMAND(as_nr), cmd);
+		status = wait_ready(ptdev, as_nr);
+	}
 
 	return status;
 }
 
-static void lock_region(struct panthor_device *ptdev, u32 as_nr,
-			u64 region_start, u64 size)
+static int lock_region(struct panthor_device *ptdev, u32 as_nr,
+		       u64 region_start, u64 size)
 {
 	u8 region_width;
 	u64 region;
 	u64 region_end = region_start + size;
 
 	if (!size)
-		return;
+		return 0;
 
 	/*
 	 * The locked region is a naturally aligned power of 2 block encoded as
@@ -553,7 +555,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 
 	/* Lock the region that needs to be updated */
 	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
-	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
+	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
@@ -586,9 +588,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	 * power it up
 	 */
 
-	lock_region(ptdev, as_nr, iova, size);
-
-	ret = wait_ready(ptdev, as_nr);
+	ret = lock_region(ptdev, as_nr, iova, size);
 	if (ret)
 		return ret;
 
@@ -601,10 +601,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	 * at the end of the GPU_CONTROL cache flush command, unlike
 	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
 	 */
-	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
-
-	/* Wait for the unlock command to complete */
-	return wait_ready(ptdev, as_nr);
+	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UNLOCK);
 }
 
 static int mmu_hw_do_operation(struct panthor_vm *vm,
@@ -633,7 +630,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
 	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
 
-	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
+	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
 
 static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
@@ -648,7 +645,7 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
 	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
-	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
+	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
 
 static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)
-- 
2.51.0

