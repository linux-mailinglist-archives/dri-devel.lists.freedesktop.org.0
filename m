Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3DD23651
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BC310E07D;
	Thu, 15 Jan 2026 09:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=sony.com header.i=@sony.com header.b="Qyb4yGyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 603 seconds by postgrey-1.36 at gabe;
 Thu, 15 Jan 2026 02:05:12 UTC
Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp
 [211.125.140.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ED010E07F;
 Thu, 15 Jan 2026 02:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sony.com; s=s1jp; t=1768442712; x=1799978712;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rOTnTgioJ0MGMPCpp+74pLbbNNolomswZYdZCgUS8Uk=;
 b=Qyb4yGyj2rCYIZpvPekoK8E0xDJu88Vj+9letnzRtKZCv95dOnD0SBk8
 jZEiAwAhk8TUxEwwb7gVWFbZPXUFIEJ+mxaWsm/vrIq8idbVKiqdXxO+n
 k2fFNd27wz3cu42tfx6UgSqjCxydqe/+PBXnGYfcOeXAvW9hO0UCnnOXZ
 ScpsLNaSqOKbBaIWPoqeLbqpOV+IuzxGMlnrKRXBT7AOAXBwC6xKUhnlI
 aWt2CO254MjMmd3scLFnX0QsgfR57Ho53Qc4UNr6M5tHtk5d9m0lgEJCI
 w05R/74VO+a/M5JXreo+AMBDW3ygeoSXoFh7X3cer1vZOkpDYspkjD3dJ A==;
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::6])
 by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 10:55:07 +0900
X-IronPort-AV: E=Sophos;i="6.21,226,1763391600"; d="scan'208";a="600976025"
Received: from unknown (HELO rahul-Z690-S01..) ([43.11.34.175])
 by jpmta-ob1.noc.sony.co.jp with ESMTP; 15 Jan 2026 10:55:07 +0900
From: Rahul Bukte <rahul.bukte@sony.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net
Cc: Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
 daniel.palmer@sony.com
Subject: [RFC PATCH] drm/i915: i915 null pointer dereference
Date: Thu, 15 Jan 2026 10:54:51 +0900
Message-ID: <20260115015454.3226069-1-rahul.bukte@sony.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 Jan 2026 09:17:51 +0000
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

When the i915 driver firmware binaries are not present, the
set_default_submission pointer is not set. This pointer is
dereferenced during suspend anyways.

Add a check to make sure it is set before dereferencing.

# echo +20 > /sys/class/rtc/rtc0/wakealarm && echo mem > /sys/power/state
[   23.289926] PM: suspend entry (deep)
[   23.293558] Filesystems sync: 0.000 seconds
[   23.298010] Freezing user space processes
[   23.302771] Freezing user space processes completed (elapsed 0.000 seconds)
[   23.309766] OOM killer disabled.
[   23.313027] Freezing remaining freezable tasks
[   23.318540] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[   23.342038] serial 00:05: disabled
[   23.345719] serial 00:02: disabled
[   23.349342] serial 00:01: disabled
[   23.353782] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[   23.358993] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
[   23.361635] ata1.00: Entering standby power mode
[   23.368863] ata2.00: Entering standby power mode
[   23.445187] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   23.452194] #PF: supervisor instruction fetch in kernel mode
[   23.457896] #PF: error_code(0x0010) - not-present page
[   23.463065] PGD 0 P4D 0 
[   23.465640] Oops: Oops: 0010 [#1] SMP NOPTI
[   23.469869] CPU: 8 UID: 0 PID: 211 Comm: kworker/u48:18 Tainted: G S      W           6.19.0-rc4-00020-gf0b9d8eb98df #10 PREEMPT(voluntary) 
[   23.482512] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
[   23.496511] Workqueue: async async_run_entry_fn
[   23.501087] RIP: 0010:0x0
[   23.503755] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[   23.510324] RSP: 0018:ffffb4a60065fca8 EFLAGS: 00010246
[   23.515592] RAX: 0000000000000000 RBX: ffff9f428290e000 RCX: 000000000000000f
[   23.522765] RDX: 0000000000000000 RSI: 0000000000000282 RDI: ffff9f428290e000
[   23.529937] RBP: ffff9f4282907070 R08: ffff9f4281130428 R09: 00000000ffffffff
[   23.537111] R10: 0000000000000000 R11: 0000000000000001 R12: ffff9f42829070f8
[   23.544284] R13: ffff9f4282906028 R14: ffff9f4282900000 R15: ffff9f4282906b68
[   23.551457] FS:  0000000000000000(0000) GS:ffff9f466b2cf000(0000) knlGS:0000000000000000
[   23.559588] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   23.565365] CR2: ffffffffffffffd6 CR3: 000000031c230001 CR4: 0000000000f70ef0
[   23.572539] PKRU: 55555554
[   23.575281] Call Trace:
[   23.577770]  <TASK>
[   23.579905]  intel_engines_reset_default_submission+0x42/0x60
[   23.585695]  __intel_gt_unset_wedged+0x191/0x200
[   23.590360]  intel_gt_unset_wedged+0x20/0x40
[   23.594675]  gt_sanitize+0x15e/0x170
[   23.598290]  i915_gem_suspend_late+0x6b/0x180
[   23.602692]  i915_drm_suspend_late+0x35/0xf0
[   23.607008]  ? __pfx_pci_pm_suspend_late+0x10/0x10
[   23.611843]  dpm_run_callback+0x78/0x1c0
[   23.615817]  device_suspend_late+0xde/0x2e0
[   23.620037]  async_suspend_late+0x18/0x30
[   23.624082]  async_run_entry_fn+0x25/0xa0
[   23.628129]  process_one_work+0x15b/0x380
[   23.632182]  worker_thread+0x2a5/0x3c0
[   23.635973]  ? __pfx_worker_thread+0x10/0x10
[   23.640279]  kthread+0xf6/0x1f0
[   23.643464]  ? __pfx_kthread+0x10/0x10
[   23.647263]  ? __pfx_kthread+0x10/0x10
[   23.651045]  ret_from_fork+0x131/0x190
[   23.654837]  ? __pfx_kthread+0x10/0x10
[   23.658634]  ret_from_fork_asm+0x1a/0x30
[   23.662597]  </TASK>
[   23.664826] Modules linked in:
[   23.667914] CR2: 0000000000000000
[   23.671271] ------------[ cut here ]------------

Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index b721bbd23356..ce8cdd517daa 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1969,7 +1969,8 @@ void intel_engines_reset_default_submission(struct intel_gt *gt)
 		if (engine->sanitize)
 			engine->sanitize(engine);
 
-		engine->set_default_submission(engine);
+		if (engine->set_default_submission)
+			engine->set_default_submission(engine);
 	}
 }
 
-- 
2.43.0

