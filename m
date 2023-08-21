Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54B278228A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 06:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7408110E1AA;
	Mon, 21 Aug 2023 04:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBE410E188
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sTOdBFeZC0ZITAjiSCC8ryUnVRY9Lhk36Ip26KjeYr4=; b=ICymlCyLpaJ6lmuyoMFR5kttyw
 UBm9C082xuk3Z6hhwZEKWSF+ox3NgccEuO8Z/43fptOWwRZsWum/7FRoRaW1UQbyW1qJwMW+RtTE5
 LuYT1pNyy0SaxkHsTTkacsbgLDntlcgS1wSJqQvwXrvlQeAEdAYSdM61NzEaEm48NI/eOnoim4ojj
 8vV9ewOGSLgUh2r2vGs4nVL8ZJ4gZ46GXf8M9SfbYoQvZdxJbeNQKkzbyh3E1MLZutAHTaZUuOqIq
 1S/Hr371deuhKGgzMbb+5HqLyRiiOPcO8oCTUXpithV1sUUXjoat+U6z6h/eBmQhpwA7bLdvom+us
 SUX4CjPw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qXwEa-0081su-Uu; Mon, 21 Aug 2023 04:09:45 +0000
Date: Mon, 21 Aug 2023 05:09:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Byungchul Park <byungchul@sk.com>
Subject: Re: [RESEND PATCH v10 08/25] dept: Apply
 sdt_might_sleep_{start,end}() to PG_{locked,writeback} wait
Message-ID: <ZOLjiF2oKxBvVzyw@casper.infradead.org>
References: <20230821034637.34630-1-byungchul@sk.com>
 <20230821034637.34630-9-byungchul@sk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821034637.34630-9-byungchul@sk.com>
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

On Mon, Aug 21, 2023 at 12:46:20PM +0900, Byungchul Park wrote:
> @@ -1219,6 +1220,9 @@ static inline bool folio_trylock_flag(struct folio *folio, int bit_nr,
>  /* How many times do we accept lock stealing from under a waiter? */
>  int sysctl_page_lock_unfairness = 5;
>  
> +static struct dept_map __maybe_unused PG_locked_map = DEPT_MAP_INITIALIZER(PG_locked_map, NULL);
> +static struct dept_map __maybe_unused PG_writeback_map = DEPT_MAP_INITIALIZER(PG_writeback_map, NULL);

Hmm, why are these "maybe unused"?  *digs*.  Ah.  Because
sdt_might_sleep_start() becomes a no-op macro if DEPT is disabled.

OK, the right way to handle this is

#ifdef CONFIG_DEPT
#define DEPT_MAP(name)	static struct dept_map name = \
		DEPT_MAP_INITIALIZER(name, NULL)
#else
#define DEPT_MAP(name)	/* */
#endif

And now DEPT takes up no space if disabled.

/* */; is a somewhat unusual thing to see, but since this must work at
top level, we can't use "do { } while (0)" like we usually do.  Given
where else this is likely to be used, i don't think it's going to be
a problem ...

