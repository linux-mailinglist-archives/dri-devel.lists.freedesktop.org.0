Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B89A8475DEE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE17410F04B;
	Wed, 15 Dec 2021 16:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC8810F04B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:56:16 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id k2so34246807lji.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/mM+TtN7QigfV8F9BSaGaHszde8U6/Lni1GFCo1emVk=;
 b=dF6HpHPFiz7ifldwyihr5zXt1+h5MHmIv9Cm6jHNIH41piiiJWR0Kcf9gKAOGyiBBq
 vHACI8SjJCg/LcKAxtj5FkQXlgaz1BGK9X9usL/XZv0BH59KCm6bpWEHc+ZVlKWWAVri
 ndSOhrvG5OXK+mfw0MAcUtufp7WlyGlgtZoPyEczgyPecrOYRFGN8YWykNVL6v3iqJ9S
 WCFlq5rhTDbYjcYca4pCSiQXZ1LX7upCHqjflKi7nRxya4FTVT7wN3XxJ6UHgfN5THaZ
 Tjx/A4LFyEYjnij+NpJnefMS0sKCqYWPvVjoI74jYl8rC9/q/LEPXc3ZHD7Tzr8vw9Vi
 g+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/mM+TtN7QigfV8F9BSaGaHszde8U6/Lni1GFCo1emVk=;
 b=YwpMckF+nWLsLASCiERo8+4dCsbHubYfCNEodPEd+sqRO3Uu+TDkjJ39f/AyAqfzZO
 i8MmsYFHZGSTE7XL0bxrHxp7SUyNejQMfYEARUzNwYqFgb/tP9KmV1qXSK3ZAZN/F0py
 qnQ4zXPivq4Y7M/o3kLNIqxyK7H0S0SJIalF96ECScjwf2r5J/MdSDf0rmJSHq4Mi9G6
 V5BkN/bIi9MpfSkdo6+Omv/ucyBhsIgyGWFRRbRtoiBiOPeJLQI5tC4b1DGaPDdJ0e6X
 jUsokmu+M+fBA3+Nempa9RDBqueQxAz01EVSOu0oBGLFTAFYjcurmCJ8tnzdXVU7gwqp
 rcNg==
X-Gm-Message-State: AOAM531eRDs+mjmE57UzSym77T4zvLss7FbCSGE4T7Lex74h3mlTCtwn
 2IlvBMi12aYov8Hs3Ncsa190sw==
X-Google-Smtp-Source: ABdhPJxxxdf7tgICe77qXKsLRA6dZuxeJOxmfJaSbnj2PKfJJ2ko+kcJ9hGwJfYGy/h6bpf9qOqtjg==
X-Received: by 2002:a2e:6e0d:: with SMTP id j13mr10688343ljc.124.1639587373419; 
 Wed, 15 Dec 2021 08:56:13 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id m14sm550392ljg.2.2021.12.15.08.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 08:56:12 -0800 (PST)
Message-ID: <ec877733-7e1e-7ba8-0df9-8a7542dd0377@linaro.org>
Date: Wed, 15 Dec 2021 19:56:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm/dp: Fix double free on error in
 msm_dp_bridge_init()
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark
 <robdclark@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20211215114900.GD14552@kili>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211215114900.GD14552@kili>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/12/2021 14:49, Dan Carpenter wrote:
> The "dp_bridge" pointer is allocated with devm_kzalloc() so it will be
> freed automatically.  Kfreeing it here will only lead to a double free.
> 
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 188e77c59885..d4d360d19eba 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -243,7 +243,6 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>   	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (rc) {
>   		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
> -		kfree(dp_bridge);
>   		return ERR_PTR(rc);
>   	}
>   
> 


-- 
With best wishes
Dmitry
