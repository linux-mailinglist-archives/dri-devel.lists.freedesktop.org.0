Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E953F8F3B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 21:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B7D6E8A8;
	Thu, 26 Aug 2021 19:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4CE6E8A7;
 Thu, 26 Aug 2021 19:51:40 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso4981296ott.13; 
 Thu, 26 Aug 2021 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XM6re4Hifd6MirHtZqM/1bWmoGqv/Y1ZWVd6ApIV9fY=;
 b=L2yujtwSADQcvgU6MSuRYpT1bhX0Mjwkjhi7YOfUjerM00be7cn6TiZ8zEYvDF7PX2
 G8ZiBlN4zjYdS9mL1CNXH8cnsIQx3tUagpnI8NYKQxdsFq96upUyzyIgQVlryMh/C+UF
 KnH5PJCzUOj/gwGmbYfCx1SKrfC4XScRKqHAE5XaewdTd60RqkRM4ZSqeo58Z5RhInaC
 HCCHSp/4kES1IMLOIaUxFac24SaLQLfF2oElYfIRV/qFuEphbBmhB4MeitMhT9Y1izZm
 M29+EvACO0sU2uoDknRDeNMUO5FD5H5zFJ3O44+SRUXnwo0xvgAezQXXuxjyg/afB3MG
 wx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XM6re4Hifd6MirHtZqM/1bWmoGqv/Y1ZWVd6ApIV9fY=;
 b=T1KfcZgy1mss+JyR1qpG7u0NUTCSPhFd7gIVWIULaCTFlPoTItJFRcfnY6gJ7cMYnd
 FStiHCAJ7/1tz4qw6uZNfNoOxae6jyE4vSRKQE1K9J6Vg/41YqfRgOtnF5wNK3xHNo0m
 w1jJ21OQRZVBSVO8abksKlFC8NKwPWxj5LSEfA1icEwID5wRbHXnXDGjcpcFuUw8WQG/
 ws86e+ZCqtQioUYNRpkYfihSsb5njiHp1U0MSgxXoI7RIkao3D+nPJXfdlFruTJUzE+v
 613vzMqBF0d3SKz2l6LeeYV8ThKpT13eKhf291sBspncbOnMBXrIgF+NKtJQilaJSaK5
 esFA==
X-Gm-Message-State: AOAM531LhSCIWb1PyniQt/ymzRK4z3rY8tpB/tcCMcDrFcrzF5ykJw9A
 cCsI4MeUycu4a/sL1Xo/CvSyZXHg3KTEHBn2S4s=
X-Google-Smtp-Source: ABdhPJxC0cSeH76R7tcJ+v5H4i/A4CMpNNrDVpe7GwEXibeCUqTpMy7WBheSsdHCpzfeh4XZh7dcixuY7THz8xP+CYs=
X-Received: by 2002:a9d:4c15:: with SMTP id l21mr4613884otf.311.1630007500041; 
 Thu, 26 Aug 2021 12:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210825161957.3904130-1-keescook@chromium.org>
In-Reply-To: <20210825161957.3904130-1-keescook@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Aug 2021 15:51:29 -0400
Message-ID: <CADnq5_M7cj3o4KbtA937nO_oA6ZS3-ZByLBqif_BzkXuYyV8Kw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/pm: And destination bounds checking to struct
 copy
To: Kees Cook <keescook@chromium.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, 
 Jiawei Gu <Jiawei.Gu@amd.com>, Evan Quan <evan.quan@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Lijo Lazar <lijo.lazar@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>, 
 Jonathan Kim <jonathan.kim@amd.com>, Darren Powell <darren.powell@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>, 
 Ryan Taylor <Ryan.Taylor@amd.com>, Graham Sider <Graham.Sider@amd.com>, 
 Kevin Wang <kevin1.wang@amd.com>, David M Nieto <David.Nieto@amd.com>, 
 Lee Jones <lee.jones@linaro.org>, John Clements <john.clements@amd.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org
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

On Wed, Aug 25, 2021 at 12:20 PM Kees Cook <keescook@chromium.org> wrote:
>
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
>
> The "Board Parameters" members of the structs:
>         struct atom_smc_dpm_info_v4_5
>         struct atom_smc_dpm_info_v4_6
>         struct atom_smc_dpm_info_v4_7
>         struct atom_smc_dpm_info_v4_10
> are written to the corresponding members of the corresponding PPTable_t
> variables, but they lack destination size bounds checking, which means
> the compiler cannot verify at compile time that this is an intended and
> safe memcpy().
>
> Since the header files are effectively immutable[1] and a struct_group()
> cannot be used, nor a common struct referenced by both sides of the
> memcpy() arguments, add a new helper, amdgpu_memcpy_trailing(), to
> perform the bounds checking at compile time. Replace the open-coded
> memcpy()s with amdgpu_memcpy_trailing() which includes enough context
> for the bounds checking.
>
> "objdump -d" shows no object code changes.
>
> [1] https://lore.kernel.org/lkml/e56aad3c-a06f-da07-f491-a894a570d78f@amd=
.com
>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Feifei Xu <Feifei.Xu@amd.com>
> Cc: Likun Gao <Likun.Gao@amd.com>
> Cc: Jiawei Gu <Jiawei.Gu@amd.com>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2:
> - rename and move helper to drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> - add reviews/acks
> v1: https://lore.kernel.org/lkml/20210819201441.3545027-1-keescook@chromi=
um.org/
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
>  drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h       | 24 +++++++++++++++++++
>  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  6 ++---
>  .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   |  8 +++----
>  .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    |  5 ++--
>  5 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index dc3c6b3a00e5..c911387045e2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1452,4 +1452,5 @@ static inline int amdgpu_in_reset(struct amdgpu_dev=
ice *adev)
>  {
>         return atomic_read(&adev->in_gpu_reset);
>  }
> +
>  #endif
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/am=
d/pm/inc/amdgpu_smu.h
> index 715b4225f5ee..29031eb11d39 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> @@ -1335,6 +1335,30 @@ enum smu_cmn2asic_mapping_type {
>  #define WORKLOAD_MAP(profile, workload) \
>         [profile] =3D {1, (workload)}
>
> +/**
> + * amdgpu_memcpy_trailing - Copy the end of one structure into the middl=
e of another
> + *
> + * @dst: Pointer to destination struct
> + * @first_dst_member: The member name in @dst where the overwrite begins
> + * @last_dst_member: The member name in @dst where the overwrite ends af=
ter
> + * @src: Pointer to the source struct
> + * @first_src_member: The member name in @src where the copy begins
> + *
> + */
> +#define amdgpu_memcpy_trailing(dst, first_dst_member, last_dst_member,  =
  \

I would change this to smu_memcpy_trailing() for consistency.  Other
than that, it the patch looks good to me.  Did you want me to pick
this up or do you want to keep this with the other patches in your
series?

Thanks!

Alex

> +                              src, first_src_member)                    =
  \
> +({                                                                      =
  \
> +       size_t __src_offset =3D offsetof(typeof(*(src)), first_src_member=
);  \
> +       size_t __src_size =3D sizeof(*(src)) - __src_offset;             =
    \
> +       size_t __dst_offset =3D offsetof(typeof(*(dst)), first_dst_member=
);  \
> +       size_t __dst_size =3D offsetofend(typeof(*(dst)), last_dst_member=
) - \
> +                           __dst_offset;                                =
  \
> +       BUILD_BUG_ON(__src_size !=3D __dst_size);                        =
    \
> +       __builtin_memcpy((u8 *)(dst) + __dst_offset,                     =
  \
> +                        (u8 *)(src) + __src_offset,                     =
  \
> +                        __dst_size);                                    =
  \
> +})
> +
>  #if !defined(SWSMU_CODE_LAYER_L2) && !defined(SWSMU_CODE_LAYER_L3) && !d=
efined(SWSMU_CODE_LAYER_L4)
>  int smu_get_power_limit(void *handle,
>                         uint32_t *limit,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/=
gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index 273df66cac14..bda8fc12c91f 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -483,10 +483,8 @@ static int arcturus_append_powerplay_table(struct sm=
u_context *smu)
>
>         if ((smc_dpm_table->table_header.format_revision =3D=3D 4) &&
>             (smc_dpm_table->table_header.content_revision =3D=3D 6))
> -               memcpy(&smc_pptable->MaxVoltageStepGfx,
> -                      &smc_dpm_table->maxvoltagestepgfx,
> -                      sizeof(*smc_dpm_table) - offsetof(struct atom_smc_=
dpm_info_v4_6, maxvoltagestepgfx));
> -
> +               amdgpu_memcpy_trailing(smc_pptable, MaxVoltageStepGfx, Bo=
ardReserved,
> +                                      smc_dpm_table, maxvoltagestepgfx);
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gp=
u/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index f96681700c41..88a4a2aed48e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -431,16 +431,16 @@ static int navi10_append_powerplay_table(struct smu=
_context *smu)
>
>         switch (smc_dpm_table->table_header.content_revision) {
>         case 5: /* nv10 and nv14 */
> -               memcpy(smc_pptable->I2cControllers, smc_dpm_table->I2cCon=
trollers,
> -                       sizeof(*smc_dpm_table) - sizeof(smc_dpm_table->ta=
ble_header));
> +               amdgpu_memcpy_trailing(smc_pptable, I2cControllers, Board=
Reserved,
> +                                      smc_dpm_table, I2cControllers);
>                 break;
>         case 7: /* nv12 */
>                 ret =3D amdgpu_atombios_get_data_table(adev, index, NULL,=
 NULL, NULL,
>                                               (uint8_t **)&smc_dpm_table_=
v4_7);
>                 if (ret)
>                         return ret;
> -               memcpy(smc_pptable->I2cControllers, smc_dpm_table_v4_7->I=
2cControllers,
> -                       sizeof(*smc_dpm_table_v4_7) - sizeof(smc_dpm_tabl=
e_v4_7->table_header));
> +               amdgpu_memcpy_trailing(smc_pptable, I2cControllers, Board=
Reserved,
> +                                      smc_dpm_table_v4_7, I2cControllers=
);
>                 break;
>         default:
>                 dev_err(smu->adev->dev, "smc_dpm_info with unsupported co=
ntent revision %d!\n",
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index ec8c30daf31c..d46b892846f6 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -409,9 +409,8 @@ static int aldebaran_append_powerplay_table(struct sm=
u_context *smu)
>
>         if ((smc_dpm_table->table_header.format_revision =3D=3D 4) &&
>             (smc_dpm_table->table_header.content_revision =3D=3D 10))
> -               memcpy(&smc_pptable->GfxMaxCurrent,
> -                      &smc_dpm_table->GfxMaxCurrent,
> -                      sizeof(*smc_dpm_table) - offsetof(struct atom_smc_=
dpm_info_v4_10, GfxMaxCurrent));
> +               amdgpu_memcpy_trailing(smc_pptable, GfxMaxCurrent, reserv=
ed,
> +                                      smc_dpm_table, GfxMaxCurrent);
>         return 0;
>  }
>
> --
> 2.30.2
>
