Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A64443DE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 15:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196E4735E8;
	Wed,  3 Nov 2021 14:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB216735E8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 14:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id EA636202037;
 Wed,  3 Nov 2021 15:50:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id n_YKq6VrpC2F; Wed,  3 Nov 2021 15:50:54 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 4F7D9202033;
 Wed,  3 Nov 2021 15:50:54 +0100 (CET)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1miHbJ-000sW6-DO;
 Wed, 03 Nov 2021 15:50:53 +0100
Message-ID: <20cfea36-a8cc-7bd1-9604-57efdf4710e2@daenzer.net>
Date: Wed, 3 Nov 2021 15:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210723075857.4065-1-michel@daenzer.net>
 <f5f37693-bfe2-e52f-172b-00f4aa94dbd9@amd.com>
 <4cf94f59-f953-f5d7-9901-cfe5fd63bfbc@daenzer.net>
 <884050b3-5e7d-c00b-5467-290cfc57e0ea@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/poll: Get a file reference for
 outstanding fence callbacks
In-Reply-To: <884050b3-5e7d-c00b-5467-290cfc57e0ea@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-23 10:22, Christian König wrote:
> Am 23.07.21 um 10:19 schrieb Michel Dänzer:
>> On 2021-07-23 10:04 a.m., Christian König wrote:
>>> Am 23.07.21 um 09:58 schrieb Michel Dänzer:
>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>
>>>> This makes sure we don't hit the
>>>>
>>>>      BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>>>>
>>>> in dma_buf_release, which could be triggered by user space closing the
>>>> dma-buf file description while there are outstanding fence callbacks
>>>> from dma_buf_poll.
>>> I was also wondering the same thing while working on this, but then thought that the poll interface would take care of this.
>> I was able to hit the BUG_ON with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 .
>>
>>
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>>> ---
>>>>    drivers/dma-buf/dma-buf.c | 18 ++++++++++++------
>>>>    1 file changed, 12 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>> index 6c520c9bd93c..ec25498a971f 100644
>>>> --- a/drivers/dma-buf/dma-buf.c
>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>> @@ -65,12 +65,9 @@ static void dma_buf_release(struct dentry *dentry)
>>>>        BUG_ON(dmabuf->vmapping_counter);
>>>>          /*
>>>> -     * Any fences that a dma-buf poll can wait on should be signaled
>>>> -     * before releasing dma-buf. This is the responsibility of each
>>>> -     * driver that uses the reservation objects.
>>>> -     *
>>>> -     * If you hit this BUG() it means someone dropped their ref to the
>>>> -     * dma-buf while still having pending operation to the buffer.
>>>> +     * If you hit this BUG() it could mean:
>>>> +     * * There's a file reference imbalance in dma_buf_poll / dma_buf_poll_cb or somewhere else
>>>> +     * * dmabuf->cb_in/out.active are non-0 despite no pending fence callback
>>>>         */
>>>>        BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>>>>    @@ -196,6 +193,7 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>>>>    static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>>>    {
>>>>        struct dma_buf_poll_cb_t *dcb = (struct dma_buf_poll_cb_t *)cb;
>>>> +    struct dma_buf *dmabuf = container_of(dcb->poll, struct dma_buf, poll);
>>>>        unsigned long flags;
>>>>          spin_lock_irqsave(&dcb->poll->lock, flags);
>>>> @@ -203,6 +201,8 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>>>        dcb->active = 0;
>>>>        spin_unlock_irqrestore(&dcb->poll->lock, flags);
>>>>        dma_fence_put(fence);
>>>> +    /* Paired with get_file in dma_buf_poll */
>>>> +    fput(dmabuf->file);
>>> Is calling fput() in interrupt context ok? IIRC that could potentially sleep.
>> Looks fine AFAICT: It has
>>
>>         if (likely(!in_interrupt() && !(task->flags & PF_KTHREAD))) {
>>
>> and as a fallback for that, it adds the file to a lock-less delayed_fput_list which is processed by a workqueue.
> 
> Ah, yes that makes sense.
> 
> Fell free to add Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks! AFAICT this fix can be merged now for 5.16?


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
