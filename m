Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44496C2945A
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 18:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C124B10E1D8;
	Sun,  2 Nov 2025 17:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HfxKxTQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E856A10E1D5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 17:55:45 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-71d6014810fso39307927b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 09:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762106145; x=1762710945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COrNcrGnqRmVYJypFzHWli2n6WfayONN+cM0WGt3gX4=;
 b=HfxKxTQrN534GDnB5urH/nFPWvwW5xZijym2HNTXmJEYFWpNg/pXdXwFkgOzVrRPv3
 0MsBUXxX3GDbah+MVtpifeHHj2qPxMdCSM3fgEiwASevz2Gwvd6CYKVdSVu4+AOvg2e1
 xnq82v7qz86zsJIrZQfu6YVV4buGncz3ZMxTtOpb2Ok/sRa2/IrrNUM09zUTFrQ8ETQZ
 KDmPCtTUT4sE4RL6GfpjNXgl6+fVvl7Q4PmbDUuJAgcoYtnTLPTkSyUBNxQuhj8sssdT
 wddwGy7GU6hnHSnMi9eHUIC4ini1xB8Qj2QnvtiIkGcSd6n6s91WtCDY0RrpFb567oA+
 0waA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762106145; x=1762710945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COrNcrGnqRmVYJypFzHWli2n6WfayONN+cM0WGt3gX4=;
 b=XWzDVLA9UPHLao7/lU+JVFLjcRxtI8uHQ0G/5No4SNpTghVKteiotXVANc25OZO3De
 OPuSCLbj9lS/+JDSHa4vooWgCCwqo4t9nfAsu4mk9X2tP96dbvgetZK8miSENI03MNvh
 ZHFXlm43CRzLPVMshjmnAIzRurpb2Bka4vwuyQlpQfrwB0rqGTrOsJ4lq9rRj9Zhe+Xq
 1Xrq3tmoThamEpkdyKdmjMeoBHaoNWSf7uA8uAeZDQEsUo3kn448RSKLIhGTvwbWROQ0
 UygF7UajBTe6NyRyHbV5e1yWenWS/xWsSvpk5BP8mM1PJu8ZZNsEHRn8CKSM082Fj7sg
 UXEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZta5YCBd5N9IzAciFt98BorwhmRsZLMFBgQon8FcKInxXFYDMBOpqG7JKHwv1UA7pxO4cmUBzW6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzALT1rXxSqqS3+i4HtMEaR7F7+KD1kMXoRlGW4VzJcXO/y+VkT
 yTvTEBDqX0EV9QeXUX9JCLhOnBbkQtKCjlI3Y9JH2roVh2MZ+A4pQX24LpZK1ugGMN2Skfastcd
 4c3/9noPDpSoLa50BoqCVW7IKcVOmfAw=
X-Gm-Gg: ASbGncsyMSpLWklLLJhKYxE8o1ZFnjyItHlrn2PMXXvaCk6g5jZQmam8tSxEyWZllBX
 Z/2P6XkDEu2IzpmVIRItAJXWGQyGufDBktEq9KM+2erw0WRgCHqEUthhzhxVS4YB3thoxcx32VG
 pmWy2UKtyJFldRPPK/rJyoC8iQ5PBk57OymV8E4XI6mKcsdaruKDrGkAozf3K0PwdcCDlZtUGcS
 +EoolAYG4liPtuQUaTNhrdhKu60q0jSApM7bR3eiGrNah8v/tMfk8UH97GgCLvJ2Olu5Q1L0EXu
 ENIJb1ZceNaO9lCsLA==
X-Google-Smtp-Source: AGHT+IHwOoTLpyzH/g3E/JzA7phD7BGeV6UpgA7q5eX+Y0LqpTITLujui7fYoTqTi21cWBOv2eaSPrNTGdO3xpZZc9g=
X-Received: by 2002:a05:690c:4d8a:b0:786:7797:6d90 with SMTP id
 00721157ae682-78677977fcfmr14963877b3.15.1762106144618; Sun, 02 Nov 2025
 09:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
 <CAPaKu7TQ3tkQREG8xphW_L5eQPLuQhA=oKjfmYVJDR7PsNBXQg@mail.gmail.com>
 <CACSVV02B8BzvznzOoMw0EgOXEY39syWdyfzTcqWB0qsYjf42hQ@mail.gmail.com>
 <1d6a50c3-eb1d-46a9-922c-e57e6e83779d@oss.qualcomm.com>
In-Reply-To: <1d6a50c3-eb1d-46a9-922c-e57e6e83779d@oss.qualcomm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sun, 2 Nov 2025 09:55:33 -0800
X-Gm-Features: AWmQ_blh6__PmMaN0IO5NFLoRXaEv17c5FLIGT9OWNmNqb_llsX2WSXZEKBZN_A
Message-ID: <CAPaKu7QvBZmx0b8SDBY1H3u-Em+0py0BrGkmrfGUXkx1uQrg3A@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sat, Nov 1, 2025 at 12:52=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 11/1/2025 6:27 PM, Rob Clark wrote:
> > On Fri, Oct 31, 2025 at 4:43=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> w=
rote:
> >>
> >> On Mon, Sep 8, 2025 at 1:28=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qua=
lcomm.com> wrote:
> >>>
> >>> Add the IFPC restore register list and enable IFPC support on Adreno
> >>> X1-85 gpu.
> >>>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 68 +++++++++++++++++++++=
+++++++++-
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
> >>>  3 files changed, 79 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/=
drm/msm/adreno/a6xx_catalog.c
> >>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..547c046730a9b50a82cc9=
b27f08a5b1eeb08dced 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[=
] =3D {
> >>>
> >>>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
> >>>
> >>> +/* Applicable for X185, A750 */
> >>> +static const u32 a750_ifpc_reglist_regs[] =3D {
> >>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
> >>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> >>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> >>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> >>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> >>> +       REG_A6XX_TPL1_NC_MODE_CNTL,
> >>> +       REG_A6XX_SP_NC_MODE_CNTL,
> >>> +       REG_A6XX_CP_DBG_ECO_CNTL,
> >>> +       REG_A6XX_CP_PROTECT_CNTL,
> >>> +       REG_A6XX_CP_PROTECT(0),
> >>> +       REG_A6XX_CP_PROTECT(1),
> >>> +       REG_A6XX_CP_PROTECT(2),
> >>> +       REG_A6XX_CP_PROTECT(3),
> >>> +       REG_A6XX_CP_PROTECT(4),
> >>> +       REG_A6XX_CP_PROTECT(5),
> >>> +       REG_A6XX_CP_PROTECT(6),
> >>> +       REG_A6XX_CP_PROTECT(7),
> >>> +       REG_A6XX_CP_PROTECT(8),
> >>> +       REG_A6XX_CP_PROTECT(9),
> >>> +       REG_A6XX_CP_PROTECT(10),
> >>> +       REG_A6XX_CP_PROTECT(11),
> >>> +       REG_A6XX_CP_PROTECT(12),
> >>> +       REG_A6XX_CP_PROTECT(13),
> >>> +       REG_A6XX_CP_PROTECT(14),
> >>> +       REG_A6XX_CP_PROTECT(15),
> >>> +       REG_A6XX_CP_PROTECT(16),
> >>> +       REG_A6XX_CP_PROTECT(17),
> >>> +       REG_A6XX_CP_PROTECT(18),
> >>> +       REG_A6XX_CP_PROTECT(19),
> >>> +       REG_A6XX_CP_PROTECT(20),
> >>> +       REG_A6XX_CP_PROTECT(21),
> >>> +       REG_A6XX_CP_PROTECT(22),
> >>> +       REG_A6XX_CP_PROTECT(23),
> >>> +       REG_A6XX_CP_PROTECT(24),
> >>> +       REG_A6XX_CP_PROTECT(25),
> >>> +       REG_A6XX_CP_PROTECT(26),
> >>> +       REG_A6XX_CP_PROTECT(27),
> >>> +       REG_A6XX_CP_PROTECT(28),
> >>> +       REG_A6XX_CP_PROTECT(29),
> >>> +       REG_A6XX_CP_PROTECT(30),
> >>> +       REG_A6XX_CP_PROTECT(31),
> >>> +       REG_A6XX_CP_PROTECT(32),
> >>> +       REG_A6XX_CP_PROTECT(33),
> >>> +       REG_A6XX_CP_PROTECT(34),
> >>> +       REG_A6XX_CP_PROTECT(35),
> >>> +       REG_A6XX_CP_PROTECT(36),
> >>> +       REG_A6XX_CP_PROTECT(37),
> >>> +       REG_A6XX_CP_PROTECT(38),
> >>> +       REG_A6XX_CP_PROTECT(39),
> >>> +       REG_A6XX_CP_PROTECT(40),
> >>> +       REG_A6XX_CP_PROTECT(41),
> >>> +       REG_A6XX_CP_PROTECT(42),
> >>> +       REG_A6XX_CP_PROTECT(43),
> >>> +       REG_A6XX_CP_PROTECT(44),
> >>> +       REG_A6XX_CP_PROTECT(45),
> >>> +       REG_A6XX_CP_PROTECT(46),
> >>> +       REG_A6XX_CP_PROTECT(47),
> >>> +};
> >>> +
> >>> +DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
> >>> +
> >>>  static const struct adreno_info a7xx_gpus[] =3D {
> >>>         {
> >>>                 .chip_ids =3D ADRENO_CHIP_IDS(0x07000200),
> >>> @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] =
=3D {
> >>>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >>>                 .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> >>>                           ADRENO_QUIRK_HAS_HW_APRIV |
> >>> -                         ADRENO_QUIRK_PREEMPTION,
> >>> +                         ADRENO_QUIRK_PREEMPTION |
> >>> +                         ADRENO_QUIRK_IFPC,
> >>>                 .init =3D a6xx_gpu_init,
> >>>                 .a6xx =3D &(const struct a6xx_info) {
> >>>                         .hwcg =3D a740_hwcg,
> >>>                         .protect =3D &a730_protect,
> >>>                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> >>> +                       .ifpc_reglist =3D &a750_ifpc_reglist,
> >>>                         .gmu_chipid =3D 0x7050001,
> >>>                         .gmu_cgc_mode =3D 0x00020202,
> >>>                 },
> >>> @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> >>>                 .a6xx =3D &(const struct a6xx_info) {
> >>>                         .protect =3D &a730_protect,
> >>>                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> >>> +                       .ifpc_reglist =3D &a750_ifpc_reglist,
> >>>                         .gmu_chipid =3D 0x7090100,
> >>>                         .gmu_cgc_mode =3D 0x00020202,
> >>>                         .bcms =3D (const struct a6xx_bcm[]) {
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> >>> index 76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06..91a2a82c4f388ca6b0521=
72efdd7255165f3c04a 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> @@ -828,11 +828,10 @@ static void a7xx_patch_pwrup_reglist(struct msm=
_gpu *gpu)
> >>>         u32 *dest =3D (u32 *)&lock->regs[0];
> >>>         int i;
> >>>
> >>> -       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> >>> -
> >>>         lock->gpu_req =3D lock->cpu_req =3D lock->turn =3D 0;
> >>> -       lock->ifpc_list_len =3D 0;
> >>> -       lock->preemption_list_len =3D reglist->count;
> >>> +
> >>> +       reglist =3D adreno_gpu->info->a6xx->ifpc_reglist;
> >> This is NULL on X1-45 and causes
> >>
> >>   [    8.795603] Unable to handle kernel NULL pointer dereference at
> >> virtual address 0000000000000008
> >
> > Hmm, this is probably going to happen on all a7xx which don't have
> > IFPC from the looks of it.
> >
> > We should either check for the IFPC quirk.. or maybe just drop the
> > quirk and decide whether IFPC is supported based on ifpc_reglist !=3D
> > NULL?
> >
> > (That said, we probably do want to have IFPC enabled for x1-45)
>
> We should add a check for IFPC quirk here. Chia, do you plan to send a fi=
x?
>
> To enable IFPC, we can just add a750_ifpc_reglist_regs[] to
> adreno_gpu->info->a6xx->ifpc_reglist and enable the IFPC quirk.
Maybe it is easier for you to do the fix? Because I would have several
little questions (what happens when the reglist and the quirk flag are
inconsistent? how about preemption reglist?)

I am happy to do the testing.

>
> -Akhil.
>
> >
> > BR,
> > -R
> >
> >>> +       lock->ifpc_list_len =3D reglist->count;
> >>>
> >>>         /*
> >>>          * For each entry in each of the lists, write the offset and =
the current
> >>> @@ -843,6 +842,14 @@ static void a7xx_patch_pwrup_reglist(struct msm_=
gpu *gpu)
> >>>                 *dest++ =3D gpu_read(gpu, reglist->regs[i]);
> >>>         }
> >>>
> >>> +       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> >>> +       lock->preemption_list_len =3D reglist->count;
> >>> +
> >>> +       for (i =3D 0; i < reglist->count; i++) {
> >>> +               *dest++ =3D reglist->regs[i];
> >>> +               *dest++ =3D gpu_read(gpu, reglist->regs[i]);
> >>> +       }
> >>> +
> >>>         /*
> >>>          * The overall register list is composed of
> >>>          * 1. Static IFPC-only registers
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.h
> >>> index 124c63c4615930b00c64e488a498163ae35afccd..0b17d36c36a9567e6afa4=
269ae7783ed3578e40e 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >>> @@ -45,6 +45,7 @@ struct a6xx_info {
> >>>         const struct adreno_reglist *hwcg;
> >>>         const struct adreno_protect *protect;
> >>>         const struct adreno_reglist_list *pwrup_reglist;
> >>> +       const struct adreno_reglist_list *ifpc_reglist;
> >>>         u32 gmu_chipid;
> >>>         u32 gmu_cgc_mode;
> >>>         u32 prim_fifo_threshold;
> >>>
> >>> --
> >>> 2.50.1
> >>>
>
