Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27D2B91E8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 12:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C335E6E509;
	Thu, 19 Nov 2020 11:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4753C6E509
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 11:58:19 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id l20so1274858oot.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 03:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=laYv70RrJGedyGzvnWwLg8QepXfyreqfTEPVDRWx40s=;
 b=Ea0hzl9RD2aAks6n/xYTIO3SmGf4FMFqeMCR+uSCsV2xclfAZvT7UbbvSgku1PZW1y
 N4TdZdda01ZbT3XbAurG/+p7DOtxDGnkCBj19hQikSc89k6P0MEEio5oCJid48VE42Br
 cbWc2x2aSW3aWWTcqQR8bevbVZsli5PfwLV3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=laYv70RrJGedyGzvnWwLg8QepXfyreqfTEPVDRWx40s=;
 b=FS818tWynRpBGEvE8GS13yaklEPuWvkFvpGbFrdtN/P6YYocAs7Py1DBIUA89iKC9D
 an6dfXFvVYLEqkN1XnHtHcrdPY+KCxM+IA8+BF5FuVq7Av+WRZc2yq+D121TuMFMruuU
 IWZFXcJe9+zdpEgUhUr34aQulVBLfULXeBs05yLI8kTx+mgZoYqjg9QV8ZwSp4D28rPs
 XnQFiTc8Nhxz/Khqrp2dybW5MWj7Y/9UpMp86NKt5Oo4jIR3U5IbT1VYXpGBVIzssy/k
 QtoReGsHMIlv4csIlY56hHZy6Amks65lT1RXikB9VstC+K8EYXa2nOB7tSe7fRz4Y/FV
 Zqbw==
X-Gm-Message-State: AOAM532CaL5TXayc9VAPYYMj5UrenOSO/lBE7s7WBPy8z+4suO2/HzXU
 7qgrsrh5nKLZbiuCwEXhzN56fOYKzjef2H22dXXjBA==
X-Google-Smtp-Source: ABdhPJwypeDRP1qNzzv9UID/Lwq+YjhE17MWNrnxQCVp7BZQUnIACr3wTz7lz/0IId/1OT6LDpJ7KXqokcDjSDVq/es=
X-Received: by 2002:a4a:9486:: with SMTP id k6mr10042278ooi.85.1605787098521; 
 Thu, 19 Nov 2020 03:58:18 -0800 (PST)
MIME-Version: 1.0
References: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Nov 2020 12:58:07 +0100
Message-ID: <CAKMK7uEaYQmu6zBR5rYj=O1DdhzO2q_bMhntwxEuqbMqh_E9aQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] dma-fence: allow signaling drivers to set
 fence timestamp
To: Veera Sundaram Sankaran <veeras@codeaurora.org>
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
Cc: Dave Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, pdhaval@codeaurora.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 7:27 PM Veera Sundaram Sankaran
<veeras@codeaurora.org> wrote:
>
> Some drivers have hardware capability to get the precise timestamp of
> certain events based on which the fences are triggered. This allows it
> to set accurate timestamp factoring out any software and IRQ latencies.
> Move the timestamp parameter out of union in dma_fence struct to allow
> signaling drivers to set it. If the parameter is not set, ktime_get is
> used to set the current time to fence timestamp during dma_fence_signal.
>
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>

So with they "why?" question fully resolved, I think this is a bit too
much a hack. I think much better if we pass the timestamp explicitly,
in a new dma_fence_signal_timestamp variant. That means a bit more
work, but I think it will handle this special case cleaner.

Also means we need to wire the timestamp through the entire call stack
on the drm side too. So we need a drm_send_event_locked_timestamp
variant too for send_vblank_event.
-Daniel

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
>         struct dma_fence_cb *cur, *tmp;
> -       struct list_head cb_list;
>
>         lockdep_assert_held(fence->lock);
>
> @@ -337,16 +337,18 @@ int dma_fence_signal_locked(struct dma_fence *fence)
>                                       &fence->flags)))
>                 return -EINVAL;
>
> -       /* Stash the cb_list before replacing it with the timestamp */
> -       list_replace(&fence->cb_list, &cb_list);
> -
> -       fence->timestamp = ktime_get();
> +       /* set current time, if not set by signaling driver */
> +       if (!fence->timestamp)
> +               fence->timestamp = ktime_get();
>         set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>         trace_dma_fence_signaled(fence);
>
> -       list_for_each_entry_safe(cur, tmp, &cb_list, node) {
> -               INIT_LIST_HEAD(&cur->node);
> -               cur->func(fence, cur);
> +       if (!list_empty(&fence->cb_list)) {
> +               list_for_each_entry_safe(cur, tmp, &fence->cb_list, node) {
> +                       INIT_LIST_HEAD(&cur->node);
> +                       cur->func(fence, cur);
> +               }
> +               INIT_LIST_HEAD(&fence->cb_list);
>         }
>
>         return 0;
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
>          * release the fence it is unused. No one should be adding to the
>          * cb_list that they don't themselves hold a reference for.
>          *
> -        * The lifetime of the timestamp is similarly tied to both the
> -        * rcu freelist and the cb_list. The timestamp is only set upon
> -        * signaling while simultaneously notifying the cb_list. Ergo, we
> -        * only use either the cb_list of timestamp. Upon destruction,
> -        * neither are accessible, and so we can use the rcu. This means
> -        * that the cb_list is *only* valid until the signal bit is set,
> -        * and to read either you *must* hold a reference to the fence,
> -        * and not just the rcu_read_lock.
> -        *
>          * Listed in chronological order.
>          */
>         union {
>                 struct list_head cb_list;
> -               /* @cb_list replaced by @timestamp on dma_fence_signal() */
> -               ktime_t timestamp;
> -               /* @timestamp replaced by @rcu on dma_fence_release() */
> +               /* @cb_list replaced by @rcu on dma_fence_release() */
>                 struct rcu_head rcu;
>         };
>         u64 context;
>         u64 seqno;
> +       ktime_t timestamp;
>         unsigned long flags;
>         struct kref refcount;
>         int error;
> --
> 2.7.4
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
