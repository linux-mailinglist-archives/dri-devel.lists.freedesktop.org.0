Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EB9972C5C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 10:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A2010E69E;
	Tue, 10 Sep 2024 08:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VZfHL4E5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C0210E70D;
 Tue, 10 Sep 2024 08:40:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0C557A442A3;
 Tue, 10 Sep 2024 08:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3341C4CEC3;
 Tue, 10 Sep 2024 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725957641;
 bh=fsRDU8wvHNbE3TrTlHlzeag4AIzuPwRtsz4XLaVWCOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VZfHL4E58gsKWGd76dFjLQ6ho7Ez6+TYzBWDhMAgxL2bQ7jeHIusX1C+aLUCTQy3P
 27c1hMl1uXWVbJid/oN4YIYABYcxxN43sTL1Ptygw4kUEXVHe66rwUBuzDY3eqwZZA
 zw3Cu6YBFs6+RuKYsr4h7I9aYxIgWVBJ/7YWPR6K8vIM51XJWN0vb2gR1jx+NGwDTh
 ParUag1s4e7/z2HXRSBSCWbNWoZhhUjg3nq4MObIhmLJxfp4bYZc66Y3ENfrpFtTS4
 BuDvDjwWOMQkgzM3ACF3hAZL+/UqIL2IIYQUQfY6JhKmq1YQ7unA3aU+0yPxHEyure
 0hg6a8UeI3UfQ==
Date: Tue, 10 Sep 2024 10:40:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, 
 quic_jesszhan@quicinc.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm: allow encoder mode_set even when connectors
 change for crtc
Message-ID: <20240910-liberal-platinum-scorpion-d43cff@houat>
References: <20240905221124.2587271-1-quic_abhinavk@quicinc.com>
 <20240909-neat-stoic-hamster-cbbe42@houat>
 <33f29f1c-157a-424e-89c6-c1549a2d6403@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7jrcqjaerdfyqd4f"
Content-Disposition: inline
In-Reply-To: <33f29f1c-157a-424e-89c6-c1549a2d6403@quicinc.com>
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


--7jrcqjaerdfyqd4f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 09, 2024 at 12:59:47PM GMT, Abhinav Kumar wrote:
> On 9/9/2024 6:37 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Sep 05, 2024 at 03:11:24PM GMT, Abhinav Kumar wrote:
> > > In certain use-cases, a CRTC could switch between two encoders
> > > and because the mode being programmed on the CRTC remains
> > > the same during this switch, the CRTC's mode_changed remains false.
> > > In such cases, the encoder's mode_set also gets skipped.
> > >=20
> > > Skipping mode_set on the encoder for such cases could cause an issue
> > > because even though the same CRTC mode was being used, the encoder
> > > type could have changed like the CRTC could have switched from a
> > > real time encoder to a writeback encoder OR vice-versa.
> > >=20
> > > Allow encoder's mode_set to happen even when connectors changed on a
> > > CRTC and not just when the mode changed.
> > >=20
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >=20
> > The patch and rationale looks sane to me, but we should really add kunit
> > tests for that scenarii.
> >=20
>=20
> Thanks for the review.
>=20
> We have a IGT for recreating this scenario and thats how this issue was
> captured
>=20
> kms_writeback --run-subtest writeback-check-output -c <primary display mo=
de>
>=20
> We had added an option ( 'c' - custom mode) a couple of yrs ago to allow
> writeback to be tested using any mode the user passes in (https://lore.ke=
rnel.org/r/all/YuJhGkkxah9U6FGx@platvala-desk.ger.corp.intel.com/T/)
>=20
> If we pass in the same resolution as the primary RT display, this scenario
> always happens as the CRTC switches between RT encoder and WB encoder. Ho=
pe
> that addresses some of the concern.

Unless it can easily be run in some sort of CI loop by anyone
contributing to that part of the kernel, it doesn't.

Don't get me wrong, it's a great feature, but it doesn't help making
sure that issue never creeps back in.

> Regarding KUnit tests, I have a couple of questions:
>=20
> 1) This is more of a run-time scenario where CRTC switch happens, does th=
is
> qualify for a KUnit or perhaps I am missing something.

We've been using kunit to perform integration tests in the kernel too,
so I would say that it definitely qualifies.

> 2) Is there any existing KUnit test file under drm/tests for validating
> drm_atomic_helper_commit_modeset_disables() /
> drm_atomic_helper_commit_modeset_enables() path because this will fall un=
der
> that bucket. I didnt find any matching case where we can extend this.

We don't have that at the moment, but we shouldn't be too far off. The
HDMI framework I contributed some months ago for example has all the
mode checking infrastructure in kunit. So you already have some way to
create a driver, a new state, modify that state and check it.

The only thing missing in your case is being able to commit it and check
that it has run, which shouldn't be too hard

Maxime

--7jrcqjaerdfyqd4f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZuAGAQAKCRAnX84Zoj2+
dpLoAXkBK8JwrsVQuf2LqGLxeVqzaRJ7su/AdURL0fGlvmHKMl3Gkfnx6EVK9WHW
GYEp1HsBgJDp26/ccf7xUubr49cUDSZdR0n193929c9G9IRMkPKs7AJzrsWJDWu0
Vo4Ay1itUw==
=GnqI
-----END PGP SIGNATURE-----

--7jrcqjaerdfyqd4f--
