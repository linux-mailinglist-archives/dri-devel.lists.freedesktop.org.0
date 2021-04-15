Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CBB3608F5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 14:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22D46EA4C;
	Thu, 15 Apr 2021 12:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B296E500;
 Thu, 15 Apr 2021 12:11:13 +0000 (UTC)
IronPort-SDR: KYYygcB8BJ57jOO2yA4MiXLtcFo7ODU6L6FlMvS03RGbQulgg1hN/CLo+x96heDIPDxMHlCanq
 2kQG1APXWCpA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="280153584"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
 d="asc'?scan'208";a="280153584"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 05:11:13 -0700
IronPort-SDR: Ag3JTxydd+BoZMqrZHS2g+vR8Eq1VQToYblJfFy88zEgalskyeHIApqYnrb0n8YNkiQoJLiYqN
 k+ts2gM3ioIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
 d="asc'?scan'208";a="461591472"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga001.jf.intel.com with ESMTP; 15 Apr 2021 05:11:09 -0700
Date: Thu, 15 Apr 2021 19:53:17 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix error code in intel_gvt_init_device()
Message-ID: <20210415115317.GS1551@zhen-hp.sh.intel.com>
References: <YHaFQtk/DIVYK1u5@mwanda>
MIME-Version: 1.0
In-Reply-To: <YHaFQtk/DIVYK1u5@mwanda>
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
Cc: fred gao <fred.gao@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1789364711=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1789364711==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UsbkURXZxe2ekgES"
Content-Disposition: inline


--UsbkURXZxe2ekgES
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.04.14 09:01:38 +0300, Dan Carpenter wrote:
> The intel_gvt_init_vgpu_type_groups() function is only called from
> intel_gvt_init_device().  If it fails then the intel_gvt_init_device()
> prints the error code and propagates it back again.  That's a bug
> because false is zero/success.  The fix is to modify it to return zero
> or negative error codes and make everything consistent.
>=20
> Fixes: c5d71cb31723 ("drm/i915/gvt: Move vGPU type related code into gvt =
file")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks, Dan! Applied this.

>  drivers/gpu/drm/i915/gvt/gvt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gv=
t.c
> index 2ecb8534930b..1deb253ffe80 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -126,7 +126,7 @@ static bool intel_get_gvt_attrs(struct attribute_grou=
p ***intel_vgpu_type_groups
>  	return true;
>  }
> =20
> -static bool intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
> +static int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
>  {
>  	int i, j;
>  	struct intel_vgpu_type *type;
> @@ -144,7 +144,7 @@ static bool intel_gvt_init_vgpu_type_groups(struct in=
tel_gvt *gvt)
>  		gvt_vgpu_type_groups[i] =3D group;
>  	}
> =20
> -	return true;
> +	return 0;
> =20
>  unwind:
>  	for (j =3D 0; j < i; j++) {
> @@ -152,7 +152,7 @@ static bool intel_gvt_init_vgpu_type_groups(struct in=
tel_gvt *gvt)
>  		kfree(group);
>  	}
> =20
> -	return false;
> +	return -ENOMEM;
>  }
> =20
>  static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
> @@ -373,7 +373,7 @@ int intel_gvt_init_device(struct drm_i915_private *i9=
15)
>  		goto out_clean_thread;
> =20
>  	ret =3D intel_gvt_init_vgpu_type_groups(gvt);
> -	if (ret =3D=3D false) {
> +	if (ret) {
>  		gvt_err("failed to init vgpu type groups: %d\n", ret);
>  		goto out_clean_types;
>  	}
> --=20
> 2.30.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--UsbkURXZxe2ekgES
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYHgpKAAKCRCxBBozTXgY
JwjkAKCSaNdnh8Enpt19xF9KII6ijHEjGwCfSf8O9mouYgsENRZKXWdtLHyv7J0=
=REJl
-----END PGP SIGNATURE-----

--UsbkURXZxe2ekgES--

--===============1789364711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1789364711==--
