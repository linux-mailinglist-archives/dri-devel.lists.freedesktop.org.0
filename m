Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A895496069B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2231910E2CC;
	Tue, 27 Aug 2024 10:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkXPqFCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C38A10E2CC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724753005; x=1756289005;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UyP9FnltAeqIKnUdDF448g1cXViLL2vlBEa765iQQJg=;
 b=dkXPqFCfxW3Yn7gFPz7FhKMtvQ8SOzLRDOKEps+edKWnMKP6N5mnB89f
 8lj0TR6hcaqZ8kv64HPxJinIndhFM254SekR1iXRhTJEqUulvaLs4bpeq
 jYEHm+iNf9QbShf0Ipft2Qt411f0JQfEBVyFt9oRUtaMUE3ToHMr2R2iL
 ELDTUrjHHNTSmJMaxfgWs/oeSWNgn8er2JSbHvnGigNR3crj+IxsCwcM0
 fEcAeb859jOOw1dm2li5xXgJxTw8EZMgsKMOSiFVkwIyXRlHTgVzvPvOX
 YcqkHDMA4HGyRcvrxCHvvg1RqzTxAS3FYwVv7/t2PDy3ctA+xTqo/RVFR g==;
X-CSE-ConnectionGUID: 21IPj/s/RXaawvCY/MMbeQ==
X-CSE-MsgGUID: H1s1IN48R0yPiN1fcM3Bkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23185850"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23185850"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 03:03:24 -0700
X-CSE-ConnectionGUID: 3InzujgZSniJnRaYouXHkQ==
X-CSE-MsgGUID: LW808RzBSUSIJAoI8/AizA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="67686683"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.61]) ([10.245.244.61])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 03:03:24 -0700
Message-ID: <2cd4250f46a63fc61330f1873aa14c9388adcf0b.camel@linux.intel.com>
Subject: Re: [PATCH 5/8] drm/vmwgfx: partially revert "Adapt validation code
 for reference-free lookups"
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org
Date: Tue, 27 Aug 2024 12:03:20 +0200
In-Reply-To: <20240723121750.2086-5-christian.koenig@amd.com>
References: <20240723121750.2086-1-christian.koenig@amd.com>
 <20240723121750.2086-5-christian.koenig@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Tue, 2024-07-23 at 14:17 +0200, Christian K=C3=B6nig wrote:
> This reverts commit 64ad2abfe9a628ce79859d072704bd1ef7682044.
>=20
> To me it looks like this functionality was never actually used. At
> least
> I can't find any protection in vmw_bo_free().
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list
> <bcm-kernel-feedback-list@broadcom.com>

IIRC the reference-free lookups were used to avoid the extensive
referencing and unreferencing during the command stream parsing by
means of rcu protection, so when vmw_validation_add() was called the bo
pointer might have been only rcu-protected.

From a brief look this looks like it's been changed with the gem
rewrite and if so, this patch should probably be safe.

/Thomas

> ---
> =C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> index e7625b3f71e0..e11837e484aa 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> @@ -262,7 +262,8 @@ int vmw_validation_add_bo(struct
> vmw_validation_context *ctx,
> =C2=A0				bo_node->hash.key);
> =C2=A0		}
> =C2=A0		val_buf =3D &bo_node->base;
> -		val_buf->bo =3D ttm_bo_get_unless_zero(&vbo->tbo);
> +		vmw_bo_reference(vbo);
> +		val_buf->bo =3D &vbo->tbo;
> =C2=A0		if (!val_buf->bo)
> =C2=A0			return -ESRCH;
> =C2=A0		val_buf->num_shared =3D 0;
> @@ -656,7 +657,7 @@ void vmw_validation_unref_lists(struct
> vmw_validation_context *ctx)
> =C2=A0	struct vmw_validation_res_node *val;
> =C2=A0
> =C2=A0	list_for_each_entry(entry, &ctx->bo_list, base.head) {
> -		ttm_bo_put(entry->base.bo);
> +		drm_gem_object_put(&entry->base.bo->base);
> =C2=A0		entry->base.bo =3D NULL;
> =C2=A0	}
> =C2=A0

