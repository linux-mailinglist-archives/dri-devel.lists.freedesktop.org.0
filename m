Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHooFNQik2kX1wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:59:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF554144572
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B0710E124;
	Mon, 16 Feb 2026 13:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYv1F0UY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42D010E055;
 Mon, 16 Feb 2026 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771250384; x=1802786384;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bTz5hquA2mXPFuRqMqP8HYjYZUd7V6C4n+3/GRvCHyQ=;
 b=GYv1F0UYqnCW4IgMcaX2rZxJKiC4/MV9Tf+cXKmlYOcC6kFyw4JTbpLQ
 gsPI9AMnttssH2LOSP7Id5JkpUyAlbI9pM02tIz8PyBjOcIH6rhwAE+7p
 ctS+Q+dqDdbM5DMVscU0ozU5C/4/4MDUKVt5czYiawoPuSsSZy+eomPCO
 byVEwLe5f5THFM5BiAzmf2VZnC7koNbe4XNR2avrT9zUpVpqxK8eQCiMP
 jO9fBsL8H1YS54M01ctBVBhhLLhza1KlXhbtdsx6qHSFY5tzS32Jc/QcH
 W3Ej6yEVH3IXw0jzh5zf7NsXbHx3F7vkua5or4RxUaGLnA70vvt++9ys8 g==;
X-CSE-ConnectionGUID: cNZsPYZhTrCsGo51Dlgqhg==
X-CSE-MsgGUID: DDa+xeSXS0Sl1MULK0d3dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="59897703"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="59897703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:59:43 -0800
X-CSE-ConnectionGUID: DzY+0hoLTx6ggL2Jd+6uFA==
X-CSE-MsgGUID: anaXl3qERCWZxG8F0N6Q4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218587977"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.231])
 ([10.245.244.231])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:59:40 -0800
Message-ID: <bf08403abbacbd656a4ba78ae83a4e9163719cbc.camel@linux.intel.com>
Subject: Re: [PATCH] [v2] drm/pagemap: pass pagemap_addr by reference
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Himal Prasad Ghimiray	
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi <demarchi@kernel.org>, 
 Matthew Auld <matthew.auld@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Andrew Morton	 <akpm@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Date: Mon, 16 Feb 2026 14:59:37 +0100
In-Reply-To: <20260216134644.1025365-1-arnd@kernel.org>
References: <20260216134644.1025365-1-arnd@kernel.org>
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
	RCPT_COUNT_TWELVE(0.00)[17];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,arndb.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AF554144572
X-Rspamd-Action: no action

On Mon, 2026-02-16 at 14:46 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Passing a structure by value into a function is sometimes
> problematic,
> for a number of reasons. Of of these is a warning from the 32-bit arm
> compiler:
>=20
> drivers/gpu/drm/drm_gpusvm.c: In function '__drm_gpusvm_unmap_pages':
> drivers/gpu/drm/drm_gpusvm.c:1152:33: note: parameter passing for
> argument of type 'struct drm_pagemap_addr' changed in GCC 9.1
> =C2=A01152 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpagemap->ops-
> >device_unmap(dpagemap,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =C2=A01153 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> dev, *addr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
> ~~~~~~~~~~~
>=20
> This particular problem is harmless since we are not mixing compiler
> versions
> inside of the compiler. However, passing this by reference avoids the
> warning
> along with providing slightly better calling conventions as it avoids
> an
> extra copy on the stack.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks.

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Will push to drm-misc-fixes once CI is complete.

/Thomas


> ---
> =C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/drm_pagemap.c | 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0 | 8 ++++----
> =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A04 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpusvm.c
> b/drivers/gpu/drm/drm_gpusvm.c
> index c25f50cad6fe..81626b00b755 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1150,7 +1150,7 @@ static void __drm_gpusvm_unmap_pages(struct
> drm_gpusvm *gpusvm,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr->dir);
> =C2=A0			else if (dpagemap && dpagemap->ops-
> >device_unmap)
> =C2=A0				dpagemap->ops-
> >device_unmap(dpagemap,
> -							=C2=A0=C2=A0=C2=A0 dev,
> *addr);
> +							=C2=A0=C2=A0=C2=A0 dev,
> addr);
> =C2=A0			i +=3D 1 << addr->order;
> =C2=A0		}
> =C2=A0
> diff --git a/drivers/gpu/drm/drm_pagemap.c
> b/drivers/gpu/drm/drm_pagemap.c
> index d0041c947a28..22579806c055 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -318,7 +318,7 @@ static void
> drm_pagemap_migrate_unmap_pages(struct device *dev,
> =C2=A0			struct drm_pagemap_zdd *zdd =3D page-
> >zone_device_data;
> =C2=A0			struct drm_pagemap *dpagemap =3D zdd-
> >dpagemap;
> =C2=A0
> -			dpagemap->ops->device_unmap(dpagemap, dev,
> pagemap_addr[i]);
> +			dpagemap->ops->device_unmap(dpagemap, dev,
> &pagemap_addr[i]);
> =C2=A0		} else {
> =C2=A0			dma_unmap_page(dev, pagemap_addr[i].addr,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE <<
> pagemap_addr[i].order, dir);
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 213f0334518a..78f4b2c60670 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1676,13 +1676,13 @@ xe_drm_pagemap_device_map(struct drm_pagemap
> *dpagemap,
> =C2=A0
> =C2=A0static void xe_drm_pagemap_device_unmap(struct drm_pagemap
> *dpagemap,
> =C2=A0					struct device *dev,
> -					struct drm_pagemap_addr
> addr)
> +					const struct
> drm_pagemap_addr *addr)
> =C2=A0{
> -	if (addr.proto !=3D XE_INTERCONNECT_P2P)
> +	if (addr->proto !=3D XE_INTERCONNECT_P2P)
> =C2=A0		return;
> =C2=A0
> -	dma_unmap_resource(dev, addr.addr, PAGE_SIZE << addr.order,
> -			=C2=A0=C2=A0 addr.dir, DMA_ATTR_SKIP_CPU_SYNC);
> +	dma_unmap_resource(dev, addr->addr, PAGE_SIZE << addr-
> >order,
> +			=C2=A0=C2=A0 addr->dir, DMA_ATTR_SKIP_CPU_SYNC);
> =C2=A0}
> =C2=A0
> =C2=A0static void xe_pagemap_destroy_work(struct work_struct *work)
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 2baf0861f78f..c848f578e3da 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -95,7 +95,7 @@ struct drm_pagemap_ops {
> =C2=A0	 */
> =C2=A0	void (*device_unmap)(struct drm_pagemap *dpagemap,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr addr);
> +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_addr *addr);
> =C2=A0
> =C2=A0	/**
> =C2=A0	 * @populate_mm: Populate part of the mm with @dpagemap
> memory,
