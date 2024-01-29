Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB696840CB7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 18:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9000A1129FF;
	Mon, 29 Jan 2024 17:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DDB1129EF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 17:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1706547735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UdxfhIPu1xHyG67FyRRevHrBT0ztFFCyHigeaYJvTDo=;
 b=W7+npEzBgGM0o8a7SHbyU6mF3GylmXNJJ8kTUn9FVMtH+5ggUp+e/cbweUryu9H+W0+PAQ
 vK3qpWhsITPG6Q2GGBsAqGuwNH5jUndpZvhfHmvkdsptWaGZeOtIbzmscoFvxEiMarHjXZ
 uS1DTilxDYGxydi6FIx+OKkDnE9pGaQ=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v6 0/6] iio: new DMABUF based API, v6
Date: Mon, 29 Jan 2024 18:01:55 +0100
Message-ID: <20240129170201.133785-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, Nuno Sa <nuno.sa@analog.com>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel@ffwll.ch>,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

This is the v6 of my patchset that introduces a new interface based on
DMABUF objects.

The code was updated quite a bit, using the feedback on the list for
this patchset but also the feedback I received on the FunctionFS
patchset that I'm working on upstreaming in parallel [1] where the
DMABUF handling code is very similar.

See below for the full changelog.

I decided to drop the scope-based memory management for dma_buf and
I hope you are OK with that. Christian wants the patch(es) to support
scope-based memory management in dma-buf as a separate patchset; once
it's in, I will gladly send a follow-up patch to use __free() where it
makes sense.

For performance numbers, I'll point you to the cover letter for my v5
patchset [2].

This patchset was based on next-20240129.

Cheers,
-Paul

[1] https://lore.kernel.org/all/20230322092118.9213-1-paul@crapouillou.net/
[2] https://lore.kernel.org/linux-iio/219abc43b4fdd4a13b307ed2efaa0e6869e68e3f.camel@gmail.com/T/

---

Changelog:
* [2/6]:
    - Use new prototype for axi_dmac_alloc_desc() as it changed upstream
* [3/6]:
    - Remove dead code in iio_dma_resv_lock()
    - Fix non-block actually blocking
    - Cache dma_buf_attachment instead of mapping/unmapping it for every
      transfer
    - Return -EINVAL instead of IIO_IOCTL_UNHANDLED for unknown ioctl
    - Make .block_enqueue() callback take a dma_fence pointer, which
      will be passed to iio_buffer_signal_dmabuf_done() instead of the
      dma_buf_attachment; and remove the backpointer from the priv
      structure to the dma_fence.
    - Use dma_fence_begin/end_signalling in the dma_fence critical
      sections
    - Unref dma_fence and dma_buf_attachment in worker, because they
      might try to lock the dma_resv, which would deadlock.
    - Add buffer ops to lock/unlock the queue. This is motivated by the
      fact that once the dma_fence has been installed, we cannot lock
      anything anymore - so the queue must be locked before the
      dma_fence is installed.
    - Use 'long retl' variable to handle the return value of
      dma_resv_wait_timeout()
    - Protect dmabufs list access with a mutex
    - Rework iio_buffer_find_attachment() to use the internal dmabufs
      list, instead of messing with dmabufs private data.
    - Add an atomically-increasing sequence number for fences
* [4/6]:
    - Update iio_dma_buffer_enqueue_dmabuf() to take a dma_fence pointer
    - Pass that dma_fence pointer along to
      iio_buffer_signal_dmabuf_done()
    - Add iio_dma_buffer_lock_queue() / iio_dma_buffer_unlock_queue()
    - Do not lock the queue in iio_dma_buffer_enqueue_dmabuf().
      The caller will ensure that it has been locked already.
    - Replace "int += bool;" by "if (bool) int++;"
    - Use dma_fence_begin/end_signalling in the dma_fence critical
      sections
    - Use one "num_dmabufs" fields instead of one "num_blocks" and one
      "num_fileio_blocks". Make it an atomic_t, which makes it possible
      to decrement it atomically in iio_buffer_block_release() without
      having to lock the queue mutex; and in turn, it means that we
      don't need to use iio_buffer_block_put_atomic() everywhere to
      avoid locking the queue mutex twice.
    - Use cleanup.h guard(mutex) when possible
    - Explicitely list all states in the switch in
      iio_dma_can_enqueue_block()
    - Rename iio_dma_buffer_fileio_mode() to
      iio_dma_buffer_can_use_fileio(), and add a comment explaining why
      it cannot race vs. DMABUF.
* [5/6]:
    - Populate .lock_queue / .unlock_queue callbacks
    - Switch to atomic memory allocations in .submit_queue, because of
      the dma_fence critical section
    - Make sure that the size of the scatterlist is enough

---
Paul Cercueil (6):
  dmaengine: Add API function dmaengine_prep_slave_dma_vec()
  dmaengine: dma-axi-dmac: Implement device_prep_slave_dma_vec
  iio: core: Add new DMABUF interface infrastructure
  iio: buffer-dma: Enable support for DMABUFs
  iio: buffer-dmaengine: Support new DMABUF based userspace API
  Documentation: iio: Document high-speed DMABUF based API

 Documentation/iio/dmabuf_api.rst              |  54 ++
 Documentation/iio/index.rst                   |   2 +
 drivers/dma/dma-axi-dmac.c                    |  40 ++
 drivers/iio/buffer/industrialio-buffer-dma.c  | 181 ++++++-
 .../buffer/industrialio-buffer-dmaengine.c    |  58 ++-
 drivers/iio/industrialio-buffer.c             | 462 ++++++++++++++++++
 include/linux/dmaengine.h                     |  25 +
 include/linux/iio/buffer-dma.h                |  31 ++
 include/linux/iio/buffer_impl.h               |  33 ++
 include/uapi/linux/iio/buffer.h               |  22 +
 10 files changed, 891 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/iio/dmabuf_api.rst

-- 
2.43.0

