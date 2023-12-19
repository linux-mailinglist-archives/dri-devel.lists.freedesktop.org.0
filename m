Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCEA818EA4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5210E1C0;
	Tue, 19 Dec 2023 17:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B95C10E1C0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1703008217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SK9r6ActBbVI7JmxJxB9/f1Wk6ldMAYEi/nXDD76/K8=;
 b=vKxd0mDER3E17EJHTjfM376dxZomAhbTBmns+cOFodlt8SZ/BDU0yhuRTOPuHlCxXLfov6
 Tu0kqAZl3Jaw/NVacNpjH0ReNA2cMa4OOeaKASwaryuOe40i7e7C9mOcyeHjBAF4eLMoFZ
 XbWSN+xPO5B/2UKyxm9k1KNbvE/OQYM=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v5 0/8] iio: new DMABUF based API, v5
Date: Tue, 19 Dec 2023 18:50:01 +0100
Message-ID: <20231219175009.65482-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[V4 was: "iio: Add buffer write() support"][1]

Hi Jonathan,

This is a respin of the V3 of my patchset that introduced a new
interface based on DMABUF objects [2].

The V4 was a split of the patchset, to attempt to upstream buffer
write() support first. But since there is no current user upstream, it
was not merged. This V5 is about doing the opposite, and contains the
new DMABUF interface, without adding the buffer write() support. It can
already be used with the upstream adi-axi-adc driver.

In user-space, Libiio uses it to transfer back and forth blocks of
samples between the hardware and the applications, without having to
copy the data.

On a ZCU102 with a FMComms3 daughter board, running Libiio from the
pcercuei/dev-new-dmabuf-api branch [3], compiled with
WITH_LOCAL_DMABUF_API=OFF (so that it uses fileio):
  sudo utils/iio_rwdev -b 4096 -B cf-ad9361-lpc
  Throughput: 116 MiB/s

Same hardware, with the DMABUF API (WITH_LOCAL_DMABUF_API=ON):
  sudo utils/iio_rwdev -b 4096 -B cf-ad9361-lpc
  Throughput: 475 MiB/s

This benchmark only measures the speed at which the data can be fetched
to iio_rwdev's internal buffers, and does not actually try to read the
data (e.g. to pipe it to stdout). It shows that fetching the data is
more than 4x faster using the new interface.

When actually reading the data, the performance difference isn't that
impressive (maybe because in case of DMABUF the data is not in cache):

WITH_LOCAL_DMABUF_API=OFF (so that it uses fileio):
  sudo utils/iio_rwdev -b 4096 cf-ad9361-lpc | dd of=/dev/zero status=progress
  2446422528 bytes (2.4 GB, 2.3 GiB) copied, 22 s, 111 MB/s

WITH_LOCAL_DMABUF_API=ON:
  sudo utils/iio_rwdev -b 4096 cf-ad9361-lpc | dd of=/dev/zero status=progress
  2334388736 bytes (2.3 GB, 2.2 GiB) copied, 21 s, 114 MB/s

One interesting thing to note is that fileio is (currently) actually
faster than the DMABUF interface if you increase a lot the buffer size.
My explanation is that the cache invalidation routine takes more and
more time the bigger the DMABUF gets. This is because the DMABUF is
backed by small-size pages, so a (e.g.) 64 MiB DMABUF is backed by up
to 16 thousands pages, that have to be invalidated one by one. This can
be addressed by using huge pages, but the udmabuf driver does not (yet)
support creating DMABUFs backed by huge pages.

Anyway, the real benefits happen when the DMABUFs are either shared
between IIO devices, or between the IIO subsystem and another
filesystem. In that case, the DMABUFs are simply passed around drivers,
without the data being copied at any moment.

We use that feature to transfer samples from our transceivers to USB,
using a DMABUF interface to FunctionFS [4].

This drastically increases the throughput, to about 274 MiB/s over a
USB3 link, vs. 127 MiB/s using IIO's fileio interface + write() to the
FunctionFS endpoints, for a lower CPU usage (0.85 vs. 0.65 load avg.).

Based on linux-next/next-20231219.

Cheers,
-Paul

[1] https://lore.kernel.org/all/20230807112113.47157-1-paul@crapouillou.net/
[2] https://lore.kernel.org/all/20230403154800.215924-1-paul@crapouillou.net/
[3] https://github.com/analogdevicesinc/libiio/tree/pcercuei/dev-new-dmabuf-api
[4] https://lore.kernel.org/all/20230322092118.9213-1-paul@crapouillou.net/

---
Changelog:
- [3/8]: Replace V3's dmaengine_prep_slave_dma_array() with a new
  dmaengine_prep_slave_dma_vec(), which uses a new 'dma_vec' struct.
  Note that at some point we will need to support cyclic transfers
  using dmaengine_prep_slave_dma_vec(). Maybe with a new "flags"
  parameter to the function?

- [4/8]: Implement .device_prep_slave_dma_vec() instead of V3's
  .device_prep_slave_dma_array().

  @Vinod: this patch will cause a small conflict with my other
  patchset adding scatter-gather support to the axi-dmac driver.
  This patch adds a call to axi_dmac_alloc_desc(num_sgs), but the
  prototype of this function changed in my other patchset - it would
  have to be passed the "chan" variable. I don't know how you prefer it
  to be resolved. Worst case scenario (and if @Jonathan is okay with
  that) this one patch can be re-sent later, but it would make this
  patchset less "atomic".

- [5/8]:
  - Use dev_err() instead of pr_err()
  - Inline to_iio_dma_fence()
  - Add comment to explain why we unref twice when detaching dmabuf
  - Remove TODO comment. It is actually safe to free the file's
    private data even when transfers are still pending because it
    won't be accessed.
  - Fix documentation of new fields in struct iio_buffer_access_funcs
  - iio_dma_resv_lock() does not need to be exported, make it static

- [7/8]:
  - Use the new dmaengine_prep_slave_dma_vec().
  - Restrict to input buffers, since output buffers are not yet
    supported by IIO buffers.

- [8/8]:
  Use description lists for the documentation of the three new IOCTLs
  instead of abusing subsections.

---
Alexandru Ardelean (1):
  iio: buffer-dma: split iio_dma_buffer_fileio_free() function

Paul Cercueil (7):
  iio: buffer-dma: Get rid of outgoing queue
  dmaengine: Add API function dmaengine_prep_slave_dma_vec()
  dmaengine: dma-axi-dmac: Implement device_prep_slave_dma_vec
  iio: core: Add new DMABUF interface infrastructure
  iio: buffer-dma: Enable support for DMABUFs
  iio: buffer-dmaengine: Support new DMABUF based userspace API
  Documentation: iio: Document high-speed DMABUF based API

 Documentation/iio/dmabuf_api.rst              |  54 +++
 Documentation/iio/index.rst                   |   2 +
 drivers/dma/dma-axi-dmac.c                    |  40 ++
 drivers/iio/buffer/industrialio-buffer-dma.c  | 242 ++++++++---
 .../buffer/industrialio-buffer-dmaengine.c    |  52 ++-
 drivers/iio/industrialio-buffer.c             | 402 ++++++++++++++++++
 include/linux/dmaengine.h                     |  25 ++
 include/linux/iio/buffer-dma.h                |  33 +-
 include/linux/iio/buffer_impl.h               |  26 ++
 include/uapi/linux/iio/buffer.h               |  22 +
 10 files changed, 836 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/iio/dmabuf_api.rst

-- 
2.43.0

