Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF066D10D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374D810E4E0;
	Mon, 16 Jan 2023 21:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC7510E4E0;
 Mon, 16 Jan 2023 21:41:54 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id j130so24441985oif.4;
 Mon, 16 Jan 2023 13:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ts30qW5ZibOfxhwbjhhYDy8BwJIkR/zbeou1xIzV0yU=;
 b=ThvTPCU+rm5j79vBcoS69dfnJgk6W7Cm4fPK53cQfzQNwtXqDXTXjQZo6KMzMS7g2u
 +L2W8FNhFRWrxr714hgPuaM9sGszSbTcr0TMOZX7CVNDvIeHaIovlzCWVuNnCdVorwlF
 0HwgBPRYtwzc6rB4RXelRByBKhUeQyaQ3KLK1vM7HN2Iu2UszjDH7Rk4/94RiCmDKnrK
 tTAx480bEZLJ0fYZ5A9KaOkTxftOxlYqbIcLOOQ6l9qjJQDbZQLEBRC4O5Rrlnp4rq15
 AsYCXP14k5fkhniGaIQaj/SLTScvyBa+BVHoK//Q+B90nXfGMhQHrYANaz0umhugt22M
 KGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ts30qW5ZibOfxhwbjhhYDy8BwJIkR/zbeou1xIzV0yU=;
 b=X3LCj39I372MCRO3IN7PmfnQcGsawuBfqwzFyl59Mq3ujEomb7RmAlM/7B6bk/YXw6
 0PXVMF8wPIuXFdlnEa/koBFHK5vPtvrmii4OcXLRE6u2A95/Pt7otKCu7sxpAcGMN4zD
 knUNP6+BcIw5xjVpQ5/lJXDTA6P1qdpgCgGghvxaB+m9yA1tJngAOqHN6qFTvwjHNNac
 MK5RnjCQsHaSD5Ta47ApsGgSVs5Pb/pk2rQjAfdGPU//QCCRa0rMa0w8tOwYkyJeozNA
 wo7OQdsE26T8VDbGGzjw1pGwipcg6RVEQfKMUIR5RMJ0UH03QY7jPYqu8MIZkRd41EvV
 UADw==
X-Gm-Message-State: AFqh2kq3/Va9ApdXmGIBBn2aRh/nAirfQ6kl9UV/ndCXY6mij9FPOstI
 Omi5ZrJp+hvjLB6f+78eaMh58IF1x/9doElY+ok=
X-Google-Smtp-Source: AMrXdXvWbNUk07JZFRsFYcBXDVF/9MwsN3MYlsE8PSykvVJ9f50JOyJEmYPWcVq2qlKzS0QeEigOGc4FdNxSBM1c2Is=
X-Received: by 2002:a05:6808:4387:b0:35b:d93f:cbc4 with SMTP id
 dz7-20020a056808438700b0035bd93fcbc4mr47320oib.96.1673905313271; Mon, 16 Jan
 2023 13:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-2-gpiccoli@igalia.com>
In-Reply-To: <20230116212004.860968-2-gpiccoli@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 16:41:34 -0500
Message-ID: <CADnq5_M6z=BTvcspVsC_5YmZCwEP48e=6nvcr4ck4Q7KR126MA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/amdgpu/vcn: Deduplicate indirect SRAM checking
 code
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Lazar Lijo <Lijo.Lazar@amd.com>, kernel@gpiccoli.net, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Sonny Jiang <sonny.jiang@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 4:20 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Currently both conditionals checked to enable indirect SRAM are
> repeated for all HW/IP models. Let's just simplify it a bit so
> code is more compact and readable.
>
> While at it, add the legacy names as a comment per case block, to
> help whoever is reading the code and doesn't have much experience
> with the name/number mapping.
>
> Cc: James Zhu <James.Zhu@amd.com>
> Cc: Lazar Lijo <Lijo.Lazar@amd.com>
> Cc: Leo Liu <leo.liu@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>
>
> Hi folks, first of all thanks in advance for reviews/comments!
>
> This work is based on agd5f/amd-staging-drm-next branch - there is this
> patch from Mario that refactored the amdgpu_vcn.c, and since it dropped
> the legacy names from the switch cases, I've decided to also include them
> here as comments.
>
> I'm not sure if that's a good idea, feels good for somebody not so
> used to the code read the codenames instead of purely numbers, but
> if you wanna move away from the legacy names for good, lemme know
> and I can rework without these comments.
>
> Cheers,
>
>
> Guilherme
>
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 84 +++++--------------------
>  1 file changed, 16 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 1b1a3c9e1863..1f880e162d9d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -111,78 +111,26 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>                 atomic_set(&adev->vcn.inst[i].dpg_enc_submission_cnt, 0);
>
>         switch (adev->ip_versions[UVD_HWIP][0]) {
> -       case IP_VERSION(1, 0, 0):
> -       case IP_VERSION(1, 0, 1):
> -       case IP_VERSION(2, 5, 0):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(2, 2, 0):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(2, 6, 0):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(2, 0, 0):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(2, 0, 2):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 0, 0):
> -       case IP_VERSION(3, 0, 64):
> -       case IP_VERSION(3, 0, 192):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 0, 2):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 0, 16):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 0, 33):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(3, 1, 1):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> +       case IP_VERSION(1, 0, 0):       /* Raven (1/2) / Picasso */
> +       case IP_VERSION(1, 0, 1):       /* Raven (1/2) / Picasso */
> +       case IP_VERSION(2, 0, 0):       /* Navi10 */
> +       case IP_VERSION(2, 0, 2):       /* Navi12 / Navi14 */
> +       case IP_VERSION(2, 2, 0):       /* Renoir / Green Sardine */
> +       case IP_VERSION(2, 5, 0):       /* Arcturus */
> +       case IP_VERSION(2, 6, 0):       /* Aldebaran */
> +       case IP_VERSION(3, 0, 0):       /* Sienna Cichlid / Navy Flounder */
> +       case IP_VERSION(3, 0, 2):       /* Vangogh */
> +       case IP_VERSION(3, 0, 64):      /* Sienna Cichlid / Navy Flounder */
> +       case IP_VERSION(3, 0, 16):      /* Dimgray Cavefish */
> +       case IP_VERSION(3, 0, 33):      /* Beige Goby */
> +       case IP_VERSION(3, 0, 192):     /* Sienna Cichlid / Navy Flounder */
> +       case IP_VERSION(3, 1, 1):       /* Yellow Carp */
>         case IP_VERSION(3, 1, 2):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> -       case IP_VERSION(4, 0, 0):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                       (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
> +       case IP_VERSION(4, 0, 0):       /* Vega10 */

This comment is incorrect.  Vega10 does not have VCN (it has UVD and VCE).

Alex


Alex

>         case IP_VERSION(4, 0, 2):
> -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                       (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> -                       adev->vcn.indirect_sram = true;
> -               break;
>         case IP_VERSION(4, 0, 4):
>                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> -                       (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> +                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>                         adev->vcn.indirect_sram = true;
>                 break;
>         default:
> --
> 2.39.0
>
