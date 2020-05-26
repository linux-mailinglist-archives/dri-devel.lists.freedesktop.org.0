Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB3A1E1BAD
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3373189D5B;
	Tue, 26 May 2020 07:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4464A89D5B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 07:01:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200526070114euoutp024189ea00ad90291966b783d8e4168e56~Sge1CFIwE2019320193euoutp02j
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 07:01:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200526070114euoutp024189ea00ad90291966b783d8e4168e56~Sge1CFIwE2019320193euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1590476474;
 bh=TExFOZKUdc91DA/GbHMHDJO6iJStmTQq07gI/F9otJQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ngREkd6gYrNAjBeNsyQH+DEaEujwBqRY1BL4RCR5KQabW63nPllJUW5xg2Cm9yukH
 Vy9VGD3Xh4W753TQvCp/d4oiqMfMaG7vJC2xdhhFEdeDdvUqaoP+corfxWVEu8ZshP
 q/7zeiWI6qywQ2FJzxPS29eE2qhyf6orMDFwzing=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200526070114eucas1p1b21e7d81a2b80bed13fce326d04b8fa4~Sge0v3Mwc0579305793eucas1p1C;
 Tue, 26 May 2020 07:01:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AD.1F.60698.9BEBCCE5; Tue, 26
 May 2020 08:01:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200526070113eucas1p1257c0e7ff6b0c11799b9e597c5f6b003~Sge0Z0u0a0565905659eucas1p1d;
 Tue, 26 May 2020 07:01:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200526070113eusmtrp14496b0af1b30c286212fd7472a072830~Sge0ZHP8Z3257232572eusmtrp1h;
 Tue, 26 May 2020 07:01:13 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-e1-5eccbeb959b9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C7.69.07950.9BEBCCE5; Tue, 26
 May 2020 08:01:13 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200526070113eusmtip1691e79cbdd9856fa111356479cb767ac~Sgez0JoOV0550105501eusmtip1H;
 Tue, 26 May 2020 07:01:13 +0000 (GMT)
Subject: Re: [PATCH v5 00/38] DRM: fix struct sg_table nents vs. orig_nents
 misuse
To: Christoph Hellwig <hch@lst.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <83d04017-c6f2-d714-963c-ffa9c7248790@samsung.com>
Date: Tue, 26 May 2020 09:01:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513134741.GA12712@lst.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHee69m9fR5HEaHrQMFkkv9iIJXTLUXqj7qYQiyHB1czet3Izd
 1AwqsZBaK62BbkvKrDBtak6ZZmSk6LI5WxmRFpmpH7LESh2YoW27Wn77/8/5nfN/Djw0qXgl
 CaePaU/xOi2XoZTKKHvH1Ku1zS1dqg3VHHO1u5Ng6ky1EmbWfp1k3k6OSZnKh+0EU/Ysjpl4
 O0AwtsF3EqanuVTKPP8xJEmUsdZbVsQ+9ZRRbKPns4Ttv+Ig2Pp759kPM4Mka3xfgdgnvXlS
 9lpDFWLHbZFJsmTZFjWfcSyb162PPyxLt1jxyWnJ6Ut9diIPfaP0KJAGHAvWi79IPZLRCvwA
 wY/CwjkzgaDW2Un6KAUeR+D4Gj0/Me16TIlQBQJ3x6c5M4agZvK6fyIE74Pi3krCp0OxEoZH
 XMgHkbibAEvhG3+4FMeAflQv9Wk5joex4WH/MIVXQFvedz+zGKeA8249Eplg6DQP+euBOBo8
 A3a/JvEyaBwtJUUdBn1DtwlfGOAvAVAydd/boL1mBzj7BfGEEBhxNASIegk4jQZK5C8gGOiu
 DhCNAUFPvgmJVBx87P4t9S0i8SqobV4vlrfCz4ZGQtwfBO9Hg8U3BMENe8lcrBwuFShEOgos
 jpp/sc/db8gipLQsuMyy4BrLgmss/3PLEFWFwvgsQZPGCxu1fM46gdMIWdq0damZGhvyfjPn
 jGOyCbX8OdKKMI2Ui+SM1alSSLhsIVfTioAmlaHybS5vSa7mcs/wusxDuqwMXmhFETSlDJNv
 LP+aosBp3Cn+BM+f5HXzXYIODM9DBVG6Vm2Ku8wUvelG4vLX5qpqvGvyAOMxqe+Y25wq487N
 bZeTV9Ln7qtzMq11hqby40F3PB+Mla4Id+RUfLsGjl61vdi+xtx78/isfk95Js51nz5YMpJg
 NOyVh49YVna15T9KYvicsQvcUlVuf2rDKPHCHbv77Mvqfen7ixKKlZSQzsWsJnUC9xfB9hoZ
 YgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xu7o7952JM1j2Ud2i99xJJouNM9az
 WvzfNpHZ4srX92wWK1cfZbJYsN/a4suVh0wWmx5fY7W4vGsOm8XBD09YHbg81sxbw+ix99sC
 Fo/t3x6wetzvPs7ksXlJvcftf4+ZPSbfWM7osftmA5tH35ZVjB6fN8kFcEXp2RTll5akKmTk
 F5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZcxaI1Dwm7Wi49Y2pgbG
 1yxdjJwcEgImEr/P7gSzhQSWMkr8naQIEZeRODmtgRXCFpb4c62LrYuRC6jmLaPE6W17mUAS
 wgIhEtNurgSzRQSUJJ6+OssIUsQscIFJ4sbOo8wQUzcxSux8A2azCRhKdL0FmcTJwStgJ/H+
 6VOwOIuAqsThhjdgV4gKxEqsvtbKCFEjKHFy5hOwOKeAjsS3h9vAbGYBM4l5mx8yQ9jyEtvf
 zoGyxSVuPZnPNIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2M
 wPjdduznlh2MXe+CDzEKcDAq8fBarDkdJ8SaWFZcmXuIUYKDWUmE1+ksUIg3JbGyKrUoP76o
 NCe1+BCjKdBzE5mlRJPzgaklryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFM
 HxMHp1QDo9Y28WDXjQIHpyo7aEYfe1b3X8TZf+5vg+BdtzeVPEm93d2xVT3/i3MW60MD1gJL
 y6r2n8ed5pvcK36tc+J/095ty1L5/rQ8z5n00H/ryz9qB+TvJeVtD/vJe34hj1FTSEGhEXc4
 Yyxj6J7zuz1MN9f8ZNLhP3WNd2GNv2zN4XM/XUqDBKv6lFiKMxINtZiLihMBzmXRsPUCAAA=
X-CMS-MailID: 20200526070113eucas1p1257c0e7ff6b0c11799b9e597c5f6b003
X-Msg-Generator: CA
X-RootMTR: 20200513132127eucas1p23f6be10bbd627e69e36d2451068b3204
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513132127eucas1p23f6be10bbd627e69e36d2451068b3204
References: <CGME20200513132127eucas1p23f6be10bbd627e69e36d2451068b3204@eucas1p2.samsung.com>
 <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513134741.GA12712@lst.de>
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
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 13.05.2020 15:47, Christoph Hellwig wrote:
> I've pushed out a branch with the first three patches here:
>
>     git://git.infradead.org/users/hch/dma-mapping.git dma-sg_table-helper
>
> Gitweb:
>
>     http://git.infradead.org/users/hch/dma-mapping.git/shortlog/refs/heads/dma-sg_table-helper
>
> and merged it into the dma-mapping for-next tree.  Unless someone shouts
> the branch should be considered immutable in 24 hours.

David & Daniel: could you merge all the DRM related changes on top of 
the provided branch? Merging those changes separately would take a lots 
of time because of the dependencies on the sgtable helpers and changes 
in the DRM core.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
