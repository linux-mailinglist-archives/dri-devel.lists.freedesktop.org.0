Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F881E815
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 16:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F5310E1AD;
	Tue, 26 Dec 2023 15:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F56A10E1AD
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 15:38:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0832DB80B0A;
 Tue, 26 Dec 2023 15:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BB8C433C7;
 Tue, 26 Dec 2023 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703605082;
 bh=mjuSKXBYLBTXrExGzU7ImcTp0tooyzuVATIRqErYFjc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YR2FPmQVEXPusZIXW7SWDAJHfCZpkjfL3RZo0Z+RHzcmIOCMr1fFMtXzY59YZi3aJ
 9/fJA6jFtN6DhzfysEU3V04JmfGUA7BlgtuTyBQHdK4Gtu+lDykw/eb8TAORwGD5qM
 pKMqUpUQXl7E7DEB08RD6naH3IhC9PXeh6nhXWF6TcVYcqRZKAD5amRPmNzFR+HARK
 b0bN5IBB4tKwZDZalmrftan7S3aOrVPUnN+3yd4B/1HtQisGlb/zr3KJ3QkKEI9C1p
 o0RnLTNQJIO/cM4k3QOabK33IUBf8mnsMul5ivPtReMtWJMUieSKv23mQ/Uw4RS3j5
 O7J9Ppj88oddg==
Date: Tue, 26 Dec 2023 15:37:54 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 0/8] iio: new DMABUF based API, v5
Message-ID: <20231226153754.6d5b2c5e@jic23-huawei>
In-Reply-To: <a303d86e82b1ac15a7ef16bef0fc77e03601f633.camel@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231221163031.1a410905@jic23-huawei>
 <a303d86e82b1ac15a7ef16bef0fc77e03601f633.camel@crapouillou.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Vinod Koul <vkoul@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Dec 2023 18:56:52 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi Jonathan,
>=20
> Le jeudi 21 d=C3=A9cembre 2023 =C3=A0 16:30 +0000, Jonathan Cameron a =C3=
=A9crit=C2=A0:
> > On Tue, 19 Dec 2023 18:50:01 +0100
> > Paul Cercueil <paul@crapouillou.net> wrote:
> >  =20
> > > [V4 was: "iio: Add buffer write() support"][1]
> > >=20
> > > Hi Jonathan,
> > >  =20
> > Hi Paul,
> >  =20
> > > This is a respin of the V3 of my patchset that introduced a new
> > > interface based on DMABUF objects [2]. =20
> >=20
> > Great to see this moving forwards.
> >  =20
> > >=20
> > > The V4 was a split of the patchset, to attempt to upstream buffer
> > > write() support first. But since there is no current user upstream,
> > > it
> > > was not merged. This V5 is about doing the opposite, and contains
> > > the
> > > new DMABUF interface, without adding the buffer write() support. It
> > > can
> > > already be used with the upstream adi-axi-adc driver. =20
> >=20
> > Seems like a sensible path in the short term.
> >  =20
> > >=20
> > > In user-space, Libiio uses it to transfer back and forth blocks of
> > > samples between the hardware and the applications, without having
> > > to
> > > copy the data.
> > >=20
> > > On a ZCU102 with a FMComms3 daughter board, running Libiio from the
> > > pcercuei/dev-new-dmabuf-api branch [3], compiled with
> > > WITH_LOCAL_DMABUF_API=3DOFF (so that it uses fileio):
> > > =C2=A0 sudo utils/iio_rwdev -b 4096 -B cf-ad9361-lpc
> > > =C2=A0 Throughput: 116 MiB/s
> > >=20
> > > Same hardware, with the DMABUF API (WITH_LOCAL_DMABUF_API=3DON):
> > > =C2=A0 sudo utils/iio_rwdev -b 4096 -B cf-ad9361-lpc
> > > =C2=A0 Throughput: 475 MiB/s
> > >=20
> > > This benchmark only measures the speed at which the data can be
> > > fetched
> > > to iio_rwdev's internal buffers, and does not actually try to read
> > > the
> > > data (e.g. to pipe it to stdout). It shows that fetching the data
> > > is
> > > more than 4x faster using the new interface.
> > >=20
> > > When actually reading the data, the performance difference isn't
> > > that
> > > impressive (maybe because in case of DMABUF the data is not in
> > > cache): =20
> >=20
> > This needs a bit more investigation ideally. Perhaps perf counters
> > can be
> > used to establish that cache misses are the main different between
> > dropping it on the floor and actually reading the data. =20
>=20
> Yes, we'll work on it. The other big difference is that fileio uses
> dma_alloc_coherent() while the DMABUFs use non-coherent mappings. I
> guess coherent memory is faster for the typical access pattern (which
> is "read/write everything sequentially once").

Long time since I last worked much with a platform that wasn't always
IO coherent, so I've forgotten how all this works (all ends up as no-ops
on platforms I tend to use these days!)  Good luck, I'll be interested
to see what this turns out to be.

>=20
> > >=20
> > > WITH_LOCAL_DMABUF_API=3DOFF (so that it uses fileio):
> > > =C2=A0 sudo utils/iio_rwdev -b 4096 cf-ad9361-lpc | dd of=3D/dev/zero
> > > status=3Dprogress
> > > =C2=A0 2446422528 bytes (2.4 GB, 2.3 GiB) copied, 22 s, 111 MB/s
> > >=20
> > > WITH_LOCAL_DMABUF_API=3DON:
> > > =C2=A0 sudo utils/iio_rwdev -b 4096 cf-ad9361-lpc | dd of=3D/dev/zero
> > > status=3Dprogress
> > > =C2=A0 2334388736 bytes (2.3 GB, 2.2 GiB) copied, 21 s, 114 MB/s
> > >=20
> > > One interesting thing to note is that fileio is (currently)
> > > actually
> > > faster than the DMABUF interface if you increase a lot the buffer
> > > size.
> > > My explanation is that the cache invalidation routine takes more
> > > and
> > > more time the bigger the DMABUF gets. This is because the DMABUF is
> > > backed by small-size pages, so a (e.g.) 64 MiB DMABUF is backed by
> > > up
> > > to 16 thousands pages, that have to be invalidated one by one. This
> > > can
> > > be addressed by using huge pages, but the udmabuf driver does not
> > > (yet)
> > > support creating DMABUFs backed by huge pages. =20
> >=20
> > I'd imagine folios of reasonable size will help sort of a huge page
> > as then hopefully it will use the flush by va range instructions if
> > available.
> >  =20
> > >=20
> > > Anyway, the real benefits happen when the DMABUFs are either shared
> > > between IIO devices, or between the IIO subsystem and another
> > > filesystem. In that case, the DMABUFs are simply passed around
> > > drivers,
> > > without the data being copied at any moment.
> > >=20
> > > We use that feature to transfer samples from our transceivers to
> > > USB,
> > > using a DMABUF interface to FunctionFS [4].
> > >=20
> > > This drastically increases the throughput, to about 274 MiB/s over
> > > a
> > > USB3 link, vs. 127 MiB/s using IIO's fileio interface + write() to
> > > the
> > > FunctionFS endpoints, for a lower CPU usage (0.85 vs. 0.65 load
> > > avg.). =20
> >=20
> > This is a nice example.=C2=A0 Where are you with getting the patch merg=
ed? =20
>=20
> I'll send a new version (mostly a [RESEND]...) in the coming days. As
> you can see from the review on my last attempt, the main blocker is
> that nobody wants to merge a new interface if the rest of the kernel
> bits aren't upstream yet. Kind of a chicken-and-egg problem :)
>=20
> > Overall, this code looks fine to me, though there are some parts that
> > need review by other maintainers (e.g. Vinod for the dmaengine
> > callback)
> > and I'd like a 'looks fine' at least form those who know a lot more
> > about dmabuf than I do.
> >=20
> > To actually make this useful sounds like either udmabuf needs some
> > perf
> > improvements, or there has to be an upstream case of sharing it
> > without
> > something else (e.g your functionfs patches).=C2=A0 So what do we need =
to
> > get in before the positive benefit becomes worth carrying this extra
> > complexity? (which isn't too bad so I'm fine with a small benefit and
> > promises of riches :) =20
>=20
> I think the FunctionFS DMABUF interface can be pushed as well for 5.9,
> in parallel of this one, as the feedback on the V1 was good. I might
> just need some help pushing it forward (kind of a "I merge it if you
> merge it" guarantee).

Ok. If we get a 'fine by us' from DMABUF folk I'd be happy to make
that commitment for the IIO parts.

Jonathan

>=20
> Cheers,
> -Paul
>=20
> >=20
> > Jonathan
> >  =20
> > >=20
> > > Based on linux-next/next-20231219.
> > >=20
> > > Cheers,
> > > -Paul
> > >=20
> > > [1]
> > > https://lore.kernel.org/all/20230807112113.47157-1-paul@crapouillou.n=
et/
> > > [2]
> > > https://lore.kernel.org/all/20230403154800.215924-1-paul@crapouillou.=
net/
> > > [3]
> > > https://github.com/analogdevicesinc/libiio/tree/pcercuei/dev-new-dmab=
uf-api
> > > [4]
> > > https://lore.kernel.org/all/20230322092118.9213-1-paul@crapouillou.ne=
t/
> > >=20
> > > ---
> > > Changelog:
> > > - [3/8]: Replace V3's dmaengine_prep_slave_dma_array() with a new
> > > =C2=A0 dmaengine_prep_slave_dma_vec(), which uses a new 'dma_vec'
> > > struct.
> > > =C2=A0 Note that at some point we will need to support cyclic transfe=
rs
> > > =C2=A0 using dmaengine_prep_slave_dma_vec(). Maybe with a new "flags"
> > > =C2=A0 parameter to the function?
> > >=20
> > > - [4/8]: Implement .device_prep_slave_dma_vec() instead of V3's
> > > =C2=A0 .device_prep_slave_dma_array().
> > >=20
> > > =C2=A0 @Vinod: this patch will cause a small conflict with my other
> > > =C2=A0 patchset adding scatter-gather support to the axi-dmac driver.
> > > =C2=A0 This patch adds a call to axi_dmac_alloc_desc(num_sgs), but the
> > > =C2=A0 prototype of this function changed in my other patchset - it
> > > would
> > > =C2=A0 have to be passed the "chan" variable. I don't know how you
> > > prefer it
> > > =C2=A0 to be resolved. Worst case scenario (and if @Jonathan is okay
> > > with
> > > =C2=A0 that) this one patch can be re-sent later, but it would make t=
his
> > > =C2=A0 patchset less "atomic".
> > >=20
> > > - [5/8]:
> > > =C2=A0 - Use dev_err() instead of pr_err()
> > > =C2=A0 - Inline to_iio_dma_fence()
> > > =C2=A0 - Add comment to explain why we unref twice when detaching dma=
buf
> > > =C2=A0 - Remove TODO comment. It is actually safe to free the file's
> > > =C2=A0=C2=A0=C2=A0 private data even when transfers are still pending=
 because it
> > > =C2=A0=C2=A0=C2=A0 won't be accessed.
> > > =C2=A0 - Fix documentation of new fields in struct
> > > iio_buffer_access_funcs
> > > =C2=A0 - iio_dma_resv_lock() does not need to be exported, make it
> > > static
> > >=20
> > > - [7/8]:
> > > =C2=A0 - Use the new dmaengine_prep_slave_dma_vec().
> > > =C2=A0 - Restrict to input buffers, since output buffers are not yet
> > > =C2=A0=C2=A0=C2=A0 supported by IIO buffers.
> > >=20
> > > - [8/8]:
> > > =C2=A0 Use description lists for the documentation of the three new
> > > IOCTLs
> > > =C2=A0 instead of abusing subsections.
> > >=20
> > > ---
> > > Alexandru Ardelean (1):
> > > =C2=A0 iio: buffer-dma: split iio_dma_buffer_fileio_free() function
> > >=20
> > > Paul Cercueil (7):
> > > =C2=A0 iio: buffer-dma: Get rid of outgoing queue
> > > =C2=A0 dmaengine: Add API function dmaengine_prep_slave_dma_vec()
> > > =C2=A0 dmaengine: dma-axi-dmac: Implement device_prep_slave_dma_vec
> > > =C2=A0 iio: core: Add new DMABUF interface infrastructure
> > > =C2=A0 iio: buffer-dma: Enable support for DMABUFs
> > > =C2=A0 iio: buffer-dmaengine: Support new DMABUF based userspace API
> > > =C2=A0 Documentation: iio: Document high-speed DMABUF based API
> > >=20
> > > =C2=A0Documentation/iio/dmabuf_api.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 54 +++
> > > =C2=A0Documentation/iio/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +
> > > =C2=A0drivers/dma/dma-axi-dmac.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 40 ++
> > > =C2=A0drivers/iio/buffer/industrialio-buffer-dma.c=C2=A0 | 242 ++++++=
++---
> > > =C2=A0.../buffer/industrialio-buffer-dmaengine.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 52 ++-
> > > =C2=A0drivers/iio/industrialio-buffer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 402
> > > ++++++++++++++++++
> > > =C2=A0include/linux/dmaengine.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 25 ++
> > > =C2=A0include/linux/iio/buffer-dma.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 33 +-
> > > =C2=A0include/linux/iio/buffer_impl.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 ++
> > > =C2=A0include/uapi/linux/iio/buffer.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +
> > > =C2=A010 files changed, 836 insertions(+), 62 deletions(-)
> > > =C2=A0create mode 100644 Documentation/iio/dmabuf_api.rst
> > >  =20
> >  =20
>=20
>=20

