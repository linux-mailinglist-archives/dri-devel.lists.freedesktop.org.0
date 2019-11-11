Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739B0F745A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 13:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C83689623;
	Mon, 11 Nov 2019 12:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFF889623
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 12:54:01 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0644921872;
 Mon, 11 Nov 2019 12:54:00 +0000 (UTC)
Date: Mon, 11 Nov 2019 13:53:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 09/12] drm/modes: parse_cmdline: Add support for
 specifying panel_orientation
Message-ID: <20191111125358.GP4345@gilmour.lan>
References: <20191110154101.26486-1-hdegoede@redhat.com>
 <20191110154101.26486-10-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191110154101.26486-10-hdegoede@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573476841;
 bh=/z3uc3i8OrxLVjdn0+jeufwHssScvpRJ/2fI/Jj05g4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CRo3E99NIpKSR6PKkIwoEBojPFTTm1JAz9novMmJCzBEmrcL8PJ1cXfCeVJZd+TmR
 Xj1vrRhb5DF8QVcXqXZ6JqU8YAiGMpRMWOSw5i0hziRNVZ1wjXuqo+Ab3IhZBLvBgY
 bXeowLjcyVmC2ggP84GjOEQDfarsF+ZqfqIIOnKc=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Mathieu =?iso-8859-1?Q?Alexandre-T=E9treault?= <alexandretm@amotus.ca>
Content-Type: multipart/mixed; boundary="===============0177950240=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0177950240==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H83aLI5Lttn3Hg7B"
Content-Disposition: inline


--H83aLI5Lttn3Hg7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

Thanks for this series (and thanks for bouncing the mails too).

All the previous patches are
Acked-by: Maxime Ripard <mripard@kernel.org>

On Sun, Nov 10, 2019 at 04:40:58PM +0100, Hans de Goede wrote:
> Sometimes we want to override a connector's panel_orientation from the
> kernel commandline. Either for testing and for special cases, e.g. a kiosk
> like setup which uses a TV mounted in portrait mode.
>
> Users can already specify a "rotate" option through a video= kernel cmdline
> option. But that only supports 0/180 degrees (see drm_client_modeset TODO)
> and only works for in kernel modeset clients, not for userspace kms users.
>
> The "panel-orientation" connector property OTOH does support 90/270 degrees
> as it leaves dealing with the rotation up to userspace and this does work
> for userspace kms clients (at least those which support this property).
>
> BugLink: https://gitlab.freedesktop.org/plymouth/plymouth/merge_requests/83
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  Documentation/fb/modedb.rst                   |  3 ++
>  drivers/gpu/drm/drm_modes.c                   | 32 +++++++++++++++++++
>  .../gpu/drm/selftests/drm_cmdline_selftests.h |  1 +
>  .../drm/selftests/test-drm_cmdline_parser.c   | 22 +++++++++++++
>  include/drm/drm_connector.h                   |  8 +++++
>  5 files changed, 66 insertions(+)
>
> diff --git a/Documentation/fb/modedb.rst b/Documentation/fb/modedb.rst
> index 9c4e3fd39e6d..624d08fd2856 100644
> --- a/Documentation/fb/modedb.rst
> +++ b/Documentation/fb/modedb.rst
> @@ -65,6 +65,9 @@ Valid options are::
>    - reflect_y (boolean): Perform an axial symmetry on the Y axis
>    - rotate (integer): Rotate the initial framebuffer by x
>      degrees. Valid values are 0, 90, 180 and 270.
> +  - panel_orientation, one of "normal", "upside_down", "left_side_up", or
> +    "right_side_up". For KMS drivers only, this sets the "panel orientation"
> +    property on the kms connector as hint for kms users.

Even though the semantic is a bit different, I think we should remain
consistent and have the same argument than for rotate (ie, steps in
clockwise rotation in steps of 90 degrees).

The rest looks good

Maxime

--H83aLI5Lttn3Hg7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXclZ5gAKCRDj7w1vZxhR
xdClAQCIsCtZVrQ3IchuZnO8n1EfLhM6HWCESB/amgzAd2x02AD/RqSv/RPS+tem
8K3GGaDFuJ5u/XT/rkunQAUk2qySvgo=
=46OA
-----END PGP SIGNATURE-----

--H83aLI5Lttn3Hg7B--

--===============0177950240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0177950240==--
