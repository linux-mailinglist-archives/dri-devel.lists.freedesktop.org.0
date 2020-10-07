Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DBC286A53
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 23:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D4C6E9BF;
	Wed,  7 Oct 2020 21:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7D46E9BA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 21:37:02 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7e34f10003>; Wed, 07 Oct 2020 14:36:49 -0700
Received: from [10.2.85.86] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct
 2020 21:36:52 +0000
Subject: Re: [PATCH 01/13] drm/exynos: Stop using frame_vector helpers
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-2-daniel.vetter@ffwll.ch>
 <80718789-b3de-c30a-03c5-7c8cbf41f7d9@nvidia.com>
 <CAKMK7uEuwmCkpSeKxjDgHXWrE9P-TbawLoQ4dpu0nc4MYykScA@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <895eb064-1c8f-ecfc-0a98-1fbe40cb3161@nvidia.com>
Date: Wed, 7 Oct 2020 14:36:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEuwmCkpSeKxjDgHXWrE9P-TbawLoQ4dpu0nc4MYykScA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602106609; bh=OI3+pLVYL5cWSE4B2a2jiHWrJeRBVcUjCT4H6VDdVUk=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=A3zmsxRkTiEuP5NMToHsIjBexJZ1BRIWpMrbXsaDVyF7pGmKjuyPBJQTjoYnCT+Id
 Rh7uCABfImT6HrUYHb0dneU7xMwQcxjKSVOEB6uLjaVXfpYC3GRycDey9vhNW5mmoL
 jEbZuoQHH31CQTquNUREPNteX38ixLxxzHu2SsT2FwNmpb8XAJQj2e6AubzOwwCf8P
 V6JNWODSmsgKGWHO++1cASV1aBplJBXlrENJ9aSSd2jA/V2blcSUK8OOBGXEaMYN/S
 S6PO0PnBjGCbslJ42wDbWrRxEjHDBuLX0dG111P3JgKEC7Adhql3cu0O80p7PRSGSg
 0YNay76WexGkg==
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
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-s390@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Joonyoung Shim <jy0922.shim@samsung.com>, kvm@vger.kernel.org, Jason
 Gunthorpe <jgg@ziepe.ca>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Kyungmin
 Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:DMA BUFFER
 SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/7/20 2:32 PM, Daniel Vetter wrote:
> On Wed, Oct 7, 2020 at 10:33 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> On 10/7/20 9:44 AM, Daniel Vetter wrote:
...
>>> @@ -398,15 +399,11 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
>>>        dma_unmap_sgtable(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
>>>                          DMA_BIDIRECTIONAL, 0);
>>>
>>> -     pages = frame_vector_pages(g2d_userptr->vec);
>>> -     if (!IS_ERR(pages)) {
>>> -             int i;
>>> +     for (i = 0; i < g2d_userptr->npages; i++)
>>> +             set_page_dirty_lock(g2d_userptr->pages[i]);
>>>
>>> -             for (i = 0; i < frame_vector_count(g2d_userptr->vec); i++)
>>> -                     set_page_dirty_lock(pages[i]);
>>> -     }
>>> -     put_vaddr_frames(g2d_userptr->vec);
>>> -     frame_vector_destroy(g2d_userptr->vec);
>>> +     unpin_user_pages(g2d_userptr->pages, g2d_userptr->npages);
>>> +     kvfree(g2d_userptr->pages);
>>
>> You can avoid writing your own loop, and just simplify the whole thing down to
>> two lines:
>>
>>          unpin_user_pages_dirty_lock(g2d_userptr->pages, g2d_userptr->npages,
>>                                      true);
>>          kvfree(g2d_userptr->pages);
> 
> Oh nice, this is neat. I'll also roll it out in the habanalabs patch,
> that has the same thing. Well almost, it only uses set_page_dirty, not
> the _lock variant. But I have no idea whether that matters or not?


It matters. And invariably, call sites that use set_page_dirty() instead
of set_page_dirty_lock() were already wrong.  Which is why I never had to
provide anything like "unpin_user_pages_dirty (not locked)".

Although in habanalabs case, I just reviewed patch 3 and I think they *were*
correctly using set_page_dirty_lock()...

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
