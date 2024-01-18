Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EB7831FCF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 20:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8019D10E8DE;
	Thu, 18 Jan 2024 19:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF64C10E8DE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 19:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1705606766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5hnpgIpMD133U0M5vORJbw8bpFlrwvZKAm5gWQaoJIc=;
 b=oS9HKcFP8p2Z3w5kZ/35zNLI2sr/BKrl5VDnj93IFX8iBDshl68gM4AUPvLx5cqBdWrzA3
 PEhQr8qdLsR2RUwWAIPqDNIzsFK8uYU8qYNBo1rDz6hUVg6YXq2lZeHVfFGyHIG0N2gt+w
 AdkiHSkRg3eLQ7/3S8NeEZjjtR/nXF0=
Message-ID: <cb64afbb0aae887520f471f09c83b29a08214bfd.camel@crapouillou.net>
Subject: Re: [PATCH v3 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
From: Paul Cercueil <paul@crapouillou.net>
To: Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jonathan
 Corbet <corbet@lwn.net>, Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-doc@vger.kernel.org,  linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org, Andrzej
 Pietrasiewicz <andrzej.p@collabora.com>,  linaro-mm-sig@lists.linaro.org,
 Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>,  linux-media@vger.kernel.org
Date: Thu, 18 Jan 2024 20:39:23 +0100
In-Reply-To: <Zakupp1GCZMk5aDT@phenom.ffwll.local>
References: <20240108120056.22165-4-paul@crapouillou.net>
 <ZZvtEXL8DLPPdtPs@phenom.ffwll.local>
 <a44aca93adc60ce56a64c50797a029631900172e.camel@crapouillou.net>
 <ZZwU827NMHbx7bsO@phenom.ffwll.local>
 <2c0d4ef1b657c56ea2290fe16d757ce563a3e71b.camel@crapouillou.net>
 <ZZxKvR9gjH8D5qxj@phenom.ffwll.local>
 <31e56028b4d865c60b7c01b2a305b3dd8a21ff7a.camel@crapouillou.net>
 <ZZ1Dx1Jqbi61_Afb@phenom.ffwll.local>
 <c100b5f75b12de4a331dd36de3573483dbde915f.camel@crapouillou.net>
 <ZakuD-ns-5UJmrRi@phenom.ffwll.local> <Zakupp1GCZMk5aDT@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel / Sima,

Le jeudi 18 janvier 2024 =C3=A0 14:59 +0100, Daniel Vetter a =C3=A9crit=C2=
=A0:
> On Thu, Jan 18, 2024 at 02:56:31PM +0100, Daniel Vetter wrote:
> > On Mon, Jan 15, 2024 at 01:54:27PM +0100, Paul Cercueil wrote:
> > > Hi Daniel / Sima,
> > >=20
> > > Le mardi 09 janvier 2024 =C3=A0 14:01 +0100, Daniel Vetter a =C3=A9cr=
it=C2=A0:
> > > > On Tue, Jan 09, 2024 at 12:06:58PM +0100, Paul Cercueil wrote:
> > > > > Hi Daniel / Sima,
> > > > >=20
> > > > > Le lundi 08 janvier 2024 =C3=A0 20:19 +0100, Daniel Vetter a
> > > > > =C3=A9crit=C2=A0:
> > > > > > On Mon, Jan 08, 2024 at 05:27:33PM +0100, Paul Cercueil
> > > > > > wrote:
> > > > > > > Le lundi 08 janvier 2024 =C3=A0 16:29 +0100, Daniel Vetter a
> > > > > > > =C3=A9crit=C2=A0:
> > > > > > > > On Mon, Jan 08, 2024 at 03:21:21PM +0100, Paul Cercueil
> > > > > > > > wrote:
> > > > > > > > > Hi Daniel (Sima?),
> > > > > > > > >=20
> > > > > > > > > Le lundi 08 janvier 2024 =C3=A0 13:39 +0100, Daniel Vette=
r
> > > > > > > > > a
> > > > > > > > > =C3=A9crit=C2=A0:
> > > > > > > > > > On Mon, Jan 08, 2024 at 01:00:55PM +0100, Paul
> > > > > > > > > > Cercueil
> > > > > > > > > > wrote:
> > > > > > > > > > > +static void ffs_dmabuf_signal_done(struct
> > > > > > > > > > > ffs_dma_fence
> > > > > > > > > > > *dma_fence, int ret)
> > > > > > > > > > > +{
> > > > > > > > > > > +	struct ffs_dmabuf_priv *priv =3D
> > > > > > > > > > > dma_fence-
> > > > > > > > > > > > priv;
> > > > > > > > > > > +	struct dma_fence *fence =3D &dma_fence-
> > > > > > > > > > > >base;
> > > > > > > > > > > +
> > > > > > > > > > > +	dma_fence_get(fence);
> > > > > > > > > > > +	fence->error =3D ret;
> > > > > > > > > > > +	dma_fence_signal(fence);
> > > > > > > > > > > +
> > > > > > > > > > > +	dma_buf_unmap_attachment(priv->attach,
> > > > > > > > > > > dma_fence-
> > > > > > > > > > > > sgt,
> > > > > > > > > > > dma_fence->dir);
> > > > > > > > > > > +	dma_fence_put(fence);
> > > > > > > > > > > +	ffs_dmabuf_put(priv->attach);
> > > > > > > > > >=20
> > > > > > > > > > So this can in theory take the dma_resv lock, and
> > > > > > > > > > if the
> > > > > > > > > > usb
> > > > > > > > > > completion
> > > > > > > > > > isn't an unlimited worker this could hold up
> > > > > > > > > > completion
> > > > > > > > > > of
> > > > > > > > > > future
> > > > > > > > > > dma_fence, resulting in a deadlock.
> > > > > > > > > >=20
> > > > > > > > > > Needs to be checked how usb works, and if stalling
> > > > > > > > > > indefinitely
> > > > > > > > > > in
> > > > > > > > > > the
> > > > > > > > > > io_complete callback can hold up the usb stack you
> > > > > > > > > > need
> > > > > > > > > > to:
> > > > > > > > > >=20
> > > > > > > > > > - drop a dma_fence_begin/end_signalling annotations
> > > > > > > > > > in
> > > > > > > > > > here
> > > > > > > > > > - pull out the unref stuff into a separate
> > > > > > > > > > preallocated
> > > > > > > > > > worker
> > > > > > > > > > (or at
> > > > > > > > > > =C2=A0 least the final unrefs for ffs_dma_buf).
> > > > > > > > >=20
> > > > > > > > > Only ffs_dmabuf_put() can attempt to take the
> > > > > > > > > dma_resv and
> > > > > > > > > would
> > > > > > > > > have
> > > > > > > > > to be in a worker, right? Everything else would be
> > > > > > > > > inside
> > > > > > > > > the
> > > > > > > > > dma_fence_begin/end_signalling() annotations?
> > > > > > > >=20
> > > > > > > > Yup. Also I noticed that unlike the iio patches you
> > > > > > > > don't
> > > > > > > > have
> > > > > > > > the
> > > > > > > > dma_buf_unmap here in the completion path (or I'm
> > > > > > > > blind?),
> > > > > > > > which
> > > > > > > > helps a
> > > > > > > > lot with avoiding trouble.
> > > > > > >=20
> > > > > > > They both call dma_buf_unmap_attachment() in the "signal
> > > > > > > done"
> > > > > > > callback, the only difference I see is that it is called
> > > > > > > after
> > > > > > > the
> > > > > > > dma_fence_put() in the iio patches, while it's called
> > > > > > > before
> > > > > > > dma_fence_put() here.
> > > > > >=20
> > > > > > I was indeed blind ...
> > > > > >=20
> > > > > > So the trouble is this wont work because:
> > > > > > - dma_buf_unmap_attachment() requires dma_resv_lock. This
> > > > > > is a
> > > > > > somewhat
> > > > > > =C2=A0 recent-ish change from 47e982d5195d ("dma-buf: Move
> > > > > > =C2=A0 dma_buf_map_attachment() to dynamic locking
> > > > > > specification"), so
> > > > > > maybe
> > > > > > =C2=A0 old kernel or you don't have full lockdep enabled to get
> > > > > > the
> > > > > > right
> > > > > > =C2=A0 splat.
> > > > > >=20
> > > > > > - dma_fence critical section forbids dma_resv_lock
> > > > > >=20
> > > > > > Which means you need to move this out, but then there's the
> > > > > > potential
> > > > > > cache management issue. Which current gpu drivers just
> > > > > > kinda
> > > > > > ignore
> > > > > > because it doesn't matter for current use-case, they all
> > > > > > cache
> > > > > > the
> > > > > > mapping
> > > > > > for about as long as the attachment exists. You might want
> > > > > > to do
> > > > > > the
> > > > > > same,
> > > > > > unless that somehow breaks a use-case you have, I have no
> > > > > > idea
> > > > > > about
> > > > > > that.
> > > > > > If something breaks with unmap_attachment moved out of the
> > > > > > fence
> > > > > > handling
> > > > > > then I guess it's high time to add separate cache-
> > > > > > management only
> > > > > > to
> > > > > > dma_buf (and that's probably going to be quite some wiring
> > > > > > up,
> > > > > > not
> > > > > > sure
> > > > > > even how easy that would be to do nor what exactly the
> > > > > > interface
> > > > > > should
> > > > > > look like).
> > > > >=20
> > > > > Ok. Then I'll just cache the mapping for now, I think.
> > > >=20
> > > > Yeah I think that's simplest. I did ponder a bit and I don't
> > > > think
> > > > it'd be
> > > > too much pain to add the cache-management functions for device
> > > > attachments/mappings. But it would be quite some typing ...
> > > > -Sima
> > >=20
> > > It looks like I actually do have some hardware which requires the
> > > cache
> > > management. If I cache the mappings in both my IIO and USB code,
> > > it
> > > works fine on my ZedBoard, but it doesn't work on my ZCU102.
> > >=20
> > > (Or maybe it's something else? What I get from USB in that case
> > > is a
> > > stream of zeros, I'd expect it to be more like a stream of
> > > garbage/stale data).
> > >=20
> > > So, change of plans; I will now unmap the attachment in the
> > > cleanup
> > > worker after the fence is signalled, and add a warning comment
> > > before
> > > the end of the fence critical section about the need to do cache
> > > management before the signal.
> > >=20
> > > Does that work for you?
> >=20
> > The trouble is, I'm not sure this works for you. If you rely on the
> > fences, and you have to do cache management in between dma
> > operations,
> > then doing the unmap somewhen later will only mostly paper over the
> > issue,
> > but not consistently.
> >=20
> > I think that's really bad because the bugs this will cause are very
> > hard
> > to track down and with the current infrastructure impossible to
> > fix.
> >=20
> > Imo cache the mappings, and then fix the cache management bug
> > properly.
> >=20
> > If you want an interim solution that isn't blocked on the dma-buf
> > cache
> > management api addition, the only thing that works is doing the
> > operations
> > synchronously in the ioctl call. Then you don't need fences, and
> > you can
> > guarantee that the unmap has finished before userspace proceeds.
> >=20
> > With the dma_fences you can't guarantee that, it's just pure luck.
>=20
> Maybe a follow up: Double check you really need the cache management
> between the dma operations from 2 different devices, and not for the
> cpu
> access that you then probably do to check the result.
>=20
> Because if the issue is just cpu access, then protecting the cpu
> access
> needs to use the begin/end_cpu_access dma-functions (or the
> corresponding
> ioctl if you use mmap from userspace) anyway, and that should sort
> out any
> issues you have for cpu access.
>=20
> Just to make sure we're not needlessly trying to fix something that
> isn't
> actually the problem.

I am not doing any CPU access - I'm just attaching the same DMABUF to
IIO and USB and use the new IOCTLs to transfer data.

Can I just roll my own cache management then, using
dma_sync_sg_for_cpu/device? I did a quick-and-dirty check with it, and
it seems to make things work with cached mappings.

> -Sima

Cheers,
-Paul
