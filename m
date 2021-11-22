Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05245912C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849C089ACD;
	Mon, 22 Nov 2021 15:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F43B894B7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=Iz+FdhE+Nx+yB4wSTd3tzB2Vssfh3TskimAiedhv9NI=; b=gD4ezFIG8QLfTiha4MQJeryemC
 L+CDG/3AxR+Jz0IkxVKFTfRnhQK4wjK6OjQL+ge9f9D8Cy2F/F4ZrHU73gnkpTWpFMhW51P1W+Igt
 EPipxqpLphrl5GCtr9BzC5tMklv9sWl+x/Q8H5mxc9WkqZ27j0E3q4pEQijAx9WZmyD1PyiVoyHGQ
 HIVOVt+JDKWPlCb4/KVSDyyzN8buGG+U9WNJ9XdyAMVr97nKNd/q0L/XVCzB1LIBM7Jn6rZLtBrQO
 Y7EcXkiT4+J2sfXvFTm+kBP1PNhL5xKHxpw5LzsX1Tk6YCqXufqyMrguWuGGOSdJTsiehGUlfI0KV
 al+SOU+A==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mpB4y-000E7R-0A; Mon, 22 Nov 2021 16:18:00 +0100
Received: from [82.135.83.112] (helo=[192.168.178.20])
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mpB4x-0006A2-NY; Mon, 22 Nov 2021 16:17:59 +0100
Subject: Re: [PATCH 01/15] iio: buffer-dma: Get rid of incoming/outgoing queues
To: Paul Cercueil <paul@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-2-paul@crapouillou.net>
 <e2689f0d-dc16-2519-57df-d98caadb07b0@metafoo.de>
 <0COX2R.BSNX3NW8N48T@crapouillou.net>
 <332d001d-8b5a-bba2-c490-ed2e5efd0b1d@metafoo.de>
 <AMUX2R.XLGW1EZOMU9B2@crapouillou.net>
 <d542865e-2a0b-089f-e63c-b24d16c58ec6@metafoo.de>
 <UQBZ2R.HLXHH4QWJ0JS1@crapouillou.net>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <a5a9a07c-5e71-196f-da48-aa424c7001b0@metafoo.de>
Date: Mon, 22 Nov 2021 16:17:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <UQBZ2R.HLXHH4QWJ0JS1@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26361/Mon Nov 22 10:19:53 2021)
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/22/21 4:16 PM, Paul Cercueil wrote:
> Hi Lars,
>
> Le lun., nov. 22 2021 at 16:08:51 +0100, Lars-Peter Clausen 
> <lars@metafoo.de> a écrit :
>> On 11/21/21 9:08 PM, Paul Cercueil wrote:
>>>
>>>
>>> Le dim., nov. 21 2021 at 19:49:03 +0100, Lars-Peter Clausen 
>>> <lars@metafoo.de> a écrit :
>>>> On 11/21/21 6:52 PM, Paul Cercueil wrote:
>>>>> Hi Lars,
>>>>>
>>>>> Le dim., nov. 21 2021 at 17:23:35 +0100, Lars-Peter Clausen 
>>>>> <lars@metafoo.de> a écrit :
>>>>>> On 11/15/21 3:19 PM, Paul Cercueil wrote:
>>>>>>> The buffer-dma code was using two queues, incoming and outgoing, to
>>>>>>> manage the state of the blocks in use.
>>>>>>>
>>>>>>> While this totally works, it adds some complexity to the code,
>>>>>>> especially since the code only manages 2 blocks. It is much 
>>>>>>> easier to
>>>>>>> just check each block's state manually, and keep a counter for 
>>>>>>> the next
>>>>>>> block to dequeue.
>>>>>>>
>>>>>>> Since the new DMABUF based API wouldn't use these incoming and 
>>>>>>> outgoing
>>>>>>> queues anyway, getting rid of them now makes the upcoming changes
>>>>>>> simpler.
>>>>>>>
>>>>>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>>> The outgoing queue is going to be replaced by fences, but I think 
>>>>>> we need to keep the incoming queue.
>>>>>
>>>>> Blocks are always accessed in sequential order, so we now have a 
>>>>> "queue->next_dequeue" that cycles between the buffers 
>>>>> allocated for fileio.
>>>>>
>>>>>>> [...]
>>>>>>> @@ -442,28 +435,33 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_disable);
>>>>>>>   static void iio_dma_buffer_enqueue(struct iio_dma_buffer_queue 
>>>>>>> *queue,
>>>>>>>       struct iio_dma_buffer_block *block)
>>>>>>>   {
>>>>>>> -    if (block->state == IIO_BLOCK_STATE_DEAD) {
>>>>>>> +    if (block->state == IIO_BLOCK_STATE_DEAD)
>>>>>>>           iio_buffer_block_put(block);
>>>>>>> -    } else if (queue->active) {
>>>>>>> +    else if (queue->active)
>>>>>>>           iio_dma_buffer_submit_block(queue, block);
>>>>>>> -    } else {
>>>>>>> +    else
>>>>>>>           block->state = IIO_BLOCK_STATE_QUEUED;
>>>>>>> -        list_add_tail(&block->head, &queue->incoming);
>>>>>> If iio_dma_buffer_enqueue() is called with a dmabuf and the 
>>>>>> buffer is not active, it will be marked as queued, but we 
>>>>>> don't actually keep a reference to it anywhere. It will 
>>>>>> never be submitted to the DMA, and it will never be 
>>>>>> signaled as completed.
>>>>>
>>>>> We do keep a reference to the buffers, in the queue->fileio.blocks 
>>>>> array. When the buffer is enabled, all the blocks in that 
>>>>> array that are in the "queued" state will be submitted to the 
>>>>> DMA.
>>>>>
>>>> But not when used in combination with the DMA buf changes later in 
>>>> this series.
>>>>
>>>
>>> That's still the case after the DMABUF changes of the series. Or can 
>>> you point me exactly what you think is broken?
>>>
>> When you allocate a DMABUF with the allocate IOCTL and then submit it 
>> with the enqueue IOCTL before the buffer is enabled it will end up 
>> marked as queued, but not actually be queued anywhere.
>>
>
> Ok, it works for me because I never enqueue blocks before enabling the 
> buffer. I can add a requirement that blocks must be enqueued only 
> after the buffer is enabled.

I don't think that is a good idea. This way you are going to potentially 
drop data at the begining of your stream when the DMA isn't ready yet.

