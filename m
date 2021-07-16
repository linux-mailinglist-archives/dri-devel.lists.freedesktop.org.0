Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED43CB300
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 09:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD476E91F;
	Fri, 16 Jul 2021 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E186E919;
 Fri, 16 Jul 2021 07:12:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="271800646"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
 d="asc'?scan'208";a="271800646"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 00:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
 d="asc'?scan'208";a="495951551"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2021 00:12:21 -0700
Date: Fri, 16 Jul 2021 14:50:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 12/13] vfio/gvt: Fix open/close when multiple device FDs
 are open
Message-ID: <20210716065057.GA13928@zhen-hp.sh.intel.com>
References: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <12-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <12-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.07.14 21:20:41 -0300, Jason Gunthorpe wrote:
> The user can open multiple device FDs if it likes, however the open
> function calls vfio_register_notifier() on device global state. Calling
> vfio_register_notifier() twice will trigger a WARN_ON from
> notifier_chain_register() and the first close will wrongly delete the
> notifier and more.
>=20
> Since these really want the new open/close_device() semantics just change
> the function over.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 1ac98f8aba31e6..7efa386449d104 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -885,7 +885,7 @@ static int intel_vgpu_group_notifier(struct notifier_=
block *nb,
>  	return NOTIFY_OK;
>  }
> =20
> -static int intel_vgpu_open(struct mdev_device *mdev)
> +static int intel_vgpu_open_device(struct mdev_device *mdev)
>  {
>  	struct intel_vgpu *vgpu =3D mdev_get_drvdata(mdev);
>  	struct kvmgt_vdev *vdev =3D kvmgt_vdev(vgpu);
> @@ -1004,7 +1004,7 @@ static void __intel_vgpu_release(struct intel_vgpu =
*vgpu)
>  	vgpu->handle =3D 0;
>  }
> =20
> -static void intel_vgpu_release(struct mdev_device *mdev)
> +static void intel_vgpu_close_device(struct mdev_device *mdev)
>  {
>  	struct intel_vgpu *vgpu =3D mdev_get_drvdata(mdev);
> =20
> @@ -1753,8 +1753,8 @@ static struct mdev_parent_ops intel_vgpu_ops =3D {
>  	.create			=3D intel_vgpu_create,
>  	.remove			=3D intel_vgpu_remove,
> =20
> -	.open			=3D intel_vgpu_open,
> -	.release		=3D intel_vgpu_release,
> +	.open_device		=3D intel_vgpu_open_device,
> +	.close_device		=3D intel_vgpu_close_device,
> =20
>  	.read			=3D intel_vgpu_read,
>  	.write			=3D intel_vgpu_write,

Looks ok to me. Thanks!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYPEsTAAKCRCxBBozTXgY
Jx7CAJwL3rjxtO0hmyVLloknYXTNq4Pl4gCcC95wG37YNR4DYMf5Ns1jbuH5Nqk=
=WTLJ
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
