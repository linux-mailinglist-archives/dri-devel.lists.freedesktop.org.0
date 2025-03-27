Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36FDA72832
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 02:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D4910E239;
	Thu, 27 Mar 2025 01:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aEPrfHMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443CE10E239;
 Thu, 27 Mar 2025 01:40:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B6A2EA41A06;
 Thu, 27 Mar 2025 01:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C08C4AF09;
 Thu, 27 Mar 2025 01:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743039645;
 bh=q9uSLW6OCpSsPCyoD0AILZCu85cwI51PD3Gq6LoRAT0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aEPrfHMORhAHHDx5pYmS871dRas33ypLiyzQCXvE63AWrx4QBynPgN0ud5Nd0CP6s
 10zJJOoz8c3UJVxFVd3vgFiGbVesoM3pkauNb9R6yUgoa8iCjKnXY4VBaM8RCLS4c/
 tCEJTzfjcVl8AIdzBni2XueM08HAWsPaIHsNzNchQ5j6s6PEIyNVwi4HkUfdvzL8Xv
 ddjiqmJJvAZqH3Wp5YxjNorEz5ynR8xX8y3Otw3qd4MJ28AF0NMnK9KYfQLrDcyQUK
 d+5tmfFe118422WHAX/UsQRGXOlwCCtQbg2RLH335ceeHQb89gI25Z8jir19fa8MkV
 Oi/owNAba4QIw==
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5eb5ecf3217so833451a12.3; 
 Wed, 26 Mar 2025 18:40:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV8eYwjIER9zIJOD8xF8X5D9wJGNAgqcR+YAG/cqGpZQJqkELasx4T7JDezfEwFcO0rC6Xg7ZUGgiqJ@lists.freedesktop.org,
 AJvYcCVAQlZUCjL7pR8Op4KNADzR3SqwWW58/exlscoB/fx1Y6yMdR6rcOXAl8O3i8+pjA8Jg+6yUiK4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYFU7e295+I1rDyzv3esD7pRkgPRxSgNPNqSVQ5oXM7Op7uZlT
 vWwMWTVzzewai8nT6xrvPXLrKnlQGpnmTY36yI8MjkqVCQHRgxju8JCNeDbI8Go8CR58sgkXcLj
 YD0WViERgs7KEx+mDooETtKNBU2k=
X-Google-Smtp-Source: AGHT+IGyGR323EJ4PHG17MLy4bhFlc+US9w9WGllywr1R9Q1ZE2kzBsmroFUWp6pyWFeFV9n6ge64EJB5n4l/44CJXI=
X-Received: by 2002:a17:907:6e90:b0:ac2:b1e2:4b85 with SMTP id
 a640c23a62f3a-ac6fae493e7mr121070166b.3.1743039643595; Wed, 26 Mar 2025
 18:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250318111717.2161235-1-chenhuacai@loongson.cn>
 <b8c481f2-a280-4f86-8080-2c6dcffc4629@amd.com>
 <CAAhV-H7cch+koOSJAFe70c8Pk02snK7M=andyfwbCgiNdg4aVg@mail.gmail.com>
 <87d0601b-c1cb-402b-aecd-23a5d371da66@amd.com>
 <712b77ef-c7f7-47a4-9609-47b179f15662@amd.com>
In-Reply-To: <712b77ef-c7f7-47a4-9609-47b179f15662@amd.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Mar 2025 09:40:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6AMm1X4zyhj7-jqiaCpd-Yfco88d4KODd5_jUfhyi8Cg@mail.gmail.com>
X-Gm-Features: AQ5f1JqBNP2vWKy0ebphl5jK8Ow-iq2DOK-KtfaSYlTnWhMF0YAkpCHzkisR-pg
Message-ID: <CAAhV-H6AMm1X4zyhj7-jqiaCpd-Yfco88d4KODd5_jUfhyi8Cg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Protect
 dml2_create()/dml2_copy()/dml2_create_copy()
To: Alex Hung <alex.hung@amd.com>, aurabindo.pillai@amd.com
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 stable@vger.kernel.org, Austin.Zheng@amd.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Alex,

On Thu, Mar 27, 2025 at 8:10=E2=80=AFAM Alex Hung <alex.hung@amd.com> wrote=
:
>
> The following error messages showed up on an APU and a dGPU during testin=
g.
>
> <3> [100.231411] BUG: sleeping function called from invalid context at
> include/linux/sched/mm.h:321
> <3> [100.231414] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid:
> 1711, name: kms_color
> <3> [100.231416] preempt_count: 2, expected: 0
> <3> [100.231417] RCU nest depth: 0, expected: 0
> <3> [100.231418] Preemption disabled at:
> <3> [100.231419] [<ffffffffc0c2843b>] dc_fpu_begin+0x2b/0xc0 [amdgpu]
> <4> [100.231626] CPU: 4 UID: 0 PID: 1711 Comm: kms_color Tainted: G
>    W          6.12.0+ #1
> <4> [100.231629] Tainted: [W]=3DWARN
> <4> [100.231631] Call Trace:
> <4> [100.231632]  <TASK>
> <4> [100.231633]  dump_stack_lvl+0x5b/0x70
> <4> [100.231638]  dump_stack+0x10/0x20
> <4> [100.231639]  __might_resched+0x170/0x1d0
> <4> [100.231643]  __might_sleep+0x44/0x70
> <4> [100.231645]  __alloc_pages_noprof+0x22f/0x370
> <4> [100.231649]  ___kmalloc_large_node+0x95/0x150
> <4> [100.231651]  ? preempt_count_add+0x4e/0xc0
> <4> [100.231653]  __kmalloc_large_noprof+0x1d/0xb0
> <4> [100.231655]  dml2_create_copy+0x27/0x60 [amdgpu]
> <4> [100.231827]  dc_state_create_copy+0x7e/0x170 [amdgpu]
> <4> [100.231995]  update_planes_and_stream_state+0x23c/0x600 [amdgpu]
> <4> [100.232189]  update_planes_and_stream_v2+0x22b/0x530 [amdgpu]
> <4> [100.232366]  ? amdgpu_dm_atomic_commit_tail+0x1310/0x4100 [amdgpu]
> <4> [100.232569]  ? commit_tail+0x96/0x140 [drm_kms_helper]
> <4> [100.232577]  dc_update_planes_and_stream+0x5b/0xe0 [amdgpu]
> <4> [100.232730]  amdgpu_dm_atomic_commit_tail+0x1fa7/0x4100 [amdgpu]
> <4> [100.232908]  ? stack_depot_save_flags+0x2c/0x730
> <4> [100.232915]  ? wait_for_completion_timeout+0x1d/0x30
> <4> [100.232917]  commit_tail+0x96/0x140 [drm_kms_helper]
> <4> [100.232923]  drm_atomic_helper_commit+0x12b/0x150 [drm_kms_helper]
> <4> [100.232927]  drm_atomic_commit+0xad/0xe0 [drm]
> <4> [100.232939]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> <4> [100.232956]  drm_atomic_helper_set_config+0x80/0xc0 [drm_kms_helper]
> <4> [100.232961]  drm_mode_setcrtc+0x22e/0x910 [drm]
> <4> [100.232975]  ? kfree+0x18f/0x350
> <4> [100.232977]  ? __pfx_drm_mode_setcrtc+0x10/0x10 [drm]
> <4> [100.232987]  drm_ioctl_kernel+0xa7/0x100 [drm]
> <4> [100.233004]  drm_ioctl+0x29d/0x500 [drm]
> <4> [100.233015]  ? __pfx_drm_mode_setcrtc+0x10/0x10 [drm]
> <4> [100.233026]  ? _raw_spin_unlock_irqrestore+0x1f/0x40
> <4> [100.233029]  amdgpu_drm_ioctl+0x4b/0x80 [amdgpu]
> <4> [100.233131]  __x64_sys_ioctl+0x92/0xd0
> <4> [100.233133]  x64_sys_call+0x1205/0x20d0
> <4> [100.233136]  do_syscall_64+0x50/0x110
> <4> [100.233138]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> <4> [100.233142] RIP: 0033:0x7fb21e71a94f
> <4> [100.233144] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24
> 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00
> 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
> <4> [100.233145] RSP: 002b:00007ffdd9a52e50 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> <4> [100.233148] RAX: ffffffffffffffda RBX: 00007ffdd9a52ee0 RCX:
> 00007fb21e71a94f
> <4> [100.233149] RDX: 00007ffdd9a52ee0 RSI: 00000000c06864a2 RDI:
> 0000000000000005
> <4> [100.233149] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
> 00005609537f7b08
> <4> [100.233150] R10: 0000000000000000 R11: 0000000000000246 R12:
> 0000000000000000
> <4> [100.233151] R13: 0000000000000005 R14: 0000000000000000 R15:
> 00005609537e2848
> <4> [100.233152]  </TASK>
This seems caused by dml2_allocate_memory(), to fix this we can only
protect FPU in DML2, I can do it in the new version, but I want to
listen Aurabindo's opinion.


Huacai

>
> On 3/25/25 18:02, Alex Hung wrote:
> >
> >
> > On 3/19/25 22:23, Huacai Chen wrote:
> >> Hi, Alex,
> >>
> >> On Thu, Mar 20, 2025 at 10:16=E2=80=AFAM Alex Hung <alex.hung@amd.com>=
 wrote:
> >>>
> >>>
> >>>
> >>> On 3/18/25 05:17, Huacai Chen wrote:
> >>>> Commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP conte=
xt
> >>>> start") removes the FP context protection of dml2_create(), and it s=
aid
> >>>> "All the DC_FP_START/END should be used before call anything from
> >>>> DML2".
> >>>>
> >>>> However, dml2_create()/dml2_copy()/dml2_create_copy() are not protec=
ted
> >>>> from their callers, causing such errors:
> >>>>
> >>>>    do_fpu invoked from kernel context![#1]:
> >>>>    CPU: 0 UID: 0 PID: 239 Comm: kworker/0:5 Not tainted 6.14.0-rc6+ =
#1
> >>>>    Workqueue: events work_for_cpu_fn
> >>>>    pc ffff80000319de80 ra ffff80000319de5c tp 900000010575c000 sp
> >>>> 900000010575f840
> >>>>    a0 0000000000000000 a1 900000012f210130 a2 900000012f000000 a3
> >>>> ffff80000357e268
> >>>>    a4 ffff80000357e260 a5 900000012ea52cf0 a6 0000000400000004 a7
> >>>> 0000012c00001388
> >>>>    t0 00001900000015e0 t1 ffff80000379d000 t2 0000000010624dd3 t3
> >>>> 0000006400000014
> >>>>    t4 00000000000003e8 t5 0000005000000018 t6 0000000000000020 t7
> >>>> 0000000f00000064
> >>>>    t8 000000000000002f u0 5f5e9200f8901912 s9 900000012d380010 s0
> >>>> 900000012ea51fd8
> >>>>    s1 900000012f000000 s2 9000000109296000 s3 0000000000000001 s4
> >>>> 0000000000001fd8
> >>>>    s5 0000000000000001 s6 ffff800003415000 s7 900000012d390000 s8
> >>>> ffff800003211f80
> >>>>       ra: ffff80000319de5c dml21_apply_soc_bb_overrides+0x3c/0x960
> >>>> [amdgpu]
> >>>>      ERA: ffff80000319de80 dml21_apply_soc_bb_overrides+0x60/0x960
> >>>> [amdgpu]
> >>>>     CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
> >>>>     PRMD: 00000004 (PPLV0 +PIE -PWE)
> >>>>     EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
> >>>>     ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> >>>>    ESTAT: 000f0000 [FPD] (IS=3D ECode=3D15 EsubCode=3D0)
> >>>>     PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
> >>>>    Process kworker/0:5 (pid: 239, threadinfo=3D00000000927eadc6,
> >>>> task=3D000000008fd31682)
> >>>>    Stack : 00040dc000003164 0000000000000001 900000012f210130
> >>>> 900000012eabeeb8
> >>>>            900000012f000000 ffff80000319fe48 900000012f210000
> >>>> 900000012f210130
> >>>>            900000012f000000 900000012eabeeb8 0000000000000001
> >>>> ffff8000031a0064
> >>>>            900000010575f9f0 900000012f210130 900000012eac0000
> >>>> 900000012ea80000
> >>>>            900000012f000000 ffff8000031cefc4 900000010575f9f0
> >>>> ffff8000035859c0
> >>>>            ffff800003414000 900000010575fa78 900000012f000000
> >>>> ffff8000031b4c50
> >>>>            0000000000000000 9000000101c9d700 9000000109c40000
> >>>> 5f5e9200f8901912
> >>>>            900000012d3c4bd0 900000012d3c5000 ffff8000034aed18
> >>>> 900000012d380010
> >>>>            900000012d3c4bd0 ffff800003414000 900000012d380000
> >>>> ffff800002ea49dc
> >>>>            0000000000000001 900000012d3c6000 00000000ffffe423
> >>>> 0000000000010000
> >>>>            ...
> >>>>    Call Trace:
> >>>>    [<ffff80000319de80>] dml21_apply_soc_bb_overrides+0x60/0x960
> >>>> [amdgpu]
> >>>>    [<ffff80000319fe44>] dml21_init+0xa4/0x280 [amdgpu]
> >>>>    [<ffff8000031a0060>] dml21_create+0x40/0x80 [amdgpu]
> >>>>    [<ffff8000031cefc0>] dc_state_create+0x100/0x160 [amdgpu]
> >>>>    [<ffff8000031b4c4c>] dc_create+0x44c/0x640 [amdgpu]
> >>>>    [<ffff800002ea49d8>] amdgpu_dm_init+0x3f8/0x2060 [amdgpu]
> >>>>    [<ffff800002ea6658>] dm_hw_init+0x18/0x60 [amdgpu]
> >>>>    [<ffff800002b16738>] amdgpu_device_init+0x1938/0x27e0 [amdgpu]
> >>>>    [<ffff800002b18e80>] amdgpu_driver_load_kms+0x20/0xa0 [amdgpu]
> >>>>    [<ffff800002b0c8f0>] amdgpu_pci_probe+0x1b0/0x580 [amdgpu]
> >>>>    [<900000000448eae4>] local_pci_probe+0x44/0xc0
> >>>>    [<9000000003b02b18>] work_for_cpu_fn+0x18/0x40
> >>>>    [<9000000003b05da0>] process_one_work+0x160/0x300
> >>>>    [<9000000003b06718>] worker_thread+0x318/0x440
> >>>>    [<9000000003b11b8c>] kthread+0x12c/0x220
> >>>>    [<9000000003ac1484>] ret_from_kernel_thread+0x8/0xa4
> >>>>
> >>>> So protect dml2_create()/dml2_copy()/dml2_create_copy() with
> >>>> DC_FP_START
> >>>> and DC_FP_END.
> >>>
> >>> Hi Huacai,
> >>>
> >>> Can you try to put DC_FP_START DC_FP_END in the
> >>> dml2_create()/dml2_copy()/dml2_create_copy()/dml2_validate() instead?
> >>> The code will be cleaner and less error-prone to future changes.
> >> At first I want to add them in
> >> dml2_create()/dml2_copy()/dml2_create_copy()/dml2_validate(), but
> >> commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP context
> >> start")  said
> >> that "All the DC_FP_START/END should be used before call anything from
> >> DML2".
> >>
> >> Huacai
> >
> > Thanks. I sent them to testing, and will share results later.
> >
> >>
> >>>
> >>> Thanks.
> >>>
> >>>
> >>>>
> >>>> Cc: stable@vger.kernel.org
> >>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >>>> ---
> >>>>    drivers/gpu/drm/amd/display/dc/core/dc_state.c | 16 +++++++++++++=
+++
> >>>>    1 file changed, 16 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/
> >>>> drivers/gpu/drm/amd/display/dc/core/dc_state.c
> >>>> index 1b2cce127981..6e2cac08002d 100644
> >>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
> >>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
> >>>> @@ -210,17 +210,23 @@ struct dc_state *dc_state_create(struct dc
> >>>> *dc, struct dc_state_create_params *p
> >>>>
> >>>>    #ifdef CONFIG_DRM_AMD_DC_FP
> >>>>        if (dc->debug.using_dml2) {
> >>>> +             DC_FP_START();
> >>>> +
> >>>>                dml2_opt->use_clock_dc_limits =3D false;
> >>>>                if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2)) =
{
> >>>> +                     DC_FP_END();
> >>>>                        dc_state_release(state);
> >>>>                        return NULL;
> >>>>                }
> >>>>
> >>>>                dml2_opt->use_clock_dc_limits =3D true;
> >>>>                if (!dml2_create(dc, dml2_opt, &state-
> >>>> >bw_ctx.dml2_dc_power_source)) {
> >>>> +                     DC_FP_END();
> >>>>                        dc_state_release(state);
> >>>>                        return NULL;
> >>>>                }
> >>>> +
> >>>> +             DC_FP_END();
> >>>>        }
> >>>>    #endif
> >>>>
> >>>> @@ -240,6 +246,8 @@ void dc_state_copy(struct dc_state *dst_state,
> >>>> struct dc_state *src_state)
> >>>>        dc_state_copy_internal(dst_state, src_state);
> >>>>
> >>>>    #ifdef CONFIG_DRM_AMD_DC_FP
> >>>> +     DC_FP_START();
> >>>> +
> >>>>        dst_state->bw_ctx.dml2 =3D dst_dml2;
> >>>>        if (src_state->bw_ctx.dml2)
> >>>>                dml2_copy(dst_state->bw_ctx.dml2, src_state-
> >>>> >bw_ctx.dml2);
> >>>> @@ -247,6 +255,8 @@ void dc_state_copy(struct dc_state *dst_state,
> >>>> struct dc_state *src_state)
> >>>>        dst_state->bw_ctx.dml2_dc_power_source =3D
> >>>> dst_dml2_dc_power_source;
> >>>>        if (src_state->bw_ctx.dml2_dc_power_source)
> >>>>                dml2_copy(dst_state->bw_ctx.dml2_dc_power_source,
> >>>> src_state->bw_ctx.dml2_dc_power_source);
> >>>> +
> >>>> +     DC_FP_END();
> >>>>    #endif
> >>>>
> >>>>        /* context refcount should not be overridden */
> >>>> @@ -268,17 +278,23 @@ struct dc_state *dc_state_create_copy(struct
> >>>> dc_state *src_state)
> >>>>        new_state->bw_ctx.dml2 =3D NULL;
> >>>>        new_state->bw_ctx.dml2_dc_power_source =3D NULL;
> >>>>
> >>>> +     DC_FP_START();
> >>>> +
> >>>>        if (src_state->bw_ctx.dml2 &&
> >>>>                        !dml2_create_copy(&new_state->bw_ctx.dml2,
> >>>> src_state->bw_ctx.dml2)) {
> >>>> +             DC_FP_END();
> >>>>                dc_state_release(new_state);
> >>>>                return NULL;
> >>>>        }
> >>>>
> >>>>        if (src_state->bw_ctx.dml2_dc_power_source &&
> >>>>                        !dml2_create_copy(&new_state-
> >>>> >bw_ctx.dml2_dc_power_source, src_state-
> >>>> >bw_ctx.dml2_dc_power_source)) {
> >>>> +             DC_FP_END();
> >>>>                dc_state_release(new_state);
> >>>>                return NULL;
> >>>>        }
> >>>> +
> >>>> +     DC_FP_END();
> >>>>    #endif
> >>>>
> >>>>        kref_init(&new_state->refcount);
> >>>
> >
>
