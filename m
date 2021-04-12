Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51B35BB1F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 09:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152996E06B;
	Mon, 12 Apr 2021 07:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BFB89FC8;
 Mon, 12 Apr 2021 07:45:05 +0000 (UTC)
IronPort-SDR: NMoUDBxTHG5iNdSl8FFcD+M6x0ZxdrXzln8UPEEHJvudXv4sNiWZXZVSLDPcm0/fZ3toy0B56p
 O8iJfzR0Ce7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="190947095"
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; 
 d="asc'?scan'208";a="190947095"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 00:45:04 -0700
IronPort-SDR: kJ45/0G5LOluO86VMetfbfo/+siKD1wQwSauZMy1qlplDqmNhGOn0QqCF7LVlOZeNK+iCD9Pt0
 vCEjkmGuOEvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; 
 d="asc'?scan'208";a="449898175"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2021 00:45:00 -0700
Date: Mon, 12 Apr 2021 15:27:15 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [Intel-gfx] [PATCH v2 15/18] vfio/gvt: Make DRM_I915_GVT depend
 on VFIO_MDEV
Message-ID: <20210412072715.GC1551@zhen-hp.sh.intel.com>
References: <0-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
 <15-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <15-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Tarun Gupta <targupta@nvidia.com>
Content-Type: multipart/mixed; boundary="===============0026142950=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0026142950==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UExESr5xZTMxdOWv"
Content-Disposition: inline


--UExESr5xZTMxdOWv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.04.06 16:40:38 -0300, Jason Gunthorpe wrote:
> At some point there may have been some reason for this weird split in this
> driver, but today only the VFIO side is actually implemented.
>=20
> However, it got messed up at some point and mdev code was put in gvt.c and
> is pretending to be "generic" by masquerading as some generic attribute l=
ist:
>=20
>    static MDEV_TYPE_ATTR_RO(description);
>=20
> But MDEV_TYPE attributes are only usable with mdev_device, nothing else.
>=20
> Ideally all of this would be moved to kvmgt.c, but it is entangled with
> the rest of the "generic" code in an odd way. Thus put in a kconfig
> dependency so we don't get randconfig failures when the next patch creates
> a link time dependency related to the use of MDEV_TYPE.
>=20
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/drm/i915/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 1e1cb245fca778..483e9ff8ca1d23 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -101,6 +101,7 @@ config DRM_I915_GVT
>  	bool "Enable Intel GVT-g graphics virtualization host support"
>  	depends on DRM_I915
>  	depends on 64BIT
> +	depends on VFIO_MDEV
>  	default n
>  	help
>  	  Choose this option if you want to enable Intel GVT-g graphics
> --=20

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--UExESr5xZTMxdOWv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYHP2TgAKCRCxBBozTXgY
J+xeAJsG2n6iRNLLmLnm0S82Wt4Do2WB6wCfX5U3GyYXsm1FLd6d4hZ1tT/DaCA=
=bWKU
-----END PGP SIGNATURE-----

--UExESr5xZTMxdOWv--

--===============0026142950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0026142950==--
