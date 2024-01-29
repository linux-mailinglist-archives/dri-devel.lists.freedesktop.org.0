Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6E683FCCF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 04:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9F5112186;
	Mon, 29 Jan 2024 03:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B37810F28D;
 Mon, 29 Jan 2024 03:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706499393; x=1738035393;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=DTK+Uv/HINzvJpySwWLfjp2M9gYLySqkKhOfo+5AGpI=;
 b=cBalCq59ca69lvcmnJuixCGBdRkoZiDlaQ49d/VzIT7+HclOnZL4SP91
 fuw6a+M/jKyCfQjjIghoRV04A2EsJl88z2a6d0ibhnRAP1rU1by3suMlG
 dC3gjMso+1XOUrDUn3aU91aE3WBgj+uFZJ8agZoTvwRi8IRe9IkYF5ujE
 bYp4PDwHoma+qTkUDjuLcyJ3obcicYdK53DD8tJlb6Pjbdx4i6Wcm3xW+
 i7h8p84K3YoSUR/qqL1uUOVLb5tXBmHIshhMONUL5lF3SwUy/BfB9PXaZ
 iDB4CtjmPFX3rlDW0DWdlIBisaXjj2CAB9PnQiRQL4FK0oBFhXLEHoXoG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9952027"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="asc'?scan'208";a="9952027"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2024 19:36:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="737252624"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
 d="asc'?scan'208";a="737252624"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by orsmga003.jf.intel.com with ESMTP; 28 Jan 2024 19:36:23 -0800
Date: Mon, 29 Jan 2024 11:37:12 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/i915/gvt: Fix uninitialized variable in handle_mmio()
Message-ID: <ZbcdaBVJeKLqaKNR@debian-scheme>
References: <11957c20-b178-4027-9b0a-e32e9591dd7c@moroto.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="fFznBIJrCBlpQLxV"
Content-Disposition: inline
In-Reply-To: <11957c20-b178-4027-9b0a-e32e9591dd7c@moroto.mountain>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fFznBIJrCBlpQLxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2024.01.26 11:41:47 +0300, Dan Carpenter wrote:
> This code prints the wrong variable in the warning message.  It should
> print "i" instead of "info->offset".  On the first iteration "info" is
> uninitialized leading to a crash and on subsequent iterations it prints
> the previous offset instead of the current one.
>=20
> Fixes: e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from GVT=
-g")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 90f6c1ece57d..efcb00472be2 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -2849,8 +2849,7 @@ static int handle_mmio(struct intel_gvt_mmio_table_=
iter *iter, u32 offset,
>  	for (i =3D start; i < end; i +=3D 4) {
>  		p =3D intel_gvt_find_mmio_info(gvt, i);
>  		if (p) {
> -			WARN(1, "dup mmio definition offset %x\n",
> -				info->offset);
> +			WARN(1, "dup mmio definition offset %x\n", i);
> =20
>  			/* We return -EEXIST here to make GVT-g load fail.
>  			 * So duplicated MMIO can be found as soon as
> --=20
> 2.43.0
>

Thanks for the fix.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>


--fFznBIJrCBlpQLxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZbcdZAAKCRCxBBozTXgY
J2ggAKCd25TTBDuQLbVH3Z0bjmgfKdx2/ACdGvx9Npm4P2p4XDkYtaiqEkyy4Zk=
=/6Nx
-----END PGP SIGNATURE-----

--fFznBIJrCBlpQLxV--
