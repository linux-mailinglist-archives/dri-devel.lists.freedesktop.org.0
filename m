Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F65040459D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 08:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4846E446;
	Thu,  9 Sep 2021 06:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A1C6E446
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 06:31:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u9so865586wrg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 23:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=3IIOvoD+yUfy3tqc9beXnyqk7oU/rmbOi70xv9g3SEc=;
 b=AX4TaQ6wVEpRpmcZpkrgyw2u3V27gM9p4rBBT7sFt2HMjIpfNtT7DZmbS/eiXSvhGY
 XpwQJ5vnQccRB802fybVetUZ9iYjkAoaJZKisvUE0Dzk+3nzQmk9+Wi8upfNg8U3Us6g
 p8USJ3bDklQIWNgr0k8mfHq32nbk4uc0v4WyFbOabdticCQw7SdUmvajVrwS6urNhMOJ
 IP3n4vsCL9FqMGJ7/f9+hW6JsrILdv25Cuxq0+v6p0HwU/mtjqQh4mHzHjET3Oj9RnZ2
 v3QsVUxiE8EpdlhNPZdXIVLD8RnyZ//uJFEjTiFSux9Z5RUX1WScxmPouh7ElN5egUfA
 rluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3IIOvoD+yUfy3tqc9beXnyqk7oU/rmbOi70xv9g3SEc=;
 b=J/CIZJq1LXyEyLd+ZXsGoylv3rfxOsNr0oacIMHaRV6/xVDMNAikUweHTTogRXQ4h6
 f8XQf4fzIncMSxcrYJp0jxpQ8/AoP/rx5zC4fOkYmOlLhUz+ZoTlf98yG0bWNwGE8eLm
 c1WtHE1zIqZiDKfLU6mCBu4wDfngzvK+9z7URDmYLT1VCJp48lueGsfmDlDg3tVsulNd
 ARjxOFEbk9F4XGyT5g2JgWN+PzFo15E8Hdb4B3QQAbeYbc3WYnnodHXCa+IplgfjGmpJ
 qHfNJQJP/uKoYru9G795GbupjTzs4jOicWNC3XuhY7PJMykRZ57dAr3A5mRSL40L1WSt
 F7Lg==
X-Gm-Message-State: AOAM530I3akFYQ/EoyLQtg8dPafJ/5BfZh+zI9I1kOJe67P+hAEcvP12
 Rbltq1YojL4z9WAnKVsfk8A=
X-Google-Smtp-Source: ABdhPJwC+1MPyUNLIAlszUOunTZlDyF09mgrO7ASkXbziaNGzhijQarC83+OwLlBBLMJlFzBrAsVaQ==
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr1510523wrw.225.1631169066042; 
 Wed, 08 Sep 2021 23:31:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:327b:a453:3daa:de36?
 ([2a02:908:1252:fb60:327b:a453:3daa:de36])
 by smtp.gmail.com with ESMTPSA id i4sm670080wmd.5.2021.09.08.23.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 23:31:05 -0700 (PDT)
Subject: Re: [PATCH v3 7/9] dma-buf/fence-chain: Add fence deadline support
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-8-robdclark@gmail.com>
 <YTj4yPk1YuFk3oeL@phenom.ffwll.local>
 <CAF6AEGs3DhSKhDkft58VqkM6GwMMSq87GZkQAaPf_LLavDdacA@mail.gmail.com>
 <YTkExzW4QWBC6hMa@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <422d6afd-149b-5d4c-9af6-7300058e60d6@gmail.com>
Date: Thu, 9 Sep 2021 08:31:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTkExzW4QWBC6hMa@phenom.ffwll.local>
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

Am 08.09.21 um 20:45 schrieb Daniel Vetter:
> On Wed, Sep 08, 2021 at 11:19:15AM -0700, Rob Clark wrote:
>> On Wed, Sep 8, 2021 at 10:54 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Fri, Sep 03, 2021 at 11:47:58AM -0700, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>   drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
>>>>   1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>>>> index 1b4cb3e5cec9..736a9ad3ea6d 100644
>>>> --- a/drivers/dma-buf/dma-fence-chain.c
>>>> +++ b/drivers/dma-buf/dma-fence-chain.c
>>>> @@ -208,6 +208,18 @@ static void dma_fence_chain_release(struct dma_fence *fence)
>>>>        dma_fence_free(fence);
>>>>   }
>>>>
>>>> +
>>>> +static void dma_fence_chain_set_deadline(struct dma_fence *fence,
>>>> +                                      ktime_t deadline)
>>>> +{
>>>> +     dma_fence_chain_for_each(fence, fence) {
>>>> +             struct dma_fence_chain *chain = to_dma_fence_chain(fence);
>>>> +             struct dma_fence *f = chain ? chain->fence : fence;
>>> Doesn't this just end up calling set_deadline on a chain, potenetially
>>> resulting in recursion? Also I don't think this should ever happen, why
>>> did you add that?
>> Tbh the fence-chain was the part I was a bit fuzzy about, and the main
>> reason I added igt tests.  The iteration is similar to how, for ex,
>> dma_fence_chain_signaled() work, and according to the igt test it does
>> what was intended
> Huh indeed. Maybe something we should fix, like why does the
> dma_fence_chain_for_each not give you the upcast chain pointer ... I guess
> this also needs more Christian and less me.

Yeah I was also already thinking about having a 
dma_fence_chain_for_each_contained() macro which directly returns the 
containing fence, just didn't had time to implement/clean that up.

And yes the patch is correct as it is and avoid the recursion, so 
Reviewed-by: Christian König <christian.koenig@amd.com> for this one.

Regards,
Christian.

> -Daniel
>
>> BR,
>> -R
>>
>>> -Daniel
>>>
>>>> +
>>>> +             dma_fence_set_deadline(f, deadline);
>>>> +     }
>>>> +}
>>>> +
>>>>   const struct dma_fence_ops dma_fence_chain_ops = {
>>>>        .use_64bit_seqno = true,
>>>>        .get_driver_name = dma_fence_chain_get_driver_name,
>>>> @@ -215,6 +227,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
>>>>        .enable_signaling = dma_fence_chain_enable_signaling,
>>>>        .signaled = dma_fence_chain_signaled,
>>>>        .release = dma_fence_chain_release,
>>>> +     .set_deadline = dma_fence_chain_set_deadline,
>>>>   };
>>>>   EXPORT_SYMBOL(dma_fence_chain_ops);
>>>>
>>>> --
>>>> 2.31.1
>>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch

