Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D69619840
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A395010E7D1;
	Fri,  4 Nov 2022 13:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0205310E7D1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:38:41 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id z30so3003694qkz.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Pdwvn5a6hNc87DO76EwjKCkrFa8eSjbI4KOhkL0Kjvc=;
 b=3llLCVRfptr0RrrYTy+3tUQKBIuC++7co2Cc8rPgcQ/JeMhm4duWiD8WLd9bO83ySx
 Ad+Vm457CzWPS3HJ6ASoM19iNm/LY+xD6SkkJ4s3rwL572MS5PrK8YsGESjouXu0STqH
 4AT65vCpfi6FVElxpbzjzkHvGcOr/hdF6NxMZ6coBZ8h60UEJRfZ/WmnFfxT1zjUF1rI
 37tGK3gXKw5ZgKWSEhYVIqSDQPV5rjgpXUyN9rQkgFV0+Q8gCDL/7vbLFFoHLGGEOr3o
 PUwvv23dzeMBaHHk6AUAmCtK/MqwAgSgrs0uXLNgupkfWZtcaPBvi0ApE0IiByK8bp8w
 YGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pdwvn5a6hNc87DO76EwjKCkrFa8eSjbI4KOhkL0Kjvc=;
 b=FV5EuM8ukqP7hHKyfPvOL9GteDzdbLkOY1cGDiBYgKexLE5Ovs3T18qwhbYeHxWTrm
 osn+YAs6EYGVQBUL2BB63KMfzbe8XEatPUemfsNjZGfoVP7S6BLmKVCMJyccDzxGDdmy
 lK3elUamVkliNbSrEXRwU8I1ctAr232oRaiFqQCHYZs3i+7d/7++EjELwnTeBYNX/cTN
 2Un87RthQt1yEtjkAYI2Nr7JwwazkJtnKZlxCWYh+iypSL3GWpymuEzqDWwTJy5Khggp
 5uOKhhTR9Yp1hwzFLMFzG6PtWPvMZNeobsOxjeY+s2r71qrf5HaiJSgxScAvBzMscEiG
 bDEw==
X-Gm-Message-State: ACrzQf1M1fGS5fLHkJKBrX2PkB6BB2K5bqpsXHneaalP0VGxQvwECgxk
 1qzmzW7uyUe1NTZYgEoiv0/LOA==
X-Google-Smtp-Source: AMsMyM5mCuTP5LW2faKmynlIaGpNmXBFkbf5r1IwWOBPXV0P4baay38suUbPppIoj+jvo1JDnBoj4Q==
X-Received: by 2002:a05:620a:2994:b0:6fa:65d7:30c5 with SMTP id
 r20-20020a05620a299400b006fa65d730c5mr9592730qkp.753.1667569121013; 
 Fri, 04 Nov 2022 06:38:41 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 bq37-20020a05620a46a500b006ee77f1ecc3sm3011463qkb.31.2022.11.04.06.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:38:40 -0700 (PDT)
Message-ID: <434299935e7ed9a7a02e4e358cd044e54145582e.camel@ndufresne.ca>
Subject: Re: Try to address the DMA-buf coherency problem
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Daniel Stone <daniel@fooishbar.org>
Date: Fri, 04 Nov 2022 09:38:38 -0400
In-Reply-To: <441e7155-2fa3-e34f-1bf6-706a0e5698d8@gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <90a1fb6101483971ef14d22370aac50d494a4752.camel@ndufresne.ca>
 <441e7155-2fa3-e34f-1bf6-706a0e5698d8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
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
Cc: ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le vendredi 04 novembre 2022 =C3=A0 10:03 +0100, Christian K=C3=B6nig a =C3=
=A9crit=C2=A0:
> Am 03.11.22 um 23:16 schrieb Nicolas Dufresne:
> > [SNIP]
> >=20
> > Was there APIs suggested to actually make it manageable by userland to =
allocate
> > from the GPU? Yes, this what Linux Device Allocator idea is for. Is tha=
t API
> > ready, no.
>=20
> Well, that stuff is absolutely ready:=20
> https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/heaps/syst=
em_heap.c#L175=20
> What do you think I'm talking about all the time?

I'm aware of DMA Heap, still have few gaps, but this unrelated to coherency=
 (we
can discuss offline, with Daniel S.). For DMABuf Heap, its used in many for=
ks by
vendors in production. There is an upstream proposal for GStreamer, but rev=
iew
comments were never addressed, in short, its stalled, and it waiting for a
volunteer. It might also be based on very old implementation of DMABuf Heap=
,
needs to be verified in depth for sure as the time have passed.

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1391

>=20
> DMA-buf has a lengthy section about CPU access to buffers and clearly=20
> documents how all of that is supposed to work:=20
> https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-buf.c#=
L1160=20
> This includes braketing of CPU access with dma_buf_begin_cpu_access()=20
> and dma_buf_end_cpu_access(), as well as transaction management between=
=20
> devices and the CPU and even implicit synchronization.
>=20
> This specification is then implemented by the different drivers=20
> including V4L2:=20
> https://elixir.bootlin.com/linux/latest/source/drivers/media/common/video=
buf2/videobuf2-dma-sg.c#L473
>=20
> As well as the different DRM drivers:=20
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/gem/i=
915_gem_dmabuf.c#L117=20
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu=
/amdgpu_dma_buf.c#L234

I know, I've implement the userspace bracketing for this in GStreamer [1] b=
efore
DMAbuf Heap was merged and was one of the reporter for the missing bracketi=
ng in
VB2. Was tested against i915 driver. Note, this is just a fallback, the
performance is terrible, memory exported by (at least my old i915 HW) is no=
t
cacheable on CPU. Though, between corrupted image and bad performance or ju=
st
bad performance, we decided that it was better to have the second. When the
DMABuf is backed by CPU cacheable memory, peformance is great and CPU fallb=
ack
works. Work is in progress to better handle these two cases generically. Fo=
r
now, sometimes the app need to get involved, but this is only happens on
embedded/controlled kind of use cases. What matters is that application tha=
t
needs this can do it.

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subproje=
cts/gst-plugins-base/gst-libs/gst/allocators/gstdmabuf.c

>=20
> This design was then used by us with various media players on different=
=20
> customer projects, including QNAP https://www.qnap.com/en/product/ts-877=
=20
> as well as the newest Tesla=20
> https://www.amd.com/en/products/embedded-automotive-solutions
>=20
> I won't go into the details here, but we are using exactly the approach=
=20
> I've outlined to let userspace control the DMA between the different=20
> device in question. I'm one of the main designers of that and our=20
> multimedia and mesa team has up-streamed quite a number of changes for=
=20
> this project.
>=20
> I'm not that well into different ARM based solutions because we are just=
=20
> recently getting results that this starts to work with AMD GPUs, but I'm=
=20
> pretty sure that the design should be able to handle that as well.
>=20
> So we have clearly prove that this design works, even with special=20
> requirements which are way more complex than what we are discussing=20
> here. We had cases where we used GStreamer to feed DMA-buf handles into=
=20
> multiple devices with different format requirements and that seems to=20
> work fine.

Sounds like you have a love/hate relationship with GStreamer. Glad the fram=
ework
is working for you too. The framework have had bidirectional memory allocat=
ion
for over a decade, it also has context sharing for stacks like
D3D11,12/GL/Vulkan/CUDA etc. I strictly didn't understand what you were
complaining about. As a vendor, you can solve all this in your BSP. Though,
translating BSP patches into a generic upstream-able features is not as sim=
ple.
The solution that works for vendor is usually the most cost effective one. =
I'm
sure, Tesla or AMD Automotive are no exceptions.

>=20
> -----
> What is clearly a bug in the kernel is that we don't reject things which=
=20
> won't work correctly and this is what this patch here addresses. What we=
=20
> could talk about is backward compatibility for this patch, cause it=20
> might look like it breaks things which previously used to work at least=
=20
> partially.

I did read your code review (I don't class this discussion as a code review=
).
You where asked to address several issues, clearly a v2 is needed.

1. Rob Clark stated the coherency is not homogeneous in many device drivers=
. So
your patch will yield many false positives. He asked if you could think of =
a
"per attachement" solution, as splitting drivers didn't seem like the best
approach (and it would have to happen at the same time anyway).=20

2. Lucas raised a concern, unfortunately no proof yet, that this may cause
regressions in existing userspace application. You stated that the applicat=
ion
must be wrong, yet this would break Linus rule #1. I'm not participating in=
 that
discussion, I tried to reproduced, but appart from writing an app that will
break, I haven't found yet. But it feels like the way forward is to ensure =
each
exporter driver can override this in case it has a good reason to do so.

As a third option, a safer approach would be to avoid reusing a flawed mech=
anism
to detect device coherency (or rephrased, accept that device coherency isn'=
t
homogeneous). Communicate this back another way. this means patching all th=
e
drivers, but at least each driver maintainer will be able to judge with the=
ir HW
knowledge if this is going to regress or not. When I first looked at it, I
wanted to experiment with enabling cache in vb2 contiguous allocator. I was
thinking that perhaps I could have bracketing, and state changes triggered =
by
the attach call, all based on the device coherency, but now that I saw Rob =
Clark
comment, I feel like this is flawed.

happy v2,
Nicolas
