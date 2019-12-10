Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA88118008
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 06:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0452D6E804;
	Tue, 10 Dec 2019 05:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0A46E811
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 05:55:51 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5def33600000>; Mon, 09 Dec 2019 21:55:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 21:55:50 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 09 Dec 2019 21:55:50 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Dec
 2019 05:55:50 +0000
Received: from [10.2.166.216] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Dec
 2019 05:55:49 +0000
Subject: Re: [PATCH v8 20/26] powerpc: book3s64: convert to pin_user_pages()
 and put_user_page()
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
 <20191209225344.99740-21-jhubbard@nvidia.com>
 <08f5d716-8b31-b016-4994-19fbe829dc28@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <61e0c3a5-992e-4571-e22d-d63286ce10ec@nvidia.com>
Date: Mon, 9 Dec 2019 21:53:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <08f5d716-8b31-b016-4994-19fbe829dc28@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575957345; bh=hOQHo4yBws9X1nqgVCC1VdrUiF9Z86xIO4U2wGVXRCw=;
 h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Z0uGtjzdMedDuhQsG1jpU7HmbXe0kx1+9sLgOIk8Tsa+qSKrJwruITPp5YqsEqw/n
 J6r9xabZ4a9OQN/Wl8LVj9LrtdwAy11ChiFmcjZZVTuORyZEi3yR7n2LRqkwn66Ltr
 eeIwWiN6PGMYv9eL7SAOfeP4KVVco/4prZuZTjVwpd53jjxNLLJqGfcC9sxeGP6ykt
 D8DJTJbSiZvX3LC8FmFbEGS2I/TRo6uZZSD6HwdT5k7HU7OxF7PBsCrAkF07RmEA1a
 ZcPVotCE1aYXgj3rJWRvh8EJXUvCr0vK9kwBlCNWSwhBERf1C6gVTs8+AjkAsxO8km
 d4nN+/tFy5PPg==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/9/19 3:46 PM, John Hubbard wrote:
> On 12/9/19 2:53 PM, John Hubbard wrote:
> ...
>> @@ -212,10 +211,9 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_mem_t *mem)
>>   		if (!page)
>>   			continue;
>>   
>> -		if (mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY)
>> -			SetPageDirty(page);
>> +		put_user_pages_dirty_lock(&page, 1,
>> +				mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY);
>>   
>> -		put_page(page);
> 
> 
> Correction: this is somehow missing the fixes that resulted from Jan Kara's review (he
> noted that we can't take a page lock in this context). I must have picked up the
> wrong version of it, when I rebased for -rc1.
> 

Andrew, given that the series is now in -mm, what's the preferred way for me to fix this?
Send a v9 version of the whole series? Or something else?

I'm still learning the ropes...

thanks,
-- 
John Hubbard
NVIDIA

> Will fix in the next version (including the commit description). Here's what the
> corrected hunk will look like:
> 
> @@ -215,7 +214,8 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_mem_t *mem)
>                  if (mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY)
>                          SetPageDirty(page);
>   
> -               put_page(page);
> +               put_user_page(page);
> +
>                  mem->hpas[i] = 0;
>          }
>   }
> 
> 
> thanks,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
