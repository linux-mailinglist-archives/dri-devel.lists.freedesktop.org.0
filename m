Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D8962792
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 14:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE1A10E4FE;
	Wed, 28 Aug 2024 12:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="iXMpjLrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4B610E500
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:45:58 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4280bbdad3dso57198365e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724849157; x=1725453957; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ftRdv0MLU+3ijXVFoJmvVkSok6Tm8Wviwpu9Wkm/YDY=;
 b=iXMpjLrrNHtJxVQA061dy1ipKMubmj2x1uZDlrnndhHFhwKzwBgIVuBuVh9Dm5pFvF
 7n7tRFb+wijQhkCpIqH5ttp8dVsbGg4wuA8kmrnngdAxqeVNItsSzf5a7V5e+YqHAgIg
 k2mDw6MeNIat5kzep7i96XKUg4qi76y0RktCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724849157; x=1725453957;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ftRdv0MLU+3ijXVFoJmvVkSok6Tm8Wviwpu9Wkm/YDY=;
 b=L9DuowyeWqnZxrrkOFXtKY4UWeTWyQQ/rUeTEsjhgCjvyepGmNveb+C2sbtj69sN7r
 1mKEJgaZ98HjYNDgsK/WYit6Js+vINXmYmyRI0WinwG4jPuEkw+PrLvfHedw+hlNC3YE
 gPS9GRZ/lJyIauZaKYFCSXv22djySGeHOSrmtMwSNirO09zHa1aO4wHU4d7s5q7scqBi
 EMgbGanXAqymKzvW2aW+3XqJ2qnfMWfrdgyddeNVd0dhM2nk56d7hyAHZBG6pE1Xk9Mx
 rZ0rKmfwuARr0PqFzlKQ5TgVMYICZ31C+5ohh7VR1XhK6Bn4UAYhb2z6Y0CCw11uT1R6
 Lsvg==
X-Gm-Message-State: AOJu0YzsB8xmdj2VIYL4letQsTOj3W1saggRwpI4mnpLwrWobmG8oFZb
 acXmCiy+AqqkBcLmCd3pQlzdb+CJ9WUXeLnXP96WA7G/CdDNe0G9x1YvIexfvpA=
X-Google-Smtp-Source: AGHT+IHJLuY388mFQiWhVPxgkqgSy18vMCcZhNzc2YHb6bAZ5VajwOyWWRJA7igX6fSAvH8sZu1CAw==
X-Received: by 2002:a05:600c:3514:b0:426:51dc:f6cd with SMTP id
 5b1f17b1804b1-42acd57a01dmr123145165e9.18.1724849156478; 
 Wed, 28 Aug 2024 05:45:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba63a53f9sm20899835e9.12.2024.08.28.05.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 05:45:56 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:45:54 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/exynos: hdmi: convert to struct drm_edid
Message-ID: <Zs8cAse9Tyv6JTe_@phenom.ffwll.local>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <be15dce66a5373a7aed797a4ef63b0ba90b231e9.1724348429.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be15dce66a5373a7aed797a4ef63b0ba90b231e9.1724348429.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Thu, Aug 22, 2024 at 08:42:49PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> The functional change is that the CEC physical address gets invalidated
> when the EDID could not be read.
> 
> v2:
> - display info usage was split to a separate patch
> - check drm_edid_connector_update() return value
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 25d508b25921..c9d4b9146df9 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -884,14 +884,21 @@ static int hdmi_get_modes(struct drm_connector *connector)
>  {
>  	struct hdmi_context *hdata = connector_to_hdmi(connector);
>  	const struct drm_display_info *info = &connector->display_info;
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>  	int ret;
>  
>  	if (!hdata->ddc_adpt)
>  		goto no_edid;
>  
> -	edid = drm_get_edid(connector, hdata->ddc_adpt);
> -	if (!edid)
> +	drm_edid = drm_edid_read_ddc(connector, hdata->ddc_adpt);

hdmi_create_connector seems to set up the right ddc already, so I think
drm_edid_read should be working. With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
> +	ret = drm_edid_connector_update(connector, drm_edid);
> +	if (ret)
> +		return 0;
> +
> +	cec_notifier_set_phys_addr(hdata->notifier, info->source_physical_address);
> +
> +	if (!drm_edid)
>  		goto no_edid;
>  
>  	hdata->dvi_mode = !info->is_hdmi;
> @@ -899,12 +906,9 @@ static int hdmi_get_modes(struct drm_connector *connector)
>  			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
>  			  info->width_mm / 10, info->height_mm / 10);
>  
> -	drm_connector_update_edid_property(connector, edid);
> -	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
> -
> -	ret = drm_add_edid_modes(connector, edid);
> +	ret = drm_edid_connector_add_modes(connector);
>  
> -	kfree(edid);
> +	drm_edid_free(drm_edid);
>  
>  	return ret;
>  
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
