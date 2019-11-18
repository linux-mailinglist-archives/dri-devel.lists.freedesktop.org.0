Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475CB100596
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A0E6E4CB;
	Mon, 18 Nov 2019 12:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA3D6E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:28:19 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70518206F4;
 Mon, 18 Nov 2019 12:28:18 +0000 (UTC)
Date: Mon, 18 Nov 2019 13:28:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 11/13] drm/modes: parse_cmdline: Explicitly memset the
 passed in drm_cmdline_mode struct
Message-ID: <20191118122816.GJ4345@gilmour.lan>
References: <20191113164434.254159-1-hdegoede@redhat.com>
 <20191113164434.254159-11-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191113164434.254159-11-hdegoede@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574080099;
 bh=B2EwkHJ5SHOJslHZ0kImDyTyRRzcBM5KXWz4oQ9Ywuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jNpID0o2VlWwYNfO06+SjoYkPYTNElr3adZ3/k03XBxDQBGK68KKf91v6dism7uTM
 ZpzvRLfSgwWs1l3kkCDb8HlaunGHlKCx5G4sNcbUHpBiXcZYA+j4uGp3IreoE0igfs
 fkPXhgBdoMghNilMzM+PjAjAzBXMCfNhuykLaYXo=
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
Cc: David Airlie <airlied@linux.ie>, Derek Basehore <dbasehore@chromium.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mathieu =?iso-8859-1?Q?Alexandre-T=E9treault?= <alexandretm@amotus.ca>
Content-Type: multipart/mixed; boundary="===============0874578291=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0874578291==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RT1WHSDfP05x0NoW"
Content-Disposition: inline


--RT1WHSDfP05x0NoW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2019 at 05:44:32PM +0100, Hans de Goede wrote:
> Instead of only setting mode->specified on false on an early exit and
> leaving e.g. mode->bpp_specified and mode->refresh_specified as is,
> lets be consistent and just zero out the entire passed in struct at
> the top of drm_mode_parse_command_line_for_connector()
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_modes.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index beb764efe6b3..1fee4a71eff7 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1745,12 +1745,11 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>  	char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
>  	int i, len, ret;
>
> +	memset(mode, 0, sizeof(*mode));
>  	mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;

The reported error by kbuild rings a bell. I think I tried to do this,
saw that error, and then forgot about it.

Looking more at the code now, I don't see any in bochs that looks
really wrong. Either way, we should either fix bochs, or add a
unit-test to have a test for the bochs case so that we don't have that
issue sneaking around.

(btw, thanks for adding more tests, that's really appreciated)

Maxime

--RT1WHSDfP05x0NoW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXdKOYAAKCRDj7w1vZxhR
xbfZAQCmhQZ9tSBvsZuLgEZtH24G+X5lOiVnUtvnruECJnmqxQD/UHMKxqLmlbWH
ZLFVE2E4GilRRXG/0SWUuSmA/uKcbAI=
=oGAX
-----END PGP SIGNATURE-----

--RT1WHSDfP05x0NoW--

--===============0874578291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0874578291==--
