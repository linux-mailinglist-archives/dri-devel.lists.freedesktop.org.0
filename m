Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546DB22E67
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 18:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211FB10E176;
	Tue, 12 Aug 2025 16:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EbnWze20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089F510E16B;
 Tue, 12 Aug 2025 16:59:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 591A940C1A;
 Tue, 12 Aug 2025 16:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6472C4CEF0;
 Tue, 12 Aug 2025 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755017941;
 bh=Jm4Xq54AgMyUvxX6Y1oShk90mxS9/3zPVIbjUzffjX4=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=EbnWze20SAsWuv7OO1hhAvJ2EV3R1iyi9tBOc4Bs++hqAKch/QP1VYaJpeZ+7ZFFD
 zX91Zjk0NQnxuwl+uH6wdlswTfUc3gM/14scpB0FSgizjysCl5zX8X/lW7d7GZjnpG
 J6fyP2uuDSZG/j5Xp4dEJxv2Fn8vHlObTG4I/mW0pbJ7ZAtsm8ZhBgOtZ/gOTPCH0W
 mX3YghyENFyr3JX3HhYIt7AVdJICRIt/OaYGUeEutHx9dZhr8u5hPAxZrKX4fkeaFL
 NZNv6sotIGY99TGV95fU7IZbRGH0Yyb/8GiWOMf82snw2g256G5V2rkGrIT5HKjRJF
 tweUyL/kar+/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 18:58:58 +0200
Message-Id: <DC0LXQF855NM.1ODUF3CKB5X4K@kernel.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 04/26] drm/gpuvm: Introduce
 DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
Cc: <intel-xe@lists.freedesktop.org>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Boris Brezillon"
 <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
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

On Thu Aug 7, 2025 at 6:43 PM CEST, Himal Prasad Ghimiray wrote:
> @@ -2110,6 +2110,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  {
>  	struct drm_gpuva *va, *next;
>  	u64 req_end =3D req->op_map.va.addr + req->op_map.va.range;
> +	bool is_madvise_ops =3D (req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_M=
ADVISE);

Let's just call this 'madvise'.

> +	bool needs_map =3D !is_madvise_ops;
>  	int ret;
> =20
>  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->op_map.va.addr, req->op=
_map.va.range)))
> @@ -2122,26 +2124,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		u64 range =3D va->va.range;
>  		u64 end =3D addr + range;
>  		bool merge =3D !!va->gem.obj;
> +		bool skip_madvise_ops =3D is_madvise_ops && merge;

IIUC, you're either going for continue or break in this case. I think conti=
nue
would always be correct and break is an optimization if end <=3D req_end?

If that's correct, please just do either

	if (madvise && va->gem.obj)
		continue;

or

	if (madvise && va->gem.obj) {
		if (end > req_end)
			break;
		else
			continue;
	}

instead of sprinkling the skip_madvise_ops checks everywhere.

> =20
> +		needs_map =3D !is_madvise_ops;
>  		if (addr =3D=3D req->op_map.va.addr) {
>  			merge &=3D obj =3D=3D req->op_map.gem.obj &&
>  				 offset =3D=3D req->op_map.gem.offset;
> =20
>  			if (end =3D=3D req_end) {
> -				ret =3D op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret =3D op_unmap_cb(ops, priv, va, merge);
> +					if (ret)
> +						return ret;
> +				}
>  				break;
>  			}
> =20
>  			if (end < req_end) {
> -				ret =3D op_unmap_cb(ops, priv, va, merge);
> -				if (ret)
> -					return ret;
> +				if (!is_madvise_ops) {
> +					ret =3D op_unmap_cb(ops, priv, va, merge);

I think we should pass madvise as argument to op_unmap_cb() and make it a n=
oop
internally rather than having all the conditionals.

> +					if (ret)
> +						return ret;
> +				}
>  				continue;
>  			}
> =20
>  			if (end > req_end) {
> +				if (skip_madvise_ops)
> +					break;
> +
>  				struct drm_gpuva_op_map n =3D {
>  					.va.addr =3D req_end,
>  					.va.range =3D range - req->op_map.va.range,
> @@ -2156,6 +2167,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				ret =3D op_remap_cb(ops, priv, NULL, &n, &u);
>  				if (ret)
>  					return ret;
> +
> +				if (is_madvise_ops)
> +					needs_map =3D true;

I don't like this needs_map state...

Maybe we could have

	struct drm_gpuvm_map_req *op_map =3D madvise ? NULL : req;

at the beginning of the function and then change this line to

	if (madvise)
		op_map =3D req;

and op_map_cb() can just handle a NULL pointer.

Yeah, I feel like that's better.
