Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2A0A1020A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C6C10E360;
	Tue, 14 Jan 2025 08:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFgyCgX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51ED310E360;
 Tue, 14 Jan 2025 08:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736843455; x=1768379455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d76ZuYXYGd5MhYXwKrUOaL/NFOW9yG6blep811EcGeg=;
 b=CFgyCgX16mwWlhGyfMpK3ByL7XgQN+9XpmFGjyVWnQf/9jFy/+ei+mHg
 +6vsYfHnXxT66Vmy7pNHxmhafPkXy2QYT/5ldBvhpTXfvszZSSjIt3xHq
 EIdIFHW0i8oneTIIcjiN16qALeguS79OwTdcl64aAo5TXauZSym8p8fBR
 QMQ5uLusJGsooY/QilHzw67ES2Bdh69Jl2lLYTAdwLlQAdyHsaTPnOs3P
 SvYZUZSp1xTi4rIjcVTr5ExAKnh1hFWESb9VT8nk43DwWuwRntzJE1uUq
 5tuQefcKTygKEd96Sft9ggemIuYfFHfPEVov4Ebit9DEteNhF9h+8tJ5w A==;
X-CSE-ConnectionGUID: sl3R1yiPTra0UE+rf0MqMg==
X-CSE-MsgGUID: LE8DykJgSySIMR6cpNDrvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37241816"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37241816"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:30:54 -0800
X-CSE-ConnectionGUID: OGS8UdzDSvmjat/Rleu/Tg==
X-CSE-MsgGUID: Yr9g/hOpTTeh7GM4krWnuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109880457"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP; 14 Jan 2025 00:30:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id B879339C; Tue, 14 Jan 2025 10:30:45 +0200 (EET)
Date: Tue, 14 Jan 2025 10:30:45 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jens Axboe <axboe@kernel.dk>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>, 
 Christian Brauner <brauner@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Dan Carpenter <dan.carpenter@linaro.org>, David Airlie <airlied@gmail.com>, 
 David Hildenbrand <david@redhat.com>, Hao Ge <gehao@kylinos.cn>, 
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
 Yu Zhao <yuzhao@google.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] mm: Remove PG_reclaim
Message-ID: <vpy2hikqvw3qrncjdlxp6uonpmbueoulhqipdkac7tav4t7m2s@3ebncdtepyv6>
References: <20250113093453.1932083-1-kirill.shutemov@linux.intel.com>
 <20250113093453.1932083-9-kirill.shutemov@linux.intel.com>
 <Z4UxK_bsFD7TtL1l@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4UxK_bsFD7TtL1l@casper.infradead.org>
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

On Mon, Jan 13, 2025 at 03:28:43PM +0000, Matthew Wilcox wrote:
> On Mon, Jan 13, 2025 at 11:34:53AM +0200, Kirill A. Shutemov wrote:
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index caadbe393aa2..beba72da5e33 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -686,6 +686,8 @@ void folio_migrate_flags(struct folio *newfolio, struct folio *folio)
> >  		folio_set_young(newfolio);
> >  	if (folio_test_idle(folio))
> >  		folio_set_idle(newfolio);
> > +	if (folio_test_readahead(folio))
> > +		folio_set_readahead(newfolio);
> >  
> >  	folio_migrate_refs(newfolio, folio);
> >  	/*
> 
> Not a problem with this patch ... but aren't we missing a
> test_dropbehind / set_dropbehind pair in this function?  Or are we
> prohibited from migrating a folio with the dropbehind flag set
> somewhere?

Hm. Good catch.

We might want to drop clean dropbehind pages instead migrating them.

But I am not sure about dirty ones. With slow backing storage it might be
better for the system to migrate them instead of keeping them in the old
place for potentially long time.

Any opinions?

> > +++ b/mm/swap.c
> > @@ -221,22 +221,6 @@ static void lru_move_tail(struct lruvec *lruvec, struct folio *folio)
> >  	__count_vm_events(PGROTATED, folio_nr_pages(folio));
> >  }
> >  
> > -/*
> > - * Writeback is about to end against a folio which has been marked for
> > - * immediate reclaim.  If it still appears to be reclaimable, move it
> > - * to the tail of the inactive list.
> > - *
> > - * folio_rotate_reclaimable() must disable IRQs, to prevent nasty races.
> > - */
> > -void folio_rotate_reclaimable(struct folio *folio)
> > -{
> > -	if (folio_test_locked(folio) || folio_test_dirty(folio) ||
> > -	    folio_test_unevictable(folio))
> > -		return;
> > -
> > -	folio_batch_add_and_move(folio, lru_move_tail, true);
> > -}
> 
> I think this is the last caller of lru_move_tail(), which means we can
> get rid of fbatches->lru_move_tail and the local_lock that protects it.
> Or did I miss something?

I see lru_move_tail() being used by lru_add_drain_cpu().

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
