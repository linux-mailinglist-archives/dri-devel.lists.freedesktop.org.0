Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC94B58386
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004AC10E527;
	Mon, 15 Sep 2025 17:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B23s2AYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81F610E527;
 Mon, 15 Sep 2025 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757957058; x=1789493058;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=+P/2wCR/9Hak80Mi5lPuK6+Nd2HtZ5zZZ39kC4bH8Q4=;
 b=B23s2AYZBxDbblxoTS64Pxrpbj+/wUTkqeb76bHx6kGMU1z/gG+9bHBg
 bK/ob2X8pPTWZCfsR7xzeJwIm3ZLq41INBW6ToC3uT+h4gvIMLmQQIlki
 VsP5cUWJsofVDYQysKfgzjrTh1XeYl30dpGaeZoyRKkPAjizUMACUu9+4
 dKA9dHJfuOByQSjn/4yW7ovhK4xo6SE6TceRHoZSp6nZGnDBI5ghx1/8J
 GJzvH3RHjN5I8TdnMYtGkR8vxpPJkVMgjmI3xmxf2R0aabOr+ThVHBRVL
 ZjxCofhfTJiv7ooPFmhSWUhUycPX9NRc+RVhqIL8zJPcWjs69vBG2t0SF A==;
X-CSE-ConnectionGUID: oZFs4H1ORrGZGOhz8OcS6Q==
X-CSE-MsgGUID: 5KIxMXrGRLSUPhaHkXk9Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="71648174"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="71648174"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 10:24:17 -0700
X-CSE-ConnectionGUID: i5Qz10lnR2OoCncGEaOxjw==
X-CSE-MsgGUID: cQup3bBvSqe8JMekJAsPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="174524815"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 10:24:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Sep 2025 20:24:06 +0300 (EEST)
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
In-Reply-To: <wqukxnxni2dbpdhri3cbvlrzsefgdanesgskzmxi5sauvsirsl@xor663jw2cdw>
Message-ID: <fafda2a3-fc63-ce97-d22b-803f771a4d19@linux.intel.com>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <wqukxnxni2dbpdhri3cbvlrzsefgdanesgskzmxi5sauvsirsl@xor663jw2cdw>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-225775944-1757957046=:1043"
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

--8323328-225775944-1757957046=:1043
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 15 Sep 2025, Lucas De Marchi wrote:

> On Mon, Sep 15, 2025 at 12:13:47PM +0300, Ilpo J=E4rvinen wrote:
> > pci.c has been used as catch everything that doesn't fits elsewhere
> > within PCI core and thus resizable BAR code has been placed there as
> > well. Move Resizable BAR related code to a newly introduced rebar.c to
> > reduce size of pci.c. After move, there are no pci_rebar_*() calls from
> > pci.c indicating this is indeed well-defined subset of PCI core.
> >=20
> > Endpoint drivers perform Resizable BAR related operations which could
> > well be performed by PCI core to simplify driver-side code. This
> > series adds a few new API functions to that effect and converts the
> > drivers to use the new APIs (in separate patches).
> >=20
> > While at it, also convert BAR sizes bitmask to u64 as PCIe spec already
> > specifies more sizes than what will fit u32 to make the API typing more
> > future-proof. The extra sizes beyond 128TB are not added at this point.
> >=20
> > These are based on pci/main plus a simple "adapter" patch to add the
> > include for xe_vram_types.h that was added by a commit in drm-tip.
> > Hopefully that is enough to avoid the within context conflict with
> > BAR_SIZE_SHIFT removal to let the xe CI tests to be run for this
> > series.
> >=20
> > There are two minor conflicts with the work in pci/resource but I'm
> > hesitant to base this on top of it as this is otherwise entirely
> > independent (and would likely prevent GPU CI tests as well). If we end
> > up having to pull the bridge window select changes, there should be no
> > reason why this does have to become collateral damage (so my
> > suggestion, if this is good to go in this cycle, to take this into a
> > separate branch than pci/resource and deal with those small conflicts
> > while merging into pci/next).
> >=20
> > I've tested sysfs resize, i915, and xe BAR resizing functionality. In
> > the case of xe, I did small hack patch as its resize is anyway broken
> > as is because BAR0 pins the bridge window so resizing BAR2 fails. My
> > hack caused other problems further down the road (likely because BAR0
> > is in use by the driver so releasing it messed assumptions xe driver
> > has) but the BAR resize itself was working which was all I was
>=20
> is the hack you mention here to release all BARs before attempting the
> resize?

Yes, the patch added release of BAR0 prior to resize. The existing xe code=
=20
in _resize_bar() already releases BAR2.

During resize, if the first loop in pbus_reassign_bridge_resources()=20
(called from pci_resize_resource()) finds the bridge window closest to the=
=20
endpoint still has a child, it results in having empty saved list because=
=20
all upstream bridge windows will then have a child as well.

Empty saved list is checked after the loop and=20
pbus_reassign_bridge_resources() returns -ENOENT without even trying to=20
assign the resources. The error is returned even if the actual bridge=20
window size is large enough to fit the resized resource.

The logic in pci_resize_resource() and pbus_reassign_bridge_resources()=20
need some other improvements besides that problem, but I likely won't=20
have time to look at that until completing the fitting algorithm changes.
I'd actually want to add pci_release_and_resize_resource() which would
take care of releasing all the resources of the device (obviously driver=20
must have its hands off all those BARs when it calls that function). With=
=20
the current pci_resize_resource() API, handling the restore of BARs in=20
case of failure is not as robust as I'd like to make it.

> > interested to know. I'm not planning to pursue fixing the pinning
> > problem within xe driver because the core changes to consider maximum
> > size of the resizable BARs should take care of the main problem by
> > different means.
>=20
> I'd actually like to pursue that myself as that could be propagated to
> stable since we do have some resize errors in xe with BMG that I wasn't
> understanding. It's likely due to xe_mmio_probe_early() taking a hold of
> BAR0 and not expecting it to be moved. We could either remap if we have
> have to resize or just move the resize logic early on.

Great. If you have any questions when it comes to the PCI core side code,=
=20
please let me know.

--=20
 i.

> > Some parts of this are to be used by the resizable BAR changes into the
> > resource fitting/assingment logic but these seem to stand on their own
> > so sending these out now to reduce the size of the other patch series.
> >=20
> > v2:
> > - Kerneldoc:
> >  - Improve formatting of errno returns
> >  - Open "ctrl" -> "control"
> >  - Removed mislead "bit" words (when referring to BAR size)
> >  - Rewrote pci_rebar_get_possible_sizes() kernel doc to not claim the
> >    returned bitmask is defined in PCIe spec as the capability bits now
> >    span across two registers in the spec and are not continuous (we
> >    don't support the second block of bits yet, but this API is expected
> >    to return the bits without the hole so it will not be matching with
> >    the spec layout).
> > - Dropped superfluous zero check from pci_rebar_size_supported()
> > - Small improvement to changelog of patch 7
> >=20
> > Ilpo J=E4rvinen (11):
> >  PCI: Move Resizable BAR code into rebar.c
> >  PCI: Cleanup pci_rebar_bytes_to_size() and move into rebar.c
> >  PCI: Move pci_rebar_size_to_bytes() and export it
> >  PCI: Improve Resizable BAR functions kernel doc
> >  PCI: Add pci_rebar_size_supported() helper
> >  drm/i915/gt: Use pci_rebar_size_supported()
> >  drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()
> >  PCI: Add pci_rebar_get_max_size()
> >  drm/xe/vram: Use pci_rebar_get_max_size()
> >  drm/amdgpu: Use pci_rebar_get_max_size()
> >  PCI: Convert BAR sizes bitmasks to u64
> >=20
> > Documentation/driver-api/pci/pci.rst        |   3 +
> > drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   8 +-
> > drivers/gpu/drm/i915/gt/intel_region_lmem.c |  10 +-
> > drivers/gpu/drm/xe/xe_vram.c                |  32 +-
> > drivers/pci/Makefile                        |   2 +-
> > drivers/pci/iov.c                           |   9 +-
> > drivers/pci/pci-sysfs.c                     |   2 +-
> > drivers/pci/pci.c                           | 145 ---------
> > drivers/pci/pci.h                           |   5 +-
> > drivers/pci/rebar.c                         | 314 ++++++++++++++++++++
> > drivers/pci/setup-res.c                     |  78 -----
> > include/linux/pci.h                         |  15 +-
> > 12 files changed, 350 insertions(+), 273 deletions(-)
> > create mode 100644 drivers/pci/rebar.c
> >=20
> >=20
> > base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> > prerequisite-patch-id: 35bd3cd7a60ff7d887450a7fdde73b055a76ae24
> > --=20
> > 2.39.5
> >=20
>=20
--8323328-225775944-1757957046=:1043--
