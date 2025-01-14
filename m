Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805ABA101CB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A94210E35E;
	Tue, 14 Jan 2025 08:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSffik+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0F010E35A;
 Tue, 14 Jan 2025 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736842334; x=1768378334;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pxe5Cr3IUU4vuhI2W5Tsk9Ljrj/+VC3k0IJ02hJCG94=;
 b=dSffik+J7Wc3WNvzaWvTYc3sul4P+7H/6hERZwI9SV/AMQV4j6WEvtUd
 R2ezrxnx9Z4KOovDLDmqNvK0mMu6EpZMKpAeigHxR6OXzXhtJW9m+gGGy
 lDvGqRzBCiMOB+Zf2KsJMOY3mvwyseHyYkEQ4vb3IGNIC9a5xqBp99eri
 0TabWialFJxrwYZlNLe7dQbuRuQT0Aoct7TMuif9C2hzt5TfKxOH/Mk3k
 vWp06LMDrPqAEvxCC4hUFsrdg9DGX9Zrqfs+sjXEKDGhduOm36crd9Blz
 VY83B9yJhtolq/wjOYlBuSvacPpFLMO3ORrUBkL217rAOJ5ZCG493e9ff g==;
X-CSE-ConnectionGUID: pk4MxvNWSlCUYw8s+uNAEw==
X-CSE-MsgGUID: cXOtO2zxRf+uZCYWkFWTIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40893199"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="40893199"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:12:13 -0800
X-CSE-ConnectionGUID: q+uksDtPR+etdITJ2foqng==
X-CSE-MsgGUID: +ZAIAAAPT/WLm4t+jo2BVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105220331"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP; 14 Jan 2025 00:12:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id 6A55439C; Tue, 14 Jan 2025 10:12:03 +0200 (EET)
Date: Tue, 14 Jan 2025 10:12:03 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
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
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhao <yuzhao@google.com>,
 intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] mm/swap: Use PG_dropbehind instead of PG_reclaim
Message-ID: <sct6vvupd4cp6xt66nn6sfs7w3srpx6zcxxsn6rz5qo4tz3la6@btdqsbicmrto>
References: <20250113093453.1932083-1-kirill.shutemov@linux.intel.com>
 <20250113093453.1932083-5-kirill.shutemov@linux.intel.com>
 <CAJD7tkYH8KO8NLJY564PRAmW-mtMfDCMTECGKyYyVAf+JtTcRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD7tkYH8KO8NLJY564PRAmW-mtMfDCMTECGKyYyVAf+JtTcRA@mail.gmail.com>
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

On Mon, Jan 13, 2025 at 08:17:20AM -0800, Yosry Ahmed wrote:
> On Mon, Jan 13, 2025 at 1:35 AM Kirill A. Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
> >
> > The recently introduced PG_dropbehind allows for freeing folios
> > immediately after writeback. Unlike PG_reclaim, it does not need vmscan
> > to be involved to get the folio freed.
> >
> > Instead of using folio_set_reclaim(), use folio_set_dropbehind() in
> > lru_deactivate_file().
> >
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > ---
> >  mm/swap.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/mm/swap.c b/mm/swap.c
> > index fc8281ef4241..4eb33b4804a8 100644
> > --- a/mm/swap.c
> > +++ b/mm/swap.c
> > @@ -562,14 +562,8 @@ static void lru_deactivate_file(struct lruvec *lruvec, struct folio *folio)
> >         folio_clear_referenced(folio);
> >
> >         if (folio_test_writeback(folio) || folio_test_dirty(folio)) {
> > -               /*
> > -                * Setting the reclaim flag could race with
> > -                * folio_end_writeback() and confuse readahead.  But the
> > -                * race window is _really_ small and  it's not a critical
> > -                * problem.
> > -                */
> >                 lruvec_add_folio(lruvec, folio);
> > -               folio_set_reclaim(folio);
> > +               folio_set_dropbehind(folio);
> >         } else {
> >                 /*
> >                  * The folio's writeback ended while it was in the batch.
> 
> Now there's a difference in behavior here depending on whether or not
> the folio is under writeback (or will be written back soon). If it is,
> we set PG_dropbehind to get it freed right after, but if writeback has
> already ended we put it on the tail of the LRU to be freed later.
> 
> It's a bit counterintuitive to me that folios with pending writeback
> get freed faster than folios that completed their writeback already.
> Am I missing something?

Yeah, it is strange.

I think we can drop the writeback/dirty check. Set PG_dropbehind and put
the page on the tail of LRU unconditionally. The check was required to
avoid confusion with PG_readahead.

Comment above the function is not valid anymore.

But the folio that is still dirty under writeback will be freed faster as
we get rid of the folio just after writeback is done while clean page can
dangle on LRU for a while.

I don't think we have any convenient place to free clean dropbehind page
other than shrink_folio_list(). Or do we?

Looking at shrink_folio_list(), I think we need to bypass page demotion
for PG_dropbehind pages.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
