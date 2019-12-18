Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D70124C65
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 17:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B7D6E872;
	Wed, 18 Dec 2019 16:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645276E872
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 16:04:22 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e28so2725463ljo.9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 08:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=lx2tYrxH76TzOflvrZdMYwmw6kPdiwBO2AoS02kSF8I=;
 b=z5wPjhUP09OUtbjMjcfRXuIHIwQ6JsCqdqDQrpkHeR2FGTJKRgTZuRVpd8Ejot/uzW
 WkIRJ1o23H1rHR8qrWtCj6uBitDImUrGPYpJ5mMWyp3EmJAhL7rYh6HpljzRDkNNAPx0
 LUjYdc/PK8ZbQZUps8imW7pyun+gW90XpZ53fBcBIDiOV27gBLz+BEehaTKZC5uM8Oqa
 ydjJOsIeBdrZtGFXR3Ff0Wal0p2P05zNibodcJL9uNUAN8pxDWcLGNcXSYNkE83Lm4vk
 MRxOsdbgin+Oe/MgK9nfd0EbUF6BgvQFFgBekQTNtwPB0Nh3TqyAfgcwxiXCuXBEgxgt
 8yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lx2tYrxH76TzOflvrZdMYwmw6kPdiwBO2AoS02kSF8I=;
 b=ofe2L9HMZInQr+uG1cICI+pWosB5fawKCcWpLRAIl8zzpoWXGT4Q7WVBXobsiP0imZ
 j3ht6G/t2K8uR9i1cXLM1Yr3GA1xdpy16jif0dgzadhQTAtYdBQL25lSOUQuURt2tg9D
 2HrYaddKLL831dje54bXtpqJcqXHZuEX5aWYL7lolrr5QHBSfD/d3Wtp6B3/tY3QBX7T
 Q7C3ZT5Znn3mk40fsF6P4+MMpWhFEt5d16+lbamfuV1V8HBppU9bnwlG0HkeC+zhnCYj
 +Bs98zX9wBWfFDI848sIf85rmnFr1TU7QEJT+laoHgK3yNcyBsOk8dhqo9/jLcYlJdJ6
 YWuw==
X-Gm-Message-State: APjAAAWKWvyv/tgGzbxLUvWYQptppWjT4fs034O6rsvIBPmkFJoweESM
 8x5P2Ey1Pp+8Qs40qjO3oSKq5Q==
X-Google-Smtp-Source: APXvYqwF7pecGZBZMkXKVp15IXhXZo2PGYpkUgZNZl53wUwEdzClRBwVejnpDULy6WyyjOVSSgygvA==
X-Received: by 2002:a2e:9284:: with SMTP id d4mr2361276ljh.226.1576685060830; 
 Wed, 18 Dec 2019 08:04:20 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id j19sm1730231lfb.90.2019.12.18.08.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 08:04:19 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id 5A04D1012CF; Wed, 18 Dec 2019 19:04:20 +0300 (+03)
Date: Wed, 18 Dec 2019 19:04:20 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v11 04/25] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
Message-ID: <20191218160420.gyt4c45e6zsnxqv6@box>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-5-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216222537.491123-5-jhubbard@nvidia.com>
User-Agent: NeoMutt/20180716
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
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
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

On Mon, Dec 16, 2019 at 02:25:16PM -0800, John Hubbard wrote:
> An upcoming patch changes and complicates the refcounting and
> especially the "put page" aspects of it. In order to keep
> everything clean, refactor the devmap page release routines:
> =

> * Rename put_devmap_managed_page() to page_is_devmap_managed(),
>   and limit the functionality to "read only": return a bool,
>   with no side effects.
> =

> * Add a new routine, put_devmap_managed_page(), to handle checking
>   what kind of page it is, and what kind of refcount handling it
>   requires.
> =

> * Rename __put_devmap_managed_page() to free_devmap_managed_page(),
>   and limit the functionality to unconditionally freeing a devmap
>   page.

What the reason to separate put_devmap_managed_page() from
free_devmap_managed_page() if free_devmap_managed_page() has exacly one
caller? Is it preparation for the next patches?

> This is originally based on a separate patch by Ira Weiny, which
> applied to an early version of the put_user_page() experiments.
> Since then, J=E9r=F4me Glisse suggested the refactoring described above.
> =

> Cc: Christoph Hellwig <hch@lst.de>
> Suggested-by: J=E9r=F4me Glisse <jglisse@redhat.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  include/linux/mm.h | 17 +++++++++++++----
>  mm/memremap.c      | 16 ++--------------
>  mm/swap.c          | 24 ++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 18 deletions(-)
> =

> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c97ea3b694e6..77a4df06c8a7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -952,9 +952,10 @@ static inline bool is_zone_device_page(const struct =
page *page)
>  #endif
>  =

>  #ifdef CONFIG_DEV_PAGEMAP_OPS
> -void __put_devmap_managed_page(struct page *page);
> +void free_devmap_managed_page(struct page *page);
>  DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
> -static inline bool put_devmap_managed_page(struct page *page)
> +
> +static inline bool page_is_devmap_managed(struct page *page)
>  {
>  	if (!static_branch_unlikely(&devmap_managed_key))
>  		return false;
> @@ -963,7 +964,6 @@ static inline bool put_devmap_managed_page(struct pag=
e *page)
>  	switch (page->pgmap->type) {
>  	case MEMORY_DEVICE_PRIVATE:
>  	case MEMORY_DEVICE_FS_DAX:
> -		__put_devmap_managed_page(page);
>  		return true;
>  	default:
>  		break;
> @@ -971,7 +971,14 @@ static inline bool put_devmap_managed_page(struct pa=
ge *page)
>  	return false;
>  }
>  =

> +bool put_devmap_managed_page(struct page *page);
> +
>  #else /* CONFIG_DEV_PAGEMAP_OPS */
> +static inline bool page_is_devmap_managed(struct page *page)
> +{
> +	return false;
> +}
> +
>  static inline bool put_devmap_managed_page(struct page *page)
>  {
>  	return false;
> @@ -1028,8 +1035,10 @@ static inline void put_page(struct page *page)
>  	 * need to inform the device driver through callback. See
>  	 * include/linux/memremap.h and HMM for details.
>  	 */
> -	if (put_devmap_managed_page(page))
> +	if (page_is_devmap_managed(page)) {
> +		put_devmap_managed_page(page);

put_devmap_managed_page() has yet another page_is_devmap_managed() check
inside. It looks strange.

>  		return;
> +	}
>  =

>  	if (put_page_testzero(page))
>  		__put_page(page);
> diff --git a/mm/memremap.c b/mm/memremap.c
> index e899fa876a62..2ba773859031 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -411,20 +411,8 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pf=
n,
>  EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  =

>  #ifdef CONFIG_DEV_PAGEMAP_OPS
> -void __put_devmap_managed_page(struct page *page)
> +void free_devmap_managed_page(struct page *page)
>  {
> -	int count =3D page_ref_dec_return(page);
> -
> -	/* still busy */
> -	if (count > 1)
> -		return;
> -
> -	/* only triggered by the dev_pagemap shutdown path */
> -	if (count =3D=3D 0) {
> -		__put_page(page);
> -		return;
> -	}
> -
>  	/* notify page idle for dax */
>  	if (!is_device_private_page(page)) {
>  		wake_up_var(&page->_refcount);
> @@ -461,5 +449,5 @@ void __put_devmap_managed_page(struct page *page)
>  	page->mapping =3D NULL;
>  	page->pgmap->ops->page_free(page);
>  }
> -EXPORT_SYMBOL(__put_devmap_managed_page);
> +EXPORT_SYMBOL(free_devmap_managed_page);
>  #endif /* CONFIG_DEV_PAGEMAP_OPS */
> diff --git a/mm/swap.c b/mm/swap.c
> index 5341ae93861f..49f7c2eea0ba 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -1102,3 +1102,27 @@ void __init swap_setup(void)
>  	 * _really_ don't want to cluster much more
>  	 */
>  }
> +
> +#ifdef CONFIG_DEV_PAGEMAP_OPS
> +bool put_devmap_managed_page(struct page *page)
> +{
> +	bool is_devmap =3D page_is_devmap_managed(page);
> +
> +	if (is_devmap) {

Reversing the condition would save you an indentation level.

> +		int count =3D page_ref_dec_return(page);
> +
> +		/*
> +		 * devmap page refcounts are 1-based, rather than 0-based: if
> +		 * refcount is 1, then the page is free and the refcount is
> +		 * stable because nobody holds a reference on the page.
> +		 */
> +		if (count =3D=3D 1)
> +			free_devmap_managed_page(page);
> +		else if (!count)
> +			__put_page(page);
> +	}
> +
> +	return is_devmap;
> +}
> +EXPORT_SYMBOL(put_devmap_managed_page);
> +#endif
> -- =

> 2.24.1
> =

> =


-- =

 Kirill A. Shutemov
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
