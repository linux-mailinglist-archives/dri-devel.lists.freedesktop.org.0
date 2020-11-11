Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A692AE66A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 03:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED9F89D61;
	Wed, 11 Nov 2020 02:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDC289BE8;
 Wed, 11 Nov 2020 02:29:13 +0000 (UTC)
IronPort-SDR: dPPwmPiC6kRaXllHx+EfOXZpgXpQohiCYLhnl0RHBi+FYxO0j2UkLf2BkEW7CjCp8Cq8S4A+bi
 61gVe9vL26Cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="188059601"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
 d="asc'?scan'208";a="188059601"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 18:29:11 -0800
IronPort-SDR: 5X9dokFnhpEvAFBUB2K5/8AZV96m5qV4k5OKyjc2wLc4dd3Z3lIL1Lg2SzwpqMV5ZFmVXPMvMZ
 /3tQpWRC4wKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
 d="asc'?scan'208";a="356431843"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 10 Nov 2020 18:29:09 -0800
Date: Wed, 11 Nov 2020 10:14:54 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Deepak R Varma <mh12gx2825@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: replace idr_init() by idr_init_base()
Message-ID: <20201111021454.GP1239@zhen-hp.sh.intel.com>
References: <20201104121532.GA48202@localhost>
MIME-Version: 1.0
In-Reply-To: <20201104121532.GA48202@localhost>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1733077343=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1733077343==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EdRE1UL8d3mMOE6m"
Content-Disposition: inline


--EdRE1UL8d3mMOE6m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.04 17:45:32 +0530, Deepak R Varma wrote:
> idr_init() uses base 0 which is an invalid identifier. The new function
> idr_init_base allows IDR to set the ID lookup from base 1. This avoids
> all lookups that otherwise starts from 0 since 0 is always unused.
>=20
> References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")
>=20
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.c  | 2 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gv=
t.c
> index c7c561237883..45b492edbb19 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -312,7 +312,7 @@ int intel_gvt_init_device(struct drm_i915_private *i9=
15)
> =20
>  	gvt_dbg_core("init gvt device\n");
> =20
> -	idr_init(&gvt->vgpu_idr);
> +	idr_init_base(&gvt->vgpu_idr, 1);
>  	spin_lock_init(&gvt->scheduler.mmio_context_lock);
>  	mutex_init(&gvt->lock);
>  	mutex_init(&gvt->sched_lock);
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index f6d7e33c7099..1c8e63f84134 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -393,7 +393,7 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(str=
uct intel_gvt *gvt,
>  	mutex_init(&vgpu->dmabuf_lock);
>  	INIT_LIST_HEAD(&vgpu->dmabuf_obj_list_head);
>  	INIT_RADIX_TREE(&vgpu->page_track_tree, GFP_KERNEL);
> -	idr_init(&vgpu->object_idr);
> +	idr_init_base(&vgpu->object_idr, 1);
>  	intel_vgpu_init_cfg_space(vgpu, param->primary);
>  	vgpu->d3_entered =3D false;
> =20
> --=20

Looks good to me. Thanks!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--EdRE1UL8d3mMOE6m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX6tJHgAKCRCxBBozTXgY
Jyv8AJ0ZLKM2ez02e517XOPfJGtsLxANrwCeITSsq29wK0WjSZLfMr4lr6t1kwA=
=0VA9
-----END PGP SIGNATURE-----

--EdRE1UL8d3mMOE6m--

--===============1733077343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1733077343==--
