Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CAB27E266
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6976E4F9;
	Wed, 30 Sep 2020 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E427C6E4F9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 07:15:39 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200930071537euoutp011a631cbea76ccc3086d99c527adf68d0~5fmpTzHBY0459704597euoutp015
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 07:15:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200930071537euoutp011a631cbea76ccc3086d99c527adf68d0~5fmpTzHBY0459704597euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601450137;
 bh=0cB3Oahr4FGEYxGAhCJARGenVdml6D5Dll5LWqSlJqc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ayEiOBC314ec5/1PhB7S/kbpZoES9VAoaZt7Ouup9WcqqNi0y2xo08nr9YBSsfyC8
 tF4Y8aH/oMwIs4pnVB+a4ybI4H88zaC9OTHxkvbb7k+q5M9rwJOskrGkrYeXYHwRi5
 Ca2OR2eF6op8E3TtWiii60T76sGJ9A26jNYE+//Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200930071537eucas1p1fc4912e5d8938177812b7389325e25a9~5fmo_tch31618416184eucas1p1o;
 Wed, 30 Sep 2020 07:15:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 61.EA.06318.990347F5; Wed, 30
 Sep 2020 08:15:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200930071536eucas1p2fe055287ddf0e1bb75815ac758582eb2~5fmomJ1Wy1336613366eucas1p2q;
 Wed, 30 Sep 2020 07:15:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200930071536eusmtrp2de88a91384581702e9b0ccc5d2cf54c8~5fmolV88w1670616706eusmtrp2f;
 Wed, 30 Sep 2020 07:15:36 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-1a-5f7430991af9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 48.5E.06314.890347F5; Wed, 30
 Sep 2020 08:15:36 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200930071536eusmtip1a6c08742afc79eda5eca2317382b1471~5fmnzjGB82121921219eusmtip1g;
 Wed, 30 Sep 2020 07:15:35 +0000 (GMT)
Subject: Re: [Linaro-mm-sig] [PATCH v5 05/38] drm: prime: use sgtable
 iterators in drm_prime_sg_to_page_addr_arrays()
To: Alex Deucher <alexdeucher@gmail.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <d004633a-401b-b94d-123c-486185c8905a@samsung.com>
Date: Wed, 30 Sep 2020 09:15:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_OP4pEg7Cg9E=TUB0viSX8rTALQoFck=ueTh=phTtUfEA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHec85Ozta0+OsfLtQtFBMKY2sThhhNzj0qX0J6aKtPGrkpux4
 yYIcGpFL7aKmnmReKM1LaWtqTkwntWHmFDdMy8rLikrXEp1gyKrtUPnt93+u7//hJVCxCl9H
 nFekMkqFLEmCe2OtxkXztrLw1Njw4n5f6sPCPirf3ItQY0uckHpS2iSgrE4HTtU1vESoyq5I
 Kvdes5Cat04glHZqWEBZ9OU4VTXbglHXcmsElOGHTUDpZm4Lonxpm0GD0I2aRkC3c++FtLY+
 F6fbFsYFtKZXSn+8YULop/ez6HeuKZQuHKkFdMeoCqfzc77jdIGuHtBP+y7Tc9qNx3xPeO+L
 Y5LOpzPKsP1nvBNfdcwIU3R+F5051bgKaH3UwIuAZATs7r+LqIE3ISYfAlhinRTyYh7ACpUF
 58UcgJo6p0ANCE/LQHEQH68FMGcpD+OFA8BPow7EPdefzICdlhYPryKb/3RzWe4ilOzCoMMw
 4Eng5A6otqtxN4vI/bBGM+thjAyEdcMGzM2ryRhofDWJ8TV+sLfM5mEvUgor9VoPo+Qm2GYv
 R3kOgG9tFR5DkNQRUNftwnmnh6E5vwHh2R9+M+mEPG+Av9r/NuQAOGF+JORFHoCW7FLAV0XC
 MfNP3H0AlNwKm/Rh/C0OwBeFQTz6wBG7H/8GH3intQTlwyJ4/ZqYnxEEOdPjf1sNg0PoLSDh
 ljnjlrnhlrnh/q+tBFg9CGDSWHkCw+5UMBnbWZmcTVMkbD+XLNeCP/+yz2VyPgPPl872AJIA
 kpUiYg0bKxbI0tlMeQ+ABCpZJTrY3xcjFsXJMi8xyuRYZVoSw/aA9QQmCRDtrP56WkwmyFKZ
 CwyTwij/ZhHCa50KXAo1DnJj9LROPrp6xRbDy6lg4yhb9WVFUfpcZnxdZ9WhYzcy+utBd3Da
 m6Ilk8XuIBvFR/1dEXvyP8fI7SNHon9mXonUvx06/gsr1kfdfDD4Qeac3h2KucI2r21MGg9R
 7Cp4LQ2siY+rTr5z0npGmt3VFJa992r0YnOvNZkqOCXB2ETZjhBUycp+AxrVr/aTAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsVy+t/xu7ozDEriDc73G1vc+2Zj0XvuJJPF
 nT+z2C02zljPanHl63s2i5WrjzJZLNhvbdE5ewO7xZcrD5ksNj2+xmpxedccNouFH7eyWLR1
 LmO1OPjhCavFljcTWR34PZ4cnMfksWbeGkaPnbPusntsWtXJ5rH92wNWj3knAz3udx9n8ti8
 pN7j9r/HzB6Tbyxn9Nh9s4HNo7f5HZtH35ZVjB6bT1d7fN4kF8AfpWdTlF9akqqQkV9cYqsU
 bWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdxavcb9oItghVfmxexNTBu4uti
 5OCQEDCROD9VrYuRk0NIYCmjxPXOGBBbQkBG4uS0BlYIW1jiz7Uuti5GLqCat4wSn9b8YgRJ
 CAuUS+y9vJUJxBYR2MAosXVKPojNLHCQRaLvaylEwwpmiWtrfoMVsQkYSnS9BZnEycErYCex
 bN5HMJtFQFVi5bWDLCC2qECcxJmeF1A1ghInZz4Bi3MKBEos2LWJBWKBmcS8zQ+ZIWx5ie1v
 50DZ4hK3nsxnmsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZG
 YHLYduzn5h2MlzYGH2IU4GBU4uFNkCiOF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58
 UWlOavEhRlOg5yYyS4km5wMTV15JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQi
 mD4mDk6pBsbwoqCQ+sowlVNamULNm6ZOSnq/S4bpA2fMLc/Huhsv56R9OhOcYP30U/OlZa9f
 ZsjznTsYJC/WLvDV4tPTqQ/WRguwsXk4iRneFt2ZvMBevdHEOOOze9W6z1oiPFM4Hh65E5Wy
 tMkho38K4/Xrrmc4rLjFw/Z+XvXrG1vBqWlf1kncEV0yy1aJpTgj0VCLuag4EQB5rjW3JAMA
 AA==
X-CMS-MailID: 20200930071536eucas1p2fe055287ddf0e1bb75815ac758582eb2
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
 <afb59d1b-1fcf-fd6d-2b48-e078e129f1eb@samsung.com>
 <CADnq5_OP4pEg7Cg9E=TUB0viSX8rTALQoFck=ueTh=phTtUfEA@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, Joerg Roedel <joro@8bytes.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

On 25.09.2020 23:23, Alex Deucher wrote:
> On Tue, Sep 22, 2020 at 2:28 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 22.09.2020 01:15, Alex Goins wrote:
>>> Tested-by: Alex Goins <agoins@nvidia.com>
>>>
>>> This change fixes a regression with drm_prime_sg_to_page_addr_arrays() and
>>> AMDGPU in v5.9.
>> Thanks for testing!
>>
>>> Commit 39913934 similarly revamped AMDGPU to use sgtable helper functions. When
>>> it changed from dma_map_sg_attrs() to dma_map_sgtable(), as a side effect it
>>> started correctly updating sgt->nents to the return value of dma_map_sg_attrs().
>>> However, drm_prime_sg_to_page_addr_arrays() incorrectly uses sgt->nents to
>>> iterate over pages, rather than sgt->orig_nents, resulting in it now returning
>>> the incorrect number of pages on AMDGPU.
>>>
>>> I had written a patch that changes drm_prime_sg_to_page_addr_arrays() to use
>>> for_each_sgtable_sg() instead of for_each_sg(), iterating using sgt->orig_nents:
>>>
>>> -       for_each_sg(sgt->sgl, sg, sgt->nents, count) {
>>> +       for_each_sgtable_sg(sgt, sg, count) {
>>>
>>> This patch takes it further, but still has the effect of fixing the number of
>>> pages that drm_prime_sg_to_page_addr_arrays() returns. Something like this
>>> should be included in v5.9 to prevent a regression with AMDGPU.
>> Probably the easiest way to handle a fix for v5.9 would be to simply
>> merge the latest version of this patch also to v5.9-rcX:
>> https://lore.kernel.org/dri-devel/20200904131711.12950-3-m.szyprowski@samsung.com/
>>
>>
>> This way we would get it fixed and avoid possible conflict in the -next.
>> Do you have any AMDGPU fixes for v5.9 in the queue? Maybe you can add
>> that patch to the queue? Dave: would it be okay that way?
> I think this should go into drm-misc for 5.9 since it's an update to
> drm_prime.c.  Is that patch ready to merge?
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Maarten, Maxime or Thomas: could you take this one:

https://lore.kernel.org/dri-devel/20200904131711.12950-3-m.szyprowski@samsung.com/

also to drm-misc-fixes for v5.9-rc?

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
