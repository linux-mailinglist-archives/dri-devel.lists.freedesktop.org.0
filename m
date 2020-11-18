Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28312B8D6C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2E26E573;
	Thu, 19 Nov 2020 08:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30766E459
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 20:28:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605731284; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ur6glR/qi0TR8CQKk8j+lGgChxddt0kHiTvic5gvPKM=;
 b=o04wAUu0H2/RzEHz/R7dRlO3RUllT3Gu5k2HHdnz9ovkw+0tnzQfWd4IGdYo/C7z4Pv4YCqy
 KCpRTNpCnT0FhZUl7SyQpaW7Euu62x8YYXEKr+aACaU0ka7KoC8lh7WEkT6fuXAQixFM7UJ9
 0djDBUGnSp1m5s41ET6sJqEvDxU=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fb583d27e9d874dfca99a2c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Nov 2020 20:28:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ED352C43464; Wed, 18 Nov 2020 20:28:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: veeras)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E0D26C433C6;
 Wed, 18 Nov 2020 20:27:59 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 12:27:59 -0800
From: veeras@codeaurora.org
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: Re: [PATCH RESEND 1/2] dma-fence: allow signaling drivers to set
 fence timestamp
In-Reply-To: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
References: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
Message-ID: <56c9f6721234666dea40d316e0dd24b6@codeaurora.org>
X-Sender: veeras@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: pdhaval@codeaurora.org, sean@poorly.run, abhinavk@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-12 10:27, Veera Sundaram Sankaran wrote:
> Some drivers have hardware capability to get the precise timestamp of
> certain events based on which the fences are triggered. This allows it
> to set accurate timestamp factoring out any software and IRQ latencies.
> Move the timestamp parameter out of union in dma_fence struct to allow
> signaling drivers to set it. If the parameter is not set, ktime_get is
> used to set the current time to fence timestamp during 
> dma_fence_signal.
> 

@Sumit Semwal / @Gustavo Padovan,
Can you please help in reviewing this change as it falls in dma-fence 
files.
Thanks,
Veera

> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> ---
>  drivers/dma-buf/dma-fence.c | 18 ++++++++++--------
>  include/linux/dma-fence.h   | 15 +++------------
>  2 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 43624b4..7cef49a 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2012 Canonical Ltd
>   * Copyright (C) 2012 Texas Instruments
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>   *
>   * Authors:
>   * Rob Clark <robdclark@gmail.com>
> @@ -329,7 +330,6 @@ void __dma_fence_might_wait(void)
>  int dma_fence_signal_locked(struct dma_fence *fence)
>  {
>  	struct dma_fence_cb *cur, *tmp;
> -	struct list_head cb_list;
> 
>  	lockdep_assert_held(fence->lock);
> 
> @@ -337,16 +337,18 @@ int dma_fence_signal_locked(struct dma_fence 
> *fence)
>  				      &fence->flags)))
>  		return -EINVAL;
> 
> -	/* Stash the cb_list before replacing it with the timestamp */
> -	list_replace(&fence->cb_list, &cb_list);
> -
> -	fence->timestamp = ktime_get();
> +	/* set current time, if not set by signaling driver */
> +	if (!fence->timestamp)
> +		fence->timestamp = ktime_get();
>  	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>  	trace_dma_fence_signaled(fence);
> 
> -	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
> -		INIT_LIST_HEAD(&cur->node);
> -		cur->func(fence, cur);
> +	if (!list_empty(&fence->cb_list)) {
> +		list_for_each_entry_safe(cur, tmp, &fence->cb_list, node) {
> +			INIT_LIST_HEAD(&cur->node);
> +			cur->func(fence, cur);
> +		}
> +		INIT_LIST_HEAD(&fence->cb_list);
>  	}
> 
>  	return 0;
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 09e23ad..a9eebaf 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2012 Canonical Ltd
>   * Copyright (C) 2012 Texas Instruments
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>   *
>   * Authors:
>   * Rob Clark <robdclark@gmail.com>
> @@ -70,26 +71,16 @@ struct dma_fence {
>  	 * release the fence it is unused. No one should be adding to the
>  	 * cb_list that they don't themselves hold a reference for.
>  	 *
> -	 * The lifetime of the timestamp is similarly tied to both the
> -	 * rcu freelist and the cb_list. The timestamp is only set upon
> -	 * signaling while simultaneously notifying the cb_list. Ergo, we
> -	 * only use either the cb_list of timestamp. Upon destruction,
> -	 * neither are accessible, and so we can use the rcu. This means
> -	 * that the cb_list is *only* valid until the signal bit is set,
> -	 * and to read either you *must* hold a reference to the fence,
> -	 * and not just the rcu_read_lock.
> -	 *
>  	 * Listed in chronological order.
>  	 */
>  	union {
>  		struct list_head cb_list;
> -		/* @cb_list replaced by @timestamp on dma_fence_signal() */
> -		ktime_t timestamp;
> -		/* @timestamp replaced by @rcu on dma_fence_release() */
> +		/* @cb_list replaced by @rcu on dma_fence_release() */
>  		struct rcu_head rcu;
>  	};
>  	u64 context;
>  	u64 seqno;
> +	ktime_t timestamp;
>  	unsigned long flags;
>  	struct kref refcount;
>  	int error;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
