Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457AB8C96D9
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 23:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DFF10E18A;
	Sun, 19 May 2024 21:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gVaZSywG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E9910E18A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 21:39:47 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so3008527e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 14:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716154785; x=1716759585; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sBKoviMmIMIkPsEzGI/ajrL3ge2BNQAmTeLSufIdz3Q=;
 b=gVaZSywGG6VKEtsqs7sTOGGXMsXhj89UBAg9+h/eXMkgxv4l6QeJ1OZxnZGRj6E9fq
 2XtvD3Cm+nzNZeTV7iViOmrhSvxHAcnjMOq2FNlXNFq4Ly6vZxsydonUO+WMoaQmCf09
 X5xJtMAxa09t7z3kuxVijlHpLwXFebMAYe1wlV7kfD8BAJwtTFVh1g/e9lxiTsIOXqC0
 Eu2tYtTdh6fak9LVLUmanLwYN5vrpMbjrMrmDN5xmjzWFOtAFmJIp5G1viUlUebxBHLO
 G4VhW7Gadfd1Am+qamm9X3EdR38GECP4dr4CQzGoCqyUNoWv/ub6NTFVkVnO/Q7qcJKR
 uM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716154785; x=1716759585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sBKoviMmIMIkPsEzGI/ajrL3ge2BNQAmTeLSufIdz3Q=;
 b=BwwYrD3hS5ayrvpU1ubP74+BXzeIV6qE6rhsGGrrQndn/uwCGh3MaIYNWBKK43gKlo
 HXzWRYU2etMNkgjXM1794XEqVibfgUhpaZwMncEewpvu4GjM/z67wMssp6szCA6fxkdB
 O37Xld1/RwxIlI4f9PtTu9NZrkFq20Z0KxF+H6So9Zkx4NxdnVU+/YEZYOiFoVJQ2WBu
 5freYm7OjxhApj5TbPZL2I9TFd00A6CtSSzYutewSiKElo4E3xGUYmUJqKP5gCxjjmGj
 WuLQ2ofbthEdzrrPebN+FGl4IiqyCRIUa3In6fhEhQaGr3ZpWc0DAYcAa7L5NlmwBhJM
 8dIA==
X-Gm-Message-State: AOJu0YwzkA4lvokeGKXcxDKxUZ476CMiHCvmG4uSWJ1lD71H3BZhEihL
 Jz6/8cMIrInBYa7t0fSUs3/xJAJEX8W+8hYLut68C8v++nJgBavvHPeu9uonEZQ=
X-Google-Smtp-Source: AGHT+IGuVW67eLUYZOtoSdlxREuU4ssfyqlixP9pt5IroDU7SPhL9/1CwvMwVWbWNiyxVq7mu4UPwA==
X-Received: by 2002:a05:6512:33c2:b0:51f:5853:14e3 with SMTP id
 2adb3069b0e04-5220fb74839mr20719294e87.25.1716154785275; 
 Sun, 19 May 2024 14:39:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3791sm4008349e87.174.2024.05.19.14.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 14:39:44 -0700 (PDT)
Date: Mon, 20 May 2024 00:39:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 11/11] drm/imx/ldb: convert to struct drm_edid
Message-ID: <x4ycujgusxndgcmpwdb624xsuv22aktmlahwawmimp26zxwhww@cum2dlwdzj6w>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <c1f1143b5aea14aea968cda6508b275b2f7246ea.1715691257.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1f1143b5aea14aea968cda6508b275b2f7246ea.1715691257.git.jani.nikula@intel.com>
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

On Tue, May 14, 2024 at 03:55:17PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Note: https://lore.kernel.org/dri-devel/20240331-drm-imx-cleanup-v2-5-d81c1d1c1026@linaro.org/


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> index 71d70194fcbd..793dfb1a3ed0 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
> @@ -72,7 +72,7 @@ struct imx_ldb_channel {
>  	struct device_node *child;
>  	struct i2c_adapter *ddc;
>  	int chno;
> -	void *edid;
> +	const struct drm_edid *drm_edid;
>  	struct drm_display_mode mode;
>  	int mode_valid;
>  	u32 bus_format;
> @@ -142,15 +142,15 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
>  	if (num_modes > 0)
>  		return num_modes;
>  
> -	if (!imx_ldb_ch->edid && imx_ldb_ch->ddc)
> -		imx_ldb_ch->edid = drm_get_edid(connector, imx_ldb_ch->ddc);
> -
> -	if (imx_ldb_ch->edid) {
> -		drm_connector_update_edid_property(connector,
> -							imx_ldb_ch->edid);
> -		num_modes = drm_add_edid_modes(connector, imx_ldb_ch->edid);
> +	if (!imx_ldb_ch->drm_edid && imx_ldb_ch->ddc) {
> +		imx_ldb_ch->drm_edid = drm_edid_read_ddc(connector,
> +							 imx_ldb_ch->ddc);
> +		drm_edid_connector_update(connector, imx_ldb_ch->drm_edid);
>  	}
>  
> +	if (imx_ldb_ch->drm_edid)
> +		num_modes = drm_edid_connector_add_modes(connector);
> +
>  	if (imx_ldb_ch->mode_valid) {
>  		struct drm_display_mode *mode;
>  
> @@ -553,7 +553,6 @@ static int imx_ldb_panel_ddc(struct device *dev,
>  		struct imx_ldb_channel *channel, struct device_node *child)
>  {
>  	struct device_node *ddc_node;
> -	const u8 *edidp;
>  	int ret;
>  
>  	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
> @@ -567,6 +566,7 @@ static int imx_ldb_panel_ddc(struct device *dev,
>  	}
>  
>  	if (!channel->ddc) {
> +		const void *edidp;
>  		int edid_len;
>  
>  		/* if no DDC available, fallback to hardcoded EDID */
> @@ -574,8 +574,8 @@ static int imx_ldb_panel_ddc(struct device *dev,
>  
>  		edidp = of_get_property(child, "edid", &edid_len);
>  		if (edidp) {
> -			channel->edid = kmemdup(edidp, edid_len, GFP_KERNEL);
> -			if (!channel->edid)
> +			channel->drm_edid = drm_edid_alloc(edidp, edid_len);
> +			if (!channel->drm_edid)
>  				return -ENOMEM;
>  		} else if (!channel->panel) {
>  			/* fallback to display-timings node */
> @@ -744,7 +744,7 @@ static void imx_ldb_remove(struct platform_device *pdev)
>  	for (i = 0; i < 2; i++) {
>  		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
>  
> -		kfree(channel->edid);
> +		drm_edid_free(channel->drm_edid);
>  		i2c_put_adapter(channel->ddc);
>  	}
>  
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry
