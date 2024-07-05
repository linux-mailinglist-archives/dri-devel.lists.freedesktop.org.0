Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D1A928E57
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 22:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456CD10E05A;
	Fri,  5 Jul 2024 20:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JAbNq0Vi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB2D10E05A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 20:48:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9C170CE3EFA;
 Fri,  5 Jul 2024 20:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B458FC4AF0A;
 Fri,  5 Jul 2024 20:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720212508;
 bh=emKAb+tft4K0foCSYr6sbq2VPkioj9JnikHXC08E3Ec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JAbNq0ViVhr+cccjh6Gzx0zT7EFBDA6vCNo7U0ZIHH4rNpWtw+x2/+S1XuyTdq691
 bnN+ju+K2EIsD7acjjiz7NyueF/8av7nMH2npVqQr0qr6j9V+Hq+4/6XoJbnTIPI4H
 i3g0rauvRfdqpzA2FxU25RP2mr5fqX3tjDSccGhzNE491868IIb2BCbWJR1I/SOfe8
 r5eH7LnSA13ninCr9W/FBMqTLrBNk1CPvIBy6LuMip3asVVvdtQkEc9j0se0GTpU9I
 ywWcWHRBWWo3UNdmJnzY1ZTjzVrWdfM8f2eyxc90E1TP8NdepfntOUV2+BVNUjT5e5
 uoh2AgtMF7S9w==
From: SeongJae Park <sj@kernel.org>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: SeongJae Park <sj@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v16 3/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Date: Fri,  5 Jul 2024 13:48:25 -0700
Message-Id: <20240705204825.109189-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240624063952.1572359-4-vivek.kasireddy@intel.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Vivek and Andrew,

On Sun, 23 Jun 2024 23:36:11 -0700 Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:

> For drivers that would like to longterm-pin the folios associated
> with a memfd, the memfd_pin_folios() API provides an option to
> not only pin the folios via FOLL_PIN but also to check and migrate
> them if they reside in movable zone or CMA block. This API
> currently works with memfds but it should work with any files
> that belong to either shmemfs or hugetlbfs. Files belonging to
> other filesystems are rejected for now.
> 
> The folios need to be located first before pinning them via FOLL_PIN.
> If they are found in the page cache, they can be immediately pinned.
> Otherwise, they need to be allocated using the filesystem specific
> APIs and then pinned.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com> (v2)
> Reviewed-by: David Hildenbrand <david@redhat.com> (v3)
> Reviewed-by: Christoph Hellwig <hch@lst.de> (v6)
> Acked-by: Dave Airlie <airlied@redhat.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  include/linux/memfd.h |   5 ++
>  include/linux/mm.h    |   3 +
>  mm/gup.c              | 137 ++++++++++++++++++++++++++++++++++++++++++
>  mm/memfd.c            |  45 ++++++++++++++
>  4 files changed, 190 insertions(+)
> 
[...]
> diff --git a/mm/gup.c b/mm/gup.c
> index a88e19c78730..94160abbf499 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
[...]
> @@ -3747,3 +3749,138 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>  				     &locked, gup_flags);
>  }
>  EXPORT_SYMBOL(pin_user_pages_unlocked);
> +
> +/**
> + * memfd_pin_folios() - pin folios associated with a memfd
[...]
> +			for (i = 0; i < nr_found; i++) {
> +				/*
> +				 * As there can be multiple entries for a
> +				 * given folio in the batch returned by
> +				 * filemap_get_folios_contig(), the below
> +				 * check is to ensure that we pin and return a
> +				 * unique set of folios between start and end.
> +				 */
> +				if (next_idx &&
> +				    next_idx != folio_index(fbatch.folios[i]))
> +					continue;
> +
> +				folio = try_grab_folio(&fbatch.folios[i]->page,
> +						       1, FOLL_PIN);
> +				if (!folio) {
> +					folio_batch_release(&fbatch);
> +					ret = -EINVAL;
> +					goto err;
> +				}

I found this patch is applied on mm-unstable as commit 7618d1ff59ef ("mm/gup:
introduce memfd_pin_folios() for pinning memfd folios").  Somehow, however, the
commit has changd the above try_grab_folio() call to try_grab_folio_fast()
call.

As a result, building kernel without CONFIG_MMU fais as below:

      CC      mm/gup.o
    mm/gup.c: In function 'memfd_pin_folios':
    mm/gup.c:3862:41: error: implicit declaration of function 'try_grab_folio_fast'; did you mean 'try_grab_folio'? [-Werror=implicit-function-declaration]
     3862 |                                 folio = try_grab_folio_fast(&fbatch.folios[i]->page,
          |                                         ^~~~~~~~~~~~~~~~~~~
          |                                         try_grab_folio
    mm/gup.c:3862:39: warning: assignment to 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     3862 |                                 folio = try_grab_folio_fast(&fbatch.folios[i]->page,
          |                                       ^

But simply changing the call back to try_grab_folio() causes another failure:

      CC      mm/gup.o
    mm/gup.c: In function 'memfd_pin_folios':
    mm/gup.c:3862:56: error: passing argument 1 of 'try_grab_folio' from incompatible pointer type [-Werror=incompatible-pointer-types]
     3862 |                                 folio = try_grab_folio(&fbatch.folios[i]->page,
          |                                                        ^~~~~~~~~~~~~~~~~~~~~~~
          |                                                        |
          |                                                        struct page *
    mm/gup.c:141:47: note: expected 'struct folio *' but argument is of type 'struct page *'
      141 | int __must_check try_grab_folio(struct folio *folio, int refs,
          |                                 ~~~~~~~~~~~~~~^~~~~
    mm/gup.c:3862:39: warning: assignment to 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     3862 |                                 folio = try_grab_folio(&fbatch.folios[i]->page,
          |                                       ^

Maybe the change has made to fix conflict with another mm-unstable commit
02a2d55767d1 ("mm: gup: stop abusing try_grab_folio"), but forgot the
CONFIG_MMU unset case?

I confirmed the failure disappears after further cleanup like below:

diff --git a/mm/gup.c b/mm/gup.c
index 46a266ed84f7..9f4902425070 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3859,9 +3859,9 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
                                    next_idx != folio_index(fbatch.folios[i]))
                                        continue;

-                               folio = try_grab_folio_fast(&fbatch.folios[i]->page,
-                                                      1, FOLL_PIN);
-                               if (!folio) {
+                               folio = page_folio(&fbatch.folios[i]->page);
+
+                               if (try_grab_folio(folio, 1, FOLL_PIN)) {
                                        folio_batch_release(&fbatch);
                                        ret = -EINVAL;
                                        goto err;

I didn't look deep into the patch, so unsure if that's a valid fix, though.
May I ask your thoughts?


Thanks,
SJ

[...]
