Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5829FF023
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 16:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB80210E03B;
	Tue, 31 Dec 2024 15:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r8G/+CnO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7D410E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 15:19:27 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso10175937e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 07:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735658306; x=1736263106; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NsA+h8MrPKDybGr9ensERG0vy6cAQACpfuRAvQRAwoY=;
 b=r8G/+CnO8SmyK0oxl2u04zLl4nJfC+yN7m8HQvEMnnzGb7HtvtyJqROot6L+kaCgtk
 U6bZU2NmhsARsuvT8Rwp5zjBYSAchaO88sXoPp82ZNpwg0nNKzR5z5UfkqtpdDj5hX2C
 U9H5ZBeCNZuJFtyulnLh13K4PVWwGzd9qEUPvFw8aKWS6uCcBRnnH0VP7QKC0SD48Elr
 xagjGI8q4AxcW8XsZpbmHYm8ziYKhubNwcLstJpVoWbn5jUl1QPGrB35OJAycdknpHDD
 TSVaE0sTrdbkb/eIBSs2+YgJXlR7tahIFXUuebNKb0t2i35hRbMoSqjw8gfZoZHydeyg
 O+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735658306; x=1736263106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NsA+h8MrPKDybGr9ensERG0vy6cAQACpfuRAvQRAwoY=;
 b=aCvEHEUniE4F9CJBrdYqRM9xzAGOy7IkxUFvjEUylLzi9W6iWERRTyZnlBwGPUSTUP
 y2o0UFg6BM+KTWHoVNaehxM51Ki04qc1Z93Ej/i3DD30dZV8IW/Q2MvM4R95JsQpZuc0
 nuYQzeaZ6OQQc8E/gxLk64kP78TFG3+ojmxwF72w5mHvDK8q+wRodidLemAvqP3ZVgyi
 awoD0W3MF/9Sk/d9ilHcHEot8/k1DQSrXFdmWsRVoer1Oz7QocDZX8NA0zNkdyKRVf6d
 O7uVHDqDdO60GuNqDMhwkr8L7zOYZnSCsMwLcQFCzHAgzyL5LsYNf8IboOa+ywZYFJft
 3b6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoGzFsB/nC0l58h853yeJZNVLRgsB7CiTlbzF05wR6NNswiiMZxTE+B4RON9T6f7DlGW8LKtzxMeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwocWt5qaFkMtgbq041HKuqnC9r4B0vugOTjCXwegOAcClL0ZVa
 5JL/pAWRi3nnzGkSjbWKw1NG/G8rHlx7fkXu7+hqJDi3RJFYID8JhpksVzGp1bH4CcdFlp3RPws
 a
X-Gm-Gg: ASbGncvE6p9lNvEdVVaFqnwPTw0LWMQ38iw6I9ME1huG+hTqoDYkjbGAsyQI8ZWZN8U
 xpPIOYkkmsSSsLa64CTvP8vtOQxNpHK7BV3Dc8Web3C4lns0r56mJcDkLiklQ2REaDg0xOrI6ew
 OtqcRCy43MwP9u3PIzvfidUaTkT+vtI2Wk+cElzcSRan1Hsojjy4ZMyi7E0Ij1M81wsyJQimrFz
 Y+iGu9TmHzJZmP/vc7ZwUROz2c0nQiNvrCKNOXG2aEbK5nAJ3DK+rcB4CPB3cZt8DvndMQL4k4j
 oY7QzTJWYlygMpzFFAtmVcpv86zJ3F3G0XsO
X-Google-Smtp-Source: AGHT+IHHabGJB7P2rP60P6ye1QnJHOTGO/MyUod3wpaOty8DPQW3aBi+vUhFMSCQxe+qZNkA2ZI2rQ==
X-Received: by 2002:a2e:be09:0:b0:302:2a23:cf6 with SMTP id
 38308e7fff4ca-30468519747mr130229991fa.12.1735657062365; 
 Tue, 31 Dec 2024 06:57:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6c595sm37483571fa.3.2024.12.31.06.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 06:57:41 -0800 (PST)
Date: Tue, 31 Dec 2024 16:57:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
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

On Tue, Dec 31, 2024 at 11:40:02AM +0100, Luca Ceresoli wrote:
> Instead of using dsi->out_bridge during the bridge search process, use a
> temporary variable and assign dsi->out_bridge only on successful
> completion.
> 
> The main goal is to be able to drm_bridge_get() the out_bridge before
> setting it in dsi->out_bridge, which is done in a later commit. Setting
> dsi->out_bridge as in current code would leave a use-after-free window in
> case the bridge is deallocated by some other thread between
> 'dsi->out_bridge = devm_drm_panel_bridge_add()' and drm_bridge_get().

I don't think that's how refcounting should work. Any of the functions
that give you the bridge should also increase refcount, requiring manual
_put() call afterwards. We might need a separate API for that.

> 
> This change additionally avoids leaving an ERR_PTR value in dsi->out_bridge
> on failure. This is not necessarily a problem but it is not clean.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v5.
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index f8b4fb8357659018ec0db65374ee5d05330639ae..c4d1563fd32019efde523dfc0863be044c05a826 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1705,6 +1705,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	struct device *dev = dsi->dev;
>  	struct device_node *np = dev->of_node;
>  	struct device_node *remote;
> +	struct drm_bridge *out_bridge;
>  	struct drm_panel *panel;
>  	int ret;
>  
> @@ -1740,21 +1741,23 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  
>  	panel = of_drm_find_panel(remote);
>  	if (!IS_ERR(panel)) {
> -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> +		out_bridge = devm_drm_panel_bridge_add(dev, panel);
>  	} else {
> -		dsi->out_bridge = of_drm_find_bridge(remote);
> -		if (!dsi->out_bridge)
> -			dsi->out_bridge = ERR_PTR(-EINVAL);
> +		out_bridge = of_drm_find_bridge(remote);
> +		if (!out_bridge)
> +			out_bridge = ERR_PTR(-EINVAL);
>  	}

While looking at this patch, I think we should migrate the driver to
drm_of_find_panel_or_bridge(). Then your patch might add a function
close to devm_drm_of_get_bridge() or drmm_of_get_bridge(). Otherwise we
end up having too much duplicate boilerplate code.

>  
>  	of_node_put(remote);
>  
> -	if (IS_ERR(dsi->out_bridge)) {
> -		ret = PTR_ERR(dsi->out_bridge);
> +	if (IS_ERR(out_bridge)) {
> +		ret = PTR_ERR(out_bridge);
>  		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
>  		return ret;
>  	}
>  
> +	dsi->out_bridge = out_bridge;
> +
>  	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
>  		     device->name, device->lanes,
>  		     mipi_dsi_pixel_format_to_bpp(device->format),
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
