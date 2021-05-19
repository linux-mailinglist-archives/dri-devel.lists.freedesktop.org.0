Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA9F38894D
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 10:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91676ECE2;
	Wed, 19 May 2021 08:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4606ECD8;
 Wed, 19 May 2021 08:22:26 +0000 (UTC)
IronPort-SDR: TPVMLRQEwvzj2XPogaM8xWyzxDqQZTg4TytimywkJLiEK9dM1lF9x9E2ZZYDA6E1RyQOpOoWkG
 u767NNrtO1+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="221986852"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
 d="asc'?scan'208";a="221986852"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 01:22:26 -0700
IronPort-SDR: McSSJRRw48V349RDoD0llwjJNN8heIv8jAdblzFycRyptQXbfitydfMv2UyQiNqy3TKj+Gha/i
 U6/MRc8oofKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
 d="asc'?scan'208";a="466870361"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 19 May 2021 01:22:23 -0700
Date: Wed, 19 May 2021 16:03:13 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/i915/gvt: remove local storage of debugfs file
Message-ID: <20210519080313.GH4589@zhen-hp.sh.intel.com>
References: <20210518161705.3697143-1-gregkh@linuxfoundation.org>
 <YKPrRW+zBC8Wmjgz@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="bgQAstJ9X1Eg13Dy"
Content-Disposition: inline
In-Reply-To: <YKPrRW+zBC8Wmjgz@kroah.com>
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
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bgQAstJ9X1Eg13Dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.05.18 18:28:53 +0200, Greg Kroah-Hartman wrote:
> On Tue, May 18, 2021 at 06:17:05PM +0200, Greg Kroah-Hartman wrote:
> > There is no need to keep the dentry around for the debugfs kvmgt cache
> > file, as we can just look it up when we want to remove it later on.
> > Simplify the structure by removing the dentry and relying on debugfs
> > to find the dentry to remove when we want to.
> >=20
> > By doing this change, we remove the last in-kernel user that was storing
> > the result of debugfs_create_long(), so that api can be cleaned up.
> >=20
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: intel-gvt-dev@lists.freedesktop.org
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/gpu/drm/i915/gvt/kvmgt.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> Note, I can take this through my debugfs tree if wanted, that way I can
> clean up the debugfs_create_long() api at the same time.  Otherwise it's
> fine, I can wait until next -rc1 for that to happen.
>=20

It's fine with me to go through debugfs tree. Just double check that recent
kvmgt change would not cause conflict with this as well.

Thanks

--bgQAstJ9X1Eg13Dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYKTGOwAKCRCxBBozTXgY
J86FAJwJhP+/qRBwSoAQBBedLuDT7lzYywCePdczPYwHElQrgjjszk/zeJ/Ql/4=
=t9He
-----END PGP SIGNATURE-----

--bgQAstJ9X1Eg13Dy--
