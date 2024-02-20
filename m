Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC9B85B92E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 11:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7173310E245;
	Tue, 20 Feb 2024 10:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e5pfz8lv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A4810E2E6;
 Tue, 20 Feb 2024 10:37:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EE9B06106E;
 Tue, 20 Feb 2024 10:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2B7C43390;
 Tue, 20 Feb 2024 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708425421;
 bh=HE2OzfG4EqtZgFP0QsotK9dXmyu4xD65IwJD3HwO9vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e5pfz8lvnhbzcrqELHbRXnyGiMyNphfuFFokO6DK9FlFaxlOkXLuRflOzw6fI8FVk
 qV7EgwP6akuaFCyGQF3tSRgvcnSH9UyhImsLHiv6AOKOSbfTctmp60RAWDlJfthZj/
 3vg6OVx2Bevh/XDirjdYFW+q65yfLHwNzomPhJ1LcGIpXWCIEkPtfZN5PsBTGvlrud
 ln6YphWJjdUSTTrqHp3qdv276KDdrcskFP7qYmFsDyNSlV74eG7WhgYM8oqAqEfWQf
 ShBy663xFj9IEE3spiQj6tDNh4HZR8geN1nNOCyXg/8aini+zphCib+oBjQpBM1gei
 jzK0En1CmU8rQ==
Date: Tue, 20 Feb 2024 11:36:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Fix possible null pointer dereference after
 drm_dbg_printer conversion
Message-ID: <ztlmkeavgpriq2hifpdjqw4k5zyfopstfcmgvgzakfbomrj43j@qxcw74jtw3uf>
References: <20240219131423.1854991-1-tvrtko.ursulin@linux.intel.com>
 <ZdOz78jQu-GvJuDJ@intel.com>
 <f8455cd2-bed6-4026-bf6e-f6dfea2f86c5@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="id6raohf77t2gwxd"
Content-Disposition: inline
In-Reply-To: <f8455cd2-bed6-4026-bf6e-f6dfea2f86c5@linux.intel.com>
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


--id6raohf77t2gwxd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 09:16:43AM +0000, Tvrtko Ursulin wrote:
>=20
> On 19/02/2024 20:02, Rodrigo Vivi wrote:
> > On Mon, Feb 19, 2024 at 01:14:23PM +0000, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > >=20
> > > Request can be NULL if no guilty request was identified so simply use
> > > engine->i915 instead.
> > >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Fixes: d50892a9554c ("drm/i915: switch from drm_debug_printer() to de=
vice specific drm_dbg_printer()")
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Cc: Luca Coelho <luciano.coelho@intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >=20
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> Thanks Rodrigo!
>=20
> Given how d50892a9554c landed via drm-misc-next, Maxime or Thomas - could
> you take this via drm-misc-next-fixes or if there will be another
> drm-misc-next pull request?

There will be a drm-misc-next PR on thursday

Maxime

--id6raohf77t2gwxd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdSAygAKCRDj7w1vZxhR
xcZHAP9zPVg/TuQoI193FB6bPFwwH5WpSSs3SvFJtWmhhB8IlAEA+u5AfiNSaA94
G27tP74HPj9a1zmFLSV1ek/pKlT+igs=
=d/0x
-----END PGP SIGNATURE-----

--id6raohf77t2gwxd--
