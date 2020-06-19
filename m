Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C702003CD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 10:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5916E187;
	Fri, 19 Jun 2020 08:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9666E175;
 Fri, 19 Jun 2020 08:25:39 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21546145-1500050 for multiple; Fri, 19 Jun 2020 09:25:14 +0100
MIME-Version: 1.0
In-Reply-To: <CAPj87rM0S2OPssf+WA+pjanT-0Om3yuUM1zUJCv4qTx5VYE=Fw@mail.gmail.com>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-4-daniel.vetter@ffwll.ch>
 <159186243606.1506.4437341616828968890@build.alporthouse.com>
 <CAPM=9ty6r1LuXAH_rf98GH0R9yN3x8xzKPjZG3QyvokpQBR-Hg@mail.gmail.com>
 <CAPj87rM0S2OPssf+WA+pjanT-0Om3yuUM1zUJCv4qTx5VYE=Fw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/18] dma-fence: basic lockdep annotations
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Stone <daniel@fooishbar.org>, Dave Airlie <airlied@gmail.com>
Message-ID: <159255511144.7737.12635440776531222029@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Fri, 19 Jun 2020 09:25:11 +0100
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, Thomas Hellstrom <thomas.hellstrom@intel.com>, amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Christian König <christian.koenig@amd.com>, Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Stone (2020-06-11 10:01:46)
> Hi,
> 
> On Thu, 11 Jun 2020 at 09:44, Dave Airlie <airlied@gmail.com> wrote:
> > On Thu, 11 Jun 2020 at 18:01, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > Introducing a global lockmap that cannot capture the rules correctly,
> >
> > Can you document the rules all drivers should be following then,
> > because from here it looks to get refactored every version of i915,
> > and it would be nice if we could all aim for the same set of things
> > roughly. We've already had enough problems with amdgpu vs i915 vs
> > everyone else with fences, if this stops that in the future then I'd
> > rather we have that than just some unwritten rules per driver and
> > untestable.
> 
> As someone who has sunk a bunch of work into explicit-fencing
> awareness in my compositor so I can never be blocked, I'd be
> disappointed if the infrastructure was ultimately pointless because
> the documented fencing rules were \_o_/ or thereabouts. Lockdep
> definitely isn't my area of expertise so I can't comment on the patch
> per se, but having something to ensure we don't hit deadlocks sure
> seems a lot better than nothing.

This is doing dependency analysis on execution contexts which is a far
cry from doing the fence dependency analysis, and so has to actively
ignore the cycles that must exist on the dma side, and also the cycles
that prevent entering execution contexts on the CPU. It has to actively
ignore scheduler execution contexts, for lockdep cries, and so we do not
get analysis of the locking contexts along that path. This would be
solvable along the lines of extending lockdep ala lockdep_dma_enter().

Had i915's execution flow been marked up, it should have found the
dubious wait for external fences inside the dead GPU recovery, and
probably found a few more things to complain about with the reset locking.
[Note we already do the same annotations for wait-vs-reset, but not
reset-vs-execution.]

Determination of which waits are legal and which are not is entirely ad
hoc, for there is no status change tracking in the dependency analysis
[that is once an execution context is linked to a published fence, again
integral to lockdep.] Consider if the completion chain in atomic is
swapped out for the morally equivalent fences along intertwined timelines,
and so it does a bunch of dma_fence_wait() instead. Why are those waits
legal despite them being after we have committed to fulfilling the out
fence? [Why are the waits on and for the GPU legal, since they equally
block execution flow?]

Forcing a generic primitive to always be part of the same global map is
horrible. You forgo being able to use the primitive for unrelated tasks,
lose the ability to name particular contexts to gain more informative
dependency cycle reports from having the explicit linkage. You can add
wait_map tracking without loss of generality [in less than 10 lines],
and you can still enforce that all fences used for a common purpose
follow the same rules [the simplest way being to default to the singular
wait_map]. But it's the explicitly named execution contexts that are the
biggest boon to reading the code and reading the lockdep warns.

This is a bunch of ad hoc tracking for a very narrow purpose applied
globally, with loss of information.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
