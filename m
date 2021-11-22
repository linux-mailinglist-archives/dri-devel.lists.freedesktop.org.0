Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC82459121
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106A489B99;
	Mon, 22 Nov 2021 15:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD8E89B99
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:16:18 +0000 (UTC)
Date: Mon, 22 Nov 2021 15:16:06 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/15] iio: buffer-dma: Get rid of incoming/outgoing queues
To: Lars-Peter Clausen <lars@metafoo.de>
Message-Id: <UQBZ2R.HLXHH4QWJ0JS1@crapouillou.net>
In-Reply-To: <d542865e-2a0b-089f-e63c-b24d16c58ec6@metafoo.de>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-2-paul@crapouillou.net>
 <e2689f0d-dc16-2519-57df-d98caadb07b0@metafoo.de>
 <0COX2R.BSNX3NW8N48T@crapouillou.net>
 <332d001d-8b5a-bba2-c490-ed2e5efd0b1d@metafoo.de>
 <AMUX2R.XLGW1EZOMU9B2@crapouillou.net>
 <d542865e-2a0b-089f-e63c-b24d16c58ec6@metafoo.de>
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

Le lun., nov. 22 2021 at 16:08:51 +0100, Lars-Peter Clausen=20
<lars@metafoo.de> a =E9crit :
> On 11/21/21 9:08 PM, Paul Cercueil wrote:
>>=20
>>=20
>> Le dim., nov. 21 2021 at 19:49:03 +0100, Lars-Peter Clausen=20
>> =7F<lars@metafoo.de> a =E9crit :
>>> On 11/21/21 6:52 PM, Paul Cercueil wrote:
>>>> Hi Lars,
>>>>=20
>>>> Le dim., nov. 21 2021 at 17:23:35 +0100, Lars-Peter Clausen=20
>>>> =7F=7F=7F=7F<lars@metafoo.de> a =E9crit :
>>>>> On 11/15/21 3:19 PM, Paul Cercueil wrote:
>>>>>> The buffer-dma code was using two queues, incoming and outgoing,=20
>>>>>> to
>>>>>> manage the state of the blocks in use.
>>>>>>=20
>>>>>> While this totally works, it adds some complexity to the code,
>>>>>> especially since the code only manages 2 blocks. It is much=20
>>>>>> easier to
>>>>>> just check each block's state manually, and keep a counter for=20
>>>>>> the =7F=7F=7F=7F=7Fnext
>>>>>> block to dequeue.
>>>>>>=20
>>>>>> Since the new DMABUF based API wouldn't use these incoming and=20
>>>>>> =7F=7F=7F=7F=7Foutgoing
>>>>>> queues anyway, getting rid of them now makes the upcoming changes
>>>>>> simpler.
>>>>>>=20
>>>>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>> The outgoing queue is going to be replaced by fences, but I think=20
>>>>> =7F=7F=7F=7Fwe =7F=7Fneed to keep the incoming queue.
>>>>=20
>>>> Blocks are always accessed in sequential order, so we now have a=20
>>>> =7F=7F=7F=7F"queue->next_dequeue" that cycles between the buffers=20
>>>> allocated for =7F=7F=7F=7Ffileio.
>>>>=20
>>>>>> [...]
>>>>>> @@ -442,28 +435,33 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_disable);
>>>>>>   static void iio_dma_buffer_enqueue(struct iio_dma_buffer_queue=20
>>>>>> =7F=7F=7F=7F=7F=7F=7F=7F*queue,
>>>>>>       struct iio_dma_buffer_block *block)
>>>>>>   {
>>>>>> -    if (block->state =3D=3D IIO_BLOCK_STATE_DEAD) {
>>>>>> +    if (block->state =3D=3D IIO_BLOCK_STATE_DEAD)
>>>>>>           iio_buffer_block_put(block);
>>>>>> -    } else if (queue->active) {
>>>>>> +    else if (queue->active)
>>>>>>           iio_dma_buffer_submit_block(queue, block);
>>>>>> -    } else {
>>>>>> +    else
>>>>>>           block->state =3D IIO_BLOCK_STATE_QUEUED;
>>>>>> -        list_add_tail(&block->head, &queue->incoming);
>>>>> If iio_dma_buffer_enqueue() is called with a dmabuf and the=20
>>>>> buffer =7F=7F=7F=7Fis =7F=7Fnot active, it will be marked as queued, =
but we=20
>>>>> don't actually =7F=7F=7F=7Fkeep a =7F=7Freference to it anywhere. It =
will=20
>>>>> never be submitted to =7F=7F=7F=7Fthe DMA, and =7F=7Fit will never be=
=20
>>>>> signaled as completed.
>>>>=20
>>>> We do keep a reference to the buffers, in the queue->fileio.blocks=20
>>>> =7F=7F=7F=7Farray. When the buffer is enabled, all the blocks in that=20
>>>> array =7F=7F=7Fthat =7Fare in the "queued" state will be submitted to =
the=20
>>>> DMA.
>>>>=20
>>> But not when used in combination with the DMA buf changes later in=20
>>> =7F=7Fthis series.
>>>=20
>>=20
>> That's still the case after the DMABUF changes of the series. Or can=20
>> =7Fyou point me exactly what you think is broken?
>>=20
> When you allocate a DMABUF with the allocate IOCTL and then submit it=20
> with the enqueue IOCTL before the buffer is enabled it will end up=20
> marked as queued, but not actually be queued anywhere.
>=20

Ok, it works for me because I never enqueue blocks before enabling the=20
buffer. I can add a requirement that blocks must be enqueued only after=20
the buffer is enabled.

Cheers,
-Paul


