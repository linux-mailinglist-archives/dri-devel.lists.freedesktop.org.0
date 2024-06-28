Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8341C91C2BE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 17:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9142D10EC76;
	Fri, 28 Jun 2024 15:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpJ0GVVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B5510EC76;
 Fri, 28 Jun 2024 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719589142; x=1751125142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xM6QEDnEHb0eGKhPRa9JU/tOf388B5JYNkLW7Kv0I6c=;
 b=BpJ0GVVG1XTvqoTmzJOkH+9WGZx7zMJ11648G8gs30sysB9QRf0Y3mFi
 C6Ha1QGFVZ88v918ykP9+D0lQveDYeCxm80wkBauS0Qy8mHmPTimqrr73
 w1vBJHJI7gPmtzVU6TzuMZ+zqfd7GsIUB7u7mpv2ggi4H+zvwryZtJFp9
 21zOwu/TT5nOTz1LcWtvmJs38T75TitaOdbrYWO9aqM4rWoQi1wkZ+ZZs
 L3rdDPceikJI4XdOczB7xnaktoR2jQamgCpWl6y0+U617ZpX1v2TBqtZ3
 zzFnsmR8/K+yEJnp8YMxuHi924s3XtQqtWH99T+U9aRhNMH2If5XlF1ra g==;
X-CSE-ConnectionGUID: wiD88UePRJCdFHXMSafmCg==
X-CSE-MsgGUID: NZf5t8K9Ty2DQIxOo+0nHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16612346"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16612346"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 08:39:02 -0700
X-CSE-ConnectionGUID: J+zJks8NRACER40P2JkL6Q==
X-CSE-MsgGUID: ydQfAkoeTKSDkRnQoEIsUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="45517890"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora..) ([10.245.245.182])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 08:39:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH] drm/ttm: Always take the bo delayed cleanup path for imported
 bos
Date: Fri, 28 Jun 2024 17:38:48 +0200
Message-ID: <20240628153848.4989-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
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

Bos can be put with multiple unrelated dma-resv locks held. But
imported bos attempt to grab the bo dma-resv during dma-buf detach
that typically happens during cleanup. That leads to lockde splats
similar to the below and a potential ABBA deadlock.

Fix this by always taking the delayed workqueue cleanup path for
imported bos.

Requesting stable fixes from when the Xe driver was introduced,
since its usage of drm_exec and wide vm dma_resvs appear to be
the first reliable trigger of this.

[22982.116427] ============================================
[22982.116428] WARNING: possible recursive locking detected
[22982.116429] 6.10.0-rc2+ #10 Tainted: G     U  W
[22982.116430] --------------------------------------------
[22982.116430] glxgears:sh0/5785 is trying to acquire lock:
[22982.116431] ffff8c2bafa539a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: dma_buf_detach+0x3b/0xf0
[22982.116438]
               but task is already holding lock:
[22982.116438] ffff8c2d9aba6da8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
[22982.116442]
               other info that might help us debug this:
[22982.116442]  Possible unsafe locking scenario:

[22982.116443]        CPU0
[22982.116444]        ----
[22982.116444]   lock(reservation_ww_class_mutex);
[22982.116445]   lock(reservation_ww_class_mutex);
[22982.116447]
                *** DEADLOCK ***

[22982.116447]  May be due to missing lock nesting notation

[22982.116448] 5 locks held by glxgears:sh0/5785:
[22982.116449]  #0: ffff8c2d9aba58c8 (&xef->vm.lock){+.+.}-{3:3}, at: xe_file_close+0xde/0x1c0 [xe]
[22982.116507]  #1: ffff8c2e28cc8480 (&vm->lock){++++}-{3:3}, at: xe_vm_close_and_put+0x161/0x9b0 [xe]
[22982.116578]  #2: ffff8c2e31982970 (&val->lock){.+.+}-{3:3}, at: xe_validation_ctx_init+0x6d/0x70 [xe]
[22982.116647]  #3: ffffacdc469478a8 (reservation_ww_class_acquire){+.+.}-{0:0}, at: xe_vma_destroy_unlocked+0x7f/0xe0 [xe]
[22982.116716]  #4: ffff8c2d9aba6da8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
[22982.116719]
               stack backtrace:
[22982.116720] CPU: 8 PID: 5785 Comm: glxgears:sh0 Tainted: G     U  W          6.10.0-rc2+ #10
[22982.116721] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 2001 02/01/2023
[22982.116723] Call Trace:
[22982.116724]  <TASK>
[22982.116725]  dump_stack_lvl+0x77/0xb0
[22982.116727]  __lock_acquire+0x1232/0x2160
[22982.116730]  lock_acquire+0xcb/0x2d0
[22982.116732]  ? dma_buf_detach+0x3b/0xf0
[22982.116734]  ? __lock_acquire+0x417/0x2160
[22982.116736]  __ww_mutex_lock.constprop.0+0xd0/0x13b0
[22982.116738]  ? dma_buf_detach+0x3b/0xf0
[22982.116741]  ? dma_buf_detach+0x3b/0xf0
[22982.116743]  ? ww_mutex_lock+0x2b/0x90
[22982.116745]  ww_mutex_lock+0x2b/0x90
[22982.116747]  dma_buf_detach+0x3b/0xf0
[22982.116749]  drm_prime_gem_destroy+0x2f/0x40 [drm]
[22982.116775]  xe_ttm_bo_destroy+0x32/0x220 [xe]
[22982.116818]  ? __mutex_unlock_slowpath+0x3a/0x290
[22982.116821]  drm_exec_unlock_all+0xa1/0xd0 [drm_exec]
[22982.116823]  drm_exec_fini+0x12/0xb0 [drm_exec]
[22982.116824]  xe_validation_ctx_fini+0x15/0x40 [xe]
[22982.116892]  xe_vma_destroy_unlocked+0xb1/0xe0 [xe]
[22982.116959]  xe_vm_close_and_put+0x41a/0x9b0 [xe]
[22982.117025]  ? xa_find+0xe3/0x1e0
[22982.117028]  xe_file_close+0x10a/0x1c0 [xe]
[22982.117074]  drm_file_free+0x22a/0x280 [drm]
[22982.117099]  drm_release_noglobal+0x22/0x70 [drm]
[22982.117119]  __fput+0xf1/0x2d0
[22982.117122]  task_work_run+0x59/0x90
[22982.117125]  do_exit+0x330/0xb40
[22982.117127]  do_group_exit+0x36/0xa0
[22982.117129]  get_signal+0xbd2/0xbe0
[22982.117131]  arch_do_signal_or_restart+0x3e/0x240
[22982.117134]  syscall_exit_to_user_mode+0x1e7/0x290
[22982.117137]  do_syscall_64+0xa1/0x180
[22982.117139]  ? lock_acquire+0xcb/0x2d0
[22982.117140]  ? __set_task_comm+0x28/0x1e0
[22982.117141]  ? find_held_lock+0x2b/0x80
[22982.117144]  ? __set_task_comm+0xe1/0x1e0
[22982.117145]  ? lock_release+0xca/0x290
[22982.117147]  ? __do_sys_prctl+0x245/0xab0
[22982.117149]  ? lockdep_hardirqs_on_prepare+0xde/0x190
[22982.117150]  ? syscall_exit_to_user_mode+0xb0/0x290
[22982.117152]  ? do_syscall_64+0xa1/0x180
[22982.117154]  ? __lock_acquire+0x417/0x2160
[22982.117155]  ? reacquire_held_locks+0xd1/0x1f0
[22982.117156]  ? do_user_addr_fault+0x30c/0x790
[22982.117158]  ? lock_acquire+0xcb/0x2d0
[22982.117160]  ? find_held_lock+0x2b/0x80
[22982.117162]  ? do_user_addr_fault+0x357/0x790
[22982.117163]  ? lock_release+0xca/0x290
[22982.117164]  ? do_user_addr_fault+0x361/0x790
[22982.117166]  ? trace_hardirqs_off+0x4b/0xc0
[22982.117168]  ? clear_bhb_loop+0x45/0xa0
[22982.117170]  ? clear_bhb_loop+0x45/0xa0
[22982.117172]  ? clear_bhb_loop+0x45/0xa0
[22982.117174]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[22982.117176] RIP: 0033:0x7f943d267169
[22982.117192] Code: Unable to access opcode bytes at 0x7f943d26713f.
[22982.117193] RSP: 002b:00007f9430bffc80 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
[22982.117195] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX: 00007f943d267169
[22982.117196] RDX: 0000000000000000 RSI: 0000000000000189 RDI: 00005622f89579d0
[22982.117197] RBP: 00007f9430bffcb0 R08: 0000000000000000 R09: 00000000ffffffff
[22982.117198] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[22982.117199] R13: 0000000000000000 R14: 0000000000000000 R15: 00005622f89579d0
[22982.117202]  </TASK>

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6396dece0db1..2427be8bc97f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -346,6 +346,7 @@ static void ttm_bo_release(struct kref *kref)
 		if (!dma_resv_test_signaled(bo->base.resv,
 					    DMA_RESV_USAGE_BOOKKEEP) ||
 		    (want_init_on_free() && (bo->ttm != NULL)) ||
+		    bo->type == ttm_bo_type_sg ||
 		    !dma_resv_trylock(bo->base.resv)) {
 			/* The BO is not idle, resurrect it for delayed destroy */
 			ttm_bo_flush_all_fences(bo);
-- 
2.44.0

