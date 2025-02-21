Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB7FA3FB19
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFB310EAE7;
	Fri, 21 Feb 2025 16:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KMaRlyFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7C10EAE7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:26:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5462a2b9dedso2598082e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740155180; x=1740759980; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xjL5HnyHIkjOW/V091xA7OYPeED0xOIXslkPMlUBUug=;
 b=KMaRlyFIBe19a+wkK1iueerZB+jrGmOZtb69Ne/aqrDIThNeTRSz6WDRvWgxDjVOI+
 ujKht9MgXAstsD/l7pEggshqK6IG3qy/3eO21mDKMIojaJCSQdn/NGPyhKyPUQ+0lT5I
 2aoWocwVbMx0UjVyDonC9o2ePJErOAEBtuejJtNVkxW6WDeucNCJaMgoKf+f++9Wb5hu
 QrUaPYHQiRTFgRnce7AUamVbMeMmr8SkCvUe9BG4+kDaTOm3QyTlmwiZcgSPgfW2z3ar
 CIWj4Tv8YdNmWsxuGETw2vw/5HZcqdh5Jw/h/Jf6bz+UhtJPmnsv5i9NxKj1o5y6OYiO
 oY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740155180; x=1740759980;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xjL5HnyHIkjOW/V091xA7OYPeED0xOIXslkPMlUBUug=;
 b=S8fDKUAU2+NeoIX2z6HG6U6tdXImWMcflnbHMnsWSk9xeVr9r8Kwd3iQoIZi4kF98W
 KCQI+fSuiAb0jJQuGNkED72g1k96SR6ysGRaue3j90T1/6EtJ95EiPQndz2oenxx+8Lo
 nVb+FYg1dRsTvs/emF4uOF3BJeA+8njhMRrtNEzrCraIqFBVIE4m8x4crYUW+S8salj4
 5Iwm/3vHNuvGbT+HM6VE1xagnnF0VBldXGZ/LphcTWDsUchRnA+tgzPKGk+HwtQFixJp
 n9Z2qc4iJi88Vojj87enprO+5Fp/48bLPdeoAn0cIvoxWTSLuJqKpD4MZhB145XVP6jY
 3SQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpBZzSq6N6YliScgT6w7n30Pb6rzmSRw1taq1Afrs/Pv9u47dm+qN9j0OL97A/iYqBk7ytyeIGXCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf9kWJs7TD0NsuNphtdknOKxqteEdTLJNNrbJzV5aMZxHJ7nDE
 XLCQg/5rECqY+KGZUd7/scg1pT96UM8qb9MxVdobpbFRxo0rLJxq0+h8QUBRXDA=
X-Gm-Gg: ASbGncuB/fc17HCsIYrnZLDw74HvFSSnwAKj8RRXJpQHyheLkG4nIQUs0BBjIMKDM1n
 vny1bkTzDu2uk/cnncXqt98BggDlG5en+mh3S1rpEH4SqL/09EA8rhIFd9NInOH5nVdo9zJe0sx
 Khgyc2K0wEWQXpk3Gml1IqS7UHnIymSF/dBuTFy1NVuHv+CMjcW6IZDocY9UbxKEG6InD3t84Ms
 S+7ZJeMaPY+KhWUkYtX5It4gXnuOlMUtikKVBzCAnLG/X5ZQvYdz4KtqqA+346/INP4mxrySn6D
 ooMxApfIha39fIL+y4hEMHhb6hqvNz9yUFgEAjuPvjWszn+LXydEUNiJq78+bmGnohEtTWpwy1d
 djJ7yfQ==
X-Google-Smtp-Source: AGHT+IGFPBqQwJN5a48M/xNQBTDNxvZTEjIAW3PFsBL+6h3O4OdEk1slnuoUOVeOHEYt968uLpwuBg==
X-Received: by 2002:a05:6512:31cf:b0:545:a5e:b4ef with SMTP id
 2adb3069b0e04-5483913ae13mr1829559e87.16.1740155179895; 
 Fri, 21 Feb 2025 08:26:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30921a593f6sm25579171fa.65.2025.02.21.08.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:26:18 -0800 (PST)
Date: Fri, 21 Feb 2025 18:26:16 +0200
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
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 19/21] drm/msm/dpu: Implement CTL_PIPE_ACTIVE for
 v12.0 DPU
Message-ID: <5rlcxx7pcu32hz3r4qufqcq2jzk2z4g2ep7reecpm2kksttwyi@66p2u4nwfzx6>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-19-3ea95b1630ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-19-3ea95b1630ea@linaro.org>
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

On Fri, Feb 21, 2025 at 04:24:29PM +0100, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with new CTL_PIPE_ACTIVE register for
> selective activation of pipes, which replaces earlier
> dpu_hw_ctl_setup_blendstage() code path for newer devices.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 29 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  8 ++++++++
>  4 files changed, 47 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minot nit below

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 43a254cf57da571e2ec8aad38028477652f9283c..3e0bdd1100ebb0d302a852ceeaf8af86835e69a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -40,6 +40,7 @@
>  #define   CTL_INTF_FLUSH                0x110
>  #define   CTL_CDM_FLUSH                0x114
>  #define   CTL_PERIPH_FLUSH              0x128
> +#define   CTL_PIPE_ACTIVE               0x12C

lowercase hex, please.

>  #define   CTL_INTF_MASTER               0x134
>  #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>  

-- 
With best wishes
Dmitry
