Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AB6662131
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8675410E37F;
	Mon,  9 Jan 2023 09:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874E510E37F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673255691; x=1704791691;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0SdUkp6PbPzh8lG3hXle+NjFt1BzOvw6xxeeC1guoXg=;
 b=R/YGt/a1r0G9t2OOiAKiX96jRe3qEA/wMg0rPfJqCXNJykz/1rGlO9Sy
 Cl8oqjfSfh1qscfGxSNKmBo1tWJ9RfwW47ZIBRNldaAEOPTY3tJNxPtak
 0z9OzkEU218zdT20ADl32Zq2apMBllDvIj/xwCmq6nK2MIV69dvgSaQy4
 WizUYkTFGuKY5ch3NRAa7Q/WH24hXEyLxAm9W9wJnzOQGQxvOnDzhMgnu
 v6W1pxk3PJWC8ejITReBHVCQKyVe6l6cQlJOoP3IbUqdxmTKFpIDwpdYT
 thpBYxt+nTahve37p8Wv0/ZlsZ/qiAA5DS8fvBBZ9Q8vOkmvIIcn5K2Dg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="387278693"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="387278693"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 01:14:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="719877195"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="719877195"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.32])
 ([10.249.254.32])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 01:14:42 -0800
Message-ID: <7e71d251-8179-12d9-4216-af5233d61f0d@linux.intel.com>
Date: Mon, 9 Jan 2023 10:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC] TTM shrinking revisited
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20221230111159.75410-1-thomas.hellstrom@linux.intel.com>
 <ac777256-2400-1b19-81ce-af9ec7adfe9c@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ac777256-2400-1b19-81ce-af9ec7adfe9c@amd.com>
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

Thanks for the feedback. Some additional inline comments and questions:

On 1/4/23 11:31, Christian König wrote:
> Am 30.12.22 um 12:11 schrieb Thomas Hellström:
>> Hi, Christian, others.
>>
>> I'm starting to take a look at the TTM shrinker again. We'll probably be
>> needing it at least for supporting integrated hardware with the xe 
>> driver.
>>
>> So assuming that the last attempt failed because of the need to allocate
>> shmem pages and lack of writeback at shrink time, I was thinking of the
>> following approach: (A rough design sketch of the core support for the
>> last bullet is in patch 1/1. It of course needs polishing if the 
>> interface
>> is at all accepted by the mm people).
>>
>> Before embarking on this, any feedback or comments would be greatly
>> appreciated:
>>
>> *) Avoid TTM swapping when no swap space is available. Better to 
>> adjust the
>>     TTM swapout watermark, as no pages can be freed to the system 
>> anyway.
>> *) Complement the TTM swapout watermark with a shrinker.
>>     For cached pages, that may hopefully remove the need for the 
>> watermark.
>>     Possibly a watermark needs to remain for wc pages and / or dma 
>> pages,
>>     depending on how well shrinking them works.
>
> Yeah, that's what I've already tried and failed miserable exactly 
> because of what you described above.

Do you have a test-case for this or a typical failing scenario I can 
turn into a kunit test, to motivate the need for direct 
insert-to-swap-cache before running it with the -mm people? It will 
otherwise have a high risk of being NAKed, I fear.

>
>> *) Trigger immediate writeback of pages handed to the swapcache / shmem,
>>     at least when the shrinker is called from kswapd.
>
> Not sure if that's really valuable.
Not completely sure either. However, in OOM situations where we need to 
allocate memory to be able to shrink, that would give the system a 
chance to reclaim the pages we shrink before we deplete the kernel 
reserves completely. Shmem does this, and also the i915 shrinker in some 
situations, but I agree it needs to be verified to be valuable and if 
so, in what situations.

>
>> *) Hide ttm_tt_swap[out|in] details in the ttm_pool code. In the pool 
>> code
>>     we have more details about the backing pages and can split pages,
>>     transition caching state and copy as necessary. Also investigate the
>>     possibility of reusing pool pages in a smart way if copying is 
>> needed.
>
> Well I think we don't need to split pages at all. The higher order 
> pages are just allocated for better TLB utilization and could (in 
> theory) be freed as individual pages as well. It's just that MM 
> doesn't support that atm.

If we can insert pages directly into the swap-cache, splitting might be 
needed, at least if compound pages were allocated to begin with. Looks 
like shmem does this as well before inserting into the swap-cache. Could 
be a corner case where the system theoretically supports swapping PMD 
size pages, but when no PMD size slots are available. (My system behaves 
like that, need to investigate why).


Thanks,

Thomas


>
> But I really like the idea of moving more of this logic into the 
> ttm_pool.
>
>> *) See if we can directly insert pages into the swap-cache instead of
>>     taking the shmem detour, something along with the attached patch 
>> 1 RFC.
>
> Yeah, that strongly looks like we way to go. Maybe in combination with 
> being able to swap WC/UC pages directly out.
>
> While swapping them in again an extra copy doesn't hurt us, but for 
> the other way that really sucks.
>
> Thanks,
> Christian.
>
>>
>> Thanks,
>> Thomas
>>
>
