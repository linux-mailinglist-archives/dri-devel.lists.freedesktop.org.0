Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0403325C3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 13:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7F86E5A4;
	Tue,  9 Mar 2021 12:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9716E5A4;
 Tue,  9 Mar 2021 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pZ/COBNbblJO+x07w0308qCGnfsww0L8iErIm0GU3pk=; b=OwbzsZ7Ekm7vjuMsGUDxy9IzZB
 aYNSzv5gJVgAdrZj4EuSbYdC1NbhsHVYWcyKD5HDML0sTHUjneU88cMrc3Usnq8uFrRYRRNCb+Hdr
 m/LqpRf/aHhyPRh4rbrxdW7Pct4tPO2kTbhNdtH+K69l6xJOlJj/z1ZgMXfV2ROYPp8npVcU+rXU2
 Dew94FhovF/W/xp164C6bDgOeS09uC5hy43MtfnWObcKL9V0I/qfat/PfktpUvW/U88XS4brjBEcF
 l9YfOHt2tK9eaWDDUj7m9uUz4lbGzPnWNMCRt191+VjJdsHevacr700C9rBOS5UCEU0HdvhMZicVp
 j5kcRFpA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lJbo5-000aTt-T6; Tue, 09 Mar 2021 12:50:04 +0000
Date: Tue, 9 Mar 2021 12:49:49 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v5 1/8] mm: Remove special swap entry functions
Message-ID: <20210309124949.GJ3479805@casper.infradead.org>
References: <20210309121505.23608-1-apopple@nvidia.com>
 <20210309121505.23608-2-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309121505.23608-2-apopple@nvidia.com>
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
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 09, 2021 at 11:14:58PM +1100, Alistair Popple wrote:
> -static inline struct page *migration_entry_to_page(swp_entry_t entry)
> -{
> -	struct page *p = pfn_to_page(swp_offset(entry));
> -	/*
> -	 * Any use of migration entries may only occur while the
> -	 * corresponding page is locked
> -	 */
> -	BUG_ON(!PageLocked(compound_head(p)));
> -	return p;
> -}

> +static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
> +{
> +	struct page *p = pfn_to_page(swp_offset(entry));
> +
> +	/*
> +	 * Any use of migration entries may only occur while the
> +	 * corresponding page is locked
> +	 */
> +	BUG_ON(is_migration_entry(entry) && !PageLocked(compound_head(p)));
> +
> +	return p;
> +}

I appreciate you're only moving this code, but PageLocked includes an
implicit compound_head():

1. __PAGEFLAG(Locked, locked, PF_NO_TAIL)

2. #define __PAGEFLAG(uname, lname, policy)                                \
        TESTPAGEFLAG(uname, lname, policy)                              \

3. #define TESTPAGEFLAG(uname, lname, policy)                              \
static __always_inline int Page##uname(struct page *page)               \
        { return test_bit(PG_##lname, &policy(page, 0)->flags); }

4. #define PF_NO_TAIL(page, enforce) ({                                    \
                VM_BUG_ON_PGFLAGS(enforce && PageTail(page), page);     \
                PF_POISONED_CHECK(compound_head(page)); })

5. #define PF_POISONED_CHECK(page) ({                                      \
                VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
                page; })


This macrology isn't easy to understand the first time you read it (nor,
indeed, the tenth time), so let me decode it:

Substitute 5 into 4 and remove irrelevancies:

6. #define PF_NO_TAIL(page, enforce) compound_head(page)

Expand 1 in 2:

7.	TESTPAGEFLAG(Locked, locked, PF_NO_TAIL)

Expand 7 in 3:

8. static __always_inline int PageLocked(struct page *page)
	{ return test_bit(PG_locked, &PF_NO_TAIL(page, 0)->flags); }

Expand 6 in 8:

9. static __always_inline int PageLocked(struct page *page)
	{ return test_bit(PG_locked, &compound_head(page)->flags); }

(in case it's not clear, compound_head() is idempotent.  that is:
	f(f(a)) == f(a))
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
