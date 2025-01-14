Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A6EA10723
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 13:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BD610E288;
	Tue, 14 Jan 2025 12:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YKk6ueqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CAE10E288
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 12:55:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 150491BF206;
 Tue, 14 Jan 2025 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736859302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GetRem5oPol4EWNwAaMciHaBSzuYs3v6WipDaRzEtS4=;
 b=YKk6ueqCjvimBAE8Su47qnAChzki9AcjKkB75GVX/G6qZ2cxAkaBovqgWZKQx35iScUS5D
 vk1FaLHJhijV6w0r45WASGJGgOXumlK5Scz//Ua8e/moO54Tih+0cPTGXWg3Bie6bCLKpy
 /ymGtgtxIpcu78HIjMpWTjMzDtUasr4Inqmgx1iOE2cP30+qOU+9E7jtl0G857MG3EW+WO
 9KhHeZZSmgooXee3HyoWK3T/cCW1Y4JmXsdiCl5Z/lmzP3esV4FqOW8UIysmvLKLgolrAF
 7dR5H4cGnugiNKwKEdwcAaJCSHxycpckcpE2YcCM0hJEvAqyexqU7LapJzuPgw==
Date: Tue, 14 Jan 2025 13:54:56 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut
 <marex@denx.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Louis Chauvet
 <louis.chauvet@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 3/3] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20250114135456.5366eb2a@bootlin.com>
In-Reply-To: <20250114-juicy-authentic-mushroom-cfcdfb@houat>
References: <20250108101907.410456-1-herve.codina@bootlin.com>
 <20250108101907.410456-4-herve.codina@bootlin.com>
 <20250114-juicy-authentic-mushroom-cfcdfb@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

On Tue, 14 Jan 2025 08:40:51 +0100
Maxime Ripard <mripard@kernel.org> wrote:

...

> >  
> > +static int sn65dsi83_reset_pipe(struct sn65dsi83 *sn65dsi83)
> > +{
> > +	struct drm_atomic_state *state = ERR_PTR(-EINVAL);
> > +	struct drm_device *dev = sn65dsi83->bridge.dev;
> > +	struct drm_connector_state *connector_state;
> > +	struct drm_modeset_acquire_ctx ctx;
> > +	struct drm_connector *connector;
> > +	int err;
> > +
> > +	/*
> > +	 * Reset active outputs of the related CRTC.
> > +	 *
> > +	 * This way, drm core will reconfigure each components in the CRTC
> > +	 * outputs path. In our case, this will force the previous component to
> > +	 * go back in LP11 mode and so allow the reconfiguration of SN64DSI83
> > +	 * bridge.
> > +	 *
> > +	 * Keep the lock during the whole operation to be atomic.
> > +	 */
> > +
> > +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
> > +
> > +	state = drm_atomic_helper_duplicate_state(dev, &ctx);
> > +	if (IS_ERR(state)) {
> > +		err = PTR_ERR(state);
> > +		goto unlock;
> > +	}  
> 
> No, you must not allocate a new state for this, you need to reuse the
> existing state. You'll find it in bridge->base.state->state.

Thanks for pointing that. I didn't know about bridge->base.state->state.

I will use that if using the state is still relevant (see next comment).

> 
> > +	state->acquire_ctx = &ctx;
> > +
> > +	connector = drm_atomic_get_old_connector_for_encoder(state,
> > +							     sn65dsi83->bridge.encoder);
> > +	if (!connector) {
> > +		err = -EINVAL;
> > +		goto unlock;
> > +	}
> > +
> > +	connector_state = drm_atomic_get_connector_state(state, connector);
> > +	if (IS_ERR(connector_state)) {
> > +		err = PTR_ERR(connector_state);
> > +		goto unlock;
> > +	}
> > +
> > +	err = drm_atomic_helper_reset_pipe(connector_state->crtc, &ctx);
> > +	if (err < 0)
> > +		goto unlock;  
> 
> And you'll find the crtc in bridge->encoder->crtc.

I am a bit confused. I looked at the drm_encoder structure [1] and the crtc
field available in this structure should not be used by atomic drivers. They
should rely on &drm_connector_state.crtc.

In my case, I have the feeling that I should get the ctrc from the current
state (i.e. bridge->base.state->state) using the sequence provided in this
current patch:
  Retrieve the connector with drm_atomic_get_old_connector_for_encoder()
  Retrieve the connector state with drm_atomic_get_connector_state()

but you pointed out the bridge->encoder->crtc field.

Should I use this field or use the &drm_connector_state.crtc with the drm
connector state retrieved from bridge->base.state->state using the proposed
sequence?

[1] https://elixir.bootlin.com/linux/v6.13-rc1/source/include/drm/drm_encoder.h#L180

Best regards,
Hervé
