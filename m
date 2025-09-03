Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4647DB42986
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 21:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF2010E104;
	Wed,  3 Sep 2025 19:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="kjMqKVoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 472 seconds by postgrey-1.36 at gabe;
 Wed, 03 Sep 2025 19:11:48 UTC
Received: from aposti.net (aposti.net [185.119.170.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DAD10E104
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1756926259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wO22lLVpvhTjSt7UiwpTspzXapQo0kN9zAH1RpqwYiw=;
 b=kjMqKVoZfKGH8zmo0VopBZN8pUi0ENNIfc4SPT/IkSohSZvgG3s9kb1Cdi1mrepDmrgox5
 eg9cpzMLcv8IMH/CQXeDf3yVx7rYrSGdeOwhqMEi88l5w+IUjpLPkpq3oAL9NF5KDVAEqC
 TfxdS6tHa8VIHeHdBJki4LROvWvGiiw=
Message-ID: <e81de8edb1ce674adb6773e89ad25e923ce4c09f.camel@crapouillou.net>
Subject: Re: [PATCH v2 19/37] drm/ingenic: Switch to
 drm_atomic_get_new_crtc_state()
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Date: Wed, 03 Sep 2025 21:04:16 +0200
In-Reply-To: <20250902-drm-no-more-existing-state-v2-19-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-19-de98fc5f6d66@kernel.org>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Maxime,

Le mardi 02 septembre 2025 =C3=A0 11:35 +0200, Maxime Ripard a =C3=A9crit=
=C2=A0:
> The ingenic atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
>=20
> This hook is called as part of the global atomic_check, thus before
> the
> states are swapped. The existing state thus points to the new state,
> and
> we can use drm_atomic_get_new_crtc_state() instead.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

and/or:

Tested-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>=20
> ---
> To: Paul Cercueil <paul@crapouillou.net>
> Cc: linux-mips@vger.kernel.org
> ---
> =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +--
> =C2=A0drivers/gpu/drm/ingenic/ingenic-ipu.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A02 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index
> 9db1ceaed5188a4ef0897280dc72108eb3815b5f..05faed933e5619c796f2a4fa190
> 6e0eaa029ac68 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -469,12 +469,11 @@ static int
> ingenic_drm_plane_atomic_check(struct drm_plane *plane,
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	if (priv->soc_info->plane_f0_not_working && plane =3D=3D &priv-
> >f0)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state,
> -							crtc);
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> =C2=A0	if (WARN_ON(!crtc_state))
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	priv_state =3D ingenic_drm_get_priv_state(priv, state);
> =C2=A0	if (IS_ERR(priv_state))
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index
> 2574a4b4d40a2c27cb212114117829d9f6ab3ddb..32638a713241abbd4eaed09f0aa
> ec2b790650cc9 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -578,11 +578,11 @@ static int
> ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
> =C2=A0	struct ingenic_ipu_private_state *ipu_state;
> =C2=A0
> =C2=A0	if (!crtc)
> =C2=A0		return 0;
> =C2=A0
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state,
> crtc);
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> =C2=A0	if (WARN_ON(!crtc_state))
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	ipu_state =3D ingenic_ipu_get_priv_state(ipu, state);
> =C2=A0	if (IS_ERR(ipu_state))
