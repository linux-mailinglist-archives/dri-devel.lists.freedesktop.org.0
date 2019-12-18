Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA603125670
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9CF89F47;
	Wed, 18 Dec 2019 22:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3563289F47
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:18:32 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfaa5ad0000>; Wed, 18 Dec 2019 14:18:21 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 18 Dec 2019 14:18:31 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 18 Dec 2019 14:18:31 -0800
Received: from [10.2.165.11] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 22:18:30 +0000
Subject: Re: [PATCH v11 06/25] mm: fix get_user_pages_remote()'s handling of
 FOLL_LONGTERM
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-7-jhubbard@nvidia.com>
 <20191218161907.yczbijr3ngm7wwnj@box>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <c8d746ff-f544-6c9f-110b-215514fb4b5c@nvidia.com>
Date: Wed, 18 Dec 2019 14:15:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191218161907.yczbijr3ngm7wwnj@box>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576707502; bh=sxjwJVdMWX10qxIPxn4THVxS9SYzoQiX2+nIJ9/LG7I=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Wys6k22Afo9fC1FH0axtavED+ucaNULbN4HLnbXCEKip4OVcZ9f+DCyF1oiDDrpR6
 VVU64m+Du3dStBe0svDkUDhJfPut9LgyVYxfXRyEFsA5dGwch/fk3mRevZD63XVrP9
 YBBJzKJE134RDCp2gXkNcwdCjmgOIVwgljk9i/5AwuR6SO4o0/vjKGNPkBI2pP+iG+
 iPf9jA5LGmP/Mlv6eBiAd1FQpTvBbjy2XCLCbZkpzF3WZmO4gMAZ8QiXHgTZGg/Qwu
 exw5yBOuoh2UiX1rk7Q2pr+UUWAVLNrz6DTtqpSBtMI8gdMeNLy2PlDxoeCXyG1o5m
 wru4Cnwi3Ayzg==
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
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jason Gunthorpe <jgg@mellanox.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/18/19 8:19 AM, Kirill A. Shutemov wrote:
...
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 3ecce297a47f..c0c56888e7cc 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -29,6 +29,13 @@ struct follow_page_context {
>>   	unsigned int page_mask;
>>   };
>>   
>> +static __always_inline long __gup_longterm_locked(struct task_struct *tsk,
>> +						  struct mm_struct *mm,
>> +						  unsigned long start,
>> +						  unsigned long nr_pages,
>> +						  struct page **pages,
>> +						  struct vm_area_struct **vmas,
>> +						  unsigned int flags);
> 
> Any particular reason for the forward declaration? Maybe move
> get_user_pages_remote() down?
> 

Yes, that's exactly why: I was thinking it would be cleaner to put in the
forward declaration, rather than moving code blocks, but either way seems
reasonable. I'll go ahead and move the code blocks and delete the forward
declaration, now that someone has weighed in in favor of that.

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
