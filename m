Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6829E3998B5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 05:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2E46E064;
	Thu,  3 Jun 2021 03:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3256E064;
 Thu,  3 Jun 2021 03:48:02 +0000 (UTC)
IronPort-SDR: vUR/EbBg2jO+Q/ewggbqjTffzMXsp9KnLREdeSv5FR9n6KYVhvXnhj88VP8g8Qw/rLvJL4Pmp2
 VH5PiDFZDgqQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="267824917"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="267824917"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 20:48:00 -0700
IronPort-SDR: zhM83CFNdT62jhvh6d1y6xf5fX3BOOiwLhBa8IeCocLeJAyeN8Hr8RK4ehW4z/WOHy4H3IFM8l
 jr+L92vkCJwA==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="549728433"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 20:48:00 -0700
Date: Wed, 2 Jun 2021 20:41:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in
 the i915
Message-ID: <20210603034100.GA7593@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <de3965d8-d997-5685-0399-646d8823a27f@linux.intel.com>
 <20210525164504.GA9971@sdutt-i7>
 <d76ab0ec-4f0c-19ed-adaa-ed227af63c0e@linux.intel.com>
 <CAKMK7uHT2mPTyX9QiTBFP2Lt28vV3JcJLPAx_hMdTtyLJ=DZ2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHT2mPTyX9QiTBFP2Lt28vV3JcJLPAx_hMdTtyLJ=DZ2g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Jason Ekstrand <jason.ekstrand@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 08:57:02PM +0200, Daniel Vetter wrote:
> On Wed, Jun 2, 2021 at 5:27 PM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> > On 25/05/2021 17:45, Matthew Brost wrote:
> > > On Tue, May 25, 2021 at 11:32:26AM +0100, Tvrtko Ursulin wrote:
> > >>   * Context pinning code with it's magical two adds, subtract and cmpxchg is
> > >> dodgy as well.
> > >
> > > Daniele tried to remove this and it proved quite difficult + created
> > > even more races in the backend code. This was prior to the pre-pin and
> > > post-unpin code which makes this even more difficult to fix as I believe
> > > these functions would need to be removed first. Not saying we can't
> > > revisit this someday but I personally really like it - it is a clever
> > > way to avoid reentering the pin / unpin code while asynchronous things
> > > are happening rather than some complex locking scheme. Lastly, this code
> > > has proved incredibly stable as I don't think we've had to fix a single
> > > thing in this area since we've been using this code internally.
> >
> > Pretty much same as above. The code like:
> >
> > static inline void __intel_context_unpin(struct intel_context *ce)
> > {
> >         if (!ce->ops->sched_disable) {
> >                 __intel_context_do_unpin(ce, 1);
> >         } else {
> >                 while (!atomic_add_unless(&ce->pin_count, -1, 1)) {
> >                         if (atomic_cmpxchg(&ce->pin_count, 1, 2) == 1) {
> >                                 ce->ops->sched_disable(ce);
> >                                 break;
> >                         }
> >                 }
> >         }
> > }
> >
> > That's pretty much impenetrable for me and the only thing I can think of
> > here is **ALARM** must be broken! See what others think..

Yea, probably should add a comment:

/*
 * If the context has the sched_disable function, it isn't safe to unpin
 * until this function completes. This function is allowed to complete
 * asynchronously too. To avoid this function from being entered twice
 * and move ownership of the unpin to this function's completion, adjust
 * the pin count to 2 before it is entered. When this function completes
 * the context can call intel_context_sched_unpin which decrements the
 * pin count by 2 potentially resulting in an unpin.
 *
 * A while loop is needed to ensure the atomicity of the pin count. e.g.
 * The below if / else statement has a race:
 * 
 * if (atomic_cmpxchg(&ce->pin_count, 1, 2) == 1)
 * 	ce->ops->sched_disable(ce);
 * else
 * 	atomic_dec(ce, 1);
 *
 * Two threads could simultaneously fail the if clause resulting in the
 * pin_count going to 0 with scheduling enabled + the context pinned. 
 */

> 
> pin_count is a hand-rolled mutex, except not actually a real one, and
> it's absolutely hiliarous in it's various incarnations (there's one
> each on i915_vm, vma, obj and probably a few more).
>
> Not the worst one I've seen by far in the code we've merged already.
> Minimally this needs a comment here and in the struct next to
> @pin_count to explain where all this is abused, which would already
> make it better than most of the in-tree ones.
> 
> As part of the ttm conversion we have a plan to sunset the "pin_count
> as a lock" stuff, depending how bad that goes we might need to split
> up the task for each struct that has such a pin_count.
>

Didn't know that with the TTM rework this value might go away. If that
is truely the direction I don't see the point in reworking this now. It
100% works and with a comment I think it can be understood what it is
doing.

Matt

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
