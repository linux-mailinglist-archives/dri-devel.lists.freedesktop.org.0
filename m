Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB6F8FC9FD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 13:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF74010E316;
	Wed,  5 Jun 2024 11:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="fnNXiWCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 414 seconds by postgrey-1.36 at gabe;
 Wed, 05 Jun 2024 11:15:54 UTC
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962A710E316
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 11:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1717585738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lbF3Hr41nIth/kjABYAo6ELsT9zfo9W62/2gY+j3W6A=;
 b=fnNXiWCz+piHjs3cCFKX5GI5TCn9Y2prcen/ET7kh9pye5qm+pIgUBf/O3bV3BnNT1h/2u
 NyMwYH4qGWbWGr1IYazRbY6rtGSVJoiMLXi/3PHX/GFa4ahJSbYFIZ5go1Y3p1tTrpunF0
 gFAQsaj5oi/revV7EdeAexrsKXH2qHg=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v10 0/6] iio: new DMABUF based API v10
Date: Wed,  5 Jun 2024 13:08:39 +0200
Message-ID: <20240605110845.86740-1-paul@crapouillou.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Here is a revised (and hopefully final?) version of my DMABUF patchset.

This v10 removes the extra "flags" parameter of
dmaengine_prep_peripheral_dma_vec(), and adds kernel doc to the function
as Vinod requested.

As Nuno upstreamed support for output buffers, I (slightly) modified
patch 5/6 and now output buffers are supported with the DMABUF API.
All I did was remove a "fail if output" check really.

This was based on next-20240605.

Changelog:
- [1/6]:
  - Add kernel doc to dmaengine_prep_peripheral_dma_vec()
  - Remove extra flags parameter
- [2/6]:
  - Use the new function prototype (without the extra prep_flags).
- [5/6]:
  - Remove extra flags parameter to dmaengine_prep_peripheral_dma_vec()
  - Add support for TX transfers

Cheers,
-Paul

Paul Cercueil (6):
  dmaengine: Add API function dmaengine_prep_peripheral_dma_vec()
  dmaengine: dma-axi-dmac: Implement device_prep_peripheral_dma_vec
  iio: core: Add new DMABUF interface infrastructure
  iio: buffer-dma: Enable support for DMABUFs
  iio: buffer-dmaengine: Support new DMABUF based userspace API
  Documentation: iio: Document high-speed DMABUF based API

 Documentation/iio/iio_dmabuf_api.rst          |  54 ++
 Documentation/iio/index.rst                   |   1 +
 drivers/dma/dma-axi-dmac.c                    |  40 ++
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/buffer/industrialio-buffer-dma.c  | 180 ++++++-
 .../buffer/industrialio-buffer-dmaengine.c    |  62 ++-
 drivers/iio/industrialio-buffer.c             | 462 ++++++++++++++++++
 include/linux/dmaengine.h                     |  33 ++
 include/linux/iio/buffer-dma.h                |  31 ++
 include/linux/iio/buffer_impl.h               |  30 ++
 include/uapi/linux/iio/buffer.h               |  22 +
 11 files changed, 896 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/iio/iio_dmabuf_api.rst

-- 
2.43.0

