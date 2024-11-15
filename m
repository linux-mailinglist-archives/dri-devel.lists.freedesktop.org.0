Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5779CDE48
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 13:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1974810E858;
	Fri, 15 Nov 2024 12:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="TvhwZEUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA9E10E859
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 12:33:45 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1731674023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lFm/QsqGtNpOQ5SfKjk7QqN4kTAcwma8p9hnqSEIdIw=;
 b=TvhwZEUdErRZSOAllia1psVl6aQXD4WEscpoQXA5ebV9ZcfBj5NHRKWvdRc428Wc4268bW
 9OB95aE1FjavmQYR3MdwO/a4JiQswaPBDKdZJte4MA3tdBXJD475cvi3oQRNLz90qhDjPD
 TOq2mPpmMQOBaWL45IFaIBe2qZqMOdQ=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3 1/3] drm/etnaviv: Drop the offset in page manipulation
Date: Fri, 15 Nov 2024 20:32:44 +0800
Message-Id: <20241115123246.111346-2-sui.jingfeng@linux.dev>
In-Reply-To: <20241115123246.111346-1-sui.jingfeng@linux.dev>
References: <20241115123246.111346-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The etnaviv driver, both kernel space and user space, assumes that GPU page
size is 4KiB. Its IOMMU map/unmap 4KiB physical address range once a time.
If 'sg->offset != 0' is true, then the current implementation will map the
IOVA to a wrong area, which may lead to coherency problem. Picture 0 and 1
give the illustration, see below.

  PA start drifted
  |
  |<--- 'sg_dma_address(sg) - sg->offset'
  |               .------ sg_dma_address(sg)
  |              |  .---- sg_dma_len(sg)
  |<-sg->offset->|  |
  V              |<-->|    Another one cpu page
  +----+----+----+----+   +----+----+----+----+
  |xxxx|         ||||||   |||||||||||||||||||||
  +----+----+----+----+   +----+----+----+----+
  ^                   ^   ^                   ^
  |<---   da_len  --->|   |                   |
  |                   |   |                   |
  |    .--------------'   |                   |
  |    | .----------------'                   |
  |    | |                   .----------------'
  |    | |                   |
  |    | +----+----+----+----+
  |    | |||||||||||||||||||||
  |    | +----+----+----+----+
  |    |
  |    '--------------.  da_len = sg_dma_len(sg) + sg->offset, using
  |                   |  'sg_dma_len(sg) + sg->offset' will lead to GPUVA
  +----+ ~~~~~~~~~~~~~+  collision, but min_t(unsigned int, da_len, va_len)
  |xxxx|              |  will clamp it to correct size. But the IOVA will
  +----+ ~~~~~~~~~~~~~+  be redirect to wrong area.
  ^
  |             Picture 0: Possibly wrong implementation.
GPUVA (IOVA)

--------------------------------------------------------------------------

                 .------- sg_dma_address(sg)
                 |  .---- sg_dma_len(sg)
  |<-sg->offset->|  |
  |              |<-->|    another one cpu page
  +----+----+----+----+   +----+----+----+----+
  |              ||||||   |||||||||||||||||||||
  +----+----+----+----+   +----+----+----+----+
                 ^    ^   ^                   ^
                 |    |   |                   |
  .--------------'    |   |                   |
  |                   |   |                   |
  |    .--------------'   |                   |
  |    | .----------------'                   |
  |    | |                   .----------------'
  |    | |                   |
  +----+ +----+----+----+----+
  |||||| ||||||||||||||||||||| The first one is SZ_4K, the second is SZ_16K
  +----+ +----+----+----+----+
  ^
  |           Picture 1: Perfectly correct implementation.
GPUVA (IOVA)

If sg->offset != 0 is true, IOVA will be mapped to wrong physical address.
Either because there doesn't contain the data or there contains wrong data.
Strictly speaking, the memory area that before sg_dma_address(sg) doesn't
belong to us, and it's likely that the area is being used by other process.

Because we don't want to introduce confusions about which part is visible
to the GPU, we assumes that the size of GPUVA is always 4KiB aligned. This
is very relaxed requirement, since we already made the decision that GPU
page size is 4KiB (as a canonical decision). And softpin feature is landed,
Mesa's util_vma_heap_alloc() will certainly report correct length of GPUVA
to kernel with desired alignment ensured.

With above statements agreed, drop the "offset in page" manipulation will
return us a correct implementation at any case.

Fixes: a8c21a5451d8 ("drm/etnaviv: add initial etnaviv DRM driver")
Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 7e065b3723cf..c786df840a18 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -82,8 +82,8 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context,
 		return -EINVAL;
 
 	for_each_sgtable_dma_sg(sgt, sg, i) {
-		phys_addr_t pa = sg_dma_address(sg) - sg->offset;
-		unsigned int da_len = sg_dma_len(sg) + sg->offset;
+		phys_addr_t pa = sg_dma_address(sg);
+		unsigned int da_len = sg_dma_len(sg);
 		unsigned int bytes = min_t(unsigned int, da_len, va_len);
 
 		VERB("map[%d]: %08x %pap(%x)", i, iova, &pa, bytes);
-- 
2.34.1

