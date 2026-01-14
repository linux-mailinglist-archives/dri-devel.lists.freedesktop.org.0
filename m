Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF1FD1DD73
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 11:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375ED10E5E8;
	Wed, 14 Jan 2026 10:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GDEsWcN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEA510E5E8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 10:08:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 174541A285D;
 Wed, 14 Jan 2026 10:08:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DE5BE6074A;
 Wed, 14 Jan 2026 10:08:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AFEF7103C8951; Wed, 14 Jan 2026 11:08:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768385308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Z9hmPzenFNHaMEP2WOiENDOqLl4/pBzRMvq4zXQDd30=;
 b=GDEsWcN0OQmo0Xuf/4owyxd3IfW887wWvn+avOzD4aebrRZvNrcrd+7b+JuvSYf/BJ2o6y
 XIRcpeASb8PCAFWvW13V53ww6G0cRESJL1ONydT3pTPnkqlGmG5Vnk8GkyMM+nZD6hJq+G
 YjHdiw7GlND0SzDh6MFC1+1avZpJPzvWtDApAQci2AKko5jsCmwxcvh3wjpNaYEu74iBq0
 e/rxHVQAoVuKHA+lxL3W0mS/U/v0ZIIKQ7sD5vFM9QBgIEtrC/pSFi985sfqLAIyyx5l8m
 Wm0d2FaBgc1R1hO/tZQw8f/pw8h2Lfk2Q5VSnRmMfl84dJz8EzN8LCd2Kjz+8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 11:08:20 +0100
Message-Id: <DFO89S1NDME1.1644YSMOMAAJ6@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: Add ->detect_ctx hook and
 drm_bridge_detect_ctx()
Cc: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Maud Spierings" <maud_spierings@hotmail.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>
X-Mailer: aerc 0.20.1
References: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
 <20260113-dw-hdmi-qp-scramb-v2-1-ae7b2c58d24d@collabora.com>
In-Reply-To: <20260113-dw-hdmi-qp-scramb-v2-1-ae7b2c58d24d@collabora.com>
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

Hello Cristian,

On Mon Jan 12, 2026 at 11:26 PM CET, Cristian Ciocaltea wrote:
> Add an atomic variant of the ->detect callback and a new helper to call
> the hook while passing an optional drm_modeset_acquire_ctx reference.
>
> When both ->detect_ctx and ->detect are defined, the latter is ignored.
> If acquire_ctx is unset, the function takes care of the locking,
> while also handling EDEADLK.
>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 58 ++++++++++++++++++++++++++++++++++++++=
++++++
>  include/drm/drm_bridge.h     | 30 +++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 6dcf8f6d3ecf..0ef12bf98011 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1344,6 +1344,64 @@ drm_bridge_detect(struct drm_bridge *bridge, struc=
t drm_connector *connector)
>  }
>  EXPORT_SYMBOL_GPL(drm_bridge_detect);
>
> +/**
> + * drm_bridge_detect_ctx - check if anything is attached to the bridge o=
utput
> + * @bridge: bridge control structure
> + * @connector: attached connector
> + * @ctx: acquire_ctx, or NULL to let this function handle locking
> + *
> + * If the bridge supports output detection, as reported by the
> + * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect_c=
tx
> + * or &drm_bridge_funcs.detect for the bridge and return the connection =
status.
> + * Otherwise return connector_status_unknown.
> + *
> + * When both @ctx and &drm_bridge_funcs.detect_ctx are not set, this hel=
per
> + * function is equivalent to drm_bridge_detect() above.
> + *
> + * RETURNS:
> + * The detection status on success, or connector_status_unknown if the b=
ridge
> + * doesn't support output detection.
> + * If @ctx is set, it might also return -EDEADLK.
> + */
> +int drm_bridge_detect_ctx(struct drm_bridge *bridge,
> +			  struct drm_connector *connector,
> +			  struct drm_modeset_acquire_ctx *ctx)

Shouldn't this new function return the same type as detect, i.e. enum
drm_connector_status?

Otherwise (see below)...

> +{
> +	if (!(bridge->ops & DRM_BRIDGE_OP_DETECT))
> +		return connector_status_unknown;
> +
> +	if (bridge->funcs->detect_ctx) {
> +		struct drm_modeset_acquire_ctx br_ctx;
> +		int ret;
> +
> +		if (ctx)
> +			return bridge->funcs->detect_ctx(bridge, connector, ctx);
> +
> +		drm_modeset_acquire_init(&br_ctx, 0);
> +retry:
> +		ret =3D drm_modeset_lock(&connector->dev->mode_config.connection_mutex=
,
> +				       &br_ctx);
> +		if (!ret)
> +			ret =3D bridge->funcs->detect_ctx(bridge, connector, &br_ctx);
> +
> +		if (ret =3D=3D -EDEADLK) {
> +			drm_modeset_backoff(&br_ctx);
> +			goto retry;
> +		}
> +
> +		if (ret < 0)
> +			ret =3D connector_status_unknown;
> +
> +		drm_modeset_drop_locks(&br_ctx);
> +		drm_modeset_acquire_fini(&br_ctx);
> +
> +		return ret;
> +	}
> +
> +	return bridge->funcs->detect(bridge, connector);

...here you're converting an enum into an int, which is ok-isk but not
ideal.

> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -664,6 +664,33 @@ struct drm_bridge_funcs {
>  	enum drm_connector_status (*detect)(struct drm_bridge *bridge,
>  					    struct drm_connector *connector);
>
> +	/**
> +	 * @detect_ctx:
> +	 *
> +	 * Check if anything is attached to the bridge output.
> +	 *
> +	 * This callback is optional, if not implemented the bridge will be
> +	 * considered as always having a component attached to its output.
> +	 * Bridges that implement this callback shall set the
> +	 * DRM_BRIDGE_OP_DETECT flag in their &drm_bridge->ops.
> +	 *
> +	 * This is the atomic version of &drm_bridge_funcs.detect.

I may be missing something, but I'm a bit puzzled by the "atomic" word
here. For other funcs in this struct there's the old non-atomic func X and
the new atomic_X func that receives a pointer to struct drm_atomic_state.

Here I think you are using "atomic" with a more generic meaning. Maybe we'd
better use another wording to not confuse readers?

> +	 *
> +	 * To avoid races against concurrent connector state updates, the
> +	 * helper libraries always call this with ctx set to a valid context,
> +	 * and &drm_mode_config.connection_mutex will always be locked with
> +	 * the ctx parameter set to this ctx. This allows taking additional
> +	 * locks as required.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * &drm_connector_status indicating the bridge output status,
> +	 * or the error code returned by drm_modeset_lock(), -EDEADLK.
> +	 */
> +	int (*detect_ctx)(struct drm_bridge *bridge,
> +			  struct drm_connector *connector,
> +			  struct drm_modeset_acquire_ctx *ctx);

As above, shouldn't this new func return the same type as detect?

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
