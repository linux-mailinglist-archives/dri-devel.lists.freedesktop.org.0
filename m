Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9019F9855D7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 10:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8317010E157;
	Wed, 25 Sep 2024 08:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XFRRS58A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D1E10E157
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:51:20 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-378c16a4d3eso6943750f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727254279; x=1727859079; darn=lists.freedesktop.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mojjaxm5I00hF/MkRu8Kf9IIQevvYCVKxdrITGMHHVs=;
 b=XFRRS58ADTw9quJqxaU+MI+/NsX51UaDBe9bZUBeye06/nGRk4AURvhes5Lt1cdG1X
 xCm+EOt4RR9yiwzdtSTPCn8xYRNs5JOlMPCHRCdZWs7bHAeqZ2iWJWd1OXkmRgijgwa+
 eKnXxYQMzsmebV6RVf6MCWQV2/oznRM2bG/WrSXSGLu6khh5bFfFuHinC2OlJjSBRhm9
 4Ii87/dQL2JTvRRXCH6fzcKndpNL8OinfSkdv5BFFCElNVGnMmh4SdRsBCGgQ7n+CxwT
 kU2VMm97Sy06vMIGvbcE2IV+AFmPs5MVJXH06mJqb/n7uVg1duMJt8I4nwskCo1jZI/D
 TszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727254279; x=1727859079;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Mojjaxm5I00hF/MkRu8Kf9IIQevvYCVKxdrITGMHHVs=;
 b=HB2jr9pK6ed9g4I8fPiAJx89E3cpkkTzQn45Xt+JkILhepif6R0uiqsEu2xKcD+jTl
 ixK+D2LwrGBLhA5xN4kJa6eYlBlhXdYeJk+iIKhsRaN/gq6OIHx2pYsmRW4uQd+C3O0Q
 MtITOnrRkWPsSnRjnZrYDtXprv+uqBw4ZB9ZdwGuyMrmIZqWpVIr1aWgnK5H8afRYia7
 xJEKi0cahsY8dWBvoxy0zEDbay+g1MzvpTohUkgdEsyGApGVI96Dofpkwdj9cTRad4EX
 cm86Wn/Whe2GV71Q3GYJk4VotsBqgL5D9/+7G4/uzwWmtgA77plRWDdCq4FE79b+6oLt
 nbhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTbCQOhE3pyXxVa4KRAddr71/puYOGxd66/BBqQRsiSDW7uHtjwDxLlshb7qZ94rhgKctaZjhdGyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOsiCrt1IzAoyp2YaLmRESr/seNHwQKwxg0CEcoDgco7yPoEI/
 xz3g56tmh2BFgtcfHhrKcpLOfu8pWceL7suODPi5i/tt0Yr9j/PGNYgH3K3Z
X-Google-Smtp-Source: AGHT+IG7GOZBb4Ut21z96olkxM/rZzjpi8CelvCwaAZ7ANOvfK7oNdCkL8Tpv6EZSI+XMkZ+WxtJyQ==
X-Received: by 2002:adf:fd05:0:b0:374:bec7:8f with SMTP id
 ffacd0b85a97d-37cc2478ea8mr1630826f8f.28.1727254278777; 
 Wed, 25 Sep 2024 01:51:18 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc31f687sm3381217f8f.109.2024.09.25.01.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 01:51:18 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------d3WAoox0IOKAvtt2lKoPYCPZ"
Message-ID: <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
Date: Wed, 25 Sep 2024 10:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrew Davis <afd@ti.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
 <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------d3WAoox0IOKAvtt2lKoPYCPZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
> On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
>> On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
>>> Hi,
>>>
>>> On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
>>>> Hi,
>>>>
>>>> This patch set is based on top of Yong Wu's restricted heap patch set [1].
>>>> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
>>>>
>>>> The Linaro restricted heap uses genalloc in the kernel to manage the heap
>>>> carvout. This is a difference from the Mediatek restricted heap which
>>>> relies on the secure world to manage the carveout.
>>>>
>>>> I've tried to adress the comments on [2], but [1] introduces changes so I'm
>>>> afraid I've had to skip some comments.
>>> I know I have raised the same question during LPC (in connection to
>>> Qualcomm's dma-heap implementation). Is there any reason why we are
>>> using generic heaps instead of allocating the dma-bufs on the device
>>> side?
>>>
>>> In your case you already have TEE device, you can use it to allocate and
>>> export dma-bufs, which then get imported by the V4L and DRM drivers.
>>>
>> This goes to the heart of why we have dma-heaps in the first place.
>> We don't want to burden userspace with having to figure out the right
>> place to get a dma-buf for a given use-case on a given hardware.
>> That would be very non-portable, and fail at the core purpose of
>> a kernel: to abstract hardware specifics away.
> Unfortunately all proposals to use dma-buf heaps were moving in the
> described direction: let app select (somehow) from a platform- and
> vendor- specific list of dma-buf heaps. In the kernel we at least know
> the platform on which the system is running. Userspace generally doesn't
> (and shouldn't). As such, it seems better to me to keep the knowledge in
> the kernel and allow userspace do its job by calling into existing
> device drivers.

The idea of letting the kernel fully abstract away the complexity of 
inter device data exchange is a completely failed design. There has been 
plenty of evidence for that over the years.

Because of this in DMA-buf it's an intentional design decision that 
userspace and *not* the kernel decides where and what to allocate from.

What the kernel should provide are the necessary information what type 
of memory a device can work with and if certain memory is accessible or 
not. This is the part which is unfortunately still not well defined nor 
implemented at the moment.

Apart from that there are a whole bunch of intentional design decision 
which should prevent developers to move allocation decision inside the 
kernel. For example DMA-buf doesn't know what the content of the buffer 
is (except for it's total size) and which use cases a buffer will be 
used with.

So the question if memory should be exposed through DMA-heaps or a 
driver specific allocator is not a question of abstraction, but rather 
one of the physical location and accessibility of the memory.

If the memory is attached to any physical device, e.g. local memory on a 
dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the 
memory as device specific allocator.

If the memory is not physically attached to any device, but rather just 
memory attached to the CPU or a system wide memory controller then 
expose the memory as DMA-heap with specific requirements (e.g. certain 
sized pages, contiguous, restricted, encrypted, ...).

>> Worse, the actual interface for dma-buf exporting changes from
>> framework to framework (getting a dma-buf from DRM is different
>> than V4L, and there would be yet another API for TEE, etc..)
> But if the app is working with the particular subsystem, then it already
> talks its language. Allocating a dma-buf is just another part of the
> interface, which the app already has to support.

Correct, yes.

>> Most subsystem don't need an allocator, they work just fine
>> simply being only dma-bufs importers. Recent example being the
>> IIO subsystem[0], for which some early posting included an
>> allocator, but in the end, all that was needed was to consume
>> buffers.
>>
>> For devices that don't actually contain memory there is no
>> reason to be an exporter. What most want is just to consume
>> normal system memory. Or system memory with some constraints
>> (e.g. contiguous, coherent, restricted, etc..).
> ... secure, accessible only to the camera and video encoder, ... or
> accessible only to the video decoder and the display unit. Who specifies
> those restrictions? Can we express them in a platform-neutral way?

I once create a prototype for letting kernel drivers expose hints to 
which DMA-heap they want to work with.

The problem is that there are tons of different use cases and you need 
to use specific allocations for specific use cases.

>>> I have a feeling (I might be completely wrong here) that by using
>>> generic dma-buf heaps we can easily end up in a situation when the
>>> userspace depends heavily on the actual platform being used (to map the
>>> platform to heap names). I think we should instead depend on the
>>> existing devices (e.g. if there is a TEE device, use an IOCTL to
>>> allocate secured DMA BUF from it, otherwise check for QTEE device,
>>> otherwise check for some other vendor device).
>>>
>>> The mental experiment to check if the API is correct is really simple:
>>> Can you use exactly the same rootfs on several devices without
>>> any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
>>> laptop, etc)?
>>>
>> This is a great north star to follow. And exactly the reason we should
>> *not* be exposing device specific constraints to userspace. The constrains
>> change based on the platform. So a userspace would have to also pick
>> a different set of constraints based on each platform.
> Great, I totally agree here.

That sounds reasonable, but depends on the restriction.

For example a lot of GPUs can work with any imported memory as long as 
it is DMA accessible for them, but they can scanout a picture to display 
on a monitor only from their local memory.

>> Userspace knows which subsystems it will attach a buffer, and the
>> kernel knows what constraints those devices have on a given platform.
>> Ideal case is then allocate from the one exporter, attach to various
>> devices, and have the constraints solved at map time by the exporter
>> based on the set of attached devices.

That approach doesn't work. We have already tried stuff like that 
multiple times.

>>
>> For example, on one platform the display needs contiguous buffers,
>> but on a different platform the display can scatter-gather. So
>> what heap should our generic application allocate from when it
>> wants a buffer consumable by the display, CMA or System?
>> Answer *should* be always use the generic exporter, and that
>> exporter then picks the right backing type based on the platform.
> The display can support scather-gather, the GPU needs bigger stride for
> this particular format and the video encoder decoder can not support SG.
> Which set of constraints and which buffer size should generic exporter
> select?

Yeah, exactly that's the problem. The kernel doesn't know all the 
necessary information to make an informed allocation decision.

Sometimes you even have to insert format conversation steps and doing 
that transparently for userspace inside the kernel is really a no-go 
from the design side.

>> Userspace shouldn't be dealing with any of these constraints
>> (looking back, adding the CMA heap was probably incorrect,
>> and the System heap should have been the only one. Idea back
>> then was a userspace helper would show up to do the constraint
>> solving and pick the right heap. That has yet to materialize and
>> folks are still just hardcoding which heap to use..).
>>
>> Same for this restricted heap, I'd like to explore if we can
>> enhance the System heap such that when attached to the TEE framework,
>> the backing memory is either made restricted by fire-walling,
>> or allocating from a TEE carveout (based on platform).

Clearly NAK from my side to that design.

Regards,
Christian.

> Firewalling from which devices? Or rather allowing access from which
> devices? Is it possible to specify that somehow?
>
>> This will mean more inter-subsystem coordination, but we can
>> iterate on these in kernel interfaces. We cannot iterate on
>> userspace interfaces, those have to be correct the first time.
>>
>> Andrew
>>
>> [0]https://www.kernel.org/doc/html/next/iio/iio_dmabuf_api.html
>>
>>>> This can be tested on QEMU with the following steps:
>>>> repo init -uhttps://github.com/jenswi-linaro/manifest.git  -m qemu_v8.xml \
>>>>           -b prototype/sdp-v1
>>>> repo sync -j8
>>>> cd build
>>>> make toolchains -j4
>>>> make all -j$(nproc)
>>>> make run-only
>>>> # login and at the prompt:
>>>> xtest --sdp-basic
>>>>
>>>> https://optee.readthedocs.io/en/latest/building/prerequisites.html
>>>> list dependencies needed to build the above.
>>>>
>>>> The tests are pretty basic, mostly checking that a Trusted Application in
>>>> the secure world can access and manipulate the memory.
>>> - Can we test that the system doesn't crash badly if user provides
>>>     non-secured memory to the users which expect a secure buffer?
>>>
>>> - At the same time corresponding entities shouldn't decode data to the
>>>     buffers accessible to the rest of the sytem.
>>>
>>>> Cheers,
>>>> Jens
>>>>
>>>> [1]https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
>>>> [2]https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
>>>>
>>>> Changes since Olivier's post [2]:
>>>> * Based on Yong Wu's post [1] where much of dma-buf handling is done in
>>>>     the generic restricted heap
>>>> * Simplifications and cleanup
>>>> * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
>>>>     support"
>>>> * Replaced the word "secure" with "restricted" where applicable
>>>>
>>>> Etienne Carriere (1):
>>>>     tee: new ioctl to a register tee_shm from a dmabuf file descriptor
>>>>
>>>> Jens Wiklander (2):
>>>>     dma-buf: heaps: restricted_heap: add no_map attribute
>>>>     dma-buf: heaps: add Linaro restricted dmabuf heap support
>>>>
>>>> Olivier Masse (1):
>>>>     dt-bindings: reserved-memory: add linaro,restricted-heap
>>>>
>>>>    .../linaro,restricted-heap.yaml               |  56 ++++++
>>>>    drivers/dma-buf/heaps/Kconfig                 |  10 ++
>>>>    drivers/dma-buf/heaps/Makefile                |   1 +
>>>>    drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
>>>>    drivers/dma-buf/heaps/restricted_heap.h       |   2 +
>>>>    .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
>>>>    drivers/tee/tee_core.c                        |  38 ++++
>>>>    drivers/tee/tee_shm.c                         | 104 ++++++++++-
>>>>    include/linux/tee_drv.h                       |  11 ++
>>>>    include/uapi/linux/tee.h                      |  29 +++
>>>>    10 files changed, 426 insertions(+), 7 deletions(-)
>>>>    create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
>>>>    create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
>>>>
>>>> -- 
>>>> 2.34.1
>>>>

--------------d3WAoox0IOKAvtt2lKoPYCPZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:<br>
    <blockquote type="cite"
cite="mid:mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge">
      <pre class="moz-quote-pre" wrap="">On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi,

On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi,

This patch set is based on top of Yong Wu's restricted heap patch set [1].
It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].

The Linaro restricted heap uses genalloc in the kernel to manage the heap
carvout. This is a difference from the Mediatek restricted heap which
relies on the secure world to manage the carveout.

I've tried to adress the comments on [2], but [1] introduces changes so I'm
afraid I've had to skip some comments.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I know I have raised the same question during LPC (in connection to
Qualcomm's dma-heap implementation). Is there any reason why we are
using generic heaps instead of allocating the dma-bufs on the device
side?

In your case you already have TEE device, you can use it to allocate and
export dma-bufs, which then get imported by the V4L and DRM drivers.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This goes to the heart of why we have dma-heaps in the first place.
We don't want to burden userspace with having to figure out the right
place to get a dma-buf for a given use-case on a given hardware.
That would be very non-portable, and fail at the core purpose of
a kernel: to abstract hardware specifics away.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Unfortunately all proposals to use dma-buf heaps were moving in the
described direction: let app select (somehow) from a platform- and
vendor- specific list of dma-buf heaps. In the kernel we at least know
the platform on which the system is running. Userspace generally doesn't
(and shouldn't). As such, it seems better to me to keep the knowledge in
the kernel and allow userspace do its job by calling into existing
device drivers.</pre>
    </blockquote>
    <br>
    The idea of letting the kernel fully abstract away the complexity of
    inter device data exchange is a completely failed design. There has
    been plenty of evidence for that over the years.<br>
    <br>
    Because of this in DMA-buf it's an intentional design decision that
    userspace and *not* the kernel decides where and what to allocate
    from.<br>
    <br>
    What the kernel should provide are the necessary information what
    type of memory a device can work with and if certain memory is
    accessible or not. This is the part which is unfortunately still not
    well defined nor implemented at the moment.<br>
    <br>
    Apart from that there are a whole bunch of intentional design
    decision which should prevent developers to move allocation decision
    inside the kernel. For example DMA-buf doesn't know what the content
    of the buffer is (except for it's total size) and which use cases a
    buffer will be used with.<br>
    <br>
    So the question if memory should be exposed through DMA-heaps or a
    driver specific allocator is not a question of abstraction, but
    rather one of the physical location and accessibility of the memory.<br>
    <br>
    If the memory is attached to any physical device, e.g. local memory
    on a dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then
    expose the memory as device specific allocator.<br>
    <br>
    If the memory is not physically attached to any device, but rather
    just memory attached to the CPU or a system wide memory controller
    then expose the memory as DMA-heap with specific requirements (e.g.
    certain sized pages, contiguous, restricted, encrypted, ...).<br>
    <br>
    <blockquote type="cite"
cite="mid:mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Worse, the actual interface for dma-buf exporting changes from
framework to framework (getting a dma-buf from DRM is different
than V4L, and there would be yet another API for TEE, etc..)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But if the app is working with the particular subsystem, then it already
talks its language. Allocating a dma-buf is just another part of the
interface, which the app already has to support.</pre>
    </blockquote>
    <br>
    Correct, yes.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
cite="mid:mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Most subsystem don't need an allocator, they work just fine
simply being only dma-bufs importers. Recent example being the
IIO subsystem[0], for which some early posting included an
allocator, but in the end, all that was needed was to consume
buffers.

For devices that don't actually contain memory there is no
reason to be an exporter. What most want is just to consume
normal system memory. Or system memory with some constraints
(e.g. contiguous, coherent, restricted, etc..).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... secure, accessible only to the camera and video encoder, ... or
accessible only to the video decoder and the display unit. Who specifies
those restrictions? Can we express them in a platform-neutral way?</pre>
    </blockquote>
    <br>
    I once create a prototype for letting kernel drivers expose hints to
    which DMA-heap they want to work with.<br>
    <br>
    The problem is that there are tons of different use cases and you
    need to use specific allocations for specific use cases.<br>
    <br>
    <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
cite="mid:mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I have a feeling (I might be completely wrong here) that by using
generic dma-buf heaps we can easily end up in a situation when the
userspace depends heavily on the actual platform being used (to map the
platform to heap names). I think we should instead depend on the
existing devices (e.g. if there is a TEE device, use an IOCTL to
allocate secured DMA BUF from it, otherwise check for QTEE device,
otherwise check for some other vendor device).

The mental experiment to check if the API is correct is really simple:
Can you use exactly the same rootfs on several devices without
any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
laptop, etc)?

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This is a great north star to follow. And exactly the reason we should
*not* be exposing device specific constraints to userspace. The constrains
change based on the platform. So a userspace would have to also pick
a different set of constraints based on each platform.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Great, I totally agree here.</pre>
    </blockquote>
    <br>
    That sounds reasonable, but depends on the restriction.<br>
    <br>
    For example a lot of GPUs can work with any imported memory as long
    as it is DMA accessible for them, but they can scanout a picture to
    display on a monitor only from their local memory.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
cite="mid:mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Userspace knows which subsystems it will attach a buffer, and the
kernel knows what constraints those devices have on a given platform.
Ideal case is then allocate from the one exporter, attach to various
devices, and have the constraints solved at map time by the exporter
based on the set of attached devices.</pre>
      </blockquote>
    </blockquote>
    <br>
    That approach doesn't work. We have already tried stuff like that
    multiple times.<br>
    <br>
    <blockquote type="cite"
cite="mid:mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

For example, on one platform the display needs contiguous buffers,
but on a different platform the display can scatter-gather. So
what heap should our generic application allocate from when it
wants a buffer consumable by the display, CMA or System?
Answer *should* be always use the generic exporter, and that
exporter then picks the right backing type based on the platform.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The display can support scather-gather, the GPU needs bigger stride for
this particular format and the video encoder decoder can not support SG.
Which set of constraints and which buffer size should generic exporter
select?</pre>
    </blockquote>
    <br>
    Yeah, exactly that's the problem. The kernel doesn't know all the
    necessary information to make an informed allocation decision.<br>
    <br>
    Sometimes you even have to insert format conversation steps and
    doing that transparently for userspace inside the kernel is really a
    no-go from the design side.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
cite="mid:mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Userspace shouldn't be dealing with any of these constraints
(looking back, adding the CMA heap was probably incorrect,
and the System heap should have been the only one. Idea back
then was a userspace helper would show up to do the constraint
solving and pick the right heap. That has yet to materialize and
folks are still just hardcoding which heap to use..).

Same for this restricted heap, I'd like to explore if we can
enhance the System heap such that when attached to the TEE framework,
the backing memory is either made restricted by fire-walling,
or allocating from a TEE carveout (based on platform).</pre>
      </blockquote>
    </blockquote>
    <br>
    Clearly NAK from my side to that design.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Firewalling from which devices? Or rather allowing access from which
devices? Is it possible to specify that somehow?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This will mean more inter-subsystem coordination, but we can
iterate on these in kernel interfaces. We cannot iterate on
userspace interfaces, those have to be correct the first time.

Andrew

[0] <a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/next/iio/iio_dmabuf_api.html">https://www.kernel.org/doc/html/next/iio/iio_dmabuf_api.html</a>

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
This can be tested on QEMU with the following steps:
repo init -u <a class="moz-txt-link-freetext" href="https://github.com/jenswi-linaro/manifest.git">https://github.com/jenswi-linaro/manifest.git</a> -m qemu_v8.xml \
         -b prototype/sdp-v1
repo sync -j8
cd build
make toolchains -j4
make all -j$(nproc)
make run-only
# login and at the prompt:
xtest --sdp-basic

<a class="moz-txt-link-freetext" href="https://optee.readthedocs.io/en/latest/building/prerequisites.html">https://optee.readthedocs.io/en/latest/building/prerequisites.html</a>
list dependencies needed to build the above.

The tests are pretty basic, mostly checking that a Trusted Application in
the secure world can access and manipulate the memory.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
- Can we test that the system doesn't crash badly if user provides
   non-secured memory to the users which expect a secure buffer?

- At the same time corresponding entities shouldn't decode data to the
   buffers accessible to the rest of the sytem.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Cheers,
Jens

[1] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/">https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/</a>
[2] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/">https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/</a>

Changes since Olivier's post [2]:
* Based on Yong Wu's post [1] where much of dma-buf handling is done in
   the generic restricted heap
* Simplifications and cleanup
* New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
   support"
* Replaced the word "secure" with "restricted" where applicable

Etienne Carriere (1):
   tee: new ioctl to a register tee_shm from a dmabuf file descriptor

Jens Wiklander (2):
   dma-buf: heaps: restricted_heap: add no_map attribute
   dma-buf: heaps: add Linaro restricted dmabuf heap support

Olivier Masse (1):
   dt-bindings: reserved-memory: add linaro,restricted-heap

  .../linaro,restricted-heap.yaml               |  56 ++++++
  drivers/dma-buf/heaps/Kconfig                 |  10 ++
  drivers/dma-buf/heaps/Makefile                |   1 +
  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
  drivers/tee/tee_core.c                        |  38 ++++
  drivers/tee/tee_shm.c                         | 104 ++++++++++-
  include/linux/tee_drv.h                       |  11 ++
  include/uapi/linux/tee.h                      |  29 +++
  10 files changed, 426 insertions(+), 7 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c

-- 
2.34.1

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------d3WAoox0IOKAvtt2lKoPYCPZ--
