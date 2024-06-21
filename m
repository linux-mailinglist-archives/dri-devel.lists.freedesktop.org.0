Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C75911F7E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 10:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF69410F0E2;
	Fri, 21 Jun 2024 08:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K1Cr22Sg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCA410F0E2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:55:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0A4362484;
 Fri, 21 Jun 2024 08:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35662C2BBFC;
 Fri, 21 Jun 2024 08:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718960132;
 bh=JbuN4vvw/olx89Sy6CyiOo2x+8H2Y7+mRWLnMVb6naU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K1Cr22SgIpO9wI/olqcAV3KzT1tos1SuOzEZcOZjl43Gq1uQjNaNZ6EW+bkJf/vjj
 3MV7FMlZ+GkozLZz96g9UvRABQgYtsKIE4ynSm1kfTcz1/r+s/8roaSgQ4wYfCKr09
 nnl8WjR4xVkBXP8dIfnpws7a2bHANBxnXWNBiSAZhm7VDeC4oe4/fj/Eg1Tfh5isPn
 Bf5k0lF3NZOHPENAlkzobrQGU298jg6oX6S2Wnu+awPLZ6mNdmrhDqWn8NRSliMNv5
 LaviQy3tZRlEZfGfH7AR2EDOjSF2s05p6sftusd1OeAdmBqRsrWI7qc6rmOoKYISI2
 rk2Jz70yqyAIA==
Date: Fri, 21 Jun 2024 10:55:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/31] Preparatory patches for BCM2712 (Pi5) support
Message-ID: <20240621-determined-venomous-partridge-eddeb9@houat>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wvh2qgargax5pyjd"
Content-Disposition: inline
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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


--wvh2qgargax5pyjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Thanks for taking the time to send this.

I've gone through most of the patches and it looks pretty good already,
but I have a few general remarks:

  - We merged in drm-misc-next the new HDMI infrastructure recently and
    it will heavily conflict with some of these patches, so you need to
    rebase against either linux-next or drm-misc-next.

  - The author and SoB fields for my patches don't match anymore,
    possibly due to mailmap doing its magic.

    You can fix this by using, for the SoB:
    git filter-branch --msg-filter 'sed -i s/maxime@cerno.tech/mripard@kern=
el.org/' drm-misc-next..

    And for the authorship:
    git commit --amend --author=3D"Maxime Ripard <mripard@kernel.org>"
    for each commit.

  - All of the fixes need Fixes that are currently missing on most tags

  - And the commit prefix isn't consistent, especially for vc4_plane.c,
    the upstream convention so far has been drm/vc4: plane, instead of
    drm/vc4_plane.

Maxime

On Thu, Jun 20, 2024 at 04:46:01PM GMT, Dave Stevenson wrote:
> Hi
>=20
> This set is a number of minor fixes that we've had downstream for a while,
> and then lays down the some infrastructure changes to facilitate adding s=
upport
> of BCM2712. I'm just finalising those patches so they should follow on fa=
irly
> soon.
>=20
> Thanks
>   Dave
>=20
> Dave Stevenson (8):
>   drm/vc4: Force trigger of dlist update on margins change
>   drm/vc4: Set AXI panic modes for the HVS
>   drm/vc4: Limit max_bpc to 8 on Pi0-3
>   drm/vc4: Don't write gamma luts on 2711
>   drm/vc4: UV planes vertical scaling must always be enabled
>   drm/vc4: Fix dlist debug not resetting the next entry pointer
>   drm/vc4: Remove incorrect limit from hvs_dlist debugfs function
>   drm/vc4: Move the buffer offset out of the vc4_plane_state
>=20
> Dom Cobley (7):
>   drm/vc4: vc4_plane: Keep fractional source coords inside state
>   drm/vc4: Handle fractional coordinates using the phase field
>   drm/vc4: hdmi: Avoid log spam for audio start failure
>   drm/vc4_plane: Add support for YUV444 formats
>   drm/vc4: hdmi: Increase audio MAI fifo dreq threshold
>   drm/vc4: hdmi: Avoid hang with debug registers when suspended
>   drm/vc4: hvs: Remove ABORT_ON_EMPTY flag
>=20
> Maxime Ripard (15):
>   drm/vc4: hdmi: Warn if writing to an unknown HDMI register
>   drm/vc4: hvs: More logging for dlist generation
>   drm/vc4: hvs: Print error if we fail an allocation
>   drm/vc4: plane: Add more debugging for LBM allocation
>   drm/vc4: plane: Use return variable in atomic_check
>   drm/vc4: crtc: Move assigned_channel to a variable
>   drm/vc4: Introduce generation number enum
>   drm/vc4: Make v3d paths unavailable on any generation newer than vc4
>   drm/vc4: hvs: Use switch statement to simplify
>     vc4_hvs_get_fifo_from_output
>   drm/vc4: hvs: Create hw_init function
>   drm/vc4: hvs: Create cob_init function
>   drm/vc4: hvs: Rename hvs_regs list
>   drm/vc4: plane: Change ptr0_offset to an array
>   drm/vc4: hvs: Rework LBM alignment
>   drm/vc4: hvs: Change prototype of __vc4_hvs_alloc to pass registers
>=20
> Tim Gover (1):
>   drm/vc4: Enable SCALER_CONTROL early in HVS init
>=20
>  drivers/gpu/drm/vc4/tests/vc4_mock.c       |  14 +-
>  drivers/gpu/drm/vc4/vc4_bo.c               |  28 +-
>  drivers/gpu/drm/vc4/vc4_crtc.c             |  35 ++-
>  drivers/gpu/drm/vc4/vc4_drv.c              |  22 +-
>  drivers/gpu/drm/vc4/vc4_drv.h              |  29 +-
>  drivers/gpu/drm/vc4/vc4_gem.c              |  24 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c             |  30 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h        |   5 +-
>  drivers/gpu/drm/vc4/vc4_hvs.c              | 343 +++++++++++++--------
>  drivers/gpu/drm/vc4/vc4_irq.c              |  10 +-
>  drivers/gpu/drm/vc4/vc4_kms.c              |  14 +-
>  drivers/gpu/drm/vc4/vc4_perfmon.c          |  20 +-
>  drivers/gpu/drm/vc4/vc4_plane.c            | 281 +++++++++++------
>  drivers/gpu/drm/vc4/vc4_regs.h             |   1 +
>  drivers/gpu/drm/vc4/vc4_render_cl.c        |   2 +-
>  drivers/gpu/drm/vc4/vc4_v3d.c              |  10 +-
>  drivers/gpu/drm/vc4/vc4_validate.c         |   8 +-
>  drivers/gpu/drm/vc4/vc4_validate_shaders.c |   2 +-
>  18 files changed, 540 insertions(+), 338 deletions(-)
>=20
> --=20
> 2.34.1
>=20

--wvh2qgargax5pyjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnVAAQAKCRDj7w1vZxhR
xcLCAQDy6IkpgwD5SnshPRP5Le2WpQjBbvoSts8j79R7c35hVQEAyH5B8z+zZVQQ
XtykzK7kqJJslVjCLGGXcRPGsQGy3As=
=VFVE
-----END PGP SIGNATURE-----

--wvh2qgargax5pyjd--
