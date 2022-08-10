Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B3A58EFD4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 17:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4081A8E82F;
	Wed, 10 Aug 2022 15:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748DA10F2FF;
 Wed, 10 Aug 2022 15:55:11 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id h125so18158652oif.8;
 Wed, 10 Aug 2022 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=2NpBJL5Oejk+iIT/DC4B4ULXoEjQZcdGj6m0d833WQA=;
 b=MPtrFXnEut25sx1mauN7GkjxQFXYWnErQi6Qiw+n13qy3voobf7+V0bUkNNN/0lhso
 tnG2IdUgV1jlK2VW+2Tk6A8wxt8YvGh8AsjSdtcFyKu8RI7DQWph6F3PrXUwZQClPdmO
 xi4fIAdLFy5spwFTFQAaUz1kiWt+9FiodjWwPXAZ8sOGNwy4pF2qn6Z1m9BdKf9a56vt
 eXN7fkyeFSZ53vqYHlS8ySMboqF7rrSuFsFgZPOP+R/ujdP0TXTl+yNfO9cRZnv/Vnw6
 shB24KcngB+tL8y12aVBFD29F4y54KwaCVgry/XkMgGvIu5jdo8u5xt3//JP4/oj6Awz
 SrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=2NpBJL5Oejk+iIT/DC4B4ULXoEjQZcdGj6m0d833WQA=;
 b=CW31zCgLZ/foht3SZYWyWIvgUuZZImXFJ/gZRF2S9OCQUKiZDYc0PW3KpxlWjka2fm
 n/s1Q/a4XE43cTELQ4TWC1cpgNKvVCL+1wcfZfdgLklaLXqQfAuVS4ipcPy4XrDaVtQP
 mMi+uj6GPWjrAhlaTiN/dZJqKvDbevBtMB+u7awGC3wYy21+nuUnZFgYcHUG4qlH5RUQ
 ZBptoGmLD2BfxfmZyL7qRXQ79gnMLl28fzlOqFtFYzsL6lONfLdzemkmFbW4FcaCNO9h
 qK//WfLhIF6v7Am9pJaY3cMs4lYaBt6UAExKTM8G0dyux8uTWlT2xTyZgqYbjdc/1yVv
 y6kg==
X-Gm-Message-State: ACgBeo00j/8utDbZ6DpwS8BqS0y4xcM9vdZocauzNm3gvWxd85mScbkB
 Yo15vhIWCE+lEvh3fAfkIpEfx4trRNlWQ0xKI1g=
X-Google-Smtp-Source: AA6agR7VJ4Gq4aAbczhaMc7F1e1T0a4pBOSkdraFXe8AfkbUglogtPnjuXMnm1P81QXwHYC2Oe5+be9FyxXJxmzjcoQ=
X-Received: by 2002:a05:6808:19a3:b0:33e:1525:3fb4 with SMTP id
 bj35-20020a05680819a300b0033e15253fb4mr1697185oib.106.1660146910438; Wed, 10
 Aug 2022 08:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220726182152.123649-1-andrealmeid@igalia.com>
 <20220726182152.123649-3-andrealmeid@igalia.com>
In-Reply-To: <20220726182152.123649-3-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Aug 2022 11:54:59 -0400
Message-ID: <CADnq5_N45m1Ce76bX6VnLWE6GgsqGCdmWmrSvgjEF=meEWf-jQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/amd/pm: Implement GFXOFF's entry count and
 residency for vangogh
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, kernel-dev@igalia.com,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 26, 2022 at 2:23 PM Andr=C3=A9 Almeida <andrealmeid@igalia.com>=
 wrote:
>
> Implement functions to get and set GFXOFF's entry count and residency
> for vangogh.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  .../pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h    |  5 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |  5 +-
>  .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 92 +++++++++++++++++++
>  3 files changed, 100 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h b=
/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h
> index fe130a497d6c..7471e2df2828 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h
> @@ -108,7 +108,10 @@
>  #define PPSMC_MSG_SetSlowPPTLimit                      0x4A
>  #define PPSMC_MSG_GetFastPPTLimit                      0x4B
>  #define PPSMC_MSG_GetSlowPPTLimit                      0x4C
> -#define PPSMC_Message_Count                            0x4D
> +#define PPSMC_MSG_GetGfxOffStatus                     0x50
> +#define PPSMC_MSG_GetGfxOffEntryCount                 0x51
> +#define PPSMC_MSG_LogGfxOffResidency                  0x52
> +#define PPSMC_Message_Count                            0x53
>
>  //Argument for PPSMC_MSG_GfxDeviceDriverReset
>  enum {
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h b/drivers/gpu/d=
rm/amd/pm/swsmu/inc/smu_types.h
> index 19084a4fcb2b..76fb6cbbc09c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
> @@ -235,7 +235,10 @@
>         __SMU_DUMMY_MAP(UnforceGfxVid),           \
>         __SMU_DUMMY_MAP(HeavySBR),                      \
>         __SMU_DUMMY_MAP(SetBadHBMPagesRetiredFlagsPerChannel), \
> -       __SMU_DUMMY_MAP(EnableGfxImu),
> +       __SMU_DUMMY_MAP(EnableGfxImu),                  \
> +       __SMU_DUMMY_MAP(GetGfxOffStatus),                \
> +       __SMU_DUMMY_MAP(GetGfxOffEntryCount),            \
> +       __SMU_DUMMY_MAP(LogGfxOffResidency),
>
>  #undef __SMU_DUMMY_MAP
>  #define __SMU_DUMMY_MAP(type)  SMU_MSG_##type
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/g=
pu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index 89504ff8e9ed..4e547573698b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -138,6 +138,9 @@ static struct cmn2asic_msg_mapping vangogh_message_ma=
p[SMU_MSG_MAX_COUNT] =3D {
>         MSG_MAP(SetSlowPPTLimit,                    PPSMC_MSG_SetSlowPPTL=
imit,                                          0),
>         MSG_MAP(GetFastPPTLimit,                    PPSMC_MSG_GetFastPPTL=
imit,                                          0),
>         MSG_MAP(GetSlowPPTLimit,                    PPSMC_MSG_GetSlowPPTL=
imit,                                          0),
> +       MSG_MAP(GetGfxOffStatus,                    PPSMC_MSG_GetGfxOffSt=
atus,                                          0),
> +       MSG_MAP(GetGfxOffEntryCount,                PPSMC_MSG_GetGfxOffEn=
tryCount,                                      0),
> +       MSG_MAP(LogGfxOffResidency,                 PPSMC_MSG_LogGfxOffRe=
sidency,                                       0),
>  };
>
>  static struct cmn2asic_mapping vangogh_feature_mask_map[SMU_FEATURE_COUN=
T] =3D {
> @@ -2200,6 +2203,92 @@ static int vangogh_set_power_limit(struct smu_cont=
ext *smu,
>         return ret;
>  }
>
> +/**
> + * vangogh_set_gfxoff_residency
> + *
> + * @smu: amdgpu_device pointer
> + * @start: start/stop residency log
> + *
> + * This function will be used to log gfxoff residency
> + *
> + *
> + * Returns standard response codes.
> + */
> +static u32 vangogh_set_gfxoff_residency(struct smu_context *smu, bool st=
art)
> +{
> +       int ret =3D 0;
> +       u32 residency;
> +       struct amdgpu_device *adev =3D smu->adev;
> +
> +       switch (adev->ip_versions[MP1_HWIP][0]) {
> +       case IP_VERSION(11, 5, 0):

Minor nit, but you can drip the IP version checks here.  This whole
file is specific to 11.5.

> +               if (!(adev->pm.pp_feature & PP_GFXOFF_MASK))
> +                       return 0;
> +               ret =3D smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_LogG=
fxOffResidency,
> +                                                     start, &residency);
> +               if (!start)
> +                       adev->gfx.gfx_off_residency =3D residency;
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +/**
> + * vangogh_get_gfxoff_residency
> + *
> + * @smu: amdgpu_device pointer
> + *
> + * This function will be used to get gfxoff residency.
> + *
> + * Returns standard response codes.
> + */
> +static u32 vangogh_get_gfxoff_residency(struct smu_context *smu, uint32_=
t *residency)
> +{
> +       int ret =3D 0;
> +       struct amdgpu_device *adev =3D smu->adev;
> +
> +       switch (adev->ip_versions[MP1_HWIP][0]) {
> +       case IP_VERSION(11, 5, 0):

Same here.

> +               *residency =3D adev->gfx.gfx_off_residency;
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +/**
> + * vangogh_get_gfxoff_entrycount - get gfxoff entry count
> + *
> + * @smu: amdgpu_device pointer
> + *
> + * This function will be used to get gfxoff entry count
> + *
> + * Returns standard response codes.
> + */
> +static u32 vangogh_get_gfxoff_entrycount(struct smu_context *smu, uint64=
_t *entrycount)
> +{
> +       int ret =3D 0, value =3D 0;
> +       struct amdgpu_device *adev =3D smu->adev;
> +
> +       switch (adev->ip_versions[MP1_HWIP][0]) {
> +       case IP_VERSION(11, 5, 0):
> +               if (!(adev->pm.pp_feature & PP_GFXOFF_MASK))
> +                       return 0;
> +               ret =3D smu_cmn_send_smc_msg(smu, SMU_MSG_GetGfxOffEntryC=
ount, &value);
> +               *entrycount =3D value + adev->gfx.gfx_off_entrycount;
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
>  static const struct pptable_funcs vangogh_ppt_funcs =3D {
>
>         .check_fw_status =3D smu_v11_0_check_fw_status,
> @@ -2237,6 +2326,9 @@ static const struct pptable_funcs vangogh_ppt_funcs=
 =3D {
>         .mode2_reset =3D vangogh_mode2_reset,
>         .gfx_off_control =3D smu_v11_0_gfx_off_control,
>         .get_gfx_off_status =3D vangogh_get_gfxoff_status,
> +       .get_gfx_off_entrycount =3D vangogh_get_gfxoff_entrycount,
> +       .get_gfx_off_residency =3D vangogh_get_gfxoff_residency,
> +       .set_gfx_off_residency =3D vangogh_set_gfxoff_residency,
>         .get_ppt_limit =3D vangogh_get_ppt_limit,
>         .get_power_limit =3D vangogh_get_power_limit,
>         .set_power_limit =3D vangogh_set_power_limit,
> --
> 2.37.1
>
