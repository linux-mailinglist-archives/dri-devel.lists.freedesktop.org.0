Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB5A74DDF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 16:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918F810EA4C;
	Fri, 28 Mar 2025 15:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m/FZccmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A02210EA4C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 15:33:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4697C5C02FC;
 Fri, 28 Mar 2025 15:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CA5C4CEE5;
 Fri, 28 Mar 2025 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743175981;
 bh=IsNGXSKqdo855L/Ngqh5mwWDeZupDK+JtVmtquYF0iU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m/FZccmoBGu2WnivPMQdPhb5urdxowgHf+hWVtJo5ygXbbCzoxiw+nB8kZWmDyK3o
 w3BWYUPM1IornA01ZY4q48jgbrEqXkLviUOFK2MYOYAbk/PSIZu6b4b0lK8nM8EMbw
 PvDoedi4oJzOkVVGAYGPcvydmicix0Ytx4ee8GBTeu9vSSW5Rzqbi5wcmiFP4Hlt4W
 zKy6EDtRxjr1udG2WWXGsQDE+iqrOnbCD0B09BdJkiSsboQGkG+R0VP/ZGv/Aydo9O
 5lkV90UCAwHTIYLZzXAOy3cIA7vH6PbdQyxDA3BV4AKBQsOA3i9lv6Jn0holNnI18b
 1SjXEp3f7p8/g==
Date: Fri, 28 Mar 2025 16:32:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/vc4: tests: Stop allocating the state in test init
Message-ID: <20250328-radiant-azure-falcon-aafcf3@houat>
References: <20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org>
 <20250318-drm-vc4-kunit-failures-v1-3-779864d9ab37@kernel.org>
 <ad77e39d-4862-4e04-87a0-2a6a2682d5c9@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7xrsxy7ja7tz2yot"
Content-Disposition: inline
In-Reply-To: <ad77e39d-4862-4e04-87a0-2a6a2682d5c9@igalia.com>
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


--7xrsxy7ja7tz2yot
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] drm/vc4: tests: Stop allocating the state in test
 init
MIME-Version: 1.0

On Sun, Mar 23, 2025 at 03:48:17PM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 18/03/25 11:17, Maxime Ripard wrote:
> > The vc4-pv-muxing-combinations and vc5-pv-muxing-combinations test
> > suites use a common test init function which, in part, allocates the
> > drm atomic state the test will use.
> >=20
> > That allocation relies on  drm_kunit_helper_atomic_state_alloc(), and
> > thus requires a struct drm_modeset_acquire_ctx. This context will then
> > be stored in the allocated state->acquire_ctx field.
> >=20
> > However, the context is local to the test init function, and is cleared
> > as soon as drm_kunit_helper_atomic_state_alloc() is done. We thus end up
> > with an dangling pointer to a cleared context in state->acquire_ctx for
> > our test to consumes.
> >=20
> > We should really allocate the context and the state in the test
> > functions, so we can also control when we're done with it.
> >=20
> > Fixes: 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_allo=
c()")
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 41 +++++++++++++++++=
---------
> >   1 file changed, 27 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/g=
pu/drm/vc4/tests/vc4_test_pv_muxing.c
> > index 992e8f5c5c6ea8d92338a8fe739fa1115ff85338..52c04ef33206bf4f9e21e3c=
8b7cea932824a67fa 100644
> > --- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> > +++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> > @@ -18,11 +18,10 @@
> >   #include "vc4_mock.h"
> >   struct pv_muxing_priv {
> >   	struct vc4_dev *vc4;
> > -	struct drm_atomic_state *state;
>=20
> Can't we add `struct drm_modeset_acquire_ctx` here? Then, we can be sure
> that the context exists during the entire test case.
>=20
> Also, we can add `drm_modeset_drop_locks()` and
> `drm_modeset_acquire_fini()` to a exit function in the kunit suite.

That's what we were doing before, but the kunit functions and exit
functions are run in a separate thread by design, which then cause
lockdep to complain.

It's not great, but we can't really change either :/

Maxime

--7xrsxy7ja7tz2yot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+bBKgAKCRDj7w1vZxhR
xfYbAP9PsiHLJHqBsEPsbFG0v/DQqnP4d2kHmRC7gVAoYJk/zwD+KcAhsptB8vG9
2yC8F78PVhb91WHfKzmgokO0apagWQs=
=0Jjq
-----END PGP SIGNATURE-----

--7xrsxy7ja7tz2yot--
