Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98067A0BBEB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 16:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8DD10E6E1;
	Mon, 13 Jan 2025 15:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="CdjcRBsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6175 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jan 2025 15:29:01 UTC
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E7810E6E2;
 Mon, 13 Jan 2025 15:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9VqsxP5RvX30QYR7yuJXPx1d9hNGDEzEGpTQhe2nivM=; b=CdjcRBsRqWXwULJgsV1wbho1ct
 7bTBs6L7iQzmzycFuSKc3xawEIdDX6neDB+BsFao8dw/hNdqvsbqz16LmPfb6KE9Mcb0Dpn99jDPU
 SEpzMg53tgwVFDsj8XeyPgFhGYX9YNh13TaZrHq+5FGvlZ6odcMzl7yyIGXswughRIwhc83j7oaUm
 6IDxxbc+Slmv5umkq69QkuB1Ij7g/qM4xeV06Wx5aT2zsL98dSTqjDZ3AqlWb0KCHznpS4kBEbclG
 n2e52Je5nmDYIbBQFg9qHHQKjP/1tcEMkuoo013fhgQH3BPgsPjDBRHZ1jUqeZ060nyxQygSxdZG3
 mRr0GgSg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tXMMt-00000000snb-2w4K; Mon, 13 Jan 2025 15:28:43 +0000
Date: Mon, 13 Jan 2025 15:28:43 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Christian Brauner <brauner@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Carpenter <dan.carpenter@linaro.org>, David Airlie <airlied@gmail.com>,
 David Hildenbrand <david@redhat.com>, Hao Ge <gehao@kylinos.cn>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Josef Bacik <josef@toxicpanda.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Nhat Pham <nphamcs@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Ran Xiaokai <ran.xiaokai@zte.com.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Vlastimil Babka <vbabka@suse.cz>,
 Yosry Ahmed <yosryahmed@google.com>, Yu Zhao <yuzhao@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] mm: Remove PG_reclaim
Message-ID: <Z4UxK_bsFD7TtL1l@casper.infradead.org>
References: <20250113093453.1932083-1-kirill.shutemov@linux.intel.com>
 <20250113093453.1932083-9-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113093453.1932083-9-kirill.shutemov@linux.intel.com>
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

On Mon, Jan 13, 2025 at 11:34:53AM +0200, Kirill A. Shutemov wrote:
> diff --git a/mm/migrate.c b/mm/migrate.c
> index caadbe393aa2..beba72da5e33 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -686,6 +686,8 @@ void folio_migrate_flags(struct folio *newfolio, struct folio *folio)
>  		folio_set_young(newfolio);
>  	if (folio_test_idle(folio))
>  		folio_set_idle(newfolio);
> +	if (folio_test_readahead(folio))
> +		folio_set_readahead(newfolio);
>  
>  	folio_migrate_refs(newfolio, folio);
>  	/*

Not a problem with this patch ... but aren't we missing a
test_dropbehind / set_dropbehind pair in this function?  Or are we
prohibited from migrating a folio with the dropbehind flag set
somewhere?

> +++ b/mm/swap.c
> @@ -221,22 +221,6 @@ static void lru_move_tail(struct lruvec *lruvec, struct folio *folio)
>  	__count_vm_events(PGROTATED, folio_nr_pages(folio));
>  }
>  
> -/*
> - * Writeback is about to end against a folio which has been marked for
> - * immediate reclaim.  If it still appears to be reclaimable, move it
> - * to the tail of the inactive list.
> - *
> - * folio_rotate_reclaimable() must disable IRQs, to prevent nasty races.
> - */
> -void folio_rotate_reclaimable(struct folio *folio)
> -{
> -	if (folio_test_locked(folio) || folio_test_dirty(folio) ||
> -	    folio_test_unevictable(folio))
> -		return;
> -
> -	folio_batch_add_and_move(folio, lru_move_tail, true);
> -}

I think this is the last caller of lru_move_tail(), which means we can
get rid of fbatches->lru_move_tail and the local_lock that protects it.
Or did I miss something?
