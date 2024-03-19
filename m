Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62B787FAE0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB25A10E51E;
	Tue, 19 Mar 2024 09:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E2tRQ9Lk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D4C10E51E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:37:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6B6D8CE0B44;
 Tue, 19 Mar 2024 09:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA2AC433F1;
 Tue, 19 Mar 2024 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710841036;
 bh=0W/x4vb0h954mcRP1/0INgxx4DQyIgWJCxDZhOLayzA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E2tRQ9LkzVecCWS0Shvqs/AmHwfPnbchqjBpH4oxq4BuFOGCWhhU6FGMstamYX7zg
 CiahAGlZie8fmh2WdT7VUNv2Bpr1ojtS4GSdARCnFN5Vd9HSMVIp4WhXVIGZs9QHRN
 CMijxHg6sBkwowO05J7YNe4jJ6j3kPEguPkEgTkgSw+32D4dZQQDHvojRS6ERyjnd9
 pKeTOgbkGgdcZvPCO+2AM5kztohBCy4dUgIuKoOdfqMlWtJfJZBxmh8zdcQ0zarvua
 mYwW3aAyix/5tCG+3pj+krEuI2Uqur/MmAHpWO1oog0R6ktUgXJfQJbNqmY8QwjPnC
 i9liD860rc/3Q==
Date: Tue, 19 Mar 2024 10:37:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, jfalempe@redhat.com, 
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 12/12] drm/ast: Implement polling for VGA and SIL164
 connectors
Message-ID: <20240319-pragmatic-wonderful-ferret-63e7ad@houat>
References: <20240319081430.10165-1-tzimmermann@suse.de>
 <20240319081430.10165-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iephjwsu6ppnokcw"
Content-Disposition: inline
In-Reply-To: <20240319081430.10165-13-tzimmermann@suse.de>
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


--iephjwsu6ppnokcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 19, 2024 at 09:00:32AM +0100, Thomas Zimmermann wrote:
> Implement polling for VGA and SIL164 connectors. Set the flag
> DRM_CONNECTOR_POLL_DISCONNECT for each to detect the removal of the
> monitor cable. Implement struct drm_connector_helper_funcs.detect_ctx
> for each type of connector by testing for EDID data. The code for
> both types of connectors is identical for now. Maybe this can later
> become a common helper function for various drivers.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 36 ++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mod=
e.c
> index 71cc681d6188f..f740b8706a38b 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1344,8 +1344,24 @@ static int ast_crtc_init(struct drm_device *dev)
>   * VGA Connector
>   */
> =20
> +static int ast_vga_connector_helper_detect_ctx(struct drm_connector *con=
nector,
> +					       struct drm_modeset_acquire_ctx *ctx,
> +					       bool force)
> +{
> +	enum drm_connector_status status =3D connector_status_disconnected;
> +	const struct drm_edid *edid;
> +
> +	edid =3D drm_edid_read(connector);
> +	if (edid)
> +		status =3D connector_status_connected;
> +	drm_edid_free(edid);
> +
> +	return status;
> +}
> +

Yeah, I think it would be worth turning it into a helper. We have a
number of drivers using some variation of that already
(display-connector, loongson).

It's probably better to use drm_probe_ddc here too instead of parsing
and updating the EDID property each time we call detect.

Maxime

--iephjwsu6ppnokcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZflcyQAKCRDj7w1vZxhR
xcpJAQDEhJCjxhYF8Y1sh7dghK+deOhKYp4VWGbHpK1fR69JhgEAmY+uF4v1CrkT
RquatU4BFmy5TCkXB71odzx7UZiqogQ=
=tedZ
-----END PGP SIGNATURE-----

--iephjwsu6ppnokcw--
