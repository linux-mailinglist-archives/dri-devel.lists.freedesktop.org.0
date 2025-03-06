Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F3CA5465F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD99710E92A;
	Thu,  6 Mar 2025 09:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EXW+x91I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E486C10E92C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 09:31:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BC4F5C02E7;
 Thu,  6 Mar 2025 09:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42121C4CEE0;
 Thu,  6 Mar 2025 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741253492;
 bh=RhcDDbYqlRBXEgeviCGhkae++jF6e3/y3yy+fAu92Aw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EXW+x91IoVRFninODxYne2YbBmlqlsTHW3sGFyByZGaCeASs0ct6s8pk8I4s3wqsu
 9XJZ3coGodUHS6w1BXRkc/cU8cMpQwaOLOZDFcGvWs79taEpdNQb8A/vq4ELQgDnKp
 Fvs8BI8oRBb3uM40xJrFHgdpHeUACjhB04IjFi/wyGLafe1KXihv9/ISQQVsb+EdA+
 xEFnEtvHCzTKj1EAQjwf5flOWbeSshoNuqTBdOWdxADodqALwP0QcBHp3P9HUChw/p
 GauPOZUiD38NSzsYSJyFfUdvLjXP+D9iNCZ7TplkcWaE8NgX3xcBcUue/90OhfRzw9
 ILtIzMRpQdwpg==
Date: Thu, 6 Mar 2025 10:31:29 +0100
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
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
Message-ID: <20250306-clever-lime-tanuki-e2fc43@houat>
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="iwh2orhppfbbgi4c"
Content-Disposition: inline
In-Reply-To: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
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


--iwh2orhppfbbgi4c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
MIME-Version: 1.0

Hi Anusha,

On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:
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

The point of sending a single patch was to review the coccinelle script,
so you must put the entire script you used here.

> Cc: Maxime Ripard <maxime.ripard@bootlin.com>

That hasn't been my email address for 6 years :)

Maxime

--iwh2orhppfbbgi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8lrbAAKCRAnX84Zoj2+
dpoXAYCV7yoFxitIbgh6uFkLyZ4VLQvsKHGErE0qO7lLyAP6UpBiI05K1CHnneTr
hK5luskBgIRKzxdKeBfGYM99W/seenjHAXgFqBIfp/tOG+FtKuJ2lhIQbycDFiVd
H3tx2dKHIg==
=Ufys
-----END PGP SIGNATURE-----

--iwh2orhppfbbgi4c--
