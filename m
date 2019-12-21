Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5CD1285D2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 01:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB3A6E17C;
	Sat, 21 Dec 2019 00:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBFB6E181
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 00:02:21 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfd61010000>; Fri, 20 Dec 2019 16:02:10 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 20 Dec 2019 16:02:20 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 20 Dec 2019 16:02:20 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 21 Dec
 2019 00:02:16 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Jan Kara <jack@suse.cz>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191220092154.GA10068@quack2.suse.cz>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b4b720c6-bb65-4928-f94f-618a39781c17@nvidia.com>
Date: Fri, 20 Dec 2019 16:02:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191220092154.GA10068@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576886530; bh=lYmRHUKxjje08r87sxcrKTHiQd7mjXE1LoyaAhCgFxg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=f7r38Ma6i3MI9nFSKeDIvPdt5vYrXy+JJsSfP31k7u+2wCxmmNufD1MCidKlHygn3
 9DLRItYTVN4NHfhd0m+R/vw4197VAkr47By2QIcXSjvCdK32rmWdX1HB29Za9NhH9u
 hudNbxuLpZYfSsTqz7cK57z334jwi4I1tLEi9lH/ca1Ff62dT4UIra7e9vrIur0HB5
 JlY4V/uCEY0LG0MxUfhFQE9legwb8M5VcPujH9NTF0fF15bOxKlnVGzri/2jDISypV
 Ta+rQMc92Kz26PG64qcQiVvssdWbJbDYbG+1Hm1r44PlB1G6okvsKpTqDlZ87Fs/zI
 Q76HA4eWaOe1g==
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
 Ira Weiny <ira.weiny@intel.com>, Maor Gottlieb <maorg@mellanox.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex
 Williamson <alex.williamson@redhat.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/20/19 1:21 AM, Jan Kara wrote:
...
>> So, ideas and next steps:
>>
>> 1. Assuming that you *are* hitting this, I think I may have to fall back to
>> implementing the "deferred" part of this design, as part of this series, after
>> all. That means:
>>
>>   For the pin/unpin calls at least, stop treating all pages as if they are
>>   a cluster of PAGE_SIZE pages; instead, retrieve a huge page as one page.
>>   That's not how it works now, and the need to hand back a huge array of
>>   subpages is part of the problem. This affects the callers too, so it's not
>>   a super quick change to make. (I was really hoping not to have to do this
>>   yet.)
> 
> Does that mean that you would need to make all GUP users huge page aware?
> Otherwise I don't see how what you suggest would work... And I don't think
> making all GUP users huge page aware is realistic (effort-wise) or even
> wanted (maintenance overhead in all those places).
> 

Well, pretty much yes. It's really just the pin_user_pages*() callers, but
the internals, follow_page() and such, are so interconnected right now that
it would probably blow up into a huge effort, as you point out.

> I believe there might be also a different solution for this: For
> transparent huge pages, we could find a space in 'struct page' of the
> second page in the huge page for proper pin counter and just account pins
> there so we'd have full width of 32-bits for it.
> 
> 								Honza
> 

OK, let me pursue that. Given that I shouldn't need to handle pages
splitting, it should be not *too* bad.

I am starting to think that I should just post the first 9 or so 
prerequisite patches (first 9 patches, plus the v4l2 fix that arguably should 
have been earlier in the sequence I guess), as 5.6 candidates, while I go
back to the drawing board here. 

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
