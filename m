Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D232A570550
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 16:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80E914B4F4;
	Mon, 11 Jul 2022 14:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1129114B4EC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 14:19:51 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u13so8951067lfn.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EbTGKdHG+1YrudsLr33VcIPNPd0JWleJZSy38WYsqHA=;
 b=GCJd/iOWc1D1t4INDMA/nNooKIuFLbEp/2dZ+mbivmOWS3NGfry0pyVGLIO/gE6/mg
 ZCoIYHnxY0on102bwNhY876TLdnpm9jXO/donroJ51Mp2Q/SVgHPgBa/C3ZMG+XBVv+U
 ncIQ4yP0ooa8DpKGpKsmWBVU7/QIpalYAdMAWVCVxaF7dZ9B3iIltaL8qw8+azxg28o3
 /bXrRNap6aoHuRgGW98sxezqS6bSt17J8VwU3w4oV6Vl9+p+a38iZ1teQlrvv9fna5pr
 gVP3nqytTYtVVPqXzLFXj3DDRnx2sD8MTNDTJruabECz9nuyfaQ+pbGHFR5rHlLn2Mgh
 jwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EbTGKdHG+1YrudsLr33VcIPNPd0JWleJZSy38WYsqHA=;
 b=SFykmqIQCsa79VcgGxZ19QfSGSZsf7ZDF8afNXUa3vWmM/T1C56u8lwD3V2bYckVw9
 Oj/mNRQfvMe/6MKPuGKkrjvnbxOEvRLYztWBB83M8RugZzpFc1IRbSVf9DZlLnC7EcLb
 CCv8+3QB6SwBEeeZCNOq3RFBK5CuwIoZJusGl7mLG2pVt1ynxbQthiD7ZKLm/RqBXDM6
 C/Nx1MBNbyiXp/u8Fo5OYUpL4bG4YTukdKNjBnPe4xp/E2EETaWvE/Q1ueJyNQL982gi
 13Rvz9F2N41vA0Ce+3eaQRTFluZrYnNXdIiJDyGtkR+TLhmJ3djiolI5o8UcluUIU8TQ
 XAuw==
X-Gm-Message-State: AJIora9X6m6Nn+WwOaMBJTT79U///pBoAPTtnlIT+2J2RSEaSPO2ReS/
 ZrLt0hnsqIHqyYtRHz+kcR4H5A==
X-Google-Smtp-Source: AGRyM1vtxA3URIMoW5Kpq+Ah7ii7RSPYMDjIX30bY30Yj6lyVAWnXi7dhZAKcPwMDRtRtEY2LLkaxQ==
X-Received: by 2002:a05:6512:3b90:b0:47f:79df:62d3 with SMTP id
 g16-20020a0565123b9000b0047f79df62d3mr11952730lfv.486.1657549189273; 
 Mon, 11 Jul 2022 07:19:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 9-20020ac25f09000000b0047f6a1237e5sm1562594lfq.291.2022.07.11.07.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 07:19:48 -0700 (PDT)
Message-ID: <2ba431fb-ec22-81da-29fb-1d7ecd1a8722@linaro.org>
Date: Mon, 11 Jul 2022 17:19:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 10/10] drm/msm/disp/dpu: check for crtc enable rather
 than crtc active to release shared resources
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-11-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657544224-10680-11-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com,
 bjorn.andersson@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/07/2022 15:57, Vinod Polimera wrote:
> According to KMS documentation, The driver must not release any shared
> resources if active is set to false but enable still true.
> 
> Fixes: ccc862b957c6 ("drm/msm/dpu: Fix reservation failures in modeset")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5dfb56a..02a71d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -592,7 +592,7 @@ static int dpu_encoder_virt_atomic_check(
>   		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>   			dpu_rm_release(global_state, drm_enc);
>   
> -			if (!crtc_state->active_changed || crtc_state->active)
> +			if (!crtc_state->active_changed || crtc_state->enable)
>   				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>   						drm_enc, crtc_state, topology);
>   		}


-- 
With best wishes
Dmitry
