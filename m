Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB114309CF
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 16:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7942E6E5C8;
	Sun, 17 Oct 2021 14:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109566E5C8;
 Sun, 17 Oct 2021 14:40:28 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id w23so3928805lje.7;
 Sun, 17 Oct 2021 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IjtiCLW8xZnt9LbquoTupATwzGbwRfml+tKpHsuEVLA=;
 b=SOkuW4ts5/C9ZO8cL4SKBTQsCkvcULjUZe36rMCsZaSrvnMJ2LIsPU+bJeN8rO2pSE
 nlR+qXfR2QX68cYxD/eF4DRbdKW/QgfGqQ/efBV5DrBeUsQisGCw48GrqYWmQ6fUy+LE
 nwDJcD/MZHPknkeVcvPhafJMQIAXeAB7Um4x7iC28eF8rE1eo3LxorWtnhSI5MpfRWxI
 j94VLsI4B6A4uFgHG5iHqGp5fHDKvY8MIHDj4QPl4xBoZoH9XN8TlA4jDwB8/KHj8gIc
 0jkDQnZNS9ib9K+IJEZ4Xq+s9dEI5lU6GbLWKJCcTGX6CrDIz/Mi61m92LWXsCz87zq+
 u73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IjtiCLW8xZnt9LbquoTupATwzGbwRfml+tKpHsuEVLA=;
 b=0Q2tuYenY1bA018u9VeCJY6pmL4SK6MseDO7IZU+xqhuAcI2Aev8W9TLqPMiZquo74
 vM2C3ZiUpuKv2d0rKlmFKr0xVbx0aJtFdKR1T5ZNxohCOdD+ZyubZRfgVWc04bX7K81T
 dfYToWUo3065kFZxiTko5nc6Bp1KI7QZ258kPQXxECam2egN2XP8Mh1FwpMaEBG5FI1N
 GawEur5tcjjpFeQwwpoTRMBNUQ6TMf4ISti96/576O8DlcFcASh++5pZ2g3socNFbBzI
 RObpiRsI+3kGh4yVR37BBbSKXaC+fBUs5TSXoZjmSod0rJWAkGSKBCmm5f2iDYzHqcIQ
 zNjQ==
X-Gm-Message-State: AOAM533j2D3rx+SqTRjUkmA0Sw8oJGS/zr6dfo/Wl+8PPy49PVHLJPjn
 oKHqB9YDprd+ihfosCaZxXk=
X-Google-Smtp-Source: ABdhPJwpzvkhUAml7P/8R66Mu6B0TkaXfb34LotGW/6gezAUE4glWKXkA92RErQeqq8A5+q6sccrcw==
X-Received: by 2002:a2e:87d3:: with SMTP id v19mr25013364ljj.374.1634481625884; 
 Sun, 17 Oct 2021 07:40:25 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id bf20sm1013477ljb.137.2021.10.17.07.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 07:40:25 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 lima@lists.freedesktop.org
Cc: daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 16/28] drm/scheduler: use new iterator in
 drm_sched_job_add_implicit_dependencies v2
Date: Sun, 17 Oct 2021 16:40:23 +0200
Message-ID: <2023306.UmlnhvANQh@archbook>
In-Reply-To: <20211005113742.1101-17-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-17-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

On Dienstag, 5. Oktober 2021 13:37:30 CEST Christian K=F6nig wrote:
> Simplifying the code a bit.
>=20
> v2: use dma_resv_for_each_fence
>=20
> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c index 042c16b5d54a..5bc5f775abe1
> 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -699,30 +699,16 @@ int drm_sched_job_add_implicit_dependencies(struct
> drm_sched_job *job, struct drm_gem_object *obj,
>  					    bool write)
>  {
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>  	int ret;
> -	struct dma_fence **fences;
> -	unsigned int i, fence_count;
> -
> -	if (!write) {
> -		struct dma_fence *fence =3D dma_resv_get_excl_unlocked(obj-
>resv);
> -
> -		return drm_sched_job_add_dependency(job, fence);
> -	}
> -
> -	ret =3D dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
> -	if (ret || !fence_count)
> -		return ret;
>=20
> -	for (i =3D 0; i < fence_count; i++) {
> -		ret =3D drm_sched_job_add_dependency(job, fences[i]);
> +	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> +		ret =3D drm_sched_job_add_dependency(job, fence);
>  		if (ret)
> -			break;
> +			return ret;
>  	}
> -
> -	for (; i < fence_count; i++)
> -		dma_fence_put(fences[i]);
> -	kfree(fences);
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);

Hi Christian,

unfortunately, this breaks lima on the rk3328 quite badly. Running glmark2-
es2-drm just locks up the device with the following traces:

[   39.624100] ------------[ cut here ]------------
[   39.624555] refcount_t: addition on 0; use-after-free.
[   39.625058] WARNING: CPU: 0 PID: 123 at lib/refcount.c:25=20
refcount_warn_saturate+0xa4/0x150
[   39.625825] Modules linked in: 8021q garp stp mrp llc crct10dif_ce=20
hantro_vpu(C) fuse ip_tables x_tables ipv6
[   39.626753] CPU: 0 PID: 123 Comm: pp Tainted: G         C        5.15.0-
rc1fratti-00251-g9c2ba265352a #158
[   39.627614] Hardware name: Pine64 Rock64 (DT)
[   39.628004] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   39.628628] pc : refcount_warn_saturate+0xa4/0x150
[   39.629062] lr : refcount_warn_saturate+0xa4/0x150
[   39.629495] sp : ffffffc0124d3d90
[   39.629794] x29: ffffffc0124d3d90 x28: 0000000000000000 x27:=20
0000000000000000
[   39.630441] x26: 0000000000000000 x25: ffffffc0117fe000 x24:=20
ffffff8001ad73f8
[   39.631087] x23: ffffffc0107fc3e0 x22: ffffffc0117fe000 x21:=20
ffffff8010660000
[   39.631731] x20: ffffff8001ad73c0 x19: ffffff807db094c8 x18:=20
ffffffffffffffff
[   39.632377] x17: 0000000000000001 x16: 0000000000000001 x15:=20
0765076507720766
[   39.633022] x14: 072d077207650774 x13: 0765076507720766 x12:=20
072d077207650774
[   39.633668] x11: 0720072007200720 x10: ffffffc011c4b1b0 x9 :=20
ffffffc01010ac54
[   39.634314] x8 : 00000000ffffdfff x7 : ffffffc011cfb1b0 x6 :=20
0000000000000001
[   39.634960] x5 : ffffff807fb4d980 x4 : 0000000000000000 x3 :=20
0000000000000027
[   39.635605] x2 : 0000000000000000 x1 : 0000000000000000 x0 :=20
ffffff8000e1f000
[   39.636250] Call trace:
[   39.636475]  refcount_warn_saturate+0xa4/0x150
[   39.636879]  drm_sched_entity_pop_job+0x414/0x4a0
[   39.637307]  drm_sched_main+0xe4/0x450
[   39.637651]  kthread+0x12c/0x140
[   39.637949]  ret_from_fork+0x10/0x20
[   39.638279] ---[ end trace 47528e09b2512330 ]---
[   39.638783] ------------[ cut here ]------------
[   39.639214] refcount_t: underflow; use-after-free.
[   39.639687] WARNING: CPU: 0 PID: 123 at lib/refcount.c:28=20
refcount_warn_saturate+0xf8/0x150
[   39.640447] Modules linked in: 8021q garp stp mrp llc crct10dif_ce=20
hantro_vpu(C) fuse ip_tables x_tables ipv6
[   39.641373] CPU: 0 PID: 123 Comm: pp Tainted: G        WC        5.15.0-
rc1fratti-00251-g9c2ba265352a #158
[   39.642237] Hardware name: Pine64 Rock64 (DT)
[   39.642632] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   39.643257] pc : refcount_warn_saturate+0xf8/0x150
[   39.643693] lr : refcount_warn_saturate+0xf8/0x150
[   39.644128] sp : ffffffc0124d3d90
[   39.644430] x29: ffffffc0124d3d90 x28: 0000000000000000 x27:=20
0000000000000000
[   39.645077] x26: 0000000000000000 x25: ffffffc0117fe000 x24:=20
ffffff8001ad73f8
[   39.645724] x23: ffffffc0107fc3e0 x22: ffffffc0117fe000 x21:=20
ffffff8010660000
[   39.646372] x20: ffffff8001ad73c0 x19: ffffff807db094c8 x18:=20
ffffffffffffffff
[   39.647020] x17: 0000000000000001 x16: 0000000000000001 x15:=20
072007200720072e
[   39.647666] x14: 0765076507720766 x13: 072007200720072e x12:=20
0765076507720766
[   39.648312] x11: 0720072007200720 x10: ffffffc011c4b1b0 x9 :=20
ffffffc01010ac54
[   39.648957] x8 : 00000000ffffdfff x7 : ffffffc011cfb1b0 x6 :=20
0000000000000001
[   39.649602] x5 : ffffff807fb4d980 x4 : 0000000000000000 x3 :=20
0000000000000027
[   39.650247] x2 : 0000000000000000 x1 : 0000000000000000 x0 :=20
ffffff8000e1f000
[   39.650894] Call trace:
[   39.651119]  refcount_warn_saturate+0xf8/0x150
[   39.651526]  drm_sched_entity_pop_job+0x420/0x4a0
[   39.651953]  drm_sched_main+0xe4/0x450
[   39.652296]  kthread+0x12c/0x140
[   39.652595]  ret_from_fork+0x10/0x20
[   39.652924] ---[ end trace 47528e09b2512331 ]---
[   39.717053] ------------[ cut here ]------------
[   39.717543] refcount_t: saturated; leaking memory.
[   39.718030] WARNING: CPU: 1 PID: 375 at lib/refcount.c:22=20
refcount_warn_saturate+0x78/0x150
[   39.718800] Modules linked in: 8021q garp stp mrp llc crct10dif_ce=20
hantro_vpu(C) fuse ip_tables x_tables ipv6
[   39.719744] CPU: 1 PID: 375 Comm: glmark2-es2-drm Tainted: G        WC  =
     =20
5.15.0-rc1fratti-00251-g9c2ba265352a #158
[   39.720712] Hardware name: Pine64 Rock64 (DT)
[   39.721109] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   39.721739] pc : refcount_warn_saturate+0x78/0x150
[   39.722178] lr : refcount_warn_saturate+0x78/0x150
[   39.722617] sp : ffffffc012913a90
[   39.722921] x29: ffffffc012913a90 x28: ffffff8010630000 x27:=20
ffffff8005219e00
[   39.723576] x26: ffffff80103da500 x25: 0000000000000000 x24:=20
ffffff8000cb24c0
[   39.724230] x23: ffffff800ac045b0 x22: ffffff8005212100 x21:=20
0000000000000000
[   39.724884] x20: ffffff8000cb24c0 x19: 0000000000000000 x18:=20
ffffffffffffffff
[   39.725538] x17: 0000000000000000 x16: 0000000000000000 x15:=20
072007200720072e
[   39.726192] x14: 07790772076f076d x13: 072007200720072e x12:=20
07790772076f076d
[   39.726846] x11: 0720072007200720 x10: ffffffc011c4b1b0 x9 :=20
ffffffc01010ac54
[   39.727501] x8 : 00000000ffffdfff x7 : ffffffc011cfb1b0 x6 :=20
0000000000000001
[   39.728155] x5 : ffffff807fb68980 x4 : 0000000000000000 x3 :=20
0000000000000027
[   39.728808] x2 : 0000000000000000 x1 : 0000000000000000 x0 :=20
ffffff8004d7b800
[   39.729464] Call trace:
[   39.729691]  refcount_warn_saturate+0x78/0x150
[   39.730101]  dma_resv_add_shared_fence+0x1ac/0x1cc
[   39.730543]  lima_gem_submit+0x300/0x580
[   39.730909]  lima_ioctl_gem_submit+0x284/0x340
[   39.731318]  drm_ioctl_kernel+0xd0/0x180
[   39.731685]  drm_ioctl+0x220/0x450
[   39.732005]  __arm64_sys_ioctl+0x568/0xe9c
[   39.732386]  invoke_syscall.constprop.0+0x58/0xf0
[   39.732824]  do_el0_svc+0x138/0x170
[   39.733152]  el0_svc+0x28/0xc0
[   39.733441]  el0t_64_sync_handler+0xa8/0x130
[   39.733837]  el0t_64_sync+0x1a0/0x1a4
[   39.734178] ---[ end trace 47528e09b2512332 ]---
[   39.734926] Unable to handle kernel write to read-only memory at virtual=
=20
address ffffffc0107fbc70
[   39.735763] Mem abort info:
[   39.736029]   ESR =3D 0x9600004e
[   39.736313]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   39.736796]   SET =3D 0, FnV =3D 0
[   39.737080]   EA =3D 0, S1PTW =3D 0
[   39.737368]   FSC =3D 0x0e: level 2 permission fault
[   39.737804] Data abort info:
[   39.738068]   ISV =3D 0, ISS =3D 0x0000004e
[   39.738419]   CM =3D 0, WnR =3D 1
[   39.738693] swapper pgtable: 4k pages, 39-bit VAs, pgdp=3D00000000038930=
00
[   39.739297] [ffffffc0107fbc70] pgd=3D100000007ffff003, p4d=3D100000007ff=
ff003,=20
pud=3D100000007ffff003, pmd=3D0040000002800781
[   39.740270] Internal error: Oops: 9600004e [#1] SMP
[   39.740719] Modules linked in: 8021q garp stp mrp llc crct10dif_ce=20
hantro_vpu(C) fuse ip_tables x_tables ipv6
[   39.741665] CPU: 0 PID: 123 Comm: pp Tainted: G        WC        5.15.0-
rc1fratti-00251-g9c2ba265352a #158
[   39.742537] Hardware name: Pine64 Rock64 (DT)
[   39.742934] pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   39.743570] pc : dma_fence_add_callback+0xb0/0xf0
[   39.744017] lr : dma_fence_add_callback+0x5c/0xf0
[   39.744457] sp : ffffffc0124d3d60
[   39.744764] x29: ffffffc0124d3d60 x28: 0000000000000000 x27:=20
0000000000000000
[   39.745423] x26: 0000000000000000 x25: ffffffc0117fe000 x24:=20
ffffff800536b6e0
[   39.746080] x23: 0000000000000000 x22: 0000000000000000 x21:=20
ffffffc0107fc3e0
[   39.746736] x20: ffffff807db09528 x19: ffffff8000cb24c0 x18:=20
0000000000000001
[   39.747390] x17: 000000040044ffff x16: 000000000000000c x15:=20
000000000000000d
[   39.748044] x14: 0000000000000000 x13: 000000000000072b x12:=20
071c71c71c71c71c
[   39.748697] x11: 000000000000072b x10: 0000000000000002 x9 :=20
ffffffc01087d5ac
[   39.749350] x8 : 0000000000000238 x7 : 0000000000000000 x6 :=20
0000000000000000
[   39.750002] x5 : 0000000000000000 x4 : 0000000000000000 x3 :=20
ffffff8000cb24f0
[   39.750654] x2 : 0000000000000000 x1 : ffffffc0107fbc70 x0 :=20
ffffff8000cb24d0
[   39.751309] Call trace:
[   39.751539]  dma_fence_add_callback+0xb0/0xf0
[   39.751944]  drm_sched_entity_pop_job+0xac/0x4a0
[   39.752371]  drm_sched_main+0xe4/0x450
[   39.752720]  kthread+0x12c/0x140
[   39.753024]  ret_from_fork+0x10/0x20
[   39.753367] Code: 91004260 f9400e61 f9000e74 a9000680 (f9000034)
[   39.753920] ---[ end trace 47528e09b2512333 ]---
[   40.253374] [drm:lima_sched_timedout_job] *ERROR* lima job timeout

I've bisected the problem to this commit, and confirmed that reverting it g=
ets=20
glmark2's 3d horse back to spinning.

It's possible this patch just uncovers a bug in lima, so I've added the lim=
a=20
list as a recipient to this reply as well.

Since I doubt AMD has many Rockchip SoCs laying about, I'll gladly test any=
=20
prospective fixes for this.

Regards,
Nicolas Frattaroli


