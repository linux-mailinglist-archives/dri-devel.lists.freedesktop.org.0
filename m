Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A9D3F9EAB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 20:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2D16E9A4;
	Fri, 27 Aug 2021 18:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E5F6E9A4;
 Fri, 27 Aug 2021 18:21:48 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id y128so10726651oie.4;
 Fri, 27 Aug 2021 11:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HOZ5zaOCqUJQUd2nXR+gLDAA5Y95/Rwbrwnw9SPRbXM=;
 b=m2zqffSM3fFWBcp3oXrxUhW+XUU2ZRC1SsIy40t3T5Qnue+81b51D1xwGxkzA6Gpd2
 P+SDDqd5jQ8udKLX7J61k3shUqO5uTk+99dwYK/SdlvYYg8sSkZdVyVYLQ7HjQ2OvSzs
 MK9yXACq53zKM0QMwHn5lVaENWAkNymEP/grh2RGEUO8VjJAhSsDsVorvgN2IsmvxkoQ
 SEkAbbfvOF2NINPJirWl658MRaFMioPoLA7pNRN4m9ImQPSRgiNJLrTIEn51gZo5co/i
 tdFuIy+4bHLLHA0UXSR5eTFrUJv3vSvbb+FvatAslYtNnjIXHhXrsPIJqBPZxNRwlhjs
 jsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HOZ5zaOCqUJQUd2nXR+gLDAA5Y95/Rwbrwnw9SPRbXM=;
 b=hmHEMW6v5AlyQ2qP8e9mc57rNKdNm1TnyWe3FETZOPSgXdL8oyZMyMhsJBLifdOCWH
 Hsg/fE+SCEi0HJl5ppjy7cG3CvCkyid574h2BoH0AOwgjKGeBX5WxHpMfI81+oY1jLb4
 rtH3CPkro+UbhA5nmwilBOXWhW/L7tK0luUbuazp88gXgAlOSGvkXi0QlTf4jiX/goQV
 Xb+1Gl4kAEspmQTDOacs4uKb5htaHjtOKb2FFQCrOwtWcFyOziXimZCdEw5L8bQKFS84
 7XhIXtyr6nMv4jSVBwCuNFAhAjLA8NQj6png4t2BZIGLTdAEBmhPSpQY0ymz7yObOJug
 /6bQ==
X-Gm-Message-State: AOAM532LRWayeTt5aRpRKkujYTx54lDuBESwkTgFvkuxUSO+7lW/tgKY
 H4Iuw082P8NeqG20LmkRJAA/mwgNPDmYnY8/ZLc=
X-Google-Smtp-Source: ABdhPJyWWvg76qCglaN9jnDbUTvMo1pNLT7X9DWAbPchm8IDs5cnmoHSDEurNXa9Nct+r4BxARkBGwm5UZ4apCQc6Ok=
X-Received: by 2002:a05:6808:483:: with SMTP id
 z3mr15322342oid.5.1630088508194; 
 Fri, 27 Aug 2021 11:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210827031647.2069945-1-keescook@chromium.org>
In-Reply-To: <20210827031647.2069945-1-keescook@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Aug 2021 14:21:37 -0400
Message-ID: <CADnq5_M6f_3vs3zjPG=hA074iBDWRQ_JDLu-gMpiJNEk1Jfpew@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amd/pm: And destination bounds checking to struct
 copy
To: Kees Cook <keescook@chromium.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, 
 Jiawei Gu <Jiawei.Gu@amd.com>, Evan Quan <evan.quan@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 Darren Powell <darren.powell@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Xiaojian Du <Xiaojian.Du@amd.com>, Ryan Taylor <Ryan.Taylor@amd.com>, 
 Graham Sider <Graham.Sider@amd.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 David M Nieto <david.nieto@amd.com>, Lee Jones <lee.jones@linaro.org>, 
 John Clements <john.clements@amd.com>, LKML <linux-kernel@vger.kernel.org>, 
 linux-hardening@vger.kernel.org
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

Applied.  Thanks!

Alex

On Thu, Aug 26, 2021 at 11:16 PM Kees Cook <keescook@chromium.org> wrote:
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
> v3: rename amdgpu_memcpy_trailing() to smu_memcpy_trailing()
> v2: https://lore.kernel.org/lkml/20210825161957.3904130-1-keescook@chromi=
um.org
> v1: https://lore.kernel.org/lkml/20210819201441.3545027-1-keescook@chromi=
um.org
> ---
>  drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h       | 24 +++++++++++++++++++
>  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  6 ++---
>  .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   |  8 +++----
>  .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    |  5 ++--
>  4 files changed, 32 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/am=
d/pm/inc/amdgpu_smu.h
> index 715b4225f5ee..8156729c370b 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> @@ -1335,6 +1335,30 @@ enum smu_cmn2asic_mapping_type {
>  #define WORKLOAD_MAP(profile, workload) \
>         [profile] =3D {1, (workload)}
>
> +/**
> + * smu_memcpy_trailing - Copy the end of one structure into the middle o=
f another
> + *
> + * @dst: Pointer to destination struct
> + * @first_dst_member: The member name in @dst where the overwrite begins
> + * @last_dst_member: The member name in @dst where the overwrite ends af=
ter
> + * @src: Pointer to the source struct
> + * @first_src_member: The member name in @src where the copy begins
> + *
> + */
> +#define smu_memcpy_trailing(dst, first_dst_member, last_dst_member,     =
  \
> +                           src, first_src_member)                       =
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
> index 273df66cac14..e343cc218990 100644
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
> +               smu_memcpy_trailing(smc_pptable, MaxVoltageStepGfx, Board=
Reserved,
> +                                   smc_dpm_table, maxvoltagestepgfx);
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gp=
u/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index f96681700c41..a5fc5d7cb6c7 100644
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
> +               smu_memcpy_trailing(smc_pptable, I2cControllers, BoardRes=
erved,
> +                                   smc_dpm_table, I2cControllers);
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
> +               smu_memcpy_trailing(smc_pptable, I2cControllers, BoardRes=
erved,
> +                                   smc_dpm_table_v4_7, I2cControllers);
>                 break;
>         default:
>                 dev_err(smu->adev->dev, "smc_dpm_info with unsupported co=
ntent revision %d!\n",
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index ec8c30daf31c..ab652028e003 100644
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
> +               smu_memcpy_trailing(smc_pptable, GfxMaxCurrent, reserved,
> +                                   smc_dpm_table, GfxMaxCurrent);
>         return 0;
>  }
>
> --
> 2.30.2
>
