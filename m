Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F9AFBB3A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 21:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668B910E51D;
	Mon,  7 Jul 2025 19:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wd60hZX/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DE810E518;
 Mon,  7 Jul 2025 19:01:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 561A345BEA;
 Mon,  7 Jul 2025 19:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F37C4CEE3;
 Mon,  7 Jul 2025 19:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751914860;
 bh=JrAruPZZICWqW2vK7DBmGDuymxQKXoE78qBV16PFDAE=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=Wd60hZX/n+mVlLQdJZ8cSY5GCefwIDWb3REjM7QJDLgSV+IERRHOm0R2c5dueJ5mB
 GK9DhFfJSgBLrxyUdYWDmw4IbnkLe/q2F3XMqCui8hZAhXDb/wpcabcW7noi/pK4oU
 KKtlDS7Cya/C2m7iZtMfbc1ZhX5N76f+NkNgDaobA/zuSkiIfMnDfsuo4coAnVonXg
 kE55immiFicSkg4JuWZywrUvU7tuX09yQvaY7w0vsVf9qP5YsIB6yvLp8BQMxbPbzp
 ZPinUYU2DRjXZEBe0Vfowu2RzsBLK0CzgvFLh/ssM9B4d9MZC+qetxgf/DIAOwFsaT
 7mA13sHjG28eg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 21:00:54 +0200
Message-Id: <DB61ZHDINPNE.1VFXNF2XXSJPA@kernel.org>
To: "Caterina Shablia" <caterina.shablia@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 4/7] drm/gpuvm: Add a helper to check if two VA can
 be merged
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
 <lina@asahilina.net>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-5-caterina.shablia@collabora.com>
In-Reply-To: <20250707170442.1437009-5-caterina.shablia@collabora.com>
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
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 05978c5c38b1..dc3c2f906400 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2098,12 +2098,48 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void =
*priv,
>  	return fn->sm_step_unmap(&op, priv);
>  }
> =20
> +static bool can_merge(struct drm_gpuvm *gpuvm, const struct drm_gpuva *a=
,
> +		      const struct drm_gpuva *b)
> +{
> +	/* Only GEM-based mappings can be merged, and they must point to
> +	 * the same GEM object.
> +	 */
> +	if (a->gem.obj !=3D b->gem.obj || !a->gem.obj)
> +		return false;
> +
> +	/* Let's keep things simple for now and force all flags to match. */
> +	if (a->flags !=3D b->flags)
> +		return false;
> +
> +	/* Order VAs for the rest of the checks. */
> +	if (a->va.addr > b->va.addr)
> +		swap(a, b);
> +
> +	/* We assume the caller already checked that VAs overlap or are
> +	 * contiguous.
> +	 */
> +	if (drm_WARN_ON(gpuvm->drm, b->va.addr > a->va.addr + a->va.range))
> +		return false;
> +
> +	/* We intentionally ignore u64 underflows because all we care about
> +	 * here is whether the VA diff matches the GEM offset diff.
> +	 */
> +	return b->va.addr - a->va.addr =3D=3D b->gem.offset - a->gem.offset;
> +}
> +
>  static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_ops *ops, void *priv,
>  		   const struct drm_gpuvm_map_req *req)
>  {
>  	struct drm_gpuva *va, *next;
> +	struct drm_gpuva reqva =3D {
> +		.va.addr =3D req->va.addr,
> +		.va.range =3D req->va.range,
> +		.gem.offset =3D req->gem.offset,
> +		.gem.obj =3D req->gem.obj,
> +		.flags =3D req->flags,

Huh? Where does req->flags come from? I don't remember that this flag exist=
s in
struct drm_gpuvm_map_req in the preceding patch?

> +	};
>  	u64 req_end =3D req->va.addr + req->va.range;
>  	int ret;
> =20
> @@ -2116,12 +2152,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		u64 addr =3D va->va.addr;
>  		u64 range =3D va->va.range;
>  		u64 end =3D addr + range;
> -		bool merge =3D !!va->gem.obj;
> +		bool merge =3D can_merge(gpuvm, va, &reqva);

I know you want to do the swap() trick above, but I don't like creating a
temporary struct drm_gpuva with all the other uninitialized fields.

If you really want this, can we please limit the scope? Maybe the following
helper:

	static bool can_merge(struct drm_gpuvm *gpuvm,
			      const struct drm_gpuva *va,
			      struct drm_gpuvm_map_req *req)
	{
		struct drm_gpuva reqva =3D { ... };
		return __can_merge(gpuvm, va, reqva);
	}
