Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41018CA3A9
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 23:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4627710E952;
	Mon, 20 May 2024 21:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OpjaZ7+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642A310E952
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 21:07:08 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51fc01b6fe7so3528340e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 14:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716239226; x=1716844026; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gxag9RHkqOcO6fLMdXEG4nH3YD7rb+IEySrCi9RMHOo=;
 b=OpjaZ7+62OqZOdp/0KfVBgpP7HRPIYgxZyxBP1AyGcr2txj+ly0j32S5ViUm+DX6JG
 7DCUqCnCPtRnUQ5uY6Rloqn52rnXgAs6zSnDwm9LJWauw25ZvdfDe5OXDx53TuJ638uX
 cwlXvmJlUxY0K6zShFbpVrUUiVLpiuocDAHoPLMFMzkmtx7y3pETcGB9SNroFT9a9Cmi
 qBUi7H5XNREa1tZwAd66eiapg8rFh7r6Fs/jSiIjf3ZbteQMr24HJPLp+VtfUqDV/+3n
 yjXmk+M84s3vD4PoyCvQiizDtgvQimzEq9v7xriQI82H79UVFwTkUJYqsT+vzRbZiNCz
 94Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716239226; x=1716844026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gxag9RHkqOcO6fLMdXEG4nH3YD7rb+IEySrCi9RMHOo=;
 b=Hd7keJnuBr3nRN1c12LxZJBg256/P/AyOfdYzb/GFSn0Wf05p8Gl4OxBSjoPTy608j
 Cpi6i57HGfY7GKtUEoR36X7fhYewWw33/mOcFqAPBpPYR9vkUFDFGt+FQQSrld15S5Gt
 ExgG2X4h0kS0UUX18Tq8bfCV5/1dIuju2CQ7RvzH7qJkS0092a2j2xeRK6fbenR7IQbm
 lR1I75vmmoYW3SfM+o+uOUStsvgpWxL0SW0I7Gvv7dgXrQejU8l6yyKImINdLsqzrYuw
 O8ZCF887c9fX1pE2SnUgdk32Zgr3OAv6unBMz7XvDm3rFT/+Q0tVrfdy93FO1M1vZ15L
 nD+g==
X-Gm-Message-State: AOJu0YytEu1jBtuICjSeAAn8pZPyQrP2qC33sUE4ylBhlsG/FCDeVHS3
 2LhbqGxD43kvxzu7s1g0FwhslEK2Mx1BZ7pxmycpL+mUoxujCFIPRnQlzhYKLyfaxiAwN+2gmVB
 E
X-Google-Smtp-Source: AGHT+IF5CRnp2zQQXKabRAcMNtngChk+OU55hGdqHtkZBnfCrkgnVIDv0FKw/1K+qG1EV8biRl90Jg==
X-Received: by 2002:ac2:5f83:0:b0:520:9775:5d3f with SMTP id
 2adb3069b0e04-5220ff71d65mr19854812e87.7.1716239226463; 
 Mon, 20 May 2024 14:07:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-523a64da860sm1963098e87.128.2024.05.20.14.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 14:07:05 -0700 (PDT)
Date: Tue, 21 May 2024 00:07:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Clayton Craft <clayton@craftyguy.net>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panel-edp: Add entry for BOE NV133WUM-N63 panel
Message-ID: <ch3czbfe4zbpm7z25bdia7ctqezydo74yjyi5cq36o2vylawu4@ejymsxq63s6a>
References: <CAA8EJpoobfosRMMNm2uDY3dNXgCU+LauRvg9-2MrQBwHO0q1Cg@mail.gmail.com>
 <20240520200611.6279-1-clayton@craftyguy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520200611.6279-1-clayton@craftyguy.net>
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

On Mon, May 20, 2024 at 01:06:00PM -0700, Clayton Craft wrote:
> This panel is found on some laptops e.g., variants of the Thinkpad X13s.
> 
> Signed-off-by: Clayton Craft <clayton@craftyguy.net>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Please don't send patches as a response to other mails and also please
keep versioning consistent. This should have been v3.

> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 6db277efcbb7..f75db9917667 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2047,6 +2047,7 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
> +	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a1b, &delay_200_500_e50, "NV133WUM-N63"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry
