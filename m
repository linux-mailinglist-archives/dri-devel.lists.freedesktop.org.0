Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98D8D4DCF
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 16:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C36310E9AF;
	Thu, 30 May 2024 14:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qg1AgW6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E81910E0BE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 14:24:36 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52b840a001dso137216e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717079074; x=1717683874; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A05XxoAt0LbeaH967nkgJpVk8uAg3uaftb22v/uUOsU=;
 b=Qg1AgW6qNIl2SLkBRuLluIyhVsvI41iG+Geop5/65JUYIeS6ielb+NAPb7XzJDPamb
 TEP758PIftAe6XV+Kpc13KDG2Wq4kAaEkIPXfgCuRoDVL8adfeP8CC05hWjcdMr7PZtW
 ZokPh/8+QFCr+CkXF0vyw06iMZsAp177dtoTL+pFoq4wS/cTXKzlcGVS5tNaJQeHIPvk
 HJFoSR04iXICURF8tuRjD3HnyNlGsU3mlDPC3xNmAWEeW+BeX1Iq4bAqXFfl01BfEe2C
 mILgHPkFjDoFun0sW8vQK0kFY8G48+Y8rT8hrByriLvGxyWxEZ6CmXn/H9r7Om6SDRKP
 jAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717079074; x=1717683874;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A05XxoAt0LbeaH967nkgJpVk8uAg3uaftb22v/uUOsU=;
 b=BdB+/pdnlFzs4ji6Ej6aOPqj6HlgTEYJKd+6evo6vwEzfj/OLrpbX8Mph/uf8S+qrA
 JjKd48mc6TnsnG59DTax2mO3UC4fmvDs7wDEZsp/+v6M1sN4DDxALH2aZoa3UX06g9bo
 gLXhA9LnVWFmlcqr68lAiSx7Hw1NJ/kZknZGI4UbEZ87z1O6kpHmP1jXqJKOxTqR0/Tx
 li2LhjHVkG2LEAW2C5BtAUjFVp9GXkxX+kYwp8bBR70EP2OKH/NrW2XhKDQH/w3ukD/f
 TcBfL/75hKbmez6bw0XzgIbVUX9zMg4QfN7PN4FcE3v4lL9+2qNc7Rjh4gUWY2O/PyFS
 xC7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXxA3iHun+WOG50o9vLoMOb34An7mQfPAt8PWoEzRcQBYCR201ASSXX8KiXBppW+eoi0+zW03iWVprMOIX/uqksbIE1gPyNULOPa6cawOB
X-Gm-Message-State: AOJu0YyogcWshFnQ/iDhQIliRJSYkHlL3MVVORxRNQ8KKQ9vESqeQmCl
 WZ+ZcLyV4yHJLUlj/lOwHp1bgwQnpE9CY70sjZkfRJyih80T8bc2upNvGWypzpg=
X-Google-Smtp-Source: AGHT+IF3IPCOHPkCufej0E3S4vIkJZN0bwr+uOjkvz4pFX2pYHg8b+tGuvTkupUA/Cc6jzgAiPesyQ==
X-Received: by 2002:a19:381d:0:b0:52b:8419:db27 with SMTP id
 2adb3069b0e04-52b8419db72mr77706e87.35.1717079072333; 
 Thu, 30 May 2024 07:24:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52970c3343esm1600677e87.214.2024.05.30.07.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 07:24:31 -0700 (PDT)
Date: Thu, 30 May 2024 17:24:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, 
 Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v2 1/9] drm/bridge: cdns-dsi: Fix OF node pointer
Message-ID: <mgl6dxypfj6mwzdj3l3xsb63vctxyoa3y32vuykzrojv5fuevr@akvrnmgdqwyg>
References: <20240530093621.1925863-1-a-bhatia1@ti.com>
 <20240530093621.1925863-2-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530093621.1925863-2-a-bhatia1@ti.com>
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

On Thu, May 30, 2024 at 03:06:13PM +0530, Aradhya Bhatia wrote:
> Fix the OF node pointer passed to the of_drm_find_bridge() call to find
> the next bridge in the display chain.

Please describe why, not what. In other words, please describe why you
have to pass np, no device's of_node.

> 
> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 7457d38622b0..b016f2ba06bb 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -952,7 +952,7 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
>  		bridge = drm_panel_bridge_add_typed(panel,
>  						    DRM_MODE_CONNECTOR_DSI);
>  	} else {
> -		bridge = of_drm_find_bridge(dev->dev.of_node);
> +		bridge = of_drm_find_bridge(np);
>  		if (!bridge)
>  			bridge = ERR_PTR(-EINVAL);
>  	}
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
