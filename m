Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6276368BDC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 06:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FD36EB3B;
	Fri, 23 Apr 2021 04:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228816EB3B;
 Fri, 23 Apr 2021 04:12:41 +0000 (UTC)
IronPort-SDR: +2sAoF/3uHiiE+Maa15l0o7RkbgHSTLIxJU3EZgyKoBjqUiUjIkzILuZg5rNkiRZsPN+5fy+V8
 I4DmnfrS1O0Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="281342201"
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; 
 d="asc'?scan'208";a="281342201"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 21:12:40 -0700
IronPort-SDR: nrk9t95tZ919uGBWhrlRupDvA67xEP9m+oDuc5Q6fst6eWRn+o8XlB4GQW2/9983TMqV2KZNxI
 wPuZdhh+XM1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; 
 d="asc'?scan'208";a="453469907"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2021 21:12:35 -0700
Date: Fri, 23 Apr 2021 11:54:26 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] vfio/gvt: fix DRM_I915_GVT dependency on VFIO_MDEV
Message-ID: <20210423035426.GG1551@zhen-hp.sh.intel.com>
References: <20210422133547.1861063-1-arnd@kernel.org>
 <20210422135810.GG2047089@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20210422135810.GG2047089@ziepe.ca>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============0276901954=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0276901954==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7WMexqIhC8AwFtpM"
Content-Disposition: inline


--7WMexqIhC8AwFtpM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.04.22 10:58:10 -0300, Jason Gunthorpe wrote:
> On Thu, Apr 22, 2021 at 03:35:33PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > The Kconfig dependency is incomplete since DRM_I915_GVT is a 'bool'
> > symbol that depends on the 'tristate' VFIO_MDEV. This allows a
> > configuration with VFIO_MDEV=3Dm, DRM_I915_GVT=3Dy and DRM_I915=3Dy that
> > causes a link failure:
> >=20
> > x86_64-linux-ld: drivers/gpu/drm/i915/gvt/gvt.o: in function `available=
_instances_show':
> > gvt.c:(.text+0x67a): undefined reference to `mtype_get_parent_dev'
> > x86_64-linux-ld: gvt.c:(.text+0x6a5): undefined reference to `mtype_get=
_type_group_id'
> > x86_64-linux-ld: drivers/gpu/drm/i915/gvt/gvt.o: in function `descripti=
on_show':
> > gvt.c:(.text+0x76e): undefined reference to `mtype_get_parent_dev'
> > x86_64-linux-ld: gvt.c:(.text+0x799): undefined reference to `mtype_get=
_type_group_id'
> >=20
> > Clarify the dependency by specifically disallowing the broken
> > configuration. If VFIO_MDEV is built-in, it will work, but if
> > VFIO_MDEV=3Dm, the i915 driver cannot be built-in here.
> >=20
> > Fixes: 07e543f4f9d1 ("vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV")
> > Fixes: 9169cff168ff ("vfio/mdev: Correct the function signatures for th=
e mdev_type_attributes")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/gpu/drm/i915/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Oh kconfig stuff like this makes my head hurt, thanks for finding it
>=20
> I also can't see an alternative to this ugly thing, besides having the
> i915 guys properly modularize this code someday
>=20
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>=20

I don't really want this mess to propagate further. We should move
mdev related stuff to kvmgt module instead, so not pretend any more to
possibly use that for other hypervisor..

Sorry that I didn't realize this issue when Jason proposed this. Let
me do the left cleanup.

Thanks

--7WMexqIhC8AwFtpM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYIJE6gAKCRCxBBozTXgY
J6G0AJ9jV+OfoH7vCSMZp4Y4fN0maPlC3gCaAwHGakKPCeQIPyHkDjbi9KCA64o=
=i7Nt
-----END PGP SIGNATURE-----

--7WMexqIhC8AwFtpM--

--===============0276901954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0276901954==--
