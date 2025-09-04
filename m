Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEEEB433A7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A774410E163;
	Thu,  4 Sep 2025 07:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGzsilHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E598E10E163
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756970429; x=1788506429;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tyjCN9YKeJInxLGAfgEpon9dQXNdv3/Dtp+8YR+LMqA=;
 b=GGzsilHwJeIeFwmHJBciWFeJH0tV0tRk0W/HfowfWfhFQ9aPZNezzA+i
 Az1L7suHoGewp9t+gGHiGzbihG9w4L2hO2tDz9Rw/9hiKM0ybD2iq5pc/
 YdQz2n8vwUv0zQTMwP/A8amX06xv5c58pd6G4u0VqTO9Ij+56j2GnQkHF
 9XZ26tTOKVWIpjtfJTZp1AySc80dKjwKR9SpzYMas008/RBuqBtXC4a9K
 wiCyZJjdjqxH/VHEcuC+20pGtjdscKtox8h206i8/dQeJmpUSxXEe8naA
 +RO4Df/v5L2aiGBAXXuOaJihSFjnfEQnD4ljo85q3UiuChNXjnqIGtoNK A==;
X-CSE-ConnectionGUID: O4bg5Dg4RJurMykS592+bA==
X-CSE-MsgGUID: 2I0ZG8jPR3imFLalPzBG2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76903312"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="76903312"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:20:28 -0700
X-CSE-ConnectionGUID: pQpTY7wdQkOhzUbkvIevIQ==
X-CSE-MsgGUID: fz4Wuz3AT/ilrydNaRJsSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="177081267"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.98])
 ([10.245.244.98])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:20:26 -0700
Message-ID: <65a9380b4d791fb4ec1f25c3bf3df2175da6fca7.camel@linux.intel.com>
Subject: Re: [PATCH 1/4] ttm/bo: add an API to populate a bo before exporting.
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Christian Koenig
 <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Thu, 04 Sep 2025 09:20:21 +0200
In-Reply-To: <20250904021643.2050497-1-airlied@gmail.com>
References: <20250904021643.2050497-1-airlied@gmail.com>
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

On Thu, 2025-09-04 at 12:16 +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>=20
> While discussing cgroups we noticed a problem where you could export
> a BO to a dma-buf without having it ever being backed or accounted
> for.
>=20
> This meant in low memory situations or eventually with cgroups, a
> lower privledged process might cause the compositor to try and
> allocate
> a lot of memory on it's behalf and this could fail. At least make
> sure the exporter has managed to allocate the RAM at least once
> before exporting the object.
>=20
> This only applies currently to TTM_PL_SYSTEM objects, because
> GTT objects get populated on first validate, and VRAM doesn't
> use TT.
>=20
> Reviewed-by: Christian Koenig <christian.koenig@amd.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/ttm/ttm_bo.c | 15 +++++++++++++++
> =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 17 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index 273757974b9f..a815c7478d3f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1284,3 +1284,18 @@ int ttm_bo_populate(struct ttm_buffer_object
> *bo,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(ttm_bo_populate);
> +
> +int ttm_bo_setup_export(struct ttm_buffer_object *bo,
> +			struct ttm_operation_ctx *ctx)
> +{
> +	int ret;
> +
> +	ret =3D ttm_bo_reserve(bo, false, false, NULL);
> +	if (ret !=3D 0)
> +		return ret;
> +
> +	ret =3D ttm_bo_populate(bo, bo->resource->placement &
> TTM_PL_FLAG_MEMCG, ctx);
> +	ttm_bo_unreserve(bo);
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_setup_export);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index c33b3667ae76..cdc9f5d1b420 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -473,6 +473,8 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object
> *bo);
> =C2=A0int ttm_bo_populate(struct ttm_buffer_object *bo,
> =C2=A0		=C2=A0=C2=A0=C2=A0 bool memcg_account,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx);
> +int ttm_bo_setup_export(struct ttm_buffer_object *bo,
> +			struct ttm_operation_ctx *ctx);
> =C2=A0
> =C2=A0/* Driver LRU walk helpers initially targeted for shrinking. */
> =C2=A0

