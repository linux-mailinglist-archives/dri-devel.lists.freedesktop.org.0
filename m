Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CC51285BC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 00:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD9A89CAC;
	Fri, 20 Dec 2019 23:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B5589875
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 23:55:01 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfd5f350000>; Fri, 20 Dec 2019 15:54:29 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 20 Dec 2019 15:55:00 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 20 Dec 2019 15:55:00 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Dec
 2019 23:54:55 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca> <20191220182939.GA10944@unreal>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1001a5fc-a71d-9c0f-1090-546c4913d8a2@nvidia.com>
Date: Fri, 20 Dec 2019 15:54:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191220182939.GA10944@unreal>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576886070; bh=/03FljbsYciU5tHAkbKg2NU1vxam4rPGvNuyvBOvTmI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=NHzZwwHnO04AWTwbfQ36movXiWQIeN6xnG0CaFRzVNvCUapXF58JTJsf2nNI+IRwI
 DrLLvP0JHvfbO4CFEL3hgJpFFipWoByn/88lI7963qLLBE+6QyuqqzpIlSEAZcYicf
 +AhFk6QMFhL3ZQcMHn9GHCd7JX4YVL2GnrGTJvSg89JAl5EgtzSTE1xhtFf9zOjJg6
 pNgJhfKkGDJOVytDq6s8d7kAfd2cTVzb5F89Deki5jmHOU+6CQdxuALB6OVytiKiu+
 QhV9jdHe/drLasOcHgZcW+u8MnEA2U8dMDot9HKYpmWRmTeeh3wLkOnTHyupwY8Q94
 9H+pMthuFxrbw==
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
 Ira Weiny <ira.weiny@intel.com>, Maor Gottlieb <maorg@mellanox.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/20/19 10:29 AM, Leon Romanovsky wrote:
...
>> $ ./build.sh
>> $ build/bin/run_tests.py
>>
>> If you get things that far I think Leon can get a reproduction for you
> 
> I'm not so optimistic about that.
> 

OK, I'm going to proceed for now on the assumption that I've got an overflow
problem that happens when huge pages are pinned. If I can get more information,
great, otherwise it's probably enough.

One thing: for your repro, if you know the huge page size, and the system
page size for that case, that would really help. Also the number of pins per
page, more or less, that you'd expect. Because Jason says that only 2M huge 
pages are used...

Because the other possibility is that the refcount really is going negative, 
likely due to a mismatched pin/unpin somehow.

If there's not an obvious repro case available, but you do have one (is it easy
to repro, though?), then *if* you have the time, I could point you to a github
branch that reduces GUP_PIN_COUNTING_BIAS by, say, 4x, by applying this:

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bb44c4d2ada7..8526fd03b978 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1077,7 +1077,7 @@ static inline void put_page(struct page *page)
  * get_user_pages and page_mkclean and other calls that race to set up page
  * table entries.
  */
-#define GUP_PIN_COUNTING_BIAS (1U << 10)
+#define GUP_PIN_COUNTING_BIAS (1U << 8)
 
 void unpin_user_page(struct page *page);
 void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,

If that fails to repro, then we would be zeroing in on the root cause. 

The branch is here (I just tested it and it seems healthy):

git@github.com:johnhubbard/linux.git  pin_user_pages_tracking_v11_with_diags



thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
