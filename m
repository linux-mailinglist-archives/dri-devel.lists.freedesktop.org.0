Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B77797FC9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 02:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1233010E0E1;
	Fri,  8 Sep 2023 00:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D19C10E0E1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 00:35:17 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bccda76fb1so26974101fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 17:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694133316; x=1694738116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WufLjNztGlChBv98FBmKb2FlfCV1VsF4EoYLdsQzy3U=;
 b=UlegSlTKgjjJZJKJnDo9zDO2GJdnWp5DoHDJ8rr3+7+/EdHmw0EYrGmknR1LZvrluK
 /Bmos3od30OwBKNYKDQ2vwb3PZAxXom8MwY4PJazgoinZe8ahJLT1IbchI7nGovnpnWb
 KZDSzOlc0NkWt0pRwp41/mKSKSD1Nj9Ah8CAqAGH/A61ymhAil1QJ5dnakj/qi6g1fYg
 a5tIIIgyJmGKwPzzksbOZ6OUzL+g3vRWlwIBMaNhlR0NkDYr87LeeShCQpJZgqKBRR6u
 KW/FFSl7b0TYsuXQwj6fcWu8qiR7LUz1LktMghmdFDBg7pNu3fbWqRJ7a4xRMiw2GjwC
 /iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694133316; x=1694738116;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WufLjNztGlChBv98FBmKb2FlfCV1VsF4EoYLdsQzy3U=;
 b=qxNe+9yKHLDGWtylZmxNZwpQpw69+YwWPWykRxNZhP9p3hf5FLY0NeGWVACfq/2LoH
 0bNzPjWZ5IyNc2Pgu7I2zf05p+QZAWdArJmm0GeqKJ5ozhx0Cx3T2Ta8jxB9UXT2fOH3
 Cd48F99MMbEOiOpk7wNKhw8RnR/2cU00lJmpDIZCBDYTcEDbfJPMM71I53xedKTwaoHC
 K1ifbjQe0owYlV3BSgtJPzqjWkyVbNNmMzwWS3q75NCOspyV2kFnoINLBoNOSFuBF2it
 8AMRSAaDTeXORNixcTGC9tVJgGxaFBLwEXXRiPyo3VHxpkZG2L5LraAWBa5ahREPwhF1
 1dLA==
X-Gm-Message-State: AOJu0Yyq+bgbWbmoy78IA5KTj07p3KjpIvGjot5JHnuYZeltmaMeV0tp
 bJ/dApvxfwhS1N5eh7tWvWmNDg==
X-Google-Smtp-Source: AGHT+IEG4qe0Wnk8qI7Djt2pE2CXmT2pRRN8CzJa4p9Pz+uJgkGUR0afl2XPdHrEJ6PdPoYLGQg/YQ==
X-Received: by 2002:a2e:9782:0:b0:2ba:6519:c50f with SMTP id
 y2-20020a2e9782000000b002ba6519c50fmr484086lji.52.1694133315738; 
 Thu, 07 Sep 2023 17:35:15 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a17090671d200b0099cf840527csm280373ejk.153.2023.09.07.17.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 17:35:15 -0700 (PDT)
Message-ID: <f110b0fa-f41f-47e8-a83b-30de2f2b128c@linaro.org>
Date: Fri, 8 Sep 2023 03:35:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 to
 avoid overflow
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <quic_kalyant@quicinc.com>
References: <20230908003240.14104-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230908003240.14104-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, nespera@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2023 03:32, Abhinav Kumar wrote:
> _dpu_plane_calc_bw() uses integer variables to calculate the bandwidth
> used during plane bandwidth calculations. However for high resolution
> displays this overflows easily and leads to below errors

Can we move the u64 conversion closer to the place where we actually 
need it? Having u64 source width looks very strange.

> 
> [dpu error]crtc83 failed performance check -7
> 
> Promote the intermediate variables to u64 to avoid overflow.
> 
> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/32
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ae970af1154f..c6193131beec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -118,7 +118,7 @@ static u64 _dpu_plane_calc_bw(const struct dpu_mdss_cfg *catalog,
>   	const struct drm_display_mode *mode,
>   	struct dpu_sw_pipe_cfg *pipe_cfg)
>   {
> -	int src_width, src_height, dst_height, fps;
> +	u64 src_width, src_height, dst_height, fps;
>   	u64 plane_prefill_bw;
>   	u64 plane_bw;
>   	u32 hw_latency_lines;

-- 
With best wishes
Dmitry

