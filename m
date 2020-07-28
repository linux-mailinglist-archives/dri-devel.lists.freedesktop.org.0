Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EB7230EDC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 18:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C296E202;
	Tue, 28 Jul 2020 16:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C456E202
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 16:08:00 +0000 (UTC)
IronPort-SDR: M8IdoJY9/HSzCb7xdF1b9kKwfuz/qiiniPFkOIJJuAICg4mmuB3P7JFHDZf10wlOqZBDmA7rFI
 HmGuBFaNcVDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="236111470"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="236111470"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 09:07:58 -0700
IronPort-SDR: wP8OAodxBTrytv1fBeXeKHuKz4e9cBYZmCFsPyGE0olmRkfom5iKCaUQS9Kq48Fj52Qs7bLU+0
 cRo9sYhJ9oLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="273605829"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2020 09:07:59 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Jul 2020 09:07:58 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.75]) by
 FMSMSX151.amr.corp.intel.com ([169.254.7.35]) with mapi id 14.03.0439.000;
 Tue, 28 Jul 2020 09:07:52 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Dave Airlie <airlied@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] nouveau: use ttm populate mapping functions. (v2)
Thread-Topic: [PATCH] nouveau: use ttm populate mapping functions. (v2)
Thread-Index: AQHWZI7UpS1ey9WojkqxwunJ9pNPAqkdJn5g
Date: Tue, 28 Jul 2020 16:07:52 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E866301245EE4F7@FMSMSX108.amr.corp.intel.com>
References: <20200728032545.19878-1-airlied@gmail.com>
In-Reply-To: <20200728032545.19878-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
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
Cc: "bskeggs@redhat.com" <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Dave Airlie
>Sent: Monday, July 27, 2020 11:26 PM
>To: dri-devel@lists.freedesktop.org
>Cc: bskeggs@redhat.com
>Subject: [PATCH] nouveau: use ttm populate mapping functions. (v2)
>
>From: Dave Airlie <airlied@redhat.com>
>
>Instead of rolling driver copies of them.
>
>v2: cleanup return handling (Ben)
>Signed-off-by: Dave Airlie <airlied@redhat.com>
>---
> drivers/gpu/drm/nouveau/nouveau_bo.c | 38 ++--------------------------
> 1 file changed, 2 insertions(+), 36 deletions(-)
>
>diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
>b/drivers/gpu/drm/nouveau/nouveau_bo.c
>index 7806278dce57..6ef5085c9a91 100644
>--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>@@ -1231,8 +1231,6 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm,
>struct ttm_operation_ctx *ctx)
> 	struct ttm_dma_tt *ttm_dma = (void *)ttm;
> 	struct nouveau_drm *drm;
> 	struct device *dev;
>-	unsigned i;
>-	int r;
> 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
> 	if (ttm->state != tt_unpopulated)
>@@ -1260,31 +1258,7 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm,
>struct ttm_operation_ctx *ctx)
> 		return ttm_dma_populate((void *)ttm, dev, ctx);
> 	}
> #endif
>-
>-	r = ttm_pool_populate(ttm, ctx);
>-	if (r) {
>-		return r;
>-	}
>-
>-	for (i = 0; i < ttm->num_pages; i++) {
>-		dma_addr_t addr;
>-
>-		addr = dma_map_page(dev, ttm->pages[i], 0, PAGE_SIZE,
>-				    DMA_BIDIRECTIONAL);
>-
>-		if (dma_mapping_error(dev, addr)) {
>-			while (i--) {
>-				dma_unmap_page(dev, ttm_dma-
>>dma_address[i],
>-					       PAGE_SIZE,
>DMA_BIDIRECTIONAL);
>-				ttm_dma->dma_address[i] = 0;
>-			}
>-			ttm_pool_unpopulate(ttm);
>-			return -EFAULT;
>-		}
>-
>-		ttm_dma->dma_address[i] = addr;
>-	}
>-	return 0;
>+	return ttm_populate_and_map_pages(dev, ttm_dma, ctx);

This is not a completely straight code replacement.

ttm_populate_and_map_pages() also has code to deal with pages that are
contiguous (consolidates them).

Is it possible that the nouveau HW can't handle a contiguous buffer larger
than PAG_SIZE?

Thanks,

Mike

> }
>
> static void
>@@ -1293,7 +1267,6 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
> 	struct ttm_dma_tt *ttm_dma = (void *)ttm;
> 	struct nouveau_drm *drm;
> 	struct device *dev;
>-	unsigned i;
> 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
> 	if (slave)
>@@ -1316,14 +1289,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
> 	}
> #endif
>
>-	for (i = 0; i < ttm->num_pages; i++) {
>-		if (ttm_dma->dma_address[i]) {
>-			dma_unmap_page(dev, ttm_dma->dma_address[i],
>PAGE_SIZE,
>-				       DMA_BIDIRECTIONAL);
>-		}
>-	}
>-
>-	ttm_pool_unpopulate(ttm);
>+	ttm_unmap_and_unpopulate_pages(dev, ttm_dma);
> }
>
> void
>--
>2.26.2
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
