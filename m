Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E04131D2F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 02:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69316E5BF;
	Tue,  7 Jan 2020 01:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936706E5BF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 01:29:13 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e13deb90000>; Mon, 06 Jan 2020 17:28:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 06 Jan 2020 17:29:12 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 06 Jan 2020 17:29:12 -0800
Received: from [10.2.162.105] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 01:29:10 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Jan Kara <jack@suse.cz>
References: <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca> <20191220182939.GA10944@unreal>
 <1001a5fc-a71d-9c0f-1090-546c4913d8a2@nvidia.com>
 <20191222132357.GF13335@unreal>
 <49d57efe-85e1-6910-baf5-c18df1382206@nvidia.com>
 <20191225052612.GA212002@unreal>
 <b879d191-a07c-e808-e48f-2b9bd8ba4fa3@nvidia.com>
 <612aa292-ec45-295c-b56c-c622876620fa@nvidia.com>
 <20200106090147.GA9176@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <9128d033-530f-468c-e076-05a9f845c72f@nvidia.com>
Date: Mon, 6 Jan 2020 17:26:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200106090147.GA9176@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578360505; bh=LL2UCmBD6dZ6/uQLwOdlycpOuM7M1h0oO/bWAMRgNao=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=UF91zYGOBNpqOMdNxjoixM6A+WrovnWJPV5f23Cd6aWVZvb4k4hny35IQtR86qo3A
 ybsCYLDgDCC84XoPp5q++dTbiHz8qPcKr7FsoP9vF2aJUPLN5RE+WoFcsvUpQp6Wc2
 zNktxwdJI6r7Z4Jx6GBcZwJVgSIHOvx/jDuAkAY6QN5yRyfr0B432Pz1svbf1jmTGQ
 FxsQoEJMt9bxhtvplOYDl+pZYlQ2c5wNyCrma3ZR+XCeeJMxRSHBXNwH+cwfQ2GRkp
 dgVeumMAJjlrrLn66kxKb59m+siRWt1zL/Z88CodJlQeEcjmF24n1h+sFApQWzTsY4
 OfRiCW4M+tSQA==
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
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Ran
 Rozenstein <ranro@mellanox.com>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex
 Williamson <alex.williamson@redhat.com>, linux-fsdevel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>, Mike
 Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/6/20 1:01 AM, Jan Kara wrote:
...
>> Also, looking ahead:
>>
>> a) if the problem disappears with the latest above test, then we likely have
>>     a huge page refcount overflow, and there are a couple of different ways to
>>     fix it.
>>
>> b) if it still reproduces with the above, then it's some other random mistake,
>>     and in that case I'd be inclined to do a sort of guided (or classic, unguided)
>>     git bisect of the series. Because it could be any of several patches.
>>
>>     If that's too much trouble, then I'd have to fall back to submitting a few
>>     patches at a time and working my way up to the tracking patch...
> 
> It could also be that an ordinary page reference is dropped with 'unpin'
> thus underflowing the page refcount...
> 
> 								Honza
> 

Yes.

And, I think I'm about out of time for this release cycle, so I'm probably going to
submit the prerequisite patches (patches 1-10, or more boldly, 1-22), for candidates
for 5.6.


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
