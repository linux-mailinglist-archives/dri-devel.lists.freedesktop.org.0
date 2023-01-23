Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E873677E8A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE57B10E1EF;
	Mon, 23 Jan 2023 15:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150EB10E1EF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674486014; x=1706022014;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4hwx+GMLzlMSCJFM0jTZ8IAKNXr8J0pfdPvYcrrhmYE=;
 b=JUtDPHRTHph2j7dk03dtGryVsDirc0yQP6VDh103rTagz0DoM3PgEnJK
 pQzWP/9CPrUiRdL3iJoredu80V2isCmVxQficiBNb3Qws8KWSYpZO5t3M
 cG5AWD27mmh/LFhgOuKrdlanjyMxsee/e/HJttrqtpYz10jDw8y4/VHjz
 ibe5Y4axut4x+xX87RvVgffhCbLRnNpT3fh3N3O3H4dlbf3Mc3+ed5LxT
 JJtkGCunnA3CFcL67F9JqP1C46dAlmQj3EbGiiNTOzfVE4xz2LXyJ5vZ4
 MzcBTQ14KW+Vxv2WGzH30BfYHKYD9cXf1XFn4mEcLp1VMpeYt+T4nOMXJ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="324737749"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="324737749"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 07:00:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="654982793"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="654982793"
Received: from rshao-mobl1.ccr.corp.intel.com (HELO [10.249.254.135])
 ([10.249.254.135])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 07:00:11 -0800
Message-ID: <8d86a6c8-de19-02bc-c254-58c2642f15dd@linux.intel.com>
Date: Mon, 23 Jan 2023 15:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC] TTM shrinking revisited
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20221230111159.75410-1-thomas.hellstrom@linux.intel.com>
 <ac777256-2400-1b19-81ce-af9ec7adfe9c@amd.com>
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
>
>> *) Trigger immediate writeback of pages handed to the swapcache / shmem,
>>     at least when the shrinker is called from kswapd.
>
> Not sure if that's really valuable.
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
Christian, I was wondering here if

1) There is something stopping us from using __GFP_COMP and folios? 
Reason is that for, for example a 2MiB page, if we can't insert it 
directly for whatever reason, we don't want to allocate 2MiB worth of 
swap memory before actually handing any memory back, and so may need to 
call split_folio().

2) Also any objections to restricting the page allocation sizes to 
PMD_SIZE and SZ_4K, again for split_folio().

Thanks,

Thomas


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
