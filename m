Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E19A53DC
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 13:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47EB10E0D2;
	Sun, 20 Oct 2024 11:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dHsb6EVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C35D10E0D2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 11:47:53 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fb518014b9so30164741fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729424871; x=1730029671; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I3MwemwtOnXFXWvxYPsTpfeerKMKatzArLCCx5itR1A=;
 b=dHsb6EVogiZ/5Y81Kr+okh+5XwCENOLRfYOFUEwAS6rTxGio97PKzLGDXD7nUYdaTi
 eYRhKumfXw1RyOpqO2lxTdi23LFto7CtlAHEQ9gl27qs+hwMhgeDM8u57NLTKb5Ebys0
 VhWy95JHwWkt6CrDU4YOMSIHdtzR2PfIhZY006HhYp2OL8Td5nv8V3xXaJ7fPTdK+4Z3
 T1U88YqkXP+f/94hxwzgDvKT3iCEvjbh23cJlkXP/LdzIIoN4uLrFK86sGXPGh08MCpx
 PXSR/dxd4gZL/G6JFENmppHpFxXgGj1mfO8vL9doMpF4j5V4wOiJxk5qChfMCj1q52L3
 4O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729424871; x=1730029671;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3MwemwtOnXFXWvxYPsTpfeerKMKatzArLCCx5itR1A=;
 b=F2YqCw4TOXF3D4wBsFf07J0zwVqvpUFFD/REPg/LwRGgBLJAzw4DLqQdihXIUfG+Zi
 GJneurcsilORRVsyOnl1iF0hl9nmdJfQuhZa8IP/p609dgcSUscls2Q1BRP589/kORE+
 BWoiQXmtPzFecobTtzS+vhBi8bPDoy1HfF5EsuLQeNMO8bPODLaYCX5CcIowCbOrJHGk
 HCJlq2yyITlI0khr32aKA+DQqnndliGsTKLFubpR5ATnYMN7VMuK3Bw/2Z8f0YqiB40E
 h7+NQbgrL3Iec96NUe6Po3pP++TcAJSAEFjIQdJU/igfPR9KZodQMHSBP2AFiHW266rj
 MFYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMBGfLwONv+L/is3CawUk19vAG7U+8ukGfUdNb5/o657ql4gfP5W90yL/i1Pvo7GXsWtGkVxm10k0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyaoG+ipgjVdFc8ArO+UmkIRD2psVutQ7qxZweuw99qbX3QXmW
 9fmKPIEei2/UqDBLuovHygO3esQYMwHA0bbH48PUZw1ew2rsJAewWAs7k7/oLww=
X-Google-Smtp-Source: AGHT+IFiUWIYUPRBLqRq5jEiHwazU34w60+UrA+qWxSb7DwqSwwF4F0Sdu4M/kprqUWv3jTXpdksqg==
X-Received: by 2002:a2e:851:0:b0:2fb:3a78:190a with SMTP id
 38308e7fff4ca-2fb83262a78mr25135511fa.29.1729424871024; 
 Sun, 20 Oct 2024 04:47:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ad4b804sm2117621fa.1.2024.10.20.04.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 04:47:49 -0700 (PDT)
Date: Sun, 20 Oct 2024 14:47:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 11/13] drm/atomic-helper: Separate out Encoder-Bridge
 enable and disable
Message-ID: <d3odg42cw2zg6jf3zrjtmquq4fyrvb5stnzptexv7auwvtq3yf@ljohsfvp4uhq>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-4-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019200530.270738-4-aradhya.bhatia@linux.dev>
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

On Sun, Oct 20, 2024 at 01:35:28AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The way any singular display pipeline, in need of a modeset, gets
> enabled is as follows -
> 
> 	CRTC Enable
> 	All Bridge Pre-Enable
> 	Encoder Enable
> 	All Bridge Enable
> 
> - and the disable path is exactly the reverse of this.
> 
> The CRTC enable/disable occurs by looping over the old and new CRTC
> states, while the bridge pre-enable, encoder enable, and bridge enable
> occur by looping through the new connector states of the display
> pipelines.
> 
> At the moment, the encoder and bridge operations are grouped together
> and occur under the same loops.
> 
> Separate out the enable/disable loops of the encoder and bridge
> operations into a different function, to make way for the re-ordering of
> the enable and disable sequence of all these display elements.
> 
> This patch doesn't alter in any way the ordering of CRTC/encoder/bridge
> enable and disable, but merely helps to cleanly set up for the next
> patch and to make sure that the bisectibility remains intact.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 97 +++++++++++++++++------------
>  1 file changed, 57 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5186d2114a50..7741fbcc8fc7 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1122,11 +1122,10 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
>  }
>  
>  static void
> -disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
> +encoder_bridge_chain_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
>  {
>  	struct drm_connector *connector;
>  	struct drm_connector_state *old_conn_state, *new_conn_state;
> -	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>  	int i;
>  
> @@ -1189,6 +1188,16 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  
>  		drm_atomic_bridge_chain_post_disable(bridge, old_state);
>  	}
> +}
> +
> +static void
> +disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> +	int i;
> +
> +	encoder_bridge_chain_disable(dev, old_state);
>  
>  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
>  		const struct drm_crtc_helper_funcs *funcs;
> @@ -1445,6 +1454,51 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
>  	}
>  }
>  
> +static void
> +encoder_bridge_chain_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *new_conn_state;
> +	int i;
> +
> +	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
> +		const struct drm_encoder_helper_funcs *funcs;
> +		struct drm_encoder *encoder;
> +		struct drm_bridge *bridge;
> +
> +		if (!new_conn_state->best_encoder)
> +			continue;
> +
> +		if (!new_conn_state->crtc->state->active ||
> +		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
> +			continue;
> +
> +		encoder = new_conn_state->best_encoder;
> +		funcs = encoder->helper_private;
> +
> +		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> +			       encoder->base.id, encoder->name);
> +
> +		/*
> +		 * Each encoder has at most one connector (since we always steal
> +		 * it away), so we won't call enable hooks twice.
> +		 */
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
> +
> +		if (funcs) {
> +			if (funcs->atomic_enable)
> +				funcs->atomic_enable(encoder, old_state);
> +			else if (funcs->enable)
> +				funcs->enable(encoder);
> +			else if (funcs->commit)
> +				funcs->commit(encoder);
> +		}
> +
> +		drm_atomic_bridge_chain_enable(bridge, old_state);
> +	}
> +}
> +
>  /**
>   * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
>   * @dev: DRM device
> @@ -1465,8 +1519,6 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state;
>  	struct drm_crtc_state *new_crtc_state;
> -	struct drm_connector *connector;
> -	struct drm_connector_state *new_conn_state;
>  	int i;
>  
>  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
> @@ -1491,42 +1543,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  		}
>  	}

I'd say, if you want for it to be cleaner, split both loops from
drm_atomic_helper_commit_modeset_enables() and call them separately.
This save you from the code move, which is harder to review (and also
helps with the function complexity).

>  
> -	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
> -		const struct drm_encoder_helper_funcs *funcs;
> -		struct drm_encoder *encoder;
> -		struct drm_bridge *bridge;
> -
> -		if (!new_conn_state->best_encoder)
> -			continue;
> -
> -		if (!new_conn_state->crtc->state->active ||
> -		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
> -			continue;
> -
> -		encoder = new_conn_state->best_encoder;
> -		funcs = encoder->helper_private;
> -
> -		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> -			       encoder->base.id, encoder->name);
> -
> -		/*
> -		 * Each encoder has at most one connector (since we always steal
> -		 * it away), so we won't call enable hooks twice.
> -		 */
> -		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
> -
> -		if (funcs) {
> -			if (funcs->atomic_enable)
> -				funcs->atomic_enable(encoder, old_state);
> -			else if (funcs->enable)
> -				funcs->enable(encoder);
> -			else if (funcs->commit)
> -				funcs->commit(encoder);
> -		}
> -
> -		drm_atomic_bridge_chain_enable(bridge, old_state);
> -	}
> +	encoder_bridge_chain_enable(dev, old_state);
>  
>  	drm_atomic_helper_commit_writebacks(dev, old_state);
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
