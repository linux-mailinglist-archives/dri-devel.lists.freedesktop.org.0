Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CACF39F940
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 16:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B706E1AA;
	Tue,  8 Jun 2021 14:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71976E1AA;
 Tue,  8 Jun 2021 14:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4gjD/K0RJIVOtwu8+/5+d0vDpUi8ABWWXPFBzL4weg8=; b=UITrtrWpm90OSbQcoyBOBGZa3/
 SrJ1Biu7Q+XI522VJu3OFQzRWy8CEPLaLie1ja2zMeyIv12VnfARLe4W32E8qMSJ+XDhSeECxEi4Q
 ppo327v1ac7wuvd85OwRejz4KLtWcUz7B6S4/ywvIb9ZFJco8gGyA3BYs/uyiiMeKkM0Cu5SxlfzD
 Y3iIUFcH6PFVZv2n2Q7AVgo1jSxQTJEyTQVtkiFIuS7AyP+v27np25IYD0qPywAiNRoeY+l2Q7i3T
 X9rcervGoEKO0mCXTl6gAQojwYO7t8LbQbVMzyul7lzuvTl0v3t9qNzPrxzodGilEekqSm2P+kYDB
 dURgv8Yg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lqcmv-00H1bz-KR; Tue, 08 Jun 2021 14:33:12 +0000
Date: Tue, 8 Jun 2021 15:33:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Liam Howlett <liam.howlett@oracle.com>
Subject: Re: [RFC PATCH v2 1/8] ext4/xfs: add page refcount helper
Message-ID: <YL9/ob6taZXHow5t@casper.infradead.org>
References: <20210607204226.7743-1-alex.sierra@amd.com>
 <20210607204226.7743-2-alex.sierra@amd.com>
 <20210608002858.gegg6sl2z2dwwstb@revolver>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608002858.gegg6sl2z2dwwstb@revolver>
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
Cc: Alex Sierra <alex.sierra@amd.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 12:29:04AM +0000, Liam Howlett wrote:
> * Alex Sierra <alex.sierra@amd.com> [210607 16:43]:
> > From: Ralph Campbell <rcampbell@nvidia.com>
> > 
> > There are several places where ZONE_DEVICE struct pages assume a reference
> > count == 1 means the page is idle and free. Instead of open coding this,
> > add a helper function to hide this detail.
> > 
> > diff --git a/include/linux/dax.h b/include/linux/dax.h
> > index b52f084aa643..8909a91cd381 100644
> > --- a/include/linux/dax.h
> > +++ b/include/linux/dax.h
> > @@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space *mapping)
> >  	return mapping->host && IS_DAX(mapping->host);
> >  }
> >  
> > +static inline bool dax_layout_is_idle_page(struct page *page)
> > +{
> > +	return page_ref_count(page) == 1;
> > +}
> 
> If this races with page_ref_count(page) == 0, then it will return false
> that a page is idle when the page is being freed.  I don't know the code
> well enough to say if this is an issue or not so please let me know.
> 
> For example:
> !dax_layout_is_idle_page() will return true in dax_busy_page() above
> when the count is 0 and return the page.
> 
> Maybe you are sure to have at least one reference when calling this?  It
> might be worth adding a comment.

You're getting confused by the problem that the next patch fixes, which
is that devmap pages were stupidly given an elevated refcount.  devmap
pages are considered "free" when their refcount is 1.  See
put_page(), put_devmap_managed_page() and so on.
