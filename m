Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6386CF909
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 04:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5E210ECB1;
	Thu, 30 Mar 2023 02:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C40310E0AB;
 Thu, 30 Mar 2023 02:09:22 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso9282117oti.8; 
 Wed, 29 Mar 2023 19:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680142101;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sy5NzJg49ItAmdfPzDIPNFNHG8KPHe+y/70Sz4C8t/Q=;
 b=dj3pDmzX9esXH3m186tk5BDhMUS8uTz/RMb68iBmqLeFXMlrZC8Gv3BI4YtClR8Mbj
 7Bt7l37n/4trmlFwnRIXUoFQKm/hkLnRiko6+7cGnGeWoF9HrjoEC/QtbwnT5oHL2BjL
 8iAkbDrCAU9nbHQ5egrseqIliBqu1Y/ZAOSzeIKjFKiuGSS5rIb7qe4SFPRw+cVEdEIh
 /5ieJwpMHhDBlPXtqGBmrEuOPCvEOQYgv5tvIPPfPyCKUtD+o56YaphvhMEVUFOGGl/T
 OkvBRVazGT5KXzoKD34qjOfcTqxAeDedp71q1z6UcTS0Dl3GiZpiky+KnhNYWG/F5kUK
 1eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680142101;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sy5NzJg49ItAmdfPzDIPNFNHG8KPHe+y/70Sz4C8t/Q=;
 b=dLvS/tXldcJ7g2FwsrrW1mXACgKsJ4cCnYzs5cmDNq9kge9TzQgpNgFpFUzfCy0V99
 hi3PXLEPMd2rAMG8UmFeKkET2dEqEKbRvavjbvt5Km1KGN0HxJcW213pTQuNwA0Cps4L
 glYtnPg3Z1d+6mbt3gz7OOOEKaaZk1k7VHvpXZB5T7pOC7jYc7iR36Z0A3XK28grr9qG
 wKwfjFMwqEBx7cjwNO393+StV/zizj9E5SPfga+Z1VtCiEq1fy2jMLvYAN1QbvCgQZg4
 Lr4cp5a21cf6+WrUTQOcuIKFsfJQHA2J/pMkq5QSEvI/Ce1N8b8XWM6Po+ubJ3ej7RGx
 x2fQ==
X-Gm-Message-State: AO0yUKXSv66jbx897kZNDcXpB0viM9CZJNDqWgb4pliIv690GCfDuIkm
 qM0HvsrWJQc0cMA+jqZe7BunBaFWPW9TtHEhvNM=
X-Google-Smtp-Source: AKy350bVDHc7UaJ/spwtoiE3Jw+p6CVer0KscCfBXzldVTkp5JZ22BVY8g0xOKVIkl2XVb9Y4tYKI78F/z4fnFtC5XM=
X-Received: by 2002:a05:6830:1bed:b0:69f:882:cdb2 with SMTP id
 k13-20020a0568301bed00b0069f0882cdb2mr7034850otb.3.1680142101284; Wed, 29 Mar
 2023 19:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
 <CADnq5_MMg4XD3QK72ZfLYvq02hYrX2aApNT2JUEAvQGvBP+NeQ@mail.gmail.com>
 <CAAd53p5A4Rxs0FHXzkgP9sXe=5_mWjfkDeROBT2k71PYKVKTwQ@mail.gmail.com>
In-Reply-To: <CAAd53p5A4Rxs0FHXzkgP9sXe=5_mWjfkDeROBT2k71PYKVKTwQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Mar 2023 22:08:09 -0400
Message-ID: <CADnq5_NdqjUygZrbhpO0C4sKpDKYSpSn2y1VEQnC=svEGTveKQ@mail.gmail.com>
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

On Wed, Mar 29, 2023 at 8:49=E2=80=AFPM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Wed, Mar 29, 2023 at 9:21=E2=80=AFPM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > On Wed, Mar 29, 2023 at 6:00=E2=80=AFAM Kai-Heng Feng
> > <kai.heng.feng@canonical.com> wrote:
> > >
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
> > >
> > > Once the _PR3 is found and BOCO support is correctly marked, use that
> > > information to inform the GPU should be reset. This solves an issue t=
hat
> > > system freeze on a Intel ADL desktop that uses S0ix for sleep and D3c=
old
> > > is supported for the GFX slot.
> >
> > I don't think we need to reset the GPU.  If the power is turned off, a
> > reset shouldn't be necessary. The reset is only necessary when the
> > power is not turned off to put the GPU into a known good state.  It
> > should be in that state already if the power is turn off.  It sounds
> > like the device is not actually getting powered off.
>
> I had the impression that the GPU gets reset because S3 turned the
> power rail off.
>
> So the actual intention for GPU reset is because S3 doesn't guarantee
> the power is being turned off?

For S4, the reset in freeze is there because once the boot kernel
transitions to the hibernated kernel, we need the reset to bring the
GPU back to a known state.  On dGPUs at least there are some engines
that can only be initialized once and then require a reset to be
initialized again.  The one in suspend was originally there to deal
with aborted suspends where we'd need to reset the GPU for the same
reason as S4.  However, it no longer really serves much purpose since
it got moved to noirq and it could probably be dropped.

Alex


>
> Kai-Heng
>
> >
> > Alex
> >
> > >
> > > Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> > > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> > > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |  3 +++
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  7 ++++++-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 12 +++++-------
> > >  3 files changed, 14 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_acpi.c
> > > index 60b1857f469e..407456ac0e84 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > @@ -987,6 +987,9 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_d=
evice *adev)
> > >         if (amdgpu_sriov_vf(adev))
> > >                 return false;
> > >
> > > +       if (amdgpu_device_supports_boco(adev_to_drm(adev)))
> > > +               return true;
> > > +
> > >  #if IS_ENABLED(CONFIG_SUSPEND)
> > >         return pm_suspend_target_state !=3D PM_SUSPEND_TO_IDLE;
> > >  #else
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_device.c
> > > index f5658359ff5c..d56b7a2bafa6 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -2181,7 +2181,12 @@ static int amdgpu_device_ip_early_init(struct =
amdgpu_device *adev)
> > >
> > >         if (!(adev->flags & AMD_IS_APU)) {
> > >                 parent =3D pci_upstream_bridge(adev->pdev);
> > > -               adev->has_pr3 =3D parent ? pci_pr3_present(parent) : =
false;
> > > +               do {
> > > +                       if (pci_pr3_present(parent)) {
> > > +                               adev->has_pr3 =3D true;
> > > +                               break;
> > > +                       }
> > > +               } while ((parent =3D pci_upstream_bridge(parent)));
> > >         }
> > >
> > >         amdgpu_amdkfd_device_probe(adev);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_drv.c
> > > index ba5def374368..5d81fcac4b0a 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > @@ -2415,10 +2415,11 @@ static int amdgpu_pmops_suspend(struct device=
 *dev)
> > >         struct drm_device *drm_dev =3D dev_get_drvdata(dev);
> > >         struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
> > >
> > > -       if (amdgpu_acpi_is_s0ix_active(adev))
> > > -               adev->in_s0ix =3D true;
> > > -       else if (amdgpu_acpi_is_s3_active(adev))
> > > +       if (amdgpu_acpi_is_s3_active(adev) ||
> > > +           amdgpu_device_supports_boco(drm_dev))
> > >                 adev->in_s3 =3D true;
> > > +       else if (amdgpu_acpi_is_s0ix_active(adev))
> > > +               adev->in_s0ix =3D true;
> > >         if (!adev->in_s0ix && !adev->in_s3)
> > >                 return 0;
> > >         return amdgpu_device_suspend(drm_dev, true);
> > > @@ -2449,10 +2450,7 @@ static int amdgpu_pmops_resume(struct device *=
dev)
> > >                 adev->no_hw_access =3D true;
> > >
> > >         r =3D amdgpu_device_resume(drm_dev, true);
> > > -       if (amdgpu_acpi_is_s0ix_active(adev))
> > > -               adev->in_s0ix =3D false;
> > > -       else
> > > -               adev->in_s3 =3D false;
> > > +       adev->in_s0ix =3D adev->in_s3 =3D false;
> > >         return r;
> > >  }
> > >
> > > --
> > > 2.34.1
> > >
