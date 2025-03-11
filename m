Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61081A5B9D0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 08:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E7A10E051;
	Tue, 11 Mar 2025 07:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hm9JOtjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6F610E051
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 07:31:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 550FAA46871;
 Tue, 11 Mar 2025 07:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF120C4CEE9;
 Tue, 11 Mar 2025 07:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741678259;
 bh=6ptZt8W9PzGYxBsoNW9hgth6W4PsnPj1HOAvttTz8uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hm9JOtjcqc1SNJz4wc5g8742zi6JTP1ZsA53aqShmsFgc/9mO5aPMDhxqpEI9ZYN4
 7/W5iMWLwSEbqzmC0fjowOo2zu3JC3mlslxTCFRflQV3VV1X+QAtcaegD9kftiZaSL
 fM4atI9YqgbPAkiLOm7kVAp+Ax/JnsZaB+fYNVw6vL7koJkEzFB8yRLm+fVXNROOdD
 j9b2VFGqt3C7xVjj07QRIXrSZN/WdH7rkJbige+2IldRf5KwxkE7GhjjHx4XSsKa9N
 mOypXMkv90n66EbgpXGMj2txElg1PnkxDQSaJqyjC76Y78PUWSbvGfAJdOP+r7A5UY
 e/YV7JXHBdxrQ==
Date: Tue, 11 Mar 2025 08:30:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
Message-ID: <20250311-warm-icy-rottweiler-cefcdd@houat>
References: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3msoj54ufxrpizvm"
Content-Disposition: inline
In-Reply-To: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
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


--3msoj54ufxrpizvm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
MIME-Version: 1.0

On Mon, Mar 10, 2025 at 04:58:22PM -0400, Anusha Srivatsa wrote:
> Move away from using deprecated API and use _multi
> variants if available. Use mipi_dsi_msleep()
> and mipi_dsi_usleep_range() instead of msleep()
> and usleep_range() respectively.
>=20
> Used Coccinelle to find the multiple occurences.
> SmPl patch:
> @rule@
> identifier dsi_var;
> identifier r;
> identifier func;
> type t;
> position p;
> expression dsi_device;
> expression list es;
> @@
> t func(...) {
> ...
> struct mipi_dsi_device *dsi_var =3D dsi_device;
> +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> <+...
> (
> -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
> +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> |
> -mipi_dsi_generic_write_seq(dsi_var,es)@p;
> +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
> |
> -mipi_dsi_generic_write(dsi_var,es)@p;
> +mipi_dsi_generic_write_multi(&dsi_ctx,es);
> |
> -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> |
> ....rest of API
> ..
> )
> -if(r < 0) {
> -...
> -}
> ...+>

Again, you need to provide the full coccinelle script here otherwise
it's useless. And I have serious doubts that it's actually the script
you used, because ...

> @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct r63353_pan=
el *rpanel)
>  static int r63353_panel_activate(struct r63353_panel *rpanel)
>  {
>  	struct mipi_dsi_device *dsi =3D rpanel->dsi;
> -	struct device *dev =3D &dsi->dev;
> -	int i, ret;
> +	struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +	int i;
> =20
> -	ret =3D mipi_dsi_dcs_soft_reset(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
> +	mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
> +	if (dsi_ctx.accum_err)
>  		goto fail;
> -	}

This changes was definitely not what the script is doing.

Maxime

--3msoj54ufxrpizvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ8/mrwAKCRDj7w1vZxhR
xaVXAP98kanq9Agy3UxY4yV8gi6eRHDpADPZ362A29nVqTaqDQD/bSjaKpH9TL2w
y3HcrZBloZtnBL7lnxKDIKDEJT3cjws=
=aG2R
-----END PGP SIGNATURE-----

--3msoj54ufxrpizvm--
