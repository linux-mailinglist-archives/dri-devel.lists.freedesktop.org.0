Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D50221FE4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 11:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1B36EC38;
	Thu, 16 Jul 2020 09:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F154B6EBEA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 18:37:53 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j10so2510569qtq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wu5L69ovDWpf3LlRTghHvSZ9xDVM0oBpBNBxh9J31aU=;
 b=X41U7h2bTsN1nK0Puc/tLb924o67b+2UV9G0xJtvqBnjtGU2GJVoLTPmPc2FM+tUrb
 Yqa/M22owsTFVTn8qQuvMAhKKdbOchqlqkKcL3i9UZ7cUvoSJemVue+leOt2xxf4Udl8
 0QdSDzjGO8hph3oKTCCMmWEFoJT7nzr3yBVxVmuVLny7X4bnY73FE7kXEKyzlggqVxvG
 ilX0nPTbXIaLsc5zdeyl8IwR+yURCMy/1WPaHPWiskOYpN8t4ShR35rLkwoy8ME/5pnH
 P+ys0a1HCyZMA23ZGY+NOI1MtM773J6j+OiXsBamFl5mwJG04FdBbpXcVaX0EsJ17Cia
 EHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wu5L69ovDWpf3LlRTghHvSZ9xDVM0oBpBNBxh9J31aU=;
 b=OADZ8HLjnccqOApKPYnpIMFSyZOks5u6g6R9xkmGGfx1O4vd3RsqmDks2rS30fttpv
 Vo4QB7SVdqWOiUnwSk4PbqytgDmgaOcgtKbvia00EtTf6oma4qnILc1kEPVX1vNBO0Ld
 CPvVVblhaAI7THPt57+kNi0pCvzkgIN4+HEteybL/1OBgb9t03IgDk2RYqOs00cVC5hN
 n+npLl8j4JNq6Tac9IqJg+GnTef9kdjtDmwxgGQHy0Rcj34UWAf5S9/YMfhny7hsWa0o
 h5jpuoHbc0YHx8PzVjQks3W5K241ZHLA4ZCgVu5jOhH3usdRxZO/B0K+6ycHq7cGqX6c
 TqbA==
X-Gm-Message-State: AOAM531U9JiT8Qsk5EWRBq8KnMjBa6VIPHKhzClr+SSch8xlEpcZwl1B
 TZrzFBt7OPYcBghY0ryBlbUeaQ==
X-Google-Smtp-Source: ABdhPJz3H5u/h/w/d+GjGc1uZlqsx1rCJM9E4KLLiOaeaJjvmt5xA4eeQYXiFdMY+OuSMREJ5zLqug==
X-Received: by 2002:ac8:5542:: with SMTP id o2mr1219868qtr.47.1594838272913;
 Wed, 15 Jul 2020 11:37:52 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id z60sm4010802qtc.30.2020.07.15.11.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2020 11:37:52 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/adreno: fix gpu probe if no interconnect-names
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200715182955.3081774-1-robdclark@gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <baef95e0-e44f-be7d-f60f-0ba75b550050@marek.ca>
Date: Wed, 15 Jul 2020 14:36:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200715182955.3081774-1-robdclark@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:42:42 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/15/20 2:29 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If there is no interconnect-names, but there is an interconnects
> property, then of_icc_get(dev, "gfx-mem"); would return an error
> rather than NULL.
> 
> Also, if there is no interconnect-names property, there will never
> be a ocmem path.  But of_icc_get(dev, "ocmem") would return -EINVAL
> instead of -ENODATA.  Just don't bother trying in this case.
> 
> Fixes: 8e29fb37b301 ("drm/msm: handle for EPROBE_DEFER for of_icc_get")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 0527e85184e1..c4ac998b90c8 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -979,6 +979,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	struct adreno_platform_config *config = dev->platform_data;
>   	struct msm_gpu_config adreno_gpu_config  = { 0 };
>   	struct msm_gpu *gpu = &adreno_gpu->base;
> +	bool has_interconnect_names = true;
>   	int ret;
>   
>   	adreno_gpu->funcs = funcs;
> @@ -1005,12 +1006,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   
>   	/* Check for an interconnect path for the bus */
>   	gpu->icc_path = of_icc_get(dev, "gfx-mem");
> -	if (!gpu->icc_path) {
> +	if (IS_ERR_OR_NULL(gpu->icc_path)) {
>   		/*
>   		 * Keep compatbility with device trees that don't have an
>   		 * interconnect-names property.
>   		 */
>   		gpu->icc_path = of_icc_get(dev, NULL);

This is misleading because if it gets a EPROBE_DEFER error (or any other 
error), it will hit this path. Maybe there's a specific error you can 
check for instead to identify the "no-interconnect-names" case?

Also don't think its a good idea to be calling of_icc_get(dev, NULL) 
again when there's a EPROBE_DEFER, the interconnect driver could come up 
between the two calls

> +		has_interconnect_names = false;
>   	}
>   	if (IS_ERR(gpu->icc_path)) {
>   		ret = PTR_ERR(gpu->icc_path);
> @@ -1018,7 +1020,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   		return ret;
>   	}
>   
> -	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> +	if (has_interconnect_names)
> +		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> +
>   	if (IS_ERR(gpu->ocmem_icc_path)) {
>   		ret = PTR_ERR(gpu->ocmem_icc_path);
>   		gpu->ocmem_icc_path = NULL;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
