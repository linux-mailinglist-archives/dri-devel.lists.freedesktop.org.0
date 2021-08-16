Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6D33ED1C3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 12:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B8F8910D;
	Mon, 16 Aug 2021 10:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4C48910D;
 Mon, 16 Aug 2021 10:15:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h13so22843158wrp.1;
 Mon, 16 Aug 2021 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=nDZLANJ3zjlg8qcpDpXtNW0+CSx2CqBvgsXtfDv7fxs=;
 b=a/F/Vq9X+EDkGfRQYvnolgy0ATVt0DQj+nTWLadLpXs9i9dRONlzYsbyUR3LE4RUne
 0XjJgfQxs6WiHfEe00FVZv5ejpNnrx8Fq9DltiIcn/3eTZSzMQt9PKOUFroGjXpdpCI9
 yHs4QgFtS1hlhcRaW2k1L5QJLI2LIzm2zP6b4s/4lRytVjdr6J3VXtraDSxE2l8VYFWP
 pcS6L4s7k7yf2HB2wnvsn4J3k/FyQHkSDPubs8HZpDP9ez9fS2k6YEER52bK9+YKKFiI
 LhPQTj82/BAjxQ/7nwMX2ns0GSYvEJT5HOmPyRFpZmi0o8YZ+0U94FqhxHh37fvklflL
 n19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nDZLANJ3zjlg8qcpDpXtNW0+CSx2CqBvgsXtfDv7fxs=;
 b=nV5s93kv9q4JvUf/jKmjdHYPjmLik47T04pODNA/fy/Lccu8+YSGmd0jNSG2rEJUIQ
 FBze2eBSTJssEh2F/pB2YYA1Mr4tBr7j8jW6UI56Z7Q7UWzPmUoGpmmybOOh8WwJ+jD5
 eAZZE9MPwlkWTGI2VLN6s6MOy1TPEo6o7xw0Maw+cajLKLBuzBOSbpKlqPefMAa/GKB0
 P/UlVwsuQh4LI8uFDXYPn7Z5wd3Ih7c8A2WpazMPiJ+Y+u1j+u+HKxI/EcLTJdmxvcVB
 RwDO/f35wi/qnYFUzsTclgxsJJbcsniqC7BElJ1/VRaYnN4u0gTzTa617M2WDBaPacAn
 8WUw==
X-Gm-Message-State: AOAM531V4Ep9XX4/8i3sgHHExSxmrtfc7qKoH3Mx4e/7ORpQd1KFJVAm
 WzbwPIRyshyBTa48mq553RU=
X-Google-Smtp-Source: ABdhPJwqpYeHZyOoy+wLcE4jxrRof3XjuC8nnDGcK+VlCLMybiY6T7Z/PRxoS5A46oIm810V65WsCg==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr17047849wrs.179.1629108938443; 
 Mon, 16 Aug 2021 03:15:38 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7d83:fd8:eb16:8605?
 ([2a02:908:1252:fb60:7d83:fd8:eb16:8605])
 by smtp.gmail.com with ESMTPSA id a18sm9498664wmg.43.2021.08.16.03.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 03:15:38 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] dma-fence: Add deadline awareness
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>
References: <20210807183804.459850-1-robdclark@gmail.com>
 <20210807183804.459850-2-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <354a3118-c7ce-c1ff-60eb-788f3fa4b48d@gmail.com>
Date: Mon, 16 Aug 2021 12:15:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807183804.459850-2-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 07.08.21 um 20:37 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Add a way to hint to the fence signaler of an upcoming deadline, such as
> vblank, which the fence waiter would prefer not to miss.  This is to aid
> the fence signaler in making power management decisions, like boosting
> frequency as the deadline approaches and awareness of missing deadlines
> so that can be factored in to the frequency scaling.
>
> v2: Drop dma_fence::deadline and related logic to filter duplicate
>      deadlines, to avoid increasing dma_fence size.  The fence-context
>      implementation will need similar logic to track deadlines of all
>      the fences on the same timeline.  [ckoenig]
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-fence.c | 20 ++++++++++++++++++++
>   include/linux/dma-fence.h   | 16 ++++++++++++++++
>   2 files changed, 36 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ce0f5eff575d..1f444863b94d 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -910,6 +910,26 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
>   }
>   EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>   
> +
> +/**
> + * dma_fence_set_deadline - set desired fence-wait deadline
> + * @fence:    the fence that is to be waited on
> + * @deadline: the time by which the waiter hopes for the fence to be
> + *            signaled
> + *
> + * Inform the fence signaler of an upcoming deadline, such as vblank, by
> + * which point the waiter would prefer the fence to be signaled by.  This
> + * is intended to give feedback to the fence signaler to aid in power
> + * management decisions, such as boosting GPU frequency if a periodic
> + * vblank deadline is approaching.
> + */
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> +		fence->ops->set_deadline(fence, deadline);
> +}
> +EXPORT_SYMBOL(dma_fence_set_deadline);
> +
>   /**
>    * dma_fence_init - Initialize a custom fence.
>    * @fence: the fence to initialize
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 6ffb4b2c6371..9c809f0d5d0a 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>   	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +	DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>   	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
>   };
>   
> @@ -261,6 +262,19 @@ struct dma_fence_ops {
>   	 */
>   	void (*timeline_value_str)(struct dma_fence *fence,
>   				   char *str, int size);
> +
> +	/**
> +	 * @set_deadline:
> +	 *
> +	 * Callback to allow a fence waiter to inform the fence signaler of an
> +	 * upcoming deadline, such as vblank, by which point the waiter would
> +	 * prefer the fence to be signaled by.  This is intended to give feedback
> +	 * to the fence signaler to aid in power management decisions, such as
> +	 * boosting GPU frequency.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>   };
>   
>   void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> @@ -586,6 +600,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>   	return ret < 0 ? ret : 0;
>   }
>   
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
> +
>   struct dma_fence *dma_fence_get_stub(void);
>   struct dma_fence *dma_fence_allocate_private_stub(void);
>   u64 dma_fence_context_alloc(unsigned num);

