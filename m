Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F3AB7EC6C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 15:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39FB10E1B9;
	Wed, 17 Sep 2025 13:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B73Orcfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845DA10E1B9;
 Wed, 17 Sep 2025 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758114026; x=1789650026;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=2yKGs0PVzLg3qQGCXuxUQSYho466dRx1tPvvARiZqSc=;
 b=B73OrcfvVPUHEyRXREu0Xbu5SLioFTOEkK+pLV/awSGLfb6NWNEeZrNr
 Ng438HxDfpMj+0J7kHy5yBG8EDZGglSi/0yLi4OVzINehwHLhULufI5c6
 k3Xz2xeOvytpnDPcwviMrwi7NRuefpti8p4OcmrnlcuSIdUBFj+XKDdGw
 sOLsBFvfGWk5ihoHQqZAYH89YsQowTa1LGbRYE9qzQPXkw71bGCFccf6L
 2bOARI5lrh9OJqK/MekRdUeBCrq0/rGG4MtVgt54+W1Edpsa6WhtX2h3c
 98hdu1me0lbMNTaWG8GYkDtwGH6LEpnRx4kQwjXJ5mZmb51j2ggEXF0Yl A==;
X-CSE-ConnectionGUID: nkwhBiFHQEGWGVFPTmGFMg==
X-CSE-MsgGUID: sB6ROlIAS2GL8V9TBL0o1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71045914"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208,223";a="71045914"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:00:25 -0700
X-CSE-ConnectionGUID: wqBSL0cpQwChrQvG9cG0/Q==
X-CSE-MsgGUID: RYfeRSafTX+BsmmDmjtmdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
 d="scan'208,223";a="206021646"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.87])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:00:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 17 Sep 2025 16:00:10 +0300 (EEST)
To: Lucas De Marchi <lucas.demarchi@intel.com>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
 =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 "Michael J . Ruhl" <mjruhl@habana.ai>, LKML <linux-kernel@vger.kernel.org>, 
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/11] PCI: Resizable BAR improvements
In-Reply-To: <fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov>
Message-ID: <f1ba313f-74c2-ae63-ac80-4a35e53477b4@linux.intel.com>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <wqukxnxni2dbpdhri3cbvlrzsefgdanesgskzmxi5sauvsirsl@xor663jw2cdw>
 <fafda2a3-fc63-ce97-d22b-803f771a4d19@linux.intel.com>
 <fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-161591600-1758110677=:1127"
Content-ID: <02627e65-0efe-af44-e3e3-bb98aa69c8a6@linux.intel.com>
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

--8323328-161591600-1758110677=:1127
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0ff851c3-bc92-a369-3277-d7c205779207@linux.intel.com>

On Tue, 16 Sep 2025, Lucas De Marchi wrote:

> On Mon, Sep 15, 2025 at 08:24:06PM +0300, Ilpo J=E4rvinen wrote:
> > On Mon, 15 Sep 2025, Lucas De Marchi wrote:
> >=20
> > > On Mon, Sep 15, 2025 at 12:13:47PM +0300, Ilpo J=E4rvinen wrote:
> > > > pci.c has been used as catch everything that doesn't fits elsewhere
> > > > within PCI core and thus resizable BAR code has been placed there a=
s
> > > > well. Move Resizable BAR related code to a newly introduced rebar.c=
 to
> > > > reduce size of pci.c. After move, there are no pci_rebar_*() calls =
from
> > > > pci.c indicating this is indeed well-defined subset of PCI core.
> > > >
> > > > Endpoint drivers perform Resizable BAR related operations which cou=
ld
> > > > well be performed by PCI core to simplify driver-side code. This
> > > > series adds a few new API functions to that effect and converts the
> > > > drivers to use the new APIs (in separate patches).
> > > >
> > > > While at it, also convert BAR sizes bitmask to u64 as PCIe spec alr=
eady
> > > > specifies more sizes than what will fit u32 to make the API typing =
more
> > > > future-proof. The extra sizes beyond 128TB are not added at this po=
int.
> > > >
> > > > These are based on pci/main plus a simple "adapter" patch to add th=
e
> > > > include for xe_vram_types.h that was added by a commit in drm-tip.
> > > > Hopefully that is enough to avoid the within context conflict with
> > > > BAR_SIZE_SHIFT removal to let the xe CI tests to be run for this
> > > > series.
> > > >
> > > > There are two minor conflicts with the work in pci/resource but I'm
> > > > hesitant to base this on top of it as this is otherwise entirely
> > > > independent (and would likely prevent GPU CI tests as well). If we =
end
> > > > up having to pull the bridge window select changes, there should be=
 no
> > > > reason why this does have to become collateral damage (so my
> > > > suggestion, if this is good to go in this cycle, to take this into =
a
> > > > separate branch than pci/resource and deal with those small conflic=
ts
> > > > while merging into pci/next).
> > > >
> > > > I've tested sysfs resize, i915, and xe BAR resizing functionality. =
In
> > > > the case of xe, I did small hack patch as its resize is anyway brok=
en
> > > > as is because BAR0 pins the bridge window so resizing BAR2 fails. M=
y
> > > > hack caused other problems further down the road (likely because BA=
R0
> > > > is in use by the driver so releasing it messed assumptions xe drive=
r
> > > > has) but the BAR resize itself was working which was all I was
> > >=20
> > > is the hack you mention here to release all BARs before attempting th=
e
> > > resize?
> >=20
> > Yes, the patch added release of BAR0 prior to resize. The existing xe c=
ode
> > in _resize_bar() already releases BAR2.
> >=20
> > During resize, if the first loop in pbus_reassign_bridge_resources()
> > (called from pci_resize_resource()) finds the bridge window closest to =
the
> > endpoint still has a child, it results in having empty saved list becau=
se
> > all upstream bridge windows will then have a child as well.
> >=20
> > Empty saved list is checked after the loop and
> > pbus_reassign_bridge_resources() returns -ENOENT without even trying to
> > assign the resources. The error is returned even if the actual bridge
> > window size is large enough to fit the resized resource.
> >=20
> > The logic in pci_resize_resource() and pbus_reassign_bridge_resources()
> > need some other improvements besides that problem, but I likely won't
> > have time to look at that until completing the fitting algorithm change=
s.
> > I'd actually want to add pci_release_and_resize_resource() which would
> > take care of releasing all the resources of the device (obviously drive=
r
> > must have its hands off all those BARs when it calls that function). Wi=
th
> > the current pci_resize_resource() API, handling the restore of BARs in
> > case of failure is not as robust as I'd like to make it.
> >=20
> > > > interested to know. I'm not planning to pursue fixing the pinning
> > > > problem within xe driver because the core changes to consider maxim=
um
> > > > size of the resizable BARs should take care of the main problem by
> > > > different means.
> > >=20
> > > I'd actually like to pursue that myself as that could be propagated t=
o
> > > stable since we do have some resize errors in xe with BMG that I wasn=
't
> > > understanding. It's likely due to xe_mmio_probe_early() taking a hold=
 of
> > > BAR0 and not expecting it to be moved. We could either remap if we ha=
ve
> > > have to resize or just move the resize logic early on.
> >=20
> > Great. If you have any questions when it comes to the PCI core side cod=
e,
> > please let me know.
>=20
> I moved the resize to happen before anything else in xe. However when
> testing I noticed a scenario failing without involving the driver.
> With and without this series I still have the same pass/failure
> scenarios:
>=20
> Tests executed with a BMG. Just after boot, BAR2 is 16GB.
>=20
> 1) If I resize it via sysfs to 8GB and then load the driver, it resizes
> it back. Resize from sysfs works too. No change in behavior.

It's expected that resizing smaller size -> back to the original works=20
through sysfs because the upstream window pins won't prevent reacquiring=20
the same or less space.

But the way resize is called from current xe code, sizing even to a=20
smaller size fails because BAR0 pins the closest upstream window,=20
resulting in -ENOENT as explained above. I don't see fixing this on core=20
side as priority because I plan to rework the resizing code anyway and=20
resizing to a smaller size doesn't seem overly useful use case.

> 2) If I do "remove the bridge via sysfs and rescan the bus"[1], it fails =
to
> resize (either automatically, on rescan, via sysfs, or loading the xe
> driver). It just stays at 256M.

This is because the larger resource sizes are only calculated on the=20
actual resize call which occurs after the bridge windows were already=20
sized on rescan to the smaller size. At that point, the critical bridge=20
windows are already pinned in place and thus cannot be relocated to free=20
area I assume there would be somewhere within 4000000000-7fffffffff.

> The only thing that brings it back is a reboot. /proc/iomem shows this:
>=20
> 4000000000-7fffffffff : PCI Bus 0000:00
>   4000000000-44007fffff : PCI Bus 0000:01
>     4000000000-4017ffffff : PCI Bus 0000:02
>       4000000000-400fffffff : PCI Bus 0000:03    <<<< BMG
>         4000000000-400fffffff : 0000:03:00.0

>       4010000000-40100fffff : PCI Bus 0000:04

This pins 0000:01:00.0's window in place. And also prevents enlarging the=
=20
siblings.

It would possible, though, to release it and still use sysfs to perform=20
resize on 0000:03:00.0 as removing 0000:04:00.0 doesn't require removing=20
0000:03:00.0. But...

>     4018000000-40187fffff : 0000:01:00.0

=2E..This resource pins 0000:00:01.0's window in place. AFAIK, it cannot be=
=20
released other than by removing 0000:01:00.0 which results in removing=20
0000:03:00.0 as well, thus making it impossible to perform the BAR resize=
=20
for 0000:03:00.0 through sysfs anymore. Catch-22.

Could you test if the attached quirk patch helps. Maybe it could be=20
considered as the interim solution until the bridge sizing logic becomes=20
aware of the resizable BARs. To use a quirk to do this feels hacky to me,=
=20
but then it's hard to point out any real downsides with that approach=20
(other than having to quirk it).

You'll still need to manually release 0000:04:00.0 but the BAR0 on the=20
switch should be gone thanks to the quirk. When both of the window pins=20
are gone, I think the resize through sysfs should work.

> And dmesg shows this for the rescan:
>=20
> [ 1673.189737] pci 0000:01:00.0: [8086:e2ff] type 01 class 0x060400 PCIe
> Switch Upstream Port
> [ 1673.189794] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x007fffff 64bit p=
ref]
> [ 1673.189808] pci 0000:01:00.0: PCI bridge to [bus 00]
> [ 1673.189824] pci 0000:01:00.0:   bridge window [io  0x0000-0x0fff]
> [ 1673.189834] pci 0000:01:00.0:   bridge window [mem 0x00000000-0x000fff=
ff]
> [ 1673.189856] pci 0000:01:00.0:   bridge window [mem 0x00000000-0x000fff=
ff
> 64bit pref]
> [ 1673.189878] pci 0000:01:00.0: Max Payload Size set to 256 (was 128, ma=
x
> 256)
> [ 1673.190164] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
> [ 1673.193531] pci 0000:01:00.0: Adding to iommu group 16
> [ 1673.196997] pcieport 0000:00:01.0: ASPM: current common clock configur=
ation
> is inconsistent, reconfiguring
> [ 1673.197061] pci 0000:01:00.0: bridge configuration invalid ([bus 00-00=
]),
> reconfiguring
> [ 1673.197421] pci 0000:02:01.0: [8086:e2f0] type 01 class 0x060400 PCIe
> Switch Downstream Port
> [ 1673.197452] pci 0000:02:01.0: PCI bridge to [bus 00]
> [ 1673.197463] pci 0000:02:01.0:   bridge window [io  0x0000-0x0fff]
> [ 1673.197468] pci 0000:02:01.0:   bridge window [mem 0x00000000-0x000fff=
ff]
> [ 1673.197482] pci 0000:02:01.0:   bridge window [mem 0x00000000-0x000fff=
ff
> 64bit pref]
> [ 1673.197497] pci 0000:02:01.0: Max Payload Size set to 256 (was 128, ma=
x
> 256)
> [ 1673.197503] pci 0000:02:01.0: enabling Extended Tags
> [ 1673.197660] pci 0000:02:01.0: PME# supported from D0 D3hot D3cold
> [ 1673.198411] pci 0000:02:01.0: Adding to iommu group 17
> [ 1673.200258] pci 0000:02:02.0: [8086:e2f1] type 01 class 0x060400 PCIe
> Switch Downstream Port
> [ 1673.200289] pci 0000:02:02.0: PCI bridge to [bus 00]
> [ 1673.200299] pci 0000:02:02.0:   bridge window [io  0x0000-0x0fff]
> [ 1673.200304] pci 0000:02:02.0:   bridge window [mem 0x00000000-0x000fff=
ff]
> [ 1673.200317] pci 0000:02:02.0:   bridge window [mem 0x00000000-0x000fff=
ff
> 64bit pref]
> [ 1673.200333] pci 0000:02:02.0: Max Payload Size set to 256 (was 128, ma=
x
> 256)
> [ 1673.200337] pci 0000:02:02.0: enabling Extended Tags
> [ 1673.200470] pci 0000:02:02.0: PME# supported from D0 D3hot D3cold
> [ 1673.201059] pci 0000:02:02.0: Adding to iommu group 18
> [ 1673.202761] pci 0000:01:00.0: PCI bridge to [bus 02-04]
> [ 1673.202774] pci 0000:02:01.0: bridge configuration invalid ([bus 00-00=
]),
> reconfiguring
> [ 1673.202782] pci 0000:02:02.0: bridge configuration invalid ([bus 00-00=
]),
> reconfiguring
> [ 1673.203024] pci 0000:03:00.0: [8086:e221] type 00 class 0x030000 PCIe
> Endpoint
> [ 1673.203060] pci 0000:03:00.0: BAR 0 [mem 0x00000000-0x00ffffff 64bit]
> [ 1673.203064] pci 0000:03:00.0: BAR 2 [mem 0x00000000-0x0fffffff 64bit p=
ref]
> [ 1673.203069] pci 0000:03:00.0: ROM [mem 0x00000000-0x001fffff pref]
> [ 1673.203077] pci 0000:03:00.0: Max Payload Size set to 256 (was 128, ma=
x
> 256)
> [ 1673.203209] pci 0000:03:00.0: PME# supported from D0 D3hot
> [ 1673.203770] pci 0000:03:00.0: Adding to iommu group 19
> [ 1673.205451] pci 0000:03:00.0: vgaarb: setting as boot VGA device
> [ 1673.205454] pci 0000:03:00.0: vgaarb: bridge control possible
> [ 1673.205455] pci 0000:03:00.0: vgaarb: VGA device added:
> decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
> [ 1673.205534] pci 0000:02:01.0: PCI bridge to [bus 03-04]
> [ 1673.205543] pci_bus 0000:03: busn_res: [bus 03-04] end is updated to 0=
3
> [ 1673.205787] pci 0000:04:00.0: [8086:e2f7] type 00 class 0x040300 PCIe
> Endpoint
> [ 1673.205848] pci 0000:04:00.0: BAR 0 [mem 0x00000000-0x00003fff 64bit]
> [ 1673.205867] pci 0000:04:00.0: Max Payload Size set to 256 (was 128, ma=
x
> 256)
> [ 1673.205872] pci 0000:04:00.0: enabling Extended Tags
> [ 1673.206012] pci 0000:04:00.0: PME# supported from D3hot D3cold
> [ 1673.206528] pci 0000:04:00.0: Adding to iommu group 20
> [ 1673.208271] pci 0000:02:02.0: PCI bridge to [bus 04]
> [ 1673.208284] pci_bus 0000:04: busn_res: [bus 04] end is updated to 04
> [ 1673.208291] pci_bus 0000:02: busn_res: [bus 02-04] end is updated to 0=
4
> [ 1673.232003] pcieport 0000:00:01.0: Assigned bridge window [mem
> 0x83000000-0x840fffff] to [bus 01-04] cannot fit 0x2000000 required for
> 0000:02:01.0 bridging to [bus 03]
> [ 1673.232009] pci 0000:02:01.0: bridge window [mem 0x00000000-0x000fffff=
] to
> [bus 03] requires relaxed alignment rules
> [ 1673.232016] pci 0000:02:01.0: bridge window [mem 0x01000000-0x01ffffff=
] to
> [bus 03] add_size 200000 add_align 1000000
> [ 1673.232020] pcieport 0000:00:01.0: Assigned bridge window [mem
> 0x83000000-0x840fffff] to [bus 01-04] cannot fit 0x1800000 required for
> 0000:01:00.0 bridging to [bus 02-04]
> [ 1673.232025] pci 0000:01:00.0: bridge window [mem 0x00000000-0x000fffff=
] to
> [bus 02-04] requires relaxed alignment rules
> [ 1673.232027] pcieport 0000:00:01.0: Assigned bridge window [mem
> 0x83000000-0x840fffff] to [bus 01-04] cannot fit 0x2000000 required for
> 0000:01:00.0 bridging to [bus 02-04]
> [ 1673.232031] pci 0000:01:00.0: bridge window [mem 0x00000000-0x000fffff=
] to
> [bus 02-04] requires relaxed alignment rules
> [ 1673.232036] pci 0000:01:00.0: bridge window [mem 0x01000000-0x020fffff=
] to
> [bus 02-04] add_size 200000 add_align 1000000
> [ 1673.232077] pci 0000:01:00.0: bridge window [mem 0x4000000000-0x4017ff=
ffff
> 64bit pref]: assigned
> [ 1673.232080] pci 0000:01:00.0: bridge window [mem size 0x01300000]: can=
't
> assign; no space
> [ 1673.232082] pci 0000:01:00.0: bridge window [mem size 0x01300000]: fai=
led
> to assign
> [ 1673.232090] pci 0000:01:00.0: BAR 0 [mem 0x4018000000-0x40187fffff 64b=
it
> pref]: assigned
> [ 1673.232103] pci 0000:01:00.0: bridge window [io  0x8000-0x9fff]: assig=
ned
> [ 1673.232129] pci 0000:01:00.0: bridge window [mem 0x83000000-0x840fffff=
]:
> assigned
> [ 1673.232131] pci 0000:01:00.0: bridge window [mem 0x83000000-0x840fffff=
]:
> failed to expand by 0x200000
> [ 1673.232136] pci 0000:01:00.0: bridge window [mem 0x83000000-0x840fffff=
]:
> failed to add optional 200000
> [ 1673.232192] pci 0000:02:01.0: bridge window [mem 0x4000000000-0x400fff=
ffff
> 64bit pref]: assigned
> [ 1673.232196] pci 0000:02:01.0: bridge window [mem 0x83000000-0x83ffffff=
]:
> assigned
> [ 1673.232200] pci 0000:02:02.0: bridge window [mem 0x84000000-0x840fffff=
]:
> assigned
> [ 1673.232202] pci 0000:02:02.0: bridge window [mem 0x4010000000-0x40100f=
ffff
> 64bit pref]: assigned
> [ 1673.232204] pci 0000:02:01.0: bridge window [io  0x8000-0x8fff]: assig=
ned
> [ 1673.232206] pci 0000:02:02.0: bridge window [io  0x9000-0x9fff]: assig=
ned
> [ 1673.232241] pci 0000:03:00.0: BAR 2 [mem 0x4000000000-0x400fffffff 64b=
it
> pref]: assigned
> [ 1673.232250] pci 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]:
> assigned
> [ 1673.232259] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: can't as=
sign;
> no space
> [ 1673.232261] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: failed t=
o
> assign
> [ 1673.232272] pci 0000:03:00.0: BAR 2 [mem 0x4000000000-0x400fffffff 64b=
it
> pref]: assigned
> [ 1673.232280] pci 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]:
> assigned
> [ 1673.232289] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: can't as=
sign;
> no space
> [ 1673.232291] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: failed t=
o
> assign
> [ 1673.232302] pci 0000:02:01.0: PCI bridge to [bus 03]
> [ 1673.232304] pci 0000:02:01.0:   bridge window [io  0x8000-0x8fff]
> [ 1673.232309] pci 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffff=
ff]
> [ 1673.232313] pci 0000:02:01.0:   bridge window [mem
> 0x4000000000-0x400fffffff 64bit pref]
> [ 1673.232321] pci 0000:04:00.0: BAR 0 [mem 0x84000000-0x84003fff 64bit]:
> assigned
> [ 1673.232336] pci 0000:02:02.0: PCI bridge to [bus 04]
> [ 1673.232339] pci 0000:02:02.0:   bridge window [io  0x9000-0x9fff]
> [ 1673.232345] pci 0000:02:02.0:   bridge window [mem 0x84000000-0x840fff=
ff]
> [ 1673.232349] pci 0000:02:02.0:   bridge window [mem
> 0x4010000000-0x40100fffff 64bit pref]
> [ 1673.232356] pci 0000:01:00.0: PCI bridge to [bus 02-04]
> [ 1673.232359] pci 0000:01:00.0:   bridge window [io  0x8000-0x9fff]
> [ 1673.232363] pci 0000:01:00.0:   bridge window [mem 0x83000000-0x840fff=
ff]
> [ 1673.232366] pci 0000:01:00.0:   bridge window [mem
> 0x4000000000-0x4017ffffff 64bit pref]
> [ 1673.232471] pcieport 0000:01:00.0: enabling device (0000 -> 0003)
> [ 1673.233508] pcieport 0000:02:01.0: enabling device (0000 -> 0003)
> [ 1673.233692] pcieport 0000:02:02.0: enabling device (0000 -> 0003)
>=20
> # echo 9 > /sys/bus/pci/devices/0000\:03\:00.0/resource2_resize -bash: ec=
ho:
> write error: No space left on device
>=20
>=20
> [1] # echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/remove
>     # echo 0 > /sys/bus/pci/drivers_autoprobe
>     # echo 1 > /sys/bus/pci/rescan
>=20
>=20
> I can share the xe patch so you check if it at least fixes it in your
> test scenario.

Ah, one thing I didn't remember mention is that in my case the BAR is=20
already at its maximum size, so to test the resize is working, I made
the target size smaller, not larger. (I understand this might not be very=
=20
helpful in your case but I was only interested that resize code still=20
works after this series).

--=20
 i.
--8323328-161591600-1758110677=:1127
Content-Type: text/x-diff; name=0001-PCI-Release-BAR0-of-an-integrated-bridge-to-allow-GP.patch
Content-Transfer-Encoding: BASE64
Content-ID: <106de70e-1c2b-f200-e68a-aa5052505f4b@linux.intel.com>
Content-Description: 
Content-Disposition: attachment; filename=0001-PCI-Release-BAR0-of-an-integrated-bridge-to-allow-GP.patch

RnJvbSA5NDhhNDlmMDFkZjU0YjM0MzU4NjExMzhhMGVhZTg1YmIyYzNmMWYz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogPT9VVEYtOD9xP0ls
cG89MjBKPUMzPUE0cnZpbmVuPz0gPGlscG8uamFydmluZW5AbGludXguaW50
ZWwuY29tPg0KRGF0ZTogV2VkLCAxNyBTZXAgMjAyNSAxNToyNDo1MyArMDMw
MA0KU3ViamVjdDogW1BBVENIIDEvMV0gUENJOiBSZWxlYXNlIEJBUjAgb2Yg
YW4gaW50ZWdyYXRlZCBicmlkZ2UgdG8gYWxsb3cgR1BVDQogQkFSIHJlc2l6
ZQ0KTUlNRS1WZXJzaW9uOiAxLjANCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOA0KQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdA0KDQpSZXNpemluZyBCQVIgdG8gYSBsYXJnZXIgc2l6ZSBoYXMgdG8g
cmVsZWFzZSB1cHN0cmVhbSBicmlkZ2Ugd2luZG93cyBpbg0Kb3JkZXIgbWFr
ZSB0aGUgYnJpZGdlIHdpbmRvd3MgbGFyZ2VyIGFzIHdlbGwgKGFuZCB0byBw
b3RlbnRpYWwgcmVsb2NhdGUNCnRoZW0gaW50byBhIGxhcmdlciBmcmVlIGJs
b2NrIHdpdGhpbiBpb21lbSBzcGFjZSkuIFNvbWUgR1BVcyBoYXZlIGFuDQpp
bnRlZ3JhdGVkIFBDSSBzd2l0Y2ggdGhhdCBoYXMgQkFSMC4gVGhlIHJlc291
cmNlIGFsbG9jYXRpb24gYXNzaWducw0Kc3BhY2UgZm9yIHRoYXQgQkFSMCBh
cyBpdCBkb2VzIGZvciBhbnkgcmVzb3VyY2UuDQoNCkFuIGV4dHJhIHJlc291
cmNlIG9uIGEgYnJpZGdlIHdpbGwgcGluIGl0cyB1cHN0cmVhbSBicmlkZ2Ug
d2luZG93IGluDQpwbGFjZSB3aGljaCBwcmV2ZW50cyBCQVIgcmVzaXplIGZv
ciBhbnl0aGluZyBiZW5lYXRoIHRoYXQgYnJpZGdlLg0KDQpOb3RoaW5nIGlu
IHRoZSBwY2llcG9ydCBkcml2ZXIgcHJvdmlkZWQgYnkgUENJIGNvcmUsIHdo
aWNoIHR5cGljYWxseSBpcw0KdGhlIGRyaXZlciBib3VuZCB0byB0aGVzZSBi
cmlkZ2VzLCByZXF1aXJlcyB0aGF0IEJBUjAuIEJlY2F1c2Ugb2YgdGhhdCwN
CnJlbGVhc2luZyB0aGUgZXh0cmEgQkFSIGRvZXMgbm90IHNlZW0gdG8gaGF2
ZSBub3RhYmxlIGRvd25zaWRlcyBidXQNCmNvbWVzIHdpdGggYSBjbGVhciB1
cHNpZGUuDQoNClRoZXJlZm9yZSwgcmVsZWFzZSBCQVIwIG9mIHN1Y2ggc3dp
dGNoZXMgdXNpbmcgYSBxdWlyayBhbmQgY2xlYXIgaXRzDQpmbGFncyB0byBw
cmV2ZW50IGFueSBuZXcgaW52b2NhdGlvbiBvZiB0aGUgcmVzb3VyY2UgYXNz
aWdubWVudA0KYWxnb3JpdGhtIGZyb20gYXNzaWduaW5nIHRoZSByZXNvdXJj
ZSBhZ2Fpbi4NCg0KRHVlIHRvIG90aGVyIHNpYmxpbmdzIHdpdGhpbiB0aGUg
UENJIGhpZXJhcmNoeSBvZiBhbGwgdGhlIGRldmljZXMNCmludGVncmF0ZWQg
aW50byB0aGUgR1BVLCBzb21lIG90aGVyIGRldmljZXMgbWF5IHN0aWxsIGhh
dmUgdG8gYmUNCm1hbnVhbGx5IHJlbW92ZWQgYmVmb3JlIHRoZSByZXNpemUg
aXMgZnJlZSBvZiBhbnkgYnJpZGdlIHdpbmRvdyBwaW5zLg0KU3VjaCBzaWJs
aW5ncyBjYW4gYmUgcmVsZWFzZWQgdGhyb3VnaCBzeXNmcyB0byB1bnBpbiB3
aW5kb3dzIHdoaWxlDQpsZWF2aW5nIGFjY2VzcyB0byBHUFUncyBzeXNmcyBl
bnRyaWVzIHJlcXVpcmVkIGZvciBpbml0aWF0aW5nIHRoZQ0KcmVzaXplIG9w
ZXJhdGlvbiwgd2hlcmVhcyByZW1vdmluZyB0aGUgdG9wbW9zdCBicmlkZ2Ug
dGhpcyBxdWlyaw0KdGFyZ2V0cyB3b3VsZCByZXN1bHQgaW4gcmVtb3Zpbmcg
dGhlIEdQVSBkZXZpY2UgYXMgd2VsbCBzbyBubyBtYW51YWwNCndvcmthcm91
bmQgZm9yIHRoaXMgcHJvYmxlbSBleGlzdHMuDQoNClJlcG9ydGVkLWJ5OiBM
dWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCkxp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS9mbDZ0eDV6
dHZ0dGc3dHhtejJwczdveWQ3NDV3ZzNsd2NwM2g3ZXNtdm55ZzI2bjQ0eUBv
d28yb2ppdTJtb3YvDQpTaWduZWQtb2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8
aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQotLS0NCg0KVGhpcyBm
ZWVscyBxdWl0ZSBoYWNreSB0byBtZSBhbmQgSSdtIHdvcmtpbmcgdG93YXJk
cyBhIGJldHRlciBzb2x1dGlvbg0Kd2hpY2ggaXMgdG8gY29uc2lkZXIgUmVz
aXphYmxlIEJBUiBtYXhpbXVtIHNpemUgdGhlIHJlc291cmNlIGZpdHRpbmcN
CmFsZ29yaXRobS4gQnV0IHRoZW4sIEkgZG9uJ3QgZXhwZWN0IHRoZSBiZXR0
ZXIgc29sdXRpb24gdG8gYmUgc29tZXRoaW5nDQp3ZSB3YW50IHRvIHB1c2gg
aW50byBzdGFibGUgZHVlIHRvIGV4dHJlbWVseSBpbnZhc2l2ZSBkZXBlbmRl
bmNpZXMuIFNvDQptYXliZSBjb25zaWRlciB0aGlzIGFuIGludGVyaW0vbGVn
YWN5IHNvbHV0aW9uIHRvIHRoZSByZXNpemluZyBwcm9ibGVtDQphbmQgcmVt
b3ZlIGl0IG9uY2UgdGhlIGFsZ29yaXRobWljIGFwcHJvYWNoIHdvcmtzIChv
ciBtb3JlIHByZWNpc2VseQ0KcmV0YWluIGl0IG9ubHkgaW4gdGhlIG9sZCBr
ZXJuZWwgdmVyc2lvbnMpLg0KLS0tDQogZHJpdmVycy9wY2kvcXVpcmtzLmMg
fCAyMCArKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAy
MCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9x
dWlya3MuYyBiL2RyaXZlcnMvcGNpL3F1aXJrcy5jDQppbmRleCBkOTczMzVh
NDAxOTMuLjk4YTRmMGExMjg1YiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGNp
L3F1aXJrcy5jDQorKysgYi9kcml2ZXJzL3BjaS9xdWlya3MuYw0KQEAgLTYz
MzgsMyArNjMzOCwyMyBAQCBzdGF0aWMgdm9pZCBwY2lfbWFza19yZXBsYXlf
dGltZXJfdGltZW91dChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCiBERUNMQVJF
X1BDSV9GSVhVUF9GSU5BTChQQ0lfVkVORE9SX0lEX0dMSSwgMHg5NzUwLCBw
Y2lfbWFza19yZXBsYXlfdGltZXJfdGltZW91dCk7DQogREVDTEFSRV9QQ0lf
RklYVVBfRklOQUwoUENJX1ZFTkRPUl9JRF9HTEksIDB4OTc1NSwgcGNpX21h
c2tfcmVwbGF5X3RpbWVyX3RpbWVvdXQpOw0KICNlbmRpZg0KKw0KKy8qDQor
ICogUENJIHN3aXRjaGVzIGludGVncmF0ZWQgaW50byBzb21lIEdQVXMgaGF2
ZSBCQVIwIHRoYXQgcHJldmVudHMgcmVzaXppbmcNCisgKiB0aGUgQkFScyBv
ZiB0aGUgR1BVIGRldmljZSBkdWUgdG8gdGhhdCBicmlkZ2UgQkFSMCBwaW5u
aW5nIHRoZSBicmlkZ2UNCisgKiB3aW5kb3cgaXQncyB1bmRlciBpbiBwbGFj
ZS4gTm90aGluZyBpbiBwY2llcG9ydCByZXF1aXJlcyB0aGF0IEJBUjAuDQor
ICoNCisgKiBSZWxlYXNlIGFuZCBkaXNhYmxlIEJBUjAgcGVybWFuZW50bHkg
YnkgY2xlYXJpbmcgaXRzIGZsYWdzIHRvIHByZXZlbnQNCisgKiBhbnl0aGlu
ZyBmcm9tIGFzc2lnbmluZyBpdCBhZ2Fpbi4NCisgKi8NCitzdGF0aWMgdm9p
ZCBwY2lfcmVsZWFzZV9iYXIwKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KK3sN
CisJc3RydWN0IHJlc291cmNlICpyZXMgPSBwY2lfcmVzb3VyY2VfbihwZGV2
LCAwKTsNCisNCisJaWYgKCFyZXMtPnBhcmVudCkNCisJCXJldHVybjsNCisN
CisJcGNpX3JlbGVhc2VfcmVzb3VyY2UocGRldiwgMCk7DQorCXJlcy0+Zmxh
Z3MgPSAwOw0KK30NCitERUNMQVJFX1BDSV9GSVhVUF9FTkFCTEUoUENJX1ZF
TkRPUl9JRF9JTlRFTCwgMHhlMmZmLCBwY2lfcmVsZWFzZV9iYXIwKTsNCg0K
YmFzZS1jb21taXQ6IDhmNWFlMzBkNjlkNzU0M2VlZTBkNzAwODNkYWY0ZGU4
ZmUxNWQ1ODUNCi0tIA0KMi4zOS41DQoNCg==

--8323328-161591600-1758110677=:1127--
