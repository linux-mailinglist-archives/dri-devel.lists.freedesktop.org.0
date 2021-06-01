Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5A1396FB8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 11:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2266E9A7;
	Tue,  1 Jun 2021 09:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 332 seconds by postgrey-1.36 at gabe;
 Tue, 01 Jun 2021 09:00:46 UTC
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id D4B516E8BE;
 Tue,  1 Jun 2021 09:00:46 +0000 (UTC)
Received: from localhost (i577BC03F.versanet.de [87.123.192.63])
 by pokefinder.org (Postfix) with ESMTPSA id DF6B82C00E6;
 Tue,  1 Jun 2021 10:55:11 +0200 (CEST)
Date: Tue, 1 Jun 2021 10:55:11 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the i2c tree
Message-ID: <YLX176D9oD7ZTSkT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>
References: <20210601103250.07301254@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7fC2ObbQ+xfgL0jX"
Content-Disposition: inline
In-Reply-To: <20210601103250.07301254@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7fC2ObbQ+xfgL0jX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

> After merging the i2c tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from drivers/gpu/drm/i915/i915_gem.c:1250:
> drivers/gpu/drm/i915/selftests/i915_gem.c:97:13: error: conflicting types=
 for 'pm_suspend'
>    97 | static void pm_suspend(struct drm_i915_private *i915)
>       |             ^~~~~~~~~~
> In file included from include/linux/regulator/consumer.h:35,
>                  from include/linux/i2c.h:18,
>                  from drivers/gpu/drm/i915/i915_drv.h:39,
>                  from drivers/gpu/drm/i915/gt/intel_context.h:14,
>                  from drivers/gpu/drm/i915/gem/i915_gem_context.h:12,
>                  from drivers/gpu/drm/i915/i915_gem.c:44:
> include/linux/suspend.h:331:12: note: previous declaration of 'pm_suspend=
' was here
>   331 | extern int pm_suspend(suspend_state_t state);
>       |            ^~~~~~~~~~
>=20
> Caused by commit
>=20
>   5a7b95fb993e ("i2c: core: support bus regulator controlling in adapter")
>=20
> interacting with commit
>=20
>   3f51b7e1f36a ("drm/i915/selftests: Add a simple exerciser for suspend/h=
ibernate")
>=20
> from Linus' tree (v4.20-rc1)

Thank you very much for taking care of this!


> I have added the following merge fix patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 1 Jun 2021 10:25:49 +1000
> Subject: [PATCH] drm/i915/selftests: Avoid name clash with pm_ global fun=
ctions
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Looks like the proper solution to me. I think this should be added to
the i915 tree. D'accord everyone?

Reviewed-by: Wolfram Sang <wsa@kernel.org>

Kind regards,

   Wolfram


--7fC2ObbQ+xfgL0jX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC19esACgkQFA3kzBSg
Kbbycw//fBJvgMtiaQkNmsiGWds7C1Yx6tjro62FHwqbUlGEtsJmPKigzl75pcV0
KidL5Nte3E5bmW1EJuWky3cuQyriNNH/uFR6sHFooEtuwX8CT+LloHVYynFY817C
ztdfcUpyHgwkmAYWxP0/eJ4mSjPASHgK8pg07jvk2VSGExWwcXSlHO0siWwPgwHC
r8wjtkEFKqo3E8FNodtQFqEuHTRwaABN9jXrngroTq5izMNTgamSl6iDYUqdqCuY
OLpKDcK4Hxs54djtNMqmI6+E1vnowfcbaHRWln6A+PptT8Q0S/S2efWLIIV8Oe6H
XLz486hUy/R6AP9rjD24U9D0o+DCGD6/nbX+sASfoVxIuKpAMJgi/TjB3MiJ8yGH
44816xHEKIEBmZXcOm9F+Us690x5PaUvtEh8R2fpJT9ThOfd4zUjAh3/mPWbY3lv
CZ1lXUwtEOD/4y9rnJfliJrDQKZ1UHzEE7v3fAgNb+Jc5crpks6+tEO9lZ2Tz1qg
CRybK2aigC0LOQHp5IXq3lbgQNXy2HvPRX5qFjVYNJW8aeHNnlE+iWg9MP9xzGgV
jpW2Qqils+42wu05hGjYgREM/vNbzm3L9886OfQVyVNGdXfrE2T1mDtdIMiBpUE3
9MQjWbbSFWVcrCkTKVT6287E5w7ETWBXfC/9gwgeQrsyLX/BPT0=
=s2+6
-----END PGP SIGNATURE-----

--7fC2ObbQ+xfgL0jX--
