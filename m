Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN7mJPVZcWnLGAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 23:57:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B9A5F29B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 23:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4BC89E69;
	Wed, 21 Jan 2026 22:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KEAwGzlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55C089E69;
 Wed, 21 Jan 2026 22:57:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DC8E3600C4;
 Wed, 21 Jan 2026 22:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAA7C4CEF1;
 Wed, 21 Jan 2026 22:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769036271;
 bh=3KahvyQMN6m2mGiAUICbKR2JVY49usN2B+c0GR/EYXA=;
 h=From:Date:Subject:To:Cc:From;
 b=KEAwGzlNK0a7nJaSpxWO+kW36H80xvzX1Tsj21H/lbnQ/fq6ZGpR27oA36Sn1YSQC
 dGENScnxxCe10dCx0dA1MMSzm8MiMcDwL5pIWn1WY5YkOjLdowu84MNhrGeNOZks+C
 4tXO/QuPE3BoVCtqfAgZSvWiDEa0cYf6LizQjC+fqGhzTvlaboQECzL21QScssJTzN
 /MO+KAiuTARekvRVzR9e82a2uDolM+l1hmYb/GKqC8VgsaYrWotVV0TBRdI13uRuNy
 iabftvW3rYO6Q2nciUf92eWkl7X4X8ER6j5uClczqthuMXc2Pm9MJwf6keeQKBm7kt
 c9OZtzaYr6eRg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 21 Jan 2026 15:57:35 -0700
Subject: [PATCH] drm/xe: Move _THIS_IP_ usage from xe_vm_create() to
 dedicated function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-xe-vm-fix-clang-goto-error-v1-1-7e121d81512e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrB0wEUL1KuLCxFGnVCMTFUG8e
 8d2+fMe3wWJhClBnV0gdHDiuGiYPIMwdctIyL022MK6wliDJ+Ex48Anho/uOMYtIolEQW/LUPX
 O+8G9QIFVSH8/vGn/nXb/prA9Itz3F7T1SH5+AAAA
X-Change-ID: 20260121-xe-vm-fix-clang-goto-error-b23c9d6bbf68
To: Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Stuart Summers <stuart.summers@intel.com>, 
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5434; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3KahvyQMN6m2mGiAUICbKR2JVY49usN2B+c0GR/EYXA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmFkW94jticebTHy8qlbvo8Dd3wg3VpXa8PPmXqLLxom
 nKo/lNNRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZhIijbD/6SuFOlt67naN1+t
 75vHX/M2RWTbutqXn2c2mj+0+Ke13p2R4fy25dorrawPFrdvYEo8oKf1vHm7fkrX0nSBFd4SFyb
 pswEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,google.com,intel.com,lists.freedesktop.org,lists.linux.dev,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,lkml];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 82B9A5F29B
X-Rspamd-Action: no action

After commit a3866ce7b122 ("drm/xe: Add vm to exec queues association"),
building for an architecture other than x86 (which defines its own
_THIS_IP_) with clang fails with:

  drivers/gpu/drm/xe/xe_vm.c:1586:3: error: cannot jump from this indirect goto statement to one of its possible targets
   1586 |                 drm_exec_retry_on_contention(&exec);
        |                 ^
  include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
    123 |                         goto *__drm_exec_retry_ptr;             \
        |                         ^
  drivers/gpu/drm/xe/xe_vm.c:1542:3: note: possible target of indirect goto statement
   1542 |                 might_lock(&vm->exec_queues.lock);
        |                 ^
  include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
    553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
        |                                        ^
  include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
     10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
        |                                         ^
  drivers/gpu/drm/xe/xe_vm.c:1583:2: note: jump exits scope of variable with __attribute__((cleanup))
   1583 |         xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
        |         ^
  drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_validation_guard'
    189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &_ret) \
        |         ^
  include/linux/cleanup.h:442:2: note: expanded from macro 'scoped_guard'
    442 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
        |         ^
  include/linux/cleanup.h:433:20: note: expanded from macro '__scoped_guard'
    433 |         for (CLASS(_name, scope)(args);                                 \
        |                           ^
  drivers/gpu/drm/xe/xe_vm.c:1542:3: note: jump enters a statement expression
   1542 |                 might_lock(&vm->exec_queues.lock);
        |                 ^
  include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
    553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
        |                                        ^
  include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
     10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
        |                    ^

While this is a false positive error because __drm_exec_retry_ptr is
only ever assigned the label in drm_exec_until_all_locked() (thus it can
never jump over the cleanup variable), this error is not unreasonable in
general because the only supported use case for taking the address of a
label is computed gotos [1]. The kernel's use of the address of a label
in _THIS_IP_ is considered problematic by both GCC [2][3] and clang [4]
but they need to provide something equivalent before they can break this
use case.

Hide the usage of _THIS_IP_ by moving the CONFIG_PROVE_LOCKING if
statement to its own function, avoiding the error. This is similar to
commit 187e16f69de2 ("drm/xe: Work around clang multiple goto-label
error") but with the sources of _THIS_IP_.

Fixes: a3866ce7b122 ("drm/xe: Add vm to exec queues association")
Link: https://gcc.gnu.org/onlinedocs/gcc/Labels-as-Values.html [1]
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=44298 [2]
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [3]
Link: https://github.com/llvm/llvm-project/issues/138272 [4]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/xe/xe_vm.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f7bb21ac1987..293b92ed2fdd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1474,6 +1474,20 @@ static void xe_vm_pt_destroy(struct xe_vm *vm)
 	}
 }
 
+static void xe_vm_init_prove_locking(struct xe_device *xe, struct xe_vm *vm)
+{
+	if (!IS_ENABLED(CONFIG_PROVE_LOCKING))
+		return;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&vm->exec_queues.lock);
+	fs_reclaim_release(GFP_KERNEL);
+
+	down_read(&vm->exec_queues.lock);
+	might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
+	up_read(&vm->exec_queues.lock);
+}
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 {
 	struct drm_gem_object *vm_resv_obj;
@@ -1537,15 +1551,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 		vm->preempt.min_run_period_ms = xe->min_run_period_lr_ms;
 
 	init_rwsem(&vm->exec_queues.lock);
-	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
-		fs_reclaim_acquire(GFP_KERNEL);
-		might_lock(&vm->exec_queues.lock);
-		fs_reclaim_release(GFP_KERNEL);
-
-		down_read(&vm->exec_queues.lock);
-		might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
-		up_read(&vm->exec_queues.lock);
-	}
+	xe_vm_init_prove_locking(xe, vm);
 
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_init(&vm->rftree[id]);

---
base-commit: 9dd1048bca4fe2aa67c7a286bafb3947537adedb
change-id: 20260121-xe-vm-fix-clang-goto-error-b23c9d6bbf68

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

