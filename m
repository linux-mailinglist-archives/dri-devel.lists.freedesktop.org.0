Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPmJMkBdlGm3DAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:21:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C92F14BE3E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F5A10E4C6;
	Tue, 17 Feb 2026 12:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqS1BbBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF17010E4C6;
 Tue, 17 Feb 2026 12:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771330876; x=1802866876;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4izq+YKgwQE8GCdVAv9mdn7fCEn5yMG7iw+rehpJHsY=;
 b=bqS1BbBqj+o6WQ2/ybKLgboo3gwnSmzGYFh5n8/DN1Up4vBSMbdgYg4W
 ikOcPvz02VWFrHQylGUhR2hhuoGJOM/wxmOsHwP1t0E7EQkrYk/sDGmlx
 Lr46xsSrCKZx+npPPYQD+1PMXuO8ChOpr6/+FBVIgjGhNjbTSNn/LzYup
 fVhwfJNVN5+i8bK9ONbLkE+0Kc/tWPylpe9Lrw0xAMZOWR2VNXXoj0wiq
 riOwZ4pHZBfAO4FiPRz5f8ZEqBIiEHYOTJ9klrgS7870FdxBb61LyT+XP
 kdZ4lqlTrvZ+bsdQ+YBCO0Dg6m8rxVE5PZIyY0GR9j1dh4YyXzMhUbE1X g==;
X-CSE-ConnectionGUID: pbB9PotjTsuL8FXBgDSZ1w==
X-CSE-MsgGUID: qWaBw+4HSEOzKw6gEaLH+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89809022"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="89809022"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 04:21:15 -0800
X-CSE-ConnectionGUID: KPTNaLOrTzi6YVibenDfZw==
X-CSE-MsgGUID: uS7PpQBgQFGX8WpgMolvUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="212082673"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.127])
 ([10.245.245.127])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 04:21:11 -0800
Message-ID: <9973d23893b3ce8ca4132e72fe833b6066b277c0.camel@linux.intel.com>
Subject: Re: [PATCH] [v2] drm/pagemap: pass pagemap_addr by reference
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Himal Prasad Ghimiray	
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	intel-xe@lists.freedesktop.org
Date: Tue, 17 Feb 2026 13:21:09 +0100
In-Reply-To: <bf08403abbacbd656a4ba78ae83a4e9163719cbc.camel@linux.intel.com>
References: <20260216134644.1025365-1-arnd@kernel.org>
 <bf08403abbacbd656a4ba78ae83a4e9163719cbc.camel@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,intel.com];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,arndb.de:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 0C92F14BE3E
X-Rspamd-Action: no action

On Mon, 2026-02-16 at 14:59 +0100, Thomas Hellstr=C3=B6m wrote:
> On Mon, 2026-02-16 at 14:46 +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > Passing a structure by value into a function is sometimes
> > problematic,
> > for a number of reasons. Of of these is a warning from the 32-bit
> > arm
> > compiler:
> >=20
> > drivers/gpu/drm/drm_gpusvm.c: In function
> > '__drm_gpusvm_unmap_pages':
> > drivers/gpu/drm/drm_gpusvm.c:1152:33: note: parameter passing for
> > argument of type 'struct drm_pagemap_addr' changed in GCC 9.1
> > =C2=A01152 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpagemap->ops-
> > > device_unmap(dpagemap,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > =C2=A01153 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
> > dev, *addr);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
> > ~~~~~~~~~~~
> >=20
> > This particular problem is harmless since we are not mixing
> > compiler
> > versions
> > inside of the compiler. However, passing this by reference avoids
> > the
> > warning
> > along with providing slightly better calling conventions as it
> > avoids
> > an
> > extra copy on the stack.
> >=20
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> Thanks.
>=20
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Will push to drm-misc-fixes once CI is complete.

Merged to drm-xe-next. Will likely appear after the next drm-xe-fixes
PR in 7.0-rc2.

Thanks,
Thomas



>=20
> /Thomas
>=20
>=20
> > ---
> > =C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0 | 2 +-
> > =C2=A0drivers/gpu/drm/drm_pagemap.c | 2 +-
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0 | 8 ++++----
> > =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A04 files changed, 7 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > b/drivers/gpu/drm/drm_gpusvm.c
> > index c25f50cad6fe..81626b00b755 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -1150,7 +1150,7 @@ static void __drm_gpusvm_unmap_pages(struct
> > drm_gpusvm *gpusvm,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr->dir);
> > =C2=A0			else if (dpagemap && dpagemap->ops-
> > > device_unmap)
> > =C2=A0				dpagemap->ops-
> > > device_unmap(dpagemap,
> > -							=C2=A0=C2=A0=C2=A0 dev,
> > *addr);
> > +							=C2=A0=C2=A0=C2=A0 dev,
> > addr);
> > =C2=A0			i +=3D 1 << addr->order;
> > =C2=A0		}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > b/drivers/gpu/drm/drm_pagemap.c
> > index d0041c947a28..22579806c055 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -318,7 +318,7 @@ static void
> > drm_pagemap_migrate_unmap_pages(struct device *dev,
> > =C2=A0			struct drm_pagemap_zdd *zdd =3D page-
> > > zone_device_data;
> > =C2=A0			struct drm_pagemap *dpagemap =3D zdd-
> > > dpagemap;
> > =C2=A0
> > -			dpagemap->ops->device_unmap(dpagemap, dev,
> > pagemap_addr[i]);
> > +			dpagemap->ops->device_unmap(dpagemap, dev,
> > &pagemap_addr[i]);
> > =C2=A0		} else {
> > =C2=A0			dma_unmap_page(dev, pagemap_addr[i].addr,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE <<
> > pagemap_addr[i].order, dir);
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 213f0334518a..78f4b2c60670 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1676,13 +1676,13 @@ xe_drm_pagemap_device_map(struct
> > drm_pagemap
> > *dpagemap,
> > =C2=A0
> > =C2=A0static void xe_drm_pagemap_device_unmap(struct drm_pagemap
> > *dpagemap,
> > =C2=A0					struct device *dev,
> > -					struct drm_pagemap_addr
> > addr)
> > +					const struct
> > drm_pagemap_addr *addr)
> > =C2=A0{
> > -	if (addr.proto !=3D XE_INTERCONNECT_P2P)
> > +	if (addr->proto !=3D XE_INTERCONNECT_P2P)
> > =C2=A0		return;
> > =C2=A0
> > -	dma_unmap_resource(dev, addr.addr, PAGE_SIZE <<
> > addr.order,
> > -			=C2=A0=C2=A0 addr.dir, DMA_ATTR_SKIP_CPU_SYNC);
> > +	dma_unmap_resource(dev, addr->addr, PAGE_SIZE << addr-
> > > order,
> > +			=C2=A0=C2=A0 addr->dir, DMA_ATTR_SKIP_CPU_SYNC);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void xe_pagemap_destroy_work(struct work_struct *work)
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > index 2baf0861f78f..c848f578e3da 100644
> > --- a/include/drm/drm_pagemap.h
> > +++ b/include/drm/drm_pagemap.h
> > @@ -95,7 +95,7 @@ struct drm_pagemap_ops {
> > =C2=A0	 */
> > =C2=A0	void (*device_unmap)(struct drm_pagemap *dpagemap,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr addr);
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_addr *addr);
> > =C2=A0
> > =C2=A0	/**
> > =C2=A0	 * @populate_mm: Populate part of the mm with @dpagemap
> > memory,
