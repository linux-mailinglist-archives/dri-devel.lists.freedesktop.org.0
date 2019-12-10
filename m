Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FCC118505
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785A06E88E;
	Tue, 10 Dec 2019 10:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 638 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 10:28:22 UTC
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C14B6E88E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:28:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 769B2B280;
 Tue, 10 Dec 2019 10:28:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E89EB1E0B23; Tue, 10 Dec 2019 11:28:18 +0100 (CET)
Date: Tue, 10 Dec 2019 11:28:18 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v8 08/26] mm/gup: allow FOLL_FORCE for
 get_user_pages_fast()
Message-ID: <20191210102818.GF1551@quack2.suse.cz>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
 <20191209225344.99740-9-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209225344.99740-9-jhubbard@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Leon Romanovsky <leonro@mellanox.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
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

On Mon 09-12-19 14:53:26, John Hubbard wrote:
> Commit 817be129e6f2 ("mm: validate get_user_pages_fast flags") allowed
> only FOLL_WRITE and FOLL_LONGTERM to be passed to get_user_pages_fast().
> This, combined with the fact that get_user_pages_fast() falls back to
> "slow gup", which *does* accept FOLL_FORCE, leads to an odd situation:
> if you need FOLL_FORCE, you cannot call get_user_pages_fast().
> 
> There does not appear to be any reason for filtering out FOLL_FORCE.
> There is nothing in the _fast() implementation that requires that we
> avoid writing to the pages. So it appears to have been an oversight.
> 
> Fix by allowing FOLL_FORCE to be set for get_user_pages_fast().
> 
> Fixes: 817be129e6f2 ("mm: validate get_user_pages_fast flags")
> Cc: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/gup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index c0c56888e7cc..958ab0757389 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2414,7 +2414,8 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
>  	unsigned long addr, len, end;
>  	int nr = 0, ret = 0;
>  
> -	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM)))
> +	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM |
> +				       FOLL_FORCE)))
>  		return -EINVAL;
>  
>  	start = untagged_addr(start) & PAGE_MASK;
> -- 
> 2.24.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
