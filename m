Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FFF3BF95E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 13:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5446E8B4;
	Thu,  8 Jul 2021 11:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8211D6E0A8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 11:53:17 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id x25so1898294lfu.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 04:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wwIauJqG7Gi/hYTEAYFKY+sGSvM6txVRYsX5pyUg7p0=;
 b=vzyUGNkXJyqp3cmFX/UEoS55BSzhhySMqae6wQADR19j3ldyo1+Hodr0Vcec3z/5xf
 qfbNt4J8+QEouPpqaEaYNcLM0rA87XnbyZ/WqGU1PfgRfG8jOjSH/aB2XqZEvL+3axiP
 q8YaQKerSvIuQVTYtnQPL0c27j8z0qQkjeYLDzQIMkCVkvvDFrrGrfEq+UMilFb6FTg0
 tdL6U5kxseeyyJSOXkf2zD3YPXh+EnQFA4nti63kSfyptKn8ir9nmjf0WcSGPS68wDQ6
 dh/AlKVZJlv+IWdOeDZnVOIEUUwTXn7BAs1Rn0g09/4HRXLBPGee9df81TWs1arepZh7
 ta+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wwIauJqG7Gi/hYTEAYFKY+sGSvM6txVRYsX5pyUg7p0=;
 b=s+Bas520t72fBqP3pQd8qqdJwxF4Yq91A+cVPmRF7uvEqvacSBttJa41QdjxkFZgcH
 EoxZoySEiGjIBunlNYSRuq5ha8be46TcQMqtIAA0SrqJpN6JYq2cAwMxTofm6CdlBmdR
 KxvRxX9vbwKVvk318JrY4imgJjRcYYIwDDWLuJAQuJ1+rm66+LtVjeoDMJQi6JlXPrrx
 a6duqJ+WbETPEzkom/EHtu7k+XTMojw2KeE7UGUDM4/KnfQyxc9MTxKdFBUjNFICm/FG
 Y9YkB5d3fBupzLdqO9YXJUjc9l7unukle871xerhD6gpTor6poyphvPbtMrm+IW9rPrD
 pFow==
X-Gm-Message-State: AOAM5336XeVZAlNHYPrEu/hY5xtEwp4/tWsRUcftTxl1cCDhOpjdBKJa
 6jQA8IqOGSk/Dry/UI0pbETt9A==
X-Google-Smtp-Source: ABdhPJwi6G52+QBplPSlAE010D60rWMKeJMxYbrPXzlFrjZlA/ij//cKAm8k5rwoCAyrTlb65wribw==
X-Received: by 2002:a19:858b:: with SMTP id h133mr4514517lfd.656.1625745195941; 
 Thu, 08 Jul 2021 04:53:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u16sm220527ljj.113.2021.07.08.04.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 04:53:15 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/mdp5: fix 64-bit division in bandwidth calculation
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
References: <20210622080348.1679589-1-dmitry.baryshkov@linaro.org>
Message-ID: <d41cf4c6-0368-75ad-3dcf-561e283a22ec@linaro.org>
Date: Thu, 8 Jul 2021 14:53:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622080348.1679589-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/06/2021 11:03, Dmitry Baryshkov wrote:
> Fix undefined symbols errors arising from 64-bit division on 32-bit
> arm targets. Add 64-bit version of mult_frac and use it for calculating
> bandwidth.
> 
> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
> 
> Fixes: 7e0230fd096c ("drm/msm/mdp5: provide dynamic bandwidth management")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We are reworking now bandwidth management for mdp5, so both the original 
patch and the fix can be ignored for now.

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  |  2 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  5 ++++-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c |  2 +-
>   include/linux/math.h                       | 13 +++++++++++++
>   4 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index a9332078aa13..52724d0a6fea 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -755,7 +755,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
>   	hw_cfg = mdp5_cfg_get_hw_config(mdp5_kms->cfg);
>   
>   	if (hw_cfg->perf.ab_inefficiency)
> -		crtc_bw = mult_frac(crtc_bw, hw_cfg->perf.ab_inefficiency, 100);
> +		crtc_bw = mult_frac_ull(crtc_bw, hw_cfg->perf.ab_inefficiency, 100);
>   	mdp5_cstate->new_crtc_bw = crtc_bw;
>   
>   	/*
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 3e1b28d3e41b..85b7093a1218 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -301,6 +301,7 @@ static const struct mdp_kms_funcs kms_funcs = {
>   void mdp5_kms_set_bandwidth(struct mdp5_kms *mdp5_kms)
>   {
>   	int i;
> +	u64 bw;
>   	u32 full_bw = 0;
>   	struct drm_crtc *tmp_crtc;
>   
> @@ -311,7 +312,9 @@ void mdp5_kms_set_bandwidth(struct mdp5_kms *mdp5_kms)
>   		if (!tmp_crtc->enabled)
>   			continue;
>   
> -		full_bw += Bps_to_icc(to_mdp5_crtc_state(tmp_crtc->state)->new_crtc_bw / mdp5_kms->num_paths);
> +		bw = to_mdp5_crtc_state(tmp_crtc->state)->new_crtc_bw;
> +		do_div(bw, mdp5_kms->num_paths * 1000); /* Bps_to_icc */
> +		full_bw += bw;
>   	}
>   
>   	DBG("SET BW to %d\n", full_bw);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index 85275665558b..2ede34177a90 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -191,7 +191,7 @@ static void mdp5_plane_calc_bw(struct drm_plane_state *state, struct drm_crtc_st
>   		prefill_div = vbp + vpw + vfp;
>   #endif
>   
> -	pstate->plane_bw = max(plane_bw, mult_frac(plane_bw, hw_latency_lines, prefill_div));
> +	pstate->plane_bw = max(plane_bw, mult_frac_ull(plane_bw, hw_latency_lines, prefill_div));
>   }
>   
>   static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
> diff --git a/include/linux/math.h b/include/linux/math.h
> index 53674a327e39..1327385905df 100644
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -118,6 +118,19 @@
>   }							\
>   )
>   
> +#define mult_frac_ull(x, numer, denom)(			\
> +{							\
> +	typeof(x) quot = (x);				\
> +	typeof(x) rem;					\
> +	do_div(quot, (denom));				\
> +	rem = (x) - quot * (denom);			\
> +	rem = (rem * (numer));				\
> +	do_div(rem, (denom));				\
> +	(quot * (numer)) + rem;				\
> +}							\
> +)
> +
> +
>   #define sector_div(a, b) do_div(a, b)
>   
>   /**
> 


-- 
With best wishes
Dmitry
