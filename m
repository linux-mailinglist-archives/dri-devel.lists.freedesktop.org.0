Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1676B90A7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 11:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3480310E772;
	Tue, 14 Mar 2023 10:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85D210E771
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 10:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1678791191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lWG+KFc/Ei6/o+9Wu4zuAiJ8/qhoZmSrQx365/6Oshk=;
 b=fUjwl/GTGcJeOfWYXXFY58YwTQ3Vq4QMsk3coead00trx0lcSAqYvNHlYUHM1jjAik9aEC
 e41Tc9t2VdvlK6F3/9913vt7NWs9yRmfxb9QXk+Ap583R8pZEVWs7vkah6OnQY1EIdjzFM
 hnjvZbaZk1hiQncj6By5PKHHSAkrNaE=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 0/2] usb: gadget: functionfs: DMABUF import interface
Date: Tue, 14 Mar 2023 11:52:55 +0100
Message-Id: <20230314105257.17345-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, michael.hennerich@analog.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nuno.sa@analog.com,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This small patchset adds three new IOCTLs that can be used to attach,
detach, or transfer from/to a DMABUF object.

This was surprisingly easy to add, as the functionfs code only uses
scatterlists for transfers and allows specifying the number of bytes to
transfer. The bulk of the code is then for general DMABUF accounting.

The patchset isn't tagged RFC but comments are very welcome, there are
some things I am not 100% sure about: ffs_dma_resv_lock (with no
ww_acquire_ctx), and I'm using pr_debug which feels wrong. Also, I
should probably add documentation? The current IOCTLs for functionfs
were not documented, as far as I can tell.

We use it with DMABUFs created with udmabuf, that we attach to the
functionfs interface and to IIO devices (with a DMABUF interface for
IIO, on its way to upstream too), to transfer samples from high-speed
transceivers to USB in a zero-copy fashion.

Cheers,
-Paul


Paul Cercueil (2):
  usb: gadget: Support already-mapped DMA SGs
  usb: gadget: functionfs: Add DMABUF import interface

 drivers/usb/gadget/function/f_fs.c  | 398 ++++++++++++++++++++++++++++
 drivers/usb/gadget/udc/core.c       |   7 +-
 include/linux/usb/gadget.h          |   2 +
 include/uapi/linux/usb/functionfs.h |  14 +-
 4 files changed, 419 insertions(+), 2 deletions(-)

-- 
2.39.2

