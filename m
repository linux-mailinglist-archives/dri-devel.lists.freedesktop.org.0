Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761D89D495
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 10:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF4C112BB1;
	Tue,  9 Apr 2024 08:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Tue, 09 Apr 2024 08:36:54 UTC
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 581A8112BAE;
 Tue,  9 Apr 2024 08:36:54 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id D12B2E74071; Tue,  9 Apr 2024 10:27:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.1
Received: from [192.168.178.22] (a89-183-193-114.net-htp.de [89.183.193.114])
 by lynxeye.de (Postfix) with ESMTPSA id 45C4DE74067;
 Tue,  9 Apr 2024 10:27:55 +0200 (CEST)
Message-ID: <fcfb16a3a4bc53d4ac1724ab5649ee792977260f.camel@lynxeye.de>
Subject: Re: [PATCH] nouveau: fix instmem race condition around ptr stores
From: Lucas Stach <dev@lynxeye.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Date: Tue, 09 Apr 2024 10:27:54 +0200
In-Reply-To: <20240409003401.2224446-1-airlied@gmail.com>
References: <20240409003401.2224446-1-airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
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

Am Dienstag, dem 09.04.2024 um 10:34 +1000 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> Running a lot of VK CTS in parallel against nouveau, once every
> few hours you might see something like this crash.
>=20
> BUG: kernel NULL pointer dereference, address: 0000000000000008
> PGD 8000000114e6e067 P4D 8000000114e6e067 PUD 109046067 PMD 0
> Oops: 0000 [#1] PREEMPT SMP PTI
> CPU: 7 PID: 53891 Comm: deqp-vk Not tainted 6.8.0-rc6+ #27
> Hardware name: Gigabyte Technology Co., Ltd. Z390 I AORUS PRO WIFI/Z390 I=
 AORUS PRO WIFI-CF, BIOS F8 11/05/2021
> RIP: 0010:gp100_vmm_pgt_mem+0xe3/0x180 [nouveau]
> Code: c7 48 01 c8 49 89 45 58 85 d2 0f 84 95 00 00 00 41 0f b7 46 12 49 8=
b 7e 08 89 da 42 8d 2c f8 48 8b 47 08 41 83 c7 01 48 89 ee <48> 8b 40 08 ff=
 d0 0f 1f 00 49 8b 7e 08 48 89 d9 48 8d 75 04 48 c1
> RSP: 0000:ffffac20c5857838 EFLAGS: 00010202
> RAX: 0000000000000000 RBX: 00000000004d8001 RCX: 0000000000000001
> RDX: 00000000004d8001 RSI: 00000000000006d8 RDI: ffffa07afe332180
> RBP: 00000000000006d8 R08: ffffac20c5857ad0 R09: 0000000000ffff10
> R10: 0000000000000001 R11: ffffa07af27e2de0 R12: 000000000000001c
> R13: ffffac20c5857ad0 R14: ffffa07a96fe9040 R15: 000000000000001c
> FS:  00007fe395eed7c0(0000) GS:ffffa07e2c980000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000008 CR3: 000000011febe001 CR4: 00000000003706f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>=20
> ...
>=20
>  ? gp100_vmm_pgt_mem+0xe3/0x180 [nouveau]
>  ? gp100_vmm_pgt_mem+0x37/0x180 [nouveau]
>  nvkm_vmm_iter+0x351/0xa20 [nouveau]
>  ? __pfx_nvkm_vmm_ref_ptes+0x10/0x10 [nouveau]
>  ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
>  ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
>  ? __lock_acquire+0x3ed/0x2170
>  ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
>  nvkm_vmm_ptes_get_map+0xc2/0x100 [nouveau]
>  ? __pfx_nvkm_vmm_ref_ptes+0x10/0x10 [nouveau]
>  ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
>  nvkm_vmm_map_locked+0x224/0x3a0 [nouveau]
>=20
> Adding any sort of useful debug usually makes it go away, so I hand
> wrote the function in a line, and debugged the asm.
>=20
> Every so often pt->memory->ptrs is NULL. This ptrs ptr is set in
> the nv50_instobj_acquire called from nvkm_kmap.
>=20
> If Thread A and Thread B both get to nv50_instobj_acquire around
> the same time, and Thread A hits the refcount_set line, and in
> lockstep thread B succeeds at refcount_inc_not_zero, there is a
> chance the ptrs value won't have been stored since refcount_set
> is unordered. Force a memory barrier here, I picked smp_mb, since
> we want it on all CPUs and it's write followed by a read.
>=20
> Cc: linux-stable
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers=
/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> index a7f3fc342d87..cbacc7b11f8c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
> @@ -250,6 +250,9 @@ nv50_instobj_acquire(struct nvkm_memory *memory)
>  			iobj->base.memory.ptrs =3D &nv50_instobj_fast;
>  		else
>  			iobj->base.memory.ptrs =3D &nv50_instobj_slow;
> +		/* barrier to ensure ptrs is written before another thread
> +		   does refcount_inc_not_zero successfully. */
> +		smp_mb();

Doesn't this miss the corresponding smp_rmb after
refcount_inc_not_zero? Without it a sufficiently speculating CPU might
still hoist the NULL ptr load across the refcount increase.

Regards,
Lucas
