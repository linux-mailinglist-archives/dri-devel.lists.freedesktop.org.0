Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6261CFF4B
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 22:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578CE6E0AC;
	Tue, 12 May 2020 20:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8E76E97A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 20:33:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512203355euoutp021f600ca303b8ebfb793e9f14ece29d17~OYiZP7UDx2274122741euoutp02G
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 20:33:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200512203355euoutp021f600ca303b8ebfb793e9f14ece29d17~OYiZP7UDx2274122741euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589315635;
 bh=wnAc6t9J+MLeu4DXX/UMTG7FIxfuzBk4sujw+pbXYuI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=vFcP7z7iNFqcPY/EoZ5ceEWyjH1xwGyPTsFs44xdrk9/usQK/cCqb6wNTikhe/cz3
 VRuU1QMd4IzJN8gNMfXAO/FSr7WAEwp3UEQA958LHOtJuBsPdJUyXn7cor0p/GkEeY
 qrecZ9OJZgAZ759EqpgSB1rwj676W+1IKU9G/b1E=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200512203354eucas1p1ccad241d082e172806147e8051ca5cd5~OYiY_s_Nd1765817658eucas1p1P;
 Tue, 12 May 2020 20:33:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 59.BC.60679.2380BBE5; Tue, 12
 May 2020 21:33:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200512203354eucas1p1ec0713551239b5437374232a3558db8e~OYiYXwwvs1766317663eucas1p1P;
 Tue, 12 May 2020 20:33:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512203354eusmtrp29c5130625112f643794304998f69d654~OYiYXBRxv1599815998eusmtrp2e;
 Tue, 12 May 2020 20:33:54 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-4a-5ebb08320b1c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C1.CA.07950.2380BBE5; Tue, 12
 May 2020 21:33:54 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200512203353eusmtip24e27fc61e27b356e67372df3a9c99d61~OYiXny--L2981929819eusmtip2U;
 Tue, 12 May 2020 20:33:53 +0000 (GMT)
Subject: Re: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist wrappers
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f6242137-82a5-0e33-f1a2-9e73dc679aa9@samsung.com>
Date: Tue, 12 May 2020 22:33:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663010E210FAC@FMSMSX108.amr.corp.intel.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfyyUcRzu+773vveSs9fRfCax3cqWLUVt3k2MVdvbVqv80aaNOnmHdYfu
 TaoxJpOOykjpRpRWuejH3XGclu6K82NJkemHJP4hxjiWH5HzUv57nufzfPY8n+1D4dJpwoOK
 TzjHqRLkChnpKKptnu3YEUA1RO1qMQUw1zpaMeZF8TOC6Z4eJ5nKJ00Y8+FOn4gpbwxibN0D
 GKMb7CGYLlMJyeQ9ryGYh7oFjOk0+jI3x2bFjHliiAh1ZqvuViG24uUwxuq0V0nWOPODYPtz
 rRirf5DOfl0cxNnC3keIbficQbKDc8Mke92gReyUzottm54SH5WccNwbwyniz3OqnSGnHONs
 83lYUrbnheq+ESwD9burkQMF9B54YnlLqJEjJaUfIzCPvhELxIbgxuRTkUCmEEzO3EZrK9nW
 biQMHiH4dGUeE8g4glaDHre7XOljMJKlwe0DN7oZg/HK+pUUnK7CYWEhR2x3kbQ/qMfUpB1L
 6BBo1WZidiyit8FMftZK3iY6Etor9EjwuEDrnaHlUhTlQB+HUutWu4zT3mAcK8EF7A5fhspW
 GgF9j4Lq0pbV3vvhVV0lLmBXGLEaxAL2hKX6tYXLCAY6qsUCyUPQlVm8uh0E3zrmSHsyTm+H
 Z6adghwGXbYiZJeBdobeMRehhDMU1N7GBVkCOdlSwe0DGuvTf7Hmzo94PpJp1l2mWXeOZt05
 mv+55UikRe5cMq+M5fiABC7Fj5cr+eSEWL/TiUodWn7G9kWrrQ6ZFqItiKaQzEmyIc0UJSXk
 5/mLSgsCCpe5SbLi66Okkhj5xUucKvGkKlnB8Ra0mRLJ3CW77w9HSulY+TnuDMclcaq1KUY5
 eGSgjepRW2TBUE9RRFqToiLcwdu7SrNvafBgdPCFI301KRNMRHpgoVvw218DE8bG6iUy8efI
 w67MTB8o2NSGDvncsp5Ujr82O2FlltCfWmNKcUiua07YaPiB1KQ5Zb8uderPluzD/LvK3zFG
 17NcbmnScAthVrw/Thi8sgK/6zkvmYiPk/v74ipe/hdBiun/iAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42I5/e/4PV0jjt1xBrtmcFv0njvJZLFxxnpW
 iytf37NZrFx9lMni4sy7LBYL9ltbfLnykMli0+NrrBaXd81hs+jZsJXVYtmmP0wWF7ZrWUx5
 +5Pd4uCHJ6wOfB5r5q1h9Fi85yWTx6ZVnWwe2789YPW4332cyWPzknqP2/8eM3tMvrGc0WP3
 zQY2j8e/XrJ59G1ZxejxeZOcx6mvn9kDeKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUM
 jc1jrYxMlfTtbFJSczLLUov07RL0Mr787mEqaJOpWHv3FVMD433xLkZODgkBE4m241cYuxi5
 OIQEljJK3NyzmBkiISNxcloDK4QtLPHnWhcbRNFbRomvDZvBioQFAiVetcxiBkmICBxjktjR
 9owJxGEWWMcs8b3xOTtEC1DmxfufjCAtbAKGEl1vQWZxcvAK2EmcXNXEBGKzCKhKfJvQAlYj
 KhArsfpaKyNEjaDEyZlPWLoYOTg4BcIk5h5XAQkzC5hJzNv8kBnClpfY/nYOlC0ucevJfKYJ
 jEKzkHTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgQmgm3Hfm7Zwdj1
 LvgQowAHoxIPb0T9rjgh1sSy4srcQ4wSHMxKIrwtmTvjhHhTEiurUovy44tKc1KLDzGaAv02
 kVlKNDkfmKTySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwNm3l
 /NjmYWpvPWe3RtE5l5/PXaMSlHe8Phi5QIVHqIbh8jrPgDxGLr6C913Plnx3yQl9VauyYyHj
 D+bN7+Zt4F0qO1H1z4pGNb22+tTbRpzzV06dp7Zg+96NE668PJztt8Vc6/qyzusMWU97LRbc
 vf1BI87IPinqQOMTUfld7lxpaddntH+bocRSnJFoqMVcVJwIAH0Po9kaAwAA
X-CMS-MailID: 20200512203354eucas1p1ec0713551239b5437374232a3558db8e
X-Msg-Generator: CA
X-RootMTR: 20200512090130eucas1p2eb86c5d34be56bbc81032bc0b6927d1e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090130eucas1p2eb86c5d34be56bbc81032bc0b6927d1e
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090130eucas1p2eb86c5d34be56bbc81032bc0b6927d1e@eucas1p2.samsung.com>
 <20200512090058.14910-38-m.szyprowski@samsung.com>
 <14063C7AD467DE4B82DEDB5C278E8663010E210FAC@FMSMSX108.amr.corp.intel.com>
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

Hi Michael,

On 12.05.2020 19:52, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Marek Szyprowski
>> Sent: Tuesday, May 12, 2020 5:01 AM
>> To: dri-devel@lists.freedesktop.org; iommu@lists.linux-foundation.org;
>> linaro-mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org
>> Cc: Pawel Osciak <pawel@osciak.com>; Bartlomiej Zolnierkiewicz
>> <b.zolnierkie@samsung.com>; David Airlie <airlied@linux.ie>; linux-
>> media@vger.kernel.org; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Mauro
>> Carvalho Chehab <mchehab@kernel.org>; Robin Murphy
>> <robin.murphy@arm.com>; Christoph Hellwig <hch@lst.de>; linux-arm-
>> kernel@lists.infradead.org; Marek Szyprowski
>> <m.szyprowski@samsung.com>
>> Subject: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist wrappers
>>
>> Use recently introduced common wrappers operating directly on the struct
>> sg_table objects and scatterlist page iterators to make the code a bit
>> more compact, robust, easier to follow and copy/paste safe.
>>
>> No functional change, because the code already properly did all the
>> scaterlist related calls.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
>> vs. orig_nents misuse' thread:
>> https://lore.kernel.org/dri-devel/20200512085710.14688-1-
>> m.szyprowski@samsung.com/T/
>> ---
>> .../media/common/videobuf2/videobuf2-dma-contig.c  | 41 ++++++++++----
>> --------
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c  | 32 +++++++--------
>> --
>> drivers/media/common/videobuf2/videobuf2-vmalloc.c | 12 +++----
>> 3 files changed, 34 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> index d3a3ee5..bf31a9d 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -48,16 +48,15 @@ struct vb2_dc_buf {
>>
>> static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
>> {
>> -	struct scatterlist *s;
>> 	dma_addr_t expected = sg_dma_address(sgt->sgl);
>> -	unsigned int i;
>> +	struct sg_dma_page_iter dma_iter;
>> 	unsigned long size = 0;
>>
>> -	for_each_sg(sgt->sgl, s, sgt->nents, i) {
>> -		if (sg_dma_address(s) != expected)
>> +	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
>> +		if (sg_page_iter_dma_address(&dma_iter) != expected)
>> 			break;
>> -		expected = sg_dma_address(s) + sg_dma_len(s);
>> -		size += sg_dma_len(s);
>> +		expected += PAGE_SIZE;
>> +		size += PAGE_SIZE;
> This code in drm_prime_t_contiguous_size and here.  I seem to remember seeing
> the same pattern in other drivers.
>
> Would it worthwhile to make this a helper as well?
I think I've identified such patterns in all DRM drivers and replaced 
with a common helper. So far I have no idea where to put such helper to 
make it available for media/videobuf2, so those a few lines are indeed 
duplicated here.
> Also, isn't the sg_dma_len() the actual length of the chunk we are looking at?
>
> If its I not PAGE_SIZE (ie. dma chunk is 4 * PAGE_SIZE?), does your loop/calculation still work?

scaterlist page iterators (for_each_sg_page/for_each_sg_dma_page and 
their sgtable variants) always operates on PAGE_SIZE units. They 
correctly handle larger sg_dma_len().


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
