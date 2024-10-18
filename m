Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2CE9A42B9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCAD10E1F5;
	Fri, 18 Oct 2024 15:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hniycBZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EBC10E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:42:47 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso3365547e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729266165; x=1729870965; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+KgXWbwvllwNby9h+52CbnsES0Bs6ADGLxwcV6e+Fl0=;
 b=hniycBZJuP0iXShuJAdMuPSbDClCz+FEJyftX58bfTxUIB/oWOpvEHPDWN1j1dg69L
 UygFTC4ZzfJQMSebobfXKwEaWWAwsdXbJ/VIgZVsgXnIKqfA/UENLtsySaofCUXfgD/b
 T0y/7mbv0gt3hzOAbRTDGmkIGFoXKQ6xa23rHDNGWO0J8flswMHoHiupo1jKxhrjv2cC
 pLad01dnhHToeBKSPglvljVm3/up8cdXdGvIYFtIsQEoLujL8N/pObkjxwxF3hR9UZI6
 Ue0nifg+HwsjWddrlH67eKcbLMuUXY/71cECdT2Gcnq1JJ3jjw61dMrT92nUNIyQuFVF
 kr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729266165; x=1729870965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KgXWbwvllwNby9h+52CbnsES0Bs6ADGLxwcV6e+Fl0=;
 b=gMTtOpGgX+vzJSYt6Ms0HM5ND41uwQ2aRty2MtAIaUN2cVI3kN0eI9eyxZFJFTXuTK
 /JzDT917S28qgZFuaNC9mcr5d3igkCC4f+lNq0jIrjLDfpc4QDwqTjgrpBitH8GtTYm4
 mGgYXtEOXYESN1nkRBu5+919mvwVkfx8fbi7SuII2ygVjdzzBr8PwwOMRVn8a3v2LmK3
 R/XNliNvF7KZbxDuLrE+u9+/wC8+c5A0sKZoWbVSdBNYHsu6YFoeYxWZKHlDKbkt0UQg
 TYoqZY9OoEIzCtgA+8ZpS13Ha5KDg/cAo2pIU6ixWpOfIAI9jHmUtRfAK/niNdjm66Eo
 eSuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSGgJljN6gMtIL5Jlo0PKSlG1xXOrRuTSw5y9+wNoR/INzFHY5OWi3yyVcP31klhlzfNGGbMKtNB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl9xemtWVw2pIgGkDcdH6CExVUsh1FLZzwrDnXL2i0zmsAzK3C
 0hSN9eWNI8n7mFP0qRtR6U1t7f75+5rj5Q6UoIrsUTui1sQJga7ROv0aRwv/gUU=
X-Google-Smtp-Source: AGHT+IEeuuG9G4jzrfG5xEM36y99O8znV4/NgHPzm+CH9Ngivs41rsRud7DSIBgnjuOnHFbatE1NCQ==
X-Received: by 2002:a05:6512:1188:b0:539:8f3c:4586 with SMTP id
 2adb3069b0e04-53a154da832mr2978133e87.55.1729266165060; 
 Fri, 18 Oct 2024 08:42:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0e40sm248259e87.121.2024.10.18.08.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 08:42:44 -0700 (PDT)
Date: Fri, 18 Oct 2024 18:42:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, 
 Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge-connector: select DRM_DISPLAY_HELPER from
 DRM_BRIDGE_CONNECTOR
Message-ID: <3yqpyobkkvnan4fo5h3vx5jw5ke4zqoavo354rkw7h3frleurn@oag6vpmedaz6>
References: <20241018150850.3418359-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018150850.3418359-1-arnd@kernel.org>
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

On Fri, Oct 18, 2024 at 03:08:45PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The imx display drivers use the new bridge connector helpers but don't
> explicitly select CONFIG_DRM_DISPLAY_HELPER, leading to a link failure
> in rare configurations:
> 
> ld.lld-20: error: undefined symbol: drm_bridge_connector_init
> >>> referenced by imx-ldb.c
> >>>               drivers/gpu/drm/imx/ipuv3/imx-ldb.o:(imx_ldb_bind) in archive vmlinux.a
> >>> referenced by parallel-display.c
> >>>               drivers/gpu/drm/imx/ipuv3/parallel-display.o:(imx_pd_bind) in archive vmlinux.a
> 
> Move DRM_BRIDGE_CONNECTOR out of the DRM_DISPLAY_HELPER block and
> instead select that symbol indirectly.
> 
> Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I think a correct fix is to select DRM_DISPLAY_HELPER instead.

> ---
>  drivers/gpu/drm/display/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 0f07cf1483ff..beb05d9bab50 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -11,14 +11,15 @@ config DRM_DISPLAY_HELPER
>  	help
>  	  DRM helpers for display adapters.
>  
> -if DRM_DISPLAY_HELPER
> -
>  config DRM_BRIDGE_CONNECTOR
>  	bool
>  	select DRM_DISPLAY_HDMI_STATE_HELPER
> +	select DRM_DISPLAY_HELPER
>  	help
>  	  DRM connector implementation terminating DRM bridge chains.
>  
> +if DRM_DISPLAY_HELPER
> +
>  config DRM_DISPLAY_DP_AUX_CEC
>  	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
>  	select DRM_DISPLAY_DP_HELPER
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
