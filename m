Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D7AAE351
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 16:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DDA10E810;
	Wed,  7 May 2025 14:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="guZjK6sM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7E110E811
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 14:42:46 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250507144242euoutp02e09620485249c027dfb1c4b6559492c5~9Rcl06FX50433904339euoutp02e
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 14:42:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250507144242euoutp02e09620485249c027dfb1c4b6559492c5~9Rcl06FX50433904339euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1746628962;
 bh=DbGys0US7skwcuhdvdVwOVZSicDyfO1yb004QE26BKw=;
 h=From:To:Cc:Subject:Date:References:From;
 b=guZjK6sMfp3Due0zdoki94a/Dg56CJlCqj03/DvPwtpLQo3/Xya1JZ1n/zmT5mEIS
 7t4BjTrPEt1HLXZGXz6lFwhgJYwGIjXjQpkxuTcSlhABw38myQzDZFIyVLUQIwqQKo
 jjbzMLV514rdjP4BgIf/ih2wEXpfN8Y81dPqf7yY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250507144241eucas1p14542a410069bfe5bc010996ee74b9695~9RcldqLTR0872208722eucas1p1q;
 Wed,  7 May 2025 14:42:41 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250507144240eusmtip204f7fa06fe1ac4f0301c67cd939a4fd8~9RcktY56O2360223602eusmtip2f;
 Wed,  7 May 2025 14:42:40 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
 <tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Gurchetan
 Singh <gurchetansingh@chromium.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 0/3] media: fix incorrect use of dma_sync_sg_*() calls
Date: Wed,  7 May 2025 16:42:00 +0200
Message-Id: <20250507144203.2081756-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250507144241eucas1p14542a410069bfe5bc010996ee74b9695
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250507144241eucas1p14542a410069bfe5bc010996ee74b9695
X-EPHeader: CA
X-CMS-RootMailID: 20250507144241eucas1p14542a410069bfe5bc010996ee74b9695
References: <CGME20250507144241eucas1p14542a410069bfe5bc010996ee74b9695@eucas1p1.samsung.com>
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

Dear All,

This patchset fixes the incorrect use of dma_sync_sg_*() calls in
media and related drivers. They are replaced with much safer
dma_sync_sgtable_*() variants, which take care of passing the proper
number of elements for the sync operation.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Change log:
-v2: fixes typos and added cc: stable


Patch summary:

Marek Szyprowski (3):
  media: videobuf2: use sgtable-based scatterlist wrappers
  udmabuf: use sgtable-based scatterlist wrappers
  media: omap3isp: use sgtable-based scatterlist wrappers

 drivers/dma-buf/udmabuf.c                         | 5 ++---
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 4 ++--
 drivers/media/platform/ti/omap3isp/ispccdc.c      | 8 ++++----
 drivers/media/platform/ti/omap3isp/ispstat.c      | 6 ++----
 4 files changed, 10 insertions(+), 13 deletions(-)

-- 
2.34.1

