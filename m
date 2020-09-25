Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA1C27861D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 13:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1B46EC75;
	Fri, 25 Sep 2020 11:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955576EC75;
 Fri, 25 Sep 2020 11:41:37 +0000 (UTC)
IronPort-SDR: JGENP5wRN4COqy9NMYpIFUsRYG7jLsY98WIexDOMr+zLhOCebRpP7ORxAFszqizx3v1Wp3ak38
 AEqLjn8pWDnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="140916174"
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; d="scan'208";a="140916174"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 04:41:37 -0700
IronPort-SDR: Bh89z21wP4UPubbehDOPSbIFlU2kCItKkV3v2WG82ykGMvVdjwVsVhZN8AyzuwWxlFpZ9elKTb
 cyawhtmjpDcg==
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; d="scan'208";a="455798120"
Received: from mlevy2-mobl.ger.corp.intel.com (HELO [10.251.176.131])
 ([10.251.176.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 04:41:32 -0700
Subject: Re: [Intel-gfx] [PATCH rdma-next v3 1/2] lib/scatterlist: Add support
 in dynamic allocation of SG table from pages
To: Leon Romanovsky <leon@kernel.org>
References: <20200922083958.2150803-1-leon@kernel.org>
 <20200922083958.2150803-2-leon@kernel.org>
 <118a03ef-d160-e202-81cc-16c9c39359fc@linux.intel.com>
 <20200925071330.GA2280698@unreal>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <adff5752-582c-2065-89e2-924ef732911a@linux.intel.com>
Date: Fri, 25 Sep 2020 12:41:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925071330.GA2280698@unreal>
Content-Language: en-US
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Maor Gottlieb <maorg@mellanox.com>, David Airlie <airlied@linux.ie>,
 Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/09/2020 08:13, Leon Romanovsky wrote:
> On Thu, Sep 24, 2020 at 09:21:20AM +0100, Tvrtko Ursulin wrote:
>>
>> On 22/09/2020 09:39, Leon Romanovsky wrote:
>>> From: Maor Gottlieb <maorg@mellanox.com>
>>>
>>> Extend __sg_alloc_table_from_pages to support dynamic allocation of
>>> SG table from pages. It should be used by drivers that can't supply
>>> all the pages at one time.
>>>
>>> This function returns the last populated SGE in the table. Users should
>>> pass it as an argument to the function from the second call and forward.
>>> As before, nents will be equal to the number of populated SGEs (chunks).
>>
>> So it's appending and growing the "list", did I get that right? Sounds handy
>> indeed. Some comments/questions below.
> 
> Yes, we (RDMA) use this function to chain contiguous pages.

I will eveluate if i915 could start using it. We have some loops which 
build page by page and coalesce.

[snip]

>>>    	if (unlikely(ret))
>>> diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
>>> index 0a1464181226..4899359a31ac 100644
>>> --- a/tools/testing/scatterlist/main.c
>>> +++ b/tools/testing/scatterlist/main.c
>>> @@ -55,14 +55,13 @@ int main(void)
>>>    	for (i = 0, test = tests; test->expected_segments; test++, i++) {
>>>    		struct page *pages[MAX_PAGES];
>>>    		struct sg_table st;
>>> -		int ret;
>>> +		struct scatterlist *sg;
>>>
>>>    		set_pages(pages, test->pfn, test->num_pages);
>>>
>>> -		ret = __sg_alloc_table_from_pages(&st, pages, test->num_pages,
>>> -						  0, test->size, test->max_seg,
>>> -						  GFP_KERNEL);
>>> -		assert(ret == test->alloc_ret);
>>> +		sg = __sg_alloc_table_from_pages(&st, pages, test->num_pages, 0,
>>> +				test->size, test->max_seg, NULL, 0, GFP_KERNEL);
>>> +		assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
>>
>> Some test coverage for relatively complex code would be very welcomed. Since
>> the testing framework is already there, even if it bit-rotted a bit, but
>> shouldn't be hard to fix.
>>
>> A few tests to check append/grow works as expected, in terms of how the end
>> table looks like given the initial state and some different page patterns
>> added to it. And both crossing and not crossing into sg chaining scenarios.
> 
> This function is basic for all RDMA devices and we are pretty confident
> that the old and new flows are tested thoroughly.
> 
> We will add proper test in next kernel cycle.

Patch seems to be adding a requirement that all callers of 
(__)sg_alloc_table_from_pages pass in zeroed struct sg_table, which 
wasn't the case so far.

Have you audited all the callers and/or fixed them? There seems to be 
quite a few. Gut feel says problem would probably be better solved in 
lib/scatterlist.c and not by making all the callers memset. Should be 
possible if you make sure you only read st->nents if prev was passed in?

I've fixed the unit test and with this change the existing tests do 
pass. But without zeroing it does fail on the very first, single page, 
test scenario.

You can pull the unit test hacks from 
git://people.freedesktop.org/~tursulin/drm-intel sgtest.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
