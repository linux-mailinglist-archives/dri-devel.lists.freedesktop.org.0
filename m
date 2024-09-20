Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7900297D858
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 18:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0226310E84A;
	Fri, 20 Sep 2024 16:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KDdI8n1J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6A510E84A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 16:29:36 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53654e2ed93so2748255e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726849774; x=1727454574; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KfditimrKF4JK7u3yX1xKfHCsL9hDUk5eltnda23Uak=;
 b=KDdI8n1JE/TdqLmw4++iulJc2VyNkQiVVM3+OCGoFPmPEgiKbjBGAVQB/TcbXBUdhb
 RxnpYYOndKK1V6VvKjpOXFLk2KnhbJCsL6Xoof7YaOPKOCHJqK7Tw+YoKxoVXT5eH4+z
 2StGT2gaseeDFjMGpDMS3ZOJo1KZ0cbCX4r/gWJYMx6Cjel+l6kTH/pEykF0It3iU4IA
 VaQCNt8suEQOaYSQziXd1U+3uE0kdLKIU1iW91vQMLkcQIJiqMMEdkCaz3XZuleJWAho
 zQmEAiRUyLF12wuA/CK6k/ulacXZn+cG2Azkcbv6QVUqXoLVmdev8VLE6zFZAZaNliJj
 T/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726849774; x=1727454574;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfditimrKF4JK7u3yX1xKfHCsL9hDUk5eltnda23Uak=;
 b=K69B3L/TiW4gvVhBENo2sZnjoe8K8FiUkekeUXHWwvGeWmf6rt2Y9rBeBBWwoRWiFE
 E9wKiv/pbkxaerPcXoxtkay/I6WGvT4TVWJAGgvoCSwU/rY2Msx5/oxnRiGs35M5QT2K
 BjHV+yIULzTJ++Sew7n4QGOMYErrShfCMLSMndIJloMogeRR00VwDS23MDq8NoCzwPuu
 ijuLD2ayv3EkQcIBi6h4MAbvbyRpwFtYWNaFV01bRgTFQt1fda3j6jCYqkLuh0bo+ub8
 lJAJulbABO4aDNEWXnoax/a1gJBbEqTeKzCpP5H0engcNv01n4FQNF2Qan/1xJEvs74H
 IqIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc728pZGwpvAgj5lVEY5FK1e+c1gscB9ecGu5PJm205uUl117bQySCKEjDX7o9ZDy2VH5WB6gueMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCVFYlK6uFxIkxhRDYSnjvlOROFduSFcmXc4Zemy8L6Yye3u6I
 jT2I8dOQQ6dlLzhKM2r3KsBYM5EiIzlFg1Hayy5VqIENJBJR0TlNIz7A6Sb7YBk=
X-Google-Smtp-Source: AGHT+IE1LZCxErRgPXK8fC0M6EtENAw/5XRWiIO/oy6Uyv8AOGscn4kh6HaF6ktB+yZZ3J0CygZZ2Q==
X-Received: by 2002:a05:6512:3087:b0:52e:91ff:4709 with SMTP id
 2adb3069b0e04-536ad161af5mr2458077e87.21.1726849774195; 
 Fri, 20 Sep 2024 09:29:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a8700sm2240915e87.221.2024.09.20.09.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 09:29:31 -0700 (PDT)
Date: Fri, 20 Sep 2024 19:29:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: elida-kd35t133: transition to mipi_dsi
 wrapped functions
Message-ID: <c3wv3r44cmua2hphyjqzb7pp2a32pvs6svcj6s2zohp77qn3cr@4iica7j5bx5l>
References: <20240917071710.1254520-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917071710.1254520-1-tejasvipin76@gmail.com>
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

On Tue, Sep 17, 2024 at 12:47:10PM GMT, Tejas Vipin wrote:
> Changes the elida-kd35t133 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 107 ++++++++-----------
>  1 file changed, 45 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index 00791ea81e90..62abda9559e7 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -50,55 +50,45 @@ static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
>  	return container_of(panel, struct kd35t133, panel);
>  }
>  
> -static int kd35t133_init_sequence(struct kd35t133 *ctx)
> +static void kd35t133_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>  {
> -	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	struct device *dev = ctx->dev;
> -
>  	/*
>  	 * Init sequence was supplied by the panel vendor with minimal
>  	 * documentation.
>  	 */
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POSITIVEGAMMA,
> -			       0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
> -			       0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_NEGATIVEGAMMA,
> -			       0x00, 0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
> -			       0x4d, 0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL2, 0x41);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_FRAMERATECTRL, 0xa0);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
> -			       0x20, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_ADJUSTCONTROL3,
> -			       0xa9, 0x51, 0x2c, 0x82);
> -	mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);
> -
> -	dev_dbg(dev, "Panel init sequence done\n");
> -	return 0;
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POSITIVEGAMMA,
> +				     0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
> +				     0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_NEGATIVEGAMMA,
> +				     0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
> +				     0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_POWERCONTROL2, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_FRAMERATECTRL, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
> +				     0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, KD35T133_CMD_ADJUSTCONTROL3,
> +				     0x51, 0x2c, 0x82);
> +	if (!dsi_ctx->accum_err)
> +		mipi_dsi_dcs_write(dsi_ctx->dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);

Please use mipi_dsi_dcs_write_buffer_multi() instead.

>  }
>  
>  static int kd35t133_unprepare(struct drm_panel *panel)
>  {
>  	struct kd35t133 *ctx = panel_to_kd35t133(panel);
>  	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
> -
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;
>  
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>  
> @@ -112,18 +102,20 @@ static int kd35t133_prepare(struct drm_panel *panel)
>  {
>  	struct kd35t133 *ctx = panel_to_kd35t133(panel);
>  	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  
>  	dev_dbg(ctx->dev, "Resetting the panel\n");
> -	ret = regulator_enable(ctx->vdd);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to enable vdd supply: %d\n", ret);
> -		return ret;
> +	dsi_ctx.accum_err = regulator_enable(ctx->vdd);
> +	if (dsi_ctx.accum_err) {
> +		dev_err(ctx->dev, "Failed to enable vdd supply: %d\n",
> +			dsi_ctx.accum_err);
> +		return dsi_ctx.accum_err;
>  	}
>  
> -	ret = regulator_enable(ctx->iovcc);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
> +	dsi_ctx.accum_err = regulator_enable(ctx->iovcc);
> +	if (dsi_ctx.accum_err) {
> +		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n",
> +			dsi_ctx.accum_err);
>  		goto disable_vdd;
>  	}
>  
> @@ -135,25 +127,16 @@ static int kd35t133_prepare(struct drm_panel *panel)
>  
>  	msleep(20);
>  
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
> -		goto disable_iovcc;
> -	}
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 250);
>  
> -	msleep(250);
> +	kd35t133_init_sequence(&dsi_ctx);
> +	if (!dsi_ctx.accum_err)
> +		dev_dbg(ctx->dev, "Panel init sequence done\n");
>  
> -	ret = kd35t133_init_sequence(ctx);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	if (dsi_ctx.accum_err)
>  		goto disable_iovcc;
> -	}

Move this after the last mipi_dsi_msleep(), merge with the error
handling.

> -
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
> -		goto disable_iovcc;
> -	}
>  
>  	msleep(50);

mipi_dsi_msleep()

>  
> @@ -163,7 +146,7 @@ static int kd35t133_prepare(struct drm_panel *panel)
>  	regulator_disable(ctx->iovcc);
>  disable_vdd:
>  	regulator_disable(ctx->vdd);
> -	return ret;
> +	return dsi_ctx.accum_err;
>  }
>  
>  static const struct drm_display_mode default_mode = {
> -- 
> 2.46.0
> 

-- 
With best wishes
Dmitry
