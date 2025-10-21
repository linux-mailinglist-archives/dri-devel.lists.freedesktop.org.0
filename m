Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D20BF6FD5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B12710E307;
	Tue, 21 Oct 2025 14:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLdh8Xp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A78110E307;
 Tue, 21 Oct 2025 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761055878; x=1792591878;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zvgWk8XX25lGR59EwKKFHSzvIQQ+qXyF3981Jk8Ffrc=;
 b=FLdh8Xp7+v6IklWyKr/UmkVWHNFBS4ry31KMqq3I/67pEfN2DArpi30b
 leaqcWPpbTq2z+M2+JCDchJyi7jvN3oKhCpza7iKudPMOJV2p3L9VZa/A
 MK1E9RJxyArdLMEsUMX5S2Ouo6CuZNcsAKta2xR5iOsVdWHXH7gfYfe67
 BQ2D48IpxCdUahwthfJB4lu+qfavQTrOnvaSGIowkJlfwEAfOgTmGrotE
 QIDnHqxbPe0DC2yJLivcDU/JdZC8lFsDLGbwfImZ/iLHZsb6YixU5ZTRY
 n9TZLgRHLVXx8w7f2RjVYMWOwVnMG6a43VUmNS08i8vcoh7mPIPfexSBh w==;
X-CSE-ConnectionGUID: 7llXwoCnSwmoLZN9KJ16xw==
X-CSE-MsgGUID: laEEfKgcSNmWH4ec8kvJGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63085893"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63085893"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:11:18 -0700
X-CSE-ConnectionGUID: qWSGZghiSSuJhvYRa+3yzA==
X-CSE-MsgGUID: v36LiJrTRlWj82kUrOyJhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183631044"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.135])
 ([10.245.245.135])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:11:16 -0700
Message-ID: <1ddcf0013b858e3bad20de420632259ad4d8a616.camel@linux.intel.com>
Subject: Re: [PATCH v5 6/6] drm/ttm: Add an allocation flag to propagate
 -ENOSPC on OOM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, 	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>
Date: Tue, 21 Oct 2025 16:11:14 +0200
In-Reply-To: <20251020115411.36818-7-tvrtko.ursulin@igalia.com>
References: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
 <20251020115411.36818-7-tvrtko.ursulin@igalia.com>
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

On Mon, 2025-10-20 at 12:54 +0100, Tvrtko Ursulin wrote:
> Some graphics APIs differentiate between out-of-graphics-memory and
> out-of-host-memory (system memory). Add a device init flag to have -
> ENOSPC
> propagated from the resource managers instead of being converted to
> -ENOMEM, to aid driver stacks in determining what error code to
> return or
> whether corrective action can be taken at the driver level.
>=20
> Co-developed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
> Thomas, feel free to take the ownership if you end up liking this
> version.
> As you can see I lifted your commit text as is and the implementation
> is
> the same on the high level.

Let's keep it like this. Thanks for doing this. I'll follow up with
xeKMD change once this gets backmerged.

FWIW:
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +++-
> =C2=A0drivers/gpu/drm/ttm/ttm_device.c | 1 +
> =C2=A0include/drm/ttm/ttm_allocation.h | 1 +
> =C2=A0include/drm/ttm/ttm_device.h=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++
> =C2=A04 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index fba2a68a556e..15b3cb199d45 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -31,6 +31,7 @@
> =C2=A0
> =C2=A0#define pr_fmt(fmt) "[TTM] " fmt
> =C2=A0
> +#include <drm/ttm/ttm_allocation.h>
> =C2=A0#include <drm/ttm/ttm_bo.h>
> =C2=A0#include <drm/ttm/ttm_placement.h>
> =C2=A0#include <drm/ttm/ttm_tt.h>
> @@ -877,7 +878,8 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
> =C2=A0
> =C2=A0	/* For backward compatibility with userspace */
> =C2=A0	if (ret =3D=3D -ENOSPC)
> -		return -ENOMEM;
> +		return bo->bdev->alloc_flags &
> TTM_ALLOCATION_PROPAGATE_ENOSPC ?
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret : -ENOMEM;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * We might need to add a TTM.
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> b/drivers/gpu/drm/ttm/ttm_device.c
> index 87c85ccb21ac..5c10e5fbf43b 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -227,6 +227,7 @@ int ttm_device_init(struct ttm_device *bdev,
> const struct ttm_device_funcs *func
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> +	bdev->alloc_flags =3D alloc_flags;
> =C2=A0	bdev->funcs =3D funcs;
> =C2=A0
> =C2=A0	ttm_sys_man_init(bdev);
> diff --git a/include/drm/ttm/ttm_allocation.h
> b/include/drm/ttm/ttm_allocation.h
> index 8f8544760306..655d1e44aba7 100644
> --- a/include/drm/ttm/ttm_allocation.h
> +++ b/include/drm/ttm/ttm_allocation.h
> @@ -7,5 +7,6 @@
> =C2=A0#define TTM_ALLOCATION_POOL_BENEFICIAL_ORDER(n)	((n) & 0xff)
> /* Max order which caller can benefit from */
> =C2=A0#define TTM_ALLOCATION_POOL_USE_DMA_ALLOC=C2=A0	BIT(8) /* Use
> coherent DMA allocations. */
> =C2=A0#define TTM_ALLOCATION_POOL_USE_DMA32		BIT(9) /* Use
> GFP_DMA32 allocations. */
> +#define TTM_ALLOCATION_PROPAGATE_ENOSPC		BIT(10) /*
> Do not convert ENOSPC from resource managers to ENOMEM. */
> =C2=A0
> =C2=A0#endif
> diff --git a/include/drm/ttm/ttm_device.h
> b/include/drm/ttm/ttm_device.h
> index 074b98572275..d016360e5ceb 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -220,6 +220,11 @@ struct ttm_device {
> =C2=A0	 */
> =C2=A0	struct list_head device_list;
> =C2=A0
> +	/**
> +	 * @alloc_flags: TTM_ALLOCATION_ flags.
> +	 */
> +	unsigned int alloc_flags;
> +
> =C2=A0	/**
> =C2=A0	 * @funcs: Function table for the device.
> =C2=A0	 * Constant after bo device init

