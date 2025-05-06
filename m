Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B392FAACAC9
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 18:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052CA10E6FF;
	Tue,  6 May 2025 16:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="bOgubCQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 477 seconds by postgrey-1.36 at gabe;
 Tue, 06 May 2025 16:22:21 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7E410E6FF
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 16:22:21 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250506161421euoutp018b55fa3fc674d406ffe1884a38f22334~8-DVCL7Q70985909859euoutp01H
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 16:14:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250506161421euoutp018b55fa3fc674d406ffe1884a38f22334~8-DVCL7Q70985909859euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1746548061;
 bh=LhEIDzPK3RvKZEBceRbDdfPrXJegfKev0Ozuz3A9Xts=;
 h=From:To:Cc:Subject:Date:References:From;
 b=bOgubCQlk4q1/5f9MyQ2fGda6DFAh5WYUl9it+MLvZW7TzWMuhe9jqKaUK1z/iiUw
 KySWiEiwQz4tRc0V3fOpOerQd9szInIB2lwrvh8rAujQVSmHmjqu1J9mWLToIrPti4
 mEvXwkgUCqzMTPGy9aa5lUgiQw3XTS8m6oloaPRA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250506161420eucas1p1f3d602a916a1327d1583cb86fcd8280b~8-DUeWA2S0408504085eucas1p1C;
 Tue,  6 May 2025 16:14:20 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250506161419eusmtip26942da3e12a8e7b32708a6ec1b746d39~8-DTuYPA40137601376eusmtip2X;
 Tue,  6 May 2025 16:14:19 +0000 (GMT)
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
Subject: [PATCH 0/3] media: fix incorrect use of dma_sync_sg_*() calls
Date: Tue,  6 May 2025 18:13:43 +0200
Message-Id: <20250506161346.1211105-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250506161420eucas1p1f3d602a916a1327d1583cb86fcd8280b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250506161420eucas1p1f3d602a916a1327d1583cb86fcd8280b
X-EPHeader: CA
X-CMS-RootMailID: 20250506161420eucas1p1f3d602a916a1327d1583cb86fcd8280b
References: <CGME20250506161420eucas1p1f3d602a916a1327d1583cb86fcd8280b@eucas1p1.samsung.com>
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


Patch summary:

Marek Szyprowski (3):
  media: videobuf2: use sgtable-based scatterlist wrappers
  udmabuf: use sgtable-based scatterlist wrappers
  omap3isp:: use sgtable-based scatterlist wrappers

 drivers/dma-buf/udmabuf.c                         | 5 ++---
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 4 ++--
 drivers/media/platform/ti/omap3isp/ispccdc.c      | 8 ++++----
 drivers/media/platform/ti/omap3isp/ispstat.c      | 6 ++----
 4 files changed, 10 insertions(+), 13 deletions(-)

-- 
2.34.1

