Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C54587C2C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 14:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594788E7A1;
	Tue,  2 Aug 2022 12:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343108DAE0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 12:17:22 +0000 (UTC)
Received: from [192.168.10.77] (unknown [140.207.23.88])
 by kozue.soulik.info (Postfix) with ESMTPSA id 83DF5100DB3;
 Tue,  2 Aug 2022 21:11:04 +0900 (JST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-62FF0608-D7AC-4BEA-92D0-19895551D34C
Content-Transfer-Encoding: 7bit
From: ayaka <ayaka@soulik.info>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] [Draft]: media: videobuf2-dma-heap: add a vendor defined
 memory runtine
Date: Tue, 2 Aug 2022 20:16:58 +0800
Message-Id: <627050DE-3436-40D4-99B9-FAE24DB60C85@soulik.info>
References: <CAAFQd5AL=OejdaubnYDRF4M1EKyStZP_FAMPz4CJ=KCa_8QjaA@mail.gmail.com>
In-Reply-To: <CAAFQd5AL=OejdaubnYDRF4M1EKyStZP_FAMPz4CJ=KCa_8QjaA@mail.gmail.com>
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


--Apple-Mail-62FF0608-D7AC-4BEA-92D0-19895551D34C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



Sent from my iPad

> On Aug 2, 2022, at 3:33 PM, Tomasz Figa <tfiga@chromium.org> wrote:
>=20
> =EF=BB=BFOn Mon, Aug 1, 2022 at 8:43 PM ayaka <ayaka@soulik.info> wrote:
>>=20
>>=20
>>=20
>> Sent from my iPad
>>=20
>>>> On Aug 1, 2022, at 5:46 PM, Tomasz Figa <tfiga@chromium.org> wrote:
>>>=20
>>> =EF=BB=BFCAUTION: Email originated externally, do not click links or ope=
n attachments unless you recognize the sender and know the content is safe.
>>>=20
>>>=20
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
>>>=20
>>> I'm a little bit surprised about this, because on Android all the
>>> graphics buffers are allocated from the system IAllocator and imported
>>> to the specific devices.
>> In the non-tunnel mode, yes it is. While the tunnel mode is completely ve=
ndor defined. Neither HWC nor codec2 cares about where the buffers coming fr=
om, you could do what ever you want.
>>=20
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
>>=20
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

--Apple-Mail-62FF0608-D7AC-4BEA-92D0-19895551D34C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><br><div dir=3D"ltr">Sent from my iPad<=
/div><div dir=3D"ltr"><br><blockquote type=3D"cite">On Aug 2, 2022, at 3:33 P=
M, Tomasz Figa &lt;tfiga@chromium.org&gt; wrote:<br><br></blockquote></div><=
blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Mon, Aug 1, 2022=
 at 8:43 PM ayaka &lt;ayaka@soulik.info&gt; wrote:</span><br><blockquote typ=
e=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span></s=
pan><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote=
><blockquote type=3D"cite"><span>Sent from my iPad</span><br></blockquote><b=
lockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>On Aug 1, 2022, at 5:46 PM, Tomasz Figa &=
lt;tfiga@chromium.org&gt; wrote:</span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=EF=BB=
=BFCAUTION: Email originated externally, do not click links or open attachme=
nts unless you recognize the sender and know the content is safe.</span><br>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>On Mo=
n, Aug 1, 2022 at 3:44 PM Hsia-Jun Li &lt;Randy.Li@synaptics.com&gt; wrote:<=
/span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span>On 8/1/22 14:19, Tomasz Figa wrote:</span><br></blockquote></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>Hello Tomasz</span><br></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>?Hi Randy,</span><b=
r></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>On Mon, Aug 1, 2022 at 5:21 AM &lt;ayaka@soulik.info&gt; wrote:<=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>From: Randy Li &lt;ayaka@soulik=
.info&gt;</span><br></blockquote></blockquote></blockquote></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>This mo=
dule is still at a early stage, I wrote this for showing what</span><br></bl=
ockquote></blockquote></blockquote></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>APIs we need here.</span><br></=
blockquote></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>Let me explain why we need su=
ch a module here.</span><br></blockquote></blockquote></blockquote></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>If you won't allocate buffers from a V4L2 M2M device, this module</span><br=
></blockquote></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>may not be very useful. I a=
m sure the most of users won't know a</span><br></blockquote></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>device would require them allocate buffers from a DMA-H=
eap then</span><br></blockquote></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>import t=
hose buffers into a V4L2's queue.</span><br></blockquote></blockquote></bloc=
kquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>Then the question goes back to why DMA-Heap. =46rom the Android=
's</span><br></blockquote></blockquote></blockquote></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>description, w=
e know it is about the copyright's DRM.</span><br></blockquote></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>When we allocate a buffer in a DMA-Heap, it may regis=
ter that buffer</span><br></blockquote></blockquote></blockquote></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>i=
n the trusted execution environment so the firmware which is running</span><=
br></blockquote></blockquote></blockquote></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>or could only be acccese=
d from there could use that buffer later.</span><br></blockquote></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>The answer above leads to another thing which is no=
t done in this</span><br></blockquote></blockquote></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>ve=
rsion, the DMA mapping. Although in some platforms, a DMA-Heap</span><br></b=
lockquote></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>responses a IOMMU device as wel=
l. For the genernal purpose, we would</span><br></blockquote></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>be better assuming the device mapping should be done fo=
r each device</span><br></blockquote></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>its=
elf. The problem here we only know alloc_devs in those DMAbuf</span><br></bl=
ockquote></blockquote></blockquote></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>methods, which are DMA-heaps in=
 my design, the device from the queue</span><br></blockquote></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>is not enough, a plane may requests another IOMMU devic=
e or table</span><br></blockquote></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>for ma=
pping.</span><br></blockquote></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Signed-off-=
by: Randy Li &lt;ayaka@soulik.info&gt;</span><br></blockquote></blockquote><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>---</span><br></blockquote></blockquote></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>drivers/media/common/videobuf2/Kconfig &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;| &nbsp;&nbsp;6 +</span><br></blockquote></blockquote></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>drivers/media/common/videobuf2/Makefile &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;| &nbsp;&nbsp;1 +</span><br></blockquote></blockquote></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>.../common/videobuf2/videobuf2-dma-heap.c &nbsp;&nbsp;&nbsp;&nb=
sp;| 350 ++++++++++++++++++</span><br></blockquote></blockquote></blockquote=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>include/media/videobuf2-dma-heap.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;30 ++</span><br></blockquote></b=
lockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>4 files changed, 387 insertions(+)</span><b=
r></blockquote></blockquote></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>create mode 100644 driver=
s/media/common/videobuf2/videobuf2-dma-heap.c</span><br></blockquote></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>create mode 100644 include/media/videobuf2-dma-=
heap.h</span><br></blockquote></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>First of all, thanks for the series.<=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>Possibly a stupid question, but why not just allocate the=
 DMA-bufs</span><br></blockquote></blockquote></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>directly from the DMA-buf heap device in the u=
serspace and just import</span><br></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>the buffers to the V4L2 device u=
sing V4L2_MEMORY_DMABUF?</span><br></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>Sometimes the allocation policy could be very complex, le=
t's suppose a</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>multi=
ple planes pixel format enabling with frame buffer compression.</span><br></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>Its luma, chroma data could be a=
llocated from a pool which is delegated</span><br></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>for large buffers while its metadata would come from a p=
ool which many</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>users=
 could take some few slices from it(likes system pool).</span><br></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>Then when we have a new users knowing n=
othing about this platform, if we</span><br></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>just configure the alloc_devs in each queues well. The user won=
't need</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>to know tho=
se complex rules.</span><br></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>T=
he real situation could be more complex, Samsung MFC's left and right</span>=
<br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>banks could be regarded a=
s two pools, many devices would benefit from</span><br></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>this either from the allocation times or the secur=
ity buffers policy.</span><br></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>In our design, when we need to do some security decoding(DRM video),</span>=
<br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>codecs2 would allocate bu=
ffers from the pool delegated for that. While</span><br></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>the non-DRM video, users could not care about thi=
s.</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>I'm a little bit surpri=
sed about this, because on Android all the</span><br></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><span>graphics buffer=
s are allocated from the system IAllocator and imported</span><br></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>to=
 the specific devices.</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><span>In the non-tunnel mode, yes it is. While the tunnel mode is com=
pletely vendor defined. Neither HWC nor codec2 cares about where the buffers=
 coming from, you could do what ever you want.</span><br></blockquote><block=
quote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite">=
<span>Besides there are DRM video in GNU Linux platform, I heard the webkit h=
as made huge effort here and Playready is one could work in non-Android Linu=
x.</span><br></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>Would it make sense to instead extend the UAPI to expose enough</spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>information about the allocation requirements to the userspace,=
 so it</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>can allocate correctly?</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><span>Yes, it could. But as I said it wou=
ld need the users to do more works.</span><br></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>My reasoning here is that it's not a d=
river's decision to allocate</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>from a DMA-buf heap (and whic=
h one) or not. It's the userspace which</span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>knows that, based o=
n the specific use case that it wants to fulfill.</span><br></blockquote></b=
lockquote><blockquote type=3D"cite"><span>Although I would like to let the u=
sers decide that, users just can=E2=80=99t do that which would violate the s=
ecurity rules in some platforms.</span><br></blockquote><blockquote type=3D"=
cite"><span>For example, &nbsp;video codec and display device could only acc=
ess a region of memory, any other device or trusted apps can=E2=80=99t acces=
s it. Users have to allocate the buffer from the pool the vendor decided.</s=
pan><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote=
><blockquote type=3D"cite"><span>So why not we offer a quick way that users d=
on=E2=80=99t need to try and error.</span><br></blockquote><span></span><br>=
<span>In principle, I'm not against integrating DMA-buf heap with vb2,</span=
><br><span>however I see some problems I mentioned before:</span><br><span><=
/span><br><span>1) How would the driver know if it should allocate from a DM=
A-buf heap or not?</span></div></blockquote>struct vb2_queue.mem_ops<div><sp=
an style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><br></span></di=
v><div><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">int (=
*queue_setup)(struct vb2_queue *q,unsigned int *num_buffers, unsigned int *n=
um_planes, unsigned int sizes[], struct device *alloc_devs[]);</span></div><=
div><font color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0);"><br><=
/span></font><div><blockquote type=3D"cite"><div dir=3D"ltr"><span>2) How wo=
uld the driver know which heap to allocate from?</span><br></div></blockquot=
e><div>=46rom vb2_queue.alloc_devs</div><div><br></div><div>What I did now i=
s likes what MFC does, create some mem_alloc_devs.</div><div>It would be bet=
ter that we could retrieve the DMA-heaps=E2=80=99 devices from kernel, but t=
hat is not enough, we need a place to store the heap flags although none of t=
hem are defined yet.</div><div><br></div><div>=46rom Android documents, I th=
ink it is unlikely we would have heap flags.</div><div>=E2=80=9CStandardizat=
ion: The DMA-BUF heaps framework offers a well-defined UAPI. ION allowed cus=
tom flags and heap IDs that prevented developing a common testing framework b=
ecause each device=E2=80=99s ION implementation could behave differently.=E2=
=80=9D</div><div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span>3) How=
 would the heap know how to allocate properly for the device?</span><br><spa=
n></span><br></div></blockquote>Because =E2=80=9Ceach DMA-BUF heap is a sepa=
rate character device=E2=80=9D.</div><div>But as I said in the first draft I=
 am not sure about the DMA mapping part. alloc_devs responds for the heap, w=
e have a device variable in the queue that mapping function could access, bu=
t that may not be enough. A plane may apply a different mapping policy or IO=
MMU here.</div><div><br></div><div>Would it be better that I create a interf=
ace here that creating a memdev with DMA-heap description ?&nbsp;<br><blockq=
uote type=3D"cite"><div dir=3D"ltr"><span>Best regards,</span><br><span>Toma=
sz</span><br></div></blockquote></div></div></div></body></html>=

--Apple-Mail-62FF0608-D7AC-4BEA-92D0-19895551D34C--
