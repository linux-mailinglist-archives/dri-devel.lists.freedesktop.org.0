Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FEF202C9C
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 22:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098C46E4DE;
	Sun, 21 Jun 2020 20:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A926E194
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 20:01:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q2so12170150wrv.8
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 13:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=fEpisrHVuvECE9QkwBWX7rZQTVSunxWmuYR8YMHiI7w=;
 b=byvZO+Rl76mwx+UB97zJe2wRVGFXsyHVh1g6yyCSGTEbtPMHZ6PekdjrhFTPms5iT9
 O5rQ60hDjYeFOE9E8+8Cd8jsH0OhxkGsnzwpY9RdGnAfzvdfwVITBGSoqEc++ubhg1HK
 yNXCwFIntsKcaqylggT66AAeH7oBzRhBsED64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=fEpisrHVuvECE9QkwBWX7rZQTVSunxWmuYR8YMHiI7w=;
 b=h3ntDEMnX61S+ZO30UR9s0rq6eYWqBezou9tcJyFbYOZ5DnHHexIYcyxJuNMrbZKYB
 Fp4md0pg4G+33Frr7ZBhTRN/BG7zK8NSYl+e4CHuhAJsQ5TmWZ5vCOXDSgfpknYdDlsH
 QtpED2r41HTivbB1QF1ENvQKyshNkjF5UXUHn2a7l27kX4QerP+BlGFv7VB4rhDqva2N
 tEE3CeLxXYDue/adtXEkrzb4f7JnAyoo4gDeWV1huZiyIigydCFEuNoFDjWJCJ4hHFRT
 /lQTFHnLvPkeD0+szVOzLrMzCzmAG2V+pLzXaJUbfgx3GHw0NeWh0HOMFQiQ9CZscIjD
 fX+Q==
X-Gm-Message-State: AOAM531uPfAyYEALCthX+QpBTJ2NbZv8Cqym9ir+34PzzLW+R+Xa3K0x
 hQNjNQ8qLMAv1Cw2He+EF+C+vA==
X-Google-Smtp-Source: ABdhPJxsRdQgv4E6GNxYz9Nhgg1RI6byFsAnQ/h3xQ/Wq/o2gy4VUYHPLMtLpYgEyS1HiUHhsSp98Q==
X-Received: by 2002:a5d:664a:: with SMTP id f10mr15413013wrw.300.1592769666648; 
 Sun, 21 Jun 2020 13:01:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l1sm15793401wrb.31.2020.06.21.13.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 13:01:05 -0700 (PDT)
Date: Sun, 21 Jun 2020 22:01:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] mm: Track mmu notifiers in fs_reclaim_acquire/release
Message-ID: <20200621200103.GV20149@phenom.ffwll.local>
Mail-Followup-To: Qian Cai <cai@lca.pw>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@mellanox.com>, Linux MM <linux-mm@kvack.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-xfs@vger.kernel.org
References: <20200604081224.863494-2-daniel.vetter@ffwll.ch>
 <20200610194101.1668038-1-daniel.vetter@ffwll.ch>
 <20200621174205.GB1398@lca.pw>
 <CAKMK7uFZAFVmceoYvqPovOifGw_Y8Ey-OMy6wioMjwPWhu9dDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFZAFVmceoYvqPovOifGw_Y8Ey-OMy6wioMjwPWhu9dDg@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-xfs@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 21, 2020 at 08:07:08PM +0200, Daniel Vetter wrote:
> On Sun, Jun 21, 2020 at 7:42 PM Qian Cai <cai@lca.pw> wrote:
> >
> > On Wed, Jun 10, 2020 at 09:41:01PM +0200, Daniel Vetter wrote:
> > > fs_reclaim_acquire/release nicely catch recursion issues when
> > > allocating GFP_KERNEL memory against shrinkers (which gpu drivers tend
> > > to use to keep the excessive caches in check). For mmu notifier
> > > recursions we do have lockdep annotations since 23b68395c7c7
> > > ("mm/mmu_notifiers: add a lockdep map for invalidate_range_start/end"=
).
> > >
> > > But these only fire if a path actually results in some pte
> > > invalidation - for most small allocations that's very rarely the case.
> > > The other trouble is that pte invalidation can happen any time when
> > > __GFP_RECLAIM is set. Which means only really GFP_ATOMIC is a safe
> > > choice, GFP_NOIO isn't good enough to avoid potential mmu notifier
> > > recursion.
> > >
> > > I was pondering whether we should just do the general annotation, but
> > > there's always the risk for false positives. Plus I'm assuming that
> > > the core fs and io code is a lot better reviewed and tested than
> > > random mmu notifier code in drivers. Hence why I decide to only
> > > annotate for that specific case.
> > >
> > > Furthermore even if we'd create a lockdep map for direct reclaim, we'd
> > > still need to explicit pull in the mmu notifier map - there's a lot
> > > more places that do pte invalidation than just direct reclaim, these
> > > two contexts arent the same.
> > >
> > > Note that the mmu notifiers needing their own independent lockdep map
> > > is also the reason we can't hold them from fs_reclaim_acquire to
> > > fs_reclaim_release - it would nest with the acquistion in the pte
> > > invalidation code, causing a lockdep splat. And we can't remove the
> > > annotations from pte invalidation and all the other places since
> > > they're called from many other places than page reclaim. Hence we can
> > > only do the equivalent of might_lock, but on the raw lockdep map.
> > >
> > > With this we can also remove the lockdep priming added in 66204f1d2d1b
> > > ("mm/mmu_notifiers: prime lockdep") since the new annotations are
> > > strictly more powerful.
> > >
> > > v2: Review from Thomas Hellstrom:
> > > - unbotch the fs_reclaim context check, I accidentally inverted it,
> > >   but it didn't blow up because I inverted it immediately
> > > - fix compiling for !CONFIG_MMU_NOTIFIER
> > >
> > > Cc: Thomas Hellstr=F6m (Intel) <thomas_os@shipmail.org>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: Jason Gunthorpe <jgg@mellanox.com>
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-rdma@vger.kernel.org
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >
> > Replying the right patch here...
> >
> > Reverting this commit [1] fixed the lockdep warning below while applying
> > some memory pressure.
> >
> > [1] linux-next cbf7c9d86d75 ("mm: track mmu notifiers in fs_reclaim_acq=
uire/release")
> =

> Hm, then I'm confused because
> - there's not mmut notifier lockdep map in the splat at a..
> - the patch is supposed to not change anything for fs_reclaim (but the
> interim version got that wrong)
> - looking at the paths it's kmalloc vs kswapd, both places I totally
> expect fs_reflaim to be used.
> =

> But you're claiming reverting this prevents the lockdep splat. If
> that's right, then my reasoning above is broken somewhere. Someone
> less blind than me having an idea?
> =

> Aside this is the first email I've typed, until I realized the first
> report was against the broken patch and that looked like a much more
> reasonable explanation (but didn't quite match up with the code
> paths).

Below diff should undo the functional change in my patch. Can you pls test
whether the lockdep splat is really gone with that? Might need a lot of
testing and memory pressure to be sure, since all these reclaim paths
aren't very deterministic.
-Daniel

---
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d807587c9ae6..27ea763c6155 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4191,11 +4191,6 @@ void fs_reclaim_acquire(gfp_t gfp_mask)
 		if (gfp_mask & __GFP_FS)
 			__fs_reclaim_acquire();
 =

-#ifdef CONFIG_MMU_NOTIFIER
-		lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
-		lock_map_release(&__mmu_notifier_invalidate_range_start_map);
-#endif
-
 	}
 }
 EXPORT_SYMBOL_GPL(fs_reclaim_acquire);
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
