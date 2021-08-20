Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739973F2F78
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CB16EAA6;
	Fri, 20 Aug 2021 15:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5826EAA5;
 Fri, 20 Aug 2021 15:28:08 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so14486756ott.10; 
 Fri, 20 Aug 2021 08:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2eS3QJuOoUmoESeURE1tHhGFVya6B6JGJbYvqJ7L3mA=;
 b=FZ30HpWsbdlvXLmE01aRY6a5J0fsLSGL6MIQb3E4ZaPfC2mLNqAtbEhCO5fgoSiLs3
 oa53tBxjoVERf3EJVHYSJKtQNlGGR3nf9CeQQntTgmqxipOigi9bAvc+Ztab/7qEMHC4
 vuWtBbUXz7e33mw4bWrwS9kDvLC/SDhFAvKfK0Ar+XyubJ1C4m9+t2tpzkxsgYr0haWp
 3+V073rf9UyztDAC4/gpGYkwNxeth0CkkYDvxeGkzmWFMwUOCK0rg0YlsvITRIseNsGT
 Z1yXHtFwLVaMCClbJMNxkAHywYEQszfcH25Uy5kQTRECBWb8ORudoaaFqgGiUy2q2dQM
 Ft6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2eS3QJuOoUmoESeURE1tHhGFVya6B6JGJbYvqJ7L3mA=;
 b=nrgZDQRgYJRN09521aThJEGXT997953xMO4rjVmsbBAhlSzjb42ClbCU7PnlfonhNw
 t9iUxuANh+8ExAS3c7TIVkJwHufZzkowPU2HnvZ4JFToA9Jp5Y4wuYTI09Kly8xAiiy2
 6i7o3fJ6E50hXM60tvlMCIcz2VSv7RJwlMWIvwoagQBUKuE/rFz2sNPX27bzTdEWuxmg
 Elme6iKfzWWKgRw8sRf1hK8m2+J1fk1TAGZ6vkSKCSyPUwFS43/zNF5xeMTfVs/QtYk1
 Uhu7DXWENjiLGzTBitxR5P4Zy0ZCM+vZerC+RhNhQ5jGwypAPK9+OhlA30nx+y39A5ts
 luKA==
X-Gm-Message-State: AOAM531JUIjbPYWTatkvMnFYWC00YvT+Vz9rWWQkNKVzh3Va9tsLZw8j
 YKH4+Png9WR75SeLV+FsRHfrElFlrNHxqjs6F7Y=
X-Google-Smtp-Source: ABdhPJz+x71nb8V3O2jBnnr5ntdbi4qL0VsQawio7iYcolm+2DfPCDbQyZTpmUm3IGebywOFOzSmealTe3sJF4YoDkk=
X-Received: by 2002:a05:6808:483:: with SMTP id z3mr3318825oid.5.1629473288249; 
 Fri, 20 Aug 2021 08:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210819201441.3545027-1-keescook@chromium.org>
In-Reply-To: <20210819201441.3545027-1-keescook@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Aug 2021 11:27:57 -0400
Message-ID: <CADnq5_PzoQjeESSANzQEkYy_3as8hu1zq-vXmujZExE4=CnpBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: And destination bounds checking to struct copy
To: Kees Cook <keescook@chromium.org>
Cc: Lijo Lazar <lijo.lazar@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, 
 Jiawei Gu <Jiawei.Gu@amd.com>, Evan Quan <evan.quan@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, 
 Dennis Li <Dennis.Li@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>, 
 Jonathan Kim <jonathan.kim@amd.com>, Kevin Wang <kevin1.wang@amd.com>, 
 David M Nieto <David.Nieto@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, 
 Lee Jones <lee.jones@linaro.org>, John Clements <John.Clements@amd.com>, 
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

On Thu, Aug 19, 2021 at 4:14 PM Kees Cook <keescook@chromium.org> wrote:
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
> memcpy() arguments, add a new helper, memcpy_trailing(), to perform the
> bounds checking at compile time. Replace the open-coded memcpy()s with
> memcpy_trailing() which includes enough context for the bounds checking.
>
> "objdump -d" shows no object code changes.
>
> [1] https://lore.kernel.org/lkml/e56aad3c-a06f-da07-f491-a894a570d78f@amd=
.com
>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
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
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Link: https://lore.kernel.org/lkml/CADnq5_Npb8uYvd+R4UHgf-w8-cQj3JoODjviJ=
R_Y9w9wqJ71mQ@mail.gmail.com
> ---
> Alex, I dropped your prior Acked-by, since the implementation is very
> different. If you're still happy with it, I can add it back. :)

This looks reasonable to me:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 25 +++++++++++++++++++
>  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  6 ++---
>  .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   |  8 +++---
>  .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    |  5 ++--
>  4 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 96e895d6be35..4605934a4fb7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1446,4 +1446,29 @@ static inline int amdgpu_in_reset(struct amdgpu_de=
vice *adev)
>  {
>         return atomic_read(&adev->in_gpu_reset);
>  }
> +
> +/**
> + * memcpy_trailing - Copy the end of one structure into the middle of an=
other
> + *
> + * @dst: Pointer to destination struct
> + * @first_dst_member: The member name in @dst where the overwrite begins
> + * @last_dst_member: The member name in @dst where the overwrite ends af=
ter
> + * @src: Pointer to the source struct
> + * @first_src_member: The member name in @src where the copy begins
> + *
> + */
> +#define memcpy_trailing(dst, first_dst_member, last_dst_member,         =
          \
> +                       src, first_src_member)                           =
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
>  #endif
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/=
gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index 8ab58781ae13..1918e6232319 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -465,10 +465,8 @@ static int arcturus_append_powerplay_table(struct sm=
u_context *smu)
>
>         if ((smc_dpm_table->table_header.format_revision =3D=3D 4) &&
>             (smc_dpm_table->table_header.content_revision =3D=3D 6))
> -               memcpy(&smc_pptable->MaxVoltageStepGfx,
> -                      &smc_dpm_table->maxvoltagestepgfx,
> -                      sizeof(*smc_dpm_table) - offsetof(struct atom_smc_=
dpm_info_v4_6, maxvoltagestepgfx));
> -
> +               memcpy_trailing(smc_pptable, MaxVoltageStepGfx, BoardRese=
rved,
> +                               smc_dpm_table, maxvoltagestepgfx);
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gp=
u/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index 2e5d3669652b..b738042e064d 100644
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
> +               memcpy_trailing(smc_pptable, I2cControllers, BoardReserve=
d,
> +                               smc_dpm_table, I2cControllers);
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
> +               memcpy_trailing(smc_pptable, I2cControllers, BoardReserve=
d,
> +                               smc_dpm_table_v4_7, I2cControllers);
>                 break;
>         default:
>                 dev_err(smu->adev->dev, "smc_dpm_info with unsupported co=
ntent revision %d!\n",
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index c8eefacfdd37..a6fd7ee314a9 100644
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
> +               memcpy_trailing(smc_pptable, GfxMaxCurrent, reserved,
> +                               smc_dpm_table, GfxMaxCurrent);
>         return 0;
>  }
>
> --
> 2.30.2
>
