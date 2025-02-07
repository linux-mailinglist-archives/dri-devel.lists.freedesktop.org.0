Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E43A2B95B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EF710EA09;
	Fri,  7 Feb 2025 02:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eovFi0tb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EDD10EA09
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:55:59 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-306007227d3so16344151fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738896958; x=1739501758; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+Byca7B+SvHo9poDjpj+NTEDwW3aW+UfYwBPg1UM/mI=;
 b=eovFi0tbjECHoJu+N1HBvCjQhPHR8Z3xtZkX3dA3R2vNfIHbCMwbiBl5FSJ1zWz6tw
 YabU7wkKmBL2v6SuWD3iimdx3Wgmm8GFGuymyNLzTw9jdQHzownpdi30Q3FMViUnW7kX
 3QHPQGvRAcZNOOIoFJZSy3/cbwXN4JAGkeJ8RmYHpJREugbOneykQnJhVwHDTXe0Vx3V
 SnzKxZ5MGyClJU7G1M6xBaZrVPBTEftDktJf1H3HQXFGskLnHtO2hBgSf3IUnJxTB5Rt
 puZx9JFjUspdpzfsvN3AcHJ4BmXgfZK1FHK3Qc5RZrKfmAj6SX1V3Cl/YbL/Bn/YD5XB
 c+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738896958; x=1739501758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Byca7B+SvHo9poDjpj+NTEDwW3aW+UfYwBPg1UM/mI=;
 b=e1DnYq5V618X9X2UjreCKO0M6upSa+XOMaCQ3KqjxVqFQ9GxWApZQSXgI/jl+Hv4r1
 PjhhtL1utDJJMbEQM26tju/9Do2jrvSelq8DuPd6zgcOZb0VesSt4pXPLrg1rUVTpKpX
 9vZs9NU4LjO4tVK4H2f/xsxSJXlZ6++ioEsgz9miRaTBfzvcE+IiXRFWYUxR5j8XwckN
 cIE942VVuxsNFcCHJA2BwjiyQgqgnlDyTb/2KsGZg2KTz81imsmdSjNfk2qw2c4HrJUJ
 TxDpnWYulYO3+uwLErQT8+algJesapPya4DmGRIy3z+18QnuEn/6bzSpD6t+6TXRvbST
 IkoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcxccrLGr1ORb/TcGhrlmshxIdVVft2cLB9jApIIrQuFErkSY4B5pRVwa5SjLpDXz+SelwXYSUFNo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRNdnXIQaDe0t+yPmUKZaPmoxfZCBzw7f59rEx1n5nGHTPScKS
 31Fy5MleuzqLreaZceeQCx3TZjjnm/fE6Key+KzsL8QHPWmNjo7kn1eiGMavSxE=
X-Gm-Gg: ASbGncticUTBHqLSAx1cmSfc60ComjsfO0ZuRMOZTC34+JbY0rAkolKWqfkwKSQ6tD5
 pwmWqfbXtpwYx6u1/xXq6XQBUV6zMeEhantBmg+b9NHpcb2YRIEj88ZMRCR26p921rIaF5zki+O
 9m78ld3jSlke8axOlkQ59zH/v/EfXiSl7h/iHZsmq2yqbugB+AKVxFEuDCn8AwPF4xuTo+BSzf/
 kTVnkBEnBCdqQCMljQdoOJ7RtzHFDmIrMjJD8kp7Dv4f9X+AsvRwUbABGy7WHJ+NZY3VGHSlOJE
 YgsKgXQYkzFSn4k0SAH7QjYna4jo8MjduQ6DcBuJB6RpvRhtxCP7E+JHCwxS/LlxgBgJGXA=
X-Google-Smtp-Source: AGHT+IFZ4T7u0nGpfUVwU5s+4eCkQKYR6Jj3XEJ5v8Yh2TBgTlWEdJadPmr9h+8Pcw7MtkjpxzqCxQ==
X-Received: by 2002:a05:651c:892:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-307e5817d58mr4571041fa.22.1738896957912; 
 Thu, 06 Feb 2025 18:55:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2d8efesm2799391fa.88.2025.02.06.18.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:55:56 -0800 (PST)
Date: Fri, 7 Feb 2025 04:55:54 +0200
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
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
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
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
Message-ID: <hc6llejnkhj5uaj5o4fof64hmderfcbfkrburv7nmqwzq2jnin@nac32akftsbm>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:26PM +0100, Luca Ceresoli wrote:
> In order to support panels described either via graph links or via a
> subnode (e.g. "panel@0"), this driver uses low-level deprecated functions
> to find the next bridge. The resulting logic is complex and duplicates code
> already present in the DRM bridge core. Switch to the new APIs in DRM
> bridge core that allow to do the same in a much cleaner way.
> 
> Note there are two slight changes in the new logic intended to improve the
> final result:
> 
>  * the old code looks for a subnode with any name except "port" or "ports",
>    while the new code uses the node passed as a parameter
> 
>  * the old code looks for a subnode first and falls back to a graph link,
>    while the new code uses the reverse order because graph links are the
>    recommended device tree representation now
> 
> The first change makes the code more robust by avoiding the risk of using
> an unrelated node which is not describing a panel and not names "port" or
> "ports".
> 
> The second change is not expected to expose regressions because, in the
> cases where both a subnode and a graph link are used to describe a panel,
> the graph link should point to the subnode itself, such as in
> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> 
> As a further cleanup, use a temporary variable to assign dsi->out_bridge
> only on success. This avoids the risk of leaving a non-NULL value in
> dsi->out_bridge when samsung_dsim_host_attach() fails.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 55 ++++++-----------------------------
>  1 file changed, 9 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index f8b4fb8357659018ec0db65374ee5d05330639ae..bbd0a4f5a3f52b61bf48f10d6e8ca741bffa5e46 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1704,55 +1704,16 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
>  	struct device *dev = dsi->dev;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *remote;
> -	struct drm_panel *panel;
> +	struct drm_bridge *out_bridge;
>  	int ret;
>  
> -	/*
> -	 * Devices can also be child nodes when we also control that device
> -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> -	 *
> -	 * Lookup for a child node of the given parent that isn't either port
> -	 * or ports.
> -	 */

Please leave the comment in place (maybe rewrite it slightly).

> -	for_each_available_child_of_node(np, remote) {
> -		if (of_node_name_eq(remote, "port") ||
> -		    of_node_name_eq(remote, "ports"))
> -			continue;
> +	out_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
> +	if (IS_ERR(out_bridge) && PTR_ERR(out_bridge) != -EPROBE_DEFER)

Can it actually return EPROBE_DEFER?

> +		out_bridge = devm_drm_of_get_bridge_by_node(dev, device->dev.of_node);
>  
> -		goto of_find_panel_or_bridge;
> -	}
> -
> -	/*
> -	 * of_graph_get_remote_node() produces a noisy error message if port
> -	 * node isn't found and the absence of the port is a legit case here,
> -	 * so at first we silently check whether graph presents in the
> -	 * device-tree node.
> -	 */
> -	if (!of_graph_is_present(np))
> -		return -ENODEV;
> -
> -	remote = of_graph_get_remote_node(np, 1, 0);
> -
> -of_find_panel_or_bridge:
> -	if (!remote)
> -		return -ENODEV;
> -
> -	panel = of_drm_find_panel(remote);
> -	if (!IS_ERR(panel)) {
> -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	} else {
> -		dsi->out_bridge = of_drm_find_bridge(remote);
> -		if (!dsi->out_bridge)
> -			dsi->out_bridge = ERR_PTR(-EINVAL);
> -	}
> -
> -	of_node_put(remote);
> -
> -	if (IS_ERR(dsi->out_bridge)) {
> -		ret = PTR_ERR(dsi->out_bridge);
> -		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
> -		return ret;
> +	if (IS_ERR(out_bridge)) {
> +		DRM_DEV_ERROR(dev, "failed to find the bridge: %ld\n", PTR_ERR(out_bridge));
> +		return PTR_ERR(out_bridge);
>  	}
>  
>  	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
> @@ -1784,6 +1745,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
>  
> +	dsi->out_bridge = out_bridge;
> +

Please move the assignment closer to the original place.

>  	return 0;
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
