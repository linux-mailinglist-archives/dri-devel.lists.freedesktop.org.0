Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372974469BA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 21:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF016EB5A;
	Fri,  5 Nov 2021 20:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3316EB5A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 20:29:04 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id x70so16345888oix.6
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8JOiyVnxfxaZAhXkgjHfAK5HrLExH5oiye43Nc9y5lE=;
 b=Mkh7tjdb+bN/TRolya14M3jL1kGZiyedL6PMEh8LA19iejEw/DTZsdk3WhwKP9870o
 gnhPaIE6lMNPDZXnoMl3bV4nqSkCnnVcBUV3WZyzt1Jlxzy1vhG8Z92AeNC+4BByn6GD
 cCblwnlHT/5PSL/T9MENFZI4KIBTqCwXE6ilRQrgZxV+XzkVuFDkfGZw8oq/y1igL6ZO
 p1JnAnwT4gQouVR3lGoiwxh/Eh2ljiQczHGJXxyMYIy848ciIc8G5EGt5DPONSQz7ldK
 1WgeNYkxTZJbcX6UmDqXNRtz6/cLKOeC1vNFWWMo1rvp69mJCVwhxX5X2UvKrSl1pifH
 ADPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8JOiyVnxfxaZAhXkgjHfAK5HrLExH5oiye43Nc9y5lE=;
 b=7vIJrKyczK8AekjRGqxRcRrZEy2ON/4bVlVMAJvI4/bAyRB/7wpsrGPbkN/MnuaTu1
 ZuWibtvp9K5B0+Ztz/pR36AfC+/C00bk5ADZu9oBkC8hYdpeEsvYDQb13i5e+G+xgYsY
 zJgUuwknjK576p8eyZdXeB7U2B4MKaqOOYV45ujGOgUaBXTzHhgrWozzq7nAQOPRBGMl
 oHij2T/nu2QiRFpKFhI9d5rz/llAuEyrz6VmG5oEwGLlj3Bg31v4fFwm7vvvd0x/0Kcu
 cXOs43918UKMZDtxtZOE72MYXbThsV4g9iXo3hmdsd23AUpUyxlyAZOawVMpzt0EuUcM
 Stow==
X-Gm-Message-State: AOAM530QmV7H2E/7yUKDdmNblCgsPvjCG8w3Qsj9Kgy9bcEYekOwFg+L
 o9U0S2CHBlAlu5J5uMt0f8e0ug==
X-Google-Smtp-Source: ABdhPJx4R55434miRtFXT3rDjHhYO7yoc/PDMCPS0UxSDNaJESWi8pqHCWAz0JuewFqOuhbI+Hr6Zw==
X-Received: by 2002:a05:6808:158c:: with SMTP id
 t12mr24051841oiw.24.1636144143770; 
 Fri, 05 Nov 2021 13:29:03 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id c18sm3551722ots.64.2021.11.05.13.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 13:29:03 -0700 (PDT)
Message-ID: <fb85e94a-a961-aad2-494d-9318e9ae8f1c@kali.org>
Date: Fri, 5 Nov 2021 15:29:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v2] drm/msm/devfreq: Fix OPP refcnt leak
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20211105202021.181092-1-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211105202021.181092-1-robdclark@gmail.com>
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
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/5/21 3:20 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index d32b729b4616..07f1169df89b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -20,6 +20,10 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   	struct msm_gpu *gpu = dev_to_gpu(dev);
>   	struct dev_pm_opp *opp;
>   
> +	/*
> +	 * Note that devfreq_recommended_opp() can modify the freq
> +	 * to something that actually is in the opp table:
> +	 */
>   	opp = devfreq_recommended_opp(dev, freq, flags);
>   
>   	/*
> @@ -28,6 +32,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   	 */
>   	if (gpu->devfreq.idle_freq) {
>   		gpu->devfreq.idle_freq = *freq;
> +		dev_pm_opp_put(opp);
>   		return 0;
>   	}
>   

Tested on the Lenovo Yoga C630 and don't see the message from v1 :D

Tested-By: Steev Klimaszewski <steev@kali.org>

