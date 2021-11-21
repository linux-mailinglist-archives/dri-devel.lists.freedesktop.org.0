Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5C14585B2
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 18:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FD06E02A;
	Sun, 21 Nov 2021 17:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9E66E02A
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 17:53:00 +0000 (UTC)
Date: Sun, 21 Nov 2021 17:52:48 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/15] iio: buffer-dma: Get rid of incoming/outgoing queues
To: Lars-Peter Clausen <lars@metafoo.de>
Message-Id: <0COX2R.BSNX3NW8N48T@crapouillou.net>
In-Reply-To: <e2689f0d-dc16-2519-57df-d98caadb07b0@metafoo.de>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-2-paul@crapouillou.net>
 <e2689f0d-dc16-2519-57df-d98caadb07b0@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lars,

Le dim., nov. 21 2021 at 17:23:35 +0100, Lars-Peter Clausen=20
<lars@metafoo.de> a =E9crit :
> On 11/15/21 3:19 PM, Paul Cercueil wrote:
>> The buffer-dma code was using two queues, incoming and outgoing, to
>> manage the state of the blocks in use.
>>=20
>> While this totally works, it adds some complexity to the code,
>> especially since the code only manages 2 blocks. It is much easier to
>> just check each block's state manually, and keep a counter for the=20
>> next
>> block to dequeue.
>>=20
>> Since the new DMABUF based API wouldn't use these incoming and=20
>> outgoing
>> queues anyway, getting rid of them now makes the upcoming changes
>> simpler.
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> The outgoing queue is going to be replaced by fences, but I think we=20
> need to keep the incoming queue.

Blocks are always accessed in sequential order, so we now have a=20
"queue->next_dequeue" that cycles between the buffers allocated for=20
fileio.

>> [...]
>> @@ -442,28 +435,33 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_disable);
>>   static void iio_dma_buffer_enqueue(struct iio_dma_buffer_queue=20
>> *queue,
>>   	struct iio_dma_buffer_block *block)
>>   {
>> -	if (block->state =3D=3D IIO_BLOCK_STATE_DEAD) {
>> +	if (block->state =3D=3D IIO_BLOCK_STATE_DEAD)
>>   		iio_buffer_block_put(block);
>> -	} else if (queue->active) {
>> +	else if (queue->active)
>>   		iio_dma_buffer_submit_block(queue, block);
>> -	} else {
>> +	else
>>   		block->state =3D IIO_BLOCK_STATE_QUEUED;
>> -		list_add_tail(&block->head, &queue->incoming);
> If iio_dma_buffer_enqueue() is called with a dmabuf and the buffer is=20
> not active, it will be marked as queued, but we don't actually keep a=20
> reference to it anywhere. It will never be submitted to the DMA, and=20
> it will never be signaled as completed.

We do keep a reference to the buffers, in the queue->fileio.blocks=20
array. When the buffer is enabled, all the blocks in that array that=20
are in the "queued" state will be submitted to the DMA.

Cheers,
-Paul


