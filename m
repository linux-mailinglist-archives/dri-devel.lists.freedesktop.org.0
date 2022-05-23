Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1204153075E
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 03:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC2310E429;
	Mon, 23 May 2022 01:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052FF10E28E;
 Mon, 23 May 2022 01:59:05 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 202so5399467pfu.0;
 Sun, 22 May 2022 18:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vD+DGie99zMkr0nJSBJghK7m9B4fcVep+NfF0Px5NeI=;
 b=UlU4j2O6HkuShPLRu/4u5GJiJ2CR1lrNCFQWQ3sarMDfjW3K35g5qugZRYr/bBsWMu
 sE5exKzQmF/F3MYbkC8G7PpD8LVneNqDvmVGPDRq8ZzwJ4s4FYk6ysLjd+0AKr89AI11
 WMX6f9PCKQ1MH9bSM+5o6Y8TImhjXLFM9jXTF2B7msyggWdCI4jEd9rR9whV5ZgcL5bm
 C3hu7HJCcQKC5SKKMU5vqy74ZftwJBS4P1Zwzx85K9+p0YF5ET0APiECuHeedzBqq1OH
 rgKZAhIqFADAwLBKp+duuuKcDz+a/q/vS/Z7YVtFI1kXc+pW/bGmZ64e/FaUUqB1yvak
 +yZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vD+DGie99zMkr0nJSBJghK7m9B4fcVep+NfF0Px5NeI=;
 b=dLYZV7T/lYIep8lZKtmy4p3z8Mh3UdWlioOdXs3j/bmPCrsKrD97CChyQkGHaLR1I0
 GLDdSeCmVHe68j+naUlOm/jO0lgcPbWG4L/P6mF5+WW2y1mAH6GeWrlFWQCY2QukormJ
 wl1MNVpk9I8q0tikk42WZmHT5OrHajJXmr15sMxaZAsjngmIjADFF/hPoHz0vkJptA6I
 oUUC5QVdsDmdy/adcCbAXxrTXehfoQKIHUXH9G4SiJYSd0NyMe1ScPlbMxLMsEJk+WBs
 wpIBB/yslBAF+fyKiC4p2YEnCS+hbXTkVQKjTL2NpCruBJsJido0xFE6zNot+oGp/ByH
 fKNg==
X-Gm-Message-State: AOAM5338W2OPzOYkCw4ny/+ldrTOI3HmxCSYHIJILUbr7/p7sNHkBoQz
 JXxz1s5SdMBb6pmmKUebCx4=
X-Google-Smtp-Source: ABdhPJy2p/jFV7g6ZgpcDogCvhXmrWLXQEZijPyaAoNQV+V83ON3F3qw4ZovWJ4SBd+qU6FmZPMsOw==
X-Received: by 2002:a63:8bc1:0:b0:3f9:f00b:f877 with SMTP id
 j184-20020a638bc1000000b003f9f00bf877mr7866091pge.378.1653271145241; 
 Sun, 22 May 2022 18:59:05 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a6542cd000000b003c619f3d086sm3607429pgp.2.2022.05.22.18.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 18:59:04 -0700 (PDT)
Message-ID: <61149e02-ad4c-6e3d-e33b-b21025aa3b65@gmail.com>
Date: Mon, 23 May 2022 09:58:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm: msm: fix possible memory leak in
 mdp5_crtc_cursor_set()
Content-Language: en-US
To: robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
 airlied@linux.ie, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 gbeeresh@codeaurora.org, sviau@codeaurora.org, wentaox@codeaurora.org
References: <20220509061125.18585-1-hbh25y@gmail.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <20220509061125.18585-1-hbh25y@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/5/9 14:11, Hangyu Hua wrote:
> drm_gem_object_lookup will call drm_gem_object_get inside. So cursor_bo
> needs to be put when msm_gem_get_and_pin_iova fails.
> 
> Fixes: e172d10a9c4a ("drm/msm/mdp5: Add hardware cursor support")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index b966cd69f99d..6a5f73f6a23b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -991,8 +991,10 @@ static int mdp5_crtc_cursor_set(struct drm_crtc *crtc,
>   
>   	ret = msm_gem_get_and_pin_iova(cursor_bo, kms->aspace,
>   			&mdp5_crtc->cursor.iova);
> -	if (ret)
> +	if (ret) {
> +		drm_gem_object_put(cursor_bo);
>   		return -EINVAL;
> +	}
>   
>   	pm_runtime_get_sync(&pdev->dev);
>   

Gentel ping.
