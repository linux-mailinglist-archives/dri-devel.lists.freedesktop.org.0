Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C54239B2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 10:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641886ED0D;
	Wed,  6 Oct 2021 08:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F5F6ED0D;
 Wed,  6 Oct 2021 08:24:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r7so6203320wrc.10;
 Wed, 06 Oct 2021 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bRu/Ff9Ir38OPXGTArHMIziqICHLOKILZrD4xpaYf/Q=;
 b=R+yfWP9qxbK9aHMSr5GWkjaYWvXsWrI0XNXGmiYU1bNPIbXvX6GkBU+j+/KL03S0UR
 swM/2xWcv2R/clqSJrml8rq1s28Aot+92k/wDrwCaV5bUO19ZAVQkVerRH64gg9ZAuAC
 ViHDpR2aYhCEfaifhiujozwCq0xAGLQuYJoRUkkA0wNZivsq9fD4EHPKGUsJxsamJ4ay
 IcDDP6YuRdIYRzq+gL4HtoXpQQzj5BraPHWULbCEIWswVGF6w5TdfZ6wV2Vnub/C6+AX
 FyB5iGET/WHyCDwTnIwEI5Z3STdwUOY66PieAlzMGSZOJU1/PwcosK96oSJPxjy/O2SI
 kNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bRu/Ff9Ir38OPXGTArHMIziqICHLOKILZrD4xpaYf/Q=;
 b=V93H/WL6f/4vZ2y0ARC6PnYFcQw1lYaSTu2EGydIBPvgWTunAV+F5n3ipM4VLRgtY7
 nCEiB8fNGhE9rgsTrMwVoehOIit5mNyi1+sUpv+GkaX3T1k5JpXHAUNGJpyv8xfvMwvb
 QoRLHfsu7o0KwtLFzTV8in2kH0uDqaAA9e6neurkfMUGM4057Ne6NjyKMAxhHH9XzxgI
 A/tMb43odeunAgfBk5fEhtGX5HmSd9gAQLsFqyWC2PLfOLVN6f6U1pyAVKuFmIUpMKz2
 rmGYJobSQFk6nU8Iv6AtaKJmt1cpPMz+cbe1Q7F1j/HnJuqNx3Yn7ZjO5PJsNScnlyPd
 7Q7g==
X-Gm-Message-State: AOAM5308oHMtx0mUNpm3eFGN6Td3MXY6lqwCCX6gJ7QeBHdeBN1BnvTZ
 FaQo7rTs698a825nE1vEEXQdboGttOE=
X-Google-Smtp-Source: ABdhPJwSKB9J69MYCyfYWofckhT3E2FNK+4DeytJ3TbkoGWD45VMLJp8ZTF6S4Pcir1KcpDXDOSOkA==
X-Received: by 2002:a05:600c:a43:: with SMTP id
 c3mr8351784wmq.193.1633508662785; 
 Wed, 06 Oct 2021 01:24:22 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id h18sm5176825wmq.23.2021.10.06.01.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 01:24:22 -0700 (PDT)
Subject: Re: [PATCH 02/28] dma-buf: add dma_resv_for_each_fence v2
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: "tvrtko.ursulin@linux.intel.com >> Tvrtko Ursulin"
 <tvrtko.ursulin@linux.intel.com>
Cc: daniel@ffwll.ch,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-3-christian.koenig@amd.com>
Message-ID: <3b946100-cf70-ff83-e090-2d8cbbc52fd6@gmail.com>
Date: Wed, 6 Oct 2021 10:24:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005113742.1101-3-christian.koenig@amd.com>
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

Good morning, could I get an rb for that patch here as well?

I've pushed the first few with Daniel's and your rbs, but this one here 
is blocking all the rest.

Thanks,
Christian.

Am 05.10.21 um 13:37 schrieb Christian König:
> A simpler version of the iterator to be used when the dma_resv object is
> locked.
>
> v2: fix index check here as well
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-resv.c | 49 ++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-resv.h   | 19 +++++++++++++++
>   2 files changed, 68 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 3cbcf66a137e..231bae173ef1 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -423,6 +423,55 @@ struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
>   }
>   EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
>   
> +/**
> + * dma_resv_iter_first - first fence from a locked dma_resv object
> + * @cursor: cursor to record the current position
> + *
> + * Return all the fences in the dma_resv object while holding the
> + * &dma_resv.lock.
> + */
> +struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
> +{
> +	struct dma_fence *fence;
> +
> +	dma_resv_assert_held(cursor->obj);
> +
> +	cursor->index = 0;
> +	cursor->fences = dma_resv_shared_list(cursor->obj);
> +
> +	fence = dma_resv_excl_fence(cursor->obj);
> +	if (!fence)
> +		fence = dma_resv_iter_next(cursor);
> +
> +	cursor->is_restarted = true;
> +	return fence;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_iter_first);
> +
> +/**
> + * dma_resv_iter_next - next fence from a locked dma_resv object
> + * @cursor: cursor to record the current position
> + *
> + * Return all the fences in the dma_resv object while holding the
> + * &dma_resv.lock.
> + */
> +struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
> +{
> +	unsigned int idx;
> +
> +	dma_resv_assert_held(cursor->obj);
> +
> +	cursor->is_restarted = false;
> +	if (!cursor->all_fences || !cursor->fences ||
> +	    cursor->index >= cursor->fences->shared_count)
> +		return NULL;
> +
> +	idx = cursor->index++;
> +	return rcu_dereference_protected(cursor->fences->shared[idx],
> +					 dma_resv_held(cursor->obj));
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_iter_next);
> +
>   /**
>    * dma_resv_copy_fences - Copy all fences from src to dst.
>    * @dst: the destination reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 764138ad8583..3df7ef23712d 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -179,6 +179,8 @@ struct dma_resv_iter {
>   
>   struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor);
>   struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor);
> +struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor);
> +struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor);
>   
>   /**
>    * dma_resv_iter_begin - initialize a dma_resv_iter object
> @@ -244,6 +246,23 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>   	for (fence = dma_resv_iter_first_unlocked(cursor);		\
>   	     fence; fence = dma_resv_iter_next_unlocked(cursor))
>   
> +/**
> + * dma_resv_for_each_fence - fence iterator
> + * @cursor: a struct dma_resv_iter pointer
> + * @obj: a dma_resv object pointer
> + * @all_fences: true if all fences should be returned
> + * @fence: the current fence
> + *
> + * Iterate over the fences in a struct dma_resv object while holding the
> + * &dma_resv.lock. @all_fences controls if the shared fences are returned as
> + * well. The cursor initialisation is part of the iterator and the fence stays
> + * valid as long as the lock is held.
> + */
> +#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
> +	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
> +	     fence = dma_resv_iter_first(cursor); fence;	\
> +	     fence = dma_resv_iter_next(cursor))
> +
>   #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>   

