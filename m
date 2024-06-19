Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EDF90E38D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D628A10E96A;
	Wed, 19 Jun 2024 06:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fhtke891";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A9310E98B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:36:11 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ebe3bac6c6so68123761fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718778970; x=1719383770; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uVe6/63goKRJc4R8R3+P3luYhbqw7SbXR8og83jLJns=;
 b=Fhtke891RSWSE1q0hY+29kPIipIOXZOeONyujampK4gyHzwzEC8DD5xLjR2IpawTfx
 RQWjMPRIG/lYMPWvxRkciMD13PrqgFDROx1dcaOJaBo/NKeWA465q7ZLS7eWCr1LvmX+
 pI/yHXfxAFhHXgTpALRN6cHz+BmMmY6fj0hiovPC1hK1X1v/OSP3q0+AYjSSGaBx15xA
 yvJ2JR6zKwHhN8nzv3YmpxaPDMb06h9I8XW4L0+5q73ZcBN7LmRIeRDzxlbScwn8lCF0
 xuzzFO92zuLKLA4ABS7ET0GaI9VnLGbGN32uD+x6KYfTw8mZzXu1afCjrAKrZxAsWYuk
 sRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718778970; x=1719383770;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uVe6/63goKRJc4R8R3+P3luYhbqw7SbXR8og83jLJns=;
 b=OumAQFcnwM98ThvtYHAvhpWlopprzCGOD3p8+81SzjK+GGptVNUT0Q2datGV4p38Qw
 sy+GqXVBljte7a2zcgRUo8sVo1KXtS57HoSufzlXbRnclZwD33D9Zy0UW0HtteI7/jp+
 Zv+ELac5Z4emTmZwd1qWBv0vxwI2vu7tPqcsXYoiHUsRhvE9DsK2x/64OiaXnUktC/7P
 jk10NMvGJCbUuJMrh5IvKrkZDG53Pn3CC418keJ2En+CRUjlVbEjTC0jzGJMj9bGHhN3
 ytQEV47aZkxJ31l0oPnnJUIYxfTkna6YCLfPF1GxCVWG8Y+x3OhdkLJ0Wh9xdKZVIH6B
 aOgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUryWZ2P+Q3ARP9ejRUwNoEf0Hg1kExTr1yAVIJBrqTSdi6L/uPYyUFZvQxM3qKFGbs/iA6y7SZ4m0QtI55zCGILFxBZGr/SktC7HptfA/G
X-Gm-Message-State: AOJu0YxThqYClMsLLMOHTGlVM1nSc6PzWbayFJuMwJASxKPC1Wzu0AGA
 aV74LG+85LqbqnHniuz+jw9M8Y8BTnfsB+bFewskwfUukk0q7xHx1E3b3COtGCc=
X-Google-Smtp-Source: AGHT+IF72d/eavTJNmZHcMAbqdvAOzyYjLq/Z4SHC58ho5mI8wxqnh64eI3iH73hmEqWAqOH7y90DQ==
X-Received: by 2002:a2e:be8c:0:b0:2ec:3dd4:75fa with SMTP id
 38308e7fff4ca-2ec3dd4770cmr9609411fa.44.1718778969928; 
 Tue, 18 Jun 2024 23:36:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c07012sm18890531fa.48.2024.06.18.23.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 23:36:09 -0700 (PDT)
Date: Wed, 19 Jun 2024 09:36:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 dianders@chromium.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
Message-ID: <mozxxkpqlboh2w7bf55bezgcy5b2jfgepmgullgd24dtmwfva2@mghwg3c5an5y>
References: <20240619033351.230929-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619033351.230929-1-tejasvipin76@gmail.com>
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

On Wed, Jun 19, 2024 at 09:03:49AM GMT, Tejas Vipin wrote:
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introduce
> mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> raydium rm692e5 panel.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Change rm692e5_on to return void and take mipi_dsi_multi_context
>       as an argument.
>     - Remove unnecessary warnings.
>     - More efficient error handling in rm692e5_prepare
> 
> v1: https://lore.kernel.org/all/20240615093758.65431-1-tejasvipin76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 237 ++++++++----------
>  1 file changed, 99 insertions(+), 138 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> index 21d97f6b8a2f..9936bda61af2 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c

>  static int rm692e5_prepare(struct drm_panel *panel)
>  {
>  	struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
>  	struct drm_dsc_picture_parameter_set pps;
> -	struct device *dev = &ctx->dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>  
> -	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> -		return ret;
> -	}
> +	dsi_ctx.accum_err = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (dsi_ctx.accum_err)
> +		return dsi_ctx.accum_err;

int ret, please. Let's leave dsi_ctx.accum_err for DSI errors only.
LGTM otherwise.

>  
>  	rm692e5_reset(ctx);
>  
> -	ret = rm692e5_on(ctx);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> -		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> -		return ret;
> -	}
> +	rm692e5_on(&dsi_ctx);
>  


-- 
With best wishes
Dmitry
