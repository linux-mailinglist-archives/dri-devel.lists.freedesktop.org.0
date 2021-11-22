Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF80459163
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762C2897FD;
	Mon, 22 Nov 2021 15:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5C3897FD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:27:26 +0000 (UTC)
Date: Mon, 22 Nov 2021 15:27:14 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/15] iio: buffer-dma: Get rid of incoming/outgoing queues
To: Lars-Peter Clausen <lars@metafoo.de>
Message-Id: <E9CZ2R.4VU3MCLBDDR72@crapouillou.net>
In-Reply-To: <a5a9a07c-5e71-196f-da48-aa424c7001b0@metafoo.de>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-2-paul@crapouillou.net>
 <e2689f0d-dc16-2519-57df-d98caadb07b0@metafoo.de>
 <0COX2R.BSNX3NW8N48T@crapouillou.net>
 <332d001d-8b5a-bba2-c490-ed2e5efd0b1d@metafoo.de>
 <AMUX2R.XLGW1EZOMU9B2@crapouillou.net>
 <d542865e-2a0b-089f-e63c-b24d16c58ec6@metafoo.de>
 <UQBZ2R.HLXHH4QWJ0JS1@crapouillou.net>
 <a5a9a07c-5e71-196f-da48-aa424c7001b0@metafoo.de>
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



Le lun., nov. 22 2021 at 16:17:59 +0100, Lars-Peter Clausen=20
<lars@metafoo.de> a =E9crit :
> On 11/22/21 4:16 PM, Paul Cercueil wrote:
>> Hi Lars,
>>=20
>> Le lun., nov. 22 2021 at 16:08:51 +0100, Lars-Peter Clausen=20
>> =7F<lars@metafoo.de> a =E9crit :
>>> On 11/21/21 9:08 PM, Paul Cercueil wrote:
>>>>=20
>>>>=20
>>>> Le dim., nov. 21 2021 at 19:49:03 +0100, Lars-Peter Clausen=20
>>>> =7F=7F=7F=7F<lars@metafoo.de> a =E9crit :
>>>>> On 11/21/21 6:52 PM, Paul Cercueil wrote:
>>>>>> Hi Lars,
>>>>>>=20
>>>>>> Le dim., nov. 21 2021 at 17:23:35 +0100, Lars-Peter Clausen=20
>>>>>> =7F=7F=7F=7F=7F=7F=7F=7F=7F<lars@metafoo.de> a =E9crit :
>>>>>>> On 11/15/21 3:19 PM, Paul Cercueil wrote:
>>>>>>>> The buffer-dma code was using two queues, incoming and=20
>>>>>>>> outgoing, to
>>>>>>>> manage the state of the blocks in use.
>>>>>>>>=20
>>>>>>>> While this totally works, it adds some complexity to the code,
>>>>>>>> especially since the code only manages 2 blocks. It is much=20
>>>>>>>> =7F=7F=7F=7F=7F=7F=7Feasier to
>>>>>>>> just check each block's state manually, and keep a counter for=20
>>>>>>>> =7F=7F=7F=7F=7F=7F=7Fthe =7F=7F=7F=7F=7Fnext
>>>>>>>> block to dequeue.
>>>>>>>>=20
>>>>>>>> Since the new DMABUF based API wouldn't use these incoming and=20
>>>>>>>> =7F=7F=7F=7F=7F=7F=7F=7F=7F=7F=7F=7Foutgoing
>>>>>>>> queues anyway, getting rid of them now makes the upcoming=20
>>>>>>>> changes
>>>>>>>> simpler.
>>>>>>>>=20
>>>>>>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>>>> The outgoing queue is going to be replaced by fences, but I=20
>>>>>>> think =7F=7F=7F=7F=7F=7F=7F=7F=7F=7Fwe =7F=7Fneed to keep the incom=
ing queue.
>>>>>>=20
>>>>>> Blocks are always accessed in sequential order, so we now have a=20
>>>>>> =7F=7F=7F=7F=7F=7F=7F=7F=7F"queue->next_dequeue" that cycles between=
 the buffers=20
>>>>>> =7F=7F=7F=7F=7Fallocated for =7F=7F=7F=7Ffileio.
>>>>>>=20
>>>>>>>> [...]
>>>>>>>> @@ -442,28 +435,33 @@=20
>>>>>>>> EXPORT_SYMBOL_GPL(iio_dma_buffer_disable);
>>>>>>>>   static void iio_dma_buffer_enqueue(struct=20
>>>>>>>> iio_dma_buffer_queue =7F=7F=7F=7F=7F=7F=7F=7F=7F=7F=7F=7F=7F=7F=7F=
*queue,
>>>>>>>>       struct iio_dma_buffer_block *block)
>>>>>>>>   {
>>>>>>>> -    if (block->state =3D=3D IIO_BLOCK_STATE_DEAD) {
>>>>>>>> +    if (block->state =3D=3D IIO_BLOCK_STATE_DEAD)
>>>>>>>>           iio_buffer_block_put(block);
>>>>>>>> -    } else if (queue->active) {
>>>>>>>> +    else if (queue->active)
>>>>>>>>           iio_dma_buffer_submit_block(queue, block);
>>>>>>>> -    } else {
>>>>>>>> +    else
>>>>>>>>           block->state =3D IIO_BLOCK_STATE_QUEUED;
>>>>>>>> -        list_add_tail(&block->head, &queue->incoming);
>>>>>>> If iio_dma_buffer_enqueue() is called with a dmabuf and the=20
>>>>>>> =7F=7F=7F=7F=7F=7Fbuffer =7F=7F=7F=7Fis =7F=7Fnot active, it will b=
e marked as queued,=20
>>>>>>> but we =7F=7F=7F=7F=7F=7Fdon't actually =7F=7F=7F=7Fkeep a =7F=7Fre=
ference to it=20
>>>>>>> anywhere. It will =7F=7F=7F=7F=7F=7Fnever be submitted to =7F=7F=7F=
=7Fthe DMA, and=20
>>>>>>> =7F=7Fit will never be =7F=7F=7F=7F=7F=7Fsignaled as completed.
>>>>>>=20
>>>>>> We do keep a reference to the buffers, in the=20
>>>>>> queue->fileio.blocks =7F=7F=7F=7F=7F=7F=7F=7F=7Farray. When the buff=
er is enabled,=20
>>>>>> all the blocks in that =7F=7F=7F=7F=7Farray =7F=7F=7Fthat =7Fare in =
the "queued"=20
>>>>>> state will be submitted to the =7F=7F=7F=7F=7FDMA.
>>>>>>=20
>>>>> But not when used in combination with the DMA buf changes later=20
>>>>> in =7F=7F=7F=7F=7F=7Fthis series.
>>>>>=20
>>>>=20
>>>> That's still the case after the DMABUF changes of the series. Or=20
>>>> can =7F=7F=7F=7Fyou point me exactly what you think is broken?
>>>>=20
>>> When you allocate a DMABUF with the allocate IOCTL and then submit=20
>>> it =7F=7Fwith the enqueue IOCTL before the buffer is enabled it will=20
>>> end up =7F=7Fmarked as queued, but not actually be queued anywhere.
>>>=20
>>=20
>> Ok, it works for me because I never enqueue blocks before enabling=20
>> the =7Fbuffer. I can add a requirement that blocks must be enqueued=20
>> only =7Fafter the buffer is enabled.
>=20
> I don't think that is a good idea. This way you are going to=20
> potentially drop data at the begining of your stream when the DMA=20
> isn't ready yet.
>=20

You wouldn't drop data, but it could cause an underrun, yes. Is it such=20
a big deal, knowing that the buffer was just enabled? I don't think you=20
can disable then enable the buffer without causing a discontinuity in=20
the stream.

-Paul


