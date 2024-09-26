Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87094987414
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507D710EB11;
	Thu, 26 Sep 2024 13:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jbT+KSPx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DFE10EAF6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:02:22 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5365b71a6bdso1271516e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727355741; x=1727960541; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FjrjrRM9XPvHYxyCvf9B1RVZyMTuwJYX+MU9Coc6xcE=;
 b=jbT+KSPxMrk+j1EDTTV8Xxvl28DAx5vfqP3OYOaZgl0IfVCG0IZuBTUtTCO4694vet
 e45QU9hKzsB8VMuqWknMLePXqhKjErG0RckyMMNQay4TH+6EN4m8yC7MZJeNWjqfWdLT
 Bp2ay9rQoLm4asH6I0u1SJ1IgIIvoSOKok04cNlpim4sIclRgmNkgzX6BjHQRd3cxTMC
 wb9F5CBRahliSHE6yPLfsL0wAc16TMMMcF0bdqdJfFWpEhNobLNRl7JgO3o34V/Y6nUD
 9gBNalQwqWBtdfWpa4G8/oEpj3qdgNdVXe5JKXF+nrx3WnCmRvgXsvbWRFPy9Dc3x+oh
 p6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727355741; x=1727960541;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjrjrRM9XPvHYxyCvf9B1RVZyMTuwJYX+MU9Coc6xcE=;
 b=Q+0EzqOQLEjcXu4qO1I3RNu18Iso56tN1Cs2EvmCdwt/jDAYk6b2soiHUajQefFUI2
 MC6s+QwttVYWEGI5PrgFyBH3XR9u/T4HGcUkmei5RWCP3jaErzSKJ6xDmNZlpfI9+lJF
 peOrmRhUlR5W6fIWh9oFF9FvlA4c8ntdLoP0hYNXhV6qr99o0myxgAJJwtrtnnIy3/L8
 0uhBdPP5i3z6IJq8HDeE9cM1dP8aMJXwNwiHApGOK7GMlOysZJ7qjVtok2J6LY81mG5T
 cnfO7Rp2/KGmOBvVdiIXQ7WX69OOWg/L0U190N4BCF+drWkogqWgQGA9guBQx9e1SAqn
 inrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSG3qcrQJ+c1YvcTDzPEVH8m0lvjwL+TSj/RGnGPiEWQxHeF1YX1Hnwz8rim2JugCcXuXa+6i+rjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGbug9BUk/oWZSSYJ/eK9El8e8SEpIExwEu6duXfZjBk0WHVz/
 i+iKgg4WaKWWsKRDjLzdzug2ULBhjJn0tZ/Fji4IhMqMUg57fj+eRgZLma2zSVQ=
X-Google-Smtp-Source: AGHT+IH2/C/vn/3guz1GtFMt/oWgqT239gTYMR64SJn79sphprz6qemJfk5SXKxHE0ZI+qaue6j10Q==
X-Received: by 2002:a05:6512:31cd:b0:536:a695:9429 with SMTP id
 2adb3069b0e04-5387048a724mr3919631e87.10.1727355740345; 
 Thu, 26 Sep 2024 06:02:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e582esm795886e87.63.2024.09.26.06.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:02:17 -0700 (PDT)
Date: Thu, 26 Sep 2024 16:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH v2 3/5] drm/msm: mdss: Add SA8775P support
Message-ID: <35e6yleiy6wkja3ojlfjddifxv7kr7x6tyn5pszas2chouuvql@trpeb7b4eop2>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-4-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926110137.2200158-4-quic_mahap@quicinc.com>
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

On Thu, Sep 26, 2024 at 04:31:35PM GMT, Mahadevan wrote:
> Add Mobile Display Subsystem (MDSS) support for the SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
> 
> [v2]
> - Update commit message. [Dmitry]
> - Reorder compatible string of MDSS based on alphabetical order. [Dmitry]
> - add reg_bus_bw in msm_mdss_data. [Dmitry]
> 
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index faa88fd6eb4d..8f1d42a43bd0 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -573,6 +573,16 @@ static const struct msm_mdss_data qcm2290_data = {
>  	.reg_bus_bw = 76800,
>  };
>  
> +static const struct msm_mdss_data sa8775p_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,

Just 4.0 or 4.3?

> +	.ubwc_swizzle = 4,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 0,
> +	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000,
> +};
> +
>  static const struct msm_mdss_data sc7180_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> @@ -710,6 +720,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
> +	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>  	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>  	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>  	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
