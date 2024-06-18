Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D35C90C53B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFD110E5E9;
	Tue, 18 Jun 2024 09:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 451 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jun 2024 09:18:45 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D9610E289;
 Tue, 18 Jun 2024 09:18:45 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 9BFAC1C0082; Tue, 18 Jun 2024 11:13:31 +0200 (CEST)
Date: Tue, 18 Jun 2024 11:13:30 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, martin.leung@amd.com, wayne.lin@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH AUTOSEL 5.10 1/7] drm/amd/display: Exit idle
 optimizations before HDCP execution
Message-ID: <ZnFPuimUl2QYzdzR@duo.ucw.cz>
References: <20240527155845.3866271-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="YGoPnplstVZpGpv1"
Content-Disposition: inline
In-Reply-To: <20240527155845.3866271-1-sashal@kernel.org>
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


--YGoPnplstVZpGpv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [WHY]
> PSP can access DCN registers during command submission and we need
> to ensure that DCN is not in PG before doing so.
>=20
> [HOW]
> Add a callback to DM to lock and notify DC for idle optimization exit.
> It can't be DC directly because of a potential race condition with the
> link protection thread and the rest of DM operation.

Why is this picked for 5.10-stable?

It adds an callback, but noone is going to use it in 5.10.

Best regards,
								Pavel

> +++ b/drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h
> @@ -143,6 +143,13 @@ struct mod_hdcp_ddc {
>  	} funcs;
>  };
> =20
> +struct mod_hdcp_dm {
> +	void *handle;
> +	struct {
> +		void (*exit_idle_optimizations)(void *handle);
> +	} funcs;
> +};
> +
>  struct mod_hdcp_psp {
>  	void *handle;
>  	void *funcs;
> @@ -252,6 +259,7 @@ struct mod_hdcp_display_query {
>  struct mod_hdcp_config {
>  	struct mod_hdcp_psp psp;
>  	struct mod_hdcp_ddc ddc;
> +	struct mod_hdcp_dm dm;
>  	uint8_t index;
>  };
> =20

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--YGoPnplstVZpGpv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZnFPugAKCRAw5/Bqldv6
8n/jAJ4vdLX0NDgd9EnqTJMgp289HWx28ACdG5FSE6Odu7KzIHv1ij/9v0enmII=
=5AhM
-----END PGP SIGNATURE-----

--YGoPnplstVZpGpv1--
