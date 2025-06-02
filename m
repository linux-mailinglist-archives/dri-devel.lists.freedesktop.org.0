Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5EBACA12B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE5F10E1B9;
	Sun,  1 Jun 2025 23:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C88oaaaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6933610E200;
 Sun,  1 Jun 2025 23:25:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4C14A451BD;
 Sun,  1 Jun 2025 23:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC42C4CEF1;
 Sun,  1 Jun 2025 23:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820305;
 bh=wqRN2DlJTA7NV2Hi0myh9Z7vg/yTMJeDF0HN8Z9t3Fg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C88oaaaRjo3rsqqUHvPwCSxaXryfHTDNuh79mBIWAEBaWedt3hEr9imSTEcFuDtbg
 TfuZXmvyG6uxflIv3CYA6YuvRKhDB/LrX1BaJmGXhbEroGZdR2DE4XZi7a6D7Y7xXZ
 Dfuf7e7D5AOwX3nfq7pk+bEseh3spYAfrFp4WTokmn1PmfU5LzbmjhutJMgMWNYteO
 GBWdm3HIY0HUUYOXKWHFqSCejZ7WtCQVzTwojeXRaCA66G0EdSliIFC5LeWSrU6EH4
 rxkkS7gkcQv7uY6s1MwRg1I0x77EVUrbF7LLYbGXLhtmvdiDSYL3EugjlUSN1LPEnG
 1lFyM33M5GJtQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 010/110] drm/xe: Fix CFI violation when accessing
 sysfs files
Date: Sun,  1 Jun 2025 19:22:52 -0400
Message-Id: <20250601232435.3507697-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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

From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>

[ Upstream commit 4ea512714c42c69828b4a2647d206bf404043ad5 ]

When an attribute group is created with sysfs_create_group() or
sysfs_create_files() the ->sysfs_ops() callback is set to
kobj_sysfs_ops, which sets the ->show() callback to kobj_attr_show().
kobj_attr_show() uses container_of() to get the ->show() callback
from the attribute it was passed, meaning the ->show() callback needs
to be the same type as the ->show() callback in 'struct kobj_attribute'.

However, cur_freq_show() has the type of the ->show() callback in
'struct device_attribute', which causes a CFI violation when opening the
'id' sysfs node under gtidle/freq/throttle. This happens to work because
the layout of 'struct kobj_attribute' and 'struct device_attribute' are
the same, so the container_of() cast happens to allow the ->show()
callback to still work.

Changed the type of cur_freq_show() and few more functions to match the
->show() callback in 'struct kobj_attributes' to resolve the CFI
violation.

CFI failure seen while accessing sysfs files under
/sys/class/drm/card0/device/tile0/gt*/gtidle/*
/sys/class/drm/card0/device/tile0/gt*/freq0/*
/sys/class/drm/card0/device/tile0/gt*/freq0/throttle/*

[ 2599.618075] RIP: 0010:__cfi_cur_freq_show+0xd/0x10 [xe]
[ 2599.624452] Code: 44 c1 44 89 fa e8 03 95 39 f2 48 98 5b 41 5e 41 5f 5d c3 c9
[ 2599.646638] RSP: 0018:ffffbe438ead7d10 EFLAGS: 00010286
[ 2599.652823] RAX: ffff9f7d8b3845d8 RBX: ffff9f7dee8c95d8 RCX: 0000000000000000
[ 2599.661246] RDX: ffff9f7e6f439000 RSI: ffffffffc13ada30 RDI: ffff9f7d975d4b00
[ 2599.669669] RBP: ffffbe438ead7d18 R08: 0000000000001000 R09: ffff9f7e6f439000
[ 2599.678092] R10: 00000000e07304a6 R11: ffffffffc1241ca0 R12: ffffffffb4836ea0
[ 2599.688435] R13: ffff9f7e45fb1180 R14: ffff9f7d975d4b00 R15: ffff9f7e6f439000
[ 2599.696860] FS: 000076b02b66cfc0(0000) GS:ffff9f80ef400000(0000) knlGS:00000
[ 2599.706412] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2599.713196] CR2: 00005f80d94641a9 CR3: 00000001e44ec006 CR4: 0000000100f72ef0
[ 2599.721618] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 2599.730041] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[ 2599.738464] PKRU: 55555554
[ 2599.741655] Call Trace:
[ 2599.744541] <TASK>
[ 2599.747017] ? __die_body+0x69/0xb0
[ 2599.751151] ? die+0xa9/0xd0
[ 2599.754548] ? do_trap+0x89/0x160
[ 2599.758476] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
[ 2599.768315] ? handle_invalid_op+0x69/0x90
[ 2599.773167] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
[ 2599.783010] ? exc_invalid_op+0x36/0x60
[ 2599.787552] ? fred_hwexc+0x123/0x1a0
[ 2599.791873] ? fred_entry_from_kernel+0x7b/0xd0
[ 2599.797219] ? asm_fred_entrypoint_kernel+0x45/0x70
[ 2599.802976] ? act_freq_show+0x70/0x70 [xe b37985c94829727668bd7c5b33c1d9998]
[ 2599.812301] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
[ 2599.822137] ? __kmalloc_node_noprof+0x1f3/0x420
[ 2599.827594] ? __kvmalloc_node_noprof+0xcb/0x180
[ 2599.833045] ? kobj_attr_show+0x22/0x40
[ 2599.837571] sysfs_kf_seq_show+0xa8/0x110
[ 2599.842302] kernfs_seq_show+0x38/0x50

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://lore.kernel.org/r/20250422171852.85558-1-jeevaka.badrappan@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees for the
following reasons: ## Primary Analysis **1. Important Bug Fix for
Security Feature** The commit fixes Control Flow Integrity (CFI)
violations in the xe driver's sysfs interface. CFI is a critical
security feature in modern kernels that prevents function pointer
hijacking attacks. CFI violations can cause: - System crashes when
accessing sysfs files (as shown in the stack trace) - Potential security
vulnerabilities if exploited - Poor user experience when monitoring GPU
frequency/throttling through sysfs **2. Small, Contained Fix with Clear
Impact** The changes are purely type safety fixes that: - Convert
`struct device_attribute` callbacks to `struct kobj_attribute` callbacks
across 3 files - Change function signatures from `(struct device *dev,
struct device_attribute *attr, char *buf)` to `(struct kobject *kobj,
struct kobj_attribute *attr, char *buf)` - Update attribute definitions
from `DEVICE_ATTR_RO/RW` to `__ATTR_RO/RW` with proper kobj_attribute
types - Add `struct device *dev = kobj_to_dev(kobj);` calls to maintain
functionality **3. Pattern Matches Successful Backports** This commit
follows the exact same pattern as Similar Commits #3-#5 (all marked
"Backport Status: YES"): - ACPI platform-profile CFI fix (commit
2e6674dfefd8) - already backported - Intel uncore-frequency CFI fix -
ACPI bgrt CFI fix All these commits fix the same fundamental issue:
mismatched function pointer types when sysfs groups are created with
`sysfs_create_group()` vs `device_create_file()`. **4. Driver
Availability and Kernel Version Context** The xe driver was introduced
in kernel 6.10, which means: - This fix is relevant for stable trees
6.10+ - The affected code exists in current stable kernels - Users with
Intel discrete GPUs (Tiger Lake+) would encounter this bug **5. Low
Risk, High Value** - **Zero functional changes** - same behavior, just
type-safe - **No architectural changes** - purely corrective - **Self-
contained** - only affects xe driver sysfs interface - **Clear error
symptoms** - CFI failures with specific stack traces make issues obvious
- **High user impact** - prevents crashes when monitoring GPU
performance **6. Meets Stable Tree Criteria** - ✅ Fixes important bugs
affecting users (CFI crashes) - ✅ Small and contained (type signature
changes only) - ✅ No clear side effects beyond fixing the issue - ✅ No
major architectural changes - ✅ Confined to xe subsystem - ✅ Minimal
regression risk The code changes in `xe_gt_freq.c`, `xe_gt_idle.c`, and
`xe_gt_throttle.c` are straightforward type corrections that maintain
identical functionality while ensuring CFI compliance. This is exactly
the type of safety/correctness fix that stable trees should include.

 drivers/gpu/drm/xe/xe_gt_freq.c     | 82 ++++++++++++++------------
 drivers/gpu/drm/xe/xe_gt_idle.c     | 28 +++++----
 drivers/gpu/drm/xe/xe_gt_throttle.c | 90 ++++++++++++++---------------
 3 files changed, 107 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 604bdc7c81736..868a5d2c1a52f 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -56,9 +56,10 @@ dev_to_xe(struct device *dev)
 	return gt_to_xe(kobj_to_gt(dev->kobj.parent));
 }
 
-static ssize_t act_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t act_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
@@ -68,11 +69,12 @@ static ssize_t act_freq_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
-static DEVICE_ATTR_RO(act_freq);
+static struct kobj_attribute attr_act_freq = __ATTR_RO(act_freq);
 
-static ssize_t cur_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t cur_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 	ssize_t ret;
@@ -85,11 +87,12 @@ static ssize_t cur_freq_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
-static DEVICE_ATTR_RO(cur_freq);
+static struct kobj_attribute attr_cur_freq = __ATTR_RO(cur_freq);
 
-static ssize_t rp0_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t rp0_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
@@ -99,11 +102,12 @@ static ssize_t rp0_freq_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
-static DEVICE_ATTR_RO(rp0_freq);
+static struct kobj_attribute attr_rp0_freq = __ATTR_RO(rp0_freq);
 
-static ssize_t rpe_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t rpe_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
@@ -113,11 +117,12 @@ static ssize_t rpe_freq_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
-static DEVICE_ATTR_RO(rpe_freq);
+static struct kobj_attribute attr_rpe_freq = __ATTR_RO(rpe_freq);
 
-static ssize_t rpa_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t rpa_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
@@ -127,20 +132,22 @@ static ssize_t rpa_freq_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
-static DEVICE_ATTR_RO(rpa_freq);
+static struct kobj_attribute attr_rpa_freq = __ATTR_RO(rpa_freq);
 
-static ssize_t rpn_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t rpn_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 
 	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpn_freq(pc));
 }
-static DEVICE_ATTR_RO(rpn_freq);
+static struct kobj_attribute attr_rpn_freq = __ATTR_RO(rpn_freq);
 
-static ssize_t min_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t min_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 	ssize_t ret;
@@ -154,9 +161,10 @@ static ssize_t min_freq_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", freq);
 }
 
-static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
-			      const char *buff, size_t count)
+static ssize_t min_freq_store(struct kobject *kobj,
+			      struct kobj_attribute *attr, const char *buff, size_t count)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 	ssize_t ret;
@@ -173,11 +181,12 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
 
 	return count;
 }
-static DEVICE_ATTR_RW(min_freq);
+static struct kobj_attribute attr_min_freq = __ATTR_RW(min_freq);
 
-static ssize_t max_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t max_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 	ssize_t ret;
@@ -191,9 +200,10 @@ static ssize_t max_freq_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", freq);
 }
 
-static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
-			      const char *buff, size_t count)
+static ssize_t max_freq_store(struct kobject *kobj,
+			      struct kobj_attribute *attr, const char *buff, size_t count)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 	ssize_t ret;
@@ -210,17 +220,17 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
 
 	return count;
 }
-static DEVICE_ATTR_RW(max_freq);
+static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
 
 static const struct attribute *freq_attrs[] = {
-	&dev_attr_act_freq.attr,
-	&dev_attr_cur_freq.attr,
-	&dev_attr_rp0_freq.attr,
-	&dev_attr_rpa_freq.attr,
-	&dev_attr_rpe_freq.attr,
-	&dev_attr_rpn_freq.attr,
-	&dev_attr_min_freq.attr,
-	&dev_attr_max_freq.attr,
+	&attr_act_freq.attr,
+	&attr_cur_freq.attr,
+	&attr_rp0_freq.attr,
+	&attr_rpa_freq.attr,
+	&attr_rpe_freq.attr,
+	&attr_rpn_freq.attr,
+	&attr_min_freq.attr,
+	&attr_max_freq.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index fbbace7b0b12a..c11206410a4d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -249,9 +249,10 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
-static ssize_t name_show(struct device *dev,
-			 struct device_attribute *attr, char *buff)
+static ssize_t name_show(struct kobject *kobj,
+			 struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	ssize_t ret;
@@ -262,11 +263,12 @@ static ssize_t name_show(struct device *dev,
 
 	return ret;
 }
-static DEVICE_ATTR_RO(name);
+static struct kobj_attribute name_attr = __ATTR_RO(name);
 
-static ssize_t idle_status_show(struct device *dev,
-				struct device_attribute *attr, char *buff)
+static ssize_t idle_status_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	enum xe_gt_idle_state state;
@@ -277,6 +279,7 @@ static ssize_t idle_status_show(struct device *dev,
 
 	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
 }
+static struct kobj_attribute idle_status_attr = __ATTR_RO(idle_status);
 
 u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
 {
@@ -291,10 +294,11 @@ u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
 	return residency;
 }
 
-static DEVICE_ATTR_RO(idle_status);
-static ssize_t idle_residency_ms_show(struct device *dev,
-				      struct device_attribute *attr, char *buff)
+
+static ssize_t idle_residency_ms_show(struct kobject *kobj,
+				      struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	u64 residency;
@@ -305,12 +309,12 @@ static ssize_t idle_residency_ms_show(struct device *dev,
 
 	return sysfs_emit(buff, "%llu\n", residency);
 }
-static DEVICE_ATTR_RO(idle_residency_ms);
+static struct kobj_attribute idle_residency_attr = __ATTR_RO(idle_residency_ms);
 
 static const struct attribute *gt_idle_attrs[] = {
-	&dev_attr_name.attr,
-	&dev_attr_idle_status.attr,
-	&dev_attr_idle_residency_ms.attr,
+	&name_attr.attr,
+	&idle_status_attr.attr,
+	&idle_residency_attr.attr,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 8db78d616b6f2..aa962c783cdf7 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -114,115 +114,115 @@ static u32 read_reason_vr_tdc(struct xe_gt *gt)
 	return tdc;
 }
 
-static ssize_t status_show(struct device *dev,
-			   struct device_attribute *attr,
-			   char *buff)
+static ssize_t status_show(struct kobject *kobj,
+			   struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool status = !!read_status(gt);
 
 	return sysfs_emit(buff, "%u\n", status);
 }
-static DEVICE_ATTR_RO(status);
+static struct kobj_attribute attr_status = __ATTR_RO(status);
 
-static ssize_t reason_pl1_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buff)
+static ssize_t reason_pl1_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool pl1 = !!read_reason_pl1(gt);
 
 	return sysfs_emit(buff, "%u\n", pl1);
 }
-static DEVICE_ATTR_RO(reason_pl1);
+static struct kobj_attribute attr_reason_pl1 = __ATTR_RO(reason_pl1);
 
-static ssize_t reason_pl2_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buff)
+static ssize_t reason_pl2_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool pl2 = !!read_reason_pl2(gt);
 
 	return sysfs_emit(buff, "%u\n", pl2);
 }
-static DEVICE_ATTR_RO(reason_pl2);
+static struct kobj_attribute attr_reason_pl2 = __ATTR_RO(reason_pl2);
 
-static ssize_t reason_pl4_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buff)
+static ssize_t reason_pl4_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool pl4 = !!read_reason_pl4(gt);
 
 	return sysfs_emit(buff, "%u\n", pl4);
 }
-static DEVICE_ATTR_RO(reason_pl4);
+static struct kobj_attribute attr_reason_pl4 = __ATTR_RO(reason_pl4);
 
-static ssize_t reason_thermal_show(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buff)
+static ssize_t reason_thermal_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool thermal = !!read_reason_thermal(gt);
 
 	return sysfs_emit(buff, "%u\n", thermal);
 }
-static DEVICE_ATTR_RO(reason_thermal);
+static struct kobj_attribute attr_reason_thermal = __ATTR_RO(reason_thermal);
 
-static ssize_t reason_prochot_show(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buff)
+static ssize_t reason_prochot_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool prochot = !!read_reason_prochot(gt);
 
 	return sysfs_emit(buff, "%u\n", prochot);
 }
-static DEVICE_ATTR_RO(reason_prochot);
+static struct kobj_attribute attr_reason_prochot = __ATTR_RO(reason_prochot);
 
-static ssize_t reason_ratl_show(struct device *dev,
-				struct device_attribute *attr,
-				char *buff)
+static ssize_t reason_ratl_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool ratl = !!read_reason_ratl(gt);
 
 	return sysfs_emit(buff, "%u\n", ratl);
 }
-static DEVICE_ATTR_RO(reason_ratl);
+static struct kobj_attribute attr_reason_ratl = __ATTR_RO(reason_ratl);
 
-static ssize_t reason_vr_thermalert_show(struct device *dev,
-					 struct device_attribute *attr,
-					 char *buff)
+static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
+					 struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool thermalert = !!read_reason_vr_thermalert(gt);
 
 	return sysfs_emit(buff, "%u\n", thermalert);
 }
-static DEVICE_ATTR_RO(reason_vr_thermalert);
+static struct kobj_attribute attr_reason_vr_thermalert = __ATTR_RO(reason_vr_thermalert);
 
-static ssize_t reason_vr_tdc_show(struct device *dev,
-				  struct device_attribute *attr,
-				  char *buff)
+static ssize_t reason_vr_tdc_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool tdc = !!read_reason_vr_tdc(gt);
 
 	return sysfs_emit(buff, "%u\n", tdc);
 }
-static DEVICE_ATTR_RO(reason_vr_tdc);
+static struct kobj_attribute attr_reason_vr_tdc = __ATTR_RO(reason_vr_tdc);
 
 static struct attribute *throttle_attrs[] = {
-	&dev_attr_status.attr,
-	&dev_attr_reason_pl1.attr,
-	&dev_attr_reason_pl2.attr,
-	&dev_attr_reason_pl4.attr,
-	&dev_attr_reason_thermal.attr,
-	&dev_attr_reason_prochot.attr,
-	&dev_attr_reason_ratl.attr,
-	&dev_attr_reason_vr_thermalert.attr,
-	&dev_attr_reason_vr_tdc.attr,
+	&attr_status.attr,
+	&attr_reason_pl1.attr,
+	&attr_reason_pl2.attr,
+	&attr_reason_pl4.attr,
+	&attr_reason_thermal.attr,
+	&attr_reason_prochot.attr,
+	&attr_reason_ratl.attr,
+	&attr_reason_vr_thermalert.attr,
+	&attr_reason_vr_tdc.attr,
 	NULL
 };
 
-- 
2.39.5

