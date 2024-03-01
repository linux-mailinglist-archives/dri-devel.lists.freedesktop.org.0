Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB386E50D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 17:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791BB10E622;
	Fri,  1 Mar 2024 16:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qjsU8/rM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689B410E622
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 16:11:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ACF4FCE25BA;
 Fri,  1 Mar 2024 16:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D2DC433F1;
 Fri,  1 Mar 2024 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709309505;
 bh=8cB+9zbNH8jaDoktAsNfOEmmtzyQCQ2xpzsCcbjmugM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qjsU8/rMum31+d1BmGBf7mI042/NWP+4ou5aW0hE0/vJpPRGphZpzQPLDzDXiEIkN
 gKWTwLHQgGB/80+f3S68rrxpQ/YF4Tuy8APIyIr8+99SrN6kw1Dhxc12JnwtY5jf7x
 pvL586RnxERNwpJb+iElq7OGcah7eMjibELE95obe2NJK5r8MICTofbQPKpkN/Y0C8
 7RdppAmicvHVelboG0k9OjlAoAlRA2MNe1BOK/mr5vOryoKEFyc3Xd/wB6j8XlSn3Q
 yy0EvyBe/AK2I0H+Wae0uhGVJ+IJVFKj94Eg3Ks+jeddtr+EigFGAJ/m1dBCzVIYzT
 aY1TAAAyPQtVA==
Date: Fri, 1 Mar 2024 17:11:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <20240301-enigmatic-brown-skylark-7bff1b@houat>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hyb3eyzndzemzb26"
Content-Disposition: inline
In-Reply-To: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
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


--hyb3eyzndzemzb26
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 20, 2024 at 09:49:25AM +0100, Maxime Ripard wrote:
> ## Changing the default location repo
>=20
> Dim gets its repos list in the drm-rerere nightly.conf file. We will
> need to change that file to match the gitlab repo, and drop the old cgit
> URLs to avoid people pushing to the wrong place once the transition is
> made.
>=20
> I guess the next merge window is a good time to do so, it's usually a
> quiet time for us and a small disruption would be easier to handle. I'll
> be off-duty during that time too, so I'll have time to handle any
> complication.

Looking back at the drm.git transition this week, there's probably some
adjustments to make.

First, we shouldn't remove the old repos URLs from nightly.conf entirely
but use the drm_old_urls array we now have to migrate people seamlessly
over time.

Since a lot of people are going to commit compared to drm though, it's
probably best to setup the cgit drm-misc repo as a mirror / read-only
right away and just before committing the nightly.conf modifications.
This way we will avoid a duplication of drm-misc if someone for some
reason didn't switch to the new URL.

And then there's the drm-tip topic. drm-tip at the moment gives write
access to the drm, drm-intel, drm-misc and drm-xe committers. All these
have the gitlab groups setup but drm-intel.

The best scenario would have been to migrate drm-tip before drm-misc so
we don't have a period of time where some people that could have been
granted privileges on the gitlab side wouldn't have cgit credentials,
and thus wouldn't be able to push to drm-tip.

However, it's not clear yet how drm-intel wants to set things up, so we
might have to do that still. Or do both at the same time, for additional
fun.

Maxime

--hyb3eyzndzemzb26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeH+PgAKCRDj7w1vZxhR
xQW+AP9OcLMTL2AlSjYfTK7hIzKCbiiK+ZDAtleZJDSt4zgqhQEAg6SHaSgjyU2f
laNZ9DKGppQMCOak3e5u7W81B8GcTgs=
=oGTT
-----END PGP SIGNATURE-----

--hyb3eyzndzemzb26--
