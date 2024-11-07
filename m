Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9AE9C0AA6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 17:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53B610E160;
	Thu,  7 Nov 2024 16:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Frmavs1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F89510E160
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 16:00:39 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53c73f01284so1201545e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1730995237; x=1731600037;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cVJY4WgDUJnnXOzDvA54gLD2LW4WcBPotISDBySE6q0=;
 b=Frmavs1watl0Q7HNHX8KFJUcnCt4X17KNjIbfByHBj291J4rLrYxNWq2aCM07OaMaI
 H/7F+dn3qX2mNYqsOna3r8Txz8CbSjgm91o9ChwFi6LwtQgwGkLLfJZXx9qb61zGBVHj
 Dm1rSneB6m174UXJ1Mj+EswLgpjp72HNaiG2k25C2XGyYh4m7wseFcEsFD3OIF+HPTCs
 00HQPa/vK5RVy1EZ9ffPSiuARsqQwytcd0kmMWbi+fgpYthS2a0FIjUNXrXdMfIWKc58
 59+LibXVYQl2Moyv7CP+aP1+LRdJRmbingawmDba9ODvKaBOYHrwfQRflk3HmOeongTk
 aHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730995237; x=1731600037;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cVJY4WgDUJnnXOzDvA54gLD2LW4WcBPotISDBySE6q0=;
 b=o0VcdcTL7B2Z5kEup4S0Qt21H+kc/D6M6BnopA4zYOM9IHE4ALfJKtv3ke6K+TCNCK
 L5KC5HK6XTEfXA9gyOyplR9B39iwtuxk7XLYydQbWNk8yhwiQ4rZ895TxyZtxkdwp1Ue
 69gx4/dFF5AtKyBi2V54LybCYExKMPtfUmHpjnOsAtDUglhKlwLcZrFZNEM3KkasaZ/k
 idwIjJv1CW49wVPL4Aq05gaz5RCnGVGc+DpZt7UjYO1IH3OazY29dHp9iTXmJeSLl3OG
 GDkiJdAdqQMBIi/6AsAv5CCxF2rV63Mv8FFN8HhwXfC14jSu5m3Y3Qmj22+n/cOqa21o
 S3oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhC+wY/FP7Sd6Q2jSpHgm1VWT92iixPsEJCW4jUEVu5W/jLRor16sfv7lIUZYMaQR4+1D2Eu5Gy4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi/VQBkVPNW6T5+pVk1cn63VlUG9V/0Hexlb5UePzJUPn1cxa/
 ScGT3cMcDv6P3IhXVUP83FHehLYYkd0NZI79Tz9KT1LF6Aha2i5Lib9aFd3I5pw=
X-Google-Smtp-Source: AGHT+IEkRBv31IQHDcCUliUShKwtu/OJIya3n3E7DYCttdJ5QA5CftK9w2Ce95teCeAZ5BCMWxF5Hg==
X-Received: by 2002:a05:6512:12cd:b0:53a:bb7:ed77 with SMTP id
 2adb3069b0e04-53d8590a202mr342631e87.14.1730995235879; 
 Thu, 07 Nov 2024 08:00:35 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432a26a6da1sm68212035e9.0.2024.11.07.08.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 08:00:35 -0800 (PST)
Message-ID: <bf0a51cb-a112-45d7-b55f-47a75ed87da6@ursulin.net>
Date: Thu, 7 Nov 2024 16:00:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dma-buf: sort fences in dma_fence_unwrap_merge
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-3-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241024124159.4519-3-christian.koenig@amd.com>
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


On 24/10/2024 13:41, Christian König wrote:
> The merge function initially handled only individual fences and
> arrays which in turn were created by the merge function. This allowed
> to create the new array by a simple merge sort based on the fence
> context number.
> 
> The problem is now that since the addition of timeline sync objects
> userspace can create chain containers in basically any fence context
> order.
> 
> If those are merged together it can happen that we create really
> large arrays since the merge sort algorithm doesn't work any more.
> 
> So put an insert sort behind the merge sort which kicks in when the
> input fences are not in the expected order. This isn't as efficient
> as a heap sort, but has better properties for the most common use
> case.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 39 ++++++++++++++++++++++++++----
>   1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 628af51c81af..d9aa280d9ff6 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -106,7 +106,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
>   
>   	count = 0;
> -	do {
> +	while (true) {
>   		unsigned int sel;
>   
>   restart:
> @@ -144,11 +144,40 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   			}
>   		}
>   
> -		if (tmp) {
> -			array[count++] = dma_fence_get(tmp);
> -			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +		if (!tmp)
> +			break;
> +
> +		/*
> +		 * We could use a binary search here, but since the assumption
> +		 * is that the main input are already sorted dma_fence_arrays
> +		 * just looking from end has a higher chance of finding the
> +		 * right location on the first try
> +		 */
> +
> +		for (i = count; i--;) {
> +			if (likely(array[i]->context < tmp->context))
> +				break;
> +
> +			if (array[i]->context == tmp->context) {
> +				if (dma_fence_is_later(tmp, array[i])) {
> +					dma_fence_put(array[i]);
> +					array[i] = dma_fence_get(tmp);
> +				}
> +				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +				goto restart;
> +			}
>   		}
> -	} while (tmp);
> +
> +		++i;
> +		/*
> +		 * Make room for the fence, this should be a nop most of the
> +		 * time.
> +		 */
> +		memcpy(&array[i + 1], &array[i], (count - i) * sizeof(*array));
> +		array[i] = dma_fence_get(tmp);
> +		fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +		count++;

Having ventured into this function for the first time, I can say that 
this is some smart code which is not easy to grasp. It could definitely 
benefit from a high level comment before the do-while loop to explain 
what it is going to do.

Next and tmp local variable names I also wonder if could be renamed to 
something more descriptive.

And the algorithmic complexity of the end result, given the multiple 
loops and gotos, I have no idea what it could be.

Has a dumb solution been considered like a two-pass with a 
pessimistically allocated fence array been considered? Like:

1) Populate array with all unsignalled unwrapped fences. (O(count))

2) Bog standard include/linux/sort.h by context and seqno. (O(count*log 
(count)))

3) Walk array and squash same context to latest fence. (Before this 
patch that wasn't there, right?). (O(count)) (Overwrite in place, no 
memcpy needed.)

Algorithmic complexity of that would be obvious and code much simpler.

Regards,

Tvrtko

> +	};
>   
>   	if (count == 0) {
>   		tmp = dma_fence_allocate_private_stub(ktime_get());
