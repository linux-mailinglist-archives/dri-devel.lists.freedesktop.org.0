Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D428370834
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 19:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA926E169;
	Sat,  1 May 2021 17:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8266E02A;
 Sat,  1 May 2021 17:25:15 +0000 (UTC)
IronPort-SDR: gYs4zUtSLTHMPtxPzZfqj181nGrB9Daarbdvmvw3EB/TWieohnRo3tKeelRFhnS/Vdh2/7csB5
 XivtPQe1VUEQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9971"; a="176991242"
X-IronPort-AV: E=Sophos;i="5.82,266,1613462400"; d="scan'208";a="176991242"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2021 10:25:15 -0700
IronPort-SDR: uatJKcjxYeihdlx6Qf3MAYzQPe55EjXf9FwJLNvyFne923vxJ/LolSHWUsf+suJnIzv3sYesHb
 xtHDncF3Xjsg==
X-IronPort-AV: E=Sophos;i="5.82,266,1613462400"; d="scan'208";a="431968181"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2021 10:25:14 -0700
Date: Sat, 1 May 2021 10:17:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 08/21] drm/i915/gem: Disallow bonding of
 virtual engines
Message-ID: <20210501171746.GA5532@sdutt-i7>
References: <CAOFGe958Y6eq1qcPPS-h8Swca8kMy39Vp-gGv6irXdS_8xje5w@mail.gmail.com>
 <YIk1YEXjvaDN+feW@phenom.ffwll.local>
 <CAOFGe97PUT8Ns0bVhHi6D+21yA3=v0QkhdmmKBm=dCn4CizwiA@mail.gmail.com>
 <20210428171853.GA3260@sdutt-i7>
 <CAOFGe96Qy8hXsJCemgDJtZYCbwqxvUS4j-SEKKnLQjE6dmRP2w@mail.gmail.com>
 <20210428175525.GA7224@sdutt-i7>
 <CAOFGe96i7GPvQ8yDreTGF-K5pr_GRNkofQhH7W6Wxr-F8qmxrQ@mail.gmail.com>
 <YIqjG9l30ZmuN1Wg@phenom.ffwll.local>
 <20210430040348.GA27630@sdutt-i7>
 <YIvXuwPpr+gMW1vL@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIvXuwPpr+gMW1vL@phenom.ffwll.local>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 12:11:07PM +0200, Daniel Vetter wrote:
> On Thu, Apr 29, 2021 at 09:03:48PM -0700, Matthew Brost wrote:
> > On Thu, Apr 29, 2021 at 02:14:19PM +0200, Daniel Vetter wrote:
> > > On Wed, Apr 28, 2021 at 01:17:27PM -0500, Jason Ekstrand wrote:
> > > > On Wed, Apr 28, 2021 at 1:02 PM Matthew Brost <matthew.brost@intel.com> wrote:
> > > > >
> > > > > On Wed, Apr 28, 2021 at 12:46:07PM -0500, Jason Ekstrand wrote:
> > > > > > On Wed, Apr 28, 2021 at 12:26 PM Matthew Brost <matthew.brost@intel.com> wrote:
> > > > > > > Jumping on here mid-thread. For what is is worth to make execlists work
> > > > > > > with the upcoming parallel submission extension I leveraged some of the
> > > > > > > existing bonding code so I wouldn't be too eager to delete this code
> > > > > > > until that lands.
> > > > > >
> > > > > > Mind being a bit more specific about that?  The motivation for this
> > > > > > patch is that the current bonding handling and uAPI is, well, very odd
> > > > > > and confusing IMO.  It doesn't let you create sets of bonded engines.
> > > > > > Instead you create engines and then bond them together after the fact.
> > > > > > I didn't want to blindly duplicate those oddities with the proto-ctx
> > > > > > stuff unless they were useful.  With parallel submit, I would expect
> > > > > > we want a more explicit API where you specify a set of engine
> > > > > > class/instance pairs to bond together into a single engine similar to
> > > > > > how the current balancing API works.
> > > > > >
> > > > > > Of course, that's all focused on the API and not the internals.  But,
> > > > > > again, I'm not sure how we want things to look internally.  What we've
> > > > > > got now doesn't seem great for the GuC submission model but I'm very
> > > > > > much not the expert there.  I don't want to be working at cross
> > > > > > purposes to you and I'm happy to leave bits if you think they're
> > > > > > useful.  But I thought I was clearing things away so that you can put
> > > > > > in what you actually want for GuC/parallel submit.
> > > > > >
> > > > >
> > > > > Removing all the UAPI things are fine but I wouldn't delete some of the
> > > > > internal stuff (e.g. intel_virtual_engine_attach_bond, bond
> > > > > intel_context_ops, the hook for a submit fence, etc...) as that will
> > > > > still likely be used for the new parallel submission interface with
> > > > > execlists. As you say the new UAPI wont allow crazy configurations,
> > > > > only simple ones.
> > > > 
> > > > I'm fine with leaving some of the internal bits for a little while if
> > > > it makes pulling the GuC scheduler in easier.  I'm just a bit
> > > > skeptical of why you'd care about SUBMIT_FENCE. :-)  Daniel, any
> > > > thoughts?
> > > 
> > > Yeah I'm also wondering why we need this. Essentially your insight (and
> > > Tony Ye from media team confirmed) is that media umd never uses bonded on
> > > virtual engines.
> > >
> > 
> > Well you should use virtual engines with parallel submission interface 
> > if are you using it correctly.
> > 
> > e.g. You want a 2 wide parallel submission and there are 4 engine
> > instances.
> > 
> > You'd create 2 VEs:
> > 
> > A: 0, 2
> > B: 1, 3
> > set_parallel
> 
> So tbh I'm not really liking this part. At least my understanding is that
> with GuC this is really one overall virtual engine, backed by a multi-lrc.
> 
> So it should fill one engine slot, not fill multiple virtual engines and
> then be an awkward thing wrapped on top.
> 
> I think (but maybe my understanding of GuC and the parallel submit execbuf
> interface is wrong) that the parallel engine should occupy a single VE
> slot, not require additional VE just for fun (maybe the execlist backend
> would require that internally, but that should not leak into the higher
> levels, much less the uapi). And you submit your multi-batch execbuf on
> that single parallel VE, which then gets passed to GuC as a multi-LRC.
> Internally in the backend there's a bit of fan-out to put the right
> MI_BB_START into the right rings and all that, but again I think that
> should be backend concerns.
> 
> Or am I missing something big here?

Unfortunately that is not how the interface works. The user must
configure the engine set with either physical or virtual engines which
determine the valid placements of each BB (LRC, ring, whatever we want
to call it) and call the set parallel extension which validations engine
layout. After that the engines are ready be used with multi-BB
submission in single IOCTL. 

We discussed this internally with the i915 developers + with the media
for like 6 months and this is where we landed after some very
contentious discussions. One of the proposals was pretty similar to your
understanding but got NACK'd as it was too specific to what our HW can
do / what the UMDs need rather than being able to do tons of wild things
our HW / UMDs will never support (sounds familiar, right?). 

What we landed on is still simpler than most of the other proposals - we
almost really went off the deep end but voices of reason thankfully won
out.

> 
> > For GuC submission we just configure context and the GuC load balances
> > it.
> > 
> > For execlists we'd need to create bonds.
> > 
> > Also likely the reason virtual engines wasn't used with the old
> > interface was we only had 2 instances max per class so no need for
> > virtual engines. If they used it for my above example if they were using
> > the interface correctly they would have to use virtual engines too.
> 
> They do actually use virtual engines, it's just the virtual engine only
> contains a single one, and internally i915 folds that into the hw engine
> directly. So we can take away the entire implementation complexity.
> 
> Also I still think for execlist we shouldn't bother with trying to enable
> parallel submit. Or at least only way down if there's no other reasonable
> option.
>

Agree but honestly if we have to it isn't going to be that painful. I
think my patch to enable this was a couple hundred lines.

Matt
 
> > > So the only thing we need is the await_fence submit_fence logic to stall
> > > the subsequent patches just long enough. I think that stays.
> > >
> > 
> > My implementation, for the new parallel submission interface, with
> > execlists used a bonds + priority boosts to ensure both are present at
> > the same time. This was used for both non-virtual and virtual engines.
> > This was never reviewed though and the code died on the list.
> 
> :-(
> 
> > > All the additional logic with the cmpxchg lockless trickery and all that
> > > isn't needed, because we _never_ have to select an engine for bonded
> > > submission: It's always the single one available.
> > > 
> > > This would mean that for execlist parallel submit we can apply a
> > > limitation (beyond what GuC supports perhaps) and it's all ok. With that
> > > everything except the submit fence await logic itself can go I think.
> > > 
> > > Also one for Matt: We decided to ZBB implementing parallel submit on
> > > execlist, it's going to be just for GuC. At least until someone starts
> > > screaming really loudly.
> > 
> > If this is the case, then bonds can be deleted.
> 
> Yeah that's the goal we're aiming for.
> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
