Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95265A29F3D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 04:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D93110E415;
	Thu,  6 Feb 2025 03:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sXXS0Voi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C44F10E415
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 03:11:39 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5426fcb3c69so390790e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 19:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738811498; x=1739416298; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=riZEsBjGD+WMkPhrq6w9Y2zbnt1QJbZcmX3HYuho+5I=;
 b=sXXS0VoioOjU0KsWoBmbDaI/1kKH9t6OKFzBLm8pfY5dpmFkjF6MgTJ9T83bgu9MW5
 3JGOzrCaIxx26biRdf4XVKVSze2tyGRnywAIXnePbYOaS1tWz9njNSwDaFacBcE2ihk7
 6fmrpI775JmsuohygyI0iJ9Xvlq31pVTiJw38a27l6MwksSZkydNHsLnJFwz6UlKVRzZ
 B90CHJXspXXbaGVpnp71icWV+/b0dQat7OLGV4/FTC3L7qK6nyfdIfiJvSsBG8d2i/Ut
 z1h2cNVNjLxH/YfgoG3szjXsDqrhaCoFmzcbwv0OsK4hAHRSH98pdbB1556yAbdaNwrn
 e/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738811498; x=1739416298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=riZEsBjGD+WMkPhrq6w9Y2zbnt1QJbZcmX3HYuho+5I=;
 b=E/v5vUQdBPhWcKq+RhZA9nNg0ht7wT/bfo2l0ccXxNF+lbIPaaYJkgX3awV9t3XMB0
 VKW5/hgFPT7Uz+2ihdGbtSrcYpmZnnhQK28wPGtoYGqp3WnoLCATLPzQ0/xa8LCPBZsw
 CFpfh34R0s0pg3YBBKLX0RAwUQnqvQBfZTmgw/XLjaNJkeQNkxX9KUjgUVyT84urV+v6
 UyXv9zzonOAg71bi3rILAR2WMI9QIBo2nwWtGHDSeki/3k04sp14mc4PpfLSgxgUp0I/
 3AEWBgQrxLzPsh8Nk98+GBdQwQAeJsczZNn5ORr1WcFTTvHzNWn0FlOV7qiY7bkbdsVs
 Strg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe3KB+9dLaT7/Jz89oOBYH9nQoPUBV90I0cQNZfPEfJcEtzNnvZ9ej6lZRIvbSTBGI/ejICRAiriA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrBF3pJJM/jnrCxD8HRcXaKIuxTCarrZMJRVD5nUiBzn4jodwc
 2rzdEuhb3wvHbHdpveWJzaDCieQBww/X4Pm9WuDKQEImnewyzlDsfPB51zZgbuw=
X-Gm-Gg: ASbGnctYIl1Cg/8P9EEYkrgfgx9hLfMJW/4Rnyy59tztcnKRJATKzhU4FxNBWytpTza
 vt2pzcPfitYZnDR8E/KYTj7L5tlluIqNDYq0yRcWqK3yRdwZqoyZkJOS/cSbxJT+o5wVT6dLfxa
 vIBZ3+4gRVrvlylyc8jZA1Ktf3ydubEge8NfTqFYYll6R+lk5asNK1nJIXS4G09PoFplHFs+yWf
 ZQYHDiel+fr7i96m7Hcq4NryJXPt1T6KYTMrw9LqjGgD0LUdZKLvhhyNq4FtpoWkBjQmRjtQfU2
 vl0JtE+a7bG95eX/TUPIax4f/8ST+Jhu3j3ZV4sNJ3jeueBlnrF6baDGss+WbofIEhQamb8=
X-Google-Smtp-Source: AGHT+IG7cQyWk5BClZUOKBlAbFSkmSlCgj+5e1lmNN+0LsHPGyFIdpVIo0QGlnaSeGvuHE71RAIFfQ==
X-Received: by 2002:a05:6512:3f07:b0:542:2a29:88ed with SMTP id
 2adb3069b0e04-54405a68aecmr1721549e87.44.1738811497642; 
 Wed, 05 Feb 2025 19:11:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105f336dsm20237e87.201.2025.02.05.19.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 19:11:36 -0800 (PST)
Date: Thu, 6 Feb 2025 05:11:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v5 3/5] drm: panel: Add a panel driver for the Summit
 display
Message-ID: <jubbid3i7revhr4dg2dp6mbnja3yvrndwncppfx66ftnryx47d@q645nyfiaav4>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>
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

On Wed, Feb 05, 2025 at 11:10:52PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This is the display panel used for the touchbar on laptops that have it.
> 
> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig        |   9 +++
>  drivers/gpu/drm/panel/Makefile       |   1 +
>  drivers/gpu/drm/panel/panel-summit.c | 132 +++++++++++++++++++++++++++++++++++
>  3 files changed, 142 insertions(+)
> 
> +
> +static int summit_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode = drm_mode_create(connector->dev);
> +
> +	connector->display_info.non_desktop = true;
> +	drm_object_property_set_value(&connector->base,
> +				      connector->dev->mode_config.non_desktop_property,
> +				      connector->display_info.non_desktop);
> +
> +	mode->vdisplay = 2008;
> +	mode->hdisplay = 60;
> +	mode->hsync_start = mode->hdisplay + 8;
> +	mode->hsync_end = mode->hsync_start + 80;
> +	mode->htotal = mode->hsync_end + 40;
> +	mode->vsync_start = mode->vdisplay + 1;
> +	mode->vsync_end = mode->vsync_start + 15;
> +	mode->vtotal = mode->vsync_end + 6;
> +	mode->clock = (mode->vtotal * mode->htotal * 60) / 1000;
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	mode->flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC;
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +	return 1;
> +}

I think most of the drivers store mode in a static var and then use
drm_connector_helper_get_modes_fixed(). It's a matter of taste, but I
think the latter one is a nice helper.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +static const struct drm_panel_funcs summit_panel_funcs = {
> +	.get_modes = summit_get_modes,
> +};
> +

-- 
With best wishes
Dmitry
