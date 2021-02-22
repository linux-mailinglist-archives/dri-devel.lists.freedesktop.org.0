Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C17321454
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 11:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C856E056;
	Mon, 22 Feb 2021 10:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA2A6E056;
 Mon, 22 Feb 2021 10:46:57 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B60338ba00000>; Mon, 22 Feb 2021 02:46:56 -0800
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Feb
 2021 10:46:53 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 1/4] hmm: Device exclusive memory access
Date: Mon, 22 Feb 2021 21:46:51 +1100
Message-ID: <67252432.xGUjY6W94y@nvdebian>
In-Reply-To: <20210219094741.GA641389@infradead.org>
References: <20210219020750.16444-1-apopple@nvidia.com>
 <20210219020750.16444-2-apopple@nvidia.com>
 <20210219094741.GA641389@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1613990816; bh=WSELGhqP+NOSudWxdZmSn1jCecQ9LfJU/HOyyjATzQk=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=AsDH1KFt7q2fn1GQH1bGZsfxPuP6PWniyR68l2YMD7Q3Cfbq5uK+p+mMUtOfNCzHP
 a+hSdF72Kju84oKrEh0gg6e8rGRcP4SODxDcOyS/1SQNOgR82RHgMN4+muzfJRKteX
 TZjWkSDKTi+eWBm5dbyv/oZyE95BVowqo+OXcexYvpYnlUsHqC93D9hf3z7vCcYpXg
 beQX9uq28IHVckKy1BtFiOs2mBRghniAdXwhBHNF2E6SUF7HvL5sLv5fN7c9Krbh1R
 iMHvxXCUtmJre53wnpmserXyNhCq0cnsUNF+34d7gdgVUyWwc2BnUqJO0ARndiY3DG
 gOBglEpWEttmA==
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, 19 February 2021 8:47:41 PM AEDT Christoph Hellwig wrote:
> >  			page = migration_entry_to_page(swpent);
> >  		else if (is_device_private_entry(swpent))
> >  			page = device_private_entry_to_page(swpent);
> > +		else if (is_device_exclusive_entry(swpent))
> > +			page = device_exclusive_entry_to_page(swpent);
> 
> >  			page = migration_entry_to_page(swpent);
> >  		else if (is_device_private_entry(swpent))
> >  			page = device_private_entry_to_page(swpent);
> > +		else if (is_device_exclusive_entry(swpent))
> > +			page = device_exclusive_entry_to_page(swpent);
> 
> >  		if (is_device_private_entry(entry))
> >  			page = device_private_entry_to_page(entry);
> > +
> > +		if (is_device_exclusive_entry(entry))
> > +			page = device_exclusive_entry_to_page(entry);
> 
> Any chance we can come up with a clever scheme to avoid all this
> boilerplate code (and maybe also what it gets compiled to)?

If I open code the entry_to_page() functions as suggested below then these 
simplify down to single if statements like so:

                if (is_migration_entry(entry) ||
                    is_device_private_entry(entry) ||
                    is_device_exclusive_entry(entry))
                        page = pfn_to_page(swp_offset(entry));

I could simplify further by hiding that in a single static inline like so:

static inline bool is_special_entry(swp_entry_t entry)
{
	return is_migration_entry(entry) ||
			is_device_private_entry(entry) ||
          is_device_exclusive_entry(entry);
}

My only concern with doing that is these entries can't *always* be treated the 
same so it might make it too easy to overlook the subtle differences.

> > diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> > index 866a0fa104c4..5d28ff6d4d80 100644
> > --- a/include/linux/hmm.h
> > +++ b/include/linux/hmm.h
> > @@ -109,6 +109,10 @@ struct hmm_range {
> >   */
> >  int hmm_range_fault(struct hmm_range *range);
> >  
> > +int hmm_exclusive_range(struct mm_struct *mm, unsigned long start,
> > +			unsigned long end, struct page **pages);
> > +vm_fault_t hmm_remove_exclusive_entry(struct vm_fault *vmf);
> 
> Can we avoid the hmm naming for new code (we should probably also kill
> it off for the existing code)?

Sure. I ended up stuffing it in there for the moment because I didn't know of 
any other "obvious" spot to put it. How about these for names:

int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
			unsigned long end, struct page **pages);
vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf);

I am open to any alternative naming suggestions though.

> > +#define free_swap_and_cache(e) ({(is_migration_entry(e) || 
is_device_private_entry(e) \
> > +					|| is_device_exclusive_entry(e)); })
> > +#define swapcache_prepare(e) ({(is_migration_entry(e) || 
is_device_private_entry(e) \
> > +					|| is_device_exclusive_entry(e)); })
> Can you turn these into properly formatted inline functions?  As-is this
> becomes pretty unreadable.

Ok, if I add a is_special_entry() function as suggested above these could just 
use that.
 
> > +static inline void make_device_exclusive_entry_read(swp_entry_t *entry)
> > +{
> > +	*entry = swp_entry(SWP_DEVICE_EXCLUSIVE_READ, swp_offset(*entry));
> > +}
> 
> s/make_device_exclusive_entry_read/mark_device_exclusive_entry_readable/
> ??

See my next comment.

> > +
> > +static inline swp_entry_t make_device_exclusive_entry(struct page *page, 
bool write)
> > +{
> > +	return swp_entry(write ? SWP_DEVICE_EXCLUSIVE_WRITE : 
SWP_DEVICE_EXCLUSIVE_READ,
> > +			 page_to_pfn(page));
> > +}
> 
> I'd split this into two helpers, which is easier to follow and avoids
> the pointlessly overlong lines.

I assume you mean separate read and write functions instead of using the write 
flag?

These are based on the existing device private functions which themselves 
looked to be based on the migration entry functions. It would be good to keep 
these consistent so when making the changes above I would also refactor the 
existing make_device_private_entry() and make_migration_entry() functions to 
match as well.

As a test I tried refactoring the migration entry functions into the below and 
it seemed to make things a bit easier to follow if not a little verbose:

static inline int is_writable_migration_entry(swp_entry_t entry);
static inline swp_entry_t make_readable_migration_entry(pgoff_t offset);
static inline swp_entry_t make_writable_migration_entry(pgoff_t offset);
static inline int is_migration_entry(swp_entry_t entry);

So I can do that along with the same refactoring of device private accessor 
functions as a prep patch if that seems reasonable?

> > +static inline bool is_device_exclusive_entry(swp_entry_t entry)
> > +{
> > +	int type = swp_type(entry);
> > +	return type == SWP_DEVICE_EXCLUSIVE_READ || type == 
SWP_DEVICE_EXCLUSIVE_WRITE;
> > +}
> 
> Another overly long line.  I also wouldn't bother with the local
> variable:
> 
> 	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_READ ||
> 		swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
> 		
> 
> > +static inline bool is_write_device_exclusive_entry(swp_entry_t entry)
> > +{
> > +	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
> > +}
> 
> Or reuse these kind of helpers..
>
> > +
> > +static inline unsigned long device_exclusive_entry_to_pfn(swp_entry_t 
entry)
> > +{
> > +	return swp_offset(entry);
> > +}
> > +
> > +static inline struct page *device_exclusive_entry_to_page(swp_entry_t 
entry)
> > +{
> > +	return pfn_to_page(swp_offset(entry));
> > +}
> 
> I'd rather open code these two, and as a prep patch also kill off the
> equivalents for the migration and device private entries, which would
> actually clean up a lot of the mess mentioned in my first comment above.

Ok, I have just tried doing that and it ends up being more concise and 
accurate so I'll add it to the series. 

> > +static int hmm_exclusive_skip(unsigned long start,
> > +		      unsigned long end,
> > +		      __always_unused int depth,
> > +		      struct mm_walk *walk)
> > +{
> > +	struct hmm_exclusive_walk *hmm_exclusive_walk = walk->private;
> > +	unsigned long addr;
> > +
> > +	for (addr = start; addr < end; addr += PAGE_SIZE)
> > +		hmm_exclusive_walk->pages[hmm_exclusive_walk->npages++] = NULL;
> > +
> > +	return 0;
> > +}
> 
> Wouldn't pre-zeroing the array be simpler and more efficient?

Good point. I had other code here but I didn't need it and should have just 
removed what was left.

> > +int hmm_exclusive_range(struct mm_struct *mm, unsigned long start,
> > +			unsigned long end, struct page **pages)
> > +{
> > +	struct hmm_exclusive_walk hmm_exclusive_walk = { .pages = pages, 
.npages = 0 };
> > +	int i;
> > +
> > +	/* Collect and lock candidate pages */
> > +	walk_page_range(mm, start, end, &hmm_exclusive_walk_ops, 
&hmm_exclusive_walk);
> 
> Please avoid the overly long lines.
> 
> But more importantly:  Unless I'm missing something obvious this
> walk_page_range call just open codes get_user_pages_fast, why can't you
> use that?

Good idea, you aren't missing anything although I don't think 
get_user_pages_fast() will work as the driver needs to be able to operate on a 
remote mm_struct. 

But something like get_user_pages_remote() would work better than open-coding 
it.

> > +#if defined(CONFIG_ARCH_ENABLE_THP_MIGRATION) || defined(CONFIG_HUGETLB)
> > +		if (PageTransHuge(page)) {
> > +			VM_BUG_ON_PAGE(1, page);
> > +			continue;
> > +		}
> > +#endif
> 
> Doesn't PageTransHuge always return false for that case?  If not
> shouldn't we make sure it does?

Right, this is probably an overly defensive check so I'll remove it.

[snip - will address code format/structure suggestions]

> 
> try_to_unmap_one has turned into a monster.  A little refactoring to
> split it into managable pieces would be nice.
> 

Agreed, adding this it did seem a little unwieldy. I will see if I can do a 
bit of refactoring for the next version.

 - Alistair



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
