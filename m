Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E607691866C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 17:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DDD10E930;
	Wed, 26 Jun 2024 15:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCR/xEuz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D12F10E92C;
 Wed, 26 Jun 2024 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719417500; x=1750953500;
 h=message-id:subject:from:to:cc:date:
 content-transfer-encoding:mime-version;
 bh=1Ei/aDwlPqm0q2PPM5IoaG9+AOOcu0HuRM30TS1gEVQ=;
 b=YCR/xEuzlLaCHB8awnAtk3UEsHHKPIIgY6/2DPjOmqVeqllT8GR+52XP
 EkXBr9uOddqR36VFupX6lSrjJwx5tCRDPlA1waBNtJwws7bAkmXACsKH+
 xukpCWOeIWI7F7id6r2bPj8o899vLtIuoMhEI47vhrQooUFqoRpaJ2DAX
 D8lLscSYNPjzv84p2S+u8xEk5RA1TQVSt6HQNlJplmQDnrmdpFcNnzMe6
 MLbUHGxNySELN9a3LApc+wAW4RznZ3DDL7aUCemOohkp7aK9GsVIda01E
 7MAULFDSSkvKY2vBsq/QhdoYNCDUND4nUm5mnZSPhXcApember0cmznbj w==;
X-CSE-ConnectionGUID: FGEWec8iRxiEa+kpiE5vvg==
X-CSE-MsgGUID: YJWUZcHQRmO0L/G1jOkA5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34031797"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="34031797"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 08:58:19 -0700
X-CSE-ConnectionGUID: OrsogrgESo2HnGtmS4Wj5Q==
X-CSE-MsgGUID: 1H8CJa+IRGKPsqhSeqA8hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="43858570"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO [10.245.245.44])
 ([10.245.245.44])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 08:58:18 -0700
Message-ID: <40611e5ff8c32b99e7863293a0baac078f323d8f.camel@linux.intel.com>
Subject: dma_buf_detach lockdep splat
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Date: Wed, 26 Jun 2024 17:58:02 +0200
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

Hi!

I'm seeing the below lockdep splat 1) with the xe driver in an imported
dma-buf object destruction path.

It's not because we hold the dma_resv lock at that point, but rather
because we hold *another* dma_resv lock at that point, and the dma_resv
detach happens when the object is idle, in this case it was idle at the
final put(), and dma_buf_detach() is called in the putting process.

Holding another dma-buf lock might happen as part of
drm_exec_unlock_all, or simply if the wider vm dma_resv was held at
object put time, so it's not an uncommon pattern, even if the drm_exec
instance can be fixed by putting all bos after unlocking them all.

Two solutions coming to mind here:

1) Provide a dma_buf_detach_locked()
2) Have TTM always take the delayed delete path for imported dma-buf
objects.

I'd prefer 1) since I think the correct place to call this is in the
TTM callback delete_mem_notify() where the bo is already locked, and I
figure non-TTM gem backends may come to suffer from the same problem.

Opinions, suggestions?

[1]
[   99.136161] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   99.136162] WARNING: possible recursive locking detected
[   99.136163] 6.10.0-rc2+ #6 Tainted: G     U           =20
[   99.136165] --------------------------------------------
[   99.136166] glxgears:sh0/4675 is trying to acquire lock:
[   99.136167] ffff9967dcdd91a8 (reservation_ww_class_mutex){+.+.}-
{3:3}, at: dma_buf_detach+0x3b/0xf0
[   99.136184]=20
               but task is already holding lock:
[   99.136186] ffff9967d8c145a8 (reservation_ww_class_mutex){+.+.}-
{3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
[   99.136191]=20
               other info that might help us debug this:
[   99.136192]  Possible unsafe locking scenario:

[   99.136194]        CPU0
[   99.136194]        ----
[   99.136195]   lock(reservation_ww_class_mutex);
[   99.136197]   lock(reservation_ww_class_mutex);
[   99.136199]=20
                *** DEADLOCK ***

[   99.136199]  May be due to missing lock nesting notation

[   99.136200] 5 locks held by glxgears:sh0/4675:
[   99.136202]  #0: ffff9967d8c104c8 (&xef->vm.lock){+.+.}-{3:3}, at:
xe_file_close+0xde/0x1c0 [xe]
[   99.136272]  #1: ffff9967d5bb7480 (&vm->lock){++++}-{3:3}, at:
xe_vm_close_and_put+0x161/0x9b0 [xe]
[   99.136350]  #2: ffff9967ef88a970 (&val->lock){.+.+}-{3:3}, at:
xe_validation_ctx_init+0x6d/0x70 [xe]
[   99.136440]  #3: ffffbd6a085577b8
(reservation_ww_class_acquire){+.+.}-{0:0}, at:
xe_vma_destroy_unlocked+0x7f/0xe0 [xe]
[   99.136546]  #4: ffff9967d8c145a8
(reservation_ww_class_mutex){+.+.}-{3:3}, at:
drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
[   99.136552]=20
               stack backtrace:
[   99.136553] CPU: 10 PID: 4675 Comm: glxgears:sh0 Tainted: G     U =20
6.10.0-rc2+ #6
[   99.136555] Hardware name: ASUS System Product Name/PRIME B560M-A
AC, BIOS 2001 02/01/2023
[   99.136557] Call Trace:
[   99.136558]  <TASK>
[   99.136560]  dump_stack_lvl+0x77/0xb0
[   99.136564]  __lock_acquire+0x1232/0x2160
[   99.136569]  lock_acquire+0xcb/0x2d0
[   99.136570]  ? dma_buf_detach+0x3b/0xf0
[   99.136574]  ? __lock_acquire+0x417/0x2160
[   99.136577]  __ww_mutex_lock.constprop.0+0xd0/0x13b0
[   99.136580]  ? dma_buf_detach+0x3b/0xf0
[   99.136584]  ? dma_buf_detach+0x3b/0xf0
[   99.136588]  ? ww_mutex_lock+0x2b/0x90
[   99.136590]  ww_mutex_lock+0x2b/0x90
[   99.136592]  dma_buf_detach+0x3b/0xf0
[   99.136595]  drm_prime_gem_destroy+0x2f/0x40 [drm]
[   99.136638]  xe_ttm_bo_destroy+0x32/0x220 [xe]
[   99.136734]  ? __mutex_unlock_slowpath+0x3a/0x290
[   99.136738]  drm_exec_unlock_all+0xa1/0xd0 [drm_exec]
[   99.136741]  drm_exec_fini+0x12/0xb0 [drm_exec]
[   99.136743]  xe_validation_ctx_fini+0x15/0x40 [xe]
[   99.136848]  xe_vma_destroy_unlocked+0xb1/0xe0 [xe]
[   99.136954]  xe_vm_close_and_put+0x41a/0x9b0 [xe]
[   99.137056]  ? xa_find+0xe3/0x1e0
[   99.137060]  xe_file_close+0x10a/0x1c0 [xe]
[   99.137157]  drm_file_free+0x22a/0x280 [drm]
[   99.137193]  drm_release_noglobal+0x22/0x70 [drm]
[   99.137227]  __fput+0xf1/0x2d0
[   99.137231]  task_work_run+0x59/0x90
[   99.137235]  do_exit+0x330/0xb40
[   99.137238]  do_group_exit+0x36/0xa0
[   99.137241]  get_signal+0xbd2/0xbe0
[   99.137245]  arch_do_signal_or_restart+0x3e/0x240
[   99.137249]  syscall_exit_to_user_mode+0x1e7/0x290
[   99.137252]  do_syscall_64+0xa1/0x180
[   99.137255]  ? _raw_spin_unlock+0x23/0x40
[   99.137257]  ? look_up_lock_class+0x6f/0x120
[   99.137261]  ? __lock_acquire+0x417/0x2160
[   99.137264]  ? lock_acquire+0xcb/0x2d0
[   99.137266]  ? __set_task_comm+0x28/0x1e0
[   99.137268]  ? find_held_lock+0x2b/0x80
[   99.137271]  ? __set_task_comm+0xe1/0x1e0
[   99.137273]  ? lock_release+0xca/0x290
[   99.137277]  ? __do_sys_prctl+0x245/0xab0
[   99.137279]  ? lockdep_hardirqs_on_prepare+0xde/0x190
[   99.137281]  ? syscall_exit_to_user_mode+0xb0/0x290
[   99.137284]  ? do_syscall_64+0xa1/0x180
[   99.137286]  ? cpuset_cpus_allowed+0x36/0x140
[   99.137289]  ? find_held_lock+0x2b/0x80
[   99.137291]  ? find_held_lock+0x2b/0x80
[   99.137294]  ? __sched_setaffinity+0x78/0x240
[   99.137297]  ? kfree+0xe2/0x310
[   99.137301]  ? kfree+0x202/0x310
[   99.137303]  ? __sched_setaffinity+0x78/0x240
[   99.137305]  ? __x64_sys_sched_setaffinity+0x69/0xb0
[   99.137307]  ? kfree+0xe2/0x310
[   99.137310]  ? lockdep_hardirqs_on_prepare+0xde/0x190
[   99.137312]  ? syscall_exit_to_user_mode+0xb0/0x290
[   99.137315]  ? do_syscall_64+0xa1/0x180
[   99.137317]  ? trace_hardirqs_off+0x4b/0xc0
[   99.137321]  ? clear_bhb_loop+0x45/0xa0
[   99.137325]  ? clear_bhb_loop+0x45/0xa0
[   99.137327]  ? clear_bhb_loop+0x45/0xa0
[   99.137330]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   99.137333] RIP: 0033:0x7fda70ee6169
[   99.137351] Code: Unable to access opcode bytes at 0x7fda70ee613f.
[   99.137352] RSP: 002b:00007fda5fdffc80 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[   99.137354] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX:
00007fda70ee6169
[   99.137356] RDX: 0000000000000000 RSI: 0000000000000189 RDI:
0000564a96f45b30
[   99.137358] RBP: 00007fda5fdffcb0 R08: 0000000000000000 R09:
00000000ffffffff
[   99.137359] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[   99.137360] R13: 0000000000000000 R14: 0000000000000000 R15:
0000564a96f45b30
[   99.137365]  </TASK>

