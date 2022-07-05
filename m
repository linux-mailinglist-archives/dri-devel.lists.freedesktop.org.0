Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86242567184
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 16:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918F311279B;
	Tue,  5 Jul 2022 14:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E621112636;
 Tue,  5 Jul 2022 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657032654; x=1688568654;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BAJCsnFdMWr1lUrH1fzDIGVykxjlmeT6OD4gppKqQVs=;
 b=HVkMe9OOa0Gz+WYyt89Bdq09XfPhL8KR/9cUkobNoi8drwh1Q9pUOVMz
 uILpsHYYewjU/FU2fFJB57VzHPPSIMUexx7Jgw77BmfHNnCmxlgXxgCQx
 MHXuDIWRdDaIxmirEBpeZTwpcOWaTKb28aNP5L2Xqdq74wLx27dB9lrkr
 at3IYzFNoRP0XY2K0lppBWo2hnfuVeQVlHXpPMeYTUSe0lgwpkkJ4luCX
 Ex4K6XnNmi53fKWzb6umuLTdUGvKTYsIh+36LPujfwEs/TkreZNEIn4eg
 6yw5VRRWEFT5DaweftWEP9Zbnx0OcQ18qLrb1e57iN2mUVrvE8qUzMpa4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="308913215"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="308913215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:50:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="619858862"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.33.206])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:50:51 -0700
Date: Tue, 5 Jul 2022 16:50:48 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v2 6/7] drm/i915: Use error code as -E2BIG when the size
 of gem ttm object is too large
Message-ID: <20220705165048.3411d028@maurocar-mobl2>
In-Reply-To: <20220705122455.3866745-7-gwan-gyeong.mun@intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-7-gwan-gyeong.mun@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  5 Jul 2022 15:24:54 +0300
Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:

> The ttm_bo_init_reserved() functions returns -ENOSPC if the size is too b=
ig
> to add vma. The direct function that returns -ENOSPC is drm_mm_insert_nod=
e_in_range().
> To handle the same error as other code returning -E2BIG when the size is
> too large, it converts return value to -E2BIG.
>=20
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index d579524663b3..271f64b7e4f1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1249,6 +1249,17 @@ int __i915_gem_ttm_object_init(struct intel_memory=
_region *mem,
>  				   bo_type, &i915_sys_placement,
>  				   page_size >> PAGE_SHIFT,
>  				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
> +
> +	/*
> +	 * XXX: The ttm_bo_init_reserved() functions returns -ENOSPC if the size
> +	 * is too big to add vma. The direct function that returns -ENOSPC is
> +	 * drm_mm_insert_node_in_range(). To handle the same error as other code
> +	 * that returns -E2BIG when the size is too large, it converts -ENOSPC =
to
> +	 * -E2BIG.
> +	 */
> +	if (size >> PAGE_SHIFT > INT_MAX && ret =3D=3D -ENOSPC)
> +		ret =3D -E2BIG;
> +
>  	if (ret)
>  		return i915_ttm_err_to_gem(ret);
> =20
