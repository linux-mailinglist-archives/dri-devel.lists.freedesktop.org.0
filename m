Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA033932ECE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 19:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B1410E821;
	Tue, 16 Jul 2024 17:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l5lyl1Zg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB7110E7F2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 17:01:20 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52ea34ffcdaso6221099e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721149278; x=1721754078; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ojyLoEn72jNNSfiPNc8alfjrCiqwwyPI9yuQ8RPWAmY=;
 b=l5lyl1Zg6kO4CdxzUk6MoeOiNgF5c/fkWv/OBCVufAcbbrCtNxH7fu1mIh7MTGfJBJ
 zzsK4f5BomrfeI467jF87ukb6f+R3AHTEN4mvaVPKDJ85CuKiDsMRbD8UnWuCOBFLTNU
 RdiTDmoBtL4+UXOEQ7A4gDkuY+fZMzbx0GC5Z88E3a1Rw85d+/BWeN/hTee0EhO6Ffxu
 TTbmOGuWFWjX6PZnSm2X5KlaPlcta4oLvddnDEw3NN3DLxqfzohWC2IuISWQcRzTJNi5
 phvNmOHY29pft3GDeh4cwPOAOCEqqT62rPETxOLYvPSjQmEJr+6qvjbj+plvl4wioGq/
 Iirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721149278; x=1721754078;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojyLoEn72jNNSfiPNc8alfjrCiqwwyPI9yuQ8RPWAmY=;
 b=qIw6jwe7l4EUiBaSIIqgTLvB05mLQYADPZdybhj3cXRS4lOP4fmcU2rsXDbc6NPVnp
 ysPK2Ili3a2iVKJ1QRvtZCr/szCg39KvlVzmtyatbm8r8neok2eqUGldnNp/9JW1Ovrk
 xinxIMTjQAmcjUMExI82/pkYhCwKa8kWuPMG05iK8emvN1eINinuzgkUk7lk0vTDp2Ga
 mN8/z4fexjXnnEbPshLW7GZZof4ErC/f6IH/vaMYvB5iFuCQci1z7G/DLVG90s/BMU79
 VF/OQAQwKtmMGjo1L26/Fl+NxgqFTTY5tFxxFqQW+h3NBQzrT4sp499dsZYv+hLVKsLz
 qlaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoNQx8xKnD1yv+BvXkWz2fnKFinmidKGV5E1PiR5op3biyXjTBCnB8ZRlxRGNDnTTkbYwTpjO3tQjC8RbhsQMhFjnoQ9Bfu4F6lY0fPR0j
X-Gm-Message-State: AOJu0YzsdiDPDA3gyKxIGrM8fmHeSzyHwDkbiXGx150xP5s4k3aQjLkm
 UlrzOoRnyMZOye4/ii/1aNYYnJHuVwp9/l0jX+lcg8T4onBO85a9vgTJJukpDT4=
X-Google-Smtp-Source: AGHT+IHiCpiwO8rjZ0htUoeJgpfV/+P+mkbfZbe70bQAoD70zJuFqjvQXKFf8ezzilfK8kEIP12apg==
X-Received: by 2002:ac2:4c52:0:b0:52e:9762:2ba4 with SMTP id
 2adb3069b0e04-52edef1eb90mr2131099e87.25.1721149278075; 
 Tue, 16 Jul 2024 10:01:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed252d6cesm1197833e87.149.2024.07.16.10.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 10:01:17 -0700 (PDT)
Date: Tue, 16 Jul 2024 20:01:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mipi-dsi: Introduce macros to create
 mipi_dsi_*_multi functions
Message-ID: <p7fahem6egnooi5org4lv3gtz2elafylvlnyily7buvzcpv2qh@vssvpfci3lwn>
References: <20240716133117.483514-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716133117.483514-1-tejasvipin76@gmail.com>
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

On Tue, Jul 16, 2024 at 07:01:17PM GMT, Tejas Vipin wrote:
> Introduce 2 new macros, DSI_CTX_NO_OP and MIPI_DSI_ADD_MULTI_VARIANT.
> 
> DSI_CTX_NO_OP calls a function only if the context passed to it hasn't
> encountered any errors. It is a generic form of what mipi_dsi_msleep
> does.
> 
> MIPI_DSI_ADD_MULTI_VARIANT defines a multi style function of any
> mipi_dsi function that follows a certain style. This allows us to
> greatly reduce the amount of redundant code written for each multi
> function. It reduces the overhead for a developer introducing new
> mipi_dsi_*_multi functions.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 286 ++++++++++-----------------------
>  1 file changed, 83 insertions(+), 203 deletions(-)
> 

[...]

> -void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
> -				    enum mipi_dsi_dcs_tear_mode mode)
> -{
> -	struct mipi_dsi_device *dsi = ctx->dsi;
> -	struct device *dev = &dsi->dev;
> -	ssize_t ret;
> -
> -	if (ctx->accum_err)
> -		return;
> -
> -	ret = mipi_dsi_dcs_set_tear_on(dsi, mode);
> -	if (ret < 0) {
> -		ctx->accum_err = ret;
> -		dev_err(dev, "sending DCS SET_TEAR_ON failed: %d\n",
> -			ctx->accum_err);
> -	}
> -}
> -EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on_multi);
> +#define MIPI_DSI_ADD_MULTI_VARIANT(proto, err, inner_func, ...)	\
> +proto {								\
> +	struct mipi_dsi_device *dsi = ctx->dsi;			\
> +	struct device *dev = &dsi->dev;				\
> +	int ret;						\
> +	\
> +	if (ctx->accum_err)					\
> +		return;						\
> +	\
> +	ret = inner_func(dsi, ##__VA_ARGS__);			\
> +	if (ret < 0) {						\
> +		ctx->accum_err = ret;				\
> +		dev_err(dev, err, ctx->accum_err);		\
> +	}							\
> +}								\
> +EXPORT_SYMBOL(inner_func##_multi);
> +
> +MIPI_DSI_ADD_MULTI_VARIANT(
> +	void mipi_dsi_picture_parameter_set_multi(
> +	struct mipi_dsi_multi_context *ctx,
> +	const struct drm_dsc_picture_parameter_set *pps),
> +	"sending PPS failed: %d\n",
> +	mipi_dsi_picture_parameter_set, pps);

I'd say that having everything wrapped in the macro looks completely
unreadable.

If you really insist, it can become something like:

MIPI_DSI_ADD_MULTI_VARIANT(mipi_dsi_picture_parameter_set
	MULTI_PROTO(const struct drm_dsc_picture_parameter_set *pps),
	MULTI_ARGS(pps),
	"sending PPS failed");

(note, I dropped the obvious parts: that the funciton is foo_multi, its
return type is void, first parameter is context, etc).

However it might be better to go other way arround.
Do we want for all the drivers to migrate to _multi()-kind of API? If
so, what about renaming the multi and non-multi functions accordingly
and making the old API a wrapper around the multi() function?

-- 
With best wishes
Dmitry
