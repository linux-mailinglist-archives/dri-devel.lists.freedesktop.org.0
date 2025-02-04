Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5633A268D8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 01:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5223788867;
	Tue,  4 Feb 2025 00:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="i9J0TpPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4A510E10B;
 Tue,  4 Feb 2025 00:47:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C637EA4201C;
 Tue,  4 Feb 2025 00:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD2BC4CEE4;
 Tue,  4 Feb 2025 00:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1738630054;
 bh=jmDmBKgdg+tglC1hAuRd+I3gUe9Geez71dH7vuTJP8o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i9J0TpPLqfCwqIhS4yhFauZVhJ4TuUZuMbvB3R02l6ePYKSpNO1W0zS6x3mHYYi7g
 7Fg5HQqTWVm1ZBZwjcKxlLwfFwz/bbtYtagxrbQdIz3DeRqWX1PETn+wfCt+vq4vMi
 /d3R4Mq9rATcGZhoTRTxbAC8v4fPS31ZNgZU2mvM=
Date: Mon, 3 Feb 2025 16:47:33 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Kairui Song <ryncsn@gmail.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Andi Shyti <andi.shyti@linux.intel.com>, Chengming Zhou
 <chengming.zhou@linux.dev>, Christian Brauner <brauner@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Carpenter
 <dan.carpenter@linaro.org>, David Airlie <airlied@gmail.com>, David
 Hildenbrand <david@redhat.com>, Hao Ge <gehao@kylinos.cn>, Jani Nikula
 <jani.nikula@linux.intel.com>, Johannes Weiner <hannes@cmpxchg.org>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Josef Bacik
 <josef@toxicpanda.com>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Miklos Szeredi
 <miklos@szeredi.hu>, Nhat Pham <nphamcs@gmail.com>, Oscar Salvador
 <osalvador@suse.de>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Steven Rostedt
 <rostedt@goodmis.org>, Tvrtko Ursulin <tursulin@ursulin.net>, Vlastimil
 Babka <vbabka@suse.cz>, Yosry Ahmed <yosryahmed@google.com>, Yu Zhao
 <yuzhao@google.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCHv3 06/11] mm/vmscan: Use PG_dropbehind instead of PG_reclaim
Message-Id: <20250203164733.f806902a6e5c91523c9e00fc@linux-foundation.org>
In-Reply-To: <42h65xowqe36eymr6pcomo7wzpe26kzwvyzg44hftqqczc5n6y@w2z5wvdrvktm>
References: <20250130100050.1868208-1-kirill.shutemov@linux.intel.com>
 <20250130100050.1868208-7-kirill.shutemov@linux.intel.com>
 <CAMgjq7AWZg0Y7+v3_Z8-YVUXrANB29mCDSyzF39dtAM_TQ0aKw@mail.gmail.com>
 <42h65xowqe36eymr6pcomo7wzpe26kzwvyzg44hftqqczc5n6y@w2z5wvdrvktm>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 3 Feb 2025 10:39:58 +0200 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:

> > diff --git a/mm/filemap.c b/mm/filemap.c
> > index 4fe551037bf7..98493443d120 100644
> > --- a/mm/filemap.c
> > +++ b/mm/filemap.c
> > @@ -1605,8 +1605,9 @@ static void folio_end_reclaim_write(struct folio *folio)
> >          * invalidation in that case.
> >          */
> >         if (in_task() && folio_trylock(folio)) {
> > -               if (folio->mapping)
> > -                       folio_unmap_invalidate(folio->mapping, folio, 0);
> > +               struct address_space *mapping = folio_mapping(folio);
> > +               if (mapping)
> > +                       folio_unmap_invalidate(mapping, folio, 0);
> >                 folio_unlock(folio);
> >         }
> >  }
> 
> Once you do this, folio_unmap_invalidate() will never succeed for
> swapcache as folio->mapping != mapping check will always be true and it
> will fail with -EBUSY.
> 
> I guess we need to do something similar to what __remove_mapping() does
> for swapcache folios.

Thanks, I'll drop the v3 series from mm.git.
