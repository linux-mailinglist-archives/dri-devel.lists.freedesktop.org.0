Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69F29A53F1
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 13:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE7010E2CB;
	Sun, 20 Oct 2024 11:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q6MKbr+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEDA10E2CB
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 11:58:23 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539e63c8678so4268479e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 04:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729425502; x=1730030302; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nvxitRgV6VUAAKQyOIlw2aRDIACkF3PRk5qsE1SfV5g=;
 b=Q6MKbr+7xsyE3PcZS3a7BSeH2/2cEEn+7bvrbMU6BmNqXikr1I+DmWBp1qVzGzpnJI
 1FH0kDo8z8srtp/8eLpzmaILGyIDdaO7NIr8wYo7F+Qs493783zZ9u11hYhpWf3852hr
 9iPf5z4rZK7edQU1m3/2XAmjtXAASPVeXrIfH8IeL5Ue+VDR/8p2RNiw57CJM8MIariK
 vvnnqnf2koA2+qhl3wnLx8i8TJx39/vMsDs6Imlf7P8VMaNZRDFu2Qj7DG/UDb9Rf9UY
 mBfgBwF39q+Y2KH4ukFrc+r5pur2WntEItp1mgGeHSfMeY93vENuGR4OD0qpRIVUQakB
 QNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729425502; x=1730030302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvxitRgV6VUAAKQyOIlw2aRDIACkF3PRk5qsE1SfV5g=;
 b=ibj/njDhmflkWzQ95DAAZWBHzNfIlkwkxSFmeh5OD0lD2JfwXAUiAs3nG3gv8fjXcY
 iJszRU745QU6utgqVdGZxCTgzbEC9JOW/tdEEE1ALVUdItkSz45AA+fnIjNWlXPWPO08
 z3ZeJv3KCkOJGAjUsNz38mKoP2sne7IZMPvIgT9AIfjtxhxk0SCvOPa7R2iMk4XndWOr
 N9nASuK4QxGHzewPZhvxbQlBmudaHYq2siWemZJ9YQEsqGchJf98F70vdjTRVQ9Txeoi
 mm8CG2VxlLUMFJs1kubbl9zFE8jDeYrnwNU6A421tVaAtgm1HxKi5fTpW/sjkcqyCEKE
 uEpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn6VeoVnIdjn4fVDiMHJhY8ww/FXiVmL3ORpdMhxFqZqWm9sTTNihdYSiHYEbgjy74QyVAf9Sj/XU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC9qv1Au9qFk3PcQUXak31O0sfHlhZPpieMkgNTyHbnA+PKuXI
 SCchZd6PZ5lFg2Th3inCpYLyzWIw2jirQGdKSq9jayMPo/SJLjE+WAvN6EvKSR8=
X-Google-Smtp-Source: AGHT+IG6UYfXiwKJAOMTkmWJfJNPL/iBzD+SqazQREv4a0iw7hvCTyDG4u2C2cRbwjqQd1ya1gKXNQ==
X-Received: by 2002:a05:6512:3049:b0:535:d4e9:28bf with SMTP id
 2adb3069b0e04-53a154f903dmr3835223e87.46.1729425501503; 
 Sun, 20 Oct 2024 04:58:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22420257sm203220e87.147.2024.10.20.04.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 04:58:21 -0700 (PDT)
Date: Sun, 20 Oct 2024 14:58:18 +0300
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
Subject: Re: [PATCH v5 12/13] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Message-ID: <vso7eistcemnv7hyk6nj27imqtckpqwglkpuidpzt4cfyluklj@42lci2ecv7sk>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-5-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019200530.270738-5-aradhya.bhatia@linux.dev>
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

On Sun, Oct 20, 2024 at 01:35:29AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> Move the bridge pre_enable call before crtc enable, and the bridge
> post_disable call after the crtc disable.
> 
> The sequence of enable after this patch will look like:
> 
> 	bridge[n]_pre_enable
> 	...
> 	bridge[1]_pre_enable
> 
> 	crtc_enable
> 	encoder_enable
> 
> 	bridge[1]_enable
> 	...
> 	bridge[n]_enable
> 
> and vice-versa for the bridge chain disable sequence.
> 
> The definition of bridge pre_enable hook says that,
> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> will not yet be running when this callback is called".
> 
> Since CRTC is also a source feeding the bridge, it should not be enabled
> before the bridges in the pipeline are pre_enabled. Fix that by
> re-ordering the sequence of bridge pre_enable and bridge post_disable.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 102 ++++++++++++++++++----------
>  include/drm/drm_atomic_helper.h     |   5 ++
>  2 files changed, 71 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 7741fbcc8fc7..6ebd869df79b 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1122,7 +1122,8 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
>  }
>  
>  static void
> -encoder_bridge_chain_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
> +encoder_bridge_chain_disable(struct drm_device *dev, struct drm_atomic_state *old_state,
> +			     enum bridge_chain_operation_type op_type)
>  {
>  	struct drm_connector *connector;
>  	struct drm_connector_state *old_conn_state, *new_conn_state;
> @@ -1162,31 +1163,43 @@ encoder_bridge_chain_disable(struct drm_device *dev, struct drm_atomic_state *ol
>  		if (WARN_ON(!encoder))
>  			continue;
>  
> -		funcs = encoder->helper_private;
> -
> -		drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
> -			       encoder->base.id, encoder->name);
> -
>  		/*
>  		 * Each encoder has at most one connector (since we always steal
>  		 * it away), so we won't call disable hooks twice.
>  		 */
>  		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		drm_atomic_bridge_chain_disable(bridge, old_state);
>  
> -		/* Right function depends upon target state. */
> -		if (funcs) {
> -			if (funcs->atomic_disable)
> -				funcs->atomic_disable(encoder, old_state);
> -			else if (new_conn_state->crtc && funcs->prepare)
> -				funcs->prepare(encoder);
> -			else if (funcs->disable)
> -				funcs->disable(encoder);
> -			else if (funcs->dpms)
> -				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
> -		}
> +		switch (op_type) {
> +		case DRM_BRIDGE_ENABLE_DISABLE:
> +			funcs = encoder->helper_private;
> +
> +			drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
> +				       encoder->base.id, encoder->name);
> +
> +			drm_atomic_bridge_chain_disable(bridge, old_state);
> +
> +			/* Right function depends upon target state. */
> +			if (funcs) {
> +				if (funcs->atomic_disable)
> +					funcs->atomic_disable(encoder, old_state);
> +				else if (new_conn_state->crtc && funcs->prepare)
> +					funcs->prepare(encoder);
> +				else if (funcs->disable)
> +					funcs->disable(encoder);
> +				else if (funcs->dpms)
> +					funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
> +			}
>  
> -		drm_atomic_bridge_chain_post_disable(bridge, old_state);
> +			break;
> +
> +		case DRM_BRIDGE_PRE_ENABLE_POST_DISABLE:
> +			drm_atomic_bridge_chain_post_disable(bridge, old_state);
> +			break;
> +
> +		default:
> +			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_type);
> +			break;
> +		}
>  	}
>  }
>  
> @@ -1197,7 +1210,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>  	int i;
>  
> -	encoder_bridge_chain_disable(dev, old_state);
> +	encoder_bridge_chain_disable(dev, old_state, DRM_BRIDGE_ENABLE_DISABLE);
>  
>  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
>  		const struct drm_crtc_helper_funcs *funcs;
> @@ -1243,6 +1256,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  		if (ret == 0)
>  			drm_crtc_vblank_put(crtc);
>  	}
> +
> +	encoder_bridge_chain_disable(dev, old_state, DRM_BRIDGE_PRE_ENABLE_POST_DISABLE);
>  }
>  
>  /**
> @@ -1455,7 +1470,8 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
>  }
>  
>  static void
> -encoder_bridge_chain_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
> +encoder_bridge_chain_enable(struct drm_device *dev, struct drm_atomic_state *old_state,
> +			    enum bridge_chain_operation_type op_type)
>  {
>  	struct drm_connector *connector;
>  	struct drm_connector_state *new_conn_state;
> @@ -1474,28 +1490,40 @@ encoder_bridge_chain_enable(struct drm_device *dev, struct drm_atomic_state *old
>  			continue;
>  
>  		encoder = new_conn_state->best_encoder;
> -		funcs = encoder->helper_private;
> -
> -		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> -			       encoder->base.id, encoder->name);
>  
>  		/*
>  		 * Each encoder has at most one connector (since we always steal
>  		 * it away), so we won't call enable hooks twice.
>  		 */
>  		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
>  
> -		if (funcs) {
> -			if (funcs->atomic_enable)
> -				funcs->atomic_enable(encoder, old_state);
> -			else if (funcs->enable)
> -				funcs->enable(encoder);
> -			else if (funcs->commit)
> -				funcs->commit(encoder);
> -		}
> +		switch (op_type) {
> +		case DRM_BRIDGE_PRE_ENABLE_POST_DISABLE:
> +			drm_atomic_bridge_chain_pre_enable(bridge, old_state);
> +			break;
> +
> +		case DRM_BRIDGE_ENABLE_DISABLE:
> +			funcs = encoder->helper_private;
> +
> +			drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> +				       encoder->base.id, encoder->name);
>  
> -		drm_atomic_bridge_chain_enable(bridge, old_state);
> +			if (funcs) {
> +				if (funcs->atomic_enable)
> +					funcs->atomic_enable(encoder, old_state);
> +				else if (funcs->enable)
> +					funcs->enable(encoder);
> +				else if (funcs->commit)
> +					funcs->commit(encoder);
> +			}
> +
> +			drm_atomic_bridge_chain_enable(bridge, old_state);
> +			break;
> +
> +		default:
> +			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_type);
> +			break;
> +		}
>  	}
>  }
>  
> @@ -1521,6 +1549,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  	struct drm_crtc_state *new_crtc_state;
>  	int i;
>  
> +	encoder_bridge_chain_enable(dev, old_state, DRM_BRIDGE_PRE_ENABLE_POST_DISABLE);
> +
>  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
>  		const struct drm_crtc_helper_funcs *funcs;
>  
> @@ -1543,7 +1573,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  		}
>  	}
>  
> -	encoder_bridge_chain_enable(dev, old_state);
> +	encoder_bridge_chain_enable(dev, old_state, DRM_BRIDGE_ENABLE_DISABLE);
>  
>  	drm_atomic_helper_commit_writebacks(dev, old_state);
>  }
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 9aa0a05aa072..92a5812adc6c 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -43,6 +43,11 @@
>   */
>  #define DRM_PLANE_NO_SCALING (1<<16)
>  
> +enum bridge_chain_operation_type {
> +	DRM_BRIDGE_PRE_ENABLE_POST_DISABLE,
> +	DRM_BRIDGE_ENABLE_DISABLE,
> +};
> +

The enum doesn't need to be public, does it?

>  struct drm_atomic_state;
>  struct drm_private_obj;
>  struct drm_private_state;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
