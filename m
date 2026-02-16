Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C8j0LWQOk2k71QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 13:32:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F651435A1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 13:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DDA10E02E;
	Mon, 16 Feb 2026 12:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUcmUY9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E15610E02E;
 Mon, 16 Feb 2026 12:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771245151; x=1802781151;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CITy+8EMh84DNAbeDL48LMMVlXiONUa8bsO3qrnO1kY=;
 b=JUcmUY9P4tlROOXiJhWlwm3z6E8EbQd4Up/VzHesJdmq0Zf1zYRjlD3/
 iUnmPH8QVfVL36L7WAeBUjcP/Sl3+KM3YKmlfN2coDOzvQ2zxLg9EAzMV
 C99WDtELtHiCOi5JBs611tX/01i7TBhiOJxMC2MtW3F+9WVHFCfxz45Sr
 1hi/f/YLlBhiiKaIGbE9FClnDIlLWLSx077Iu2Iqwf7bgMBNWe4fzU8IJ
 q5vkdQcBnTJd7g2SQ/gqOME5fTROlcL+NXlJx0PIDPQZwta2QBdDyFGJc
 O8M/vKzqDF6wyH6qtwAml0169dRpt2p0KQ6Q7uCtqsKcqlqxbg7euNDrm Q==;
X-CSE-ConnectionGUID: k5A0TOymSF6hTRauRUiy4Q==
X-CSE-MsgGUID: 7Spj8U4FS7CjQjLGb7KuAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83688123"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83688123"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 04:32:31 -0800
X-CSE-ConnectionGUID: 7+GHjh2IRVWWUGZcimDmGw==
X-CSE-MsgGUID: Qm91n4I6R6OVsgp2BrIsSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212160935"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.231])
 ([10.245.244.231])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 04:32:27 -0800
Message-ID: <dca855eb1de92fce96f6be418c8646705564cf69.camel@linux.intel.com>
Subject: Re: [PATCH] drm/pagemap: pass pagemap_addr by reference
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Himal Prasad Ghimiray	
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi <demarchi@kernel.org>, 
 Matthew Auld <matthew.auld@intel.com>, Dafna Hirschfeld
 <dafna.hirschfeld@intel.com>, Francois Dugast	 <francois.dugast@intel.com>,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Date: Mon, 16 Feb 2026 13:32:25 +0100
In-Reply-To: <20260216121709.2345721-1-arnd@kernel.org>
References: <20260216121709.2345721-1-arnd@kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arndb.de:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: E2F651435A1
X-Rspamd-Action: no action

On Mon, 2026-02-16 at 13:16 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Passing a structure by reference into a function is sometimes
> problematic,

Do you mean passing by *value* is problematic?

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
> index 213f0334518a..184cfaac8baf 100644
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
> +					struct drm_pagemap_addr
> *addr)
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
> index 2baf0861f78f..74a32d0dacd8 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -95,7 +95,7 @@ struct drm_pagemap_ops {
> =C2=A0	 */
> =C2=A0	void (*device_unmap)(struct drm_pagemap *dpagemap,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr addr);
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_addr *addr);

Makes sense, although this should preferrably be

const struct drm_pagemap_addr *addr;

Thanks,
Thomas




> =C2=A0
> =C2=A0	/**
> =C2=A0	 * @populate_mm: Populate part of the mm with @dpagemap
> memory,
