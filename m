Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C425C77CF91
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 17:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDE310E19F;
	Tue, 15 Aug 2023 15:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D905510E194;
 Tue, 15 Aug 2023 15:50:16 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1c4d67f493bso1869727fac.2; 
 Tue, 15 Aug 2023 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692114616; x=1692719416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AVuBwJh4e/PJsRX9uAJCAxNUSRGi87vXGCf9LVu/RZI=;
 b=l3+v0arNVlZh6xKCSEAle7gwWilV7bK3j2wrYSbZVr04kMpHxTqsCnZRoWoukqnCnC
 1MRXCZ5nD4dHr4sWev1L+/ppIWlewwToWwYT6/WRiwCmP/XVgSIaEzb8CepIT9Aqjd7H
 5M00zyBo1wXrovalLFsg/mqKAweK4cUBFUkzWSlT7bcXZATmJvNGSAKufNqhnVciD0uc
 RYXAiBorG/4StHafZLNn7eemP+BAtYgfSvnMlsy6FfSdKkcJVZXmn8DL0VZhL5MD+b0A
 SdyRbRDT7ReMwIBkzmgSbmKkJuj9I0eupsWB7kjs6L2LscV0icsjt0Fl8eoikx93qVWN
 sNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692114616; x=1692719416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AVuBwJh4e/PJsRX9uAJCAxNUSRGi87vXGCf9LVu/RZI=;
 b=Uuof9qAQrIyMJaVxEOPMVWBoMOirfKC53OTzyiRn0hpqGOoCvAKMS7k0zb6IXazOzn
 IBojkF6TJhW11KjlVLIH+r/S2x20dlqj4W3Xc/V74b30O0UL4OsK9uv/G3gqxzszIdXp
 wFNZ8Mau5GRB9itwBjJw7ISRJPJNPwDynqwJqUoNFbWW7G4NQB23ryRrze2rGeF7tXFp
 fvxtYxC5lMDZIsUPMqxUBisjdxP1EmREy3wsEJmG90bybte2+rQLUlexNT2RJyTjFLeq
 EHU8icyce91BxdR3uKFtr9V54YcmtXa/6lCU82qczp1M8ltP8CkAKMf0lcypRXHsysxl
 NlIg==
X-Gm-Message-State: AOJu0YwMruH6pMCZ2LYXDYNi/aaH1opDlyPy9Ug7xsWhMK4Hnri/9NIN
 F13Y2AUXiSBnujxs8s6uJcdVt70oViEEIR/YfVs=
X-Google-Smtp-Source: AGHT+IHnfanJXW9hOJVO0LHdf7NOx4OjrsIyG1aeMXAi9KSDW4x3gIykJjmw9TK435u51yUPEFMT1UKL4QlqQgtdoWE=
X-Received: by 2002:a05:6870:638b:b0:1ba:c3a2:fb71 with SMTP id
 t11-20020a056870638b00b001bac3a2fb71mr13551780oap.31.1692114616012; Tue, 15
 Aug 2023 08:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230815065445.25576-1-hongao@uniontech.com>
In-Reply-To: <20230815065445.25576-1-hongao@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Aug 2023 11:50:04 -0400
Message-ID: <CADnq5_N8nHV5ub0qf6ihU=+QKXOFfM4AnWbYmWf=EG8SbJXa8A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gmc6: fix in case the PCI BAR is larger than
 the actual amount of vram
To: hongao <hongao@uniontech.com>
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
Cc: Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, lijo.lazar@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mario.limonciello@amd.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 15, 2023 at 3:13=E2=80=AFAM hongao <hongao@uniontech.com> wrote=
:
>
> [why]
> limit visible_vram_size to real_vram_size in case
> the PCI BAR is larger than the actual amount of vram.
>
> Signed-off-by: hongao <hongao@uniontech.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/gmc_v6_0.c
> index b7dad4e67813..c0de7496bfd1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> @@ -320,6 +320,8 @@ static int gmc_v6_0_mc_init(struct amdgpu_device *ade=
v)
>         adev->gmc.aper_base =3D pci_resource_start(adev->pdev, 0);
>         adev->gmc.aper_size =3D pci_resource_len(adev->pdev, 0);
>         adev->gmc.visible_vram_size =3D adev->gmc.aper_size;
> +       if (adev->gmc.visible_vram_size > adev->gmc.real_vram_size)
> +               adev->gmc.visible_vram_size =3D adev->gmc.real_vram_size;
>
>         /* set the gart size */
>         if (amdgpu_gart_size =3D=3D -1) {
> --
> 2.20.1
>
