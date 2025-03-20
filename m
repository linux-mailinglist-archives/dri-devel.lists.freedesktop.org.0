Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA44A69F01
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 05:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E1C10E02A;
	Thu, 20 Mar 2025 04:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qtXd3DeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D3A10E02A;
 Thu, 20 Mar 2025 04:23:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 397DBA48C0D;
 Thu, 20 Mar 2025 04:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F343BC4CEEA;
 Thu, 20 Mar 2025 04:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742444606;
 bh=LkI2Pi0Sleh04gNOxS3QNePrWppyu4Kf4mYuxg2c7wU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qtXd3DeHm6zmcE5mCneY0/l36MLj+y7xDUx+rg5+CsEtDFHodD2fEpClLX99TGAbQ
 a9DgcfJspPlVeanCcDUhpood/6A5zUN7I/tCoxHnkp4mlARk8kC2NRoXAGMKwRca2a
 8i9L49GdzxP9hs1KI+QL1DHzf5x5pLcmzJIL2oZIVX8s270k3ZyNHro2XA5glgjzcK
 zYN/xFfOHfYPkryVqTe5PtXn6uP0kRgJJolC0UMOS56Xz+FIK28wNufMf6fmpTGGU2
 U2SR27mBUXxYKAv5zSZ1Raetw2ak/pVSvG/SWLqAcemiT4kqYviEtsK+Rce9UreNVE
 7WBCDQTugghYA==
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ac2a089fbbdso65512966b.1; 
 Wed, 19 Mar 2025 21:23:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV55Ow2qX18TZsuqvDogXM7ZSL74+ui+Crg/bRQiurxIz5rZnT6dfegPT+N7XfSd4BC3hMD9g570/ed@lists.freedesktop.org,
 AJvYcCWYeUoGF/4VvFgR+dLaJxlAl7iD5oo1yXbdONKL0xpGQxGg/HeXH+NDkS4N9wVkeQ6tfE3E0rHy@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy37/GXH+BI+/f4UvkYjXsSQfeShAjtR5Rd33317FFzpE2wg2jC
 t6tpM0bhXBg+L31gQ+pF8/OV9v4as6zgXoyWYP5baPxEpK2uJmTwsjaRNULSOUDdeh5VdL4FZer
 e2TPiVhX929wmqh/9dPh/bWzhPG4=
X-Google-Smtp-Source: AGHT+IGnirlIKzoHGiXRkY3/OklKTSQvMw9j1ZnsUJsWIWidCjvn5bqMWU+2sSoqKa5cyAAErClRCr8WQdXd2FsEQ5I=
X-Received: by 2002:a17:907:c5c9:b0:ac0:4364:4083 with SMTP id
 a640c23a62f3a-ac3cd293a02mr243799766b.0.1742444604441; Wed, 19 Mar 2025
 21:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250318111717.2161235-1-chenhuacai@loongson.cn>
 <b8c481f2-a280-4f86-8080-2c6dcffc4629@amd.com>
In-Reply-To: <b8c481f2-a280-4f86-8080-2c6dcffc4629@amd.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 20 Mar 2025 12:23:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7cch+koOSJAFe70c8Pk02snK7M=andyfwbCgiNdg4aVg@mail.gmail.com>
X-Gm-Features: AQ5f1JqCMGEz-KR3xSxr9u44eBBznKM9V-TLFrPVoev9eMhnr5IfrdPhAdR48Ow
Message-ID: <CAAhV-H7cch+koOSJAFe70c8Pk02snK7M=andyfwbCgiNdg4aVg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Protect
 dml2_create()/dml2_copy()/dml2_create_copy()
To: Alex Hung <alex.hung@amd.com>
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

On Thu, Mar 20, 2025 at 10:16=E2=80=AFAM Alex Hung <alex.hung@amd.com> wrot=
e:
>
>
>
> On 3/18/25 05:17, Huacai Chen wrote:
> > Commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP context
> > start") removes the FP context protection of dml2_create(), and it said
> > "All the DC_FP_START/END should be used before call anything from DML2"=
.
> >
> > However, dml2_create()/dml2_copy()/dml2_create_copy() are not protected
> > from their callers, causing such errors:
> >
> >   do_fpu invoked from kernel context![#1]:
> >   CPU: 0 UID: 0 PID: 239 Comm: kworker/0:5 Not tainted 6.14.0-rc6+ #1
> >   Workqueue: events work_for_cpu_fn
> >   pc ffff80000319de80 ra ffff80000319de5c tp 900000010575c000 sp 900000=
010575f840
> >   a0 0000000000000000 a1 900000012f210130 a2 900000012f000000 a3 ffff80=
000357e268
> >   a4 ffff80000357e260 a5 900000012ea52cf0 a6 0000000400000004 a7 000001=
2c00001388
> >   t0 00001900000015e0 t1 ffff80000379d000 t2 0000000010624dd3 t3 000000=
6400000014
> >   t4 00000000000003e8 t5 0000005000000018 t6 0000000000000020 t7 000000=
0f00000064
> >   t8 000000000000002f u0 5f5e9200f8901912 s9 900000012d380010 s0 900000=
012ea51fd8
> >   s1 900000012f000000 s2 9000000109296000 s3 0000000000000001 s4 000000=
0000001fd8
> >   s5 0000000000000001 s6 ffff800003415000 s7 900000012d390000 s8 ffff80=
0003211f80
> >      ra: ffff80000319de5c dml21_apply_soc_bb_overrides+0x3c/0x960 [amdg=
pu]
> >     ERA: ffff80000319de80 dml21_apply_soc_bb_overrides+0x60/0x960 [amdg=
pu]
> >    CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
> >    PRMD: 00000004 (PPLV0 +PIE -PWE)
> >    EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
> >    ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> >   ESTAT: 000f0000 [FPD] (IS=3D ECode=3D15 EsubCode=3D0)
> >    PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
> >   Process kworker/0:5 (pid: 239, threadinfo=3D00000000927eadc6, task=3D=
000000008fd31682)
> >   Stack : 00040dc000003164 0000000000000001 900000012f210130 900000012e=
abeeb8
> >           900000012f000000 ffff80000319fe48 900000012f210000 900000012f=
210130
> >           900000012f000000 900000012eabeeb8 0000000000000001 ffff800003=
1a0064
> >           900000010575f9f0 900000012f210130 900000012eac0000 900000012e=
a80000
> >           900000012f000000 ffff8000031cefc4 900000010575f9f0 ffff800003=
5859c0
> >           ffff800003414000 900000010575fa78 900000012f000000 ffff800003=
1b4c50
> >           0000000000000000 9000000101c9d700 9000000109c40000 5f5e9200f8=
901912
> >           900000012d3c4bd0 900000012d3c5000 ffff8000034aed18 900000012d=
380010
> >           900000012d3c4bd0 ffff800003414000 900000012d380000 ffff800002=
ea49dc
> >           0000000000000001 900000012d3c6000 00000000ffffe423 0000000000=
010000
> >           ...
> >   Call Trace:
> >   [<ffff80000319de80>] dml21_apply_soc_bb_overrides+0x60/0x960 [amdgpu]
> >   [<ffff80000319fe44>] dml21_init+0xa4/0x280 [amdgpu]
> >   [<ffff8000031a0060>] dml21_create+0x40/0x80 [amdgpu]
> >   [<ffff8000031cefc0>] dc_state_create+0x100/0x160 [amdgpu]
> >   [<ffff8000031b4c4c>] dc_create+0x44c/0x640 [amdgpu]
> >   [<ffff800002ea49d8>] amdgpu_dm_init+0x3f8/0x2060 [amdgpu]
> >   [<ffff800002ea6658>] dm_hw_init+0x18/0x60 [amdgpu]
> >   [<ffff800002b16738>] amdgpu_device_init+0x1938/0x27e0 [amdgpu]
> >   [<ffff800002b18e80>] amdgpu_driver_load_kms+0x20/0xa0 [amdgpu]
> >   [<ffff800002b0c8f0>] amdgpu_pci_probe+0x1b0/0x580 [amdgpu]
> >   [<900000000448eae4>] local_pci_probe+0x44/0xc0
> >   [<9000000003b02b18>] work_for_cpu_fn+0x18/0x40
> >   [<9000000003b05da0>] process_one_work+0x160/0x300
> >   [<9000000003b06718>] worker_thread+0x318/0x440
> >   [<9000000003b11b8c>] kthread+0x12c/0x220
> >   [<9000000003ac1484>] ret_from_kernel_thread+0x8/0xa4
> >
> > So protect dml2_create()/dml2_copy()/dml2_create_copy() with DC_FP_STAR=
T
> > and DC_FP_END.
>
> Hi Huacai,
>
> Can you try to put DC_FP_START DC_FP_END in the
> dml2_create()/dml2_copy()/dml2_create_copy()/dml2_validate() instead?
> The code will be cleaner and less error-prone to future changes.
At first I want to add them in
dml2_create()/dml2_copy()/dml2_create_copy()/dml2_validate(), but
commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP context
start")  said
that "All the DC_FP_START/END should be used before call anything from DML2=
".

Huacai

>
> Thanks.
>
>
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   drivers/gpu/drm/amd/display/dc/core/dc_state.c | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/g=
pu/drm/amd/display/dc/core/dc_state.c
> > index 1b2cce127981..6e2cac08002d 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
> > @@ -210,17 +210,23 @@ struct dc_state *dc_state_create(struct dc *dc, s=
truct dc_state_create_params *p
> >
> >   #ifdef CONFIG_DRM_AMD_DC_FP
> >       if (dc->debug.using_dml2) {
> > +             DC_FP_START();
> > +
> >               dml2_opt->use_clock_dc_limits =3D false;
> >               if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2)) {
> > +                     DC_FP_END();
> >                       dc_state_release(state);
> >                       return NULL;
> >               }
> >
> >               dml2_opt->use_clock_dc_limits =3D true;
> >               if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2_dc_pow=
er_source)) {
> > +                     DC_FP_END();
> >                       dc_state_release(state);
> >                       return NULL;
> >               }
> > +
> > +             DC_FP_END();
> >       }
> >   #endif
> >
> > @@ -240,6 +246,8 @@ void dc_state_copy(struct dc_state *dst_state, stru=
ct dc_state *src_state)
> >       dc_state_copy_internal(dst_state, src_state);
> >
> >   #ifdef CONFIG_DRM_AMD_DC_FP
> > +     DC_FP_START();
> > +
> >       dst_state->bw_ctx.dml2 =3D dst_dml2;
> >       if (src_state->bw_ctx.dml2)
> >               dml2_copy(dst_state->bw_ctx.dml2, src_state->bw_ctx.dml2)=
;
> > @@ -247,6 +255,8 @@ void dc_state_copy(struct dc_state *dst_state, stru=
ct dc_state *src_state)
> >       dst_state->bw_ctx.dml2_dc_power_source =3D dst_dml2_dc_power_sour=
ce;
> >       if (src_state->bw_ctx.dml2_dc_power_source)
> >               dml2_copy(dst_state->bw_ctx.dml2_dc_power_source, src_sta=
te->bw_ctx.dml2_dc_power_source);
> > +
> > +     DC_FP_END();
> >   #endif
> >
> >       /* context refcount should not be overridden */
> > @@ -268,17 +278,23 @@ struct dc_state *dc_state_create_copy(struct dc_s=
tate *src_state)
> >       new_state->bw_ctx.dml2 =3D NULL;
> >       new_state->bw_ctx.dml2_dc_power_source =3D NULL;
> >
> > +     DC_FP_START();
> > +
> >       if (src_state->bw_ctx.dml2 &&
> >                       !dml2_create_copy(&new_state->bw_ctx.dml2, src_st=
ate->bw_ctx.dml2)) {
> > +             DC_FP_END();
> >               dc_state_release(new_state);
> >               return NULL;
> >       }
> >
> >       if (src_state->bw_ctx.dml2_dc_power_source &&
> >                       !dml2_create_copy(&new_state->bw_ctx.dml2_dc_powe=
r_source, src_state->bw_ctx.dml2_dc_power_source)) {
> > +             DC_FP_END();
> >               dc_state_release(new_state);
> >               return NULL;
> >       }
> > +
> > +     DC_FP_END();
> >   #endif
> >
> >       kref_init(&new_state->refcount);
>
