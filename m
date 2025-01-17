Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A860A14B47
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AAC10E3A4;
	Fri, 17 Jan 2025 08:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0LDn8W6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4757110EA99;
 Fri, 17 Jan 2025 08:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737103143; x=1768639143;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uy8BcdVQj4lUlt1pGtuypx5tRMlIIYJH4Xw1bOGn4lY=;
 b=D0LDn8W6sj+DyiqevA8zlfTV1eR2KfOc1w2UdPDt9w/p45sGTyfE4lBe
 BHekyc7+vP0+yI3jh3J4pk7aaINatin/Runo+dQmBnMln79U7K/WAB2ck
 RnEcB2kHz6sv/U2nz7rz8b2mxcZBt/bUCJ/WXrUWYxZFsLU2jJkq5B8Db
 t71PVCQcrfx/okV0bwahYWynloUDpFSm2So3EgWKwM5rnFeFQjvLhliPR
 A8FS0Wx5CpdI5RIaLMAB/faeVu3zCe7BQ5Zm6N7h8NWYyFxSfS8xryaY7
 zvmvNCe8MtN8QDNvWmJdzlIyghxdH6GJvkswgMcqfbn4ShXyb+P9CUQGt w==;
X-CSE-ConnectionGUID: UfOPrPLoTFecnENgaz0kxA==
X-CSE-MsgGUID: hYOalHooSEigwdKsIlFwJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="41294811"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="41294811"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 00:39:02 -0800
X-CSE-ConnectionGUID: 61Goo4gqR2i2GCCEPc+/Kg==
X-CSE-MsgGUID: +lDePOewTJmUoUeXzNRQJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110381817"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2025 00:38:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id 2C8E610F; Fri, 17 Jan 2025 10:38:53 +0200 (EET)
Date: Fri, 17 Jan 2025 10:38:53 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Yu Zhao <yuzhao@google.com>
Cc: Matthew Wilcox <willy@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Christian Brauner <brauner@kernel.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 David Airlie <airlied@gmail.com>, David Hildenbrand <david@redhat.com>,
 Hao Ge <gehao@kylinos.cn>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Josef Bacik <josef@toxicpanda.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Nhat Pham <nphamcs@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 Steven Rostedt <rostedt@goodmis.org>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Vlastimil Babka <vbabka@suse.cz>, Yosry Ahmed <yosryahmed@google.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCHv2 05/11] mm/truncate: Use folio_set_dropbehind() instead
 of deactivate_file_folio()k
Message-ID: <yy55r5zwiwjgad52hgqclhg76p36jrnine37uffudmdmauxx5l@7jztoqpzscoj>
References: <20250115093135.3288234-1-kirill.shutemov@linux.intel.com>
 <20250115093135.3288234-6-kirill.shutemov@linux.intel.com>
 <Z4gqJqcO8wau0sgN@casper.infradead.org>
 <CAOUHufZ42ZV1SU+rGLM-2j2Hp43Q9eLY_yFYg8jsifOfcPHUgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOUHufZ42ZV1SU+rGLM-2j2Hp43Q9eLY_yFYg8jsifOfcPHUgQ@mail.gmail.com>
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

On Wed, Jan 15, 2025 at 02:46:44PM -0700, Yu Zhao wrote:
> On Wed, Jan 15, 2025 at 2:35 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Wed, Jan 15, 2025 at 11:31:29AM +0200, Kirill A. Shutemov wrote:
> > > -static void lru_deactivate_file(struct lruvec *lruvec, struct folio *folio)
> > > -{
> > > -     bool active = folio_test_active(folio) || lru_gen_enabled();
> > > -     long nr_pages = folio_nr_pages(folio);
> > > -
> > > -     if (folio_test_unevictable(folio))
> > > -             return;
> > > -
> > > -     /* Some processes are using the folio */
> > > -     if (folio_mapped(folio))
> > > -             return;
> > > -
> > > -     lruvec_del_folio(lruvec, folio);
> > > -     folio_clear_active(folio);
> > > -     folio_clear_referenced(folio);
> > > -
> > > -     if (folio_test_writeback(folio) || folio_test_dirty(folio)) {
> > > -             /*
> > > -              * Setting the reclaim flag could race with
> > > -              * folio_end_writeback() and confuse readahead.  But the
> > > -              * race window is _really_ small and  it's not a critical
> > > -              * problem.
> > > -              */
> > > -             lruvec_add_folio(lruvec, folio);
> > > -             folio_set_reclaim(folio);
> > > -     } else {
> > > -             /*
> > > -              * The folio's writeback ended while it was in the batch.
> > > -              * We move that folio to the tail of the inactive list.
> > > -              */
> > > -             lruvec_add_folio_tail(lruvec, folio);
> > > -             __count_vm_events(PGROTATED, nr_pages);
> > > -     }
> > > -
> > > -     if (active) {
> > > -             __count_vm_events(PGDEACTIVATE, nr_pages);
> > > -             __count_memcg_events(lruvec_memcg(lruvec), PGDEACTIVATE,
> > > -                                  nr_pages);
> > > -     }
> > > -}
> >
> > > +++ b/mm/truncate.c
> > > @@ -486,7 +486,7 @@ unsigned long mapping_try_invalidate(struct address_space *mapping,
> > >                        * of interest and try to speed up its reclaim.
> > >                        */
> > >                       if (!ret) {
> > > -                             deactivate_file_folio(folio);
> > > +                             folio_set_dropbehind(folio);
> >
> > brr.
> >
> > This is a fairly substantial change in semantics, and maybe it's fine.
> >
> > At a high level, we're trying to remove pages from an inode that aren't
> > in use.  But we might find that some of them are in use (eg they're
> > mapped or under writeback).  If they are mapped, we don't currently
> > try to accelerate their reclaim, but now we're going to mark them
> > as dropbehind.  I think that's wrong.
> >
> > If they're dirty or under writeback, then yes, mark them as dropbehind, but
> > I think we need to be a little more surgical here.  Maybe preserve the
> > unevictable check too.
> 
> Right -- deactivate_file_folio() does make sure the folio is not
> unevictable or mapped. So probably something like below would the
> change in semantics be close enough?
> 
>   if (!folio_test_unevictable(folio) && !folio_mapped(folio))
>     folio_set_dropbehind(folio);

Okay, makes sense to me.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
