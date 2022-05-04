Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D751AD1A
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 20:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2037810EAB0;
	Wed,  4 May 2022 18:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D36A10EAB0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 18:41:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t25so3843717lfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wTxln7YGVkX89i8PG0IKXfsso9aaC9QMWGmO6EX/EGY=;
 b=z2Ctxr3w9cDEGS/IXiaRNEtZDn6Wv0POATksyAG9keUZE2UBpjRpqxqEhe03gIVezk
 JUHIQzyf/0MFa26gN3hi0g8FHd/HHXCynEgpy2M5H7LEO8cPdG9LbSNWy4iMxvJh/joQ
 KVsH9tDJmcqntkqGTL3cxSgFiPZgi+CX0jvzztvuwLE5KOCWpXjvHU8Nm3OXF7d/+Kop
 MaDt4RjNKWP6xsVrGhiEed3Zu7Y1eH3v+cMbJ04VzT7yPGJHlsXkTiyp1XYyofqvPaQi
 QbrsqXxwYv8AvPL0L/DqQxBoG7tz9RBWjz0w9SJu5p2yT+8+8vehbDyH1X46CuUQ+MW9
 mCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wTxln7YGVkX89i8PG0IKXfsso9aaC9QMWGmO6EX/EGY=;
 b=v+GjDhLKIkdG41vZZ1Z6E6ah6lr7dU+GmwfnUBp3ET6wpjUiHRfTgJQZhICrrcSRVl
 JrYjnC7JBlxLR8fDo5jWFZTjSuqbRRVu0tvC5ejM9va0ozEZae5M7u8PI3FNlxWOo9tH
 xgvPX0Na02fkAWq181ZZ8h6tg29FjrwYrnIn/4+iuT4Qm0DrghySIplY0rgHWbaegNv7
 f4WIpX4UrLeZCfeSNzKJMxMUCpYu+XgTVWf6Dfo/eofp09a+X1PpkL8y87/p/fVzESGd
 0v84v9oYYDH23WHK5M5SqdKO0129/US3Ai0O/HqMEhvV7xhRDskj+ZNhFJggKibc8GTP
 NteQ==
X-Gm-Message-State: AOAM532+ScL9o27Xk+PZ8Z9Ojpj2flNlXfbhyxtg4kePGkrXYYRMOcf0
 K8FyXjCsQGCF9xICY5YFTtSmjNu/KOfpqA==
X-Google-Smtp-Source: ABdhPJy4zg1hpUl4Auyu5EEfhi6Mx+a0yiiys0cRdUGvJh5KnPLpnHF/RaEZ9+x6pGoF15y0uGxIGA==
X-Received: by 2002:a05:6512:683:b0:473:a110:e52 with SMTP id
 t3-20020a056512068300b00473a1100e52mr8290893lfe.412.1651689670755; 
 Wed, 04 May 2022 11:41:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s15-20020ac25fef000000b0047255d2115esm1274090lfg.141.2022.05.04.11.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 11:41:10 -0700 (PDT)
Message-ID: <aa898db3-c52f-61d5-6a55-0d8b836343fb@linaro.org>
Date: Wed, 4 May 2022 21:41:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm: Limit command submission when no IOMMU
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220502172908.3569799-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220502172908.3569799-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/05/2022 20:29, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Running the GPU without an IOMMU is not really a supported (or sane)
> configuration.  Yet it can be useful during SoC bringup (ie. if the
> iommu driver doesn't work yet).
> 
> Lets limit it to users who already have /dev/mem access, to avoid the
> chance that a user accidentially configures kernel without IOMMU
> support.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 23b68bc945f6..9cd8c8708990 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -734,6 +734,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   	if (args->pad)
>   		return -EINVAL;
>   
> +	if (unlikely(!ctx->aspace) && !capable(CAP_SYS_RAWIO)) {
> +		DRM_ERROR_RATELIMITED("IOMMU support or CAP_SYS_RAWIO required!\n");
> +		return -EPERM;
> +	}
> +
>   	/* for now, we just have 3d pipe.. eventually this would need to
>   	 * be more clever to dispatch to appropriate gpu module:
>   	 */


-- 
With best wishes
Dmitry
