Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935939627AB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 14:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24C810E502;
	Wed, 28 Aug 2024 12:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="C895jyGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF90810E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:48:32 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4280bbdad3dso57225105e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724849311; x=1725454111; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EFqVGeHJhN7wq7x4S1yeJZ6zpXfyurzID6BfMG7GKt8=;
 b=C895jyGkUoX0co51ymVRTjESKN0PSvoFRvZOBAPy8qyi2VrlWyWjNouHUG9q6RVtxU
 krXSy/h1y+tiqWa6EKfbqT54hcpkyy8QM00ZUguh2EaEvyhwBmkJ3SATzIlQMXGUvmle
 BiXwCPN/NSO5cA/AnHazB61uUddGexb05ibvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724849311; x=1725454111;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EFqVGeHJhN7wq7x4S1yeJZ6zpXfyurzID6BfMG7GKt8=;
 b=P+HGwPbck5E4mduH4ThM71Qh3Hp+3TRJ2KKhPha+zwze5KDVEJpJbUEQa8aOmBKqSX
 dnaHUuN4hfY0kpgFaikj/AmpSY+PSiuHH04mNlifttd7FZfTKr28obBEP/6nHUwbQuZD
 8o/xYwa1PsV1HBqOYfog3cN/aqhoFRGMbX7obmwR7r2XMh//LCZTGyy6IuFQalbbBT3x
 LpG+F2yWfBklW/YtKHQPZQI+jaSIAI6bwhEpMbO8QKSCFcCPtYgU92x+dIS24waKiBz6
 4x4aQ3hN+GO8KSs1aDRzDgq6BszlvkNlxXXSNUo+NG5FJq7tcsGgSCFbdu73TV6vrHw/
 gdYA==
X-Gm-Message-State: AOJu0YwbPAYL7FmLAz5RyAFGvaY3RZq80u6DOhh7VU7yRF8YUUd8rzsf
 XdxwQp7q9pFWntABjj0kjAW0+5KU5I31fsIa6xoMXMSTkZKM1tejWg3NOOMpZJg6ugrFNUyAZUT
 Y
X-Google-Smtp-Source: AGHT+IGwJ6gk8liZgMOYtWuY6fVH82jdYY1IsW2X0cvvs14wPbFWW/L6yjXhPtffKOBhX6Xha0Vt3A==
X-Received: by 2002:a05:600c:3b94:b0:429:e6bb:a436 with SMTP id
 5b1f17b1804b1-42acd55654fmr124825975e9.9.1724849311092; 
 Wed, 28 Aug 2024 05:48:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba640402asm20863755e9.41.2024.08.28.05.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 05:48:30 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:48:28 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/6] drm/ipuv3/parallel: convert to struct drm_edid
Message-ID: <Zs8cnGinrFTq7Nqo@phenom.ffwll.local>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <a1698044d556072e79041d69b8702099fd17bd90.1724348429.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1698044d556072e79041d69b8702099fd17bd90.1724348429.git.jani.nikula@intel.com>
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

On Thu, Aug 22, 2024 at 08:42:51PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for storing the EDID and
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
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> index 55dedd73f528..91d7808a2d8d 100644
> --- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> +++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> @@ -34,7 +34,7 @@ struct imx_parallel_display_encoder {
>  
>  struct imx_parallel_display {
>  	struct device *dev;
> -	void *edid;
> +	const struct drm_edid *drm_edid;
>  	u32 bus_format;
>  	u32 bus_flags;
>  	struct drm_display_mode mode;
> @@ -62,9 +62,9 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
>  	if (num_modes > 0)
>  		return num_modes;
>  
> -	if (imxpd->edid) {
> -		drm_connector_update_edid_property(connector, imxpd->edid);
> -		num_modes = drm_add_edid_modes(connector, imxpd->edid);
> +	if (imxpd->drm_edid) {
> +		drm_edid_connector_update(connector, imxpd->drm_edid);
> +		num_modes = drm_edid_connector_add_modes(connector);
>  	}
>  
>  	if (np) {
> @@ -331,7 +331,7 @@ static int imx_pd_probe(struct platform_device *pdev)
>  
>  	edidp = of_get_property(np, "edid", &edid_len);
>  	if (edidp)
> -		imxpd->edid = devm_kmemdup(dev, edidp, edid_len, GFP_KERNEL);
> +		imxpd->drm_edid = drm_edid_alloc(edidp, edid_len);

Randomly wondering whether drm_edid_alloc should at least sanity check the
edid size ... but for another time. On this:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
>  	if (!ret) {
> @@ -355,7 +355,11 @@ static int imx_pd_probe(struct platform_device *pdev)
>  
>  static void imx_pd_remove(struct platform_device *pdev)
>  {
> +	struct imx_parallel_display *imxpd = platform_get_drvdata(pdev);
> +
>  	component_del(&pdev->dev, &imx_pd_ops);
> +
> +	drm_edid_free(imxpd->drm_edid);
>  }
>  
>  static const struct of_device_id imx_pd_dt_ids[] = {
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
