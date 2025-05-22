Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71298AC0E0A
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB7310E01F;
	Thu, 22 May 2025 14:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="q2z9k+kr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C203310E894
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 14:27:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-442f4a3a4d6so52827125e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 07:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747924070; x=1748528870;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r3CUkSuyGMM/iDSPpw7yzXgxv8vCdoYsx9Xb1Wnizsc=;
 b=q2z9k+kr/YkNu5iWqyipiUFoqnFq8S9SsHGouyIQTvi7GEHmXBCwib5jYk3GTIR/2k
 lRh9KyiDc4ekh+j2kQ83MZJ+c5Vkw/daYLYI0JUgnevRhgaofc8FN38wU6LmmVMCGVbz
 rGsRjixCkmJqvce4WFrVZsnMxg2eHEK+toPZweGQ794GNcJ02Rzz6uZNniA2Z8eM4Qdu
 u4GEsxhqL0KynOgCLkZOHoZYLkWBNYevjcqPkX3JTIAL4gown8Ba+6XNG/ww2hVh8KVZ
 9rCNHtMNDlGnNTEIq7blpRPkeQPS3ahxqkYnkseUNWdgXmi5ybpoP/ma75hPqVECq2e8
 xWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747924070; x=1748528870;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r3CUkSuyGMM/iDSPpw7yzXgxv8vCdoYsx9Xb1Wnizsc=;
 b=oWGkjdeh1zyzkeyLOwhrv3RRtMX7cfAyjwAU0sJbw2WcvQJhQfawJrvZdDzu5TXo+j
 koV9dnpyUXrCNGI9ELap1gteqKOBjL19ualzrkKCGIpPCDdKvh7XNL9wXX+nFwZYtS+2
 wP2ipWJDRK/SICR46iycCVd3pDLaiO+KLwq41WY1d6ACfmor7smr3tcd+hoa6B6vVEMO
 EVbOIHVmw8o0+LL5EDqau6DZKwi+Vq/VEA+I7vv6cWLbBbyKTXtCOZRBf8laP0zLLa/4
 THv8x/rIpSbbtDyjrTNWIS0Wce+l1yGygc/lv72bDUxs4lRu6r20z74+6VhbT+QhgiE+
 2gpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp81zWYIVxtG9g01aUD4nEP/JHGBZf8tPZWR6s811wigXNR9ElmYceFcRc7plO/nBeJUzJZaMjhgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7mT3hHeKBanSUJvivsgL3c7tWWPd59l19MhMF/PZt/q4s2Lsr
 vU9/Ix0lHZs8YUzJxbpnSeB+G0cJzIpC5TQ8wlSPe5ihCjgOfjwQs2nGVdT7ecQRM9s=
X-Gm-Gg: ASbGncuP7AJIt4rh8LSuBSOwxzpVwZEY2Mfq4CJGvVNps8HfSYSQnL2DmlDPeQJBQqW
 9bYrEqAkHGLnJMlAdMR36zqOUh1KiRMRwBPdZFZkanK5epI13UvNT9Im/2TlNpot/CC0SvluNz6
 z5K8DIrwzT5eQqzxkf+YqoECmIH5AEBW7+Nsg99zRQlgYj2kD1DutowaSMa1KqKYrPYdymz4I1+
 MIv4cJRc/ETVojy9UAIKT/Z4IsKAQqAxAxxa8IqrTouzDFcU5DVMJsP/xrJI4wzaSRZWsKFB4eA
 lxrLmz0OLoOx7GE1x2FJU2GVT4AJWvVhRTemzUJAOFTbkY68bf+sWIA1W+emsAodSA==
X-Google-Smtp-Source: AGHT+IHg0quBXnMhB3/2LbsiZq4xrGh7dEnTLKhHDdKYqS/020dDeJdsxyvYjoxTzglDQJtcTWg4zQ==
X-Received: by 2002:a05:600c:5012:b0:440:69f5:f179 with SMTP id
 5b1f17b1804b1-442f84d5511mr280049105e9.7.1747924069673; 
 Thu, 22 May 2025 07:27:49 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3dd99absm105020075e9.37.2025.05.22.07.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 07:27:49 -0700 (PDT)
Message-ID: <a96a73ee-32a5-4c38-b277-e76101b94837@ursulin.net>
Date: Thu, 22 May 2025 15:27:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency a bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250522134117.7561-1-christian.koenig@amd.com>
 <20250522134117.7561-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250522134117.7561-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 22/05/2025 14:41, Christian König wrote:
> Since we already iterated over the xarray we know at which index the new
> entry should be stored. So instead of using xa_alloc use xa_store and
> write into the index directly.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f7118497e47a..d2d64bf17c96 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   				 struct dma_fence *fence)
>   {
> +	unsigned long index = -1;
>   	struct dma_fence *entry;
> -	unsigned long index;
> -	u32 id = 0;
> -	int ret;
>   
>   	if (!fence)
>   		return 0;
> @@ -896,11 +894,13 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   		return 0;
>   	}
>   
> -	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
> -	if (ret != 0)
> +	entry = xa_store(&job->dependencies, index + 1, fence, GFP_KERNEL);

 From the code it looks index does not "move" for NULL slots?

That is, if someone:

1) Preallocates one entry, when trying to populate it index will be -1 
after xa_for_each?

2) Add one, preallocate one, then add one more - index will be 0 after 
xa_for_each?

Regards,

Tvrtko

> +	if (xa_is_err(entry))
>   		dma_fence_put(fence);
> +	else
> +		WARN_ON(entry);
>   
> -	return ret;
> +	return xa_err(entry);
>   }
>   EXPORT_SYMBOL(drm_sched_job_add_dependency);
>   

