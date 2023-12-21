Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5BD81BC0A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 17:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8F10E36E;
	Thu, 21 Dec 2023 16:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B776310E36E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 16:30:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E12FC619F1;
 Thu, 21 Dec 2023 16:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF04C433C8;
 Thu, 21 Dec 2023 16:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703176248;
 bh=8I92nOSQv2kWDy9xEwJAbSaNNQCo4zqZ2BN93d6O3C4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gNE0w4vBgCKc4/nTyxxaTtatC2pK+Vs3ibt71jOm5M7dh8z9k83t4WnU6jjhZ2eFv
 oqNHP4dCzt5EtDZE6Z4wOrn2ZfAJ2bdmzD4aDgOfjZQkaX9Rwv3Ycf7n9B0IVDLoCh
 pLI5tJ8kiH/fyKrWjehlyuOapdOw8KwlblTa+sFwBMcmpeIU5SL+aysn4/kzApER0v
 u9Y+jkggrMZp7RdCq+k7dqcTuSgOGytcZcAOMNSzVH1pC0Yqn9EvqVkdJkbpLjY5XF
 0ui58E5VHloVmoieYXkipXPbbziEPuwliE4zNcuoESFaI6gDSi8KhEcGI+DzQM0OwO
 Lb4OmXfYuuDiQ==
Date: Thu, 21 Dec 2023 16:30:31 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 0/8] iio: new DMABUF based API, v5
Message-ID: <20231221163031.1a410905@jic23-huawei>
In-Reply-To: <20231219175009.65482-1-paul@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 19 Dec 2023 18:50:01 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> [V4 was: "iio: Add buffer write() support"][1]
> 
> Hi Jonathan,
> 
Hi Paul,

> This is a respin of the V3 of my patchset that introduced a new
> interface based on DMABUF objects [2].

Great to see this moving forwards.

> 
> The V4 was a split of the patchset, to attempt to upstream buffer
> write() support first. But since there is no current user upstream, it
> was not merged. This V5 is about doing the opposite, and contains the
> new DMABUF interface, without adding the buffer write() support. It can
> already be used with the upstream adi-axi-adc driver.

Seems like a sensible path in the short term.

> 
> In user-space, Libiio uses it to transfer back and forth blocks of
> samples between the hardware and the applications, without having to
> copy the data.
> 
> On a ZCU102 with a FMComms3 daughter board, running Libiio from the
> pcercuei/dev-new-dmabuf-api branch [3], compiled with
> WITH_LOCAL_DMABUF_API=OFF (so that it uses fileio):
>   sudo utils/iio_rwdev -b 4096 -B cf-ad9361-lpc
>   Throughput: 116 MiB/s
> 
> Same hardware, with the DMABUF API (WITH_LOCAL_DMABUF_API=ON):
>   sudo utils/iio_rwdev -b 4096 -B cf-ad9361-lpc
>   Throughput: 475 MiB/s
> 
> This benchmark only measures the speed at which the data can be fetched
> to iio_rwdev's internal buffers, and does not actually try to read the
> data (e.g. to pipe it to stdout). It shows that fetching the data is
> more than 4x faster using the new interface.
> 
> When actually reading the data, the performance difference isn't that
> impressive (maybe because in case of DMABUF the data is not in cache):

This needs a bit more investigation ideally. Perhaps perf counters can be
used to establish that cache misses are the main different between
dropping it on the floor and actually reading the data.

> 
> WITH_LOCAL_DMABUF_API=OFF (so that it uses fileio):
>   sudo utils/iio_rwdev -b 4096 cf-ad9361-lpc | dd of=/dev/zero status=progress
>   2446422528 bytes (2.4 GB, 2.3 GiB) copied, 22 s, 111 MB/s
> 
> WITH_LOCAL_DMABUF_API=ON:
>   sudo utils/iio_rwdev -b 4096 cf-ad9361-lpc | dd of=/dev/zero status=progress
>   2334388736 bytes (2.3 GB, 2.2 GiB) copied, 21 s, 114 MB/s
> 
> One interesting thing to note is that fileio is (currently) actually
> faster than the DMABUF interface if you increase a lot the buffer size.
> My explanation is that the cache invalidation routine takes more and
> more time the bigger the DMABUF gets. This is because the DMABUF is
> backed by small-size pages, so a (e.g.) 64 MiB DMABUF is backed by up
> to 16 thousands pages, that have to be invalidated one by one. This can
> be addressed by using huge pages, but the udmabuf driver does not (yet)
> support creating DMABUFs backed by huge pages.

I'd imagine folios of reasonable size will help sort of a huge page
as then hopefully it will use the flush by va range instructions if
available.

> 
> Anyway, the real benefits happen when the DMABUFs are either shared
> between IIO devices, or between the IIO subsystem and another
> filesystem. In that case, the DMABUFs are simply passed around drivers,
> without the data being copied at any moment.
> 
> We use that feature to transfer samples from our transceivers to USB,
> using a DMABUF interface to FunctionFS [4].
> 
> This drastically increases the throughput, to about 274 MiB/s over a
> USB3 link, vs. 127 MiB/s using IIO's fileio interface + write() to the
> FunctionFS endpoints, for a lower CPU usage (0.85 vs. 0.65 load avg.).

This is a nice example.  Where are you with getting the patch merged?

Overall, this code looks fine to me, though there are some parts that
need review by other maintainers (e.g. Vinod for the dmaengine callback)
and I'd like a 'looks fine' at least form those who know a lot more
about dmabuf than I do.

To actually make this useful sounds like either udmabuf needs some perf
improvements, or there has to be an upstream case of sharing it without
something else (e.g your functionfs patches).  So what do we need to
get in before the positive benefit becomes worth carrying this extra
complexity? (which isn't too bad so I'm fine with a small benefit and
promises of riches :)

Jonathan

> 
> Based on linux-next/next-20231219.
> 
> Cheers,
> -Paul
> 
> [1] https://lore.kernel.org/all/20230807112113.47157-1-paul@crapouillou.net/
> [2] https://lore.kernel.org/all/20230403154800.215924-1-paul@crapouillou.net/
> [3] https://github.com/analogdevicesinc/libiio/tree/pcercuei/dev-new-dmabuf-api
> [4] https://lore.kernel.org/all/20230322092118.9213-1-paul@crapouillou.net/
> 
> ---
> Changelog:
> - [3/8]: Replace V3's dmaengine_prep_slave_dma_array() with a new
>   dmaengine_prep_slave_dma_vec(), which uses a new 'dma_vec' struct.
>   Note that at some point we will need to support cyclic transfers
>   using dmaengine_prep_slave_dma_vec(). Maybe with a new "flags"
>   parameter to the function?
> 
> - [4/8]: Implement .device_prep_slave_dma_vec() instead of V3's
>   .device_prep_slave_dma_array().
> 
>   @Vinod: this patch will cause a small conflict with my other
>   patchset adding scatter-gather support to the axi-dmac driver.
>   This patch adds a call to axi_dmac_alloc_desc(num_sgs), but the
>   prototype of this function changed in my other patchset - it would
>   have to be passed the "chan" variable. I don't know how you prefer it
>   to be resolved. Worst case scenario (and if @Jonathan is okay with
>   that) this one patch can be re-sent later, but it would make this
>   patchset less "atomic".
> 
> - [5/8]:
>   - Use dev_err() instead of pr_err()
>   - Inline to_iio_dma_fence()
>   - Add comment to explain why we unref twice when detaching dmabuf
>   - Remove TODO comment. It is actually safe to free the file's
>     private data even when transfers are still pending because it
>     won't be accessed.
>   - Fix documentation of new fields in struct iio_buffer_access_funcs
>   - iio_dma_resv_lock() does not need to be exported, make it static
> 
> - [7/8]:
>   - Use the new dmaengine_prep_slave_dma_vec().
>   - Restrict to input buffers, since output buffers are not yet
>     supported by IIO buffers.
> 
> - [8/8]:
>   Use description lists for the documentation of the three new IOCTLs
>   instead of abusing subsections.
> 
> ---
> Alexandru Ardelean (1):
>   iio: buffer-dma: split iio_dma_buffer_fileio_free() function
> 
> Paul Cercueil (7):
>   iio: buffer-dma: Get rid of outgoing queue
>   dmaengine: Add API function dmaengine_prep_slave_dma_vec()
>   dmaengine: dma-axi-dmac: Implement device_prep_slave_dma_vec
>   iio: core: Add new DMABUF interface infrastructure
>   iio: buffer-dma: Enable support for DMABUFs
>   iio: buffer-dmaengine: Support new DMABUF based userspace API
>   Documentation: iio: Document high-speed DMABUF based API
> 
>  Documentation/iio/dmabuf_api.rst              |  54 +++
>  Documentation/iio/index.rst                   |   2 +
>  drivers/dma/dma-axi-dmac.c                    |  40 ++
>  drivers/iio/buffer/industrialio-buffer-dma.c  | 242 ++++++++---
>  .../buffer/industrialio-buffer-dmaengine.c    |  52 ++-
>  drivers/iio/industrialio-buffer.c             | 402 ++++++++++++++++++
>  include/linux/dmaengine.h                     |  25 ++
>  include/linux/iio/buffer-dma.h                |  33 +-
>  include/linux/iio/buffer_impl.h               |  26 ++
>  include/uapi/linux/iio/buffer.h               |  22 +
>  10 files changed, 836 insertions(+), 62 deletions(-)
>  create mode 100644 Documentation/iio/dmabuf_api.rst
> 

