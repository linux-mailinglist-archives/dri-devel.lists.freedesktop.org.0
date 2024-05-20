Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB88CA3A3
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 23:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED28B10E951;
	Mon, 20 May 2024 21:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FnsJgQy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760BB10E951
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 21:03:11 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so4142657e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 14:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716238989; x=1716843789; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Cm4Rhnu8lOyImTNbzRIO+UM4NpeJTPsWwT+r/+KLIwk=;
 b=FnsJgQy8dhnIBSoA3QpsqpcbTJrh6y08Amue/v5pxLEIUoLG44IG4jkNrjzpgNZqJc
 lB38hxSOjUSI/F5hUfY4mvlr5o5ID3c3w403bK3tMqBr7mPVGNeLvFSG5sbRqzJGZt3M
 +ygQ5WQGaE//QksWWg8xLj1GQTIwPIUyU6D5q3ftYbtHCG+KrqwAnnJnfk2ERhNt0vAj
 ZwwVLnjoUS+0+gm2ZSgyDup4M+oyKQz3lBGXnuB4z9cqfQPHZe+DcPsC86GQQ/ss4qhs
 ZIhCFiO4ORS8EYr4kZ/sWjsA5VQIXjMM6gO30BW8EZkcxuVGIg/zXG2eohrBl4EAOOdr
 ZxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716238989; x=1716843789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cm4Rhnu8lOyImTNbzRIO+UM4NpeJTPsWwT+r/+KLIwk=;
 b=U7n1IQzu/b9ZaI4GORpOxqN3E1EemirzdJYT/gv7mHDculeLgcZppovhkUTGj6zJDs
 bvF35GPlg3jLMwrCtTwSb5MrOkkM8ihtudO7gMgeGb0NLEoc9K4U4XG1qW9A2jJ/cSuZ
 yw2Ll222hew+b/VTiDS9vK4F+fBYKLHc0D/TfeMpEmLRaAXJ/ab+WF7P5QSgH5oA4CSh
 ZZ4I0MdhQPumkjk24pgFy+C5Ve9w6T5rX8D0qytWm2EEIA/Teyj7KLy4yADEEJPtdAnT
 2mSA6e7HngvD23/sr6HiNYFNavFDKc383MUUBegkk7YYZwgjTAFCb+D4mOSBtVdGgkc+
 Lz+g==
X-Gm-Message-State: AOJu0Yx9rsjibmOdvQgbDChf7uxhIuiYhJE47VAk/Y6wMsA+ZU/cgVMU
 t42vJABas1A57oGRMckpxYIvv5laDWanSdIAHz6vcybQCvUBG0qURLRw4GoEDnviHhO7Aec5KMw
 7
X-Google-Smtp-Source: AGHT+IFWTbV3h8CE2iT4216eWWfCaWYHkpYk/MjZMzX0nqTZAwupcuRKWk/ihfsZ9ieuq0JoK59PDA==
X-Received: by 2002:a05:6512:3499:b0:523:8e07:5603 with SMTP id
 2adb3069b0e04-5238e0756a2mr9508535e87.41.1716238989256; 
 Mon, 20 May 2024 14:03:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d87f0sm4396943e87.212.2024.05.20.14.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 14:03:08 -0700 (PDT)
Date: Tue, 21 May 2024 00:03:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Clayton Craft <clayton@craftyguy.net>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panel-edp: Add timings for BOE NV133WUM-N63
Message-ID: <wcpyrq3exao6winp6qtk3j4eo3xvtjako3kfqjxcgoenw4tcrr@x4evfradbxnt>
References: <20231102181907.10189-1-clayton@craftyguy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102181907.10189-1-clayton@craftyguy.net>
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

On Thu, Nov 02, 2023 at 11:19:07AM -0700, Clayton Craft wrote:
> This panel is found on laptops e.g., variants of the Thinkpad X13s.
> Configuration was collected from the panel's EDID.
> 
> Signed-off-by: Clayton Craft <clayton@craftyguy.net>
> ---
> 
> V2: renamed to "*_mode" since there is only 1 mode listed
> 
>  drivers/gpu/drm/panel/panel-edp.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 95c8472d878a..e2e4d88a5159 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1204,6 +1204,29 @@ static const struct panel_desc boe_nv133fhm_n61 = {
>  	},
>  };
>  
> +static const struct drm_display_mode boe_nv133wum_n63_mode = {
> +	.clock = 157760,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 48,
> +	.hsync_end = 1920 + 48 + 32,
> +	.htotal = 1920 + 48 + 32 + 80,
> +	.vdisplay = 1200,
> +	.vsync_start = 1200 + 3,
> +	.vsync_end = 1200 + 3 + 6,
> +	.vtotal = 1200 + 3 + 6 + 31,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc boe_nv133wum_n63 = {
> +	.modes = &boe_nv133wum_n63_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 286,
> +		.height = 179,
> +	},
> +};
> +
>  static const struct drm_display_mode boe_nv140fhmn49_modes[] = {
>  	{
>  		.clock = 148500,
> @@ -1723,6 +1746,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "boe,nv133fhm-n62",
>  		.data = &boe_nv133fhm_n61,
> +	}, {
> +		.compatible = "boe,nv133wum-n63",
> +		.data = &boe_nv133wum_n63,

Why do we need this entry? Is the default EDID correct?

>  	}, {
>  		.compatible = "boe,nv140fhmn49",
>  		.data = &boe_nv140fhmn49,
> @@ -1852,6 +1878,7 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
> +	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a1b, &delay_200_500_e50, "NV133WUM-N63"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
>  
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry
