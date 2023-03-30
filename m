Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1946B6D0672
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 15:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAFC10E423;
	Thu, 30 Mar 2023 13:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EEB10E408;
 Thu, 30 Mar 2023 13:22:41 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id bi31so14101973oib.9;
 Thu, 30 Mar 2023 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680182561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G9YMpuSttM4A9nULCMBhiq2+uydHNy9WNmU1ZG++oTM=;
 b=blZZRDRBNT5kYMjCC85ZeQpLeFdPOaXatuCk4NyXH1yuA9j9xns+8uFcbTyf6WGsd7
 BDclarMJIrma70T6OYfrbTKiaJktRYiWtH2IupaFo26teMxv1+nv1CU/Je+ECtaGqleu
 +T7GquzfQQRKKcFfc/Ta8p8NIkr3Lu11J9EmmwLDKz5MpdzSkh7V3T4ZLjUNXVqZcOpW
 hbhyN50tsxwj4fL3Gbsbt97t0hVUNuwNegP1RVM2DEowXcZxRcWoHTZXaFDnBaj2MwW2
 z0Ko4Al/zR8CxIwAqfIsUfpt4efg4XRPVPjgcZJRTCvxjQcjicKRXrNb544sZnHxOHR9
 nAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G9YMpuSttM4A9nULCMBhiq2+uydHNy9WNmU1ZG++oTM=;
 b=TVXAm4BvfkzkM/sKLEw/0OetduU6Th3+dKm7bhP5amsakGwWe0SE6gozXvQ/ppb9Z+
 kgTE/cr7BA71UeeVsVf8UQcUsSo11cWh1q7U90jebjegxDpggF73SD4zvbsBnQ1KG+Sf
 JwgkRmVUIT502u26X01Pt/ilbIozStVWUSkxBTVJjFTAc30YUB+xrZ+2YC1AECGG7pon
 yViXPr46UmEOPWdv9ahi2KZ3qWvncfX5ifaiRfgji5JBLgYHB2u3PkLQak9AabS+vZ8L
 tarbHdlcN7c89+DKzSYv0d+rffq2iLPgq+CzyrCwvVCXM3u9ZYW6jMbT6t2tuSBefkDa
 zr4g==
X-Gm-Message-State: AAQBX9cyH+gORyH5jGr9tOyN6FVg34oGIq3AjnDEdyT0obbKg0SBsZZG
 7wtJ6p96iKreiaO4sAjm5roQT/5rwRt3WBNtGdQ=
X-Google-Smtp-Source: AKy350bR4j3tWoutyh4OrqpV7ceW0UP7GuJA3//rLD7fDA/S8emKV6+mvo+u+TtelRGzGKE8vVlQiTelIZxHtDX1mh0=
X-Received: by 2002:a54:4019:0:b0:386:a2d0:2814 with SMTP id
 x25-20020a544019000000b00386a2d02814mr2811957oie.4.1680182560801; Thu, 30 Mar
 2023 06:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
 <76853776-ddfd-2fbc-a209-ca4f77faa481@amd.com>
 <CAAd53p7sgowhaFS1b7MM0F0kf14sWf6jbF9T__=4BAMM8bnz3A@mail.gmail.com>
In-Reply-To: <CAAd53p7sgowhaFS1b7MM0F0kf14sWf6jbF9T__=4BAMM8bnz3A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Mar 2023 09:22:29 -0400
Message-ID: <CADnq5_PicHGZKH5f23btP9srMQ5iKWDhfAk0Gnr27X92C-rFYg@mail.gmail.com>
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

On Wed, Mar 29, 2023 at 11:36=E2=80=AFPM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Wed, Mar 29, 2023 at 9:23=E2=80=AFPM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> >
> >
> > On 3/29/23 04:59, Kai-Heng Feng wrote:
> > > When the power is lost due to ACPI power resources being turned off, =
the
> > > driver should reset the GPU so it can work anew.
> > >
> > > First, _PR3 support of the hierarchy needs to be found correctly. Sin=
ce
> > > the GPU on some discrete GFX cards is behind a PCIe switch, checking =
the
> > > _PR3 on downstream port alone is not enough, as the _PR3 can associat=
e
> > > to the root port above the PCIe switch.
> >
> > I think this should be split into two commits:
> >
> > * One of them to look at _PR3 further up in hierarchy to fix indication
> > for BOCO support.
>
> Yes, this part can be split up.
>
> >
> > * One to adjust policy for whether to reset
>
> IIUC, the GPU only needs to be reset when the power status isn't certain?
>
> Assuming power resources in _PR3 are really disabled, GPU is already
> reset by itself. That means reset shouldn't be necessary for D3cold,
> am I understanding it correctly?

Right, if D3cold actually works, then no reset is necessary.

>
> However, this is a desktop plugged with GFX card that has external
> power, does that assumption still stand? Perform resetting on D3cold
> can cover this scenario.

BOCO is generally only available on laptops and all-in-one systems
where the dGPU is integrated into the platform.  Power to the dGPU is
controlled by a GPIO which is toggled by the ACPI _PR3 method for the
device.  There is an ATPX method on all platforms which support BOCO.
Since this is an AIB in a desktop system, I doubt it actually supports
D3Cold.  For desktop systems, we have what we call BACO where the
driver controls power to everything on the GPU except the bus
interface.  In the BACO case, we can turn off the GPU, but the device
still shows up on the PCI bus.  For BOCO, the device is completely
powered down and disappears from the PCI bus.

Alex

>
> >
> >
> > > Once the _PR3 is found and BOCO support is correctly marked, use that
> > > information to inform the GPU should be reset. This solves an issue t=
hat
> > > system freeze on a Intel ADL desktop that uses S0ix for sleep and D3c=
old
> > > is supported for the GFX slot.
> >
> > I'm worried this is still papering over an underlying issue with L0s
> > handling on ALD + Navi1x/Navi2x.
>
> Is it possible to get the ASIC's ASPM parameter under Windows? Knowing
> the difference can be useful.
>
> >
> > Also, what about runtime suspend?  If you unplug the monitor from this
> > dGPU and interact with it over SSH it should go into runtime suspend.
> >
> > Is it working properly for that case now?
>
> Thanks for the tip. Runtime resume doesn't work at all:
> [ 1087.601631] pcieport 0000:00:01.0: power state changed by ACPI to D0
> [ 1087.613820] pcieport 0000:00:01.0: restoring config space at offset
> 0x2c (was 0x43, writing 0x43)
> [ 1087.613835] pcieport 0000:00:01.0: restoring config space at offset
> 0x28 (was 0x41, writing 0x41)
> [ 1087.613841] pcieport 0000:00:01.0: restoring config space at offset
> 0x24 (was 0xfff10001, writing 0xfff10001)
> [ 1087.613978] pcieport 0000:00:01.0: PME# disabled
> [ 1087.613984] pcieport 0000:00:01.0: waiting 100 ms for downstream
> link, after activation
> [ 1089.330956] pcieport 0000:01:00.0: not ready 1023ms after resume; givi=
ng up
> [ 1089.373036] pcieport 0000:01:00.0: Unable to change power state
> from D3cold to D0, device inaccessible
>
> After a short while the whole system froze.
>
> So the upstream port of GFX's PCIe switch cannot be powered on again.
>
> Kai-Heng
>
> >
> > >
> > > Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> > > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> > > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |  3 +++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  7 ++++++-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 12 +++++-------
> > >   3 files changed, 14 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_acpi.c
> > > index 60b1857f469e..407456ac0e84 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > @@ -987,6 +987,9 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_d=
evice *adev)
> > >       if (amdgpu_sriov_vf(adev))
> > >               return false;
> > >
> > > +     if (amdgpu_device_supports_boco(adev_to_drm(adev)))
> > > +             return true;
> > > +
> > >   #if IS_ENABLED(CONFIG_SUSPEND)
> > >       return pm_suspend_target_state !=3D PM_SUSPEND_TO_IDLE;
> > >   #else
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_device.c
> > > index f5658359ff5c..d56b7a2bafa6 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -2181,7 +2181,12 @@ static int amdgpu_device_ip_early_init(struct =
amdgpu_device *adev)
> > >
> > >       if (!(adev->flags & AMD_IS_APU)) {
> > >               parent =3D pci_upstream_bridge(adev->pdev);
> > > -             adev->has_pr3 =3D parent ? pci_pr3_present(parent) : fa=
lse;
> > > +             do {
> > > +                     if (pci_pr3_present(parent)) {
> > > +                             adev->has_pr3 =3D true;
> > > +                             break;
> > > +                     }
> > > +             } while ((parent =3D pci_upstream_bridge(parent)));
> > >       }
> > >
> > >       amdgpu_amdkfd_device_probe(adev);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_drv.c
> > > index ba5def374368..5d81fcac4b0a 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > @@ -2415,10 +2415,11 @@ static int amdgpu_pmops_suspend(struct device=
 *dev)
> > >       struct drm_device *drm_dev =3D dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
> > >
> > > -     if (amdgpu_acpi_is_s0ix_active(adev))
> > > -             adev->in_s0ix =3D true;
> > > -     else if (amdgpu_acpi_is_s3_active(adev))
> > > +     if (amdgpu_acpi_is_s3_active(adev) ||
> > > +         amdgpu_device_supports_boco(drm_dev))
> > >               adev->in_s3 =3D true;
> > > +     else if (amdgpu_acpi_is_s0ix_active(adev))
> > > +             adev->in_s0ix =3D true;
> > >       if (!adev->in_s0ix && !adev->in_s3)
> > >               return 0;
> > >       return amdgpu_device_suspend(drm_dev, true);
> > > @@ -2449,10 +2450,7 @@ static int amdgpu_pmops_resume(struct device *=
dev)
> > >               adev->no_hw_access =3D true;
> > >
> > >       r =3D amdgpu_device_resume(drm_dev, true);
> > > -     if (amdgpu_acpi_is_s0ix_active(adev))
> > > -             adev->in_s0ix =3D false;
> > > -     else
> > > -             adev->in_s3 =3D false;
> > > +     adev->in_s0ix =3D adev->in_s3 =3D false;
> > >       return r;
> > >   }
> > >
