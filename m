Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7588088C6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 14:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853FA10E89F;
	Thu,  7 Dec 2023 13:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2C910E89F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 13:05:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8A6E1CE2379;
 Thu,  7 Dec 2023 13:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB22C433C8;
 Thu,  7 Dec 2023 13:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701954339;
 bh=gRwtriSNv+UF8KTIlw0KDZqgzjdvmtFYqC1AnE7906o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SOpIivQHzSvi76CfczyCwUtFKdFI9tsT1Gn5EGkTnh5RCVKQA0Mv6h47aZ/yEY/v8
 i44BjJmAshEZS0cZj5omXF3zEXLmZChFrHJ+GPMuE/7gqag0pcq9vnSpQiy+IAgole
 0Qquxjo4K9qNbbVTLMujqPZ6FTL+xLqMggaV8teajtYRn/thJu5nhBZbWVEGuuutYT
 swdotPlc1FEbfxYq7xgbpziFyhG0Kn9M4sSRbUX+xqKt9S5FlsTDymJEhqw0kiPtDM
 YUkg2vjIe94+Ud1jy6Y/bZOmazyD04SYTvD7o1GonsTr+SzOG7GbzuKRIl7/gvx1ve
 Ognl2MD7aoMPQ==
Date: Thu, 7 Dec 2023 14:05:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/plane: Make init functions panic consitently and
 explicitly
Message-ID: <bvbltrandfinmxb5uwcnhxg6hnaapdn5mkxscbco3ncmkhr4ft@5n7q4qyd3avk>
References: <20231206111351.300225-1-mripard@kernel.org>
 <87a5qm1fkq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aok7cyja4yylse7f"
Content-Disposition: inline
In-Reply-To: <87a5qm1fkq.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--aok7cyja4yylse7f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 12:18:13PM +0200, Jani Nikula wrote:
> On Wed, 06 Dec 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > All of the current plane init / allocation functions behave slightly
> > differently when it comes to argument sanitizing:
> >
> >  - drm_universal_plane_init() implicitly panics if the drm_device
> >    pointer or the drm_plane_funcs pointer are NULL, and calls WARN_ON if
> >    there's no destroy implementation but goes on with the initializatio=
n.
> >
> >  - drm_universal_plane_alloc() implicitly panics if the drm_device
> >    pointer is NULL, and will call WARN_ON and return an error if the
> >    drm_plane_funcs pointer is NULL.
> >
> >  - drmm_universal_plane_alloc() implicitly panics if the drm_device
> >    pointer is NULL, and will call WARN_ON and return an error if the
> >    drm_plane_funcs pointer is NULL or if there is a destroy
> >    implementation.
>=20
> NULL deref oopses but doesn't necessarily panic, right? Adding BUG() or
> BUG_ON() to unconditionally panic is not the way to go, either.

Sigh...

Your whole argument was that it was a precondition, and what the current
code was doing is just like an assertion. An assertion will stop the
execution of the program it's in.

If panicking isn't the way to go, then what is?

Maxime

--aok7cyja4yylse7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXHDIQAKCRDj7w1vZxhR
xTwkAQD4xTaz33fWk20MlKui8ZT8Ztv1VtJRMEVjxx5/QvBmWwD9Ga+t2KEVMMF5
4t+pmQq//JCYtmunymuGKcX2Dut7DwQ=
=SiRk
-----END PGP SIGNATURE-----

--aok7cyja4yylse7f--
