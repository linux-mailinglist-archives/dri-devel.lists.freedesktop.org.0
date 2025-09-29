Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E476BA93B5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 14:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBEF10E405;
	Mon, 29 Sep 2025 12:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aZ0nlt/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C2010E405
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 12:46:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F264624B9;
 Mon, 29 Sep 2025 12:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2019C4CEF4;
 Mon, 29 Sep 2025 12:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759149981;
 bh=F26gpiEeM1z6DaTvZ8H/lzXDYiyq+ETRgVcGNonv7wM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aZ0nlt/WC1EGQ50HOXSSk0k+yQq+3R2ZKCwKVB9jlxy1vJ+0HUhA31V5kKZyPlBCz
 im6DqdgfegkQ442gW5ZFu9EipPSbnCgpCxLVMFt4LpkhfJxJHyi4RkT9oXg/8EvZVv
 b0rP3IgZMafuBIPEPhcpq/Z+LZuspgVrVa1M11ZSCDyM2C6ZQD9Vshn4vqX1d6jDNc
 NJ79/Jndqz+KfUNq1q0ue9fxfr6x8uY4lB2TylN1HrKSdT9lSf+9yTytMzk9N+4tFz
 K13QD4FGspwrxMWu/aJm70q72WRRidnnB3dTrqm0hINHvExgD8KizoaJ2QE1B+LHjT
 cSapvdo2GNRJQ==
Date: Mon, 29 Sep 2025 14:46:18 +0200
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
Subject: Re: [PATCH 3/7] drm/bridge: lock the encoder bridge chain mutex
 during insertion
Message-ID: <20250929-enigmatic-delicate-mussel-f36b89@houat>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
 <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-3-23b62c47356a@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ffnt4grig7iuxmc4"
Content-Disposition: inline
In-Reply-To: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-3-23b62c47356a@bootlin.com>
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


--ffnt4grig7iuxmc4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/7] drm/bridge: lock the encoder bridge chain mutex
 during insertion
MIME-Version: 1.0

On Fri, Sep 26, 2025 at 05:59:44PM +0200, Luca Ceresoli wrote:
> drm_bridge_attach() modifies the encoder bridge chain, so take a mutex
> around such operations to allow users of the chain to protect themselves
> from chain modifications while iterating.
>=20
> This change does not apply to drm_bridge_detach() because:
>  * only the drm_encoder.c calls it, not bridge drivers (unlike
>    drm_bridge_attach())
>  * the only drm_bridge_detach() caller is drm_encoder_cleanup() which
>    already locks the mutex for the entire cleanup loop, thus additionally
>    locking it here would deadlock
>  * drm_bridge_detach() is recursively calling itself along the chain, so
>    care would be needed to avoid deadlocks
> Add a comment to clarify that is intended.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 630b5e6594e0affad9ba48791207c7b403da5db8..90e467cf91a134342c80d2f95=
8b928472aaf0d8b 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -453,10 +453,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, =
struct drm_bridge *bridge,
>  	bridge->dev =3D encoder->dev;
>  	bridge->encoder =3D encoder;
> =20
> +	drm_encoder_chain_lock(encoder);
>  	if (previous)
>  		list_add(&bridge->chain_node, &previous->chain_node);
>  	else
>  		list_add(&bridge->chain_node, &encoder->bridge_chain);
> +	drm_encoder_chain_unlock(encoder);
> =20
>  	if (bridge->funcs->attach) {
>  		ret =3D bridge->funcs->attach(bridge, encoder, flags);
> @@ -487,7 +489,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, st=
ruct drm_bridge *bridge,
>  err_reset_bridge:
>  	bridge->dev =3D NULL;
>  	bridge->encoder =3D NULL;
> +	drm_encoder_chain_lock(encoder);
>  	list_del(&bridge->chain_node);
> +	drm_encoder_chain_unlock(encoder);
> =20
>  	if (ret !=3D -EPROBE_DEFER)
>  		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> @@ -503,6 +507,11 @@ int drm_bridge_attach(struct drm_encoder *encoder, s=
truct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL(drm_bridge_attach);
> =20
> +/*
> + * Invoked by the encoder during encoder cleanup in drm_encoder_cleanup(=
),
> + * so should generally *not* be called by driver code.

Why not? Also, it looks entirely unrelated to the rest of the patch.

> As opposed to + * drm_bridge_attach(), does not lock the encoder chain mu=
tex. + */ void
> drm_bridge_detach(struct drm_bridge *bridge) { if (WARN_ON(!bridge))

Maxime

--ffnt4grig7iuxmc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNp/mgAKCRAnX84Zoj2+
doqOAX9Zy9Z7IPOipQKQV+gyfRFRn2CCq2vxUWDhJrXcgCK+p9lqv4e3JH3EtJpa
sFfzlDkBfj6ugTuah9OIS670G0m39UoodcBG9xBmgKreXb4qiv4kjkcIvYx69tIj
EY2dXXxCug==
=SJVk
-----END PGP SIGNATURE-----

--ffnt4grig7iuxmc4--
