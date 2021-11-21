Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D941D4585FB
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 19:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E203089F8B;
	Sun, 21 Nov 2021 18:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C919889F8B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 18:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=/h9j2JDuTj2d8830SLDJcdaobewaUQwnY1GZuvNRZyY=; b=lmDJ5a6k00Cf69H5Fck+3FdweN
 URDsuJzv/thoCS37//i1cRKTR2PObz9ZJwiSH1wbxb6fpi5hjzV6y7aQzoMvVKNCOCpnsfbBHhRfR
 fsA+VPzqJajbeXXvtQ0xoFGH7joUK7SNnX6DuK6GsSWmAmVJ1gMb8bd4FVzUl7bOyHV+0yEN4Jls/
 JKCRCyTUCuoQMgKbjzTGqpReb1Vj1S+E/gjTcqS22k56QYPEASSWfK1hjDIL4zcoB5PKYP2ugFTbV
 Mco5BYscY/Cm9YZkTwYtM+cj2HdXNKNnniMFPsSLzSTkqgrHpDTm3hc/yU+veazQUILhG4Bj2qzvx
 CFDF2V6Q==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mortf-0001N0-W7; Sun, 21 Nov 2021 19:49:04 +0100
Received: from [82.135.83.112] (helo=[192.168.178.20])
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mortf-000PXU-JM; Sun, 21 Nov 2021 19:49:03 +0100
Subject: Re: [PATCH 01/15] iio: buffer-dma: Get rid of incoming/outgoing queues
To: Paul Cercueil <paul@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-2-paul@crapouillou.net>
 <e2689f0d-dc16-2519-57df-d98caadb07b0@metafoo.de>
 <0COX2R.BSNX3NW8N48T@crapouillou.net>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <332d001d-8b5a-bba2-c490-ed2e5efd0b1d@metafoo.de>
Date: Sun, 21 Nov 2021 19:49:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0COX2R.BSNX3NW8N48T@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26360/Sun Nov 21 10:19:26 2021)
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

On 11/21/21 6:52 PM, Paul Cercueil wrote:
> Hi Lars,
>
> Le dim., nov. 21 2021 at 17:23:35 +0100, Lars-Peter Clausen 
> <lars@metafoo.de> a écrit :
>> On 11/15/21 3:19 PM, Paul Cercueil wrote:
>>> The buffer-dma code was using two queues, incoming and outgoing, to
>>> manage the state of the blocks in use.
>>>
>>> While this totally works, it adds some complexity to the code,
>>> especially since the code only manages 2 blocks. It is much easier to
>>> just check each block's state manually, and keep a counter for the next
>>> block to dequeue.
>>>
>>> Since the new DMABUF based API wouldn't use these incoming and outgoing
>>> queues anyway, getting rid of them now makes the upcoming changes
>>> simpler.
>>>
>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> The outgoing queue is going to be replaced by fences, but I think we 
>> need to keep the incoming queue.
>
> Blocks are always accessed in sequential order, so we now have a 
> "queue->next_dequeue" that cycles between the buffers allocated for 
> fileio.
>
>>> [...]
>>> @@ -442,28 +435,33 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_disable);
>>>   static void iio_dma_buffer_enqueue(struct iio_dma_buffer_queue 
>>> *queue,
>>>       struct iio_dma_buffer_block *block)
>>>   {
>>> -    if (block->state == IIO_BLOCK_STATE_DEAD) {
>>> +    if (block->state == IIO_BLOCK_STATE_DEAD)
>>>           iio_buffer_block_put(block);
>>> -    } else if (queue->active) {
>>> +    else if (queue->active)
>>>           iio_dma_buffer_submit_block(queue, block);
>>> -    } else {
>>> +    else
>>>           block->state = IIO_BLOCK_STATE_QUEUED;
>>> -        list_add_tail(&block->head, &queue->incoming);
>> If iio_dma_buffer_enqueue() is called with a dmabuf and the buffer is 
>> not active, it will be marked as queued, but we don't actually keep a 
>> reference to it anywhere. It will never be submitted to the DMA, and 
>> it will never be signaled as completed.
>
> We do keep a reference to the buffers, in the queue->fileio.blocks 
> array. When the buffer is enabled, all the blocks in that array that 
> are in the "queued" state will be submitted to the DMA.
>
But not when used in combination with the DMA buf changes later in this 
series.

