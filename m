Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47AD587C50
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 14:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C858EE61;
	Tue,  2 Aug 2022 12:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kozue.soulik.info (kozue.soulik.info
 [IPv6:2001:19f0:7000:8404:5054:ff:fe75:428f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5574C8E6D6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 12:21:32 +0000 (UTC)
Received: from [192.168.10.77] (unknown [140.207.23.88])
 by kozue.soulik.info (Postfix) with ESMTPSA id 18E6D100DB3;
 Tue,  2 Aug 2022 21:15:17 +0900 (JST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] [Draft]: media: videobuf2-dma-heap: add a vendor defined
 memory runtine
From: ayaka <ayaka@soulik.info>
In-Reply-To: <CAAFQd5AL=OejdaubnYDRF4M1EKyStZP_FAMPz4CJ=KCa_8QjaA@mail.gmail.com>
Date: Tue, 2 Aug 2022 20:21:22 +0800
Message-Id: <CF192A87-1664-45B2-B26C-A9B8B6A52523@soulik.info>
References: <CAAFQd5AL=OejdaubnYDRF4M1EKyStZP_FAMPz4CJ=KCa_8QjaA@mail.gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
X-Mailer: iPad Mail (18D61)
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
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 Hsia-Jun Li <randy.li@synaptics.com>, linux-media@vger.kernel.org,
 christian.koenig@amd.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, the previous one contains html data.

> On Aug 2, 2022, at 3:33 PM, Tomasz Figa <tfiga@chromium.org> wrote:
>=20
> =EF=BB=BFOn Mon, Aug 1, 2022 at 8:43 PM ayaka <ayaka@soulik.info> wrote:
>> Sent from my iPad
>>>> On Aug 1, 2022, at 5:46 PM, Tomasz Figa <tfiga@chromium.org> wrote:
>>> =EF=BB=BFCAUTION: Email originated externally, do not click links or ope=
n attachments unless you recognize the sender and know the content is safe.
>>>> On Mon, Aug 1, 2022 at 3:44 PM Hsia-Jun Li <Randy.Li@synaptics.com> wro=
te:
>>>>> On 8/1/22 14:19, Tomasz Figa wrote:
>>>> Hello Tomasz
>>>>> ?Hi Randy,
>>>>> On Mon, Aug 1, 2022 at 5:21 AM <ayaka@soulik.info> wrote:
>>>>>> From: Randy Li <ayaka@soulik.info>
>>>>>> This module is still at a early stage, I wrote this for showing what
>>>>>> APIs we need here.
>>>>>> Let me explain why we need such a module here.
>>>>>> If you won't allocate buffers from a V4L2 M2M device, this module
>>>>>> may not be very useful. I am sure the most of users won't know a
>>>>>> device would require them allocate buffers from a DMA-Heap then
>>>>>> import those buffers into a V4L2's queue.
>>>>>> Then the question goes back to why DMA-Heap. =46rom the Android's
>>>>>> description, we know it is about the copyright's DRM.
>>>>>> When we allocate a buffer in a DMA-Heap, it may register that buffer
>>>>>> in the trusted execution environment so the firmware which is running=

>>>>>> or could only be acccesed from there could use that buffer later.
>>>>>> The answer above leads to another thing which is not done in this
>>>>>> version, the DMA mapping. Although in some platforms, a DMA-Heap
>>>>>> responses a IOMMU device as well. For the genernal purpose, we would
>>>>>> be better assuming the device mapping should be done for each device
>>>>>> itself. The problem here we only know alloc_devs in those DMAbuf
>>>>>> methods, which are DMA-heaps in my design, the device from the queue
>>>>>> is not enough, a plane may requests another IOMMU device or table
>>>>>> for mapping.
>>>>>> Signed-off-by: Randy Li <ayaka@soulik.info>
>>>>>> ---
>>>>>> drivers/media/common/videobuf2/Kconfig        |   6 +
>>>>>> drivers/media/common/videobuf2/Makefile       |   1 +
>>>>>> .../common/videobuf2/videobuf2-dma-heap.c     | 350 +++++++++++++++++=
+
>>>>>> include/media/videobuf2-dma-heap.h            |  30 ++
>>>>>> 4 files changed, 387 insertions(+)
>>>>>> create mode 100644 drivers/media/common/videobuf2/videobuf2-dma-heap.=
c
>>>>>> create mode 100644 include/media/videobuf2-dma-heap.h
>>>>> First of all, thanks for the series.
>>>>> Possibly a stupid question, but why not just allocate the DMA-bufs
>>>>> directly from the DMA-buf heap device in the userspace and just import=

>>>>> the buffers to the V4L2 device using V4L2_MEMORY_DMABUF?
>>>> Sometimes the allocation policy could be very complex, let's suppose a
>>>> multiple planes pixel format enabling with frame buffer compression.
>>>> Its luma, chroma data could be allocated from a pool which is delegated=

>>>> for large buffers while its metadata would come from a pool which many
>>>> users could take some few slices from it(likes system pool).
>>>> Then when we have a new users knowing nothing about this platform, if w=
e
>>>> just configure the alloc_devs in each queues well. The user won't need
>>>> to know those complex rules.
>>>> The real situation could be more complex, Samsung MFC's left and right
>>>> banks could be regarded as two pools, many devices would benefit from
>>>> this either from the allocation times or the security buffers policy.
>>>> In our design, when we need to do some security decoding(DRM video),
>>>> codecs2 would allocate buffers from the pool delegated for that. While
>>>> the non-DRM video, users could not care about this.
>>> I'm a little bit surprised about this, because on Android all the
>>> graphics buffers are allocated from the system IAllocator and imported
>>> to the specific devices.
>> In the non-tunnel mode, yes it is. While the tunnel mode is completely ve=
ndor defined. Neither HWC nor codec2 cares about where the buffers coming fr=
om, you could do what ever you want.
>> Besides there are DRM video in GNU Linux platform, I heard the webkit has=
 made huge effort here and Playready is one could work in non-Android Linux.=

>>> Would it make sense to instead extend the UAPI to expose enough
>>> information about the allocation requirements to the userspace, so it
>>> can allocate correctly?
>> Yes, it could. But as I said it would need the users to do more works.
>>> My reasoning here is that it's not a driver's decision to allocate
>>> from a DMA-buf heap (and which one) or not. It's the userspace which
>>> knows that, based on the specific use case that it wants to fulfill.
>> Although I would like to let the users decide that, users just can=E2=80=99=
t do that which would violate the security rules in some platforms.
>> For example,  video codec and display device could only access a region o=
f memory, any other device or trusted apps can=E2=80=99t access it. Users ha=
ve to allocate the buffer from the pool the vendor decided.
>> So why not we offer a quick way that users don=E2=80=99t need to try and e=
rror.
>=20
> In principle, I'm not against integrating DMA-buf heap with vb2,
> however I see some problems I mentioned before:
>=20
> 1) How would the driver know if it should allocate from a DMA-buf heap or n=
ot?

struct vb2_queue.mem_ops

int (*queue_setup)(struct vb2_queue *q,unsigned int *num_buffers, unsigned i=
nt *num_planes, unsigned int sizes[], struct device *alloc_devs[]);

> 2) How would the driver know which heap to allocate from?

=46rom vb2_queue.alloc_devs

What I did now is likes what MFC does, create some mem_alloc_devs.
It would be better that we could retrieve the DMA-heaps=E2=80=99 devices fro=
m kernel, but that is not enough, we need a place to store the heap flags al=
though none of them are defined yet.

=46rom Android documents, I think it is unlikely we would have heap flags.
=E2=80=9CStandardization: The DMA-BUF heaps framework offers a well-defined U=
API. ION allowed custom flags and heap IDs that prevented developing a commo=
n testing framework because each device=E2=80=99s ION implementation could b=
ehave differently.=E2=80=9D

> 3) How would the heap know how to allocate properly for the device?
>=20
Because =E2=80=9Ceach DMA-BUF heap is a separate character device=E2=80=9D.
But as I said in the first draft I am not sure about the DMA mapping part. a=
lloc_devs responds for the heap, we have a device variable in the queue that=
 mapping function could access, but that may not be enough. A plane may appl=
y a different mapping policy or IOMMU here.

Would it be better that I create a interface here that creating a memdev wit=
h DMA-heap description ?=20

> Best regards,
> Tomasz

