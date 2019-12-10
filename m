Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76E118A01
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 14:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DA66E107;
	Tue, 10 Dec 2019 13:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDDA6E107
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 13:39:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 816B4B016;
 Tue, 10 Dec 2019 13:39:35 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id AF0221E0B23; Tue, 10 Dec 2019 14:39:32 +0100 (CET)
Date: Tue, 10 Dec 2019 14:39:32 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v8 24/26] mm/gup: track FOLL_PIN pages
Message-ID: <20191210133932.GH1551@quack2.suse.cz>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
 <20191209225344.99740-25-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209225344.99740-25-jhubbard@nvidia.com>
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
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 09-12-19 14:53:42, John Hubbard wrote:
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
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Looks nice, some comments below...

> +/*
> + * try_grab_compound_head() - attempt to elevate a page's refcount, by a
> + * flags-dependent amount.
> + *
> + * This has a default assumption of "use FOLL_GET behavior, if FOLL_PIN =
is not
> + * set".
> + *
> + * "grab" names in this file mean, "look at flags to decide with to use =
FOLL_PIN
> + * or FOLL_GET behavior, when incrementing the page's refcount.
> + */
> +static struct page *try_grab_compound_head(struct page *page, int refs,
> +					   unsigned int flags)
> +{
> +	if (flags & FOLL_PIN)
> +		return try_pin_compound_head(page, refs);
> +
> +	return try_get_compound_head(page, refs);
> +}
> +
> +/**
> + * grab_page() - elevate a page's refcount by a flag-dependent amount
> + *
> + * This might not do anything at all, depending on the flags argument.
> + *
> + * "grab" names in this file mean, "look at flags to decide with to use =
FOLL_PIN
                                                               ^^^ whether

> + * or FOLL_GET behavior, when incrementing the page's refcount.
> + *
> + * @page:	pointer to page to be grabbed
> + * @flags:	gup flags: these are the FOLL_* flag values.
> + *
> + * Either FOLL_PIN or FOLL_GET (or neither) may be set, but not both at =
the same
> + * time. (That's true throughout the get_user_pages*() and pin_user_page=
s*()
> + * APIs.) Cases:
> + *
> + *	FOLL_GET: page's refcount will be incremented by 1.
> + *	FOLL_PIN: page's refcount will be incremented by GUP_PIN_COUNTING_BIA=
S.
> + */
> +void grab_page(struct page *page, unsigned int flags)
> +{
> +	if (flags & FOLL_GET)
> +		get_page(page);
> +	else if (flags & FOLL_PIN) {
> +		get_page(page);
> +		WARN_ON_ONCE(flags & FOLL_GET);
> +		/*
> +		 * Use get_page(), above, to do the refcount error
> +		 * checking. Then just add in the remaining references:
> +		 */
> +		page_ref_add(page, GUP_PIN_COUNTING_BIAS - 1);

This is wrong for two reasons:

1) You miss compound_head() indirection from get_page() for this
page_ref_add().

2) page_ref_add() could overflow the counter without noticing.

Especially with GUP_PIN_COUNTING_BIAS being non-trivial, it is realistic
that an attacker might try to overflow the page refcount and we have to
protect the kernel against that. So I think that all the places that would
use grab_page() actually need to use try_grab_page() and then gracefully
deal with the failure.

> @@ -278,11 +425,23 @@ static struct page *follow_page_pte(struct vm_area_=
struct *vma,
>  		goto retry;
>  	}
>  =

> -	if (flags & FOLL_GET) {
> +	if (flags & (FOLL_PIN | FOLL_GET)) {
> +		/*
> +		 * Allow try_get_page() to take care of error handling, for
> +		 * both cases: FOLL_GET or FOLL_PIN:
> +		 */
>  		if (unlikely(!try_get_page(page))) {
>  			page =3D ERR_PTR(-ENOMEM);
>  			goto out;
>  		}
> +
> +		if (flags & FOLL_PIN) {
> +			WARN_ON_ONCE(flags & FOLL_GET);
> +
> +			/* We got a +1 refcount from try_get_page(), above. */
> +			page_ref_add(page, GUP_PIN_COUNTING_BIAS - 1);
> +			__update_proc_vmstat(page, NR_FOLL_PIN_REQUESTED, 1);
> +		}
>  	}

The same problem here as above, plus this place should use the same
try_grab..() helper, shouldn't it?

> @@ -544,8 +703,8 @@ static struct page *follow_page_mask(struct vm_area_s=
truct *vma,
>  	/* make this handle hugepd */
>  	page =3D follow_huge_addr(mm, address, flags & FOLL_WRITE);
>  	if (!IS_ERR(page)) {
> -		BUG_ON(flags & FOLL_GET);
> -		return page;
> +		WARN_ON_ONCE(flags & (FOLL_GET | FOLL_PIN));
> +		return NULL;

I agree with the change to WARN_ON_ONCE but why is correct the change of
the return value? Note that this is actually a "success branch".

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
