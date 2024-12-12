Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCAD9EE27B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 10:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB18510E208;
	Thu, 12 Dec 2024 09:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kxcwf55L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014E210E208
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 09:18:23 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso479812e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 01:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733995102; x=1734599902; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BvOLGgu+RtTzazwHxmT0a+oMtvGtLbiK35Nxn71eTwk=;
 b=Kxcwf55LI9VjDyEL7hxouxaouJ1o1ha3NjqPNOBJX9IN58vOerRNW5iFlPvwR281kl
 2IEj/yYMb7cAw0yKFRHlYgvILtJRE+HDWfgSOXqLnFCsfu08Pn8x9qCXlDFQ1cljrGEy
 IxM5/k/NjBW19/ajpzaC2Vm0zyHntt9O6DYUtRT5uJGRYotPCl+79oJCmgNsi5hXJExg
 p6HXVcoKGxUqivKE2yHEHbF4pBaE8oHymByNksILghHk55jH6iYH2V6ex+NHnTD2MqiP
 I1k/ZsQYAhqMUnzFsQRQniD01WudxOLQGZrx2z2mMb9zze7ayLEjoqjvJwwUDLKaQsvZ
 dH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733995102; x=1734599902;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvOLGgu+RtTzazwHxmT0a+oMtvGtLbiK35Nxn71eTwk=;
 b=Z4hB07QQrxAWMk3u3kt58PIExlIoXRrmJTJlseRgASqNJQS8pPRjG3EtuoyZS84A71
 WEGJMqOGlFsCvt1/jPPBrzXGip70MZNNc7Sn5c52D6ZrQJHUpjNbZIMltvfwwDWZKXAd
 r9Nh+dgNInNHTrTD4ulWfRTlRhM4eoeyL7KkhZiQef5SsS8yI5W7pcZYDcajBfnZOAnx
 Yl113cTQm4QHkYJ6AqKxWuUVNKdjzR3jipMlrQ5gYlAJZkuvVna2Y+tCpNo/s+h4VwnU
 ZW6yoQE2sjHRNe9BfkZBrDsbnNok+zRu0mD7e+55uRCM3hGciCm726UkGLPsjpErWf6G
 BvPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDEvofyc2jT00ukTA6gSDcr7ThQVa5pueiwo1/gHRDn3sjcMZQ3aN8bkPQM+Xm+NrTOtYDBhu6gy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzewWk1rMX4Q4ddfah1VzInCsYGXbrQw1iAk7UyAqpPAUYGKQEc
 aR3nK1eiL7jf3l9Dk7LodIeTLhF5YUsOdz14x27d0XfZDiJ/vUEzfYCr3I2bFOs=
X-Gm-Gg: ASbGncv4quMl2UC9ZlU8fdY7nFKc1mbgujY13o+yjKGluPgGekyep+Mdsnn44YysxAq
 YGZYhR+50D6l6zBRCdPbuqgTLqGZIjjjEZkLJ2Ont9zuXUMiXe32UXkwGw8WerzwgMcXmIaIjjY
 ov2ikBAUIS55VuBvybnITdEXhwtIsF+AXDEQFsMZUIkYhL+0JZryzxtGqasXK89Z2D/80qXN25l
 49izW9tDlgkAp36qgTokRJRrQUSkjY81TBvlgIk2ggcM3eWTU4zV1TQGnUoEVNbRLQGrgrdLU2K
 o8xdTY5MoA6RRwH9nLXcq79qREffWafFn+aw
X-Google-Smtp-Source: AGHT+IFa4qzzNpW/mOzSbufvxsnMziRCXTlbdkN6AxAUpz/Lu22DHLGc6saz2iXswDPN9Ey7Hybn8Q==
X-Received: by 2002:a05:6512:2384:b0:53e:23ec:b2e7 with SMTP id
 2adb3069b0e04-54032d3c271mr236824e87.34.1733995102250; 
 Thu, 12 Dec 2024 01:18:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3022397e845sm11998941fa.66.2024.12.12.01.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 01:18:21 -0800 (PST)
Date: Thu, 12 Dec 2024 11:18:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 bliang@analogixsemi.com, 
 qwen@analogixsemi.com, treapking@google.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
 atomic_enable()
Message-ID: <vkrl7om7hepboovp2uivcnernia3ygqwrj3y3kkjydeclwvrk5@7tkdc4etkcjs>
References: <20241212055110.1862487-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212055110.1862487-1-xji@analogixsemi.com>
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

On Thu, Dec 12, 2024 at 01:51:10PM +0800, Xin Ji wrote:
> When user enabled HDCP feature, userspace will set HDCP content
> to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
> HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
> support HDCP feature.
> 
> However once HDCP content turn to DRM_MODE_CONTENT_PROTECTION_ENABLED
> userspace will not update the HDCP content to
> DRM_MODE_CONTENT_PROTECTION_UNDESIRED until monitor disconnect.

It seems you've ingored a part of the previous review comment. It's the
userspace who triggers the ENABLED -> UNDESIRED transition, not the
kernel side. The change to move HDCP handling to atomic_enable() looks
fine, the change to disable HDCP is not (unless I misunderstand
something).

> 
> So, anx7625 driver move hdcp content value checking from bridge
> interface .atomic_check() to .atomic_enable(), then update hdcp content
> according from currently HDCP status. And also disabled HDCP in bridge
> interface .atomic_disable().
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 74 ++++++++++++++---------
>  1 file changed, 46 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index a2675b121fe4..f96ce5665e8d 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct anx7625_data *ctx)
>  				 TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
>  }
>  
> +static void anx7625_hdcp_disable_and_update_cp(struct anx7625_data *ctx)
> +{
> +	struct device *dev = ctx->dev;
> +
> +	if (!ctx->connector)
> +		return;
> +
> +	anx7625_hdcp_disable(ctx);
> +
> +	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +	drm_hdcp_update_content_protection(ctx->connector,
> +					   ctx->hdcp_cp);
> +
> +	dev_dbg(dev, "update CP to UNDESIRE\n");
> +}
> +
>  static int anx7625_hdcp_enable(struct anx7625_data *ctx)
>  {
>  	u8 bcap;
> @@ -2149,34 +2165,6 @@ static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
>  	if (cp == ctx->hdcp_cp)
>  		return 0;
>  
> -	if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> -		if (ctx->dp_en) {
> -			dev_dbg(dev, "enable HDCP\n");
> -			anx7625_hdcp_enable(ctx);
> -
> -			queue_delayed_work(ctx->hdcp_workqueue,
> -					   &ctx->hdcp_work,
> -					   msecs_to_jiffies(2000));
> -		}
> -	}
> -
> -	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -		if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> -			dev_err(dev, "current CP is not ENABLED\n");
> -			return -EINVAL;
> -		}
> -		anx7625_hdcp_disable(ctx);
> -		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> -		drm_hdcp_update_content_protection(ctx->connector,
> -						   ctx->hdcp_cp);
> -		dev_dbg(dev, "update CP to UNDESIRE\n");
> -	}
> -
> -	if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> -		dev_err(dev, "Userspace illegal set to PROTECTION ENABLE\n");
> -		return -EINVAL;
> -	}
> -
>  	return 0;
>  }
>  
> @@ -2425,6 +2413,8 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
>  	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
>  	struct device *dev = ctx->dev;
>  	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	int cp;
>  
>  	dev_dbg(dev, "drm atomic enable\n");
>  
> @@ -2439,6 +2429,32 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
>  	_anx7625_hpd_polling(ctx, 5000 * 100);
>  
>  	anx7625_dp_start(ctx);
> +
> +	conn_state = drm_atomic_get_new_connector_state(state->base.state, connector);
> +
> +	if (WARN_ON(!conn_state))
> +		return;
> +
> +	cp = conn_state->content_protection;
> +	if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> +		if (ctx->dp_en) {
> +			dev_dbg(dev, "enable HDCP\n");
> +			anx7625_hdcp_enable(ctx);
> +
> +			queue_delayed_work(ctx->hdcp_workqueue,
> +					   &ctx->hdcp_work,
> +					   msecs_to_jiffies(2000));
> +		}
> +	}
> +
> +	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> +		if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +			dev_err(dev, "current CP is not ENABLED\n");
> +			return;
> +		}
> +
> +		anx7625_hdcp_disable_and_update_cp(ctx);
> +	}
>  }
>  
>  static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
> @@ -2449,6 +2465,8 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
>  
>  	dev_dbg(dev, "drm atomic disable\n");
>  
> +	anx7625_hdcp_disable_and_update_cp(ctx);
> +
>  	ctx->connector = NULL;
>  	anx7625_dp_stop(ctx);
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
