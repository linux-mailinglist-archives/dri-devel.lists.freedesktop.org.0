Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B537984543
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFE410E897;
	Tue, 24 Sep 2024 11:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M+6//Uds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1080A10E892;
 Tue, 24 Sep 2024 11:54:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55C3F5C5BE5;
 Tue, 24 Sep 2024 11:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99332C4CEC7;
 Tue, 24 Sep 2024 11:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727178863;
 bh=2/NtPKQe1oXyvLZXdWqc7DQrRq/Lus4Wr+gPXFADaes=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+6//UdsncVPD+Us3ug8fxLIRowu+753YsdGkDVpBq8z3Zcm8O/WuHHZ52aUa0TrN
 XxYr2IfPY2nlhPaRY1Ks0nZ3Y7PIQb4cmfnORlwuIoth5uXjlpeuKyqEdv0y5gikw9
 TiDDq+xClMcYPQS+KwIxAhQUdY4ARtezEo2/3GyNTFck4ykIGqVoP1M6OKLQpduFKy
 XxzcU9Oc/L9SWdocO6wiGJIYxh/Y/QM59rwjxImpdm0RBaP4DBaK0FthY/es+Ifoaz
 Pf1I6KktesupuJRdlAsenj+AcydHf5IaJ8FAsAVKQztjuPKwoh/vD2GrtfCl7H4NIX
 chcyq2OXBYMig==
Date: Tue, 24 Sep 2024 13:54:21 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
Message-ID: <20240924-refined-nocturnal-starfish-2947b8@houat>
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4ruyy6fj22peke3j"
Content-Disposition: inline
In-Reply-To: <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
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


--4ruyy6fj22peke3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+Guenter

On Tue, Sep 24, 2024 at 12:06:28PM GMT, Simona Vetter wrote:
> On Tue, Sep 17, 2024 at 08:43:50PM +0300, Jani Nikula wrote:
> > The tests consistently trigger WARNs in drm_framebuffer code. I'm not
> > sure what the point is with type of belts and suspenders tests. The
> > warnings *are* the way to flag erroneous API usage.
> >=20
> > Warnings in turn trigger failures in CI. Filtering the warnings are
> > error prone, and, crucially, would also filter actual errors in case the
> > kunit tests are not run.
> >=20
> > I acknowledge there may be complex test cases where you'd end up
> > triggering warnings somewhere deep, but these are not it. These are
> > simple.
> >=20
> > Revert the tests, back to the drawing board.
>=20
> Yeah I think long-term we might want a kunit framework so that we can
> catch dmesg warnings we expect and test for those, without those warnings
> actually going to dmesg. Similar to how the lockdep tests also reroute
> locking validation, so that the expected positive tests don't wreak
> lockdep for real.
>=20
> But until that exists, we can't have tests that splat in dmesg when they
> work as intended.

It should be pretty soon:
https://lore.kernel.org/dri-devel/20240403131936.787234-1-linux@roeck-us.ne=
t/

I'm not sure what happened to that series, but it looks like everybody
was mostly happy with it?

Maxime

--4ruyy6fj22peke3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvKoZAAKCRAnX84Zoj2+
dgUlAX0c20gM8WfZzRdIc0P60Fy9Bx6Kn26LtlfREuDwlrMZffPRkv6id+ojL1ED
UoDtqH8BfRmUoRm6bC3FwIE1tG8R95eq7QqNyu8dh+Ef+wr+nrJoqttkbXVsOGLo
2Tbqs85egg==
=becj
-----END PGP SIGNATURE-----

--4ruyy6fj22peke3j--
