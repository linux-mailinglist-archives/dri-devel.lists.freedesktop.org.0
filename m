Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68446119FE4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 01:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347206EA23;
	Wed, 11 Dec 2019 00:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720F96EA23
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 00:27:04 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df037d10000>; Tue, 10 Dec 2019 16:26:57 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 10 Dec 2019 16:27:03 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 10 Dec 2019 16:27:03 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 00:27:03 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 00:27:02 +0000
Subject: Re: [PATCH v8 24/26] mm/gup: track FOLL_PIN pages
To: Jan Kara <jack@suse.cz>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
 <20191209225344.99740-25-jhubbard@nvidia.com>
 <20191210133932.GH1551@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <918e9f4b-d1bc-95b4-3768-f6a28d625d58@nvidia.com>
Date: Tue, 10 Dec 2019 16:27:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191210133932.GH1551@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576024017; bh=qZMhuX1AH+ipTqKh5IOl5OAO53v7INQFJxlKSWfldSI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=mtQrj5I0dTbE0p+0Duy/yLLURBp189gBz9/n7w24993utz/qyGtSs7PPQAv+iIImb
 JZ8mcjPAxzh+nh7PkxaNbrLb3BrJ2IB5TLP1oCbepwYNd9zP8BSYgamyM4DvGzILi8
 XQkGoEiIlVo58hcTQukHAefGfROo8agytuwS+0sfjZ1Jg7ij7PU3d1I4gxsqVd70Fa
 GkNwTpmVy0rbDSvIttlOcb1nzarUHfrPPIMHBT+ByVSSyhRxc5/lScetmOjddYAdyE
 GT/eTQw2K0oKAfFgOT8KfXo08uqKjO85NJPryhNn/fDyZhmI4MaNcIcj91kNrcZeuR
 Z4qb08ZWAeRjQ==
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah
 Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Mike
 Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/10/19 5:39 AM, Jan Kara wrote:
...
>> +void grab_page(struct page *page, unsigned int flags)
>> +{
>> +	if (flags & FOLL_GET)
>> +		get_page(page);
>> +	else if (flags & FOLL_PIN) {
>> +		get_page(page);
>> +		WARN_ON_ONCE(flags & FOLL_GET);
>> +		/*
>> +		 * Use get_page(), above, to do the refcount error
>> +		 * checking. Then just add in the remaining references:
>> +		 */
>> +		page_ref_add(page, GUP_PIN_COUNTING_BIAS - 1);
> 
> This is wrong for two reasons:
> 
> 1) You miss compound_head() indirection from get_page() for this
> page_ref_add().

whoops, yes that is missing.

> 
> 2) page_ref_add() could overflow the counter without noticing.
> 
> Especially with GUP_PIN_COUNTING_BIAS being non-trivial, it is realistic
> that an attacker might try to overflow the page refcount and we have to
> protect the kernel against that. So I think that all the places that would
> use grab_page() actually need to use try_grab_page() and then gracefully
> deal with the failure.
> 

OK, I've replaced grab_page() everywhere with try_grab_page(), with the
above issues fixed. The v7 patchset had error handling for grab_page() failures,
that had been reviewed, so relevants parts of that have reappeared.

I had initially hesitated to do this, but now I've gone ahead and added:

#define page_ref_zero_or_close_to_bias_overflow(page) \
	((unsigned int) page_ref_count(page) + \
		GUP_PIN_COUNTING_BIAS <= GUP_PIN_COUNTING_BIAS)

...which is used in the new try_grab_page() for protection.


>> @@ -278,11 +425,23 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>>  		goto retry;
>>  	}
>>  
>> -	if (flags & FOLL_GET) {
>> +	if (flags & (FOLL_PIN | FOLL_GET)) {
>> +		/*
>> +		 * Allow try_get_page() to take care of error handling, for
>> +		 * both cases: FOLL_GET or FOLL_PIN:
>> +		 */
>>  		if (unlikely(!try_get_page(page))) {
>>  			page = ERR_PTR(-ENOMEM);
>>  			goto out;
>>  		}
>> +
>> +		if (flags & FOLL_PIN) {
>> +			WARN_ON_ONCE(flags & FOLL_GET);
>> +
>> +			/* We got a +1 refcount from try_get_page(), above. */
>> +			page_ref_add(page, GUP_PIN_COUNTING_BIAS - 1);
>> +			__update_proc_vmstat(page, NR_FOLL_PIN_REQUESTED, 1);
>> +		}
>>  	}
> 
> The same problem here as above, plus this place should use the same
> try_grab..() helper, shouldn't it?


Yes, now that the new try_grab_page() has behavior that matches what
this call site needs. Done.


> 
>> @@ -544,8 +703,8 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
>>  	/* make this handle hugepd */
>>  	page = follow_huge_addr(mm, address, flags & FOLL_WRITE);
>>  	if (!IS_ERR(page)) {
>> -		BUG_ON(flags & FOLL_GET);
>> -		return page;
>> +		WARN_ON_ONCE(flags & (FOLL_GET | FOLL_PIN));
>> +		return NULL;
> 
> I agree with the change to WARN_ON_ONCE but why is correct the change of
> the return value? Note that this is actually a "success branch".
> 

Good catch, thanks! I worked through the logic...correctly at first, but then I must 
have become temporarily dazed by the raw destructive power of the pre-existing 
BUG_ON() statement, and screwed it up after all. :)


thanks,
-- 
John Hubbard
NVIDIA

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
