Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4341BA9394
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 14:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BD710E3FB;
	Mon, 29 Sep 2025 12:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CgZCb7r4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43B710E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 12:43:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E156B624B4;
 Mon, 29 Sep 2025 12:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179D7C4CEF7;
 Mon, 29 Sep 2025 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759149829;
 bh=OByPmXQzD0LeP2ti24sGIGTnC3htai1WmqAebwHFqPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CgZCb7r4weFhoZ8UWeGpePJzQUmgGG5gn5OuJiAxQ7WPTjfJ+Y6YSf9o9nHtV7emm
 bhA7JG2bMGFLbK8mNKmIHSp4iN/zMf5v8IIb0tSfpjBQno7ZU0tkQ43HHaZcaunzVk
 +OyirlLH1hRPlOesN/MRd6eZLEeWE4du8o7zyBDq599mKgPkl3Ey5nFZ9JYgdBU3MC
 q3Li9JqFhkWKH86mPCPoqeRaxt7fvJjSU6fpndcSlJagirfy8bUG3DrKrssxV9ybbs
 WHZFoKx+f+FfP4rNKEyAHvCEAQz59I2B6LploynrMcDyZg3H4pqbW7EfXCBguUS5jC
 MT3wnhOUX9etA==
Date: Mon, 29 Sep 2025 14:43:46 +0200
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
Subject: Re: [PATCH 1/7] drm/encoder: add mutex to protect the bridge chain
Message-ID: <20250929-strange-earthworm-of-research-d2bbab@houat>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
 <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-1-23b62c47356a@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dl3nanasmtdtyy56"
Content-Disposition: inline
In-Reply-To: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-1-23b62c47356a@bootlin.com>
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


--dl3nanasmtdtyy56
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/7] drm/encoder: add mutex to protect the bridge chain
MIME-Version: 1.0

On Fri, Sep 26, 2025 at 05:59:42PM +0200, Luca Ceresoli wrote:
> The per-encoder bridge chain is currently assumed to be static once it is
> fully initialized. Work is in progress to add hot-pluggable bridges,
> breaking that assumption.
>=20
> With bridge removal, the encoder chain can change without notice, removing
> tail bridges. This can be problematic while iterating over the chain.
>=20
> Add a mutex to be taken whenever looping or changing the encoder chain.
>=20
> Also add two APIs to lock/unlock the mutex without the need to manipulate
> internal struct drm_encoder fields.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_encoder.c |  2 ++
>  include/drm/drm_encoder.h     | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 8f2bc6a28482229fd0b030a1958f87753ad7885f..3261f142baea30c516499d23d=
bf8d0acf5952cd6 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -129,6 +129,7 @@ static int __drm_encoder_init(struct drm_device *dev,
>  	}
> =20
>  	INIT_LIST_HEAD(&encoder->bridge_chain);
> +	mutex_init(&encoder->bridge_chain_mutex);
>  	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
>  	encoder->index =3D dev->mode_config.num_encoder++;
> =20
> @@ -202,6 +203,7 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  	kfree(encoder->name);
>  	list_del(&encoder->head);
>  	dev->mode_config.num_encoder--;
> +	mutex_destroy(&encoder->bridge_chain_mutex);
> =20
>  	memset(encoder, 0, sizeof(*encoder));
>  }
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 977a9381c8ba943b4d3e021635ea14856df8a17d..6c962de640a345bfbb18308c8=
3076628547c9ab9 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -25,6 +25,7 @@
> =20
>  #include <linux/list.h>
>  #include <linux/ctype.h>
> +#include <linux/mutex.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_mode_object.h>
> @@ -189,6 +190,9 @@ struct drm_encoder {
>  	 */
>  	struct list_head bridge_chain;
> =20
> +	/** @bridge_chain_mutex: protect bridge_chain from changes while iterat=
ing */
> +	struct mutex bridge_chain_mutex;
> +
>  	const struct drm_encoder_funcs *funcs;
>  	const struct drm_encoder_helper_funcs *helper_private;
> =20
> @@ -319,6 +323,20 @@ static inline struct drm_encoder *drm_encoder_find(s=
truct drm_device *dev,
>  	return mo ? obj_to_encoder(mo) : NULL;
>  }
> =20
> +static inline struct drm_encoder *drm_encoder_chain_lock(struct drm_enco=
der *encoder)
> +{
> +	if (!WARN_ON_ONCE(!encoder))
> +		mutex_lock(&encoder->bridge_chain_mutex);
> +
> +	return encoder;
> +}
> +
> +static inline void drm_encoder_chain_unlock(struct drm_encoder *encoder)
> +{
> +	if (!WARN_ON_ONCE(!encoder))
> +		mutex_unlock(&encoder->bridge_chain_mutex);
> +}
> +

Please provide documentation for these two functions. In particular, why
do we need to return the encoder pointer?

Maxime

--dl3nanasmtdtyy56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNp+/gAKCRAnX84Zoj2+
dq38AYDSHPeBKzt3WhONmxK6FmCu+kgD3lbjcubzlTJ78hl5LAlt6G84/5AyCuLD
yN+DnHcBf17chAbrHQRErVntDZ4s6I9c/BMCyCcTmoc0ljRTvU+wL6mMrjOeGA9M
VUKK7bUdVA==
=7Q/v
-----END PGP SIGNATURE-----

--dl3nanasmtdtyy56--
