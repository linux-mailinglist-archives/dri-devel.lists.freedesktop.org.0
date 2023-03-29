Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0E36CDA9C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF61610EAC8;
	Wed, 29 Mar 2023 13:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71CB10E4EF;
 Wed, 29 Mar 2023 13:21:37 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id f17so11509805oiw.10;
 Wed, 29 Mar 2023 06:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680096097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AN4onj0tfoK5Q6O1oVBVg+bQsz5PUpzA3Uo6iMlsEc8=;
 b=kAmuv75Mbh9x5VD+EP8bAYyI90l0D+fzGtWHMzIm4WF1jGsAzz4gomCVCOPqa/Ylzo
 9Qo4RZs0IcVMWBzztLxNmdcGQ+0JHvKI5hnpB3he/SrcLYziG7l0GjU+aodoVyeq6zQT
 79Dc6MmRQIrxesPxKYSV69D/JEMuBthe0OsDLereUysIfnH6mhb8iW4syqHgf7BWz0RS
 +asGHTMCktyUvSWwfBjD1aiwwP0VprJorDfckXuhQX6NmOSg/HA/t8KX0SeaoTYbwxKq
 USIoJyj91421SCax4cz7gUpgKB2eTBUyEm7Pd3MN5SrH7K/KZRgSs+6RAHfdlBRpstgG
 8GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680096097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AN4onj0tfoK5Q6O1oVBVg+bQsz5PUpzA3Uo6iMlsEc8=;
 b=Iudmq7qW4y60ize9EOAG7cH7vxX4vDCSVOJJR3Fp7GVbexnpRFrKYfYW7Jp92UTO+6
 j69mTeFWCfWUfi9MUZ9xxt4Hw0KZ/IoZPsptyh6QT8N+qS8H3Bh0bXQwkTKnRE6CfHqG
 eAnPASesM1LDtzb0t2w/NmG2FjcrV9RzUa45f8l2biRNGeJq28e3pAWBVnheW8D2lnOF
 Qg93VfdQvJ8u4stgye4KD+tcAXVQrARp+tKrUs7nKyVfoRX3utIt3Fe7JJYO8RMIQdEG
 XaF2t8OvEL830y2jytb/Z0VlsBjlyJa7zWETV0uKzid4swn1ZXaGY5M8cK/E8T9dNBPr
 W4pQ==
X-Gm-Message-State: AO0yUKV3YldLbe/wfeXkdJ/bS8qTh1D0CvKaUeAQsDAbDLIE6jHoEP2v
 H+t6vuvOuLGaG56Boud8KWMiHT1DFQSX9Ouufr4=
X-Google-Smtp-Source: AK7set8zNXt1YBBilZfDmMESfQDt/X/2cyYZ8iG0ZKRKIRkrjiaH1Icif49X/QOsSow1GOWLcb3ZrOImiZrmzpchNLk=
X-Received: by 2002:aca:1b0a:0:b0:384:893:a924 with SMTP id
 b10-20020aca1b0a000000b003840893a924mr6053079oib.3.1680096096832; Wed, 29 Mar
 2023 06:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
In-Reply-To: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Mar 2023 09:21:25 -0400
Message-ID: <CADnq5_MMg4XD3QK72ZfLYvq02hYrX2aApNT2JUEAvQGvBP+NeQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: Reset GPU on S0ix when device supports
 BOCO
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Tim Huang <tim.huang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Guchun Chen <guchun.chen@amd.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, Jiansong Chen <Jiansong.Chen@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Evan Quan <evan.quan@amd.com>,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 6:00=E2=80=AFAM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> When the power is lost due to ACPI power resources being turned off, the
> driver should reset the GPU so it can work anew.
>
> First, _PR3 support of the hierarchy needs to be found correctly. Since
> the GPU on some discrete GFX cards is behind a PCIe switch, checking the
> _PR3 on downstream port alone is not enough, as the _PR3 can associate
> to the root port above the PCIe switch.
>
> Once the _PR3 is found and BOCO support is correctly marked, use that
> information to inform the GPU should be reset. This solves an issue that
> system freeze on a Intel ADL desktop that uses S0ix for sleep and D3cold
> is supported for the GFX slot.

I don't think we need to reset the GPU.  If the power is turned off, a
reset shouldn't be necessary. The reset is only necessary when the
power is not turned off to put the GPU into a known good state.  It
should be in that state already if the power is turn off.  It sounds
like the device is not actually getting powered off.

Alex

>
> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  7 ++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 12 +++++-------
>  3 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index 60b1857f469e..407456ac0e84 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -987,6 +987,9 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_devic=
e *adev)
>         if (amdgpu_sriov_vf(adev))
>                 return false;
>
> +       if (amdgpu_device_supports_boco(adev_to_drm(adev)))
> +               return true;
> +
>  #if IS_ENABLED(CONFIG_SUSPEND)
>         return pm_suspend_target_state !=3D PM_SUSPEND_TO_IDLE;
>  #else
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index f5658359ff5c..d56b7a2bafa6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2181,7 +2181,12 @@ static int amdgpu_device_ip_early_init(struct amdg=
pu_device *adev)
>
>         if (!(adev->flags & AMD_IS_APU)) {
>                 parent =3D pci_upstream_bridge(adev->pdev);
> -               adev->has_pr3 =3D parent ? pci_pr3_present(parent) : fals=
e;
> +               do {
> +                       if (pci_pr3_present(parent)) {
> +                               adev->has_pr3 =3D true;
> +                               break;
> +                       }
> +               } while ((parent =3D pci_upstream_bridge(parent)));
>         }
>
>         amdgpu_amdkfd_device_probe(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index ba5def374368..5d81fcac4b0a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2415,10 +2415,11 @@ static int amdgpu_pmops_suspend(struct device *de=
v)
>         struct drm_device *drm_dev =3D dev_get_drvdata(dev);
>         struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
>
> -       if (amdgpu_acpi_is_s0ix_active(adev))
> -               adev->in_s0ix =3D true;
> -       else if (amdgpu_acpi_is_s3_active(adev))
> +       if (amdgpu_acpi_is_s3_active(adev) ||
> +           amdgpu_device_supports_boco(drm_dev))
>                 adev->in_s3 =3D true;
> +       else if (amdgpu_acpi_is_s0ix_active(adev))
> +               adev->in_s0ix =3D true;
>         if (!adev->in_s0ix && !adev->in_s3)
>                 return 0;
>         return amdgpu_device_suspend(drm_dev, true);
> @@ -2449,10 +2450,7 @@ static int amdgpu_pmops_resume(struct device *dev)
>                 adev->no_hw_access =3D true;
>
>         r =3D amdgpu_device_resume(drm_dev, true);
> -       if (amdgpu_acpi_is_s0ix_active(adev))
> -               adev->in_s0ix =3D false;
> -       else
> -               adev->in_s3 =3D false;
> +       adev->in_s0ix =3D adev->in_s3 =3D false;
>         return r;
>  }
>
> --
> 2.34.1
>
