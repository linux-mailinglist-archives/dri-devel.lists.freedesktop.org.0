Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236D4AACACB
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 18:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0498510E700;
	Tue,  6 May 2025 16:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="fwDG+IVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9147D10E700
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 16:22:21 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250506161422euoutp01a6dd37708928f2dbb6b6c917ceaa5068~8-DWBtOAN0659306593euoutp01T
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 16:14:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250506161422euoutp01a6dd37708928f2dbb6b6c917ceaa5068~8-DWBtOAN0659306593euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1746548062;
 bh=OE2cRkTkOYpXuv15aHxMbiUvH5dQCxlOg8WtuJAV98g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fwDG+IVOUQuksj/nnZ5kfvb8hJFr3/FJGwAi5D1Yy0RZ18P29wk5DM4ph/mU3B6ac
 sMHCyuo4Jn0Zneq/ulIIwoSIK1jmEreJXmrbsM9DOz1j9Co62dSZnsoRbet5eIlvHE
 aK1e85TSHOGvWns7zeVnENHS3Lm24S9VgwuuA9Uc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de~8-DVkn8Am1862718627eucas1p1v;
 Tue,  6 May 2025 16:14:21 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250506161421eusmtip2f63d10d07d7f41de33bdffeecaa72288~8-DVEAWPM0367703677eusmtip2C;
 Tue,  6 May 2025 16:14:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Gurchetan Singh <gurchetansingh@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 2/3] udmabuf: use sgtable-based scatterlist wrappers
Date: Tue,  6 May 2025 18:13:45 +0200
Message-Id: <20250506161346.1211105-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506161346.1211105-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de
X-EPHeader: CA
X-CMS-RootMailID: 20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de
References: <20250506161346.1211105-1-m.szyprowski@samsung.com>
 <CGME20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de@eucas1p1.samsung.com>
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

Use common wrappers operating directly on the struct sg_table objects to
fix incorrect use of statterlists sync calls. dma_sync_sg_for_*()
functions have to be called with the number of elements originally passed
to dma_map_sg_*() function, not the one returned in sgtable's nents.

Fixes: 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/dma-buf/udmabuf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 7eee3eb47a8e..c9d0c68d2fcb 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -264,8 +264,7 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 			ubuf->sg = NULL;
 		}
 	} else {
-		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
-				    direction);
+		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
 	}
 
 	return ret;
@@ -280,7 +279,7 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
 	if (!ubuf->sg)
 		return -EINVAL;
 
-	dma_sync_sg_for_device(dev, ubuf->sg->sgl, ubuf->sg->nents, direction);
+	dma_sync_sgtable_for_device(dev, ubuf->sg, direction);
 	return 0;
 }
 
-- 
2.34.1

