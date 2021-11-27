Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F9B46000D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 17:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6076E0AA;
	Sat, 27 Nov 2021 16:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Sat, 27 Nov 2021 16:06:37 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5766E0AA
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 16:06:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5113A60B46;
 Sat, 27 Nov 2021 16:00:37 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 83A96C53FAD;
 Sat, 27 Nov 2021 16:00:32 +0000 (UTC)
Date: Sat, 27 Nov 2021 16:05:33 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 11/15] iio: buffer-dma: Boost performance using
 write-combine cache setting
Message-ID: <20211127160533.5259f486@jic23-huawei>
In-Reply-To: <YX153R.0PENWW3ING7F1@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-12-paul@crapouillou.net>
 <20211121150037.2a606be0@jic23-huawei>
 <8WNX2R.M4XE9MQC24W22@crapouillou.net>
 <YX153R.0PENWW3ING7F1@crapouillou.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Nov 2021 17:29:58 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi Jonathan,
>=20
> Le dim., nov. 21 2021 at 17:43:20 +0000, Paul Cercueil=20
> <paul@crapouillou.net> a =C3=A9crit :
> > Hi Jonathan,
> >=20
> > Le dim., nov. 21 2021 at 15:00:37 +0000, Jonathan Cameron=20
> > <jic23@kernel.org> a =C3=A9crit : =20
> >> On Mon, 15 Nov 2021 14:19:21 +0000
> >> Paul Cercueil <paul@crapouillou.net> wrote:
> >>  =20
> >>>  We can be certain that the input buffers will only be accessed by
> >>>  userspace for reading, and output buffers will mostly be accessed=20
> >>> by
> >>>  userspace for writing. =20
> >>=20
> >> Mostly?  Perhaps a little more info on why that's not 'only'. =20
> >=20
> > Just like with a framebuffer, it really depends on what the=20
> > application does. Most of the cases it will just read sequentially an=20
> > input buffer, or write sequentially an output buffer. But then you=20
> > get the exotic application that will try to do something like alpha=20
> > blending, which means read+write. Hence "mostly".
> >  =20
> >>>=20
> >>>  Therefore, it makes more sense to use only fully cached input=20
> >>> =7F=7Fbuffers,
> >>>  and to use the write-combine cache coherency setting for output=20
> >>> =7F=7Fbuffers.
> >>>=20
> >>>  This boosts performance, as the data written to the output buffers=20
> >>> =7F=7Fdoes
> >>>  not have to be sync'd for coherency. It will halve performance if=20
> >>> =7F=7Fthe
> >>>  userspace application tries to read from the output buffer, but=20
> >>> this
> >>>  should never happen.
> >>>=20
> >>>  Since we don't need to sync the cache when disabling CPU access=20
> >>> =7F=7Feither
> >>>  for input buffers or output buffers, the .end_cpu_access()=20
> >>> callback =7F=7Fcan
> >>>  be dropped completely. =20
> >>=20
> >> We have an odd mix of coherent and non coherent DMA in here as you=20
> >> =7Fnoted,
> >> but are you sure this is safe on all platforms? =20
> >=20
> > The mix isn't safe, but using only coherent or only non-coherent=20
> > should be safe, yes.
> >  =20
> >>  =20
> >>>=20
> >>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net> =20
> >>=20
> >> Any numbers to support this patch?  The mapping types are performance
> >> optimisations so nice to know how much of a difference they make. =20
> >=20
> > Output buffers are definitely faster in write-combine mode. On a=20
> > ZedBoard with a AD9361 transceiver set to 66 MSPS, and buffer/size=20
> > set to 8192, I would get about 185 MiB/s before, 197 MiB/s after.
> >=20
> > Input buffers... early results are mixed. On ARM32 it does look like=20
> > it is slightly faster to read from *uncached* memory than reading=20
> > from cached memory. The cache sync does take a long time.
> >=20
> > Other architectures might have a different result, for instance on=20
> > MIPS invalidating the cache is a very fast operation, so using cached=20
> > buffers would be a huge win in performance.
> >=20
> > Setups where the DMA operations are coherent also wouldn't require=20
> > any cache sync and this patch would give a huge win in performance.
> >=20
> > I'll run some more tests next week to have some fresh numbers. =20
>=20
> I think I mixed things up before, because I get different results now.
>=20
> Here are some fresh benchmarks, triple-checked, using libiio's=20
> iio_readdev and iio_writedev tools, with 64K samples buffers at 61.44=20
> MSPS (max. theorical throughput: 234 MiB/s):
>   iio_readdev -b 65536 cf-ad9361-lpc voltage0 voltage1 | pv > /dev/null
>   pv /dev/zero | iio_writedev -b 65536 cf-ad9361-dds-core-lpc voltage0=20
> voltage1

There is a bit of a terminology confusion going on here.  I think
for the mappings you mean cacheable vs non-cacheable but maybe
I'm misunderstanding.  That doesn't necessarily correspond to
coherency.  Non cached memory is always coherent because all caches
miss.

Non-cacheable can be related to coherency of course. Also beware that given
hardware might not implement non-cacheable if it knows all possible
accesses are IO-coherent.  Affect is the same and if implemented
correctly it will not hurt performance significantly.

firmware should be letting the OS know if the device does coherent
DMA or not... dma-coherent in dt.  It might be optional for a given
piece of DMA engine but I've not seen that..

I'm not sure I see how you can do a mixture of cacheable for reads
and write combine (which means uncacheable) for writes...

>=20
> Coherent mapping:
> - fileio:
>     read:	125 MiB/s
>     write:	141 MiB/s
> - dmabuf:
>     read:	171 MiB/s
>     write:	210 MiB/s
>=20
> Coherent reads + Write-combine writes:
> - fileio:
>     read:	125 MiB/s
>     write:	141 MiB/s
> - dmabuf:
>     read:	171 MiB/s
>     write:	210 MiB/s
>=20
> Non-coherent mapping:
> - fileio:
>     read:	119 MiB/s
>     write:	124 MiB/s
> - dmabuf:
>     read:	159 MiB/s
>     write:	124 MiB/s
>=20
> Non-coherent reads + write-combine writes:
> - fileio:
>     read:	119 MiB/s
>     write:	140 MiB/s
> - dmabuf:
>     read:	159 MiB/s
>     write:	210 MiB/s
>=20


> Non-coherent mapping with no cache sync:
> - fileio:
>     read:	156 MiB/s
>     write:	123 MiB/s
> - dmabuf:
>     read:	234 MiB/s (capped by sample rate)
>     write:	182 MiB/s
>=20
> Non-coherent reads with no cache sync + write-combine writes:
> - fileio:
>     read:	156 MiB/s
>     write:	140 MiB/s
> - dmabuf:
>     read:	234 MiB/s (capped by sample rate)
>     write:	210 MiB/s
>=20
>=20
> A few things we can deduce from this:
>=20
> * Write-combine is not available on Zynq/ARM? If it was working, it=20
> should give a better performance than the coherent mapping, but it=20
> doesn't seem to do anything at all. At least it doesn't harm=20
> performance.

I'm not sure it's very relevant to this sort of streaming write.
If you write a sequence of addresses then nothing stops them getting combin=
ed
into a single write whether or not it is write-combining.

You may be right that the particular path to memory doesn't support it anyw=
ay.
Also some cache architectures will rapidly detect streaming writes and
elect not to cache them whether coherent or not.




>=20
> * Non-coherent + cache invalidation is definitely a good deal slower=20
> than using coherent mapping, at least on ARM32. However, when the cache=20
> sync is disabled (e.g. if the DMA operations are coherent) the reads=20
> are much faster.

If you are running with cache sync then it better not be cached
as such it's coherent in the sense of there being no entries in the cache
in either direction.

>=20
> * The new dma-buf based API is a great deal faster than the fileio API.

:)

>=20
> So in the future we could use coherent reads + write-combine writes,=20
> unless we know the DMA operations are coherent, and in this case use=20
> non-coherent reads + write-combine writes.

Not following this argument at all, but anyway we can revisit when it mattr=
s. =20

>=20
> Regarding this patch, unfortunately I cannot prove that write-combine=20
> is faster, so I'll just drop this patch for now.

Sure, thanks for checking.  It's worth noting that WC usage in kernel
is vanishingly rare and I suspect that's mostly because it doesn't
do anything on many implementations.

Jonathan

>=20
> Cheers,
> -Paul
>=20
>=20

