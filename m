Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BE13D3692
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA9F6E946;
	Fri, 23 Jul 2021 08:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DADA6E946
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:22:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w12so1347345wro.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 01:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=eHQIcjQXUTuq7R+K/4eHvbaN0F5Gzr6UU0DXUwmBLJk=;
 b=nzcmKaSw5a9/iHEpD8IGwqxpV6+wQbsa6rC46XSES6JjF07FEKVg5FjKb1JTD1MJUp
 UWb+whYWfBLhf/apn1zGhcaT4qohXVV9Xxj+alDN1LG2wDWWnRrc4X6n0KHkAXqB4ry3
 EuYXMqVBCY8zFOqB5Bl21/xMzA/+RuztnUcARafe2vZJkDUEysgxx9fP8cYwtGQeWGrr
 KCFLMGwrWz1DZBQekRznkbB/lVRCjDPnvOmYPL749yv5CiBnHTr6FGF8M0FDMUoObyn7
 lu/nEXdekEdZuKsYKFZGN/QFViN1Fvqo8TvwjUbGuzVt2NKGXWZHmUzfVR28BQ1W3bzs
 x78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=eHQIcjQXUTuq7R+K/4eHvbaN0F5Gzr6UU0DXUwmBLJk=;
 b=thjDdeXi1hPpR5RkemEGI+hFncqm5JkSFkfOc+feI0bs1+DtI1lfu/IDiWHbpF5zew
 qjy3w+K6yoY2R/BdQ1+gyEFp9JbDDC8Y/lK57kD8IVOGTDnDVKZjNOdDm3rymxEkyQVR
 LqTbyhyqwyvtJQScJMq/szjyKBGJiWyw2wAnB7KH/9YW386hsJbed7/0t7Jib1JdkbjL
 qdsUEqxFHU1h+7o8pGUkaDeY7Hyq8r3861cGfdXXoUHNaYWUQ4Xd4AdpELPLAZE43U4G
 10ho85DG8ElhYDi+E22gWXI2Na66GmojZUc8LEh9RB9IXukAvnScqVAdQZT16zfLFlME
 vwPg==
X-Gm-Message-State: AOAM533nP/AAB8nUq0/ZIDyBCBShDiORC4QVTCMA1qXFPHj7rmmgPqXg
 k5hTJIcRVNT9R61ck16tG4uw2PA9GBA=
X-Google-Smtp-Source: ABdhPJzNsXd0xn+ZYk/hKsrkSpo+O4LewrB8Z7g153yCkw6fE4ToY+F0tCUlfnCAi8qU3Z4xnS7gPA==
X-Received: by 2002:adf:f6cc:: with SMTP id y12mr1609495wrp.178.1627028556944; 
 Fri, 23 Jul 2021 01:22:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a0d7:cc1c:9090:5782?
 ([2a02:908:1252:fb60:a0d7:cc1c:9090:5782])
 by smtp.gmail.com with ESMTPSA id s24sm34555606wra.33.2021.07.23.01.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 01:22:36 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/poll: Get a file reference for
 outstanding fence callbacks
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210723075857.4065-1-michel@daenzer.net>
 <f5f37693-bfe2-e52f-172b-00f4aa94dbd9@amd.com>
 <4cf94f59-f953-f5d7-9901-cfe5fd63bfbc@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <884050b3-5e7d-c00b-5467-290cfc57e0ea@gmail.com>
Date: Fri, 23 Jul 2021 10:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4cf94f59-f953-f5d7-9901-cfe5fd63bfbc@daenzer.net>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 23.07.21 um 10:19 schrieb Michel Dänzer:
> On 2021-07-23 10:04 a.m., Christian König wrote:
>> Am 23.07.21 um 09:58 schrieb Michel Dänzer:
>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>
>>> This makes sure we don't hit the
>>>
>>>      BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>>>
>>> in dma_buf_release, which could be triggered by user space closing the
>>> dma-buf file description while there are outstanding fence callbacks
>>> from dma_buf_poll.
>> I was also wondering the same thing while working on this, but then thought that the poll interface would take care of this.
> I was able to hit the BUG_ON with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 .
>
>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>> ---
>>>    drivers/dma-buf/dma-buf.c | 18 ++++++++++++------
>>>    1 file changed, 12 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 6c520c9bd93c..ec25498a971f 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -65,12 +65,9 @@ static void dma_buf_release(struct dentry *dentry)
>>>        BUG_ON(dmabuf->vmapping_counter);
>>>          /*
>>> -     * Any fences that a dma-buf poll can wait on should be signaled
>>> -     * before releasing dma-buf. This is the responsibility of each
>>> -     * driver that uses the reservation objects.
>>> -     *
>>> -     * If you hit this BUG() it means someone dropped their ref to the
>>> -     * dma-buf while still having pending operation to the buffer.
>>> +     * If you hit this BUG() it could mean:
>>> +     * * There's a file reference imbalance in dma_buf_poll / dma_buf_poll_cb or somewhere else
>>> +     * * dmabuf->cb_in/out.active are non-0 despite no pending fence callback
>>>         */
>>>        BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>>>    @@ -196,6 +193,7 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>>>    static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>>    {
>>>        struct dma_buf_poll_cb_t *dcb = (struct dma_buf_poll_cb_t *)cb;
>>> +    struct dma_buf *dmabuf = container_of(dcb->poll, struct dma_buf, poll);
>>>        unsigned long flags;
>>>          spin_lock_irqsave(&dcb->poll->lock, flags);
>>> @@ -203,6 +201,8 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>>        dcb->active = 0;
>>>        spin_unlock_irqrestore(&dcb->poll->lock, flags);
>>>        dma_fence_put(fence);
>>> +    /* Paired with get_file in dma_buf_poll */
>>> +    fput(dmabuf->file);
>> Is calling fput() in interrupt context ok? IIRC that could potentially sleep.
> Looks fine AFAICT: It has
>
> 		if (likely(!in_interrupt() && !(task->flags & PF_KTHREAD))) {
>
> and as a fallback for that, it adds the file to a lock-less delayed_fput_list which is processed by a workqueue.

Ah, yes that makes sense.

Fell free to add Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks,
Christian.
