Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB9F878118
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 14:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF23D112A9B;
	Mon, 11 Mar 2024 13:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="K/xqdkwW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD70112A9B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710165519;
 bh=NiYkvyfC72lwufrYqaPNIEL9beQzGxj4o/JangviqKw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K/xqdkwWa1sclPX6R88X1fgpCfzk3gUacWIh4IE/qRRuY24Tzh4zJ5SNgUC7TkUp2
 1miKeWg44FnmHwgGb5kmL3zA5fi6eH01nU9ZafPjIZ2BBQQZwQASvZ9jYayyjdYpXT
 WpY7APn7Nujnup/1Cey8enZWZqF4/0Zyq88mJkUfqTdlhI+3VTxd84RCtyR15j9zb1
 qTI96P1+2Q5JSzeIDk2YBfrCKyRzByqbnRx4fjrxnTOm7EoMZ6+t40kaLutsl/DqOw
 L53XlE87AZiLsOTWFbGLeou9rWeKdGvl5tvJwnl6ycJ4s8WXfbxu+qWZgGuMHoiBqt
 buspTUJ+HaIow==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DB13437811D4;
 Mon, 11 Mar 2024 13:58:38 +0000 (UTC)
Date: Mon, 11 Mar 2024 14:58:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH 3/3] drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue
Message-ID: <20240311145837.4254b504@collabora.com>
In-Reply-To: <4f4552fe-e2b7-44d0-9d46-448be908472c@arm.com>
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
 <20240304090812.3941084-4-boris.brezillon@collabora.com>
 <87il1tt4f6.fsf@intel.com> <20240311124634.2ee63052@collabora.com>
 <87frwxt2cb.fsf@intel.com> <20240311125259.6bf317a5@collabora.com>
 <fbaed280-74bb-431c-8bc4-7b0c570a39b3@arm.com>
 <20240311142236.05139059@collabora.com>
 <6bb76bfe-2be8-4724-a5db-34a779e571ad@arm.com>
 <4f4552fe-e2b7-44d0-9d46-448be908472c@arm.com>
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

On Mon, 11 Mar 2024 13:46:23 +0000
Steven Price <steven.price@arm.com> wrote:

> On 11/03/2024 13:36, Robin Murphy wrote:
> > On 2024-03-11 1:22 pm, Boris Brezillon wrote: =20
> >> On Mon, 11 Mar 2024 13:11:28 +0000
> >> Robin Murphy <robin.murphy@arm.com> wrote:
> >> =20
> >>> On 2024-03-11 11:52 am, Boris Brezillon wrote: =20
> >>>> On Mon, 11 Mar 2024 13:49:56 +0200
> >>>> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >>>> =C2=A0=C2=A0 =20
> >>>>> On Mon, 11 Mar 2024, Boris Brezillon
> >>>>> <boris.brezillon@collabora.com> wrote: =20
> >>>>>> On Mon, 11 Mar 2024 13:05:01 +0200
> >>>>>> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =20
> >>>>>>> This breaks the config for me:
> >>>>>>>
> >>>>>>> =C2=A0=C2=A0=C2=A0 SYNC=C2=A0=C2=A0=C2=A0 include/config/auto.con=
f.cmd
> >>>>>>> =C2=A0=C2=A0=C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 Makefile
> >>>>>>> drivers/iommu/Kconfig:14:error: recursive dependency detected!
> >>>>>>> drivers/iommu/Kconfig:14:=C2=A0=C2=A0=C2=A0 symbol IOMMU_SUPPORT =
is selected by
> >>>>>>> DRM_PANTHOR
> >>>>>>> drivers/gpu/drm/panthor/Kconfig:3:=C2=A0=C2=A0=C2=A0 symbol DRM_P=
ANTHOR depends
> >>>>>>> on PM
> >>>>>>> kernel/power/Kconfig:183:=C2=A0=C2=A0=C2=A0 symbol PM is selected=
 by PM_SLEEP
> >>>>>>> kernel/power/Kconfig:117:=C2=A0=C2=A0=C2=A0 symbol PM_SLEEP depen=
ds on
> >>>>>>> HIBERNATE_CALLBACKS
> >>>>>>> kernel/power/Kconfig:35:=C2=A0=C2=A0=C2=A0 symbol HIBERNATE_CALLB=
ACKS is
> >>>>>>> selected by XEN_SAVE_RESTORE
> >>>>>>> arch/x86/xen/Kconfig:67:=C2=A0=C2=A0=C2=A0 symbol XEN_SAVE_RESTOR=
E depends on XEN
> >>>>>>> arch/x86/xen/Kconfig:6:=C2=A0=C2=A0=C2=A0 symbol XEN depends on P=
ARAVIRT
> >>>>>>> arch/x86/Kconfig:781:=C2=A0=C2=A0=C2=A0 symbol PARAVIRT is select=
ed by HYPERV
> >>>>>>> drivers/hv/Kconfig:5:=C2=A0=C2=A0=C2=A0 symbol HYPERV depends on =
X86_LOCAL_APIC
> >>>>>>> arch/x86/Kconfig:1106:=C2=A0=C2=A0=C2=A0 symbol X86_LOCAL_APIC de=
pends on
> >>>>>>> X86_UP_APIC
> >>>>>>> arch/x86/Kconfig:1081:=C2=A0=C2=A0=C2=A0 symbol X86_UP_APIC promp=
t is visible
> >>>>>>> depending on PCI_MSI
> >>>>>>> drivers/pci/Kconfig:39:=C2=A0=C2=A0=C2=A0 symbol PCI_MSI is selec=
ted by AMD_IOMMU
> >>>>>>> drivers/iommu/amd/Kconfig:3:=C2=A0=C2=A0=C2=A0 symbol AMD_IOMMU d=
epends on
> >>>>>>> IOMMU_SUPPORT =20
> >>>>>>
> >>>>>> Uh, I guess we want a "depends on IOMMU_SUPPORT" instead of "select
> >>>>>> IOMMU_SUPPORT" in panthor then. =20
> >>>>>
> >>>>> That works for me. =20
> >>>>
> >>>> Let's revert the faulty commit first. We'll see if Steve has a
> >>>> different solution for the original issue. =20
> >>>
> >>> FWIW, the reasoning in the offending commit seems incredibly tenuous.
> >>> There are far more practical reasons for building an arm/arm64 kernel
> >>> without PM - for debugging or whatever, and where one may even still
> >>> want a usable GPU, let alone just a non-broken build - than there are
> >>> for building this driver for x86. Using pm_ptr() is trivial, and if y=
ou
> >>> want to support COMPILE_TEST then there's really no justifiable excuse
> >>> not to. =20
> >>
> >> The problem is not just about using pm_ptr(), but also making sure
> >> panthor_device_resume/suspend() are called called in the init/unplug
> >> path when !PM, as I don't think the PM helpers automate that for us. I
> >> was just aiming for a simple fix that wouldn't force me to test the !PM
> >> case... =20
> > Fair enough, at worst we could always have a runtime check and refuse to
> > probe in conditions we don't think are worth the bother of implementing
> > fully-functional support for. However if we want to make an argument for
> > only supporting "realistic" configs at build time then that is an
> > argument for dropping COMPILE_TEST as well. =20
>=20
> Can we just replace the "depends on PM" with "select PM"? In my
> (admittedly very limited) testing this works. Otherwise I think we need
> to bite the bullet and support !PM in some way (maybe just as Robin
> suggests with a runtime bail out).

I won't have time to test it this week, but if someone is interested,
here's a diff implementing manual resume/suspend in the init/unplug
path:

--->8---
