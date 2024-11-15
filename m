Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB29CD9A7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 08:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681AD10E3A6;
	Fri, 15 Nov 2024 07:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d0/BfRQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8E210E230
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 07:07:55 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2fb51e00c05so24443511fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 23:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731654474; x=1732259274; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v6cKMaZCVTkVV3G8XB5LiWFxAM/cEoFnUMU7GwBqpgs=;
 b=d0/BfRQmKAZ4AHtQeYHQQWHc0P6PNbR1SeUzX+o34CPFU8qAhqzPqHmQgxUc8q+v14
 8wOR+QeXFqA4zTNIlnDye73nWEMhdGGtXJlOwDQ9dRqX6ip50ZNjB8uSpcuAbbZg0xt/
 xAXbU7nOv6npAZGLtIHtrX1u0BuCoOhokyeicryyLNrwk0AbqPZVcIsH3bGSVOR+WUef
 H6yWo3atVG/xeVv9AwyNwVwhemoTI4YWOHko42Kw93RhLg7WRo8isfGLCjhYkbK9R4B/
 vWxpQOj/vFwVQrMX8yqlmFkBqtnklBOAHVaV8QW9WMZOFvFetuOPQytqnswdt1KJQuml
 TlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731654474; x=1732259274;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6cKMaZCVTkVV3G8XB5LiWFxAM/cEoFnUMU7GwBqpgs=;
 b=OKoCmJ8xfWTa4TAdLWMED9QdaSDHMyMv6jo0erfuvWcNTp5eg/gAni8T3Vo/mrHr2w
 /Z75qjWcgoru6bgTIYdUOQXJB4NiV2krY6FlaRgC/5S30ZV0k1mLHPnGnXTKVL1fXXVu
 qbCKauHkHPjBiuvP0BdqfuDUaX/eZjfhNz7AWSOTx0ROYJFzkGM5GLtCkP0u89ygLsz8
 rkFONTda4CYs5zJ8mu3DAfgRrRegsm7SePp7o+SnkELYmz9zII73DhWFYcfLXaS5+MDt
 D8uuIi1qA+Uj1wOYTqoNj0bMcj6q+cwC2gTH+WHKxsDW+TzgcRchoR3nkekvws1gdOUp
 ddiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWehGcr4ku7HYrd4DVztg41FzxWaODvPMHa/l3uEqjqObPnEKMXvnTwMe5JhcwcoeolFYDD7aHiHNU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywymh+8GdkjX39AkUiqY9u95JxnHrTd1KomKcPPrE1bzs9dx4uY
 RwLo19k6P9IIDLyEIpC27BfzRakYg/8e6epgFl2ckRQPnH8TAAZoXL28VdoqBrg=
X-Google-Smtp-Source: AGHT+IG1JSV4aGNvAct/tUZocWSedempVZ4kzonrQKqFj01UuIlfknN42Lm94EUeAmexpvhM1Oz5bw==
X-Received: by 2002:a05:651c:4003:b0:2ff:6152:d773 with SMTP id
 38308e7fff4ca-2ff6152d8f4mr6807941fa.3.1731654473778; 
 Thu, 14 Nov 2024 23:07:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff597a295fsm4440551fa.68.2024.11.14.23.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 23:07:52 -0800 (PST)
Date: Fri, 15 Nov 2024 09:07:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/8] drm/msm: adreno: add GMU_BW_VOTE quirk
Message-ID: <sgz4h6rlmekiwypaisjbnej326wv4vaqt3mgspp4fs4tg3mdfx@cwmdqcu6gwbf>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-2-3b8d39737a9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-2-3b8d39737a9b@linaro.org>
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

On Wed, Nov 13, 2024 at 04:48:28PM +0100, Neil Armstrong wrote:
> The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
> along the Frequency and Power Domain level, but by default we leave the
> OPP core vote for the interconnect ddr path.
> 
> While scaling via the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote paremeters and bandwidth to
> achieve full functionality.
> 
> Add a new Quirk enabling DDR Bandwidth vote via GMU.

Please describe, why this is defined as a quirk rather than a proper
platform-level property. From my experience with 6xx and 7xx, all the
platforms need to send some kind of BW data to the GMU.

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e71f420f8b3a8e6cfc52dd1c4d5a63ef3704a07f..20b6b7f49473d42751cd4fb4fc82849be42cb807 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -57,6 +57,7 @@ enum adreno_family {
>  #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>  #define ADRENO_QUIRK_PREEMPTION			BIT(5)
> +#define ADRENO_QUIRK_GMU_BW_VOTE		BIT(6)
>  
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
