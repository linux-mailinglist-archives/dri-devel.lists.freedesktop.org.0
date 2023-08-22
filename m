Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E47DB784178
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 15:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CF210E356;
	Tue, 22 Aug 2023 13:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498FD10E356
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 13:01:54 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99bf8e5ab39so604732566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 06:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692709312; x=1693314112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y7uRU2yw0+QtivPyEBeooJ4wrCrosqZ6/dwHcBFdBSs=;
 b=SxYBFdhM+FN23Ke1aROld8E/mnXIfOwf5+fRpRypDygmsbtwQNFtsig/wbuvh9sjUN
 L2G5i+mPvvugxVV35FJxdLwOCJR/qhzoSUIMkAVoyX1+oMvJFBQdjIWKvbnu4pmKtljj
 v5rOTduUITSQa2eqYwHNgEKPmaClMxMhjfeJDe5pfHHJGbBKuIYmhzHh/f86RBq5U9vD
 HRqZQyJJVFsD7WkBt1gHW8mGmq1ciGbhS89jfS3df1aBJglggcDOTXdobDvJTfE2DgWu
 OYLiuL2+P/sSIP0zWYfJ27SksOKF037+poDkPRE+JLJezZijHS2CFstFD8fWsV2ssv7A
 ag+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692709312; x=1693314112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7uRU2yw0+QtivPyEBeooJ4wrCrosqZ6/dwHcBFdBSs=;
 b=J34F1LUSmBhBvZbvMzqCP7FGc2HIugaPIDtojPMcElgs6w2YLGiVN4n9oR9uxeZv28
 CPLn2za1bKUhUMJwFcc47wiAURhWJwqANqZnTVJMPqXCZHxmGZglpLFbDHZS9s3mRFO/
 N5zwt1rK8ySA/faeVRKYL2+axTp9bflfeJ2OdiueBg2Ofwg/8ehdTg9q9ZKlFkdj6bnh
 z4ZQL0ZuHPcwZu4PRMUq8CYUO0nrMVj2Z9nMjIWpd2b2/AX5vPMiVilQy3Uhp/auFkzq
 yAnaEzpwu9NnCMg0QvaglESXzUqQOH7gYPzbs4XQef0Bl510FhOXp9ijiLZuGal+dtJa
 GcaQ==
X-Gm-Message-State: AOJu0YzJtnOGCPGGDF4HaFL1wn2a1u4aKskdXHt1O8hZi0FOnklgkZ4Z
 V3C5o2rJwrt5pAtvqIRg4ss=
X-Google-Smtp-Source: AGHT+IFmuCYEzWICY1O6jlC2x150UebiypigGJwRb0YaxYsFDA+/ZkpjfqzxgUL6KbUmgjyqPmqpzQ==
X-Received: by 2002:a17:906:51cb:b0:99c:6bc8:e84b with SMTP id
 v11-20020a17090651cb00b0099c6bc8e84bmr8155533ejk.58.1692709312343; 
 Tue, 22 Aug 2023 06:01:52 -0700 (PDT)
Received: from [192.168.178.25] ([185.254.126.155])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a170906b01200b0098e78ff1a87sm8221693ejy.120.2023.08.22.06.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 06:01:51 -0700 (PDT)
Message-ID: <a05e0c2e-fd62-4a8e-9fa4-dffaf86f7730@gmail.com>
Date: Tue, 22 Aug 2023 15:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Linaro-mm-sig] [PATCH v2] dma-buf/sw_sync: Avoid recursive lock
 during fence signal
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230818145939.39697-1-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230818145939.39697-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.08.23 um 16:59 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> If a signal callback releases the sw_sync fence, that will trigger a
> deadlock as the timeline_fence_release recurses onto the fence->lock
> (used both for signaling and the the timeline tree).
>
> To avoid that, temporarily hold an extra reference to the signalled
> fences until after we drop the lock.
>
> (This is an alternative implementation of https://patchwork.kernel.org/patch/11664717/
> which avoids some potential UAF issues with the original patch.)
>
> v2: Remove now obsolete comment, use list_move_tail() and
>      list_del_init()
>
> Reported-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Fixes: d3c6dd1fb30d ("dma-buf/sw_sync: Synchronize signal vs syncpt free")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/sw_sync.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 63f0aeb66db6..f0a35277fd84 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -191,6 +191,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
>    */
>   static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
>   {
> +	LIST_HEAD(signalled);
>   	struct sync_pt *pt, *next;
>   
>   	trace_sync_timeline(obj);
> @@ -203,21 +204,20 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
>   		if (!timeline_fence_signaled(&pt->base))
>   			break;
>   
> -		list_del_init(&pt->link);
> +		dma_fence_get(&pt->base);
> +
> +		list_move_tail(&pt->link, &signalled);
>   		rb_erase(&pt->node, &obj->pt_tree);
>   
> -		/*
> -		 * A signal callback may release the last reference to this
> -		 * fence, causing it to be freed. That operation has to be
> -		 * last to avoid a use after free inside this loop, and must
> -		 * be after we remove the fence from the timeline in order to
> -		 * prevent deadlocking on timeline->lock inside
> -		 * timeline_fence_release().
> -		 */
>   		dma_fence_signal_locked(&pt->base);
>   	}
>   
>   	spin_unlock_irq(&obj->lock);
> +
> +	list_for_each_entry_safe(pt, next, &signalled, link) {
> +		list_del_init(&pt->link);
> +		dma_fence_put(&pt->base);
> +	}
>   }
>   
>   /**

