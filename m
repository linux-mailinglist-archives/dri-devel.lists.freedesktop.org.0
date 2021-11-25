Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A1745DFBB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 18:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9176E030;
	Thu, 25 Nov 2021 17:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C006E030
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 17:30:11 +0000 (UTC)
Date: Thu, 25 Nov 2021 17:29:58 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 11/15] iio: buffer-dma: Boost performance using
 write-combine cache setting
To: Jonathan Cameron <jic23@kernel.org>
Message-Id: <YX153R.0PENWW3ING7F1@crapouillou.net>
In-Reply-To: <8WNX2R.M4XE9MQC24W22@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-12-paul@crapouillou.net>
 <20211121150037.2a606be0@jic23-huawei>
 <8WNX2R.M4XE9MQC24W22@crapouillou.net>
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
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Le dim., nov. 21 2021 at 17:43:20 +0000, Paul Cercueil=20
<paul@crapouillou.net> a =E9crit :
> Hi Jonathan,
>=20
> Le dim., nov. 21 2021 at 15:00:37 +0000, Jonathan Cameron=20
> <jic23@kernel.org> a =E9crit :
>> On Mon, 15 Nov 2021 14:19:21 +0000
>> Paul Cercueil <paul@crapouillou.net> wrote:
>>=20
>>>  We can be certain that the input buffers will only be accessed by
>>>  userspace for reading, and output buffers will mostly be accessed=20
>>> by
>>>  userspace for writing.
>>=20
>> Mostly?  Perhaps a little more info on why that's not 'only'.
>=20
> Just like with a framebuffer, it really depends on what the=20
> application does. Most of the cases it will just read sequentially an=20
> input buffer, or write sequentially an output buffer. But then you=20
> get the exotic application that will try to do something like alpha=20
> blending, which means read+write. Hence "mostly".
>=20
>>>=20
>>>  Therefore, it makes more sense to use only fully cached input=20
>>> =7F=7Fbuffers,
>>>  and to use the write-combine cache coherency setting for output=20
>>> =7F=7Fbuffers.
>>>=20
>>>  This boosts performance, as the data written to the output buffers=20
>>> =7F=7Fdoes
>>>  not have to be sync'd for coherency. It will halve performance if=20
>>> =7F=7Fthe
>>>  userspace application tries to read from the output buffer, but=20
>>> this
>>>  should never happen.
>>>=20
>>>  Since we don't need to sync the cache when disabling CPU access=20
>>> =7F=7Feither
>>>  for input buffers or output buffers, the .end_cpu_access()=20
>>> callback =7F=7Fcan
>>>  be dropped completely.
>>=20
>> We have an odd mix of coherent and non coherent DMA in here as you=20
>> =7Fnoted,
>> but are you sure this is safe on all platforms?
>=20
> The mix isn't safe, but using only coherent or only non-coherent=20
> should be safe, yes.
>=20
>>=20
>>>=20
>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>=20
>> Any numbers to support this patch?  The mapping types are performance
>> optimisations so nice to know how much of a difference they make.
>=20
> Output buffers are definitely faster in write-combine mode. On a=20
> ZedBoard with a AD9361 transceiver set to 66 MSPS, and buffer/size=20
> set to 8192, I would get about 185 MiB/s before, 197 MiB/s after.
>=20
> Input buffers... early results are mixed. On ARM32 it does look like=20
> it is slightly faster to read from *uncached* memory than reading=20
> from cached memory. The cache sync does take a long time.
>=20
> Other architectures might have a different result, for instance on=20
> MIPS invalidating the cache is a very fast operation, so using cached=20
> buffers would be a huge win in performance.
>=20
> Setups where the DMA operations are coherent also wouldn't require=20
> any cache sync and this patch would give a huge win in performance.
>=20
> I'll run some more tests next week to have some fresh numbers.

I think I mixed things up before, because I get different results now.

Here are some fresh benchmarks, triple-checked, using libiio's=20
iio_readdev and iio_writedev tools, with 64K samples buffers at 61.44=20
MSPS (max. theorical throughput: 234 MiB/s):
  iio_readdev -b 65536 cf-ad9361-lpc voltage0 voltage1 | pv > /dev/null
  pv /dev/zero | iio_writedev -b 65536 cf-ad9361-dds-core-lpc voltage0=20
voltage1

Coherent mapping:
- fileio:
    read:	125 MiB/s
    write:	141 MiB/s
- dmabuf:
    read:	171 MiB/s
    write:	210 MiB/s

Coherent reads + Write-combine writes:
- fileio:
    read:	125 MiB/s
    write:	141 MiB/s
- dmabuf:
    read:	171 MiB/s
    write:	210 MiB/s

Non-coherent mapping:
- fileio:
    read:	119 MiB/s
    write:	124 MiB/s
- dmabuf:
    read:	159 MiB/s
    write:	124 MiB/s

Non-coherent reads + write-combine writes:
- fileio:
    read:	119 MiB/s
    write:	140 MiB/s
- dmabuf:
    read:	159 MiB/s
    write:	210 MiB/s

Non-coherent mapping with no cache sync:
- fileio:
    read:	156 MiB/s
    write:	123 MiB/s
- dmabuf:
    read:	234 MiB/s (capped by sample rate)
    write:	182 MiB/s

Non-coherent reads with no cache sync + write-combine writes:
- fileio:
    read:	156 MiB/s
    write:	140 MiB/s
- dmabuf:
    read:	234 MiB/s (capped by sample rate)
    write:	210 MiB/s


A few things we can deduce from this:

* Write-combine is not available on Zynq/ARM? If it was working, it=20
should give a better performance than the coherent mapping, but it=20
doesn't seem to do anything at all. At least it doesn't harm=20
performance.

* Non-coherent + cache invalidation is definitely a good deal slower=20
than using coherent mapping, at least on ARM32. However, when the cache=20
sync is disabled (e.g. if the DMA operations are coherent) the reads=20
are much faster.

* The new dma-buf based API is a great deal faster than the fileio API.

So in the future we could use coherent reads + write-combine writes,=20
unless we know the DMA operations are coherent, and in this case use=20
non-coherent reads + write-combine writes.

Regarding this patch, unfortunately I cannot prove that write-combine=20
is faster, so I'll just drop this patch for now.

Cheers,
-Paul


