Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D96A28B27E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 12:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C971A6E250;
	Mon, 12 Oct 2020 10:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17FA6E250
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 10:46:58 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201012104646euoutp01e0f01bf57b2f366aa16d238f1c156963~9OObbHCnM2292122921euoutp01j
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 10:46:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201012104646euoutp01e0f01bf57b2f366aa16d238f1c156963~9OObbHCnM2292122921euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1602499606;
 bh=FBmOg/5UhT/YwJB06QgXBxAcIx7JXNwKhGcqnotWc+k=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=NghxrJGQ6/YiTq2zrHZ6ulVedQnVkd9ykBo7R+2+/L00bFfsXQe3BRr2qxvy/Q7/P
 2e2g6G3h8Kp+gp/6HCIIw/1DxPWamglyioN4Rp2kCU89hovb9IvS/sWxi6g2RCO7OA
 dc+5gwIwcL+q7pLjSm0FUgkdsc4E+xlbeXNy8Vew=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201012104641eucas1p17f1275af0f512f70177adbd61d0c77ae~9OOWjmv2u0406004060eucas1p1O;
 Mon, 12 Oct 2020 10:46:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 29.90.06456.114348F5; Mon, 12
 Oct 2020 11:46:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201012104640eucas1p12399708a49a999b779fdce7e9e6204cc~9OOWGKOWa0406004060eucas1p1N;
 Mon, 12 Oct 2020 10:46:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201012104640eusmtrp118dc9ecd8a25c4a1defe7637d1cabe04~9OOWFQWUJ3076730767eusmtrp1a;
 Mon, 12 Oct 2020 10:46:40 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-c3-5f843411fe20
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E6.DA.06314.014348F5; Mon, 12
 Oct 2020 11:46:40 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201012104639eusmtip1bed2fa0e6bb06eea4bbd6376d06d96fa~9OOVGfB640624706247eusmtip1Q;
 Mon, 12 Oct 2020 10:46:39 +0000 (GMT)
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
To: Jason Gunthorpe <jgg@ziepe.ca>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ed68968b-27bc-d776-8da8-ef21d6b3c378@samsung.com>
Date: Mon, 12 Oct 2020 12:46:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201009124850.GP5177@ziepe.ca>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHec85OzuOjhyn4oNFxbpRoCbdXrCiNOVQFH0LirKpB4vcss1p
 2oekRdpcYUaoc6TTIhXNWl5CzWxZ02ZmZillmaag0hxoGtrV4+nit99z/f+fl5chlRfpQOa4
 NknQadUJKlpB1T6d6Qjy2Xg+er2rTomtVRU0zr3WibBt4D2Jb7XfJnH3lIfGBblGAufntaI5
 GiHw3eFiOW7P0mDrtVPY/umNDL+qt9LYfKdGhj9U/JLhbJuRxHkvmgg8UPAa4cHLbvkOX74g
 /SXFP5guoviSxlGCt5dfpHn7RI6cb837RvH9WU6Cv3fjLH/JOE7znqbXNN9e1CLnJ+1L+ZrJ
 d9R+9qBia5yQcDxZ0IVsP6o4NpHtpBN/0Kcflo4Q6ahRZkIMA9xGyOkMMyEvRsmVIpgdjzIh
 xRx/QWAaKKGkwiSCjCmZyGL/cP1HWmq6haCizYOkwIPA0VkxP+HLbYG+J9OEyH7cASi6IW5S
 MCRnlMHg9StysUBzoWBym2jRBstth8ruQ2Ka4laB2d2LRPbnYuCF7TspMsv5QFv+0Px+Ly4I
 Zt1l83mSWwZ1busfDoC3Q4WEqAVcMwOjrW9JyfYuGB+zERL7wpizWi7xEnBdNVPSgBHBQEel
 XArMCF6dy0NSVxj0dczOOyW5tVBVHyK93U543KCW0Bt63T6SB2/Iqc0lpTQLmReU0o7VYHHe
 /qf6qLOLzEYqy4LLLAuusSy4xvJftghR5ShAMOg18YI+VCukBOvVGr1BGx8ce1JjR3Mf1PXT
 OXEfTXXFOBDHINUiNjHCGK2UqZP1qRoHAoZU+bHhz11HlGycOjVN0J2M1hkSBL0DLWYoVQC7
 oXj0sJKLVycJJwQhUdD9rRKMV2A6upxURpRfiE5xzbasfFmf2e248752RY/WusY+EcKzQa2b
 yxo6DpcUbjhjWW77OtPbn6gtbTQwM9kz+5oViyKqlHt6qm8u3/Q55np3w7SqkoGowL4+7wB3
 msF4IKs8rCXKHbkpvTh8d2FwV+xdT4H227Yll3qeP/PfmzEZWRlizo9QUfpj6tB1pE6v/g39
 D1qlnAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsVy+t/xu7oCJi3xBgd/61vMWb+GzWL61AuM
 Fgsf3mW2WH5mHbPFla/v2SxmT29mspg54wQjkPWCyWLj00XsFme6cy3mTC202PT4GqvF5V1z
 2Cx6Nmxltbi35j+rxYSFzcwWM87vY7J4OPsqo8WjvrfsDsIesxsusnjs/baAxWPxnpdMHptW
 dbJ5bPo0id3jxIzfLB73u48zeWxeUu/R2/yOzeP9vqtsHmcWHGH3+LxJzmPr59ssAbxRejZF
 +aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehmfJhxnK/jL
 VrF/xQumBsY9rF2MnBwSAiYST3c9YOti5OIQEljKKPFpwUI2iISMxMlpDVBFwhJ/rnVBFb1l
 lFiy/T1YkbCAucSdo9+YQGwRgXCJFde2sYAUMQu0skr0f3/FCtFxhUniw4YFLCBVbAKGEl1v
 QUZxcPAK2EmsvRINEmYRUJXoeXuDEcQWFUiS+H61C8zmFRCUODnzCVgrp4CuxK+3K5lBbGYB
 M4l5mx9C2fIS29/OgbLFJW49mc80gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE
 3OLSvHS95PzcTYzAxLHt2M/NOxgvbQw+xCjAwajEw1vg3BwvxJpYVlyZe4hRgoNZSYTX6ezp
 OCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OBya1vJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFC
 AumJJanZqakFqUUwfUwcnFINjBP0ZoqvvFqnv+FIxLrLR6OFHcN1rwTdnOzX5zrB1DyuYfJ7
 MUWZ97vP7kiU7VA/cK/wtYheR8rURQ4x+QfW6kmrPtmxYj9DgOqPsG51GQmepY5KV14ZW/87
 /PkNR9SjqFdGC1Y6Wq177rAmeInF1viLbUIcXOyhu1+eMVlW6+p6x/XeOZmd65VYijMSDbWY
 i4oTAaq2ugIyAwAA
X-CMS-MailID: 20201012104640eucas1p12399708a49a999b779fdce7e9e6204cc
X-Msg-Generator: CA
X-RootMTR: 20201009124900eucas1p26c93caa29c9925f1eef9be9ff7c6c65c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201009124900eucas1p26c93caa29c9925f1eef9be9ff7c6c65c
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan> <20201009122111.GN5177@ziepe.ca>
 <20201009143723.45609bfb@coco.lan>
 <CGME20201009124900eucas1p26c93caa29c9925f1eef9be9ff7c6c65c@eucas1p2.samsung.com>
 <20201009124850.GP5177@ziepe.ca>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

On 09.10.2020 14:48, Jason Gunthorpe wrote:
> On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:
>
>> I'm not a mm/ expert, but, from what I understood from Daniel's patch
>> description is that this is unsafe *only if*  __GFP_MOVABLE is used.
> No, it is unconditionally unsafe. The CMA movable mappings are
> specific VMAs that will have bad issues here, but there are other
> types too.

I'm trying to follow this thread, but I really wonder what do you mean 
by CMA movable mappings? If a buffer has been allocated from CMA and 
used for DMA, it won't be moved in the memory. It will stay at the same 
physical memory address all the time until freed by the owner. It just a 
matter of proper usage count tracking to delay freeing if it is still 
used somewhere.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
