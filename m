Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF3E7E2C46
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5AF10E3C3;
	Mon,  6 Nov 2023 18:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B8010E3C1;
 Mon,  6 Nov 2023 18:48:50 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6ce532451c7so2533811a34.2; 
 Mon, 06 Nov 2023 10:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699296530; x=1699901330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GEU/T0YzjOtkbVZizp15U02rtKoeqg1sHvW0/B5DtdA=;
 b=PPIlZ4loYEzfk4jIE79qoCSqsxpEysAIj+gXkZ2PA06Pyo0vjDq6A5nkvHBTlYw2FZ
 swcW9khfq8i9a+obpaXx8rhuFREPLkGzQdpBfbm/IoL5kRhIkwL5tcxFRM+rBrqdclor
 Aj6iuhecxqIkvnMeGrT+tAn+OFVvIN5GS4ZbYQII33guSoJrZNSnnquLMHhwKGzGGNCp
 eI1XLQrMjmyt7TXWewjBTK67GDVicNmCbZtGUFuLC3ib0UYVlwumVFzbFLaWcea0KMga
 aO2ZOcIL9wKrbTMlu7/nLLp8OibFED3ThHKs/EK6/efbe0HMM/5bX7USkkoSuoE6CuXK
 NKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699296530; x=1699901330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GEU/T0YzjOtkbVZizp15U02rtKoeqg1sHvW0/B5DtdA=;
 b=oGjTBxfwmC2gMbRpFJ2mpAq+ExKFlibLS2ITFQKh19AIJifHiXH/uClmvKwGeazLaF
 SDwsbVmyDQt3Tb+Pp1frXVivR3nfnNL8IqQ2QuzNs2M7mTeE2vgcPw4wSMWGq5ZVb6iI
 rBVs44oO/06ZWQze3QFMb+kCBr5Z3SYw+39hPxHou3EpFuYt/mYpyDn8WyYPi33ExWaZ
 z4sLCcBXEyc2/vZt4Uz4eTsdEo8K9JM46UFDtryvugARW0IXFNu9h+Huh55lOU3w3SCu
 bOGRaTZZ3JtN8ZWHkzdJCc38aKYewM52Bp1oakgfcsiFdLM66eZBsTLHwW4p+paFCUyV
 DASQ==
X-Gm-Message-State: AOJu0YzPp8nYyXmfurCknRhaidJxUDO7DTMBtQahpqwthwyOM7vxXz6F
 72Mn/lPuooPkhfg4w4nM5ve44MC8DrP5v9qLiH0=
X-Google-Smtp-Source: AGHT+IGx9i2xhfecbXKM+Crwv24haeMNbJhw1G26AUXpr7Jj7oVxHkIyehbuuwd/4M7eEpgYPDo+SlUNw03C3ipL72c=
X-Received: by 2002:a05:6870:ff84:b0:1e9:b537:51ef with SMTP id
 qp4-20020a056870ff8400b001e9b53751efmr554623oab.31.1699296529538; Mon, 06 Nov
 2023 10:48:49 -0800 (PST)
MIME-Version: 1.0
References: <87wmuwo7i3.fsf@gentoo.org>
 <20231105160652.374422-1-sam@gentoo.org>
In-Reply-To: <20231105160652.374422-1-sam@gentoo.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Nov 2023 13:48:38 -0500
Message-ID: <CADnq5_OvEsUD5wcvk8YtvHO+=89WJra4YFRoKe8JANvM_R9AKg@mail.gmail.com>
Subject: Re: [PATCH] amdgpu: Adjust kmalloc_array calls for new -Walloc-size
To: Sam James <sam@gentoo.org>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Nov 5, 2023 at 11:07=E2=80=AFAM Sam James <sam@gentoo.org> wrote:
>
> GCC 14 introduces a new -Walloc-size included in -Wextra which errors out
> on various files in drivers/gpu/drm/amd/amdgpu like:
> ```
> amdgpu_amdkfd_gfx_v8.c:241:15: error: allocation of insufficient size =E2=
=80=984=E2=80=99 for type =E2=80=98uint32_t[2]=E2=80=99 {aka =E2=80=98unsig=
ned int[2]'} with size =E2=80=988=E2=80=99 [-Werror=3Dalloc-size]
> ```
>
> This is because each HQD_N_REGS is actually a uint32_t[2]. Move the * 2 t=
o
> the size argument so GCC sees we're allocating enough.
>
> Originally did 'sizeof(uint32_t) * 2' for the size but a friend suggested
> 'sizeof(**dump)' better communicates the intent.
>
> Link: https://lore.kernel.org/all/87wmuwo7i3.fsf@gentoo.org/
> Signed-off-by: Sam James <sam@gentoo.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c   | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c   | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c   | 4 ++--
>  5 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/driver=
s/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 625db444df1c..0ba15dcbe4e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -200,7 +200,7 @@ int kgd_arcturus_hqd_sdma_dump(struct amdgpu_device *=
adev,
>  #undef HQD_N_REGS
>  #define HQD_N_REGS (19+6+7+10)
>
> -       *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KER=
NEL);
> +       *dump =3D kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>         if (*dump =3D=3D NULL)
>                 return -ENOMEM;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c b/driver=
s/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
> index 490c8f5ddb60..ca7238b5535b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
> @@ -141,7 +141,7 @@ static int kgd_gfx_v9_4_3_hqd_sdma_dump(struct amdgpu=
_device *adev,
>                 (*dump)[i++][1] =3D RREG32(addr);         \
>         } while (0)
>
> -       *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KER=
NEL);
> +       *dump =3D kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>         if (*dump =3D=3D NULL)
>                 return -ENOMEM;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
> index 6bf448ab3dff..ca4a6b82817f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
> @@ -214,7 +214,7 @@ static int kgd_hqd_dump(struct amdgpu_device *adev,
>                 (*dump)[i++][1] =3D RREG32(addr);         \
>         } while (0)
>
> -       *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KER=
NEL);
> +       *dump =3D kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>         if (*dump =3D=3D NULL)
>                 return -ENOMEM;
>
> @@ -301,7 +301,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *ad=
ev,
>  #undef HQD_N_REGS
>  #define HQD_N_REGS (19+4)
>
> -       *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KER=
NEL);
> +       *dump =3D kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>         if (*dump =3D=3D NULL)
>                 return -ENOMEM;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
> index cd06e4a6d1da..0f3e2944edd7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
> @@ -238,7 +238,7 @@ static int kgd_hqd_dump(struct amdgpu_device *adev,
>                 (*dump)[i++][1] =3D RREG32(addr);         \
>         } while (0)
>
> -       *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KER=
NEL);
> +       *dump =3D kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>         if (*dump =3D=3D NULL)
>                 return -ENOMEM;
>
> @@ -324,7 +324,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *ad=
ev,
>  #undef HQD_N_REGS
>  #define HQD_N_REGS (19+4+2+3+7)
>
> -       *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KER=
NEL);
> +       *dump =3D kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>         if (*dump =3D=3D NULL)
>                 return -ENOMEM;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index 51011e8ee90d..a3355b90aac5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -365,7 +365,7 @@ int kgd_gfx_v9_hqd_dump(struct amdgpu_device *adev,
>                 (*dump)[i++][1] =3D RREG32(addr);         \
>         } while (0)
>
> -       *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KER=
NEL);
> +       *dump =3D kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>         if (*dump =3D=3D NULL)
>                 return -ENOMEM;
>
> @@ -462,7 +462,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *ad=
ev,
>  #undef HQD_N_REGS
>  #define HQD_N_REGS (19+6+7+10)
>
> -       *dump =3D kmalloc_array(HQD_N_REGS * 2, sizeof(uint32_t), GFP_KER=
NEL);
> +       *dump =3D kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>         if (*dump =3D=3D NULL)
>                 return -ENOMEM;
>
> --
> 2.42.1
>
