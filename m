Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F7B273AE7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 08:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2031589B03;
	Tue, 22 Sep 2020 06:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA5D89AB7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:28:01 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200922062759euoutp023faa34ff48a73a6eb74f8926d2f0b5ed~3ByxZr_Uz0915709157euoutp02h
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:27:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200922062759euoutp023faa34ff48a73a6eb74f8926d2f0b5ed~3ByxZr_Uz0915709157euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1600756079;
 bh=DrYg1JhnENl9zqeHvER5284WgrVVROfZTW0ZjJGhxyo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=WtUKU/e7+L8CTRCdCOWfpCf/OHUKmyq1O5VqDx5etRSbdxe/qBfaUpqfRg2Ize/tc
 XmUYrxA6ziPrdq3/Fu/r53qQRCryc5syRChPBj1sgO+/UEVknnrA0kkS81Z5K6Zugl
 RflLaKuEDaKXyZ+OQ8r9A4EpbEDTiKO/ZFGGuNIo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200922062759eucas1p1d826d7ab32553376773aae1d20ebdbf4~3ByxM70VN2773427734eucas1p1C;
 Tue, 22 Sep 2020 06:27:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 4F.3B.06318.F69996F5; Tue, 22
 Sep 2020 07:27:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200922062759eucas1p1dafff6a91b3ad27c32fdd0a497b46f2a~3Byw4SByL2780327803eucas1p1R;
 Tue, 22 Sep 2020 06:27:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200922062759eusmtrp17b8ac6d92e407fdfa8f7b8c9a5d5c89b~3Byw3kP2l1970619706eusmtrp1e;
 Tue, 22 Sep 2020 06:27:59 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-d6-5f69996f386d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 22.70.06017.E69996F5; Tue, 22
 Sep 2020 07:27:59 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200922062758eusmtip23638d9360b4e6791e9ed02649c33e9d1~3BywRNsNS2807728077eusmtip2d;
 Tue, 22 Sep 2020 06:27:58 +0000 (GMT)
Subject: Re: [PATCH v5 05/38] drm: prime: use sgtable iterators in
 drm_prime_sg_to_page_addr_arrays()
To: Alex Goins <agoins@nvidia.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <afb59d1b-1fcf-fd6d-2b48-e078e129f1eb@samsung.com>
Date: Tue, 22 Sep 2020 08:27:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.2009211803580.19454@agoins-DiGiTS>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUhUURTGu2/zzdTIdVo8ZVRMZCRoiVKvsrIoeFCCpQQJaVM+1NLRZlwz
 SJJCJovULB2nlKxcSxpXtMWRcpokcyvccJ2KNFtN0kLy9bL87/ed8517Fi5LKrvoZWyYJlrQ
 atThKkZOVTVOvnSNzA4L2lD5ZgnXN+HFXWy2Etz9rDKa6/j+ieGKSp4SXN7jrdx4xyDBmYZf
 01x7rZHhzJ9tNFfxIY32ns+X3ihFfPXEAM33X7AQfPmtM3zP9DDJZ3QWIL6uK4nhLyZ/ZPhL
 FcWIL29K5L+ZVvjOD5B7BQvhYbGCdv32I/LQ1IyvRFS6Iv5nazedhAbkeiRjAXvCtLHfTo/k
 rBIXIijPqSMlMY6gvXeClsQ3BJa6Z/RsSdbXIUJKFCDIGbz+V3xC0JacT4iuhTgEejLrkciL
 sAoKDX2UaCLxDwL07e/+mBjsDvoxPSOyAm+H7u4WUmQKr4Hsh+cokRfjQGh8PkRJHgewZttm
 mGVl2Bs+mLVimMQroXrMSErsCN223D8DAZ60g9anVkYaezdMvU0hJV4II5YKO4mXQ1NGKiUV
 JCMYbL5rJ4nUmQuczUKSayv0Nk8xYmcSr4Oy2vUiAt4JTzKcJbSHzjEHaQZ7SK+6RkphBaSc
 V0pvOIPBcu9fV3NLG3kZqQxzFjPM2cYwZxvD/7Z5iCpGjkKMLiJE0HlohDg3nTpCF6MJcTsW
 GWFCMx+uadryvQY9+nW0AWEWqRYo6jNDg5S0OlaXENGAgCVVixS7XjQFKhXB6oRTgjYySBsT
 LugakBNLqRwVHjffH1biEHW0cEIQogTtbJZgZcuSUNCvLJ9o+4+bE2s+OyucHk1NGusnvsh3
 bKnM93c8sP9y3sjptavjNtkyV40tvVW0xeRrjcvXy0yjUfushm0Je+nKhoOtfpr4ZNxrO3Q1
 xXdPnY9n9JU7sqqAXGcb8WA08KSfV6PZ9VV4r0tZjTuxZlq1cV6J//Hb1cbxqNI0H8L4REXp
 QtXuLqRWp/4NxY1Oa2wDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsVy+t/xe7r5MzPjDXZ1M1rc+2Zj0XvuJJPF
 xhnrWS2ufH3PZrFy9VEmiwX7rS2+XHnIZLHp8TVWi8u75rBZHPzwhNViy5uJrA7cHmvmrWH0
 2P7tAavH/e7jTB6bl9R73P73mNlj8o3ljB67bzawefQ2v2Pz6NuyitFj8+lqj8+b5AK4o/Rs
 ivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyeiZ/YiqY
 xFvx++It1gbGB1xdjJwcEgImEjM+PWLqYuTiEBJYyiixtWk2G0RCRuLktAZWCFtY4s+1LjaI
 oreMEnf2HWMGSQgLpEvcnnqAEcQWEVCSWDHrHgtIEbPADyaJPScfMkN0rGGS2PvqClgHm4Ch
 RNfbLrAVvAJ2ErduXQCLswioSszc28oCYosKxEmc6XkBVSMocXLmE6A4BwengIPEm4NFIGFm
 ATOJeZsfMkPY8hLb386BssUlbj2ZzzSBUWgWku5ZSFpmIWmZhaRlASPLKkaR1NLi3PTcYiO9
 4sTc4tK8dL3k/NxNjMCY3nbs55YdjF3vgg8xCnAwKvHwHpiaES/EmlhWXJl7iFGCg1lJhNfp
 7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQL9NZJYSTc4Hppu8knhDU0NzC0tDc2NzYzMLJXHeDoGD
 MUIC6YklqdmpqQWpRTB9TBycUg2Mfek53It1ZhaVe2en8RdJXEx5fN1tWdIEX0nmNn3+u65n
 F09z/vjXwGa6P1+M++21z7pTP64Ne8vI16wt5N6z7GdE0v2g17e9clkkP+y5/Nbw1JNNWru0
 g563vFug3ZAtyDWPMThW+wc/73OurXqy10qUOjdNstD+NOGhdMCdt1Ju/WW5QW+UWIozEg21
 mIuKEwFlUEQA/wIAAA==
X-CMS-MailID: 20200922062759eucas1p1dafff6a91b3ad27c32fdd0a497b46f2a
X-Msg-Generator: CA
X-RootMTR: 20200513133259eucas1p273f0e05005b7b1158d884295d35745fd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133259eucas1p273f0e05005b7b1158d884295d35745fd
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133259eucas1p273f0e05005b7b1158d884295d35745fd@eucas1p2.samsung.com>
 <20200513133245.6408-5-m.szyprowski@samsung.com>
 <alpine.DEB.2.20.2009211803580.19454@agoins-DiGiTS>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux-foundation.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On 22.09.2020 01:15, Alex Goins wrote:
> Tested-by: Alex Goins <agoins@nvidia.com>
>
> This change fixes a regression with drm_prime_sg_to_page_addr_arrays() and
> AMDGPU in v5.9.

Thanks for testing!

> Commit 39913934 similarly revamped AMDGPU to use sgtable helper functions. When
> it changed from dma_map_sg_attrs() to dma_map_sgtable(), as a side effect it
> started correctly updating sgt->nents to the return value of dma_map_sg_attrs().
> However, drm_prime_sg_to_page_addr_arrays() incorrectly uses sgt->nents to
> iterate over pages, rather than sgt->orig_nents, resulting in it now returning
> the incorrect number of pages on AMDGPU.
>
> I had written a patch that changes drm_prime_sg_to_page_addr_arrays() to use
> for_each_sgtable_sg() instead of for_each_sg(), iterating using sgt->orig_nents:
>
> -       for_each_sg(sgt->sgl, sg, sgt->nents, count) {
> +       for_each_sgtable_sg(sgt, sg, count) {
>
> This patch takes it further, but still has the effect of fixing the number of
> pages that drm_prime_sg_to_page_addr_arrays() returns. Something like this
> should be included in v5.9 to prevent a regression with AMDGPU.

Probably the easiest way to handle a fix for v5.9 would be to simply 
merge the latest version of this patch also to v5.9-rcX: 
https://lore.kernel.org/dri-devel/20200904131711.12950-3-m.szyprowski@samsung.com/ 


This way we would get it fixed and avoid possible conflict in the -next. 
Do you have any AMDGPU fixes for v5.9 in the queue? Maybe you can add 
that patch to the queue? Dave: would it be okay that way?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
