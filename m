Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A5491A66C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 14:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A00210E284;
	Thu, 27 Jun 2024 12:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmDCsodw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FB310E05F;
 Thu, 27 Jun 2024 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719490731; x=1751026731;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kWB0Ucya+XWNwFmjiJ/kgTuWE7xcQQIJ+tdemT7y9Do=;
 b=BmDCsodwaeF0K7HAdfATj+ZmWo3NSmGlga+mO6+HStEE0my/AyN3TZ7M
 Mvs4jPj1Ves+5kG8DAmgqtDdjLr3E0dGv9bZapnFcY0aBzWRSGEWPZNON
 5YQAAcb6kh1Xjd/5RZvi38f93Iowpy2Qyrlpag7OwVskF7Mfe+alKRrLX
 9KdJueEghUQBkvUd1obveGlaGwv9SCW3rQyRS5BdA5F7tHhcm8xXmElaS
 l05aAEbUxhWNogcEbX4xYm3GzhJsytgWJIZcar7AMgWQZxOl8nZD/ASu0
 +61IbQdz1LCDYEGLeEWYtOAGEV/g1Q4Ea5RVO2EEcTxgo7wwFIWD+p/+L A==;
X-CSE-ConnectionGUID: BGJfM3jUSH6Ko0W3R/+wWg==
X-CSE-MsgGUID: NsvIC6zzQ3WJ4NETFqz0NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16433224"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="16433224"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 05:18:50 -0700
X-CSE-ConnectionGUID: 9BGKJirwSnyPrdGSEOpQhg==
X-CSE-MsgGUID: ix/07BxqR9mN7Wux8jsbvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="44423626"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.93])
 ([10.245.245.93])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 05:18:47 -0700
Message-ID: <6bc17415f36c2a9c689010e1cf397fc75a8df55e.camel@linux.intel.com>
Subject: Re: [Linaro-mm-sig] Re: dma_buf_detach lockdep splat
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 27 Jun 2024 14:18:44 +0200
In-Reply-To: <Zn0c8l-yQih3j0NE@phenom.ffwll.local>
References: <40611e5ff8c32b99e7863293a0baac078f323d8f.camel@linux.intel.com>
 <Zn0c8l-yQih3j0NE@phenom.ffwll.local>
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

On Thu, 2024-06-27 at 10:04 +0200, Daniel Vetter wrote:
> On Wed, Jun 26, 2024 at 05:58:02PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Hi!
> >=20
> > I'm seeing the below lockdep splat 1) with the xe driver in an
> > imported
> > dma-buf object destruction path.
> >=20
> > It's not because we hold the dma_resv lock at that point, but
> > rather
> > because we hold *another* dma_resv lock at that point, and the
> > dma_resv
> > detach happens when the object is idle, in this case it was idle at
> > the
> > final put(), and dma_buf_detach() is called in the putting process.
> >=20
> > Holding another dma-buf lock might happen as part of
> > drm_exec_unlock_all, or simply if the wider vm dma_resv was held at
> > object put time, so it's not an uncommon pattern, even if the
> > drm_exec
> > instance can be fixed by putting all bos after unlocking them all.
> >=20
> > Two solutions coming to mind here:
> >=20
> > 1) Provide a dma_buf_detach_locked()
>=20
> This smells way too much like the endless headaches we had with
> drm_gem_object_put_locked and friends against
> drm_device.struct_mutex. Or
> I'm not understanding what you're doing, because I'm pretty sure you
> have
> to take the dma_resv lock on final put() of imported objects. Because
> that
> final put() is of the import wrapper, the exporter (and other
> importers)
> can still get at that object and so dma_resv_lock is very much
> needed.

Yeah, the TTM final put looks like

if (!dma_resv_trylock() || !idle)
	queue_work(final_distruction);

dma_resv_unlock();
dma_buf_detach(); <--- lockdep splat

Here's where a dma_buf_detach_locked() would've made sense before the
dma_resv_unlock().

But if you think this will cause grief, I'm completely fine with
fixing this in TTM by always taking the deferring path.

/Thomas
=20

>=20
> Or it's a completely different final put(), but I have no idea how
> you get
> that on an imported dma_buf.
>=20
> > 2) Have TTM always take the delayed delete path for imported dma-
> > buf
> > objects.
> >=20
> > I'd prefer 1) since I think the correct place to call this is in
> > the
> > TTM callback delete_mem_notify() where the bo is already locked,
> > and I
> > figure non-TTM gem backends may come to suffer from the same
> > problem.
> >=20
> > Opinions, suggestions?
>=20
> Imo 2) or trying to push the object puts outside of the
> dma_resv_lock. The
> latter is imo natural, since usually you grab references, then lock.
> And
> this even holds for at least the slow path of lru eviction, because
> you
> need to drop all locks and then do a ww_mutex_lock_slow, and that
> requires
> that you can hold references to unlocked objects.
>=20
> But 2) alone is imo fine, dma_buf have become really big objects that
> go
> across drivers, extremely similar to struct file, and that is doing
> the
> delayed final put unconditionally since years too, using task_work.
> It's
> simply a solid design.
>=20
> Cheers, Sima
>=20
> > [1]
> > [=C2=A0=C2=A0 99.136161] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > [=C2=A0=C2=A0 99.136162] WARNING: possible recursive locking detected
> > [=C2=A0=C2=A0 99.136163] 6.10.0-rc2+ #6 Tainted: G=C2=A0=C2=A0=C2=A0=C2=
=A0 U=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > [=C2=A0=C2=A0 99.136165] --------------------------------------------
> > [=C2=A0=C2=A0 99.136166] glxgears:sh0/4675 is trying to acquire lock:
> > [=C2=A0=C2=A0 99.136167] ffff9967dcdd91a8 (reservation_ww_class_mutex){=
+.+.}-
> > {3:3}, at: dma_buf_detach+0x3b/0xf0
> > [=C2=A0=C2=A0 99.136184]=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 but task is already holding lock:
> > [=C2=A0=C2=A0 99.136186] ffff9967d8c145a8 (reservation_ww_class_mutex){=
+.+.}-
> > {3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
> > [=C2=A0=C2=A0 99.136191]=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 other info that might help us debug this:
> > [=C2=A0=C2=A0 99.136192]=C2=A0 Possible unsafe locking scenario:
> >=20
> > [=C2=A0=C2=A0 99.136194]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0
> > [=C2=A0=C2=A0 99.136194]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
> > [=C2=A0=C2=A0 99.136195]=C2=A0=C2=A0 lock(reservation_ww_class_mutex);
> > [=C2=A0=C2=A0 99.136197]=C2=A0=C2=A0 lock(reservation_ww_class_mutex);
> > [=C2=A0=C2=A0 99.136199]=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 *** DEADLOCK ***
> >=20
> > [=C2=A0=C2=A0 99.136199]=C2=A0 May be due to missing lock nesting notat=
ion
> >=20
> > [=C2=A0=C2=A0 99.136200] 5 locks held by glxgears:sh0/4675:
> > [=C2=A0=C2=A0 99.136202]=C2=A0 #0: ffff9967d8c104c8 (&xef->vm.lock){+.+=
.}-{3:3},
> > at:
> > xe_file_close+0xde/0x1c0 [xe]
> > [=C2=A0=C2=A0 99.136272]=C2=A0 #1: ffff9967d5bb7480 (&vm->lock){++++}-{=
3:3}, at:
> > xe_vm_close_and_put+0x161/0x9b0 [xe]
> > [=C2=A0=C2=A0 99.136350]=C2=A0 #2: ffff9967ef88a970 (&val->lock){.+.+}-=
{3:3}, at:
> > xe_validation_ctx_init+0x6d/0x70 [xe]
> > [=C2=A0=C2=A0 99.136440]=C2=A0 #3: ffffbd6a085577b8
> > (reservation_ww_class_acquire){+.+.}-{0:0}, at:
> > xe_vma_destroy_unlocked+0x7f/0xe0 [xe]
> > [=C2=A0=C2=A0 99.136546]=C2=A0 #4: ffff9967d8c145a8
> > (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> > drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
> > [=C2=A0=C2=A0 99.136552]=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 stack backtrace:
> > [=C2=A0=C2=A0 99.136553] CPU: 10 PID: 4675 Comm: glxgears:sh0 Tainted: =
G=C2=A0=C2=A0=C2=A0=C2=A0
> > U=C2=A0=20
> > 6.10.0-rc2+ #6
> > [=C2=A0=C2=A0 99.136555] Hardware name: ASUS System Product Name/PRIME =
B560M-
> > A
> > AC, BIOS 2001 02/01/2023
> > [=C2=A0=C2=A0 99.136557] Call Trace:
> > [=C2=A0=C2=A0 99.136558]=C2=A0 <TASK>
> > [=C2=A0=C2=A0 99.136560]=C2=A0 dump_stack_lvl+0x77/0xb0
> > [=C2=A0=C2=A0 99.136564]=C2=A0 __lock_acquire+0x1232/0x2160
> > [=C2=A0=C2=A0 99.136569]=C2=A0 lock_acquire+0xcb/0x2d0
> > [=C2=A0=C2=A0 99.136570]=C2=A0 ? dma_buf_detach+0x3b/0xf0
> > [=C2=A0=C2=A0 99.136574]=C2=A0 ? __lock_acquire+0x417/0x2160
> > [=C2=A0=C2=A0 99.136577]=C2=A0 __ww_mutex_lock.constprop.0+0xd0/0x13b0
> > [=C2=A0=C2=A0 99.136580]=C2=A0 ? dma_buf_detach+0x3b/0xf0
> > [=C2=A0=C2=A0 99.136584]=C2=A0 ? dma_buf_detach+0x3b/0xf0
> > [=C2=A0=C2=A0 99.136588]=C2=A0 ? ww_mutex_lock+0x2b/0x90
> > [=C2=A0=C2=A0 99.136590]=C2=A0 ww_mutex_lock+0x2b/0x90
> > [=C2=A0=C2=A0 99.136592]=C2=A0 dma_buf_detach+0x3b/0xf0
> > [=C2=A0=C2=A0 99.136595]=C2=A0 drm_prime_gem_destroy+0x2f/0x40 [drm]
> > [=C2=A0=C2=A0 99.136638]=C2=A0 xe_ttm_bo_destroy+0x32/0x220 [xe]
> > [=C2=A0=C2=A0 99.136734]=C2=A0 ? __mutex_unlock_slowpath+0x3a/0x290
> > [=C2=A0=C2=A0 99.136738]=C2=A0 drm_exec_unlock_all+0xa1/0xd0 [drm_exec]
> > [=C2=A0=C2=A0 99.136741]=C2=A0 drm_exec_fini+0x12/0xb0 [drm_exec]
> > [=C2=A0=C2=A0 99.136743]=C2=A0 xe_validation_ctx_fini+0x15/0x40 [xe]
> > [=C2=A0=C2=A0 99.136848]=C2=A0 xe_vma_destroy_unlocked+0xb1/0xe0 [xe]
> > [=C2=A0=C2=A0 99.136954]=C2=A0 xe_vm_close_and_put+0x41a/0x9b0 [xe]
> > [=C2=A0=C2=A0 99.137056]=C2=A0 ? xa_find+0xe3/0x1e0
> > [=C2=A0=C2=A0 99.137060]=C2=A0 xe_file_close+0x10a/0x1c0 [xe]
> > [=C2=A0=C2=A0 99.137157]=C2=A0 drm_file_free+0x22a/0x280 [drm]
> > [=C2=A0=C2=A0 99.137193]=C2=A0 drm_release_noglobal+0x22/0x70 [drm]
> > [=C2=A0=C2=A0 99.137227]=C2=A0 __fput+0xf1/0x2d0
> > [=C2=A0=C2=A0 99.137231]=C2=A0 task_work_run+0x59/0x90
> > [=C2=A0=C2=A0 99.137235]=C2=A0 do_exit+0x330/0xb40
> > [=C2=A0=C2=A0 99.137238]=C2=A0 do_group_exit+0x36/0xa0
> > [=C2=A0=C2=A0 99.137241]=C2=A0 get_signal+0xbd2/0xbe0
> > [=C2=A0=C2=A0 99.137245]=C2=A0 arch_do_signal_or_restart+0x3e/0x240
> > [=C2=A0=C2=A0 99.137249]=C2=A0 syscall_exit_to_user_mode+0x1e7/0x290
> > [=C2=A0=C2=A0 99.137252]=C2=A0 do_syscall_64+0xa1/0x180
> > [=C2=A0=C2=A0 99.137255]=C2=A0 ? _raw_spin_unlock+0x23/0x40
> > [=C2=A0=C2=A0 99.137257]=C2=A0 ? look_up_lock_class+0x6f/0x120
> > [=C2=A0=C2=A0 99.137261]=C2=A0 ? __lock_acquire+0x417/0x2160
> > [=C2=A0=C2=A0 99.137264]=C2=A0 ? lock_acquire+0xcb/0x2d0
> > [=C2=A0=C2=A0 99.137266]=C2=A0 ? __set_task_comm+0x28/0x1e0
> > [=C2=A0=C2=A0 99.137268]=C2=A0 ? find_held_lock+0x2b/0x80
> > [=C2=A0=C2=A0 99.137271]=C2=A0 ? __set_task_comm+0xe1/0x1e0
> > [=C2=A0=C2=A0 99.137273]=C2=A0 ? lock_release+0xca/0x290
> > [=C2=A0=C2=A0 99.137277]=C2=A0 ? __do_sys_prctl+0x245/0xab0
> > [=C2=A0=C2=A0 99.137279]=C2=A0 ? lockdep_hardirqs_on_prepare+0xde/0x190
> > [=C2=A0=C2=A0 99.137281]=C2=A0 ? syscall_exit_to_user_mode+0xb0/0x290
> > [=C2=A0=C2=A0 99.137284]=C2=A0 ? do_syscall_64+0xa1/0x180
> > [=C2=A0=C2=A0 99.137286]=C2=A0 ? cpuset_cpus_allowed+0x36/0x140
> > [=C2=A0=C2=A0 99.137289]=C2=A0 ? find_held_lock+0x2b/0x80
> > [=C2=A0=C2=A0 99.137291]=C2=A0 ? find_held_lock+0x2b/0x80
> > [=C2=A0=C2=A0 99.137294]=C2=A0 ? __sched_setaffinity+0x78/0x240
> > [=C2=A0=C2=A0 99.137297]=C2=A0 ? kfree+0xe2/0x310
> > [=C2=A0=C2=A0 99.137301]=C2=A0 ? kfree+0x202/0x310
> > [=C2=A0=C2=A0 99.137303]=C2=A0 ? __sched_setaffinity+0x78/0x240
> > [=C2=A0=C2=A0 99.137305]=C2=A0 ? __x64_sys_sched_setaffinity+0x69/0xb0
> > [=C2=A0=C2=A0 99.137307]=C2=A0 ? kfree+0xe2/0x310
> > [=C2=A0=C2=A0 99.137310]=C2=A0 ? lockdep_hardirqs_on_prepare+0xde/0x190
> > [=C2=A0=C2=A0 99.137312]=C2=A0 ? syscall_exit_to_user_mode+0xb0/0x290
> > [=C2=A0=C2=A0 99.137315]=C2=A0 ? do_syscall_64+0xa1/0x180
> > [=C2=A0=C2=A0 99.137317]=C2=A0 ? trace_hardirqs_off+0x4b/0xc0
> > [=C2=A0=C2=A0 99.137321]=C2=A0 ? clear_bhb_loop+0x45/0xa0
> > [=C2=A0=C2=A0 99.137325]=C2=A0 ? clear_bhb_loop+0x45/0xa0
> > [=C2=A0=C2=A0 99.137327]=C2=A0 ? clear_bhb_loop+0x45/0xa0
> > [=C2=A0=C2=A0 99.137330]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [=C2=A0=C2=A0 99.137333] RIP: 0033:0x7fda70ee6169
> > [=C2=A0=C2=A0 99.137351] Code: Unable to access opcode bytes at
> > 0x7fda70ee613f.
> > [=C2=A0=C2=A0 99.137352] RSP: 002b:00007fda5fdffc80 EFLAGS: 00000246
> > ORIG_RAX:
> > 00000000000000ca
> > [=C2=A0=C2=A0 99.137354] RAX: fffffffffffffe00 RBX: 0000000000000000 RC=
X:
> > 00007fda70ee6169
> > [=C2=A0=C2=A0 99.137356] RDX: 0000000000000000 RSI: 0000000000000189 RD=
I:
> > 0000564a96f45b30
> > [=C2=A0=C2=A0 99.137358] RBP: 00007fda5fdffcb0 R08: 0000000000000000 R0=
9:
> > 00000000ffffffff
> > [=C2=A0=C2=A0 99.137359] R10: 0000000000000000 R11: 0000000000000246 R1=
2:
> > 0000000000000000
> > [=C2=A0=C2=A0 99.137360] R13: 0000000000000000 R14: 0000000000000000 R1=
5:
> > 0000564a96f45b30
> > [=C2=A0=C2=A0 99.137365]=C2=A0 </TASK>
> >=20
>=20

