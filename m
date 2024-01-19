Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC71832B1C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 15:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A19E10EA31;
	Fri, 19 Jan 2024 14:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0414810EA19
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1705673650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FX6y2yjuW0nuJFiEqsV4ftraJscIV4V40Vy+XAQTjhI=;
 b=AZOYG5edVZIWA1BlCrUR1yaolBTzcIodYuTj1R0BojE/dH4mDiXy2R/lk6N0eIGpYjQRnM
 moRjihZ1MzvjxwroPPnCYYSyUbr+Q/3G8gPUFgTrqIdY8BEH1tinjcH5f3aUwn3o497Y5W
 cxzgdFEi3srEEHMggkSKv9wlfR3+Gjo=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 0/6] usb: gadget: functionfs: DMABUF import interface
Date: Fri, 19 Jan 2024 15:13:56 +0100
Message-ID: <20240119141402.44262-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v5 of my patchset that adds a new DMABUF import interface to
FunctionFS.

Daniel / Sima suggested that I should cache the dma_buf_attachment while
the DMABUF is attached to the interface, instead of mapping/unmapping
the DMABUF for every transfer (also because unmapping is not possible in
the dma_fence's critical section). This meant having to add new
dma_buf_begin_access() / dma_buf_end_access() functions that the driver
can call to ensure cache coherency. These two functions are provided by
the new patch [1/6], and an implementation for udmabuf was added in
[2/6] - see the changelog below.

This patchset was successfully tested with CONFIG_LOCKDEP, no errors
were reported in dmesg while using the interface.

This interface is being used at Analog Devices, to transfer data from
high-speed transceivers to USB in a zero-copy fashion, using also the
DMABUF import interface to the IIO subsystem which is being upstreamed
in parallel [1]. The two are used by the Libiio software [2].

On a ZCU102 board with a FMComms3 daughter board, using the combination
of these two new interfaces yields a drastic improvement of the
throughput, from about 127 MiB/s using IIO's buffer read/write interface
+ read/write to the FunctionFS endpoints, to about 274 MiB/s when
passing around DMABUFs, for a lower CPU usage (0.85 load avg. before,
vs. 0.65 after).

Right now, *technically* there are no users of this interface, as
Analog Devices wants to wait until both interfaces are accepted upstream
to merge the DMABUF code in Libiio into the main branch, and Jonathan
wants to wait and see if this patchset is accepted to greenlight the
DMABUF interface in IIO as well. I think this isn't really a problem;
once everybody is happy with its part of the cake, we can merge them all
at once.

This is obviously for 5.9, and based on next-20240119.

Changelog:

- [1/6]: New patch
- [2/6]: New patch
- [5/6]:
  - Cache the dma_buf_attachment while the DMABUF is attached.
  - Use dma_buf_begin/end_access() to ensure that the DMABUF data will be
    coherent to the hardware.
  - Remove comment about cache-management and dma_buf_unmap_attachment(),
    since we now use dma_buf_begin/end_access().
  - Select DMA_SHARED_BUFFER in Kconfig entry
  - Add Christian's ACK

Cheers,
-Paul

[1] https://lore.kernel.org/linux-iio/219abc43b4fdd4a13b307ed2efaa0e6869e68e3f.camel@gmail.com/T/
[2] https://github.com/analogdevicesinc/libiio/tree/pcercuei/dev-new-dmabuf-api

Paul Cercueil (6):
  dma-buf: Add dma_buf_{begin,end}_access()
  dma-buf: udmabuf: Implement .{begin,end}_access
  usb: gadget: Support already-mapped DMA SGs
  usb: gadget: functionfs: Factorize wait-for-endpoint code
  usb: gadget: functionfs: Add DMABUF import interface
  Documentation: usb: Document FunctionFS DMABUF API

 Documentation/usb/functionfs.rst    |  36 ++
 drivers/dma-buf/dma-buf.c           |  66 ++++
 drivers/dma-buf/udmabuf.c           |  27 ++
 drivers/usb/gadget/Kconfig          |   1 +
 drivers/usb/gadget/function/f_fs.c  | 502 ++++++++++++++++++++++++++--
 drivers/usb/gadget/udc/core.c       |   7 +-
 include/linux/dma-buf.h             |  37 ++
 include/linux/usb/gadget.h          |   2 +
 include/uapi/linux/usb/functionfs.h |  41 +++
 9 files changed, 698 insertions(+), 21 deletions(-)

-- 
2.43.0

