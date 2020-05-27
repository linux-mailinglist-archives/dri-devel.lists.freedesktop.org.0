Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C641E4DDD
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 21:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244906E0E6;
	Wed, 27 May 2020 19:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6E86E0E6;
 Wed, 27 May 2020 19:07:09 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eceba090002>; Wed, 27 May 2020 12:05:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 27 May 2020 12:07:09 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 27 May 2020 12:07:09 -0700
Received: from [10.2.87.74] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 May
 2020 19:07:08 +0000
Subject: Re: [PATCH] drm/radeon: Convert get_user_pages() --> pin_user_pages()
To: Souptick Joarder <jrdr.linux@gmail.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <1590526802-3008-1-git-send-email-jrdr.linux@gmail.com>
 <69a033cf-63b2-7da6-6a5e-a5bbc94b8afb@nvidia.com>
 <20200527084852.GN206103@phenom.ffwll.local>
 <20200527085117.GO206103@phenom.ffwll.local>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <aaf62285-981e-3753-5501-07bbba98fc36@nvidia.com>
Date: Wed, 27 May 2020 12:07:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200527085117.GO206103@phenom.ffwll.local>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590606345; bh=cJGxgyxUMS7+SGXB5PmVaX93dA/VtdD9tLRCxZnqybQ=;
 h=X-PGP-Universal:Subject:To:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=LFjk88MNH0RKsXsLEslCB9oYqWO/+qMh7mtsWwHzujVQNvjhVM3PMi5vWNhtfXxso
 crnY9sWfLYHUbXyb1qBHZ2T3NZDECLkFwKYXj5JCxdqvsHElOFJDUqLmcZZUmwz8vw
 kNSQ1hzCmul6R2atxy7vC4gHnhTLSubpC9+XFFM2R5zhstiVlSIQRp6Lp3IE/8L2SM
 CucGGzQ8NCIIWK2j5pvWa5Jr7e6iP/ggLLIduMbh7MVZHCREBVJ5dVoD8IhyWo0M2N
 1yF68YtM+toIRVk1NkUTaZRPr5GOd1ry/MnsmndslsBkJVaLj7Xb9e0kKPDZlgLWIs
 sDMfQem0oi7Vw==
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-27 01:51, Daniel Vetter wrote:
> On Wed, May 27, 2020 at 10:48:52AM +0200, Daniel Vetter wrote:
>> On Tue, May 26, 2020 at 03:57:45PM -0700, John Hubbard wrote:
>>> On 2020-05-26 14:00, Souptick Joarder wrote:
>>>> This code was using get_user_pages(), in a "Case 2" scenario
>>>> (DMA/RDMA), using the categorization from [1]. That means that it's
>>>> time to convert the get_user_pages() + release_pages() calls to
>>>> pin_user_pages() + unpin_user_pages() calls.
>>>>
>>>> There is some helpful background in [2]: basically, this is a small
>>>> part of fixing a long-standing disconnect between pinning pages, and
>>>> file systems' use of those pages.
>>>>
>>>> [1] Documentation/core-api/pin_user_pages.rst
>>>>
>>>> [2] "Explicit pinning of user-space pages":
>>>>       https://lwn.net/Articles/807108/
>>
>> I don't think this is a case 2 here, nor is it any of the others. Feels
>> like not covered at all by the doc.
>>
>> radeon has a mmu notifier (might be a bit broken, but hey whatever there's
>> other drivers which have the same concept, but less broken). So when you
>> do an munmap, radeon will release the page refcount.
> 

Aha, thanks Daniel. I withdraw my misinformed ACK, then.

> I forgot to add: It's also not case 3, since there's no hw page fault
> support. It's all faked in software, and explicitly synchronizes against
> pending io (or preempts it, that depends a bit upon the jobs running).
> 

This is what case 3 was *intended* to cover, but it looks like case 3 needs to
be written a little better. I'll attempt that, and Cc you on the actual patch
to -mm. (I think we also need a case 5 for an unrelated scenario, too, so
it's time.)


thanks,
-- 
John Hubbard
NVIDIA


>> Which case it that?
>>
>> Note that currently only amdgpu doesn't work like that for gpu dma
>> directly to userspace ranges, it uses hmm and afaiui doens't hold a full
>> page pin refcount.
>>
>> Cheers, Daniel
>>
>>
>>>>
>>>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
>>>> Cc: John Hubbard <jhubbard@nvidia.com>
>>>>
>>>> Hi,
>>>>
>>>> I'm compile tested this, but unable to run-time test, so any testing
>>>> help is much appriciated.
>>>> ---
>>>>    drivers/gpu/drm/radeon/radeon_ttm.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>> index 5d50c9e..e927de2 100644
>>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>> @@ -506,7 +506,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
>>>>    		uint64_t userptr = gtt->userptr + pinned * PAGE_SIZE;
>>>>    		struct page **pages = ttm->pages + pinned;
>>>> -		r = get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
>>>> +		r = pin_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
>>>>    				   pages, NULL);
>>>>    		if (r < 0)
>>>>    			goto release_pages;
>>>> @@ -535,7 +535,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
>>>>    	kfree(ttm->sg);
>>>>    release_pages:
>>>> -	release_pages(ttm->pages, pinned);
>>>> +	unpin_user_pages(ttm->pages, pinned);
>>>>    	return r;
>>>>    }
>>>> @@ -562,7 +562,7 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_tt *ttm)
>>>>    			set_page_dirty(page);
>>>
>>>
>>> Maybe we also need a preceding patch, to fix the above? It should be
>>> set_page_dirty_lock(), rather than set_page_dirty(), unless I'm overlooking
>>> something (which is very possible!).
>>>
>>> Either way, from a tunnel vision perspective of changing gup to pup, this
>>> looks good to me, so
>>>
>>>      Acked-by: John Hubbard <jhubbard@nvidia.com>
>>>
>>>
>>> thanks,
>>> -- 
>>> John Hubbard
>>> NVIDIA
>>>
>>>>    		mark_page_accessed(page);
>>>> -		put_page(page);
>>>> +		unpin_user_page(page);
>>>>    	}
>>>>    	sg_free_table(ttm->sg);
>>>>
>>>
>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
