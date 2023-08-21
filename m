Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712807822CD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9442110E1AC;
	Mon, 21 Aug 2023 04:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AEF10E1AC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+ThJSbWV78NlzV1/8C4mbgmYWZr69CC6aj59sQ9jdrI=; b=GrUAGT6/KObw5bPBQ7exfokg3U
 ynl1o6BaBJE2w8dxWn4SHwihK33nGtJXtQSf9WII5QNzRQ2K/FxjOeVh+I3cjJNNkdtdWtKYo9QXK
 L1nLWdqK2Q2UfESbpjBtH/wGVGA9F2JGqgVtY6LJfU5xpdm1d9Obs7iRoLeHn5+Fk4u9lWEzssWKz
 v3voHD9tHVIJeSzrbvkM2TyQTv/4lGmEmBmfGOENaS2YUABDuZDOlr+lPFyQjvTKPSjdOTcR16Q+W
 wkXH6nfN409c0r0+HFEB6nQP6TIFVNFeqlDel+ejgohfCksc0lt18vCEm9FV/ufHxoZNkWyxoln6Q
 dG471p0Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qXwU2-0086y2-1U; Mon, 21 Aug 2023 04:25:42 +0000
Date: Mon, 21 Aug 2023 05:25:41 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Byungchul Park <byungchul@sk.com>
Subject: Re: [RESEND PATCH v10 25/25] dept: Track the potential waits of
 PG_{locked,writeback}
Message-ID: <ZOLnRSdH4Wcrl67L@casper.infradead.org>
References: <20230821034637.34630-1-byungchul@sk.com>
 <20230821034637.34630-26-byungchul@sk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821034637.34630-26-byungchul@sk.com>
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
Cc: hamohammed.sa@gmail.com, hdanton@sina.com, jack@suse.cz,
 peterz@infradead.org, daniel.vetter@ffwll.ch, amir73il@gmail.com,
 david@fromorbit.com, dri-devel@lists.freedesktop.org, mhocko@kernel.org,
 linux-mm@kvack.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, her0gyugyu@gmail.com,
 kernel_team@skhynix.com, damien.lemoal@opensource.wdc.com,
 chris.p.wilson@intel.com, hch@infradead.org, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, ngupta@vflare.org,
 johannes.berg@intel.com, boqun.feng@gmail.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, max.byungchul.park@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 12:46:37PM +0900, Byungchul Park wrote:
> @@ -377,44 +421,88 @@ static __always_inline int Page##uname(struct page *page)		\
>  #define SETPAGEFLAG(uname, lname, policy)				\
>  static __always_inline							\
>  void folio_set_##lname(struct folio *folio)				\
> -{ set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy)); }		\
> +{									\
> +	set_bit(PG_##lname, folio_flags(folio, FOLIO_##policy));	\
> +	dept_page_set_bit(&folio->page, PG_##lname);			\

The PG_locked and PG_writeback bits only actually exist in the folio;
the ones in struct page are just legacy and never actually used.
Perhaps we could make the APIs more folio-based and less page-based?

>  static __always_inline void SetPage##uname(struct page *page)		\
> -{ set_bit(PG_##lname, &policy(page, 1)->flags); }
> +{									\
> +	set_bit(PG_##lname, &policy(page, 1)->flags);			\
> +	dept_page_set_bit(page, PG_##lname);				\
> +}

I don't think we ever call this for PG_writeback or PG_locked.  If
I'm wrong, we can probably fix that ;-)

>  static __always_inline void __SetPage##uname(struct page *page)		\
> -{ __set_bit(PG_##lname, &policy(page, 1)->flags); }
> +{									\
> +	__set_bit(PG_##lname, &policy(page, 1)->flags);			\
> +	dept_page_set_bit(page, PG_##lname);				\
> +}

Umm.  We do call __SetPageLocked() though ... I'll fix those up to
be __set_folio_locked().

