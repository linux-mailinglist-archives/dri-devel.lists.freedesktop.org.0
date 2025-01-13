Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71984A0B33A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B8B10E5EB;
	Mon, 13 Jan 2025 09:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wlZfaIhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF8510E5F1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:40:55 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5401ab97206so4041546e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736761253; x=1737366053; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QPGy88lShMHMCPmpUNNrPTEFn657GlE5NpDRqXJDLD0=;
 b=wlZfaIhH4dQ9FX4+13T9uC1v/CHV/mMO09iUVX9AK2y0wr049y1dSHDYuocHGjaxzX
 GGbJ9xQFpCXzQOI1MNOJ5H/AC4lTpfbNJkqwmDuAvxwKupHJaxCmL+YMnqjXfI1cYmVW
 wWgK6AtxDPV6zJ5JDVKu32kYQDdDM6XD8Ym5vPVXFBVSQsRDJrvFAhtWolxJe4hkhx1d
 cYwKcunQtHnzGKEhtTdWYmghCLTj0f+a1HRBZApHndSTpWrRGBf4Kv+7MGIglBC04g+H
 a0BsqOsU0E8g2SFpT+PE8hhJFYerx9JYZFS7qOo0Sk75ZqzxUyPpNuRlcqT/lQK2QQqd
 ktGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736761253; x=1737366053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPGy88lShMHMCPmpUNNrPTEFn657GlE5NpDRqXJDLD0=;
 b=eCfnyy3bo+BVZpVejEI6c78S5p439xAwPZPNvpKwR5C+A/XV6jxtoiCwHaA3buiukp
 Wpj0eV4861cM/nugqgSEtjzSonsxx9O/xc98KIhfKLaYC03K2Z+kEcgTgSkwcnkL97SN
 LjWw06BtBuzwuNFw11bACIGAXZJia9V9hQUwzF9b4OSbt5N06keIJ56/2BQx6OGUNQw5
 Ruub3YTqn2odKEHrmy9XeYj4WQcuA+DvvGfcEnpWZrZ0gUAStI4mafGjPWUzYY5qDlJA
 8kONoDDcjfTdInBDEEJFu6ZxC7z+eK17Bth6sfG+ReJvD+6ZCilPI64xSJG8/ms/cgDY
 RMgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKRBp3THmFwIRt1FILpzX5tSQUNAtSV/wbNpU0+ryAR7QwSvFgjTyZMDn/8lFBjU/SMLqZasFTM3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmM4sOvwaaf+PduNcncu1369u5dukOdayHQ57Kd6v8dgO3DQHL
 RyCyQu501xt1XBvQeJmIYc5D4P4j3U9RVnLx6MnwQ4D3HPxXgLyo5DioJR3tPcs=
X-Gm-Gg: ASbGncvOKO0wI04iSviXbXNcVWQt2Pa56nUASp2CAKPycGyIAhaj53/N2psrC9fFvXK
 ISl79Cv2jss4g0CZ8xU2p9htMR7A2zVOHFPVD+KLsLUWvDA1p+EQmV4VtToK8p9fx3Rrwchhua/
 FYbmGshBZCL+QGf6rzZmhm9ElXY1VGQHNWNqdahAiZWOhtBf5SIcJPlfYSzEPHsGuPiJvuTfiUo
 Ye3IOpGZVKDgk463qJqtGmOeKUi7s/3TMZVW0sZbgZ9UL3IDapEtuWuBHzhChdGTgJSFfDFiQje
 daOC0lkrGYtfMCiHNgEvPAR4woR1L5A+jeKs
X-Google-Smtp-Source: AGHT+IFzGsd+JkICyZyhVJO+BeNkOf1L3mENeLBgXt9RsgHxsZTZdNSiwHlIx0KDkR2c8IGIrx9rjA==
X-Received: by 2002:a05:6512:3b14:b0:542:9757:d5de with SMTP id
 2adb3069b0e04-5429757d833mr2482317e87.22.1736761253466; 
 Mon, 13 Jan 2025 01:40:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6ab4sm1286609e87.145.2025.01.13.01.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:40:53 -0800 (PST)
Date: Mon, 13 Jan 2025 11:40:50 +0200
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
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 05/12] drm/bridge: cdns-dsi: Fix the clock variable
 for mode_valid()
Message-ID: <urkosp5w2ush3br6xvxx3vpxvkea4tmaeas3vvlcb54ofknjat@tnievb37sfx4>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
 <20250111192738.308889-6-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111192738.308889-6-aradhya.bhatia@linux.dev>
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

On Sun, Jan 12, 2025 at 12:57:31AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> Allow the D-Phy config checks to use mode->clock instead of
> mode->crtc_clock during mode_valid checks, like everywhere else in the
> driver.

Please describe why, not what.

> 
> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 3b3c45df1399..9c743fde2861 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -568,13 +568,14 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
>  	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
>  	unsigned long dsi_hss_hsa_hse_hbp;
>  	unsigned int nlanes = output->dev->lanes;
> +	int mode_clock = (mode_valid_check ? mode->clock : mode->crtc_clock);
>  	int ret;
>  
>  	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg, mode_valid_check);
>  	if (ret)
>  		return ret;
>  
> -	phy_mipi_dphy_get_default_config(mode->crtc_clock * 1000,
> +	phy_mipi_dphy_get_default_config(mode_clock * 1000,
>  					 mipi_dsi_pixel_format_to_bpp(output->dev->format),
>  					 nlanes, phy_cfg);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
