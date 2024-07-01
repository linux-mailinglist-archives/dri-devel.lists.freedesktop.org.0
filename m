Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88B91E99D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 22:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCF910E1E5;
	Mon,  1 Jul 2024 20:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DMF7p6ut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E2010E1E5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 20:32:28 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52e764bb3fbso4458067e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 13:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719865946; x=1720470746; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4Al+p7+Jx4QMS6ZRzOMzn7/IcRW4qS/ED9WAZRF5M0=;
 b=DMF7p6utm4EjOx9S2tV13Yp5GTdNAUgAD0DHi4ZkWHil4ZJo4lqA9t2a9WrcQ65pCo
 aiHuH6DbD4kMr+OPF6Qee1b/ZHPhfy4wXtfrD5RNdVsFHp4VdAaOrH6dFcHOm/ou3eh+
 SSUsbgtucJKnBTCKRJguiWU6QcoOvc7ezje72Nnl4ftJ+782eVrvjvUpDCFO9gBnn59Z
 DdomJvCTk5TpJqVxdvjMSib747YlivkX8rtMTrgQI6GtnqQxNDsk/afLNCP3F/ivu/bd
 pMqbknmzIIJmG41JY8WXxE4wC+iYlFzjkQzZqWjtSuBtjhQdtDOvplA6bDtpNPJr8LB+
 w/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719865946; x=1720470746;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q4Al+p7+Jx4QMS6ZRzOMzn7/IcRW4qS/ED9WAZRF5M0=;
 b=Dh//sJS599t3VVIMUjsk6cXdhI3yXmcEiRPvtL8ZZDqaJqjpbvYQA7v1ZNOaBBnngT
 BkDbRUJdczw2CahFUwvCAKoKwxWwlmBHYGYOcPdY4F44eqcC0Art0z8NzfqhpbgNg7AR
 rXkrEYlXMuWaiDXlI2VYYXuSeZbERZbPxoLXRsppX4MZCzgj/0YgoRxomk+EsSPO5xhv
 EioGQ+KcmRWjoCvfBPdsGfHg33wxzyQ1D9gCAPqGLjHGR39ux/8EmWkKS18EhZ/DH6c0
 zETjPBm96Z5Mli3+v8wQaUp+N8+E52h9HlInBoyc85rzCG/pK8tSkb9759FXVJsKeeYY
 UzqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIYwyZfAPojEFVsbm/o3wYu3l/gs86mrqKunWDmIxeCdRzddmAlZtyh7bzUg4UNtNqYBeTeUCm8KSaKwwCeqYK4NAczFpNyUOpMeFe7E1B
X-Gm-Message-State: AOJu0YxGjLUhL401zjRJCn1GTVWEK1d808m+pdU/aDX3EUnWDN2IKb2p
 A5JTKuiKWLluh9iEbmsvTaHBsyVaPIsC9TEHy+dIT5KXZmlvNLFzQJPB18tY2aU=
X-Google-Smtp-Source: AGHT+IFJr9iphLbm2TbLxdU2q9eLCNITZS5yDZ612pI0Pqk94QNI9OpKhvGgRjiFMmsb1ZR/me6Rwg==
X-Received: by 2002:a05:6512:2312:b0:52c:7fe8:6489 with SMTP id
 2adb3069b0e04-52e8273e4a5mr4495138e87.63.1719865944333; 
 Mon, 01 Jul 2024 13:32:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab2f77dsm1528020e87.229.2024.07.01.13.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 13:32:23 -0700 (PDT)
Date: Mon, 1 Jul 2024 23:32:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 6/8] drm/panel: add driver for samsung amb655x
Message-ID: <37y25ko7q2hoqlzvteqt3cj2lsms3lkwi6xu6qm4xaq5gm6pus@lxh4jo4hpryv>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-6-c4a1f8da74f1@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630-oneplus8-v2-6-c4a1f8da74f1@postmarketos.org>
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

On Sun, Jun 30, 2024 at 08:36:29PM GMT, Caleb Connolly wrote:
> This is a 1080x2400 120hz panel used on the OnePlus 8T. It uses DSC but
> with many non-standard DCS commands.
> 
> The only user of this panel (the OnePlus 8T) has a bug somewhere in the
> DSI stack whereby it isn't possible to properly initialize this panel
> after a reset. As a result, the reset GPIO is made optional so it can be
> left unused on that device.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-amb655x.c | 399 ++++++++++++++++++++++++++
>  4 files changed, 416 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 807feae089c4..2b9cfbf92d7a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7142,8 +7142,15 @@ M:	Robert Chiras <robert.chiras@nxp.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
>  F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
>  
> +DRM DRIVER FOR SAMSUNG AMB655X PANEL
> +M:	Caleb Connolly <caleb@postmarketos.org>
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-amb655x.c
> +
>  DRM DRIVER FOR SAMSUNG DB7430 PANELS
>  M:	Linus Walleij <linus.walleij@linaro.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index bf4eadfe21cb..7203d16ab20a 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -590,8 +590,17 @@ config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
>  	depends on OF
>  	select DRM_MIPI_DSI
>  	select VIDEOMODE_HELPERS
>  
> +config DRM_PANEL_SAMSUNG_AMB655X
> +	tristate "Samsung AMB655X DSI panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  DRM panel driver for the Samsung AMB655X panel.
> +	  This panel has a resolution of 1080x2400 @ 60hz or 120Hz.
> +
>  config DRM_PANEL_SAMSUNG_ATNA33XC20
>  	tristate "Samsung ATNA33XC20 eDP panel"
>  	depends on OF
>  	depends on BACKLIGHT_CLASS_DEVICE
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 051b75b3df7b..be6d500a56a4 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -58,8 +58,9 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
>  obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMB655X) += panel-samsung-amb655x.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o


> +static int samsung_amb655x_prepare(struct drm_panel *panel)
> +{
> +	struct samsung_amb655x *ctx = to_samsung_amb655x(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	/*
> +	 * During the first call to prepare, the regulators are already enabled
> +	 * since they're boot-on. Avoid enabling them twice so we keep the refcounts
> +	 * balanced.

I see your intent, but I don't think this is fully correct. If the
driver gets rebound, then it will perform one extra disable call. On the
next driver probe / enable / disable / remove cycle the driver will
perform one more, underflowing enable count. I think
regulator_init_complete_work_function should give the phone enough time
to boot the panel.

> +	 */
> +	if (!regulator_is_enabled(ctx->supplies[0].consumer)) {
> +		ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +

-- 
With best wishes
Dmitry
