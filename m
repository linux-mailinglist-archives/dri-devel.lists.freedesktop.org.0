Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5D8458642
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 21:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22C76E02B;
	Sun, 21 Nov 2021 20:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0E46E02B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 20:08:47 +0000 (UTC)
Date: Sun, 21 Nov 2021 20:08:34 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/15] iio: buffer-dma: Get rid of incoming/outgoing queues
To: Lars-Peter Clausen <lars@metafoo.de>
Message-Id: <AMUX2R.XLGW1EZOMU9B2@crapouillou.net>
In-Reply-To: <332d001d-8b5a-bba2-c490-ed2e5efd0b1d@metafoo.de>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-2-paul@crapouillou.net>
 <e2689f0d-dc16-2519-57df-d98caadb07b0@metafoo.de>
 <0COX2R.BSNX3NW8N48T@crapouillou.net>
 <332d001d-8b5a-bba2-c490-ed2e5efd0b1d@metafoo.de>
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



Le dim., nov. 21 2021 at 19:49:03 +0100, Lars-Peter Clausen=20
<lars@metafoo.de> a =E9crit :
> On 11/21/21 6:52 PM, Paul Cercueil wrote:
>> Hi Lars,
>>=20
>> Le dim., nov. 21 2021 at 17:23:35 +0100, Lars-Peter Clausen=20
>> =7F<lars@metafoo.de> a =E9crit :
>>> On 11/15/21 3:19 PM, Paul Cercueil wrote:
>>>> The buffer-dma code was using two queues, incoming and outgoing, to
>>>> manage the state of the blocks in use.
>>>>=20
>>>> While this totally works, it adds some complexity to the code,
>>>> especially since the code only manages 2 blocks. It is much easier=20
>>>> to
>>>> just check each block's state manually, and keep a counter for the=20
>>>> next
>>>> block to dequeue.
>>>>=20
>>>> Since the new DMABUF based API wouldn't use these incoming and=20
>>>> outgoing
>>>> queues anyway, getting rid of them now makes the upcoming changes
>>>> simpler.
>>>>=20
>>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>> The outgoing queue is going to be replaced by fences, but I think=20
>>> we =7F=7Fneed to keep the incoming queue.
>>=20
>> Blocks are always accessed in sequential order, so we now have a=20
>> =7F"queue->next_dequeue" that cycles between the buffers allocated for=20
>> =7Ffileio.
>>=20
>>>> [...]
>>>> @@ -442,28 +435,33 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_disable);
>>>>   static void iio_dma_buffer_enqueue(struct iio_dma_buffer_queue=20
>>>> =7F=7F=7F*queue,
>>>>       struct iio_dma_buffer_block *block)
>>>>   {
>>>> -    if (block->state =3D=3D IIO_BLOCK_STATE_DEAD) {
>>>> +    if (block->state =3D=3D IIO_BLOCK_STATE_DEAD)
>>>>           iio_buffer_block_put(block);
>>>> -    } else if (queue->active) {
>>>> +    else if (queue->active)
>>>>           iio_dma_buffer_submit_block(queue, block);
>>>> -    } else {
>>>> +    else
>>>>           block->state =3D IIO_BLOCK_STATE_QUEUED;
>>>> -        list_add_tail(&block->head, &queue->incoming);
>>> If iio_dma_buffer_enqueue() is called with a dmabuf and the buffer=20
>>> is =7F=7Fnot active, it will be marked as queued, but we don't actually=
=20
>>> keep a =7F=7Freference to it anywhere. It will never be submitted to=20
>>> the DMA, and =7F=7Fit will never be signaled as completed.
>>=20
>> We do keep a reference to the buffers, in the queue->fileio.blocks=20
>> =7Farray. When the buffer is enabled, all the blocks in that array=20
>> that =7Fare in the "queued" state will be submitted to the DMA.
>>=20
> But not when used in combination with the DMA buf changes later in=20
> this series.
>=20

That's still the case after the DMABUF changes of the series. Or can=20
you point me exactly what you think is broken?

-Paul


