Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F32C4EDDF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 16:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0162B10E5FC;
	Tue, 11 Nov 2025 15:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQ9+bsUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B707C10E5FC;
 Tue, 11 Nov 2025 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762876345; x=1794412345;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=U8yfNqSN49Gaztelb9TgSAQVh0yLGw/hvy5W6Raqhno=;
 b=GQ9+bsUexwOJlZQcKKAvk8bp+5XXlcq71TWvrUqSjyDUrWILAXJq+vDl
 88pyvTSrrR47eNY73ZKFNjD3gLtVgM6gYuf+qmugqNkzAzaOj4702lz1K
 qM5e3TuFTwQgbkzg23JUDPLHwrYwyc2y+RxkFJdd6mH5fTXOZQs97EO5s
 8BjTshHuUk2bxHsQsDtrXCcK+6923y2KKax2vJBiTsz/zG9ZfNUwI8Ycu
 5AexqJlfXawg1BceabnmifyoufvGo+oEmPKXKKAv4+optNq4vqVg5OGBn
 Mb4OYSn100KixU4DasKY/gak7Ewy5VablsUXFWOac74zK66Sr5KyFNIx4 Q==;
X-CSE-ConnectionGUID: 8kONbDWXTDSTWvvXzpf/HA==
X-CSE-MsgGUID: II+MJfi1RmGAiCGzWe3HRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="67542112"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="67542112"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 07:52:24 -0800
X-CSE-ConnectionGUID: myQ64WRUR82e0u21QPoYyA==
X-CSE-MsgGUID: DsYajqoRSU2B3P+rvtPpIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188959316"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.132])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 07:52:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 11 Nov 2025 17:52:13 +0200 (EET)
To: =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
cc: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 Simon Richter <Simon.Richter@hogyros.de>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 8/9] drm/amdgpu: Remove driver side BAR release before
 resize
In-Reply-To: <eb776004-c798-453d-bfbf-a40810308253@amd.com>
Message-ID: <5be404d2-3227-afb9-f8c9-226326263eee@linux.intel.com>
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
 <20251028173551.22578-9-ilpo.jarvinen@linux.intel.com>
 <c90f155f-44fe-4144-af68-309531392d22@amd.com>
 <aaaf27cf-5de0-c4ef-0758-59849878a99f@linux.intel.com>
 <fd7fdf61-cb08-4dfc-ba7a-a8a5b7eb9fda@amd.com>
 <10b095b5-f433-3bfc-c1c9-5da7db560696@linux.intel.com>
 <eb776004-c798-453d-bfbf-a40810308253@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1291627756-1762876333=:1002"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1291627756-1762876333=:1002
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Nov 2025, Christian K=C3=B6nig wrote:

> On 11/11/25 13:56, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 11 Nov 2025, Christian K=C3=B6nig wrote:
> >=20
> >> On 11/11/25 12:08, Ilpo J=C3=A4rvinen wrote:
> >>> On Tue, 11 Nov 2025, Christian K=C3=B6nig wrote:
> >>>
> >>>> Sorry for the late reply I'm really busy at the moment.
> >>>>
> >>>> On 10/28/25 18:35, Ilpo J=C3=A4rvinen wrote:
> >>>>> PCI core handles releasing device's resources and their rollback in
> >>>>> case of failure of a BAR resizing operation. Releasing resource pri=
or
> >>>>> to calling pci_resize_resource() prevents PCI core from restoring t=
he
> >>>>> BARs as they were.
> >>>>
> >>>> I've intentionally didn't do it this way because at least on AMD HW =
we=20
> >>>> could only release the VRAM and doorbell BAR (both 64bit), but not t=
he=20
> >>>> register BAR (32bit only).
> >>>>
> >>>> This patch set looks like the right thing in general, but which BARs=
 are=20
> >>>> now released by pci_resize_resource()?
> >>>>
> >>>> If we avoid releasing the 32bit BAR as well then that should work,=
=20
> >>>> otherwise we will probably cause problems.
> >>>
> >>> After these changes, pci_resize_resource() releases BARs that share t=
he=20
> >>> bridge window with the BAR to be resized. So the answer depends on th=
e=20
> >>> upstream bridge.
> >>>
> >>> However, amdgpu_device_resize_fb_bar() also checks that root bus has =
a
> >>> resource with a 64-bit address. That won't tell what the nearest brid=
ge=20
> >>> has though. Maybe that check should be converted to check the resourc=
es of=20
> >>> the nearest bus instead? It would make it impossible to have the=20
> >>> 32-bit resource share the bridge window with the 64-bit resources so =
the=20
> >>> resize would be safe.
> >>
> >> Mhm, I don't think that will work.
> >>
> >>
> >> I've added the check for the root bus to avoid a couple of issues duri=
ng=20
> >> resize, but checking the nearest bridge would block a whole bunch of u=
se=20
> >> cases and isn't even 100% save.
> >>
> >> See one use case of this is that all the BARs of the device start in t=
he=20
> >> same 32bit bridge window (or a mixture of 64bit and 32bit window).
> >=20
> > "32bit bridge window" is ambiguous. There are non-prefetchable and=20
> > prefetchable bridge windows, out of which the latter can be 64-bit as=
=20
> > well. Which one you're talking about?
>=20
> The non-prefetchable 32bit window.
>=20
> > If a 64-bit prefetchable window exists, pbus_size_mem() nor=20
> > __pci_assign_resource() would not have produced such a configuration wh=
ere=20
> > they're put into the same bridge window, even before the commit=20
> > ae88d0b9c57f ("PCI: Use pbus_select_window_for_type() during mem window=
=20
> > sizing") (I think). Now pbus_size_mem() certainly doesn't.
>=20
> I need to double check, but if I'm not completely mistaken that is assign=
ed by the BIOS.
>=20
> Here is an example of a "good" configuration where both VRAM (BAR0) and d=
oorbell (BAR2) is in the prefetchable window and MMIO in the non-prefetchab=
le:
>=20
> Device:
> =09Region 0: Memory at 80000000 (64-bit, prefetchable) [size=3D256M]
> =09Region 2: Memory at 90000000 (64-bit, prefetchable) [size=3D2M]
> =09Region 4: I/O ports at 3000 [size=3D256]
> =09Region 5: Memory at 9f300000 (32-bit, non-prefetchable) [size=3D1M]
>=20
> Bridge:
> =09Memory behind bridge: 9f300000-9f4fffff [size=3D2M] [32-bit]
> =09Prefetchable memory behind bridge: 80000000-901fffff [size=3D258M] [32=
-bit]
>=20
> And here is an example of another system where things are mixed up:
>=20
> Device:
> =09Region 0: Memory at 2c00000000 (64-bit, prefetchable) [size=3D256M]
> =09Region 2: Memory at 94000000 (64-bit, prefetchable) [size=3D2M]
> =09Region 4: I/O ports at 1000 [size=3D256]
> =09Region 5: Memory at 94600000 (32-bit, non-prefetchable) [size=3D512K]
>=20
> Bridge:
> =09Memory behind bridge: 94000000-946fffff [size=3D7M] [32-bit]
> =09Prefetchable memory behind bridge: 2c00000000-2c107fffff [size=3D264M]=
 [32-bit]
>=20
> In that example the doorbell ended up in the non-prefetchable window for=
=20
> some reason. And that config comes in all possible variations.

The really odd thing is that there seems to be even room in that=20
prefetchable window for a 2MB BAR.

(Unless it's ppc which I heard is placing small BARs in a weird way.)

> On AMD GPUs both BAR0 and BAR2 are resizeable.
>
> So far we have only implemented resizing of BAR0, but essentially we=20
> want to have both for some use cases.=20

Okay. My plan is anyway to change the resource fitting logic so it will=20
leave enough space to fit as large resources as possible at where the=20
resizable BARs is at (once I get that far). Then BAR resize itself can be
mostly done in-place without need to release the bridge windows at all.

> >> What we have is that BAR 0 and 2 are 64bit BARs which can (after some=
=20
> >> preparation) move around freely. But IIRC BAR 4 are the legacy I/O por=
ts=20
> >> and BAR 5 is the 32bit MMIO registers (don't nail me on that, could be=
=20
> >> just the other way around).
> >>
> >> Especially that 32bit MMIO BAR *can't* move! Not only because it is=20
> >> 32bit, but also because the amdgpu driver as well as the HW itself=20
> >> through the VGA emulation, as well as the EFI/VESA/VBIOS code might=20
> >> reference its absolute address.
> >=20
> > So if the 64-bit check is replaced with this:
> >=20
> > +       /* Check if the parent bridge has a 64-bit (pref) memory resour=
ce */
> > +       res =3D pci_resource_n(adev->pdev, 0)->parent;
> > +       /* Trying to resize is pointless without a window above 4GB */
> > +       if (!(res->flags & IORESOURCE_MEM_64))
> > =09=09return 0;
> >=20
> > ...I don't think it's possible for 32-bit resource to share that window=
=20
> > under _any_ circumstance.
>=20
> Well see the example above.

For the record, BAR0 would pass that 64-bit check above and could be=20
resized safely too.

But I hear your point that this kind of mixed config seems possible for=20
some reason.

> I have SSH access to a system where exactly that is the configuration.
>
> > If you say that ->parent somehow points to a non-IORESOURCE_MEM_64 wind=
ow=20
> > at this point, you're implying allocation for the 64-bit prefetchable=
=20
> > window was tried and failed, and __pci_assign_resource() then used one =
of=20
> > its fallbacks.
>=20
> No, as I said that comes from the BIOS.

Normally we don't abide the BIOS allocations for normal BARs, only=20
bridge windows are claimed using pci_claim_resource(). Only if=20
preserve_config is set for the host bridge, also dev resources are=20
claimed as they were discovered.

The normal BARs are normally added into the resource tree using=20
pci_assign_resource() which will not end up using the resource address of=
=20
the resource itself in determining where to place the=20
resource (AFAICT from the code in __pci_assign_resource() ->
pci_bus_alloc_resource() -> pci_bus_alloc_from_region() ->=20
allocate_resource() -> __find_resource_space()).

> > Are you saying that "some preparation" includes making room for that=20
> > 64-bit prefetchable window that failed to assign earlier as I cannot se=
e=20
> > how else it would ever get assigned so that the 64-bit BARs could be mo=
ved=20
> > there?
>=20
> No, at least from the amdgpu driver side we don't touch the resource=20
> allocation at all.=20
>=20
> In this case preparation means disabling the VGA emulation, cause=20
> otherwise trying to resize the BAR can just cause a spontaneous system=20
> reboot for some reason.=20
>
> >> Could we give pci_resize_resource() a mask of BARs which are save to=
=20
> >> release?
> >=20
> > It is possible.
>=20
> Then let us solve this issue by this somehow.

I've added exclude_bars parameters to pci_resize_resource() and made
amdgpu to pass 1 << 5 to it, will send v2 in a day or two with that. If=20
you've better idea than using a literal like that, please let me know.

--=20
 i.

--8323328-1291627756-1762876333=:1002--
