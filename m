Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD137414C6F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 16:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FA16EC07;
	Wed, 22 Sep 2021 14:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191706EC07;
 Wed, 22 Sep 2021 14:50:15 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t18so7774694wrb.0;
 Wed, 22 Sep 2021 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Eao9BWrz4ZEpvjvPekZB5G5ZtGhlHSk/4Hlz/e8xCbA=;
 b=e+iQRrJaGNbhRYtfaer7tRDjfOMBybl7ZXrqAH1QAnYMPxjDEsed1HOTKoTfA9wlBz
 Nk/GCELMVvKzS3YpsCrlOrVbUVWxT7myvqYLCgGYczzldw7a7khAMhnQ9iN/GE+0+1eg
 c3Y01VkDWhGW1N0i6WASoRgCYIuQbKESS8NKQGxCtno38nZrcD9FGmvCstZ4I1g19v1d
 8tvdmmumAU8c7iLSiHv2HW3CHOWGWp3P3g7Vx2AFgPw2duSDVml5uQIoKmt5WPSAjEnK
 lgTFLLKBAztPQnL7wOA787+nElODI4f2ewGSfA8Z3dh6ejBFv9egrEgED273XTAZzJ7h
 yFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Eao9BWrz4ZEpvjvPekZB5G5ZtGhlHSk/4Hlz/e8xCbA=;
 b=kPyQZvKptsqwUpU64wOfoZvLOn1Mw5fEBa8PzoDhfdVJpejEWrZ5YfDDvcG74cOw6V
 4w2KWCOZ1DKz3Hbq5LKp1MjdpgxCxVYdM8qav0XeOWxKrTFATDguLxoP/JtymVSI37ej
 cUyYXifxf/yo43BlbUI1ZZWqtrrO2o4V3aJ5Ivg49+07q0EMF9Ic4g9ctI95UQqyx9BM
 75+5uekIEe5ewTJlbF4NDOUQQTl6TPnXcEA4NgxNR6RcnLzZ27TxFeUnIGxyxUcJNDqn
 JjDGoO0KH2GBJVRfDEZrlFDzCBd12OFCVyGMWRwkMc+9SLXVgnc/SNJXuTx7NbRbsIpD
 O8bQ==
X-Gm-Message-State: AOAM532+BbwPICfTXNyFpXdH2h18n4wLy/4vaSHFdAunGN7nmZIksyDn
 H+oaixS+6QxwXuaTsopcZ7Q=
X-Google-Smtp-Source: ABdhPJzgMi5c914so+rNIjQe9Fsfeoxy5GyiIbiDLGWPeuJJ5n9tKlohnCYczRNFHB7P3snLhByBag==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr11111516wmr.89.1632322212730; 
 Wed, 22 Sep 2021 07:50:12 -0700 (PDT)
Received: from [192.168.158.115] (ip-178-202-40-91.hsi09.unitymediagroup.de.
 [178.202.40.91])
 by smtp.gmail.com with ESMTPSA id c7sm2474917wmq.13.2021.09.22.07.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 07:50:12 -0700 (PDT)
Subject: Re: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked v4
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-2-christian.koenig@amd.com>
 <093432d2-de8e-9684-03aa-7cb4842ea755@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <347e66cf-fd85-da15-6a00-cecab25c2d49@gmail.com>
Date: Wed, 22 Sep 2021 16:50:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <093432d2-de8e-9684-03aa-7cb4842ea755@linux.intel.com>
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

Am 22.09.21 um 16:36 schrieb Tvrtko Ursulin:
>> +
>> +/**
>> + * dma_resv_iter_first_unlocked - first fence in an unlocked 
>> dma_resv obj.
>> + * @cursor: the cursor with the current position
>> + *
>> + * Returns the first fence from an unlocked dma_resv obj.
>> + */
>> +struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter 
>> *cursor)
>> +{
>> +    rcu_read_lock();
>> +    do {
>> +        dma_resv_iter_restart_unlocked(cursor);
>> +        dma_resv_iter_walk_unlocked(cursor);
>> +    } while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
>> +    rcu_read_unlock();
>> +
>> +    return cursor->fence;
>> +}
>> +EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
>
> Why is this one split from dma_resv_iter_begin and even exported?

I've split it to be able to use dma_resv_iter_begin in both the unlocked 
and locked iterator.

> I couldn't find any users in the series.

This is used in the dma_resv_for_each_fence_unlocked() macro to return 
the first fence.

>
>> +
>> +/**
>> + * dma_resv_iter_next_unlocked - next fence in an unlocked dma_resv 
>> obj.
>> + * @cursor: the cursor with the current position
>> + *
>> + * Returns the next fence from an unlocked dma_resv obj.
>> + */
>> +struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter 
>> *cursor)
>> +{
>> +    bool restart;
>> +
>> +    rcu_read_lock();
>> +    cursor->is_restarted = false;
>> +    restart = read_seqcount_retry(&cursor->obj->seq, cursor->seq);
>> +    do {
>> +        if (restart)
>> +            dma_resv_iter_restart_unlocked(cursor);
>> +        dma_resv_iter_walk_unlocked(cursor);
>> +        restart = true;
>> +    } while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
>> +    rcu_read_unlock();
>> +
>> +    return cursor->fence;
>> +}
>> +EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
>
> Couldn't dma_resv_iter_first_unlocked and dma_resv_iter_next_unlocked 
> share the same implementation? Especially if you are able to replace 
> cursor->is_restarted with cursor->index == -1.

That's what I had initially, but Daniel disliked it for some reason. You 
then need a centralized walk function instead of first/next.

Thanks,
Christian.

> Regards,
>
> Tvrtko

