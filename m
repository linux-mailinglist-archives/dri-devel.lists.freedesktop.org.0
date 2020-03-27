Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB8F195DAF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 19:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F4C6EA6F;
	Fri, 27 Mar 2020 18:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FC86EA6F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 18:31:43 +0000 (UTC)
IronPort-SDR: H7s3mXkbrmuXwRwz7L4Je9qa34ooqyJUvn/xa0XxVBoB0bm9I/Tk1gANDNAGttDQWs+VNMeRmN
 5pVO4kPPIBVA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 11:31:42 -0700
IronPort-SDR: cG8RjTzfhLi4jFGoL06K+0MCYrphuSQ6j6Otn7RFY/vjq3MDzwBD4xlE+JuyjrPphbmASo3WnQ
 K0rGnG1d3UGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; d="scan'208";a="247970686"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 27 Mar 2020 11:31:40 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 27 Mar 2020 11:31:40 -0700
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.38]) by
 FMSMSX154.amr.corp.intel.com ([169.254.6.41]) with mapi id 14.03.0439.000;
 Fri, 27 Mar 2020 11:31:40 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm/prime: fix extracting of the DMA addresses from
 a scatterlist
Thread-Topic: [PATCH v2] drm/prime: fix extracting of the DMA addresses from
 a scatterlist
Thread-Index: AQHWBFQRvRx+hOOiski5ycfWmHv7Tahcuvpg
Date: Fri, 27 Mar 2020 18:31:39 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663FFFBFCE1@fmsmsx107.amr.corp.intel.com>
References: <CGME20200327162330eucas1p1b0413e0e9887aa76d3048f86d2166dcd@eucas1p1.samsung.com>
 <20200327162126.29705-1-m.szyprowski@samsung.com>
In-Reply-To: <20200327162126.29705-1-m.szyprowski@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.108]
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
Cc: Bartlomiej
 Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>,
 Shane Francis <bigbeeshane@gmail.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Marek Szyprowski <m.szyprowski@samsung.com>
>Sent: Friday, March 27, 2020 12:21 PM
>To: dri-devel@lists.freedesktop.org; linux-samsung-soc@vger.kernel.org;
>linux-kernel@vger.kernel.org
>Cc: Marek Szyprowski <m.szyprowski@samsung.com>;
>stable@vger.kernel.org; Bartlomiej Zolnierkiewicz
><b.zolnierkie@samsung.com>; Maarten Lankhorst
><maarten.lankhorst@linux.intel.com>; Maxime Ripard
><mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
>David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Alex Deucher
><alexander.deucher@amd.com>; Shane Francis <bigbeeshane@gmail.com>;
>Ruhl, Michael J <michael.j.ruhl@intel.com>
>Subject: [PATCH v2] drm/prime: fix extracting of the DMA addresses from a
>scatterlist
>
>Scatterlist elements contains both pages and DMA addresses, but one
>should not assume 1:1 relation between them. The sg->length is the size
>of the physical memory chunk described by the sg->page, while
>sg_dma_len(sg) is the size of the DMA (IO virtual) chunk described by
>the sg_dma_address(sg).
>
>The proper way of extracting both: pages and DMA addresses of the whole
>buffer described by a scatterlist it to iterate independently over the
>sg->pages/sg->length and sg_dma_address(sg)/sg_dma_len(sg) entries.
>
>Fixes: 42e67b479eab ("drm/prime: use dma length macro when mapping sg")
>Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>---
> drivers/gpu/drm/drm_prime.c | 37 +++++++++++++++++++++++++-----------
>-
> 1 file changed, 25 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>index 1de2cde2277c..282774e469ac 100644
>--- a/drivers/gpu/drm/drm_prime.c
>+++ b/drivers/gpu/drm/drm_prime.c
>@@ -962,27 +962,40 @@ int drm_prime_sg_to_page_addr_arrays(struct
>sg_table *sgt, struct page **pages,
> 	unsigned count;
> 	struct scatterlist *sg;
> 	struct page *page;
>-	u32 len, index;
>+	u32 page_len, page_index;
> 	dma_addr_t addr;
>+	u32 dma_len, dma_index;
>
>-	index = 0;
>+	/*
>+	 * Scatterlist elements contains both pages and DMA addresses, but
>+	 * one shoud not assume 1:1 relation between them. The sg->length
>is
>+	 * the size of the physical memory chunk described by the sg->page,
>+	 * while sg_dma_len(sg) is the size of the DMA (IO virtual) chunk
>+	 * described by the sg_dma_address(sg).
>+	 */

Is there an example of what the scatterlist would look like in this case?

Does each SG entry always have the page and dma info? or could you have
entries that have page information only, and entries that have dma info only?

If the same entry has different size info (page_len = PAGE_SIZE,
dma_len = 4 * PAGE_SIZE?), are we guaranteed that the arrays (page and addrs) have
been sized correctly?

Just trying to get my head wrapped around this.

Thanks,

Mike

>+	page_index = 0;
>+	dma_index = 0;
> 	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
>-		len = sg_dma_len(sg);
>+		page_len = sg->length;
> 		page = sg_page(sg);
>+		dma_len = sg_dma_len(sg);
> 		addr = sg_dma_address(sg);
>
>-		while (len > 0) {
>-			if (WARN_ON(index >= max_entries))
>+		while (pages && page_len > 0) {
>+			if (WARN_ON(page_index >= max_entries))
> 				return -1;
>-			if (pages)
>-				pages[index] = page;
>-			if (addrs)
>-				addrs[index] = addr;
>-
>+			pages[page_index] = page;
> 			page++;
>+			page_len -= PAGE_SIZE;
>+			page_index++;
>+		}
>+		while (addrs && dma_len > 0) {
>+			if (WARN_ON(dma_index >= max_entries))
>+				return -1;
>+			addrs[dma_index] = addr;
> 			addr += PAGE_SIZE;
>-			len -= PAGE_SIZE;
>-			index++;
>+			dma_len -= PAGE_SIZE;
>+			dma_index++;
> 		}
> 	}
> 	return 0;
>--
>2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
