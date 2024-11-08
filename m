Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C89C1D7B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 14:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF3610E252;
	Fri,  8 Nov 2024 13:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="M4lCLqnG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E5710E252
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 13:01:31 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-431548bd1b4so18537435e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 05:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1731070890; x=1731675690;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AsTMzWFc172gyFlwJfjcaHsl1PfbQeXSLmAlVnZUerw=;
 b=M4lCLqnGwbMS5isIEhCwuk2rmnSvXf2pj2vfhNf5nQtPIUTMb8TGPPpF0dPi+XNBz3
 uIyBXyzK1yMCobi4fhess3QcShz+EalMKNAOfVGyddd0O7GeVbNrRoEhfM6mswKKg78W
 IchU0dQ2zh5EQefM0t26Qm9T6XgwNvFsKQpr4HzOAcA27abm8207XV28luWe5cxtAJDO
 tNqIRiJpjxlDStXYGyTxzOD1erLLwsq/0syynaYkiI8VpOjJZw8Wawca4xHZ5BcuUZ0y
 4px7gSTkP1P/k+MobuL5ti3//yLK3iWXpQfZLrsNGtrU4l10km5fwqtH3Slplx+uDh1Z
 wqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731070890; x=1731675690;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AsTMzWFc172gyFlwJfjcaHsl1PfbQeXSLmAlVnZUerw=;
 b=kEqIafWPpRoCL0PS/dnWJEgbXO0/r9abeJnKEfhUD+//uotVMUhfGx9sMsxnMu5J/h
 i5esLxQp+YVeUK1bKDGDt0mPo4146Kqvwua7NaWq5nZclMxpZE+gTKg+nM5SaJYjd2Yd
 vvBRVcXGlfnDywHibk02PyBRAjIdz0VHMDCxl2kzMGKUdcl42Wwgb5K8f/DsbuNaYJrE
 lUhcczmUfpl/TjmYeOrtFos9HPHa0OhjpR/LLngPsryDuKeukHAOJQcoCWSbOwfLarvT
 cfEIy17oPTHGAKJ4I7CCBb96dIiyaxl/H2itK8ImunRPdaXC9i+TPaE7uAuWc1MfmiWY
 khAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXApDshBdWD3YzamgRXVt4w0nJzTjqEiX0DiYL6UqBcfQot9S35ZAYiFA0jraFEFn7WjnyI9gRw1a0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3n4gXpfT4iqyYcx4SzvYGjJWe15+B/dLSjqJ3e0cl/mPu1xDB
 naTW/MufH17Yv2CiaLnOoS+b6z3XBIQr9K/zK1daD4mV5Hvil3ByZNH3gjKMnJI=
X-Google-Smtp-Source: AGHT+IGRErYPjO9GB8BDAlN1Pg3ZNytJKAE0Pem6aEdsR36TwBQpUY4A6PXZDYAExwsfNmupStw5BA==
X-Received: by 2002:a05:600c:4f12:b0:431:5503:43ca with SMTP id
 5b1f17b1804b1-432b751f53cmr20198705e9.28.1731070889829; 
 Fri, 08 Nov 2024 05:01:29 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b0530599sm67162375e9.1.2024.11.08.05.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 05:01:28 -0800 (PST)
Message-ID: <cce719d7-adc9-4f5b-803a-fd173d325806@ursulin.net>
Date: Fri, 8 Nov 2024 13:01:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix dma_fence_array_signaled
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 boris.brezillon@collabora.com, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 lionel.g.landwerlin@intel.com, dri-devel@lists.freedesktop.org,
 faith.ekstrand@collabora.com, simona@ffwll.ch
References: <20241108094256.3717-1-christian.koenig@amd.com>
 <20241108094256.3717-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241108094256.3717-2-christian.koenig@amd.com>
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


On 08/11/2024 09:42, Christian König wrote:
> The function silently assumed that signaling was already enabled for the
> dma_fence_array. This meant that without enabling signaling first we would
> never see forward progress.
> 
> Fix that by falling back to testing each individual fence when signaling
> isn't enabled yet.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence-array.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 46ac42bcfac0..01203796827a 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -103,10 +103,22 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>   static bool dma_fence_array_signaled(struct dma_fence *fence)
>   {
>   	struct dma_fence_array *array = to_dma_fence_array(fence);
> +	unsigned int i, num_pending;
>   
> -	if (atomic_read(&array->num_pending) > 0)
> +	num_pending = atomic_read(&array->num_pending);
> +	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
> +		if (!num_pending)
> +			goto signal;
>   		return false;
> +	}
> +
> +	for (i = 0; i < array->num_fences; ++i) {
> +		if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
> +			goto signal;
> +	}
> +	return false;

Sampling num_pending (and decrementing) and test_bit from an unlocked 
path makes one need to think if there are consequences, false negatives, 
positives or something. Would it be fine to simplify like the below?

static bool dma_fence_array_signaled(struct dma_fence *fence)
{
	struct dma_fence_array *array = to_dma_fence_array(fence);
	unsigned int i;

	if (atomic_read(&array->num_pending)) {
		for (i = 0; i < array->num_fences; i++) {
			if (!dma_fence_is_signaled(array->fences[i]))
				return false;
		}
	}

	dma_fence_array_clear_pending_error(array);
	return true;
}

Or if the optimisation to not walk the array when signalling is already 
enabled is deemed important, perhaps a less thinking inducing way would 
be this:

static bool dma_fence_array_signaled(struct dma_fence *fence)
{
	struct dma_fence_array *array = to_dma_fence_array(fence);
	unsigned int i;

	if (atomic_read(&array->num_pending) == 0)
		goto signalled;

	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags))
		return false;

	for (i = 0; i < array->num_fences; i++) {
		if (!dma_fence_is_signaled(array->fences[i]))
			return false;
	}

signalled:
	dma_fence_array_clear_pending_error(array);
	return true;
}

Decrementing locally cached num_pending in the loop I think does not 
bring anything since when signalling is not enabled it will be stuck at 
num_fences. So the loop walks the whole array versus bail on first 
unsignalled, so latter even more efficient.

In which case, should dma-fence-chain also be aligned to have the fast 
path bail out?

Regards,

Tvrtko

>   
> +signal:
>   	dma_fence_array_clear_pending_error(array);
>   	return true;
>   }
