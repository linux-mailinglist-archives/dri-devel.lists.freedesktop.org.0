Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A10AE0260
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 12:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CF410E9F1;
	Thu, 19 Jun 2025 10:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNQbxEai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B1710E9EE;
 Thu, 19 Jun 2025 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750327638; x=1781863638;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FkE6CCsv2Aj+bE4i8vSe8mQO8Fk+BitnyizwHAp4cmQ=;
 b=nNQbxEaiX2Uc50vUesXmJUQI8PwWGTz6QryI9SXCEi+7+6+7yNb9MSCe
 kG//JUUG3p9OnZFNN8LMkcggwacrLB3am9qeArhWOXPbj6OwqLngRSGx8
 95ca/LpjkNYZOy6LrhAqIXJ7QD9NRDWXhwTFDfhRDUvyHGd1ZCIuqMZSb
 b0eTZMeUmbrF38AckDCynHQL7GKa2+09sq8pksNC4SryJ/QFueL6KeVT1
 voYTcwo2JGgG+FS4D5sIFQriSFJzetqwHXVN7XisjSIC3cncdPJ0ZuPHv
 jow+wjF07kF1HGM84N4/s6gymIYliJcrlAEw6ju/s2ChLzVzKcgE63uJU A==;
X-CSE-ConnectionGUID: b7tg6ibpR7yarPGjl7/J8A==
X-CSE-MsgGUID: 36zVoWc5TZe5IB3s5xi4Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63937925"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="63937925"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 03:07:16 -0700
X-CSE-ConnectionGUID: pZSI0L+xQ2in7OKZjvJjcQ==
X-CSE-MsgGUID: EbE9yKFNRmOpowDOywLKdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="154980312"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.196])
 ([10.245.244.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 03:07:12 -0700
Message-ID: <9c6e76eb893ec6076812e01f90724f0fba358c0e.camel@linux.intel.com>
Subject: Re: [PATCH v5 0/3] drm/gpusvm, drm/pagemap, drm/xe: Restructure
 migration in preparation for multi-device
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, airlied@gmail.com, Simona Vetter	
 <simona.vetter@ffwll.ch>, Felix =?ISO-8859-1?Q?K=FChling?=	
 <felix.kuehling@amd.com>, Philip Yang <philip.yang@amd.com>, Matthew Brost	
 <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, dakr@kernel.org, "Mrozek, Michal"	
 <michal.mrozek@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Thu, 19 Jun 2025 12:07:10 +0200
In-Reply-To: <4w2pw62mep3tdfyouusm334izjhsqajnxkzjbgg6kd7llia72t@nevp4u5hikfz>
References: <20250618201617.54100-1-thomas.hellstrom@linux.intel.com>
 <4w2pw62mep3tdfyouusm334izjhsqajnxkzjbgg6kd7llia72t@nevp4u5hikfz>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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


Hi, Alistair, Thanks for having a look!

On Thu, 2025-06-19 at 14:52 +1000, Alistair Popple wrote:
> On Wed, Jun 18, 2025 at 10:16:14PM +0200, Thomas Hellstr=C3=B6m wrote:
> > This patchset modifies the migration part of drm_gpusvm to
> > drm_pagemap and
> > adds a populate_mm() op to drm_pagemap.
> >=20
> > The idea is that the device that receives a pagefault determines if
> > it wants to
> > migrate content and to where. It then calls the populate_mm()
> > method of relevant
> > drm_pagemap.
> >=20
> > This functionality was mostly already in place, but hard-coded for
> > xe only without
> > going through a pagemap op. Since we might be dealing with separate
> > devices moving
> > forward, it also now becomes the responsibilit of the populate_mm()
> > op to
> > grab any necessary local device runtime pm references and keep them
> > held while
> > its pages are present in an mm (struct mm_struct).
> >=20
> > On thing to decide here is whether the populate_mm() callback
> > should sit on a
> > struct drm_pagemap for now while we sort multi-device usability out
> > or whether
> > we should add it (or something equivalent) to struct dev_pagemap.
>=20
> I'm still looking at this series (sorry it took until v5 for me to
> notice
> it!) but my immediate reaction here is why do/would you need to add
> anything
> to struct dev_pagemap? The common approach here has been to embed
> struct
> dev_pagemap in some driver defined struct and use container_of to go
> from the
> page to the driver (or in this case DRM) specific pagemap.
>=20
> See for example dmirror_page_to_chunk() in the HMM self test or
> nouveau_page_to_chunk(). Is there some reason something like that
> would work
> here?

Future patches will, as they are currently written, do something like
this for embedding:

struct xe_pagemap {
	struct dev_pagemap pagemap;
	struct drm_pagemap dpagemap;
};

So that the drm_pagemap can be obtained that way. The reason for that
is to avoid diamond inheritance if the driver wanted to embed a
pcie_p2p pagemap instead of a struct dev_pagemap. But if that becomes
unlikely we could of course embed the dev_pagemap directly into the
drm_pagemap.


>=20
> Actually I notice the Xe driver currently does use this to point to a
> struct
> xe_vram_region which contains drm_pagemap pointer. If I understand
> correctly
> we're trying to move a lot of the SVM functionality into a generic
> DRM layer,
> so would it make more sense to have dev_pgmap embeded in drm_pgmap
> and have that
> contain the pointer to any required driver-specific data?
>=20
> Also FWIW I don't think zone_device_data is strictly required. It's
> convenient,
> but I suspect it only exists because it could be easily provided
> within the
> footprint of the existing struct page due to not using all the fields
> for
> ZONE_DEVICE pages. I can imagine we might eventually remove it, once
> we no
> longer need struct pages and move to folios/memdescs.

It looks like, correct me if I'm wrong, like the nouveau version has
one dev_pagemap per bo. The code at hand here use multiple bos for the
memory of a single pagemap so in essence the zone_device_data provides
a pointer to the bo used for that particular page. If we lose the
zone_device_data there is probably other ways we can do that backwards
lookup, but it may become nasty.

So while I fully agree we should use some form of embedding of the
dev_pagemap, and that could be the authoritative way to go from a page
to a drm_pagemap, that is not really sufficient to go from a page to a
bo.

But more on this in upcoming multi-device patches. This series is
mostly about separating the drm_gpusvm (GPU mapping) and
drm_pagemap(migration) functionality that is already i place.

But please let me know if there are any concerns with this.

Thanks,
Thomas


>=20
> > v2:
> > - Rebase.
> > v3:
> > - Documentation updates (CI, Matt Brost)
> > - Don't change TTM buffer object type for VRAM allocations (Matt
> > Brost)
> > v4:
> > - Documentation Updates (Himal Ghimiray, Matt Brost)
> > - Add an assert (Matt Brost)
> > v5:
> > - Rebase
> > - Add R-Bs and SOBs.
> >=20
> > Matthew Brost (1):
> > =C2=A0 drm/gpusvm, drm/pagemap: Move migration functionality to
> > drm_pagemap
> >=20
> > Thomas Hellstr=C3=B6m (2):
> > =C2=A0 drm/pagemap: Add a populate_mm op
> > =C2=A0 drm/xe: Implement and use the drm_pagemap populate_mm op
> >=20
> > =C2=A0Documentation/gpu/rfc/gpusvm.rst=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
12 +-
> > =C2=A0drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 761 +----------------------
> > -
> > =C2=A0drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 838
> > +++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> > =C2=A0drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 125 ++--
> > =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> > =C2=A0drivers/gpu/drm/xe/xe_tile.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 11 +
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 96 ---
> > =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 135 +++++
> > =C2=A013 files changed, 1098 insertions(+), 912 deletions(-)
> > =C2=A0create mode 100644 drivers/gpu/drm/drm_pagemap.c
> >=20
> > --=20
> > 2.49.0
> >=20

