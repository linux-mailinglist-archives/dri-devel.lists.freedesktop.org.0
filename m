Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1060A1307B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 02:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326AB10E548;
	Thu, 16 Jan 2025 01:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fv1+UDaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5958B10E543
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:09:05 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30229d5b229so4244981fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736989684; x=1737594484; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wwzMlilLdEujY5Zs33d6OoN+S/2HulFb5odS52mZBkw=;
 b=Fv1+UDaSThbDfUfdbQtvSjqQLHGfrwgSMmZTVBFjiCXHlD4vxsG4nd9CW41pGAzaSC
 QJzgWuh+d3/kMSKz98yswu8ZTiz3TJ3+UyH9bmR0ndVbAUV61pOmmhc1UBfoYknBP2Yh
 t2XDls0BvO4DQA8WNAt00dl7pZ3rYI8R0fFy2x+pY3OwzqGxHpG/5xvEKqJ7OCG+MR0R
 QvnV9ga3LFpgiW90DF0tC48JZcBe6ZdK7E5PUcoUnv5q9ovPg/Q/pY/0/rcaFSc+bkYN
 Ipbfs+QV2hhcZsVtA5iCFWaE6PCpRZED1wRTk7ekrssUfEKSjuFvVfwN1b9mXdCQE/b7
 xsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736989684; x=1737594484;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wwzMlilLdEujY5Zs33d6OoN+S/2HulFb5odS52mZBkw=;
 b=GpkKzlfs8EJz2DdEr+BqDv70oozUMVNJuYEegQT6gLXwHRjD8G0mDn6A9rDkcOKBPp
 gw7MO2nOK65ZJ4xDPf52rJ86q2aJL4RlDnS2rt+swr6qX6TLbhv1XbQ+iQgjDNi6M9GG
 AnGsP/Z0DTSreINa2muJ9z7K/GXMaSscEmjnKkkDMsx04uuAONMlkNczqELyY2MUIMrS
 L4GN1eyQzSovhYdMtgYpRqYg04J+QxvmRiOe4HzDJ8ParbH4PO03DXrAMJZ0W3IEfcbR
 cWbyal+9ZhamF6vG5gRVzuTxGOgV3Qx3KqUofk31YgJE+FK7Ne9QREIpR8rg81I5Crbp
 wYRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuYm7M6N45HYqdYIxDzkxhTSbkhq09Xh+0Tmhg0IYytwaaQShcGNlXJzaHOPFXppJ7jcNR4/+4S8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHnGLZM10hh8rulHxhoJ3z09jDTTv/tdwo1f7JX1VDW5ro5zcU
 Bv+bXbNsr77SHe0DMZhUEZDaW2YB9wcmqbFyMDeEIhIL9iWXjMViiJLIul1BJlg=
X-Gm-Gg: ASbGncut2iCPWkKqSw+EWYi5gfBD7PSE/NcxKzhrLdysTa9K2pLrfuSvgJraZZ2dBd4
 GzxNQjxH+CffmvU7KRAsehK05xpcuEujGe5b0ATY6oIU8Jn/CZt0WtWsEtqEBPHqtYR9an7qd+x
 VbuzDEXj9xJ00PdS4pY4s95wtZgktB41e33iWdywdxYhPe9GaCyzYcmhsrGGvlGpdY79YwXBLno
 JTZC//M2yVTJ7cq93LwwTXNeEZ21JUmQnjIRVXpPaz7Ak1rLdmz5cIEEvhTtzQU6rwmzfSjk8GE
 dBBh9Sh1v+W5ONNRCePXzugPB29LG9EAJqA9
X-Google-Smtp-Source: AGHT+IFmjPC9QwWjRvCfffS8UBGr+gFJLAcJvNPgqdVotuaUVrqh3Sm4R8W+jJAYUE0rg6CRJe0/yA==
X-Received: by 2002:a05:651c:4cb:b0:302:3355:f756 with SMTP id
 38308e7fff4ca-305f463c1e3mr102527661fa.35.1736989683655; 
 Wed, 15 Jan 2025 17:08:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0ad0e9sm22668551fa.15.2025.01.15.17.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 17:08:02 -0800 (PST)
Date: Thu, 16 Jan 2025 03:08:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
Message-ID: <cfn3xpwyoo6lbugaxjwxvcq4l7eqbznlgnunxxfg4jnbrwtnpo@wdoizsk6ckvg>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-29-9a2fecd886a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-bridge-connector-v1-29-9a2fecd886a6@kernel.org>
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

On Wed, Jan 15, 2025 at 10:05:36PM +0100, Maxime Ripard wrote:
> The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 41 ++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index b3d617505dda7d22b38c000fb79de46376adf3f1..c17d9486cf5c36d61eb00af2bdf9ba1b6f890ffd 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -242,15 +242,16 @@ static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
>  	u8 buf[2] = { val & 0xff, val >> 8 };
>  
>  	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
>  }
>  
> -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata,
> +				     struct drm_bridge_state *bridge_state)
>  {
>  	u32 bit_rate_khz, clk_freq_khz;
>  	struct drm_display_mode *mode =
> -		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> +		&bridge_state->crtc->state->adjusted_mode;

At least we should document why is it safe to follow the crtc->state.

-- 
With best wishes
Dmitry
