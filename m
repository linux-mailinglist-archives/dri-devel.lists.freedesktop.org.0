Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381A2431710
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 13:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5BD6E870;
	Mon, 18 Oct 2021 11:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E66A6E0D1;
 Mon, 18 Oct 2021 11:21:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m22so40883074wrb.0;
 Mon, 18 Oct 2021 04:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QbH/Fqw/UOsr06hrqcKDzrGD6snva7obhtkW4dGOEG0=;
 b=gEP6Zsv4iTEQfqQhQ6PSUkK5LmnQxup7arS8BiN/NhzvZ3EM5wwC/BXjBTgT1mGrYS
 uyrhjnhoBhJILyXAIrNza/EY3Tyeirz4iCE6PzeePdAj8V0HiRUqTCDNGcLnpJfsGCJ2
 rqI2kUOdtMX2EmHHupUodvJ2Mrr8Mg27IXWzRj2yMRsHXniEjSVNB5t3MVyDl3YLIKh0
 197iOLVWVf3rpC8CkXmk9V79Rw3ArnA7ZGS5hBJNdRZrxCHkZDB5lkSibX/+XdpNiy0b
 U2kGFQIreHLKiUkBLpv+bzXCr6HNbEhF1DR69HWoIWxaXHFIiJWFr4fe3rFxzw0vQH/B
 AEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QbH/Fqw/UOsr06hrqcKDzrGD6snva7obhtkW4dGOEG0=;
 b=Vyy8GB31HvggXV44Sjc4pO8Etw8xcA/z3WRgEJp3GNKqMZGiOh2AkOK9NKQn0SRC8Z
 HmLcP+QTjGb6zAxidEBdeFkQszpjkijqElX/Zkma9WCLh/OgypwUQe72rEsZkQkDmwVp
 MF0X3eqZ1+hyFb3thqImo6WUsPH3jr+CzD4MQxv7T9ZKCzZSEKDgTdSfsDoxdIVNnF06
 30kR1UAeGa7nF7uNYr2uqv/WwfUsD9f0bMILoP27N+wLRziFU+m/shoHw5VQue9zOs5x
 NpwyF6D+ReEjuaSHswEdAbTadwZIlG8056smEZMYxMowsaCWNIQFXSZnak0dBx7Q2pV/
 qexw==
X-Gm-Message-State: AOAM533EDKWUlgn7ZvfA1Wqhg1ge8i5q/1VPO74UE1KZr96Cs580tVli
 ShIBjy6E9gV16oUL8YQ9quQ=
X-Google-Smtp-Source: ABdhPJzst1hKKHknD8c8eC2/0lOgPCnCZXcKGJyLN1b2VHU1SOjdDLkI1QP4E3tOvy7v8o6mXSZZGQ==
X-Received: by 2002:adf:a48f:: with SMTP id g15mr33539327wrb.259.1634556059919; 
 Mon, 18 Oct 2021 04:20:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c473:1c84:fac2:c272?
 ([2a02:908:1252:fb60:c473:1c84:fac2:c272])
 by smtp.gmail.com with ESMTPSA id p12sm9449645wrr.67.2021.10.18.04.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 04:20:59 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Fix dma_resv_wait_timeout
 handling of timeout = 0.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
References: <20211015115720.79958-1-maarten.lankhorst@linux.intel.com>
 <20211015115720.79958-2-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ff661be5-3a7a-3868-a67f-c3c80d91f385@gmail.com>
Date: Mon, 18 Oct 2021 13:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015115720.79958-2-maarten.lankhorst@linux.intel.com>
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

Am 15.10.21 um 13:57 schrieb Maarten Lankhorst:
> Commit ada5c48b11a3 ("dma-buf: use new iterator in dma_resv_wait_timeout")
> accidentally started mishandling timeout = 0, by forcing a blocking wait
> with timeout = 1 passed to fences. This is not intended, as timeout = 0
> may be used for peeking, similar to test_signaled.
>
> Fixes: ada5c48b11a3 ("dma-buf: use new iterator in dma_resv_wait_timeout")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Sorry for the delay, back from sick leave just today.

Good catch, but when I read the old code correctly that was also broken 
before by passing in 1 to dma_fence_wait_timeout() for a timeout of 0.

> ---
>   drivers/dma-buf/dma-resv.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 9eb2baa387d4..70a8082660c5 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -617,18 +617,18 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>   long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>   			   unsigned long timeout)
>   {
> -	long ret = timeout ? timeout : 1;
> +	long ret = timeout ?: 1;

Please don't change the coding style here.

Apart from that looks good to me.

Christian.

>   	struct dma_resv_iter cursor;
>   	struct dma_fence *fence;
>   
>   	dma_resv_iter_begin(&cursor, obj, wait_all);
>   	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		ret = dma_fence_wait_timeout(fence, intr, timeout);
> +		if (ret <= 0)
> +			break;
>   
> -		ret = dma_fence_wait_timeout(fence, intr, ret);
> -		if (ret <= 0) {
> -			dma_resv_iter_end(&cursor);
> -			return ret;
> -		}
> +		if (timeout)
> +			timeout = ret;
>   	}
>   	dma_resv_iter_end(&cursor);
>   

