Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45061ACDD62
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 14:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B518410E68E;
	Wed,  4 Jun 2025 12:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAaTc6MZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5EC10E6A2;
 Wed,  4 Jun 2025 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749038509; x=1780574509;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5uYOx3CB6u/X6OaqsKXCzL9wycFBnRygRPmG3aAModk=;
 b=WAaTc6MZsXI+p6g26g47+O3fUWbKNivBJxVLo6F9vqLB5epbajrs4SvK
 RoirKglVKS9a0/DBeQZADtrRgTBuvy4EUqFgiXxFyxuLp5nUs116rWQ3h
 gfGuYToDyeYoi7zQvJzW4l6guqgUIsX6g7UJL5qnQyzgWkpQUr+3gxCJj
 R5qegWLo6beu90zDiCQwvGfwY6VCbVaTevPBrL9PCEUDRh1Uum9Ixk4NP
 Kd/Gt2IFsrb7I5kdz5AMWlmRAfO7W6/885wpR7uyWvRUJ1Nk5KATieKYB
 GvxsE3cV2N74Z3zM++B9H0NEtAPhrG0P5P4jE7yIHx7cQ9ZpI69cJv7yF Q==;
X-CSE-ConnectionGUID: /E+Ugt/ESpm3tKPWOdxD8w==
X-CSE-MsgGUID: JYsNW4fJR0GerJNoNNTayA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62169245"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="62169245"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:01:49 -0700
X-CSE-ConnectionGUID: PAuo9/JWS5SD/zD1RrgNwQ==
X-CSE-MsgGUID: nLXiz6nlRWebh++8vnW1eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145042432"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.121])
 ([10.245.245.121])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:01:46 -0700
Message-ID: <245c58afa07f1f7fcd168491e5f4073eaef982aa.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/3] drm/gpusvm, drm/pagemap, drm/xe: Restructure
 migration in preparation for multi-device
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 apopple@nvidia.com, airlied@gmail.com, Simona Vetter
 <simona.vetter@ffwll.ch>, 	felix.kuehling@amd.com, Matthew Brost
 <matthew.brost@intel.com>, dakr@kernel.org,  "Mrozek, Michal"
 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Yang, Philip"	 <Philip.Yang@amd.com>
Date: Wed, 04 Jun 2025 14:01:44 +0200
In-Reply-To: <b19b3deb-5a14-459c-b076-08be55a62769@amd.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
 <b19b3deb-5a14-459c-b076-08be55a62769@amd.com>
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

Hi,

On Wed, 2025-06-04 at 12:01 +0200, Christian K=C3=B6nig wrote:
> Hi Thomas,
>=20
> please make sure to loop in Kuehling, Felix <Felix.Kuehling@amd.com>
> and Yang, Philip <Philip.Yang@amd.com> for that kind of stuff.
>=20
> I'm absolutely not deep enough in the pagemap handling to judge any
> of that here.
>=20
> Thanks,
> Christian.

Sure, Felix was CC'd and I'll make sure Philip will be CC'd on the next
revision.

Thanks,
Thomas


>=20
> On 6/4/25 11:35, Thomas Hellstr=C3=B6m wrote:
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
> >=20
> > v2:
> > - Rebase.
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
=C2=A0=C2=A0 | 760 +----------------------
> > -
> > =C2=A0drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 846
> > +++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> > =C2=A0drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 129 ++--
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
> > =C2=A013 files changed, 1107 insertions(+), 914 deletions(-)
> > =C2=A0create mode 100644 drivers/gpu/drm/drm_pagemap.c
> >=20
>=20

