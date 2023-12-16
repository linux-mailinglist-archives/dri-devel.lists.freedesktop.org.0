Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A673C815813
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 07:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FCA10E00B;
	Sat, 16 Dec 2023 06:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE6310E00B
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 06:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hikfDAKrvbZdCpuksOToLWPQ2TZyWP0wuE1P2b3kJSY=; b=IJ2v6JWxxYWuFGXIzSyUatiqpq
 5GHzQDbCoSpbtetEFOyARTHfle/ebkT3owqDfzyqOdGTRJ7jR3ADICgAJyn/l7Ku8dL5XOF9cIm6W
 vOXsVJdaGv69tWQpO+Rc9+IVHg+4PaGRHrJ1ZThybwNGeanUWXJ0p9hkojmg5o44/nGOuoA7HPX9j
 8hYCxOZ2pQuZJGcU4zk/58gKzaTIQwhA1gqUlBgS/bofb8ZeouILJZzGI0CCjLT7XR57DRVkEAi8w
 2ZiR5KJfy22NfLPpgAC+Lm3DeGtoi/XBQC5ojia68MSNT1RppsbUl9aFgBDKerDHV4DG6ylcZcHRa
 wfB992TQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1rEOMg-007mKk-Dd; Sat, 16 Dec 2023 06:41:34 +0000
Date: Sat, 16 Dec 2023 06:41:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v8 3/6] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios (v8)
Message-ID: <ZX1Gnh+KhkTk3CyL@casper.infradead.org>
References: <20231216060536.3716466-1-vivek.kasireddy@intel.com>
 <20231216060536.3716466-4-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231216060536.3716466-4-vivek.kasireddy@intel.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Christoph Hellwig <hch@lst.de>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 10:05:33PM -0800, Vivek Kasireddy wrote:
> +++ b/include/linux/memfd.h
> @@ -6,11 +6,16 @@
>  
>  #ifdef CONFIG_MEMFD_CREATE
>  extern long memfd_fcntl(struct file *file, unsigned int cmd, unsigned int arg);
> +extern struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx);

You don't need the 'extern' for functions.

>  #else
>  static inline long memfd_fcntl(struct file *f, unsigned int c, unsigned int a)
>  {
>  	return -EINVAL;
>  }
> +static inline struct page *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
>  #endif

Different return types depending on the CONFIG selected ...
