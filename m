Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D88120655
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 13:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2CD6E50D;
	Mon, 16 Dec 2019 12:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8286E50D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 12:53:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29D62AFAF;
 Mon, 16 Dec 2019 12:53:55 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 69B531E0B2E; Mon, 16 Dec 2019 13:53:53 +0100 (CET)
Date: Mon, 16 Dec 2019 13:53:53 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v11 23/25] mm/gup: track FOLL_PIN pages
Message-ID: <20191216125353.GF22157@quack2.suse.cz>
References: <20191212101741.GD10065@quack2.suse.cz>
 <20191214032617.1670759-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191214032617.1670759-1-jhubbard@nvidia.com>
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
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 13-12-19 19:26:17, John Hubbard wrote:
> Add tracking of pages that were pinned via FOLL_PIN.
> =

> As mentioned in the FOLL_PIN documentation, callers who effectively set
> FOLL_PIN are required to ultimately free such pages via unpin_user_page().
> The effect is similar to FOLL_GET, and may be thought of as "FOLL_GET
> for DIO and/or RDMA use".
> =

> Pages that have been pinned via FOLL_PIN are identifiable via a
> new function call:
> =

>    bool page_dma_pinned(struct page *page);
> =

> What to do in response to encountering such a page, is left to later
> patchsets. There is discussion about this in [1], [2], and [3].
> =

> This also changes a BUG_ON(), to a WARN_ON(), in follow_page_mask().
> =

> [1] Some slow progress on get_user_pages() (Apr 2, 2019):
>     https://lwn.net/Articles/784574/
> [2] DMA and get_user_pages() (LPC: Dec 12, 2018):
>     https://lwn.net/Articles/774411/
> [3] The trouble with get_user_pages() (Apr 30, 2018):
>     https://lwn.net/Articles/753027/
> =

> Suggested-by: Jan Kara <jack@suse.cz>
> Suggested-by: J=E9r=F4me Glisse <jglisse@redhat.com>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> =

> Hi Jan,
> =

> This should address all of your comments for patch 23!

Thanks. One comment below:

> @@ -1486,6 +1500,10 @@ struct page *follow_trans_huge_pmd(struct vm_area_=
struct *vma,
>  	VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
>  	if (flags & FOLL_TOUCH)
>  		touch_pmd(vma, addr, pmd, flags);
> +
> +	if (!try_grab_page(page, flags))
> +		return ERR_PTR(-ENOMEM);
> +
>  	if ((flags & FOLL_MLOCK) && (vma->vm_flags & VM_LOCKED)) {
>  		/*
>  		 * We don't mlock() pte-mapped THPs. This way we can avoid

I'd move this still a bit higher - just after VM_BUG_ON_PAGE() and before
if (flags & FOLL_TOUCH) test. Because touch_pmd() can update page tables
and we don't won't that if we're going to fail the fault.

With this fixed, the patch looks good to me so you can then add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
