Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB9F9103ED
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 14:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B77510E957;
	Thu, 20 Jun 2024 12:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="lqyoE7Lh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CA210E957
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1718886461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Phdke2IFP5DcYdJ0p7PW2PSRcousUzjTQIkIha9HQSc=;
 b=lqyoE7LhGfv+iomk4eTa9NEiOz1RYXGYKWnWtmg0TLRMwz3ZwT5U4Q1tiD3BbLWC7jd1gd
 wvR7Cn975V5ErvS3+B/VzBl9ndkSmmj8f4FUb3xv3z9aE/TKsnvtI/iW13i70tQlXiJFk3
 stFWt0d2tKtU1RCBJSvdUg2aBvZBX2s=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v12 0/7] iio: new DMABUF based API v12
Date: Thu, 20 Jun 2024 14:27:19 +0200
Message-ID: <20240620122726.41232-1-paul@crapouillou.net>
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

Here's the v12 of my patchset that introduces DMABUF support to IIO.

Apart from a small documentation fix, it reverts to using
mutex_lock/mutex_unlock in one particular place, which used cleanup
GOTOs (which don't play well with scope-managed cleanups).

Changelog:
- [3/7]:
    - Revert to mutex_lock/mutex_unlock in iio_buffer_attach_dmabuf(),
      as it uses cleanup GOTOs
- [6/7]:
    - "obtained using..." -> "which can be obtained using..."

This is based on next-20240619.

Cheers,
-Paul

Paul Cercueil (7):
  dmaengine: Add API function dmaengine_prep_peripheral_dma_vec()
  dmaengine: dma-axi-dmac: Implement device_prep_peripheral_dma_vec
  iio: core: Add new DMABUF interface infrastructure
  iio: buffer-dma: Enable support for DMABUFs
  iio: buffer-dmaengine: Support new DMABUF based userspace API
  Documentation: iio: Document high-speed DMABUF based API
  Documentation: dmaengine: Document new dma_vec API

 Documentation/driver-api/dmaengine/client.rst |   9 +
 .../driver-api/dmaengine/provider.rst         |  10 +
 Documentation/iio/iio_dmabuf_api.rst          |  54 +++
 Documentation/iio/index.rst                   |   1 +
 drivers/dma/dma-axi-dmac.c                    |  40 ++
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/buffer/industrialio-buffer-dma.c  | 178 ++++++-
 .../buffer/industrialio-buffer-dmaengine.c    |  62 ++-
 drivers/iio/industrialio-buffer.c             | 459 ++++++++++++++++++
 include/linux/dmaengine.h                     |  33 ++
 include/linux/iio/buffer-dma.h                |  31 ++
 include/linux/iio/buffer_impl.h               |  33 ++
 include/uapi/linux/iio/buffer.h               |  22 +
 13 files changed, 913 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/iio/iio_dmabuf_api.rst

-- 
2.43.0

