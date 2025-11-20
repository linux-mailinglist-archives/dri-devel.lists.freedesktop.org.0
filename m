Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E13C747A8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03DC10E756;
	Thu, 20 Nov 2025 14:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="VecqKQVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A030C10E75A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:14:28 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so11350675e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 06:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1763648067; x=1764252867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l4aXDIqbXLzQPpFmVuBKROa0mL/5b0LUIDBWeii3LLw=;
 b=VecqKQVmhTGGepnBnAqYP5HfEYGRk4yXexKMRRviWsEt7BNd8AG1d3Z5pk8vpa3bOv
 tTD8qizeDuatxJzS43MVwVhcK2cVoZ99JTKKetgzXFvVDEugLpPcAVH1Ol/oaCy9E/lh
 alzRcKgcBWKicCUyVXQTIEud7qUF+TGGueAuQibT1cgGc3fX6tosW4+YqkegWB3mKMKh
 oE3VTLAi5qKex6Wr6hIxrZQkVw5Gs2KAIORASOuS8oAvsoByTfBVwW8qI07Sseq+38qr
 vdBwdyZiCrYqbI1B7jPGMlr5VFef2eUpcCAX8+RnvPW1zWGy61y9A40fzhlKpVBQXD9u
 TRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763648067; x=1764252867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l4aXDIqbXLzQPpFmVuBKROa0mL/5b0LUIDBWeii3LLw=;
 b=H4+dMF2bfz8lTJYVzTNzXzUnneST/QjzW0AWkDWleuQ8+8ifIZ1mFia0qhgT2HTVaE
 3yPdkVHupDd0PNzdJSAk7+margvjzcVaSADJFha9X5T8V2tYNAi81OzTdYc3EBX8snAy
 +tikVfTGiS70mSPeemDowrJ5JE3O4LVNbS/NVXg5+5R5QV1PjLfle3/pgmsL/J0ogiBZ
 2fo3GygYJXNvYlChBrpkPcuFsTB0++UjcujXvfaI7oDHtWGQvTcNJzAGYeYfkuDAJRJ0
 ONxBwfeVrp+MOB6XNXrJeBnL7A0/ofte+Xp/qbCk+GATzjg/hk18R0EC8QdYxCxCEBKi
 D9UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+YL+xZQ9nAiuvN4jmilS9XRklXqNuFyZIyD2RlnAAIrC1CKXbCRQm+8yksFHv4WFzioms0blR2WQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybA8CugpYilpz8OFaOwwODsNyN8sk+t5Rx8NN8SvO3a8wCZy56
 ozJ5be7tbNIuA39e3IMcPjwDSXg+0jUj1tniHL63pKHA/E+OJyoin4+Pag8vnlWzXq4=
X-Gm-Gg: ASbGncted+DCYYjtzv9AkvHoWhNf7YRJfiFMXBuuusXKYrBai4A83pJ9RDooxBf0yOO
 594ccwUrzwu7ADQxKRul+faEWNqhBVZCqqNTu4Nm7PZJtFKhOypjiaetEMFXt8T1BVH4QOAStae
 AVWta2UzykpDIUjbLhMv4p2RJ+wxBrVg5qgviQK67NY1ds/J/rqxc+0MmygRgcaFcL5MEaGnKQR
 3fbqJgk5aYZAAnHBZ51Hm/9xlSIGDHTLQep81sjwkJOlYd0ZYurbo9olMsV5MFsghl8ay4Tvjpb
 DAsLVRfoqWod6mAXmJIrkKhZ9gTSB68qRVTZGtkNh/zx05MRXV5tMAxGAzZMKm4au7YEyZl7fX7
 f57taEwis2TIKJTK938yGBoaRkRwqykVlVB8MEFHqaJ71z5eWReQkLkQJnDSJYt1hOsUB36IIou
 qluzkfbaeXIhWC9wJ6vGOMXMJ4p/nwQqow9xSiazmi4IE=
X-Google-Smtp-Source: AGHT+IFnJhlqTiz2wCZ5pq9bATxrBbTFVbGNJfe4zz/siDIlX2GmBiOG/I+Jy/HPMkfisN/o/4Y3WQ==
X-Received: by 2002:a05:600c:1c25:b0:477:5c58:3d42 with SMTP id
 5b1f17b1804b1-477b895912cmr43182905e9.10.1763648067124; 
 Thu, 20 Nov 2025 06:14:27 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9e051d8sm66346425e9.5.2025.11.20.06.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 06:14:26 -0800 (PST)
Message-ID: <cb0b8f5b-11f8-4fee-8d72-396b05f9f708@ursulin.net>
Date: Thu, 20 Nov 2025 14:14:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/18] dma-buf: detach fence ops on signal v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-4-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251113145332.16805-4-christian.koenig@amd.com>
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


On 13/11/2025 14:51, Christian König wrote:
> When neither a release nor a wait backend ops is specified it is possible
> to let the dma_fence live on independently of the module who issued it.
> 
> This makes it possible to unload drivers and only wait for all their
> fences to signal.
> 
> v2: fix typo in comment
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
>   include/linux/dma-fence.h   |  4 ++--
>   2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ec21be9b089a..7074347f506d 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>   				      &fence->flags)))
>   		return -EINVAL;
>   
> +	/*
> +	 * When neither a release nor a wait operation is specified set the ops
> +	 * pointer to NULL to allow the fence structure to become independent
> +	 * from who originally issued it.
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
> index 77f07735f556..eb57bcc8712f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -436,7 +436,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   
>   	rcu_read_lock();
>   	ops = rcu_dereference(fence->ops);
> -	if (ops->signaled && ops->signaled(fence)) {
> +	if (ops && ops->signaled && ops->signaled(fence)) {
>   		rcu_read_unlock();
>   		dma_fence_signal_locked(fence);
>   		return true;
> @@ -472,7 +472,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
>   
>   	rcu_read_lock();
>   	ops = rcu_dereference(fence->ops);
> -	if (ops->signaled && ops->signaled(fence)) {
> +	if (ops && ops->signaled && ops->signaled(fence)) {
>   		rcu_read_unlock();
>   		dma_fence_signal(fence);
>   		return true;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

