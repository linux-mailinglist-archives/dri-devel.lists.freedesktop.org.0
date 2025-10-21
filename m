Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A10BF5346
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BC610E595;
	Tue, 21 Oct 2025 08:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ba/euyJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122F710E591
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:17:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EF06B4E41233;
 Tue, 21 Oct 2025 08:17:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C372560680;
 Tue, 21 Oct 2025 08:17:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE45F102F23E8; 
 Tue, 21 Oct 2025 10:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761034637; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xHAShxnhnZCwEdWrOYZ+7ePUS4h11/+ez0cLNZHpkMY=;
 b=Ba/euyJzAopBOFlMPI2NxnI9yId0ifeCDG3MIFlQRU8f/BOUMymScfexdlhlItgzCrxXaG
 iksC98PjLJcBbYSHlk/4tlOGwNQ9HlbesyU/MxKL3JAC6/6lrfOwvWwK0tWU4qOc10HOkT
 SIclcA8gNzIB5w6h7j7KeU4rQdk5SCzwZOExEXJTuHgTTlEJtgk1YmB++F0Crrqe/eAWzY
 sv+KSH6/Z5C2Mv0BB+lgl96bbuJu4BMOOR1eIVNl9FIiPZYxrH3pmnDOnsAttS03R5UwGr
 NZRjPXOR6gI7n+9W8IEXu0SiGd52li32MCqiVFVefl7wObFxN8VlbftV3P2mwA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 10:17:13 +0200
Message-Id: <DDNUOE1ZNUKS.GD10B3113L1T@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
Cc: <dri-devel@lists.freedesktop.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/16] drm/bridge: Switch private_obj initialization
 to atomic_create_state
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-5-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-5-6dd60e985e9d@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Maxime,

On Tue Oct 14, 2025 at 11:31 AM CEST, Maxime Ripard wrote:
> The bridge implementation relies on a drm_private_obj, that is
> initialized by allocating and initializing a state, and then passing it
> to drm_private_obj_init.
>
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 630b5e6594e0affad9ba48791207c7b403da5db8..f0db891863428ee65625a6a3e=
d38f63ec802595e 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -394,11 +394,27 @@ drm_bridge_atomic_destroy_priv_state(struct drm_pri=
vate_obj *obj,
>  	struct drm_bridge *bridge =3D drm_priv_to_bridge(obj);
>
>  	bridge->funcs->atomic_destroy_state(bridge, state);
>  }
>
> +static struct drm_private_state *
> +drm_bridge_atomic_create_priv_state(struct drm_private_obj *obj)
> +{
> +	struct drm_bridge *bridge =3D drm_priv_to_bridge(obj);
> +	struct drm_bridge_state *state;
> +
> +	state =3D bridge->funcs->atomic_reset(bridge);
> +	if (IS_ERR(state))
> +		return ERR_PTR(-ENOMEM);

This is slightly changing the behaviour, assuming that every error is
-ENOMEM, while in the current implementation any error code is just
propagated. I searched all .atomic_reset callbacks and apparently none can
return any other error, so this would not introduce a bug with current
drivers. However the atomic_reset docs say any ERR_PTR can be returned,
thus a future driver would be allowed to return another error value, even
thoug it's unlikely. The drm_bridge.c core having no control over what
other drivers do, I wonder whether we should just return ERR_PTR(state)
here, and keep the check on the drm_atomic_private_obj_init() return value
below.

I have no strong position about which direction is best however. Maybe
changing the docs to say "Return: only -ENOMEM", and add here a
WARN_ON(IS_ERR(state) && ERR_PTR(state) !=3D -ENOMEM)?

> @@ -462,30 +478,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, =
struct drm_bridge *bridge,
>  		ret =3D bridge->funcs->attach(bridge, encoder, flags);
>  		if (ret < 0)
>  			goto err_reset_bridge;
>  	}
>
> -	if (drm_bridge_is_atomic(bridge)) {
> -		struct drm_bridge_state *state;
> -
> -		state =3D bridge->funcs->atomic_reset(bridge);
> -		if (IS_ERR(state)) {
> -			ret =3D PTR_ERR(state);
> -			goto err_detach_bridge;
> -		}
> -
> +	if (drm_bridge_is_atomic(bridge))
>  		drm_atomic_private_obj_init(bridge->dev, &bridge->base,
> -					    &state->base,
> +					    NULL,
>  					    &drm_bridge_priv_state_funcs);
> -	}
>
>  	return 0;
>
> -err_detach_bridge:
> -	if (bridge->funcs->detach)
> -		bridge->funcs->detach(bridge);
> -
>  err_reset_bridge:
>  	bridge->dev =3D NULL;
>  	bridge->encoder =3D NULL;
>  	list_del(&bridge->chain_node);
>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
