Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DC36BB8C2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 16:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EBF10E8C6;
	Wed, 15 Mar 2023 15:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7D110E8C6;
 Wed, 15 Mar 2023 15:57:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3817B81DC4;
 Wed, 15 Mar 2023 15:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E660C433EF;
 Wed, 15 Mar 2023 15:57:14 +0000 (UTC)
Date: Wed, 15 Mar 2023 11:57:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
Message-ID: <20230315115712.56b3c21f@gandalf.local.home>
In-Reply-To: <07597f3e-0b35-c22b-91ec-fa3875d6fe22@gmail.com>
References: <20230307212223.7e49384a@gandalf.local.home>
 <20230307212615.7a099103@gandalf.local.home>
 <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com>
 <20230315110949.1e11b3aa@gandalf.local.home>
 <07597f3e-0b35-c22b-91ec-fa3875d6fe22@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Mar 2023 16:25:11 +0100
Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:
> >>
> >> Thanks for the notice, =20
> > I'm still getting this on Linus's latest tree. =20
>=20
> This must be some reference counting issue which only happens in your=20
> particular use case. We have tested this quite extensively and couldn't=20
> reproduce it so far.

Have you tried 32 bit with my config. I also sent a link to your previous
email that gives access to the VM image I'm using that is triggering this
issue.

Here it is again:

  The libvirt xml file is here: https://rostedt.org/vm-images/tracetest-32.=
xml
  and the VM image itself is here: https://rostedt.org/vm-images/tracetest-=
32.qcow2.bz2

>=20
> Can you apply this code snippet here and see if you get any warning in=20
> the system logs?
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 459f1b4440da..efc390bfd69c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -314,6 +314,7 @@ static void ttm_bo_delayed_delete(struct work_struct=
=20
> *work)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_lock(bo->base.resv, =
NULL);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_cleanup_memtype_use(bo=
);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_unlock(bo->base.resv=
);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->delayed_delete.func =3D NULL;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_put(bo);
>  =C2=A0}
>=20
> @@ -327,6 +328,8 @@ static void ttm_bo_release(struct kref *kref)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(bo->pin_count);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(bo->bulk_move);
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(bo->delayed_delete.func !=
=3D NULL);
> +
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!bo->deleted) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_individualize_resv(bo);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (ret) {
>=20

The WARN_ON triggered:

[   21.481449] mpls_gso: MPLS GSO support
[   21.488795] IPI shorthand broadcast: enabled
[   21.488873] ------------[ cut here ]------------
[   21.490101] ------------[ cut here ]------------

[   21.491693] WARNING: CPU: 1 PID: 38 at drivers/gpu/drm/ttm/ttm_bo.c:332 =
ttm_bo_release+0x2ac/0x2fc  <<<---- Line of the added WARN_ON()

[   21.492940] refcount_t: underflow; use-after-free.
[   21.492965] WARNING: CPU: 0 PID: 84 at lib/refcount.c:28 refcount_warn_s=
aturate+0xb6/0xfc
[   21.496116] Modules linked in:
[   21.497197] Modules linked in:
[   21.500105] CPU: 1 PID: 38 Comm: kworker/1:1 Not tainted 6.3.0-rc2-test-=
00047-g6015b1aca1a2-dirty #993
[   21.500789] CPU: 0 PID: 84 Comm: kworker/0:1H Not tainted 6.3.0-rc2-test=
-00047-g6015b1aca1a2-dirty #993
[   21.501882] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.1=
6.0-debian-1.16.0-5 04/01/2014
[   21.503533] sched_clock: Marking stable (20788024762, 714243692)->(22140=
778105, -638509651)
[   21.504080] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.1=
6.0-debian-1.16.0-5 04/01/2014
[   21.504089] Workqueue: ttm ttm_bo_delayed_delete
[   21.507196] Workqueue: events drm_fb_helper_damage_work
[   21.509235]=20
[   21.510291] registered taskstats version 1
[   21.510302] Running ring buffer tests...
[   21.511792]=20
[   21.513870] EIP: refcount_warn_saturate+0xb6/0xfc
[   21.515261] EIP: ttm_bo_release+0x2ac/0x2fc
[   21.516566] Code: 68 00 27 0c d8 e8 36 3b aa ff 0f 0b 58 c9 c3 90 80 3d =
41 c2 37 d8 00 75 8a c6 05 41 c2 37 d8 01 68 2c 27 0c d8 e8 16 3b aa ff <0f=
> 0b 59 c9 c3 80 3d 3f c2 37 d8 00 0f 85 67 ff ff ff c6 05 3f c2
[   21.516998] Code: ff 8d b4 26 00 00 00 00 66 90 0f 0b 8b 43 10 85 c0 0f =
84 a1 fd ff ff 8d 76 00 0f 0b 8b 43 28 85 c0 0f 84 9c fd ff ff 8d 76 00 <0f=
> 0b e9 92 fd ff ff 8d b4 26 00 00 00 00 66 90 c7 43 18 00 00 00
[   21.517905] EAX: 00000026 EBX: c129d150 ECX: 00000040 EDX: 00000002
[   21.518987] EAX: d78c8550 EBX: c129d134 ECX: c129d134 EDX: 00000001
[   21.519337] ESI: c129d0bc EDI: f6f91200 EBP: c2b8bf18 ESP: c2b8bf14
[   21.520617] ESI: c129d000 EDI: c126a7a0 EBP: c1839c24 ESP: c1839bec
[   21.521546] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
[   21.526154] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
[   21.526162] CR0: 80050033 CR2: 00000000 CR3: 18506000 CR4: 00150ef0
[   21.526166] Call Trace:
[   21.526189]  ? ww_mutex_unlock+0x3a/0x94
[   21.530300] CR0: 80050033 CR2: ff9ff000 CR3: 18506000 CR4: 00150ef0
[   21.531722]  ? ttm_bo_cleanup_refs+0xc4/0x1e0
[   21.533114] Call Trace:
[   21.534516]  ttm_mem_evict_first+0x3d3/0x568
[   21.535901]  ttm_bo_delayed_delete+0x9c/0xa4
[   21.537391]  ? kfree+0x6b/0xdc
[   21.538901]  process_one_work+0x21a/0x484
[   21.540279]  ? ttm_range_man_alloc+0xe0/0xec
[   21.540854]  worker_thread+0x14a/0x39c
[   21.541714]  ? ttm_range_man_fini_nocheck+0xe8/0xe8
[   21.543332]  kthread+0xea/0x10c
[   21.544301]  ttm_bo_mem_space+0x1d0/0x1e4
[   21.544942]  ? process_one_work+0x484/0x484
[   21.545887]  ttm_bo_validate+0xc5/0x19c
[   21.546986]  ? kthread_complete_and_exit+0x1c/0x1c
[   21.547680]  ttm_bo_init_reserved+0x15e/0x1fc
[   21.548716]  ret_from_fork+0x1c/0x28
[   21.549650]  qxl_bo_create+0x145/0x20c

Note, this is all on boot up before user space is running.

-- Steve
