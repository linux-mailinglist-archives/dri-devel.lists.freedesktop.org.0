Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE53C473F38
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 10:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D3210EAA6;
	Tue, 14 Dec 2021 09:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8117D10EA66;
 Tue, 14 Dec 2021 09:19:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c4so31209255wrd.9;
 Tue, 14 Dec 2021 01:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VPcZ6weXNOinOwomSD/y3gXTrN0ghPpLMTmRHxYh9zI=;
 b=VkaEunBdUpTFCTHBppMTXR0O9l97MUKZW+ASZyE7nQCqEHPK1iXl3AHUSk/cZIPnYS
 2VEi+KiyunyrdPHXdE91LfCKQCPcKtXB/gIbR+vDRFAW3dnKy4WN2L9uQ2aJ4CWK2P69
 HolQxaEHTrYXRMzFFPow++kf3lbC586Qe8rjpgOijbfbrWfN9GR3WPqVU54YSj3k3iV4
 gDPTOI4WoZD01OdQSY0VAbAYyDDYFJ0T8SVU93BJUb0179QZk5RZP0t8EeilbXLVIPla
 ffnMVOVAo6Ls9FaIan3BucWhS0trymWVIIENujkTpVb+bv24OEB0HNY8zhaDHiqrbTB/
 oDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VPcZ6weXNOinOwomSD/y3gXTrN0ghPpLMTmRHxYh9zI=;
 b=WmSYdwcJbi1lJe2BK+8dJKf5Egni2S3gWJhhOfwcvFkRtdOZSoXMZE4rOPf9hulkX6
 0ZF1v+DRHSnPh/1D7GlAOxDRmpr6MRPxBlzWtoQoBS5sY6QhQSFeNjSV63MxVou0fXci
 JGIInrIjeA94WBDcGjIaht7k7EHI/LeFdQcKPwuBDohxFG4l2JKCizGx5Hlu4li8oJWM
 dHFlEJYnc2YDaHJg2hmg3XsHttyXpoAbE1bEC3+t5bGtihyRTw9oxd2FbRjgITAt0mpT
 kGhaLzK6Z2GxjZXy6UscY8MQwSZRRkOrzZVmpgvXRcPNbcfc/wwlebtNBFPs8jYtoXtL
 gonQ==
X-Gm-Message-State: AOAM5316KDuwhCJUybpfDLeDaDfO/oPGEk1GbEsnH3ScPSLizXKLvICN
 QX5FEyV86/8Ts2Zlc4gs5x2aUmF83C0=
X-Google-Smtp-Source: ABdhPJwBIjmWztZTZAKr01xg/1HRHlAYWBjo7f6T4IoerOJrYxq38O/0qQovGv1UlgRh12i8CrJWvA==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr4416262wrr.314.1639473571134; 
 Tue, 14 Dec 2021 01:19:31 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id y7sm12822839wrw.55.2021.12.14.01.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 01:19:30 -0800 (PST)
Subject: Re: [PATCH] drm/nouveau: wait for the exclusive fence after the
 shared ones v2
To: Stefan Fritsch <sf@sfritsch.de>, dmoulding@me.com, bskeggs@redhat.com
References: <20211209102335.18321-1-christian.koenig@amd.com>
 <b6acb31c-ec63-4242-32da-a35e950e5a67@sfritsch.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8aee128c-0699-5057-2655-4f7d91ac235b@gmail.com>
Date: Tue, 14 Dec 2021 10:19:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b6acb31c-ec63-4242-32da-a35e950e5a67@sfritsch.de>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.12.21 um 10:59 schrieb Stefan Fritsch:
> On 09.12.21 11:23, Christian König wrote:
>> Always waiting for the exclusive fence resulted on some performance
>> regressions. So try to wait for the shared fences first, then the
>> exclusive fence should always be signaled already.
>>
>> v2: fix incorrectly placed "(", add some comment why we do this.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>
> Tested-by: Stefan Fritsch <sf@sfritsch.de>

Thanks.

>
> Please also add a cc for linux-stable, so that this is fixed in 5.15.x

Sure, but I still need some acked-by or rb from one of the Nouveau guys. 
So gentle ping on that.

Regards,
Christian.

>
> Cheers,
> Stefan
>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 28 +++++++++++++------------
>>   1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c 
>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> index 05d0b3eb3690..0ae416aa76dc 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> @@ -353,15 +353,22 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, 
>> struct nouveau_channel *chan, bool e
>>             if (ret)
>>               return ret;
>> -    }
>>   -    fobj = dma_resv_shared_list(resv);
>> -    fence = dma_resv_excl_fence(resv);
>> +        fobj = NULL;
>> +    } else {
>> +        fobj = dma_resv_shared_list(resv);
>> +    }
>>   -    if (fence) {
>> +    /* Waiting for the exclusive fence first causes performance 
>> regressions
>> +     * under some circumstances. So manually wait for the shared 
>> ones first.
>> +     */
>> +    for (i = 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
>>           struct nouveau_channel *prev = NULL;
>>           bool must_wait = true;
>>   +        fence = rcu_dereference_protected(fobj->shared[i],
>> +                        dma_resv_held(resv));
>> +
>>           f = nouveau_local_fence(fence, chan->drm);
>>           if (f) {
>>               rcu_read_lock();
>> @@ -373,20 +380,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, 
>> struct nouveau_channel *chan, bool e
>>             if (must_wait)
>>               ret = dma_fence_wait(fence, intr);
>> -
>> -        return ret;
>>       }
>>   -    if (!exclusive || !fobj)
>> -        return ret;
>> -
>> -    for (i = 0; i < fobj->shared_count && !ret; ++i) {
>> +    fence = dma_resv_excl_fence(resv);
>> +    if (fence) {
>>           struct nouveau_channel *prev = NULL;
>>           bool must_wait = true;
>>   -        fence = rcu_dereference_protected(fobj->shared[i],
>> -                        dma_resv_held(resv));
>> -
>>           f = nouveau_local_fence(fence, chan->drm);
>>           if (f) {
>>               rcu_read_lock();
>> @@ -398,6 +398,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, 
>> struct nouveau_channel *chan, bool e
>>             if (must_wait)
>>               ret = dma_fence_wait(fence, intr);
>> +
>> +        return ret;
>>       }
>>         return ret;

