Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7721EA12DCC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54EF10E819;
	Wed, 15 Jan 2025 21:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="ToVkVfF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DFD10E527;
 Wed, 15 Jan 2025 21:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0OijV5p7C7RviN2UZr1cmsa6u4crmEp6ronCk1lgptI=; b=ToVkVfF9/LpCeHgqRA5mEb2Asr
 5IiQa1pSVMQ6mQ6jaE+0AsazgzqSxYkpPEmBGojEh8PatZnK/5QthRSP/VYH6rh70nn6Ke/EJPSqR
 pQvIeA+gO9O286BzuBzwiq2/nIhxNeuYTGDoy1KPurQxuR3srMkbURdzu+yYH6lHGZbedKnufVhtr
 S9bwMcCETcS5GTTW5WKl/k/od94Vb1K4FfaL3nYNNeJ4VYYUz82ygpQr3Bbz68Mw9tcQMJoi4Lsda
 Ph6zvEZ4kSPPfC4N68dEshZ6RHmhrllQtU2V+OMl8wsC0eInunxvmZ41WLChbyJSb3Mcunp/jP/Ca
 pMZOl1QA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYB30-00000002AHj-3YDk; Wed, 15 Jan 2025 21:35:34 +0000
Date: Wed, 15 Jan 2025 21:35:34 +0000
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
Subject: Re: [PATCHv2 05/11] mm/truncate: Use folio_set_dropbehind() instead
 of deactivate_file_folio()
Message-ID: <Z4gqJqcO8wau0sgN@casper.infradead.org>
References: <20250115093135.3288234-1-kirill.shutemov@linux.intel.com>
 <20250115093135.3288234-6-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115093135.3288234-6-kirill.shutemov@linux.intel.com>
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

On Wed, Jan 15, 2025 at 11:31:29AM +0200, Kirill A. Shutemov wrote:
> -static void lru_deactivate_file(struct lruvec *lruvec, struct folio *folio)
> -{
> -	bool active = folio_test_active(folio) || lru_gen_enabled();
> -	long nr_pages = folio_nr_pages(folio);
> -
> -	if (folio_test_unevictable(folio))
> -		return;
> -
> -	/* Some processes are using the folio */
> -	if (folio_mapped(folio))
> -		return;
> -
> -	lruvec_del_folio(lruvec, folio);
> -	folio_clear_active(folio);
> -	folio_clear_referenced(folio);
> -
> -	if (folio_test_writeback(folio) || folio_test_dirty(folio)) {
> -		/*
> -		 * Setting the reclaim flag could race with
> -		 * folio_end_writeback() and confuse readahead.  But the
> -		 * race window is _really_ small and  it's not a critical
> -		 * problem.
> -		 */
> -		lruvec_add_folio(lruvec, folio);
> -		folio_set_reclaim(folio);
> -	} else {
> -		/*
> -		 * The folio's writeback ended while it was in the batch.
> -		 * We move that folio to the tail of the inactive list.
> -		 */
> -		lruvec_add_folio_tail(lruvec, folio);
> -		__count_vm_events(PGROTATED, nr_pages);
> -	}
> -
> -	if (active) {
> -		__count_vm_events(PGDEACTIVATE, nr_pages);
> -		__count_memcg_events(lruvec_memcg(lruvec), PGDEACTIVATE,
> -				     nr_pages);
> -	}
> -}

> +++ b/mm/truncate.c
> @@ -486,7 +486,7 @@ unsigned long mapping_try_invalidate(struct address_space *mapping,
>  			 * of interest and try to speed up its reclaim.
>  			 */
>  			if (!ret) {
> -				deactivate_file_folio(folio);
> +				folio_set_dropbehind(folio);

brr.

This is a fairly substantial change in semantics, and maybe it's fine.

At a high level, we're trying to remove pages from an inode that aren't
in use.  But we might find that some of them are in use (eg they're
mapped or under writeback).  If they are mapped, we don't currently
try to accelerate their reclaim, but now we're going to mark them
as dropbehind.  I think that's wrong.

If they're dirty or under writeback, then yes, mark them as dropbehind, but
I think we need to be a little more surgical here.  Maybe preserve the
unevictable check too.
