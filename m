Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C5F83ADCA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 16:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FCA10EA60;
	Wed, 24 Jan 2024 15:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F5410E3CB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1706111528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KzDEEPXk1BJzB7T0gf49ptX9Upq6NPCegHjNhUWdYTk=;
 b=ISnHLPX229T8FzuMol/PUDWkPyo82NdDKorkDpXVrFLMC21chLr2kfn6po5yiBs9OEly4b
 GFsa5u7pS+RMo+hqHnYxIz/p4BCPX+LDyA8qeTUJHaWJieZ3TS+zT79w7l3QEAdmaNzYqY
 hXvXwlAnqGhTOJLo3YJr3Vp8RBa/wg4=
Message-ID: <4819fa1e6b739380abc669a96dcea90ccc07e774.camel@crapouillou.net>
Subject: Re: [Linaro-mm-sig] [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
From: Paul Cercueil <paul@crapouillou.net>
To: Andrew Davis <afd@ti.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Sumit
 Semwal <sumit.semwal@linaro.org>
Date: Wed, 24 Jan 2024 16:52:05 +0100
In-Reply-To: <715efa1f-c3a4-4952-b72c-ca7f466e3ccb@ti.com>
References: <20240119141402.44262-1-paul@crapouillou.net>
 <20240119141402.44262-2-paul@crapouillou.net>
 <8035f515-591f-4c87-bf0a-23d5705d9b1c@gmail.com>
 <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
 <0b6b8738-9ea3-44fa-a624-9297bd55778f@amd.com>
 <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
 <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <715efa1f-c3a4-4952-b72c-ca7f466e3ccb@ti.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
 YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

Le mercredi 24 janvier 2024 =C3=A0 09:38 -0600, Andrew Davis a =C3=A9crit=
=C2=A0:
> On 1/24/24 4:58 AM, Paul Cercueil wrote:
> > Hi Christian,
> >=20
> > Le mardi 23 janvier 2024 =C3=A0 14:28 +0100, Christian K=C3=B6nig a =C3=
=A9crit=C2=A0:
> > > =C2=A0=C2=A0Am 23.01.24 um 14:02 schrieb Paul Cercueil:
> > > =C2=A0=20
> > > > [SNIP]
> > > > =C2=A0=20
> > > > > =C2=A0=20
> > > > > > =C2=A0=C2=A0=20
> > > > > > > =C2=A0=20
> > > > > > > That an exporter has to call extra functions to access
> > > > > > > his
> > > > > > > own
> > > > > > > buffers
> > > > > > > is a complete no-go for the design since this forces
> > > > > > > exporters
> > > > > > > into
> > > > > > > doing extra steps for allowing importers to access their
> > > > > > > data.
> > > > > > > =C2=A0=20
> > > > > > =C2=A0=20
> > > > > > Then what about we add these dma_buf_{begin,end}_access(),
> > > > > > with
> > > > > > only
> > > > > > implementations for "dumb" exporters e.g. udmabuf or the
> > > > > > dmabuf
> > > > > > heaps?
> > > > > > And only importers (who cache the mapping and actually care
> > > > > > about
> > > > > > non-
> > > > > > coherency) would have to call these.
> > > > > > =C2=A0=20
> > > > > =C2=A0=20
> > > > > No, the problem is still that you would have to change all
> > > > > importers
> > > > > to
> > > > > mandatory use dma_buf_begin/end.
> > > > >=20
> > > > > But going a step back caching the mapping is irrelevant for
> > > > > coherency.
> > > > > Even if you don't cache the mapping you don't get coherency.
> > > > > =C2=A0=20
> > > > =C2=A0=20
> > > > You actually do - at least with udmabuf, as in that case
> > > > dma_buf_map_attachment() / dma_buf_unmap_attachment() will
> > > > handle
> > > > cache
> > > > coherency when the SGs are mapped/unmapped.
> > > > =C2=A0=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0Well I just double checked the source in 6.7.1 and I can'=
t see
> > > udmabuf doing anything for cache coherency in map/unmap.
> > > =C2=A0=20
> > > =C2=A0=C2=A0All it does is calling dma_map_sgtable() and
> > > dma_unmap_sgtable() to
> > > create and destroy the SG table and those are not supposed to
> > > sync
> > > anything to the CPU cache.
> > > =C2=A0=20
> > > =C2=A0=C2=A0In other words drivers usually use DMA_ATTR_SKIP_CPU_SYNC=
 here,
> > > it's
> > > just that this is missing from udmabuf.
> >=20
> > Ok.
> > =C2=A0=20
> > > > =C2=A0=20
> > > > The problem was then that dma_buf_unmap_attachment cannot be
> > > > called
> > > > before the dma_fence is signaled, and calling it after is
> > > > already
> > > > too
> > > > late (because the fence would be signaled before the data is
> > > > sync'd).
> > > > =C2=A0=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0Well what sync are you talking about? CPU sync? In DMA-bu=
f that
> > > is
> > > handled differently.
> > > =C2=A0=20
> > > =C2=A0=C2=A0For importers it's mandatory that they can be coherent wi=
th the
> > > exporter. That usually means they can snoop the CPU cache if the
> > > exporter can snoop the CPU cache.
> >=20
> > I seem to have such a system where one device can snoop the CPU
> > cache
> > and the other cannot. Therefore if I want to support it properly, I
> > do
> > need cache flush/sync. I don't actually try to access the data
> > using
> > the CPU (and when I do, I call the sync start/end ioctls).
> >=20
>=20
> If you don't access the data using the CPU, then how did the data
> end up in the CPU caches? If you have a device that can write-
> allocate
> into your CPU cache, but some other device in the system cannot snoop
> that data back out then that is just broken and those devices cannot
> reasonably share buffers..

I think that's what happens, yes.

> Now we do have systems where some hardware can snoop CPU(or L3)
> caches
> and others cannot, but they will not *allocate* into those caches
> (unless they also have the ability to sync them without CPU in the
> loop).
>=20
> Your problem may be if you are still using udmabuf driver as your
> DMA-BUF exporter, which as said before is broken (and I just sent
> some
> patches with a few fixes just for you :)). For udmabuf, data starts
> in the CPU domain (in caches) and is only ever synced for the CPU,
> not for attached devices. So in this case the writing device might
> update those cache lines but a non-snooping reader would never see
> those updates.

I tried today with the system dma-heap, and the behaviour was the same.
Adding an implementation of .dma_buf_begin/end_access() to it made it
work there too.

> I'm not saying there isn't a need for these new {begin,end}_access()
> functions. I can think of a few interesting usecases, but as you
> say below that would be good to work out in a different series.

Yep, but it's a can of worms I'd rather not open if I can avoid it :)

> Andrew

Cheers,
-Paul

>=20
> >=20
> > > =C2=A0=C2=A0For exporters you can implement the begin/end CPU access
> > > functions
> > > which allows you to implement something even if your exporting
> > > device
> > > can't snoop the CPU cache.
> >=20
> > That only works if the importers call the begin_cpu_access() /
> > end_cpu_access(), which they don't.
> >=20
> > =C2=A0=20
> > > > Daniel / Sima suggested then that I cache the mapping and add
> > > > new
> > > > functions to ensure cache coherency, which is what these
> > > > patches
> > > > are
> > > > about.
> > > > =C2=A0=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0Yeah, I've now catched up on the latest mail. Sorry I hav=
en't
> > > seen
> > > that before.
> > > =C2=A0=20
> > > =C2=A0=20
> > > > =C2=A0=20
> > > >=20
> > > > =C2=A0=20
> > > > > =C2=A0=20
> > > > > In other words exporters are not require to call sync_to_cpu
> > > > > or
> > > > > sync_to_device when you create a mapping.
> > > > >=20
> > > > > What exactly is your use case here? And why does coherency
> > > > > matters?
> > > > > =C2=A0=20
> > > > =C2=A0=20
> > > > My use-case is, I create DMABUFs with udmabuf, that I attach to
> > > > USB/functionfs with the interface introduced by this patchset.
> > > > I
> > > > attach
> > > > them to IIO with a similar interface (being upstreamed in
> > > > parallel),
> > > > and transfer data from USB to IIO and vice-versa in a zero-copy
> > > > fashion.
> > > >=20
> > > > This works perfectly fine as long as the USB and IIO hardware
> > > > are
> > > > coherent between themselves, which is the case on most of our
> > > > boards.
> > > > However I do have a board (with a Xilinx Ultrascale SoC) where
> > > > it
> > > > is
> > > > not the case, and cache flushes/sync are needed. So I was
> > > > trying to
> > > > rework these new interfaces to work on that system too.
> > > > =C2=A0=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0Yeah, that sounds strongly like one of the use cases we h=
ave
> > > rejected so far.
> > > =C2=A0=20
> > > =C2=A0=20
> > > =C2=A0=20
> > > > =C2=A0=20
> > > > If this really is a no-no, then I am fine with the assumption
> > > > that
> > > > devices sharing a DMABUF must be coherent between themselves;
> > > > but
> > > > that's something that should probably be enforced rather than
> > > > assumed.
> > > >=20
> > > > (and I *think* there is a way to force coherency in the
> > > > Ultrascale's
> > > > interconnect - we're investigating it)
> > > > =C2=A0=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0What you can do is that instead of using udmabuf or dma-h=
eaps
> > > is
> > > that the device which can't provide coherency act as exporters of
> > > the
> > > buffers.
> > > =C2=A0=20
> > > =C2=A0=C2=A0The exporter is allowed to call sync_for_cpu/sync_for_dev=
ice on
> > > it's
> > > own buffers and also gets begin/end CPU access notfications. So
> > > you
> > > can then handle coherency between the exporter and the CPU.
> >=20
> > But again that would only work if the importers would call
> > begin_cpu_access() / end_cpu_access(), which they don't, because
> > they
> > don't actually access the data using the CPU.
> >=20
> > Unless you mean that the exporter can call
> > sync_for_cpu/sync_for_device
> > before/after every single DMA transfer so that the data appears
> > coherent to the importers, without them having to call
> > begin_cpu_access() / end_cpu_access().
> >=20
> > In which case - this would still demultiply the complexity; my USB-
> > functionfs interface here (and IIO interface in the separate
> > patchset)
> > are not device-specific, so I'd rather keep them importers.
> > =C2=A0=20
> > > =C2=A0=C2=A0If you really don't have coherency between devices then t=
hat
> > > would
> > > be a really new use case and we would need much more agreement on
> > > how
> > > to do this.
> >=20
> > [snip]
> >=20
> > Agreed. Desiging a good generic solution would be better.
> >=20
> > With that said...
> >=20
> > Let's keep it out of this USB-functionfs interface for now. The
> > interface does work perfectly fine on platforms that don't have
> > coherency problems. The coherency issue in itself really is a
> > tangential issue.
> >=20
> > So I will send a v6 where I don't try to force the cache coherency
> > -
> > and instead assume that the attached devices are coherent between
> > themselves.
> >=20
> > But it would be even better to have a way to detect non-coherency
> > and
> > return an error on attach.
> >=20
> > Cheers,
> > -Paul

