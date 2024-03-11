Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CA87813F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 15:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C64112AB1;
	Mon, 11 Mar 2024 14:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="H3rSomuS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEE6112AB1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710165930;
 bh=2jXOQfIHsqF1hMpI9oiHxsSB4UjdxrTWHKO3nf4FXU8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H3rSomuSaxI4yKG0xtDhTeUhHzQZBoKciAtXHztlBimdgzdPgykG9pX8ZNPmkm6SS
 iumd3poHug/OTMDQz5InDKdSzDYO5emJ4G4iBDbiNhK8MuGgxo136CBHpFKCxQJgZc
 nQEQgwN73ulVCoQvAkq4q6C5AwV1xwNSE+GnLKeVCj/jSAIwwS059OuWeoRblRX1ss
 itBtR78vqymNJ0bm6xWtg8K1BYsvlf1ihpqHx22i3y4Je2mV7Dw3rLihh0BCymseIw
 Zr986rR+ryTqd3wiOYwJehkPWBM6EGP+NOIywZkxYz3LsKMWisPBoOnQjtAnQqK9Q4
 L2r2EXisLz4pw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3DB623780894;
 Mon, 11 Mar 2024 14:05:30 +0000 (UTC)
Date: Mon, 11 Mar 2024 15:05:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH 3/3] drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue
Message-ID: <20240311150528.2941760c@collabora.com>
In-Reply-To: <20240311145939.2f529a3f@collabora.com>
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
 <20240304090812.3941084-4-boris.brezillon@collabora.com>
 <87il1tt4f6.fsf@intel.com> <20240311124634.2ee63052@collabora.com>
 <87frwxt2cb.fsf@intel.com> <20240311125259.6bf317a5@collabora.com>
 <fbaed280-74bb-431c-8bc4-7b0c570a39b3@arm.com>
 <20240311142236.05139059@collabora.com>
 <6bb76bfe-2be8-4724-a5db-34a779e571ad@arm.com>
 <4f4552fe-e2b7-44d0-9d46-448be908472c@arm.com>
 <20240311145837.4254b504@collabora.com>
 <20240311145939.2f529a3f@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Mon, 11 Mar 2024 14:59:39 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Mon, 11 Mar 2024 14:58:37 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>=20
> > On Mon, 11 Mar 2024 13:46:23 +0000
> > Steven Price <steven.price@arm.com> wrote:
> >  =20
> > > On 11/03/2024 13:36, Robin Murphy wrote:   =20
> > > > On 2024-03-11 1:22 pm, Boris Brezillon wrote:     =20
> > > >> On Mon, 11 Mar 2024 13:11:28 +0000
> > > >> Robin Murphy <robin.murphy@arm.com> wrote:
> > > >>     =20
> > > >>> On 2024-03-11 11:52 am, Boris Brezillon wrote:     =20
> > > >>>> On Mon, 11 Mar 2024 13:49:56 +0200
> > > >>>> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > > >>>> =C2=A0=C2=A0     =20
> > > >>>>> On Mon, 11 Mar 2024, Boris Brezillon
> > > >>>>> <boris.brezillon@collabora.com> wrote:     =20
> > > >>>>>> On Mon, 11 Mar 2024 13:05:01 +0200
> > > >>>>>> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > > >>>>>> =C2=A0=C2=A0=C2=A0=C2=A0     =20
> > > >>>>>>> This breaks the config for me:
> > > >>>>>>>
> > > >>>>>>> =C2=A0=C2=A0=C2=A0 SYNC=C2=A0=C2=A0=C2=A0 include/config/auto=
.conf.cmd
> > > >>>>>>> =C2=A0=C2=A0=C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 Makefile
> > > >>>>>>> drivers/iommu/Kconfig:14:error: recursive dependency detected!
> > > >>>>>>> drivers/iommu/Kconfig:14:=C2=A0=C2=A0=C2=A0 symbol IOMMU_SUPP=
ORT is selected by
> > > >>>>>>> DRM_PANTHOR
> > > >>>>>>> drivers/gpu/drm/panthor/Kconfig:3:=C2=A0=C2=A0=C2=A0 symbol D=
RM_PANTHOR depends
> > > >>>>>>> on PM
> > > >>>>>>> kernel/power/Kconfig:183:=C2=A0=C2=A0=C2=A0 symbol PM is sele=
cted by PM_SLEEP
> > > >>>>>>> kernel/power/Kconfig:117:=C2=A0=C2=A0=C2=A0 symbol PM_SLEEP d=
epends on
> > > >>>>>>> HIBERNATE_CALLBACKS
> > > >>>>>>> kernel/power/Kconfig:35:=C2=A0=C2=A0=C2=A0 symbol HIBERNATE_C=
ALLBACKS is
> > > >>>>>>> selected by XEN_SAVE_RESTORE
> > > >>>>>>> arch/x86/xen/Kconfig:67:=C2=A0=C2=A0=C2=A0 symbol XEN_SAVE_RE=
STORE depends on XEN
> > > >>>>>>> arch/x86/xen/Kconfig:6:=C2=A0=C2=A0=C2=A0 symbol XEN depends =
on PARAVIRT
> > > >>>>>>> arch/x86/Kconfig:781:=C2=A0=C2=A0=C2=A0 symbol PARAVIRT is se=
lected by HYPERV
> > > >>>>>>> drivers/hv/Kconfig:5:=C2=A0=C2=A0=C2=A0 symbol HYPERV depends=
 on X86_LOCAL_APIC
> > > >>>>>>> arch/x86/Kconfig:1106:=C2=A0=C2=A0=C2=A0 symbol X86_LOCAL_API=
C depends on
> > > >>>>>>> X86_UP_APIC
> > > >>>>>>> arch/x86/Kconfig:1081:=C2=A0=C2=A0=C2=A0 symbol X86_UP_APIC p=
rompt is visible
> > > >>>>>>> depending on PCI_MSI
> > > >>>>>>> drivers/pci/Kconfig:39:=C2=A0=C2=A0=C2=A0 symbol PCI_MSI is s=
elected by AMD_IOMMU
> > > >>>>>>> drivers/iommu/amd/Kconfig:3:=C2=A0=C2=A0=C2=A0 symbol AMD_IOM=
MU depends on
> > > >>>>>>> IOMMU_SUPPORT     =20
> > > >>>>>>
> > > >>>>>> Uh, I guess we want a "depends on IOMMU_SUPPORT" instead of "s=
elect
> > > >>>>>> IOMMU_SUPPORT" in panthor then.     =20
> > > >>>>>
> > > >>>>> That works for me.     =20
> > > >>>>
> > > >>>> Let's revert the faulty commit first. We'll see if Steve has a
> > > >>>> different solution for the original issue.     =20
> > > >>>
> > > >>> FWIW, the reasoning in the offending commit seems incredibly tenu=
ous.
> > > >>> There are far more practical reasons for building an arm/arm64 ke=
rnel
> > > >>> without PM - for debugging or whatever, and where one may even st=
ill
> > > >>> want a usable GPU, let alone just a non-broken build - than there=
 are
> > > >>> for building this driver for x86. Using pm_ptr() is trivial, and =
if you
> > > >>> want to support COMPILE_TEST then there's really no justifiable e=
xcuse
> > > >>> not to.     =20
> > > >>
> > > >> The problem is not just about using pm_ptr(), but also making sure
> > > >> panthor_device_resume/suspend() are called called in the init/unpl=
ug
> > > >> path when !PM, as I don't think the PM helpers automate that for u=
s. I
> > > >> was just aiming for a simple fix that wouldn't force me to test th=
e !PM
> > > >> case...     =20
> > > > Fair enough, at worst we could always have a runtime check and refu=
se to
> > > > probe in conditions we don't think are worth the bother of implemen=
ting
> > > > fully-functional support for. However if we want to make an argumen=
t for
> > > > only supporting "realistic" configs at build time then that is an
> > > > argument for dropping COMPILE_TEST as well.     =20
> > >=20
> > > Can we just replace the "depends on PM" with "select PM"? In my
> > > (admittedly very limited) testing this works. Otherwise I think we ne=
ed
> > > to bite the bullet and support !PM in some way (maybe just as Robin
> > > suggests with a runtime bail out).   =20
> >=20
> > I won't have time to test it this week, but if someone is interested,
> > here's a diff implementing manual resume/suspend in the init/unplug
> > path:
> >  =20
> > --->8---   =20
>=20
> This time with the diff :-)
>=20
> --->8--- =20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index 69deb8e17778..3d05e7358f0e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -87,6 +87,10 @@ void panthor_device_unplug(struct panthor_device *ptde=
v)
>         pm_runtime_dont_use_autosuspend(ptdev->base.dev);
>         pm_runtime_put_sync_suspend(ptdev->base.dev);
> =20
> +       /* If PM is disabled, we need to call the suspend handler manuall=
y. */
> +       if (!IS_ENABLED(CONFIG_PM))
> +               panthor_device_suspend(ptdev->base.dev);
> +
>         /* Report the unplug operation as done to unblock concurrent
>          * panthor_device_unplug() callers.
>          */
> @@ -218,6 +222,13 @@ int panthor_device_init(struct panthor_device *ptdev)
>         if (ret)
>                 return ret;
> =20
> +       /* If PM is disabled, we need to call panthor_device_resume() man=
ually. */
> +       if (!IS_ENABLED(CONFIG_PM)) {
> +               ret =3D panthor_device_resume(ptdev->base.dev);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         ret =3D panthor_gpu_init(ptdev);
>         if (ret)
>                 goto err_rpm_put;

And I forgot to remove the #ifdef CONFIG_PM in panthor_device.c.

> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index ff484506229f..2ea6a9f436db 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1407,17 +1407,19 @@ static const struct of_device_id dt_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> =20
> +#ifdef CONFIG_PM
>  static DEFINE_RUNTIME_DEV_PM_OPS(panthor_pm_ops,
>                                  panthor_device_suspend,
>                                  panthor_device_resume,
>                                  NULL);
> +#endif
> =20
>  static struct platform_driver panthor_driver =3D {
>         .probe =3D panthor_probe,
>         .remove_new =3D panthor_remove,
>         .driver =3D {
>                 .name =3D "panthor",
> -               .pm =3D &panthor_pm_ops,
> +               .pm =3D pm_ptr(&panthor_pm_ops),
>                 .of_match_table =3D dt_match,
>         },
>  };

