Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D92771A96
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 08:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02ED10E1CF;
	Mon,  7 Aug 2023 06:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D302110E1CF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 06:41:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C31461547;
 Mon,  7 Aug 2023 06:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE57C433C7;
 Mon,  7 Aug 2023 06:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691390468;
 bh=shmkDixKjfxqPOOrej8a436ZyPxFgCre534PhMkTgyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FxVD8Hp1iaXBb/k+3GfCnYUbLQrwZXepIexhr+bB3i12CvGu1/HUhgkqYVxip66NE
 zE3cZDqeeE9DByt2SwBSjhri8VRgVYOLRtY8jZzfjr5q5ulG0bGrsthbM8Kdfvkia7
 LWsS8vz5NcRTwmgYfdd0nOzLSRxDzAZ91hE6Vv+pK/eUiy7Mubr4DwgrofwHoG/VFC
 owsP8W+ZY/3UhwhGyVXACMr+CQMsp1Tal3r+x6MMvASR/gd7cOmQ3XvfQSwRIK8fEQ
 6XdsGUgLUsXjDzxgLG550/Raa9ALWyH/U1J/P3AZxBN+oRO+A30XLMjaG4jqOfiBCF
 0NwL9USzGJCEQ==
Date: Mon, 7 Aug 2023 08:41:05 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
Message-ID: <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cxm7ekfl4brm6ey5"
Content-Disposition: inline
In-Reply-To: <20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cxm7ekfl4brm6ey5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Doug,

Thanks for working on this :)

On Fri, Aug 04, 2023 at 02:06:07PM -0700, Douglas Anderson wrote:
> The goal of this file is to contain helper functions for panel drivers
> to use. To start off with, let's add drm_panel_helper_shutdown() for
> use by panels that want to make sure they're powered off at
> shutdown/remove time if they happen to be powered on.
>=20
> The main goal of introducting this function is so that panel drivers
> don't need to track the enabled/prepared state themselves.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

It shouldn't be necessary at all: drivers should call
drm_atomic_helper_shutdown at removal time which will disable the
connector (which in turn should unprepare/disable its panel).

If either the driver is missing drm_atomic_helper_shutdown, or if the
connector doesn't properly disable the panel, then I would consider that
a bug.

Maxime

--cxm7ekfl4brm6ey5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZNCR+AAKCRDj7w1vZxhR
xUuTAQCAryTeq8rxbABCSj1+5dZaS94tv1e24Y3awd+OHda54gD+MOimHLia2BN8
S9vFKOumNJpLn7fm+W9z9AHJA1tCXQw=
=TfNh
-----END PGP SIGNATURE-----

--cxm7ekfl4brm6ey5--
