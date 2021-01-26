Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6055330345D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 06:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D1C6E3CE;
	Tue, 26 Jan 2021 05:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBBF6E3CE;
 Tue, 26 Jan 2021 05:23:57 +0000 (UTC)
IronPort-SDR: PE+k6hdTRADQsFYySgiP/KAdupzRCpNtO/N2p5G7/X/3Djt9yyWaSmFJ2mC3dFEYBPsRMj5sci
 PWUOR7QCKwog==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="264674047"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
 d="asc'?scan'208";a="264674047"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 21:23:57 -0800
IronPort-SDR: eaBlv4AGGijngGP3ws/b3rP3NdBkcHvxQf2pWxo6jNO0z+G6Pw5uviBojrjszIlien2DQ2S0Pf
 zWsQp+kD/zbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
 d="asc'?scan'208";a="573943834"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jan 2021 21:23:54 -0800
Date: Tue, 26 Jan 2021 13:09:01 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915/gvt: fix uninitialized return in
 intel_gvt_update_reg_whitelist()
Message-ID: <20210126050901.GF1538@zhen-hp.sh.intel.com>
References: <YA6F3oF8mRaNQWjb@mwanda>
 <161156789392.31416.7341729779003502151@build.alporthouse.com>
MIME-Version: 1.0
In-Reply-To: <161156789392.31416.7341729779003502151@build.alporthouse.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: multipart/mixed; boundary="===============0294112071=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0294112071==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.01.25 09:44:53 +0000, Chris Wilson wrote:
> Quoting Dan Carpenter (2021-01-25 08:48:30)
> > Smatch found an uninitialized variable bug in this code:
> >=20
> >     drivers/gpu/drm/i915/gvt/cmd_parser.c:3191 intel_gvt_update_reg_whi=
telist()
> >     error: uninitialized symbol 'ret'.
> >=20
> > The first thing that Smatch complains about is that "ret" isn't set if
> > we don't enter the "for_each_engine(engine, &dev_priv->gt, id) {" loop.
> > Presumably we always have at least one engine so that's a false
> > positive.
> >=20
> > But it's definitely a bug to not set "ret" if i915_gem_object_pin_map()
> > fails.
>=20
> True.
> =20
> > Let's fix the bug and silence the false positive.
> >=20
> > Fixes: 493f30cd086e ("drm/i915/gvt: parse init context to update cmd ac=
cessible reg whitelist")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Thanks, Dan & Chris! Queued this up.

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYA+j6AAKCRCxBBozTXgY
J5cJAJ9sFEZY0fDpLiQtUxokU7lBHau3GQCePa3i/LHx5XYBX6y/5g6zbXsx+DQ=
=ooGI
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--

--===============0294112071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0294112071==--
