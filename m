Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51875A646FB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9554710E3D5;
	Mon, 17 Mar 2025 09:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4QnpVYh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2C510E3D5;
 Mon, 17 Mar 2025 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742203282; x=1773739282;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EFAoYZDI7HkF3bvFfpEHnfwSP0iCC1HY5NDke9vOBR0=;
 b=P4QnpVYh4viM6Q6ZX/txLX1QKYu92gNpFrZsIXkfYiPXd35n475fqqWM
 TxXzoox68Th6oNtzDTQyjMGP+7pRgv2ZynelKgFEU6n8ajxkFF+BUz3FK
 gIHMNJpKOQwICoWmgoBV+RLWuxq1XzoGolf5qv3HFHFGZvObJk9SlK1wE
 1sFXFtCMSGKnKWcXVdlveLPOELSsbCoWbNSOs747ja919KqNXcl6q0bg8
 Ke4TEJVSq7t8eCm94tPeFamrJYkLIEdhv98DY7j/H5ilt4BaD/iG/sh5t
 4zwOlUZaeYtdwigec36oMNnGrpgZoEppJ22doy8MxzC8qWzUVOs+kB3jC g==;
X-CSE-ConnectionGUID: 6ey5GXOFQYefnbN0gpzr/A==
X-CSE-MsgGUID: Ea09EoovRxWInwlL6SWmyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43156551"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="43156551"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 02:21:21 -0700
X-CSE-ConnectionGUID: /qzjQ7e+SoaesihztImbQQ==
X-CSE-MsgGUID: XgxZrGNZTse/KYCpEhWPew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="126741531"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.44])
 ([10.245.246.44])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 02:21:18 -0700
Message-ID: <0cec6c8ad9ed854300d4533eb8659fb017e76ae6.camel@linux.intel.com>
Subject: Re: [RFC PATCH 00/19] drm, drm/xe: Multi-device GPUSVM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Matthew
 Brost <matthew.brost@intel.com>, 	dakr@kernel.org, "Mrozek, Michal"
 <michal.mrozek@intel.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>
Date: Mon, 17 Mar 2025 10:20:48 +0100
In-Reply-To: <50a6d33b-1b8f-4a3e-8698-1e4508eb3be0@amd.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
 <3c7950d8-75bd-48d0-9713-b76feea87a37@amd.com>
 <466cdc46b81b4e1a51fa1accee8f56487cce1268.camel@linux.intel.com>
 <50a6d33b-1b8f-4a3e-8698-1e4508eb3be0@amd.com>
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

On Thu, 2025-03-13 at 13:57 +0100, Christian K=C3=B6nig wrote:
> Am 13.03.25 um 13:50 schrieb Thomas Hellstr=C3=B6m:
> > Hi, Christian
> >=20
> > On Thu, 2025-03-13 at 11:19 +0100, Christian K=C3=B6nig wrote:
> > > Am 12.03.25 um 22:03 schrieb Thomas Hellstr=C3=B6m:
> > > > This RFC implements and requests comments for a way to handle
> > > > SVM
> > > > with multi-device,
> > > > typically with fast interconnects. It adds generic code and
> > > > helpers
> > > > in drm, and
> > > > device-specific code for xe.
> > > >=20
> > > > For SVM, devices set up maps of device-private struct pages,
> > > > using
> > > > a struct dev_pagemap,
> > > > The CPU virtual address space (mm), can then be set up using
> > > > special page-table entries
> > > > to point to such pages, but they can't be accessed directly by
> > > > the
> > > > CPU, but possibly
> > > > by other devices using a fast interconnect. This series aims to
> > > > provide helpers to
> > > > identify pagemaps that take part in such a fast interconnect
> > > > and to
> > > > aid in migrating
> > > > between them.
> > > >=20
> > > > This is initially done by augmenting the struct dev_pagemap
> > > > with a
> > > > struct drm_pagemap,
> > > > and having the struct drm_pagemap implement a "populate_mm"
> > > > method,
> > > > where a region of
> > > > the CPU virtual address space (mm) is populated with
> > > > device_private
> > > > pages from the
> > > > dev_pagemap associated with the drm_pagemap, migrating data
> > > > from
> > > > system memory or other
> > > > devices if necessary. The drm_pagemap_populate_mm() function is
> > > > then typically called
> > > > from a fault handler, using the struct drm_pagemap pointer of
> > > > choice. It could be
> > > > referencing a local drm_pagemap or a remote one. The migration
> > > > is
> > > > now completely done
> > > > by drm_pagemap callbacks, (typically using a copy-engine local
> > > > to
> > > > the dev_pagemap local
> > > > memory).
> > > Up till here that makes sense. Maybe not necessary to be put into
> > > the
> > > DRM layer, but that is an implementation detail.
> > >=20
> > > > In addition there are helpers to build a drm_pagemap UAPI using
> > > > file-descripors
> > > > representing struct drm_pagemaps, and a helper to register
> > > > devices
> > > > with a common
> > > > fast interconnect. The UAPI is intended to be private to the
> > > > device, but if drivers
> > > > agree to identify struct drm_pagemaps by file descriptors one
> > > > could
> > > > in theory
> > > > do cross-driver multi-device SVM if a use-case were found.
> > > But this completely eludes me.
> > >=20
> > > Why would you want an UAPI for representing pagemaps as file
> > > descriptors? Isn't it the kernel which enumerates the
> > > interconnects
> > > of the devices?
> > >=20
> > > I mean we somehow need to expose those interconnects between
> > > devices
> > > to userspace, e.g. like amdgpu does with it's XGMI connectors.
> > > But
> > > that is static for the hardware (unless HW is hot removed/added)
> > > and
> > > so I would assume exposed through sysfs.
> > Thanks for the feedback.
> >=20
> > The idea here is not to expose the interconnects but rather have a
> > way
> > for user-space to identify a drm_pagemap and some level of access-
> > and
> > lifetime control.
>=20
> Well that's what I get I just don't get why?
>=20
> I mean when you want to have the pagemap as optional feature you can
> turn on and off I would say make that a sysfs file.
>=20
> It's a global feature anyway and not bound in any way to the file
> descriptor, isn't it?

Getting back on this we had some discussions internally on this and the
desired behavior is to have the device-private pages on a firstopen-
lastclose lifetime (Or rather firstopen-(lastclose + shrinker))
lifetime, for memory usage concerns. So I believe a file descriptor is
a good fit for the UAPI representation.

Thanks,
Thomas


