Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCfwJhIMcWmPcQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 18:25:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021A5A7C4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 18:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B951610E858;
	Wed, 21 Jan 2026 17:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Trl31AD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C6210E864;
 Wed, 21 Jan 2026 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769016333; x=1800552333;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=N8gWTDmCu2/voer1RdP10E4nlB90rJQjCxhjRdPiuQg=;
 b=Trl31AD2UhDRiQqf+jMx7IUap/9tyEOPSljnss6dsg9PNuREjkzgCb0y
 1tzRBoGLNZjwpMdSSTwxaBFEWNkiqdfGmjd7G0vXEOCR1CYs3+YCzU2Xy
 sdjI/7iF/Ml1wkEdXcz8RGvQDF7xDVeDoyx/xuETLemIilkgJsw9m/BLz
 8QaoQlat7UQk6qT08sfpNx9vezkkCOwDbeckUJbiA3fvo3ligOsZuFJxd
 NSJ4EY5FiHON778VLwXGjBUNg11HotZ2P7dHCcJ4z+fHly0st3qpt1oZ8
 KLiVBS+yeHTQTjDnyLDKDMqM0vepnN27Y/RYfLMdXLZC8j2pWMilWGT6e A==;
X-CSE-ConnectionGUID: eFYTQvy8TZqUD4kF9wCEpQ==
X-CSE-MsgGUID: rK9thZ6QQUqudOnJB5lSFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70342963"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70342963"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 09:25:33 -0800
X-CSE-ConnectionGUID: ml0GjAmGSeehOJ4sDeCK3w==
X-CSE-MsgGUID: 6WHj4Cs3QGSy0fpRYaK0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206929031"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.107])
 ([10.245.245.107])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 09:25:31 -0800
Message-ID: <81331db882e57f7e7e8322ba7aba87081759465f.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/2] drm, drm/xe: Fix xe userptr in the absence of
 CONFIG_DEVICE_PRIVATE
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Date: Wed, 21 Jan 2026 18:25:28 +0100
In-Reply-To: <ad0efbfc-b7b3-4dc8-9499-8a7accd6c5e4@intel.com>
References: <20260121091048.41371-1-thomas.hellstrom@linux.intel.com>
 <20260121091048.41371-2-thomas.hellstrom@linux.intel.com>
 <ad0efbfc-b7b3-4dc8-9499-8a7accd6c5e4@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,intel.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 9021A5A7C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 2026-01-21 at 17:19 +0000, Matthew Auld wrote:
> On 21/01/2026 09:10, Thomas Hellstr=C3=B6m wrote:
> > CONFIG_DEVICE_PRIVATE is not selected by default by some distros,
> > for example Fedora, and that leads to a regression in the xe driver
> > since userptr support gets compiled out.
> >=20
> > It turns out that DRM_GPUSVM, which is needed for xe userptr
> > support
> > compiles also without CONFIG_DEVICE_PRIVATE, but doesn't compile
> > without CONFIG_ZONE_DEVICE.
> > Exclude the drm_pagemap files from compilation with
> > !CONFIG_ZONE_DEVICE,
> > and remove the CONFIG_DEVICE_PRIVATE dependency from
> > CONFIG_DRM_GPUSVM and
> > the xe driver's selection of it, re-enabling xe userptr for those
> > configs.
> >=20
> > v2:
> > - Don't compile the drm_pagemap files unless CONFIG_ZONE_DEVICE is
> > set.
> > - Adjust the drm_pagemap.h header accordingly.
> >=20
> > Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: <stable@vger.kernel.org> # v6.18+
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Let me double check that while it does at least build it is also=20
> functional without DRM_XE_GPUSVM. I think it takes a different init
> path=20
> and maybe some other differences. Unless you already did?

I think I managed to test without DRM_XE_GPUSVM both with and without
ZONE_DEVICE, but since this is going to stable, a second check would be
great!

Thanks,
Thomas


>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
> > ---
> > =C2=A0 drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/Makefile=C2=A0=C2=A0 |=C2=A0 4 +++-
> > =C2=A0 drivers/gpu/drm/xe/Kconfig |=C2=A0 2 +-
> > =C2=A0 include/drm/drm_pagemap.h=C2=A0 | 18 ++++++++++++++----
> > =C2=A0 4 files changed, 19 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index a33b90251530..d3d52310c9cc 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -210,7 +210,7 @@ config DRM_GPUVM
> > =C2=A0=20
> > =C2=A0 config DRM_GPUSVM
> > =C2=A0=C2=A0	tristate
> > -	depends on DRM && DEVICE_PRIVATE
> > +	depends on DRM
> > =C2=A0=C2=A0	select HMM_MIRROR
> > =C2=A0=C2=A0	select MMU_NOTIFIER
> > =C2=A0=C2=A0	help
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 0deee72ef935..0c21029c446f 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -108,9 +108,11 @@ obj-$(CONFIG_DRM_EXEC) +=3D drm_exec.o
> > =C2=A0 obj-$(CONFIG_DRM_GPUVM) +=3D drm_gpuvm.o
> > =C2=A0=20
> > =C2=A0 drm_gpusvm_helper-y :=3D \
> > -	drm_gpusvm.o\
> > +	drm_gpusvm.o
> > +drm_gpusvm_helper-$(CONFIG_ZONE_DEVICE) +=3D \
> > =C2=A0=C2=A0	drm_pagemap.o\
> > =C2=A0=C2=A0	drm_pagemap_util.o
> > +
> > =C2=A0 obj-$(CONFIG_DRM_GPUSVM) +=3D drm_gpusvm_helper.o
> > =C2=A0=20
> > =C2=A0 obj-$(CONFIG_DRM_BUDDY) +=3D drm_buddy.o
> > diff --git a/drivers/gpu/drm/xe/Kconfig
> > b/drivers/gpu/drm/xe/Kconfig
> > index 4b288eb3f5b0..c34be1be155b 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -39,7 +39,7 @@ config DRM_XE
> > =C2=A0=C2=A0	select DRM_TTM
> > =C2=A0=C2=A0	select DRM_TTM_HELPER
> > =C2=A0=C2=A0	select DRM_EXEC
> > -	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
> > +	select DRM_GPUSVM if !UML
> > =C2=A0=C2=A0	select DRM_GPUVM
> > =C2=A0=C2=A0	select DRM_SCHED
> > =C2=A0=C2=A0	select MMU_NOTIFIER
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > index 46e9c58f09e0..2baf0861f78f 100644
> > --- a/include/drm/drm_pagemap.h
> > +++ b/include/drm/drm_pagemap.h
> > @@ -243,6 +243,8 @@ struct drm_pagemap_devmem_ops {
> > =C2=A0=C2=A0			=C2=A0=C2=A0 struct dma_fence *pre_migrate_fence);
> > =C2=A0 };
> > =C2=A0=20
> > +#if IS_ENABLED(CONFIG_ZONE_DEVICE)
> > +
> > =C2=A0 int drm_pagemap_init(struct drm_pagemap *dpagemap,
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap *pagemap,
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *drm,
> > @@ -252,17 +254,22 @@ struct drm_pagemap *drm_pagemap_create(struct
> > drm_device *drm,
> > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap
> > *pagemap,
> > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > drm_pagemap_ops *ops);
> > =C2=A0=20
> > -#if IS_ENABLED(CONFIG_DRM_GPUSVM)
> > +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page
> > *page);
> > =C2=A0=20
> > =C2=A0 void drm_pagemap_put(struct drm_pagemap *dpagemap);
> > =C2=A0=20
> > =C2=A0 #else
> > =C2=A0=20
> > +static inline struct drm_pagemap
> > *drm_pagemap_page_to_dpagemap(struct page *page)
> > +{
> > +	return NULL;
> > +}
> > +
> > =C2=A0 static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
> > =C2=A0 {
> > =C2=A0 }
> > =C2=A0=20
> > -#endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
> > +#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
> > =C2=A0=20
> > =C2=A0 /**
> > =C2=A0=C2=A0 * drm_pagemap_get() - Obtain a reference on a struct drm_p=
agemap
> > @@ -334,6 +341,8 @@ struct drm_pagemap_migrate_details {
> > =C2=A0=C2=A0	u32 source_peer_migrates : 1;
> > =C2=A0 };
> > =C2=A0=20
> > +#if IS_ENABLED(CONFIG_ZONE_DEVICE)
> > +
> > =C2=A0 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem
> > *devmem_allocation,
> > =C2=A0=C2=A0				=C2=A0 struct mm_struct *mm,
> > =C2=A0=C2=A0				=C2=A0 unsigned long start, unsigned
> > long end,
> > @@ -343,8 +352,6 @@ int drm_pagemap_evict_to_ram(struct
> > drm_pagemap_devmem *devmem_allocation);
> > =C2=A0=20
> > =C2=A0 const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void);
> > =C2=A0=20
> > -struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page
> > *page);
> > -
> > =C2=A0 void drm_pagemap_devmem_init(struct drm_pagemap_devmem
> > *devmem_allocation,
> > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev, struct mm_s=
truct
> > *mm,
> > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_devmem=
_ops
> > *ops,
> > @@ -359,4 +366,7 @@ int drm_pagemap_populate_mm(struct drm_pagemap
> > *dpagemap,
> > =C2=A0 void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool
> > is_atomic_or_reclaim);
> > =C2=A0=20
> > =C2=A0 int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
> > +
> > +#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
> > +
> > =C2=A0 #endif
