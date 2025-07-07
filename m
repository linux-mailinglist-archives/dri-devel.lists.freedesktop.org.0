Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8662AFBBBF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 21:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00A510E546;
	Mon,  7 Jul 2025 19:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dJVThz81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB07110E52F;
 Mon,  7 Jul 2025 19:33:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 602645C5B9F;
 Mon,  7 Jul 2025 19:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83E0C4CEE3;
 Mon,  7 Jul 2025 19:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751916800;
 bh=Ad/hUFpcQmlYY/wXGp1hG/uLdVyoJgpKS1O4Y1B7CvE=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=dJVThz81N7pIMIQcL0j6SIr65KUomakbAQA90Jmi/lVWCyvtmS/CSBRwR/TF2+Rn/
 RO/ndZxdMjd1e56e7rKBtC4G7WKZ2JtiGDIFZjsPXK1ppNs/qLcqSLneJyzSf8IAWt
 78lbdtjJm8E1rpEMc/un3tQffTGJS2a21Es14Lyw0rUZKi8Lza4C61Twi0fYgnnZyF
 dRRJjR4mmNYnvBVs1P19JW166DJ0lID6fiWhLYtZqDXpVloxfS6W9ZdwezoUUz/kpz
 avOQKz0cES2FOzHKC/YIqcfI0alTTLe2psAuwX6oZ/HTmxVB1+RwjIdTHqjtB4k54D
 5LrtLQk742pMw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 21:33:13 +0200
Message-Id: <DB62O8GQ2Y1C.11UY1XZV8OE3Q@kernel.org>
Subject: Re: [PATCH v4 6/7] drm/gpuvm: Add DRM_GPUVA_REPEAT flag and logic
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank
 Binns" <frank.binns@imgtec.com>, "Matt Coster" <matt.coster@imgtec.com>,
 "Karol Herbst" <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, "Steven Price"
 <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <asahi@lists.linux.dev>, "Asahi Lina"
 <lina@asahilina.net>, "Asahi Lina" <lina+kernel@asahilina.net>
To: "Caterina Shablia" <caterina.shablia@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-7-caterina.shablia@collabora.com>
In-Reply-To: <20250707170442.1437009-7-caterina.shablia@collabora.com>
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

On Mon Jul 7, 2025 at 7:04 PM CEST, Caterina Shablia wrote:
> From: Asahi Lina <lina+kernel@asahilina.net>
>
> To be able to support "fake sparse" mappings without relying on GPU page
> fault handling, drivers may need to create large (e.g. 4GiB) mappings of
> the same page repeatedly (or same range of pages). Doing this through
> individual mappings would be very wasteful. This can be handled better
> by using a flag on map creation, but to do it safely, drm_gpuvm needs to
> be aware of this special case.
>
> Add a flag that signals that a given mapping is a page mapping, which is
> repeated all over the entire requested VA range. This tweaks the
> sm_map() logic to treat the GEM offsets differently when mappings are
> a repeated ones so they are not incremented as they would be with regular
> mappings.
>
> The size of the GEM portion to repeat is passed through
> drm_gpuva::gem::range. Most of the time it will be a page size, but
> it can be bigger as long as it's less that drm_gpuva::va::range, and
> drm_gpuva::gem::range is a multiple of drm_gpuva::va::range.

Should be "as long as it's less that drm_gpuva::va::range, and
drm_gpuva::va::range is a multiple of  drm_gpuva::gem::range".

I also think this feature deserves its own section in the global GPUVM
documentation -- please add a corresponding paragraph.

> +static int check_map_req(struct drm_gpuvm *gpuvm,

Let's call this validate_map_request().

> +			 const struct drm_gpuvm_map_req *req)
> +{
> +	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)=
))
> +		return -EINVAL;
> +
> +	if (req->flags & DRM_GPUVA_REPEAT) {
> +		u64 va_range =3D req->va.range;
> +
> +		/* For a repeated mapping, GEM range must be > 0
> +		 * and a multiple of the VA range.
> +		 */
> +		if (unlikely(!req->gem.range ||
> +			     va_range < req->gem.range ||
> +			     do_div(va_range, req->gem.range)))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_ops *ops, void *priv,
> @@ -2137,6 +2179,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  	struct drm_gpuva reqva =3D {
>  		.va.addr =3D req->va.addr,
>  		.va.range =3D req->va.range,
> +		.gem.range =3D req->gem.range,
>  		.gem.offset =3D req->gem.offset,
>  		.gem.obj =3D req->gem.obj,
>  		.flags =3D req->flags,
> @@ -2144,7 +2187,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  	u64 req_end =3D req->va.addr + req->va.range;
>  	int ret;
> =20
> -	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)=
))
> +	ret =3D check_map_req(gpuvm, req);
> +	if (unlikely(ret))
>  		return -EINVAL;
> =20
>  	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req->va.addr, req_end=
) {
> @@ -2175,7 +2219,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.va.addr =3D req_end,
>  					.va.range =3D range - req->va.range,
>  					.gem.obj =3D obj,
> -					.gem.offset =3D offset + req->va.range,
> +					.gem.range =3D va->gem.range,
> +					.gem.offset =3D offset,

Why change this from offset + req->va.range to just offset?

Same for similar other changes below.

Also it seems that we need to update the documentation which shows all pote=
ntial
cases when calling __drm_gpuvm_sm_map() [1].

[1] https://docs.kernel.org/gpu/drm-mm.html#split-and-merge

>  					.flags =3D va->flags,
>  				};
>  				struct drm_gpuva_op_unmap u =3D {
> @@ -2183,6 +2228,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.keep =3D merge,
>  				};
> =20
> +				if (!(va->flags & DRM_GPUVA_REPEAT))
> +					n.gem.offset +=3D req->va.range;
> +
>  				ret =3D op_remap_cb(ops, priv, NULL, &n, &u);
>  				if (ret)
>  					return ret;
> @@ -2194,6 +2242,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				.va.addr =3D addr,
>  				.va.range =3D ls_range,
>  				.gem.obj =3D obj,
> +				.gem.range =3D va->gem.range,
>  				.gem.offset =3D offset,
>  				.flags =3D va->flags,
>  			};
> @@ -2220,11 +2269,14 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.va.addr =3D req_end,
>  					.va.range =3D end - req_end,
>  					.gem.obj =3D obj,
> -					.gem.offset =3D offset + ls_range +
> -						      req->va.range,
> +					.gem.range =3D va->gem.range,
> +					.gem.offset =3D offset,
>  					.flags =3D va->flags,
>  				};
> =20
> +				if (!(va->flags & DRM_GPUVA_REPEAT))
> +					n.gem.offset +=3D ls_range + req->va.range;
> +
>  				ret =3D op_remap_cb(ops, priv, &p, &n, &u);
>  				if (ret)
>  					return ret;
> @@ -2250,7 +2302,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.va.addr =3D req_end,
>  					.va.range =3D end - req_end,
>  					.gem.obj =3D obj,
> -					.gem.offset =3D offset + req_end - addr,
> +					.gem.range =3D va->gem.range,
> +					.gem.offset =3D offset,
>  					.flags =3D va->flags,
>  				};
>  				struct drm_gpuva_op_unmap u =3D {
> @@ -2258,6 +2311,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.keep =3D merge,
>  				};
> =20
> +				if (!(va->flags & DRM_GPUVA_REPEAT))
> +					n.gem.offset +=3D req_end - addr;
> +
>  				ret =3D op_remap_cb(ops, priv, NULL, &n, &u);
>  				if (ret)
>  					return ret;
> @@ -2294,6 +2350,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>  			prev.va.addr =3D addr;
>  			prev.va.range =3D req_addr - addr;
>  			prev.gem.obj =3D obj;
> +			prev.gem.range =3D va->gem.range;
>  			prev.gem.offset =3D offset;
>  			prev.flags =3D va->flags;
> =20
> @@ -2304,7 +2361,10 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>  			next.va.addr =3D req_end;
>  			next.va.range =3D end - req_end;
>  			next.gem.obj =3D obj;
> -			next.gem.offset =3D offset + (req_end - addr);
> +			prev.gem.range =3D va->gem.range;
> +			next.gem.offset =3D offset;
> +			if (!(va->flags & DRM_GPUVA_REPEAT))
> +				next.gem.offset +=3D req_end - addr;
>  			next.flags =3D va->flags;
> =20
>  			next_split =3D true;
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index f77a89e791f1..629e8508f99f 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -56,10 +56,19 @@ enum drm_gpuva_flags {
>  	 */
>  	DRM_GPUVA_SPARSE =3D (1 << 1),
> =20
> +	/**
> +	 * @DRM_GPUVA_REPEAT:
> +	 *
> +	 * Flag indicating that the &drm_gpuva is a mapping of a GEM
> +	 * portion repeated multiple times to fill the virtual address

"of a GEM object with a certain range that is repeated multiple times to ..=
."
