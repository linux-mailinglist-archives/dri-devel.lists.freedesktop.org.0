Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E733678122
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15A510E509;
	Mon, 23 Jan 2023 16:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD7510E508
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674490520; x=1706026520;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=XCIaYeoWU8fKsX5u+UKh/TQOGtgGs4zuA70hdwxJCC8=;
 b=jibuxA9DJ7casqkti/WkQCFlJxtXMKYkwD7tHQwCvex162ZlgX7F/qf0
 7NE5SkrIu1bu1SMaCpu2Ryi15c7MxCBv0vDven73CQCxQEYt7cAlnNhdr
 EkDIzq87bSCPcTHSO+9tn30N9Y1FVraC9UaTk9EyRYSo2XuVA9zmfvSDl
 X1MLy3+23HIf6uU6bd9qOuc6eK/wmbAfgmF7Gh7x/2Xp7Lu4n3h8x00vh
 Y8WLRAOs8k61fTdXX8Bufeqh7rgWTjO/f5/4/EzcSzLBwd0PEP/gKsyk0
 nE8u66RuHRVtoh+MYYvijdN+H+GpkSFyBaB0ahieXUq++2bhl3IASvvI4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306433877"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="306433877"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 08:15:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="990503099"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="990503099"
Received: from vanderss-mobl.ger.corp.intel.com (HELO [10.249.254.21])
 ([10.249.254.21])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 08:15:09 -0800
Message-ID: <c4cd5a80-db39-10cc-3cc2-cc108cc475be@linux.intel.com>
Date: Mon, 23 Jan 2023 17:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC] TTM shrinking revisited
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20221230111159.75410-1-thomas.hellstrom@linux.intel.com>
 <ac777256-2400-1b19-81ce-af9ec7adfe9c@amd.com>
 <8d86a6c8-de19-02bc-c254-58c2642f15dd@linux.intel.com>
 <7d2f3e92-ae58-188e-fa72-c932abc6fb48@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <7d2f3e92-ae58-188e-fa72-c932abc6fb48@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian,

On 1/23/23 17:07, Christian König wrote:
> Hi Thomas,
>
> Am 23.01.23 um 15:59 schrieb Thomas Hellström:
>>
>> On 1/4/23 11:31, Christian König wrote:
>>> Am 30.12.22 um 12:11 schrieb Thomas Hellström:
>>>> Hi, Christian, others.
>>>>
>>>> I'm starting to take a look at the TTM shrinker again. We'll 
>>>> probably be
>>>> needing it at least for supporting integrated hardware with the xe 
>>>> driver.
>>>>
>>>> So assuming that the last attempt failed because of the need to 
>>>> allocate
>>>> shmem pages and lack of writeback at shrink time, I was thinking of 
>>>> the
>>>> following approach: (A rough design sketch of the core support for the
>>>> last bullet is in patch 1/1. It of course needs polishing if the 
>>>> interface
>>>> is at all accepted by the mm people).
>>>>
>>>> Before embarking on this, any feedback or comments would be greatly
>>>> appreciated:
>>>>
>>>> *) Avoid TTM swapping when no swap space is available. Better to 
>>>> adjust the
>>>>     TTM swapout watermark, as no pages can be freed to the system 
>>>> anyway.
>>>> *) Complement the TTM swapout watermark with a shrinker.
>>>>     For cached pages, that may hopefully remove the need for the 
>>>> watermark.
>>>>     Possibly a watermark needs to remain for wc pages and / or dma 
>>>> pages,
>>>>     depending on how well shrinking them works.
>>>
>>> Yeah, that's what I've already tried and failed miserable exactly 
>>> because of what you described above.
>>>
>>>> *) Trigger immediate writeback of pages handed to the swapcache / 
>>>> shmem,
>>>>     at least when the shrinker is called from kswapd.
>>>
>>> Not sure if that's really valuable.
>>>
>>>> *) Hide ttm_tt_swap[out|in] details in the ttm_pool code. In the 
>>>> pool code
>>>>     we have more details about the backing pages and can split pages,
>>>>     transition caching state and copy as necessary. Also 
>>>> investigate the
>>>>     possibility of reusing pool pages in a smart way if copying is 
>>>> needed.
>>>
>>> Well I think we don't need to split pages at all. The higher order 
>>> pages are just allocated for better TLB utilization and could (in 
>>> theory) be freed as individual pages as well. It's just that MM 
>>> doesn't support that atm.
>>>
>>> But I really like the idea of moving more of this logic into the 
>>> ttm_pool.
>>>
>>>> *) See if we can directly insert pages into the swap-cache instead of
>>>>     taking the shmem detour, something along with the attached 
>>>> patch 1 RFC.
>>>
>>> Yeah, that strongly looks like we way to go. Maybe in combination 
>>> with being able to swap WC/UC pages directly out.
>>>
>> Christian, I was wondering here if
>>
>> 1) There is something stopping us from using __GFP_COMP and folios? 
>> Reason is that for, for example a 2MiB page, if we can't insert it 
>> directly for whatever reason, we don't want to allocate 2MiB worth of 
>> swap memory before actually handing any memory back, and so may need 
>> to call split_folio().
>
> I've tried __GFP_COMP before and ran into massive problems. Folios 
> didn't existed at that point, so they are probably worth a try now.

OK, I'll give it a try. A quick try on i915 with TTM __GFP_COMP system 
pages seems to work well.

>
>>
>> 2) Also any objections to restricting the page allocation sizes to 
>> PMD_SIZE and SZ_4K, again for split_folio().
>
> We can't do that. A lot of applications assuming 64K as huge page size 
> for GPUs cause that used to be the standard under Windows.
>
> So only supporting 4K and 2M would result in quite some performance 
> drop for those.

OK, understood.

/Thomas


>
> Christian.
>
>>
>> Thanks,
>>
>> Thomas
>>
>>
>>> While swapping them in again an extra copy doesn't hurt us, but for 
>>> the other way that really sucks.
>>>
>>> Thanks,
>>> Christian.
>>>
>>>>
>>>> Thanks,
>>>> Thomas
>>>>
>>>
>
