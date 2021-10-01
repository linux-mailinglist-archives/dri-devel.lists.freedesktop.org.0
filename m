Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8762041EB11
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FD26ED93;
	Fri,  1 Oct 2021 10:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40FC6ED93;
 Fri,  1 Oct 2021 10:39:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t8so14797348wri.1;
 Fri, 01 Oct 2021 03:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OaGv+qm5SuNdsSmcpk03CbdLQM2e6BUerjnin6OTQVo=;
 b=LbrVyo5iRAYHVwqsB83B+gqgn+xQo4l/WliW9dQclgC4bINop8954OfITWNxjcw6Gt
 SO7BHo9r1tjfntFJxWokhynXQwO1I2WOrni9h00qnIzz4dnJ44KJDWODAKE+U/Q0MHia
 kFCTSDSBDUXG1RiecTkWep+33RuLo/97shBYQl4z/wopeWNLRJRGXFZ0KWmiHTRvOdvl
 XEG8ZD3RDSBVnQDUI/SlJ63jaU0jq8oVYUvBn4H5Q2G+7CuYU/OhQ2W1O1HtiI2sFOR9
 LYLs2e72FFDXwFHBvUVl+ZplGwvTxZqD7sDqYHxDV93ilakitf9GiDuoJX08A0heXzPK
 pAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OaGv+qm5SuNdsSmcpk03CbdLQM2e6BUerjnin6OTQVo=;
 b=36hiqRLqvd0biWooZ+q3nRXCaL6hNUu0mKOCiUAFWnk42/bMjtetDqGF+mwN+oqPS9
 X+eN6A4wa48DUCbLy+RKDc3cwp7Eb7g9C7c6Nlktx1DtDWF8h+O+TTRTBkwTHYvMPjHt
 +p5L2t4uoGpuWFIGkPv2T+QgTxw/EkyMEiL2lQ7tzEbj6QYb64Aig/3cjGiIc55d4gqq
 KBlPyAihD8K8yGgVhqqfDGYxs71f3V7slNjEikAxJgBQO65s+XjNcCztfYgfK+pb0V+T
 TgLcPZjc8nkqwySdYlVrvIGxZ9oP/dP5VKboDWu35ljf32lYN9Pt8XR1NCdW/hEfCgnM
 S8zw==
X-Gm-Message-State: AOAM531MFJtT6baP52rQU4J4IO1KaEzTuEH9/dZ/19620AVItNRCDVh1
 RiWi98K0O/2qHdsP3FB2P3Q=
X-Google-Smtp-Source: ABdhPJzzsWpPn1VpZitrRxGC4hk7LTyPFUdYE0nVKmdn4+DLsxUEpKC52grmglpl2LBR8hnvQu2J8g==
X-Received: by 2002:adf:8b45:: with SMTP id v5mr11569085wra.211.1633084791135; 
 Fri, 01 Oct 2021 03:39:51 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id w23sm7676012wmi.6.2021.10.01.03.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 03:39:50 -0700 (PDT)
Subject: Re: [PATCH 17/28] drm/i915: use the new iterator in
 i915_gem_busy_ioctl v2
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-18-christian.koenig@amd.com>
 <c6837f74-0ba5-e3c2-5778-a9d120c6ea67@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cda5d293-4cf2-3b9b-7e38-4ad7cac2db1e@gmail.com>
Date: Fri, 1 Oct 2021 12:39:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c6837f74-0ba5-e3c2-5778-a9d120c6ea67@linux.intel.com>
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

Am 01.10.21 um 12:37 schrieb Tvrtko Ursulin:
>
> On 01/10/2021 11:05, Christian König wrote:
>> This makes the function much simpler since the complex
>> retry logic is now handled else where.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Sorry I retract until you add the text about the increased cost of the 
> added atomics. I think the point is important to discuss given 
> proposal goes from zero atomics to num_fences * 2 (fence get/put 
> unless I am mistaken) atomics per busy ioctl. That makes me lean 
> towards just leaving this as is since it is not that complex.

I'm certainly pushing hard to remove all manual RCU dance from the 
drivers, including this one.

The only option is to either have the atomics overhead (which is indeed 
num_fences*2) or the locking overhead.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> index 6234e17259c1..dc72b36dae54 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>> *data,
>>   {
>>       struct drm_i915_gem_busy *args = data;
>>       struct drm_i915_gem_object *obj;
>> -    struct dma_resv_list *list;
>> -    unsigned int seq;
>> +    struct dma_resv_iter cursor;
>> +    struct dma_fence *fence;
>>       int err;
>>         err = -ENOENT;
>> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>> void *data,
>>        * to report the overall busyness. This is what the wait-ioctl 
>> does.
>>        *
>>        */
>> -retry:
>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>> -
>> -    /* Translate the exclusive fence to the READ *and* WRITE engine */
>> -    args->busy = 
>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>> -
>> -    /* Translate shared fences to READ set of engines */
>> -    list = dma_resv_shared_list(obj->base.resv);
>> -    if (list) {
>> -        unsigned int shared_count = list->shared_count, i;
>> -
>> -        for (i = 0; i < shared_count; ++i) {
>> -            struct dma_fence *fence =
>> -                rcu_dereference(list->shared[i]);
>> -
>> +    args->busy = 0;
>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +        if (dma_resv_iter_is_restarted(&cursor))
>> +            args->busy = 0;
>> +
>> +        if (dma_resv_iter_is_exclusive(&cursor))
>> +            /* Translate the exclusive fence to the READ *and* WRITE 
>> engine */
>> +            args->busy |= busy_check_writer(fence);
>> +        else
>> +            /* Translate shared fences to READ set of engines */
>>               args->busy |= busy_check_reader(fence);
>> -        }
>>       }
>> -
>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
>> -        goto retry;
>> +    dma_resv_iter_end(&cursor);
>>         err = 0;
>>   out:
>>

