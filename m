Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF77B41F785
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 00:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38656E5A2;
	Fri,  1 Oct 2021 22:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959336E5A2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 22:42:09 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b20so44470115lfv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 15:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ye+Ig/O23GoJ8Iq7iv3h8SxIDcT6+17KTEH2/egvfXA=;
 b=kuxvhMFSDeYBLvpTecKb2W/0DEQVCCzuQ8WydZmEuAyKLsJ/t2j2sq+9gJcCBN4sHb
 69RW+i+IQpE4EdrUeUA+5aoZr61mrZSzsYFPMcX+eKMeYm3i4F7V7L84Bxh9NguysWKP
 LsvMmbD2FlTKjLIIRCFyuX/HG7jEH4uhRuVqKVFdkviOXKlHvly1pESBR/NQ+WBHumNB
 BNzN1/ZftsFCcEt5anj6+Csv5jx84fQFS0bfJ+70XXqNEC+gOHHot0pGxjqLZfzuDwOE
 UEnXxs1QNW1rT5WJao9TDCqK/SdE9dXUklowGzFcTXHTko7Uqa4+g3kGaq+kBN2+0iXb
 4uBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ye+Ig/O23GoJ8Iq7iv3h8SxIDcT6+17KTEH2/egvfXA=;
 b=YjlpvHMDdlRBoCp8JGaMipVYxXpdrv/b+JgbQY8++W47HusnD8wST9FjiIDp76eYWG
 Ssy3bgAkXQIMF+FxB/dnpdPP3wKLdT3d/LcW/bdXrdjnyi34PKXVniSL40P6CVWMbs88
 RXTYEpP2OqnumfaGJOCBtUxebKF4Ekekxge195wB5eBOJv4X3Dl/qHMpBCGc+WbHori8
 brw/rqJQiAvFB7kCepSANG0hHVvVD7jWvD43y3+LcO8o6qA8v2yL6SgJ5GC4cTDqruXN
 w/dFFiubtpmflSvedkbU0Xd+9DkjlKWrhel6Vo5h30FEt8WdhcyfUgxN1ndBAMjrRvc+
 fVGQ==
X-Gm-Message-State: AOAM532GOR8zapz7DlC4M0w4Ou5P/zJ30L2qqZlY8k3LiU7mzcF8HVbJ
 nrPTqM9fqNs98HYQr/m+Kt+QBA==
X-Google-Smtp-Source: ABdhPJzSjmTgZF2x7IHWeD8LUXrXxoktmZ4B7IHcP4t5nkYVl1sKDlVVSXKFABEJeRK7+vfZnUasxQ==
X-Received: by 2002:a05:6512:228a:: with SMTP id
 f10mr556331lfu.619.1633128127810; 
 Fri, 01 Oct 2021 15:42:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o21sm24068lfo.52.2021.10.01.15.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 15:42:07 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: prevent NULL dereference in
 msm_gpu_crashstate_capture()
To: Tim Gardner <tim.gardner@canonical.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210929162554.14295-1-tim.gardner@canonical.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7d251b1c-1054-6fde-602f-35eed4ac1cfe@linaro.org>
Date: Sat, 2 Oct 2021 01:42:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210929162554.14295-1-tim.gardner@canonical.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/09/2021 19:25, Tim Gardner wrote:
> Coverity complains of a possible NULL dereference:
> 
> CID 120718 (#1 of 1): Dereference null return value (NULL_RETURNS)
> 23. dereference: Dereferencing a pointer that might be NULL state->bos when
>      calling msm_gpu_crashstate_get_bo. [show details]
> 301                        msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
> 302                                submit->bos[i].iova, submit->bos[i].flags);
> 
> Fix this by employing the same state->bos NULL check as is used in the next
> for loop.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 8a3a592da3a4..2c46cd968ac4 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -296,7 +296,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>   		state->bos = kcalloc(nr,
>   			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
>   
> -		for (i = 0; i < submit->nr_bos; i++) {
> +		for (i = 0; state->bos && i < submit->nr_bos; i++) {
>   			if (should_dump(submit, i)) {
>   				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
>   					submit->bos[i].iova, submit->bos[i].flags);
> 


-- 
With best wishes
Dmitry
