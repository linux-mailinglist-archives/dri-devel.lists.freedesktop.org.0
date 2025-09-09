Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897EDB500F0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88310E798;
	Tue,  9 Sep 2025 15:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="K3+M3w31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BE410E78D;
 Tue,  9 Sep 2025 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=2bJb9r9WRkh2TAMgOyJeg6yuzlP1Z0g5WcvmBSdw5jw=; b=K3+M3w31oZcBuYI9a7tM1Wo4ID
 BPiBqB+/2QDy58bY7Sc9535axphYxgvKiFquwU0TlajgwlRtUwRspA0xVmD9BAHJLz/l+jeRZjyjR
 Unw1uOLgfY+EjPa0Itj9WptPWEi19neifkYJniy3Wf2hlEbdwOSuG2acrNEVToC0OeJ1sZs5T1nnK
 gXGBKfpb0jyqvC2yHxEbiNlRGTIi8PdJLlcATpL1HoYOoKskBQ4MjK5mFv/WtG5JC72p01/TzMbra
 BkITS1U0QdkexZxcKSJB91r2uD2hrSHqab+CbXgy+JPrmtyOmqb15KRnsWDBSvIaUTLwYUljo7s4o
 cH/Dx2Kw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uw0Aa-00000005OZD-2Xxf; Tue, 09 Sep 2025 15:22:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3D7323002EB; Tue, 09 Sep 2025 16:05:19 +0200 (CEST)
Date: Tue, 9 Sep 2025 16:05:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, jani.nikula@linux.intel.com,
 samuel.pitoiset@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, alexander.deucher@amd.com,
 stable@vger.kernel.org
Subject: Re: [PATCH v5 1/3] drm/buddy: Optimize free block management with RB
 tree
Message-ID: <20250909140519.GK4067720@noisy.programming.kicks-ass.net>
References: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
 <6f6841a7-57bd-49de-9b55-b5b0514a2749@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f6841a7-57bd-49de-9b55-b5b0514a2749@amd.com>
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

On Tue, Sep 09, 2025 at 02:04:30PM +0200, Christian König wrote:
> Hi Arun,
> 
> On 09.09.25 11:56, Arunpravin Paneer Selvam wrote:
> [SNIP]
> 
> > +/**
> > + * rbtree_for_each_entry_safe - iterate in-order over rb_root safe against removal
> > + *
> > + * @pos:	the 'type *' to use as a loop cursor
> > + * @n:		another 'type *' to use as temporary storage
> > + * @root:	'rb_root *' of the rbtree
> > + * @member:	the name of the rb_node field within 'type'
> > + */
> > +#define rbtree_for_each_entry_safe(pos, n, root, member) \
> > +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
> > +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
> > +	     (pos); \
> > +	     (pos) = (n), \
> > +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)
> 
> As far as I know exactly that operation does not work on an R/B tree.
> 
> See the _safe() variants of the for_each_ macros are usually used to iterate over a container while being able to remove entries.
> 
> But because of the potential re-balance storing just the next entry is not sufficient for an R/B tree to do that as far as I know.
> 
> Please explain how exactly you want to use this macro.

So I don't much like these iterators; I've said so before. Either we
should introduce a properly threaded rb-tree (where the NULL child
pointers encode a linked list), or simply keep a list_head next to the
rb_node and use that.

The rb_{next,prev}() things are O(ln n), in the worst case they do a
full traversal up the tree and a full traversal down the other branch.

That said; given 'next' will remain an existing node, only the 'pos'
node gets removed, rb_next() will still work correctly, even in the face
of rebalance.


