Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C59128C03
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2019 01:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52EA6E4B1;
	Sun, 22 Dec 2019 00:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAD96E4B1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 00:02:22 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfeb2820001>; Sat, 21 Dec 2019 16:02:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sat, 21 Dec 2019 16:02:22 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sat, 21 Dec 2019 16:02:22 -0800
Received: from [10.2.167.41] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 22 Dec
 2019 00:02:18 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Leon Romanovsky <leon@kernel.org>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca> <20191220182939.GA10944@unreal>
 <1001a5fc-a71d-9c0f-1090-546c4913d8a2@nvidia.com>
 <20191221100843.GB13335@unreal>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <9261f37b-5932-4580-cbc8-f591b0b33b2a@nvidia.com>
Date: Sat, 21 Dec 2019 15:59:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191221100843.GB13335@unreal>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576972931; bh=95pYs1E9YJXlQbksWpOmj6qddfnejBQ8umGtr6ZpFwY=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Ih1gQcFIGgKg5n193VWHK/fpuYOWnxEAjDWwUpeL0db+IZfCrijIZXMmxlXytkJAy
 GyHybquB0rAC4PSC5fyYYOxPtnlJHJXbYbE1OnuToKQzSNtOX1E6jCjMDILoLbqZ4V
 OX5Q1eZnL4jcgn4z6z9ok9K0mg+OyYm6pC3L/Y0Cn97KIjBe5Xa80wOPiCj7nBJ7Qf
 tzyFw5L1dY/NfwyZ7ZrE7k0OMtxXiptqvzxEOmfi4Y/W4Mi7z2d4dMo373vMb2W5ZL
 8xmwOO+L537Cy6K9gc3OcvyItc0amK8uE6k5ZFJ8R4rau7j4DfEX/idektDGaSQXw9
 Z/MQNsIwlLFsA==
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
 Maor Gottlieb <maorg@mellanox.com>, Jonathan Corbet <corbet@lwn.net>,
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
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/21/19 2:08 AM, Leon Romanovsky wrote:
> On Fri, Dec 20, 2019 at 03:54:55PM -0800, John Hubbard wrote:
>> On 12/20/19 10:29 AM, Leon Romanovsky wrote:
>> ...
>>>> $ ./build.sh
>>>> $ build/bin/run_tests.py
>>>>
>>>> If you get things that far I think Leon can get a reproduction for you
>>>
>>> I'm not so optimistic about that.
>>>
>>
>> OK, I'm going to proceed for now on the assumption that I've got an overflow
>> problem that happens when huge pages are pinned. If I can get more information,
>> great, otherwise it's probably enough.
>>
>> One thing: for your repro, if you know the huge page size, and the system
>> page size for that case, that would really help. Also the number of pins per
>> page, more or less, that you'd expect. Because Jason says that only 2M huge
>> pages are used...
>>
>> Because the other possibility is that the refcount really is going negative,
>> likely due to a mismatched pin/unpin somehow.
>>
>> If there's not an obvious repro case available, but you do have one (is it easy
>> to repro, though?), then *if* you have the time, I could point you to a github
>> branch that reduces GUP_PIN_COUNTING_BIAS by, say, 4x, by applying this:
> 
> I'll see what I can do this Sunday.
> 

The other data point that might shed light on whether it's a mismatch (this only
works if the system is not actually crashing, though), is checking the new
vmstat items, like this:

$ grep foll_pin /proc/vmstat
nr_foll_pin_requested 16288188
nr_foll_pin_returned 16288188

...but OTOH, if you've got long-term pins, then those are *supposed* to be
mismatched, so it only really helps in between tests.

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
