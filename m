Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB820C7877B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8CF10E849;
	Fri, 21 Nov 2025 10:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGdd3on0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820B210E849;
 Fri, 21 Nov 2025 10:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763720376; x=1795256376;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ImYrT4ezOGbF3CP/zqe9wmHgOUPHDvbUTkb7IowfDTc=;
 b=mGdd3on0/UPJb3LIISkNAaQThucODjpGQv05nj4OpMloWD9kaGzhPJ7c
 uX9rLZXkwPZ9YooiKtg1bwqx5VfBl0Td1yoKGV5RZl0nuNl8jFA6CVsEA
 8xyMAg++tfQZoGgINF6dFAx348y0Lx7mDNDFluExDUxcH8oYv3MbDVnee
 bUp2T52X0DwJM1B1LyxkuY+MJqHnBPGNYNoMJRZJlTFyTQv8arRgu1V5a
 ALP8wTgBJ3pTDLPmT/yUdrNteplClVfiDgT3X0xYAmuQ3SVjURbZt2Sro
 xFaVYQxmNwsBXntT8Gk01fSmAoKr9Wl1h7e42MCqYrQ4Nh8EUhfEW1F0v Q==;
X-CSE-ConnectionGUID: wDIzIBhUQ+K8lyBidU/XFw==
X-CSE-MsgGUID: YShc3l6bRXuJztx0HAP1JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65744814"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65744814"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 02:19:35 -0800
X-CSE-ConnectionGUID: qe5RUukAT6mmyZcI9/lB2w==
X-CSE-MsgGUID: uOkXJz9ZTtKONrRjsswzDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191448644"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.9])
 ([10.245.245.9])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 02:19:31 -0800
Message-ID: <ee0b6593e57360a21e76698e8e0adf6dde63cb87.camel@linux.intel.com>
Subject: Re: [PATCH v2 02/17] drm/pagemap, drm/xe: Add refcounting to struct
 drm_pagemap
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, 	apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, 	felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Fri, 21 Nov 2025 11:19:29 +0100
In-Reply-To: <c02af65a-4b5c-47d6-b1b0-6216fd0e3e0c@intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-3-thomas.hellstrom@linux.intel.com>
 <c02af65a-4b5c-47d6-b1b0-6216fd0e3e0c@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi, Himal!

On Wed, 2025-11-12 at 11:37 +0530, Ghimiray, Himal Prasad wrote:
>=20
>=20
> On 11-11-2025 22:13, Thomas Hellstr=C3=B6m wrote:
> > With the end goal of being able to free unused pagemaps
> > and allocate them on demand, add a refcount to struct drm_pagemap,
> > remove the xe embedded drm_pagemap, allocating and freeing it
> > explicitly.
> >=20
> > v2:
> > - Make the drm_pagemap pointer in drm_gpusvm_pages reference-
> > counted.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
> > ---
> > =C2=A0 drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ++-
> > =C2=A0 drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 51
> > ++++++++++++++++++++++++++++++
> > =C2=A0 drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 26 ++++++++++-----
> > =C2=A0 drivers/gpu/drm/xe/xe_vram_types.h |=C2=A0 2 +-
> > =C2=A0 include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 36 +++++++++++++++++++++
> > =C2=A0 5 files changed, 109 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > b/drivers/gpu/drm/drm_gpusvm.c
> > index 73e550c8ff8c..1f96375d1f2b 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -1038,6 +1038,7 @@ static void __drm_gpusvm_unmap_pages(struct
> > drm_gpusvm *gpusvm,
> > =C2=A0=C2=A0		flags.has_dma_mapping =3D false;
> > =C2=A0=C2=A0		WRITE_ONCE(svm_pages->flags.__flags,
> > flags.__flags);
> > =C2=A0=20
> > +		drm_pagemap_put(svm_pages->dpagemap);
> > =C2=A0=C2=A0		svm_pages->dpagemap =3D NULL;
> > =C2=A0=C2=A0	}
> > =C2=A0 }
> > @@ -1431,7 +1432,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > *gpusvm,
> > =C2=A0=20
> > =C2=A0=C2=A0	if (pagemap) {
> > =C2=A0=C2=A0		flags.has_devmem_pages =3D true;
> > -		svm_pages->dpagemap =3D dpagemap;
> > +		drm_pagemap_put(svm_pages->dpagemap);
>=20
> Dont we risk a UAF for dpagemap if svm_pages->dpagemap is same as
> dpagemap ?

Thanks for reviewing. Here the dpagemap refcount is protected from
dropping to zero by a page presence in the CPU address space and us
holding the notifier lock. But agree that this looks bad from a
reader's perspective. I'll fix that up.

Thanks,
Thomas


