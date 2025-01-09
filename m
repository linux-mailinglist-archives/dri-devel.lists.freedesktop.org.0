Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A713A082DB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 23:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418F710E3A3;
	Thu,  9 Jan 2025 22:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jIY/h3mQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054A210E3A3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 22:39:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54263b52b5aso1530962e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 14:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736462388; x=1737067188; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H7PXcApU0JETFIR6N0uLhNM2Aw7BSg/72G4ZlEn/1Do=;
 b=jIY/h3mQQHUMK3V3qinThPhXZKhaoT+uUlftHhJWIpmMsqmzsweKuWo0MxA5Z4WzRm
 +1Sb3cowjS1ljk05wITz7awF1ZSRv/WxUOyS/kV1dMs9kAlzc/g86q7tWoNleiflfzYm
 ToKnzhDw3Cnx1Tv/8w3+0QbJytbw/jK6l8TuGnvoEhqBRdlS9EMojdm5jt8KsK50OIs2
 eywc4RSz+kUoWEvJd136nfGAFhZWDXfHM8krl3Aru+ZhckuJQ5xSGvTQWY4mDPDJusWV
 d4xHoPPdPJ6CdBdCQmpp7AUGoB+he6/fn3mSvaCAn63VdneY7fwb91B0+WbkiI7b8+vS
 zNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736462388; x=1737067188;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H7PXcApU0JETFIR6N0uLhNM2Aw7BSg/72G4ZlEn/1Do=;
 b=VckPBBII1LvZXqb9wrXuyWV2ucQboulQjxqe/qbUNAzOpbmqi5kp4o/v8T406v7vgY
 hpmZTn8mORM15L9Pp90xUsp/LRDrBQSyF+nctQ7h7ODMk3hoWo3OWuuxQ4OQgpEATqJq
 WKt1ypsiN+J+JizeB8LkhPgBCECLsZBTRB2aijSG0OSOdEAPn40G/dXysekcg7wsPKM1
 LTN1zwJsrqw4Fviab224VHToFuDGY6KQvTGjhkBf4PYTTEJOrYc2W9+qWbfB7p32mYXp
 gNKZz5vAlUAPP3yUqxRt8xk4fZL8BGGf8Q9qU2J6EuUqNpHASqZpbYAovA9IFg1rKsAY
 MfYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjHaE+/bq4TSJOn/qqT4JqJO7TZG/5bL2n3FkKTEyQncbjjIIFM9ewfRKrcwzc74eeOvjYkIWHmqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaPLEuUAYb6jri18CcG8nckxw/CmEYCk1gbETwUZ+lLh4B+lVf
 1okIhB9yLvJNC3qtsao63SJ+A3+lDHOybZ0TsHfz6efQ47ZUMGDLYpP27oIKBLw=
X-Gm-Gg: ASbGncu8YjFz90uOiWPcm6Mz/aJrrm4oRIMxdi8G2qiLvbHOb0zYfuxENxVmIqAxz2q
 kYJH6h4wUiUkG5R11XId5u6sGfzM0apezqeB2bRq9yp1SBA0n4ohNm5MSVCBSrM1lA8KAp68Hci
 hiSvegAD2yB/+XjjN9Fd9i7rbIymTfFUw+8BxhOYIafetNCE/9B7wC5DCkbvHt1ReRECELn+e8I
 qu6DIIEk8J9cWiTzwYO9tBzQCpF4YyER356LHm1MHY07UcttY7AlhengiOGZvIMgtM25XTjAL9s
 6aXY4C0LeFP7+P/4/pU//8elBaBTAtrCS6JL
X-Google-Smtp-Source: AGHT+IGjSVrLD+BTCfZfVNXTNwUqqxiO45ZG5ef6NG4hf2D5QyOSBg9wrPZDTY0SG9oxOVZaANgBhQ==
X-Received: by 2002:a05:6512:3c83:b0:542:2929:63ea with SMTP id
 2adb3069b0e04-542845c1e8amr3117213e87.24.1736462388248; 
 Thu, 09 Jan 2025 14:39:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49eb2sm321608e87.41.2025.01.09.14.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 14:39:46 -0800 (PST)
Date: Fri, 10 Jan 2025 00:39:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 10/11] drm/msm/mdss: Add support for SM8750
Message-ID: <kn7gsm4nnp372t56ocbzkv6uw7o3ww2qel7jlcwvgxsugdk46w@d34hujbcswcw>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-10-b3f15faf4c97@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-b4-sm8750-display-v1-10-b3f15faf4c97@linaro.org>
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

On Thu, Jan 09, 2025 at 02:08:37PM +0100, Krzysztof Kozlowski wrote:
> Add support for the Qualcomm SM8750 platform.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_mdss.h |  1 +
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f00eb6de3a9d2bee7637c6f516efff78b7d872b 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>  	}
>  }
>  
> +static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
> +{
> +	const struct msm_mdss_data *data = msm_mdss->mdss_data;
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
> +
> +	if (data->ubwc_bank_spread)
> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> +
> +	if (data->macrotile_mode)
> +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> +
> +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> +
> +	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);

Nit: this probably can be folded into the msm_mdss_setup_ubwc_dec_40(),
but I would not require it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +}
> +
>  #define MDSS_HW_MAJ_MIN		\
>  	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
>  

-- 
With best wishes
Dmitry
