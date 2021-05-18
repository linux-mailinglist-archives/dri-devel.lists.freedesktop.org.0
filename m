Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104A338793F
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D906E87B;
	Tue, 18 May 2021 12:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033E16E87B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 12:54:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t15so10973571edr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 05:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/ZKIuAxsctPiM5QgbopDY+F/1qY9+GzQRJTdo3b82ew=;
 b=tnch0RK+sd5/E0RRnNt11iE3PaPz1V5ju2pEeYtb9vEqRLLXyw7yNk1TXfGkRNMUfX
 TynJNLs7EtboJZDDcIYKmB4oT8667v5h20tRzTHrIUQagvZjYJinhF+aXhcwjkK+0bnp
 Rx0zm6INAE4On7E+pJIbnX8jsBXhnsnmIvqKQCXWPXQFv0ZUn9ubS2B3DdjhJyTR7t0s
 eiq70c2xb9I4oXpWuWxe86qsK6voCEsknnchtqX1xG09MnTA5NUfkXkoIWxSoYRbRVRV
 igED3wK542ah4BHAoTcqQl5GgZ25tW9M71bIbx+nOB/MvJg+IVEOquZ+vGIhqHGc+x2f
 pYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/ZKIuAxsctPiM5QgbopDY+F/1qY9+GzQRJTdo3b82ew=;
 b=D9mpM4vlSFVmowiFQXv+7J5ncBpoZ9pf+H227z+xF/LP3COLkWpYzYDXyiu5KVdqV1
 heUrlwxnH2aHXQWyBQqh9CuX7sO3Xx3pBxyPkLZK4vZXkkPXAe8g1Ub0q7v4hZNRIFQ+
 GRg1h8c0/2/CVnwTBCdRpevV8eIPx1V+4iEtf4OFWhCRilo0oG6wOI+VZ+4Dcdi7L1we
 rpyFPbrzlemvDAp8ZlfpfS+LVZtbNmF5BxqaFI1KfUh8G/7aPVKl43e0d3eI9Iyzclhy
 3DjgigDJY/DnZ7Ad05FI/IqeHwI4Cr4buAnr27E15JCzYSKPX9iN6/AfXP8nLLQACMuv
 U1WA==
X-Gm-Message-State: AOAM5328A7eIceF7z/cWaDj8yOWuW69ygHfB4g7jLavYMYv4BSK0tN2H
 m4XcmDKMGMvKi4DNvCbk5lw=
X-Google-Smtp-Source: ABdhPJzU8imyykAaGPEub+caZfbgZjrZ0F1uUl7gWWYQCBGRYB0dRNIOnCXE1dEBGUYuL82z9S4fJA==
X-Received: by 2002:aa7:df96:: with SMTP id b22mr6842674edy.95.1621342464758; 
 Tue, 18 May 2021 05:54:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4?
 ([2a02:908:1252:fb60:8470:36a5:2010:f0c4])
 by smtp.gmail.com with ESMTPSA id nd36sm9937066ejc.21.2021.05.18.05.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 05:54:24 -0700 (PDT)
Subject: Re: [PATCH 09/11] dma-buf: add shared fence usage flags
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <20210517141129.2225-10-christian.koenig@amd.com>
 <YKLT5WO+7dKUVhyP@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1787849d-1b75-0cfa-8121-373b14ae6998@gmail.com>
Date: Tue, 18 May 2021 14:54:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKLT5WO+7dKUVhyP@phenom.ffwll.local>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.05.21 um 22:36 schrieb Daniel Vetter:
> On Mon, May 17, 2021 at 04:11:27PM +0200, Christian König wrote:
>> Add usage flags for shared fences and improve the documentation.
>>
>> This allows driver to better specify what shared fences
>> are doing with the resource.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 16b869d9b1d6..c9bbc4630afc 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -700,7 +700,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>>   		return ret;
>>   	}
>>   
>> -	dma_resv_add_shared_fence(bo->base.resv, fence);
>> +	dma_resv_add_shared(bo->base.resv, fence, DMA_RESV_USAGE_RW);
> Entirely aside, but I ended up scratching my head a lot for why exactly
> this here is a shared fence, and why that's ok. Since just looking at this
> it seems like waiting for the memory allocation to actually be owned by
> this driver is optional.
>
> Is this ok because the next thing we'll do is a move, which will then set
> the exclusive fence here. Which will then wait on the shared one here, so
> it doesn't matter? Or well, allows us to pipeline the eviction of ttm_man
> against whatever might be currently keeping the bo busy in it's current
> place?

Yes, exactly that.

We just need to make sure that the new BO location isn't used before the 
fence is completed, but we can't use the exclusive slot because we have 
no guarantee at all that the move fence signals in the right order.

Regards,
Christian.

>
> Might be good candidate to explain this in a comment or something like
> that.
> -Daniel

