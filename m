Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E44927124
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B988710EA18;
	Thu,  4 Jul 2024 08:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zg9GDQ0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248FD10EA17;
 Thu,  4 Jul 2024 08:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720080160; x=1751616160;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3ZUwTceSBpb6CD4scfPX6oEr7FFHDEsHdCaicQ+iVqI=;
 b=Zg9GDQ0rzHEQAo14w23vfHQodiejUFJeuKCbroYsuf90+Hsz0aK3Uf0R
 FQ9JdRfLkHdJ67yU/uItUzmu4+O+T2nqxjamfKMpL/YO78xODKUQFLjh2
 d+uWvUZHjeK4cgF/jwEN21z0Pz56zLa3/qCIz+NXoIwGuxjj64v0ho+HF
 bml52KDVBVEgAOFWDZ+vQ38FX1aV4d7ktfyr8PLnSWhuOGwAxVEWpWEBG
 UoHw0OeczriShSAOJ+rogayA6fsWpKaD6v64ZikRIxXEmj2Id4k0T2MaJ
 G6c134/ADFXbToK+Lf9xtvOJAJbyjRKjk+7G/iZCVTalCyf7JYz7tGCvS A==;
X-CSE-ConnectionGUID: YcBQyOcIQVOhpZ3Jrm4QjQ==
X-CSE-MsgGUID: NAmQGDeQTj+IDPFZRg93jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="27961395"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="27961395"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:02:40 -0700
X-CSE-ConnectionGUID: tuMmnWtkSKyTp9sTV5fOUw==
X-CSE-MsgGUID: WDTfuELXSf2aIqAI04dSaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46937338"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.56])
 ([10.245.245.56])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:02:37 -0700
Message-ID: <9555ff334287ee508ff3d7cad805b156c18f3424.camel@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: Always take the bo delayed cleanup path for
 imported bos
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 stable@vger.kernel.org
Date: Thu, 04 Jul 2024 10:02:35 +0200
In-Reply-To: <7caeb3e0-490d-47f3-89b8-9e1264acc072@amd.com>
References: <20240628153848.4989-1-thomas.hellstrom@linux.intel.com>
 <Zn7cBbi/iZ1cxWPb@DUT025-TGLU.fm.intel.com>
 <Zn79TNg1WfERV7gj@phenom.ffwll.local>
 <7caeb3e0-490d-47f3-89b8-9e1264acc072@amd.com>
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

On Mon, 2024-07-01 at 12:43 +0200, Christian K=C3=B6nig wrote:
> Am 28.06.24 um 20:13 schrieb Daniel Vetter:
> > On Fri, Jun 28, 2024 at 03:51:33PM +0000, Matthew Brost wrote:
> > > On Fri, Jun 28, 2024 at 05:38:48PM +0200, Thomas Hellstr=C3=B6m wrote=
:
> > > > Bos can be put with multiple unrelated dma-resv locks held. But
> > > > imported bos attempt to grab the bo dma-resv during dma-buf
> > > > detach
> > > > that typically happens during cleanup. That leads to lockde
> > > > splats
> > > > similar to the below and a potential ABBA deadlock.
> > > >=20
> > > > Fix this by always taking the delayed workqueue cleanup path
> > > > for
> > > > imported bos.
> > > >=20
> > > > Requesting stable fixes from when the Xe driver was introduced,
> > > > since its usage of drm_exec and wide vm dma_resvs appear to be
> > > > the first reliable trigger of this.
> > > >=20
> > > > [22982.116427] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > > [22982.116428] WARNING: possible recursive locking detected
> > > > [22982.116429] 6.10.0-rc2+ #10 Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0 U=
=C2=A0 W
> > > > [22982.116430] --------------------------------------------
> > > > [22982.116430] glxgears:sh0/5785 is trying to acquire lock:
> > > > [22982.116431] ffff8c2bafa539a8
> > > > (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> > > > dma_buf_detach+0x3b/0xf0
> > > > [22982.116438]
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 but task is already holding lock:
> > > > [22982.116438] ffff8c2d9aba6da8
> > > > (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> > > > drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
> > > > [22982.116442]
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 other info that might help us debug this:
> > > > [22982.116442]=C2=A0 Possible unsafe locking scenario:
> > > >=20
> > > > [22982.116443]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0
> > > > [22982.116444]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
> > > > [22982.116444]=C2=A0=C2=A0 lock(reservation_ww_class_mutex);
> > > > [22982.116445]=C2=A0=C2=A0 lock(reservation_ww_class_mutex);
> > > > [22982.116447]
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *** DEADLOCK ***
> > > >=20
> > > > [22982.116447]=C2=A0 May be due to missing lock nesting notation
> > > >=20
> > > > [22982.116448] 5 locks held by glxgears:sh0/5785:
> > > > [22982.116449]=C2=A0 #0: ffff8c2d9aba58c8 (&xef->vm.lock){+.+.}-
> > > > {3:3}, at: xe_file_close+0xde/0x1c0 [xe]
> > > > [22982.116507]=C2=A0 #1: ffff8c2e28cc8480 (&vm->lock){++++}-{3:3},
> > > > at: xe_vm_close_and_put+0x161/0x9b0 [xe]
> > > > [22982.116578]=C2=A0 #2: ffff8c2e31982970 (&val->lock){.+.+}-{3:3},
> > > > at: xe_validation_ctx_init+0x6d/0x70 [xe]
> > > > [22982.116647]=C2=A0 #3: ffffacdc469478a8
> > > > (reservation_ww_class_acquire){+.+.}-{0:0}, at:
> > > > xe_vma_destroy_unlocked+0x7f/0xe0 [xe]
> > > > [22982.116716]=C2=A0 #4: ffff8c2d9aba6da8
> > > > (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> > > > drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
> > > > [22982.116719]
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 stack backtrace:
> > > > [22982.116720] CPU: 8 PID: 5785 Comm: glxgears:sh0 Tainted:
> > > > G=C2=A0=C2=A0=C2=A0=C2=A0 U=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 6.10.0-rc2+ #10
> > > > [22982.116721] Hardware name: ASUS System Product Name/PRIME
> > > > B560M-A AC, BIOS 2001 02/01/2023
> > > > [22982.116723] Call Trace:
> > > > [22982.116724]=C2=A0 <TASK>
> > > > [22982.116725]=C2=A0 dump_stack_lvl+0x77/0xb0
> > > > [22982.116727]=C2=A0 __lock_acquire+0x1232/0x2160
> > > > [22982.116730]=C2=A0 lock_acquire+0xcb/0x2d0
> > > > [22982.116732]=C2=A0 ? dma_buf_detach+0x3b/0xf0
> > > > [22982.116734]=C2=A0 ? __lock_acquire+0x417/0x2160
> > > > [22982.116736]=C2=A0 __ww_mutex_lock.constprop.0+0xd0/0x13b0
> > > > [22982.116738]=C2=A0 ? dma_buf_detach+0x3b/0xf0
> > > > [22982.116741]=C2=A0 ? dma_buf_detach+0x3b/0xf0
> > > > [22982.116743]=C2=A0 ? ww_mutex_lock+0x2b/0x90
> > > > [22982.116745]=C2=A0 ww_mutex_lock+0x2b/0x90
> > > > [22982.116747]=C2=A0 dma_buf_detach+0x3b/0xf0
> > > > [22982.116749]=C2=A0 drm_prime_gem_destroy+0x2f/0x40 [drm]
> > > > [22982.116775]=C2=A0 xe_ttm_bo_destroy+0x32/0x220 [xe]
> > > > [22982.116818]=C2=A0 ? __mutex_unlock_slowpath+0x3a/0x290
> > > > [22982.116821]=C2=A0 drm_exec_unlock_all+0xa1/0xd0 [drm_exec]
> > > > [22982.116823]=C2=A0 drm_exec_fini+0x12/0xb0 [drm_exec]
> > > > [22982.116824]=C2=A0 xe_validation_ctx_fini+0x15/0x40 [xe]
> > > > [22982.116892]=C2=A0 xe_vma_destroy_unlocked+0xb1/0xe0 [xe]
> > > > [22982.116959]=C2=A0 xe_vm_close_and_put+0x41a/0x9b0 [xe]
> > > > [22982.117025]=C2=A0 ? xa_find+0xe3/0x1e0
> > > > [22982.117028]=C2=A0 xe_file_close+0x10a/0x1c0 [xe]
> > > > [22982.117074]=C2=A0 drm_file_free+0x22a/0x280 [drm]
> > > > [22982.117099]=C2=A0 drm_release_noglobal+0x22/0x70 [drm]
> > > > [22982.117119]=C2=A0 __fput+0xf1/0x2d0
> > > > [22982.117122]=C2=A0 task_work_run+0x59/0x90
> > > > [22982.117125]=C2=A0 do_exit+0x330/0xb40
> > > > [22982.117127]=C2=A0 do_group_exit+0x36/0xa0
> > > > [22982.117129]=C2=A0 get_signal+0xbd2/0xbe0
> > > > [22982.117131]=C2=A0 arch_do_signal_or_restart+0x3e/0x240
> > > > [22982.117134]=C2=A0 syscall_exit_to_user_mode+0x1e7/0x290
> > > > [22982.117137]=C2=A0 do_syscall_64+0xa1/0x180
> > > > [22982.117139]=C2=A0 ? lock_acquire+0xcb/0x2d0
> > > > [22982.117140]=C2=A0 ? __set_task_comm+0x28/0x1e0
> > > > [22982.117141]=C2=A0 ? find_held_lock+0x2b/0x80
> > > > [22982.117144]=C2=A0 ? __set_task_comm+0xe1/0x1e0
> > > > [22982.117145]=C2=A0 ? lock_release+0xca/0x290
> > > > [22982.117147]=C2=A0 ? __do_sys_prctl+0x245/0xab0
> > > > [22982.117149]=C2=A0 ? lockdep_hardirqs_on_prepare+0xde/0x190
> > > > [22982.117150]=C2=A0 ? syscall_exit_to_user_mode+0xb0/0x290
> > > > [22982.117152]=C2=A0 ? do_syscall_64+0xa1/0x180
> > > > [22982.117154]=C2=A0 ? __lock_acquire+0x417/0x2160
> > > > [22982.117155]=C2=A0 ? reacquire_held_locks+0xd1/0x1f0
> > > > [22982.117156]=C2=A0 ? do_user_addr_fault+0x30c/0x790
> > > > [22982.117158]=C2=A0 ? lock_acquire+0xcb/0x2d0
> > > > [22982.117160]=C2=A0 ? find_held_lock+0x2b/0x80
> > > > [22982.117162]=C2=A0 ? do_user_addr_fault+0x357/0x790
> > > > [22982.117163]=C2=A0 ? lock_release+0xca/0x290
> > > > [22982.117164]=C2=A0 ? do_user_addr_fault+0x361/0x790
> > > > [22982.117166]=C2=A0 ? trace_hardirqs_off+0x4b/0xc0
> > > > [22982.117168]=C2=A0 ? clear_bhb_loop+0x45/0xa0
> > > > [22982.117170]=C2=A0 ? clear_bhb_loop+0x45/0xa0
> > > > [22982.117172]=C2=A0 ? clear_bhb_loop+0x45/0xa0
> > > > [22982.117174]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > > [22982.117176] RIP: 0033:0x7f943d267169
> > > > [22982.117192] Code: Unable to access opcode bytes at
> > > > 0x7f943d26713f.
> > > > [22982.117193] RSP: 002b:00007f9430bffc80 EFLAGS: 00000246
> > > > ORIG_RAX: 00000000000000ca
> > > > [22982.117195] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX:
> > > > 00007f943d267169
> > > > [22982.117196] RDX: 0000000000000000 RSI: 0000000000000189 RDI:
> > > > 00005622f89579d0
> > > > [22982.117197] RBP: 00007f9430bffcb0 R08: 0000000000000000 R09:
> > > > 00000000ffffffff
> > > > [22982.117198] R10: 0000000000000000 R11: 0000000000000246 R12:
> > > > 0000000000000000
> > > > [22982.117199] R13: 0000000000000000 R14: 0000000000000000 R15:
> > > > 00005622f89579d0
> > > > [22982.117202]=C2=A0 </TASK>
> > > >=20
> > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
> > > > Intel GPUs")
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: intel-xe@lists.freedesktop.org
> > > > Cc: <stable@vger.kernel.org> # v6.8+
> > > Patch and explaination makes sense to me.
> > >=20
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > I guess for stable this is good since minimal, but after Thomas
> > explaine
> > what he meant with dma_buf_detach_unlocked I think that total sense
> > as a
> > follow-up patch maybe.
> >=20
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> IIRC the last time this issue came up a possible solution discussed
> was=20
> to change dma_buf_detach() so that it should always be called with
> the=20
> reservation lock held.
>=20
> The problem at the time was that this meant changing=20
> dmabuf->ops->detach() to also be called with that lock held and after
> that nobody looked into it any more.
>=20
> Anyway Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for
> this=20
> patch.

Thanks for review. It looks like a dma-buf fix would involve a number
of drivers so pushed this to drm-misc-fixes for now. It looks like both
radeon and amdgpu may potentially suffer from this. Nouveau does detach
in gem_release which looks incorrect if gpu access is going on at that
point.

So will probably need to be properly revisited.

/Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > Cheers, Sima
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c | 1 +
> > > > =C2=A0 1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > index 6396dece0db1..2427be8bc97f 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > @@ -346,6 +346,7 @@ static void ttm_bo_release(struct kref
> > > > *kref)
> > > > =C2=A0=C2=A0		if (!dma_resv_test_signaled(bo->base.resv,
> > > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0
> > > > DMA_RESV_USAGE_BOOKKEEP) ||
> > > > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 (want_init_on_free() && (bo->ttm !=
=3D NULL))
> > > > ||
> > > > +		=C2=A0=C2=A0=C2=A0 bo->type =3D=3D ttm_bo_type_sg ||
> > > > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 !dma_resv_trylock(bo->base.resv)) =
{
> > > > =C2=A0=C2=A0			/* The BO is not idle, resurrect it
> > > > for delayed destroy */
> > > > =C2=A0=C2=A0			ttm_bo_flush_all_fences(bo);
> > > > --=20
> > > > 2.44.0
> > > >=20
>=20

