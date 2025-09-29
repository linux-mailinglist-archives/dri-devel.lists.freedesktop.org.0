Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A695BA93A3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 14:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4BB10E404;
	Mon, 29 Sep 2025 12:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YK2PpFs1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F57F10E404
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 12:45:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F3AA624B8;
 Mon, 29 Sep 2025 12:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F33AC4CEF4;
 Mon, 29 Sep 2025 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759149912;
 bh=k3QhcLVs/meU1SH3Oti3quubhCNvIZota6kbfHk+xWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YK2PpFs1BhbExmZ9GbO6T7mTKVoKj585xyyeHgnhfe4OeHPjAW0A1878siukIJ18b
 DR8LmtaLUsWZDdgwgkYqJ77C/hYH/UhuWR8dY+Bt2BFcETpsEBydZ2r9V0cB97Uor9
 nYuFids9vMqCyJLsLYHqJ3/Kjnwlc3Kw4lsTsnoCFjhRK8C5OvoQeKFMblfvq6RU6N
 PMNZZYVl8m03kZS/chrXg29a80AKsBFFS+nG7d8F3KtNHlFVsRPG2U0psF/PI5yihE
 6YGazdpgdf2qhLwKUYgJzAn5uboIeZrUycOsR1paqpIRWyt9vVHpiPkrtDAlTty6yB
 +ZZY+Gk0PTPZA==
Date: Mon, 29 Sep 2025 14:45:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/encoder: drm_encoder_cleanup: take chain mutex
 while tearing down
Message-ID: <20250929-flat-koel-from-nibiru-665d49@houat>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
 <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-2-23b62c47356a@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="box6upnjulpje4g5"
Content-Disposition: inline
In-Reply-To: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-2-23b62c47356a@bootlin.com>
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


--box6upnjulpje4g5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/7] drm/encoder: drm_encoder_cleanup: take chain mutex
 while tearing down
MIME-Version: 1.0

On Fri, Sep 26, 2025 at 05:59:43PM +0200, Luca Ceresoli wrote:
> drm_encoder_cleanup() modifies the encoder chain by removing bridges via
> drm_bridge_detach(). Protect this whole operation by taking the mutex, so
> any users iterating over the chain will not access it during the change.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_encoder.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 3261f142baea30c516499d23dbf8d0acf5952cd6..3a04bedf9b759acd6826864b7=
f2cc9b861a8f170 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -195,9 +195,11 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  	 * the indices on the drm_encoder after us in the encoder_list.
>  	 */
> =20
> +	mutex_lock(&encoder->bridge_chain_mutex);
>  	list_for_each_entry_safe(bridge, next, &encoder->bridge_chain,
>  				 chain_node)
>  		drm_bridge_detach(bridge);
> +	mutex_unlock(&encoder->bridge_chain_mutex);

You were claiming that the mutex was to prevent issues with concurrent
iteration and removal of the list members. list_for_each_entry_safe() is
explicitly made to protect against that. Why do we need both?

Maxime

--box6upnjulpje4g5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNp/VQAKCRAnX84Zoj2+
dsSMAX93Bhpb2AuyZzFQQEKJRaSJBKVjFAWIqeHtMlRxy0TJ1j5FlZdjAiS/3A2b
O3y1iSEBf1Fe6M0LaFxakjQ8ekWZB99hcggiZ0i7VTKiVbwRTh0g4ct5T7Ou3jMv
WDvvXFtKBQ==
=vzQl
-----END PGP SIGNATURE-----

--box6upnjulpje4g5--
