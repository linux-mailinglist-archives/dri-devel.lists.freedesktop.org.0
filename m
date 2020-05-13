Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5C1D121C
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 14:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9686EA06;
	Wed, 13 May 2020 12:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E504C6EA06
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 12:01:38 +0000 (UTC)
IronPort-SDR: brctgZTSJ3k6ojou1/5yWMujHik6jj1UFNe/6cBGmnR0nThobCWQLDlrhfUcRsRSL2AWtz59/W
 +INwf2Dph0jg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 05:01:38 -0700
IronPort-SDR: SyXMo6HzRErgjS7rZ6n20RSqoIxXtM4P355JyqBbBnl2WxpDV8mhuNwxOaPESGjZivOTW0tBGN
 OvBMF+lTzKSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,387,1583222400"; d="scan'208";a="287005321"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga004.fm.intel.com with ESMTP; 13 May 2020 05:01:38 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 13 May 2020 05:01:38 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.60]) by
 FMSMSX119.amr.corp.intel.com ([169.254.14.63]) with mapi id 14.03.0439.000;
 Wed, 13 May 2020 05:01:38 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist wrappers
Thread-Topic: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist
 wrappers
Thread-Index: AQHWKDwP0fqa3BxGckm0EsGy+4sAaqikud8QgACkUACAAIvJEA==
Date: Wed, 13 May 2020 12:01:37 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010E211B19@FMSMSX108.amr.corp.intel.com>
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090130eucas1p2eb86c5d34be56bbc81032bc0b6927d1e@eucas1p2.samsung.com>
 <20200512090058.14910-38-m.szyprowski@samsung.com>
 <14063C7AD467DE4B82DEDB5C278E8663010E210FAC@FMSMSX108.amr.corp.intel.com>
 <f6242137-82a5-0e33-f1a2-9e73dc679aa9@samsung.com>
In-Reply-To: <f6242137-82a5-0e33-f1a2-9e73dc679aa9@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
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
Cc: Pawel Osciak <pawel@osciak.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Marek Szyprowski <m.szyprowski@samsung.com>
>Sent: Tuesday, May 12, 2020 4:34 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>; dri-
>devel@lists.freedesktop.org; iommu@lists.linux-foundation.org; linaro-mm-
>sig@lists.linaro.org; linux-kernel@vger.kernel.org
>Cc: Pawel Osciak <pawel@osciak.com>; Bartlomiej Zolnierkiewicz
><b.zolnierkie@samsung.com>; David Airlie <airlied@linux.ie>; linux-
>media@vger.kernel.org; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Mauro
>Carvalho Chehab <mchehab@kernel.org>; Robin Murphy
><robin.murphy@arm.com>; Christoph Hellwig <hch@lst.de>; linux-arm-
>kernel@lists.infradead.org
>Subject: Re: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist
>wrappers
>
>Hi Michael,
>
>On 12.05.2020 19:52, Ruhl, Michael J wrote:
>>> -----Original Message-----
>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>> Marek Szyprowski
>>> Sent: Tuesday, May 12, 2020 5:01 AM
>>> To: dri-devel@lists.freedesktop.org; iommu@lists.linux-foundation.org;
>>> linaro-mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org
>>> Cc: Pawel Osciak <pawel@osciak.com>; Bartlomiej Zolnierkiewicz
>>> <b.zolnierkie@samsung.com>; David Airlie <airlied@linux.ie>; linux-
>>> media@vger.kernel.org; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Mauro
>>> Carvalho Chehab <mchehab@kernel.org>; Robin Murphy
>>> <robin.murphy@arm.com>; Christoph Hellwig <hch@lst.de>; linux-arm-
>>> kernel@lists.infradead.org; Marek Szyprowski
>>> <m.szyprowski@samsung.com>
>>> Subject: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist
>wrappers
>>>
>>> Use recently introduced common wrappers operating directly on the struct
>>> sg_table objects and scatterlist page iterators to make the code a bit
>>> more compact, robust, easier to follow and copy/paste safe.
>>>
>>> No functional change, because the code already properly did all the
>>> scaterlist related calls.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>> For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
>>> vs. orig_nents misuse' thread:
>>> https://lore.kernel.org/dri-devel/20200512085710.14688-1-
>>> m.szyprowski@samsung.com/T/
>>> ---
>>> .../media/common/videobuf2/videobuf2-dma-contig.c  | 41 ++++++++++-
>---
>>> --------
>>> drivers/media/common/videobuf2/videobuf2-dma-sg.c  | 32 +++++++-----
>---
>>> --
>>> drivers/media/common/videobuf2/videobuf2-vmalloc.c | 12 +++----
>>> 3 files changed, 34 insertions(+), 51 deletions(-)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>>> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>>> index d3a3ee5..bf31a9d 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>>> @@ -48,16 +48,15 @@ struct vb2_dc_buf {
>>>
>>> static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
>>> {
>>> -	struct scatterlist *s;
>>> 	dma_addr_t expected = sg_dma_address(sgt->sgl);
>>> -	unsigned int i;
>>> +	struct sg_dma_page_iter dma_iter;
>>> 	unsigned long size = 0;
>>>
>>> -	for_each_sg(sgt->sgl, s, sgt->nents, i) {
>>> -		if (sg_dma_address(s) != expected)
>>> +	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
>>> +		if (sg_page_iter_dma_address(&dma_iter) != expected)
>>> 			break;
>>> -		expected = sg_dma_address(s) + sg_dma_len(s);
>>> -		size += sg_dma_len(s);
>>> +		expected += PAGE_SIZE;
>>> +		size += PAGE_SIZE;
>> This code in drm_prime_t_contiguous_size and here.  I seem to remember
>seeing
>> the same pattern in other drivers.
>>
>> Would it worthwhile to make this a helper as well?
>I think I've identified such patterns in all DRM drivers and replaced
>with a common helper. So far I have no idea where to put such helper to
>make it available for media/videobuf2, so those a few lines are indeed
>duplicated here.

I was thinking of drivers outside of DRM/media.  Specifically RDMA.

However, looking at that code, I see that my memory was a little off.
It is working with continuous pages,  but not finding the size.

>> Also, isn't the sg_dma_len() the actual length of the chunk we are looking
>at?
>>
>> If its I not PAGE_SIZE (ie. dma chunk is 4 * PAGE_SIZE?), does your
>loop/calculation still work?
>
>scaterlist page iterators (for_each_sg_page/for_each_sg_dma_page and
>their sgtable variants) always operates on PAGE_SIZE units. They
>correctly handle larger sg_dma_len().

Ahh, ok, I see. 

Thank you!

Mike

>
>Best regards
>--
>Marek Szyprowski, PhD
>Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
