Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C6BE23E2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2920210E2E8;
	Thu, 16 Oct 2025 08:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Q+F60BvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294B610E2EC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:56:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-42701aa714aso184456f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760604976; x=1761209776;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ld4JaQdDubeY+xBbuBTlIAZgwZbmofY6qMW6Qv7PyXI=;
 b=Q+F60BvFuiE/1XxOiFcVHzMZRqOoiIXNd7WyTWEDKHezKTTDlKBJLAfKOfaFugz/4z
 fVzNu+7FDnbAMv185vlYzNvqZIJtmGeFkVJTGTciNN1RusDkZ+WwbELT0+/RoDbHgF34
 UAFaq1OAlBVzi6IlqKh+u4yTtWUUl84+k2ZMj6esX+TiCmUpzfWShCXYJKV2vszUSNVT
 gkYRJnreEJEX7ut4ooql04Aj2GT0GhnFwyHCGLjekljMrozJpg23qOw49bmOFQnBat64
 RUI7jfJv98J0fdj3Up+YlGXW6z0CEBSNbwJOKpQY81iWKNyy8xttIIu3TNDjjskcVU65
 BC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760604976; x=1761209776;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ld4JaQdDubeY+xBbuBTlIAZgwZbmofY6qMW6Qv7PyXI=;
 b=OVr8U+B8J3XFtsGwqf9ZZNo6Rby9cNhH320ErkV/G8gRKkWbzq+WftS2aBg0yh8LoC
 qeFAMlSgkfkKvkCeVJpAsEQ+Oa0xrlALN2KOZ+e2w9SIjxXh3bVWMfx411YH/QoYnlT0
 tpg3JdH+e8/Jil6K5KjVOet5ikhkf5f0EgvHGfp4Nh3TzN0Sz5jzz7WLBFNBsBXTSRGN
 5CJLwNYoviwZ2m3i953J3U3zO3E++L2RZyCkwFbYpSres/ZgMy40xf7/gSXq99CWJcho
 x3wt2IU3e8B1U7KCtPSbo30m0q+zmTX4CAuFGyfbEIWO7QXhh++g2tHWXWeMpfU5w95c
 CZCA==
X-Gm-Message-State: AOJu0YzaJLKn3nFx/jGiC6IfAoV2CFzzlGtY3O8PofQZoVQFxgHl/sJB
 GcjptWwRNVo7lOcQoBTHFrcjyKOEGz4facxDr2eZWb3yOy/jVW1VkQodFnRx5k0mqcA=
X-Gm-Gg: ASbGnctLx2FSnQo9hg0JX1X2ZZ6H5aybwMpYt+rJ/KgvnMFlm4VUjtRsdH8Bp1YTica
 hdo9/sG8z432dmb00B6Y4n0JY/OeLaOCMde8AA+kM7Sg9HZ0X5x6ImKFDrLjMCrm6mSx4UB4PuN
 zmwRm+yqJJrmb+kW8wL0DKuvcESY7Sq2wdo+KmNQrmc0AR72G7SGxzGHkL6QGrWxrwuTa+MUfY1
 0tZacGjnyth1xapSgt5JTpzrLU6T2khI0jYN0s9hucyMp2CeSygPzW0NHXpJ+Sgx5ihvp/c6U26
 S1YZ62YGDl80FHivRLL/PD+DZIFykc+u/N0qp2qRhH5mqpeIGRj4adEs/xx1OkUWNXOe3AyGO7S
 TZvD1g08hoULpbTLo41E2C1iozExo0AI6TScTEsoJT3kqhntatLpJB2VCzWWOFP21tqQE/Fhhnf
 VMnuG9fhl8BPDDNH7gd2yX+xvJZK0ssaOz+z25
X-Google-Smtp-Source: AGHT+IHUVIApC2zyH00jn35B6TMEEcyyTBTdVThnf5X2UhcsFjmJvBt+pvinO2s3vyx4e99EGrePig==
X-Received: by 2002:a05:6000:603:b0:425:8bff:69fe with SMTP id
 ffacd0b85a97d-4266e8e6c55mr20181128f8f.57.1760604975502; 
 Thu, 16 Oct 2025 01:56:15 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf790sm32280768f8f.28.2025.10.16.01.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 01:56:15 -0700 (PDT)
Message-ID: <d5ea9ed0-d599-4b9f-92c8-a2e711371017@ursulin.net>
Date: Thu, 16 Oct 2025 09:56:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] dma-buf: detach fence ops on signal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-5-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251013143502.1655-5-christian.koenig@amd.com>
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


On 13/10/2025 14:48, Christian König wrote:
> When neither a release nor a wait operation is specified it is possible
> to let the dma_fence live on independent of the module who issued it.
> 
> This makes it possible to unload drivers and only wait for all their
> fences to signal.

Have you looked at whether the requirement to not have the release and 
wait callbacks will exclude some drivers from being able to benefit from 
this?

Regards,

Tvrtko
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
>   include/linux/dma-fence.h   |  4 ++--
>   2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 982f2b2a62c0..39f73edf3a33 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>   				      &fence->flags)))
>   		return -EINVAL;
>   
> +	/*
> +	 * When neither a release nor a wait operation is specified set the ops
> +	 * pointer to NULL to allow the fence structure to become independent
> +	 * who originally issued it.
> +	 */
> +	if (!fence->ops->release && !fence->ops->wait)
> +		RCU_INIT_POINTER(fence->ops, NULL);
> +
>   	/* Stash the cb_list before replacing it with the timestamp */
>   	list_replace(&fence->cb_list, &cb_list);
>   
> @@ -513,7 +521,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>   	rcu_read_lock();
>   	ops = rcu_dereference(fence->ops);
>   	trace_dma_fence_wait_start(fence);
> -	if (ops->wait) {
> +	if (ops && ops->wait) {
>   		/*
>   		 * Implementing the wait ops is deprecated and not supported for
>   		 * issuer independent fences, so it is ok to use the ops outside
> @@ -578,7 +586,7 @@ void dma_fence_release(struct kref *kref)
>   	}
>   
>   	ops = rcu_dereference(fence->ops);
> -	if (ops->release)
> +	if (ops && ops->release)
>   		ops->release(fence);
>   	else
>   		dma_fence_free(fence);
> @@ -614,7 +622,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   
>   	rcu_read_lock();
>   	ops = rcu_dereference(fence->ops);
> -	if (!was_set && ops->enable_signaling) {
> +	if (!was_set && ops && ops->enable_signaling) {
>   		trace_dma_fence_enable_signal(fence);
>   
>   		if (!ops->enable_signaling(fence)) {
> @@ -1000,7 +1008,7 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>   
>   	rcu_read_lock();
>   	ops = rcu_dereference(fence->ops);
> -	if (ops->set_deadline && !dma_fence_is_signaled(fence))
> +	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
>   		ops->set_deadline(fence, deadline);
>   	rcu_read_unlock();
>   }
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 38421a0c7c5b..e1ba1d53de88 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -425,7 +425,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   
>   	rcu_read_lock();
>   	ops = rcu_dereference(fence->ops);
> -	if (ops->signaled && ops->signaled(fence)) {
> +	if (ops && ops->signaled && ops->signaled(fence)) {
>   		rcu_read_unlock();
>   		dma_fence_signal_locked(fence);
>   		return true;
> @@ -461,7 +461,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
>   
>   	rcu_read_lock();
>   	ops = rcu_dereference(fence->ops);
> -	if (ops->signaled && ops->signaled(fence)) {
> +	if (ops && ops->signaled && ops->signaled(fence)) {
>   		rcu_read_unlock();
>   		dma_fence_signal(fence);
>   		return true;

