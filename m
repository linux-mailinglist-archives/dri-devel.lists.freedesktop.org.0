Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921BF2760D5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 21:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7696C6E9EE;
	Wed, 23 Sep 2020 19:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3C46E9EE;
 Wed, 23 Sep 2020 19:17:30 +0000 (UTC)
Received: from xpredator (unknown
 [IPv6:2a02:2f08:4c14:a400:24d7:51ff:fed6:906d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: mvlad)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4CC8929963E;
 Wed, 23 Sep 2020 20:17:28 +0100 (BST)
Date: Wed, 23 Sep 2020 22:17:24 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic: document and enforce rules around "spurious"
 EBUSY
Message-ID: <20200923191724.GA62596@xpredator>
References: <20200923105737.2943649-1-daniel.vetter@ffwll.ch>
 <20200923151852.2952812-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200923151852.2952812-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: multipart/mixed; boundary="===============1492538697=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1492538697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 05:18:52PM +0200, Daniel Vetter wrote:
> When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> pull in arbitrary other resources, including CRTCs (e.g. when
> reconfiguring global resources).
>=20
> But in nonblocking mode userspace has then no idea this happened,
> which can lead to spurious EBUSY calls, both:
> - when that other CRTC is currently busy doing a page_flip the
>   ALLOW_MODESET commit can fail with an EBUSY
> - on the other CRTC a normal atomic flip can fail with EBUSY because
>   of the additional commit inserted by the kernel without userspace's
>   knowledge
>=20
> For blocking commits this isn't a problem, because everyone else will
> just block until all the CRTC are reconfigured. Only thing userspace
> can notice is the dropped frames without any reason for why frames got
> dropped.
>=20
> Consensus is that we need new uapi to handle this properly, but no one
> has any idea what exactly the new uapi should look like. Since this
> has been shipping for years already compositors need to deal no matter
> what, so as a first step just try to enforce this across drivers
> better with some checks.
>=20
> v2: Add comments and a WARN_ON to enforce this only when allowed - we
> don't want to silently convert page flips into blocking plane updates
> just because the driver is buggy.
>=20
> v3: Fix inverted WARN_ON (Pekka).
>=20
> v4: Drop the uapi changes, only add a WARN_ON for now to enforce some
> rules for drivers.
>=20
> v5: Make the WARNING more informative (Daniel)
>=20
> v6: Add unconditional debug output for compositor hackers to figure
> out what's going on when they get an EBUSY (Daniel)
>=20
> References: https://lists.freedesktop.org/archives/dri-devel/2018-July/18=
2281.html
> Bugzilla: https://gitlab.freedesktop.org/wayland/weston/issues/24#note_95=
68
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 58527f151984..f1a912e80846 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -281,6 +281,10 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
>   * needed. It will also grab the relevant CRTC lock to make sure that th=
e state
>   * is consistent.
>   *
> + * WARNING: Drivers may only add new CRTC states to a @state if
> + * drm_atomic_state.allow_modeset is set, or if it's a driver-internal c=
ommit
> + * not created by userspace through an IOCTL call.
> + *
>   * Returns:
>   *
>   * Either the allocated state or the error code encoded into the pointer=
=2E When
> @@ -1262,10 +1266,15 @@ int drm_atomic_check_only(struct drm_atomic_state=
 *state)
>  	struct drm_crtc_state *new_crtc_state;
>  	struct drm_connector *conn;
>  	struct drm_connector_state *conn_state;
> +	unsigned requested_crtc =3D 0;
> +	unsigned affected_crtc =3D 0;
>  	int i, ret =3D 0;
> =20
>  	DRM_DEBUG_ATOMIC("checking %p\n", state);
> =20
> +	for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> +		requested_crtc |=3D drm_crtc_mask(crtc);
> +
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane=
_state, i) {
>  		ret =3D drm_atomic_plane_check(old_plane_state, new_plane_state);
>  		if (ret) {
> @@ -1313,6 +1322,26 @@ int drm_atomic_check_only(struct drm_atomic_state =
*state)
>  		}
>  	}
> =20
> +	for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> +		affected_crtc |=3D drm_crtc_mask(crtc);
> +
> +	/*
> +	 * For commits that allow modesets drivers can add other CRTCs to the
> +	 * atomic commit, e.g. when they need to reallocate global resources.
> +	 * This can cause spurious EBUSY, which robs compositors of a very
> +	 * effective sanity check for their drawing loop. Therefor only allow
> +	 * drivers to add unrelated CRTC states for modeset commits.
> +	 *
> +	 * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as an output
> +	 * so compositors know what's going on.
> +	 */
> +	if (affected_crtc !=3D requested_crtc) {
> +		DRM_DEBUG_ATOMIC("driver added CRTC to commit: requested 0x%x, affecte=
d 0x%0x\n",
> +				 requested_crtc, affected_crtc);
> +		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets:=
 requested 0x%x, affected 0x%0x\n",
> +		     requested_crtc, affected_crtc);
Previous patch had the warn on state->allow_modeset now is
!state->allow_modeset. Is that correct?

I haven't followed the entire thread on this matter, but I guess the idea
is that somehow the kernel would pass to userspace a CRTC mask of
affected_crtc (somehow, we don't know how atm) and with it, userspace
can then issue a new commit (this commit blocking) with those?
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_check_only);
> --=20
> 2.28.0
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAl9rn0EACgkQ9jQS5glH
1u943RAAmNIK2ma1gGkqyOtPhcLahZ6hWAmlY+cb3cJdpKAG+zCDuNw16NHCuXDP
bLSKCR+c9yOaqWDJjsl1RPexR+BBINyBLEccgK+OajE10ZkDazEtGfl70uHUQQd9
a7j6FW8OpmvmKxR8r/iaC/A1V4UUomjkDznplmN+0HJChzKt2DwMU4+Q2/UgSHkL
F8qR/nSaHhAYsVnjwSrFzfZYNR8UMMld0f8vNZdFJD9YDRvL1Ef+BIG43gvo6UUs
z5QJBlglmBKI8+fnHXj+9U+VtsfITVn2XgSsDxnMlBMbcdqi6l+WgYq8rqGvpJP8
EPKAX6WE++wq/58OeerJYp6fYLqvHn2nL00wcpC9wMGglS03NQbMixCGPa2+1lh/
64prR4mfKeHFgxRXLmd8PMRU0jPeSAHAidR9I4APXfp5GtF+cLfswUKYomCFfILx
jooVR2D5V4BVlUSllAT1WQYErP4FO9RugqaXdzcUkFlrhWpPGppgnqp1DGFQNhWz
aXji7y2NbqFAOwUIRpWpUGPOqZ1kzKJwR7T5e60N4A/6K8J3E84hndtIP14Mqg6Y
cVrNrQT2gTbDTIFbm/itb3xeWkYvqIEEoO+XB8bDBtNtc7V431bcfJ2UNSUP8F/6
l3Mk+MQXhnd74Kelkyvo2NrokrcGEJm6XLlJN6aI0mFmHuL6rBo=
=6uDo
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--

--===============1492538697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1492538697==--
