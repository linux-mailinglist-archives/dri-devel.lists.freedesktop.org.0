Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256B638118F
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 22:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4926F45F;
	Fri, 14 May 2021 20:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFE86F45E;
 Fri, 14 May 2021 20:12:52 +0000 (UTC)
IronPort-SDR: akjGJu5JxRBid4gnRrHs6BNKLjuA4AMfne/Lu1SrQrr6DmIZbdonwUvHj4p25ACUxegfZjd706
 AYQQfULg1Unw==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="200284087"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="200284087"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 13:12:50 -0700
IronPort-SDR: S1qGydWivszc5fBYjgdby9+f6y6ZhQeOeekLb//J05wAOO22Fe1D2NEHDjxdf6kw/ahLWbzSIA
 o8LkCj91IUKg==
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="464051192"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 13:12:50 -0700
Date: Fri, 14 May 2021 13:05:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [RFC PATCH 4/5] drm/i915: Introduce 'set parallel
 submit' extension
Message-ID: <20210514200530.GA20281@sdutt-i7>
References: <20210506173049.72503-1-matthew.brost@intel.com>
 <20210506173049.72503-5-matthew.brost@intel.com>
 <YJqesIT3leIhTNxs@phenom.ffwll.local>
 <20210511184425.GA7786@sdutt-i7>
 <YJuTM0eOtrwsgBKX@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJuTM0eOtrwsgBKX@phenom.ffwll.local>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 carl.zhang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 10:34:59AM +0200, Daniel Vetter wrote:
> On Tue, May 11, 2021 at 11:44:28AM -0700, Matthew Brost wrote:
> > On Tue, May 11, 2021 at 05:11:44PM +0200, Daniel Vetter wrote:
> > > On Thu, May 06, 2021 at 10:30:48AM -0700, Matthew Brost wrote:
> > > > i915_drm.h updates for 'set parallel submit' extension.
> > > > 
> > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > Cc: Tony Ye <tony.ye@intel.com>
> > > > CC: Carl Zhang <carl.zhang@intel.com>
> > > > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  include/uapi/drm/i915_drm.h | 126 ++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 126 insertions(+)
> > > > 
> > > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > > index 26d2e135aa31..0175b12b33b8 100644
> > > > --- a/include/uapi/drm/i915_drm.h
> > > > +++ b/include/uapi/drm/i915_drm.h
> > > > @@ -1712,6 +1712,7 @@ struct drm_i915_gem_context_param {
> > > >   * Extensions:
> > > >   *   i915_context_engines_load_balance (I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE)
> > > >   *   i915_context_engines_bond (I915_CONTEXT_ENGINES_EXT_BOND)
> > > > + *   i915_context_engines_parallel_submit (I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT)
> > > 
> > > Hm just relalized, but I don't think this hyperlinsk correctly, and I'm
> > > also not sure this formats very well as a nice list. Using item lists
> > > should look pretty nice like we're doing for the various kms properties,
> > > e.g.
> > > 
> > > FOO:
> > >   Explain what FOO does
> > > 
> > > BAR:
> > >   Explain what BAR does. struct bar also automatically generates a link
> > > 
> > > Please check with make htmldocs and polish this a bit (might need a small
> > > prep patch).
> > > 
> > 
> > I agree the doc should look nice. To get there I might need to chat with you on
> > IRC as I'm new to this. 
> > 
> > > >   */
> > > >  #define I915_CONTEXT_PARAM_ENGINES	0xa
> > > >  
> > > > @@ -1894,9 +1895,134 @@ struct i915_context_param_engines {
> > > >  	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
> > > >  #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
> > > >  #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond */
> > > > +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
> > > >  	struct i915_engine_class_instance engines[0];
> > > >  } __attribute__((packed));
> > > >  
> > > > +/*
> > > > + * i915_context_engines_parallel_submit:
> > > > + *
> > > > + * Setup a gem context to allow multiple BBs to be submitted in a single execbuf
> > > > + * IOCTL. Those BBs will then be scheduled to run on the GPU in parallel.
> > > > + *
> > > > + * All hardware contexts in the engine set are configured for parallel
> > > > + * submission (i.e. once this gem context is configured for parallel submission,
> > > > + * all the hardware contexts, regardless if a BB is available on each individual
> > > > + * context, will be submitted to the GPU in parallel). A user can submit BBs to
> > > > + * subset of the hardware contexts, in a single execbuf IOCTL, but it is not
> > > > + * recommended as it may reserve physical engines with nothing to run on them.
> > > > + * Highly recommended to configure the gem context with N hardware contexts then
> > > > + * always submit N BBs in a single IOCTL.
> > > > + *
> > > > + * Their are two currently defined ways to control the placement of the
> > > > + * hardware contexts on physical engines: default behavior (no flags) and
> > > > + * I915_PARALLEL_IMPLICT_BONDS (a flag). More flags may be added the in the
> > > > + * future as new hardware / use cases arise. Details of how to use this
> > > > + * interface below above the flags.
> > > > + *
> > > > + * Returns -EINVAL if hardware context placement configuration invalid or if the
> > > > + * placement configuration isn't supported on the platform / submission
> > > > + * interface.
> > > > + * Returns -ENODEV if extension isn't supported on the platform / submission
> > > > + * inteface.
> > > > + */
> > > > +struct i915_context_engines_parallel_submit {
> > > > +	struct i915_user_extension base;
> > > 
> > > Ok this is good, since it makes sure we can't possible use this in
> > > CTX_SETPARAM.
> > > 
> > 
> > Yep, this is at context creation time. Technically you still can call this over
> > and over on the same gem context but Jason is taking that ability away I
> > believe. I've also told the media team to setup the context once and don't touch
> > it again.
> 
> Only if you base your context param on drm_i915_gem_context_param, which
> can be used both at create time with
> drm_i915_gem_context_create_ext_setparam and with the CTX_SETPARAM ioctl.
> But you don't, so this issue is fixed at the uapi design and doesn't need
> to interface with Jason's prot-ctx rework much.
> 
> There's still going to be some conflicts, so maybe ask Jason for a branch
> and rebase GuC on top of that for the next round.
> 

Certainly this new uAPI is going conflict. The basic GuC submission code
shouldn't though as it doesn't touch the uAPI code at all. By the time the new
uAPI is posted I'd hope Jason's proto-ctx rework has landed and will rebase
then on to the tip of DRM.

> > 
> > > > +
> > > > +/*
> > > > + * Default placement behvavior (currently unsupported):
> > > > + *
> > > > + * Rather than restricting parallel submission to a single class with a
> > > > + * logically contiguous placement (I915_PARALLEL_IMPLICT_BONDS), add a mode that
> > > > + * enables parallel submission across multiple engine classes. In this case each
> > > > + * context's logical engine mask indicates where that context can placed. It is
> > > > + * implied in this mode that all contexts have mutual exclusive placement (e.g.
> > > > + * if one context is running CS0 no other contexts can run on CS0).
> > > > + *
> > > > + * Example 1 pseudo code:
> > > > + * CSX[Y] = engine class X, logical instance Y
> > > > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > > > + * set_engines(INVALID, INVALID)
> > > > + * set_load_balance(engine_index=0, num_siblings=2, engines=CS0[0],CS0[1])
> > > > + * set_load_balance(engine_index=1, num_siblings=2, engines=CS1[0],CS1[1])
> > > > + * set_parallel()
> > > > + *
> > > > + * Results in the following valid placements:
> > > > + * CS0[0], CS1[0]
> > > > + * CS0[0], CS1[1]
> > > > + * CS0[1], CS1[0]
> > > > + * CS0[1], CS1[1]
> > > > + *
> > > > + * Example 2 pseudo code:
> > > > + * CS[X] = generic engine of same class, logical instance X
> > > > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > > > + * set_engines(INVALID, INVALID)
> > > > + * set_load_balance(engine_index=0, num_siblings=3, engines=CS[0],CS[1],CS[2])
> > > > + * set_load_balance(engine_index=1, num_siblings=3, engines=CS[0],CS[1],CS[2])
> > > > + * set_parallel()
> > > > + *
> > > > + * Results in the following valid placements:
> > > > + * CS[0], CS[1]
> > > > + * CS[0], CS[2]
> > > > + * CS[1], CS[0]
> > > > + * CS[1], CS[2]
> > > > + * CS[2], CS[0]
> > > > + * CS[2], CS[1]
> > > > + *
> > > > + * This enables a use case where all engines are created equally, we don't care
> > > > + * where they are scheduled, we just want a certain number of resources, for
> > > > + * those resources to be scheduled in parallel, and possibly across multiple
> > > > + * engine classes.
> > > > + */
> > > > +
> > > > +/*
> > > > + * I915_PARALLEL_IMPLICT_BONDS - Create implict bonds between each context.
> > > > + * Each context must have the same number sibling and bonds are implictly create
> > > > + * of the siblings.
> > > > + *
> > > > + * All of the below examples are in logical space.
> > > > + *
> > > > + * Example 1 pseudo code:
> > > > + * CS[X] = generic engine of same class, logical instance X
> > > > + * set_engines(CS[0], CS[1])
> > > > + * set_parallel(flags=I915_PARALLEL_IMPLICT_BONDS)
> > > > + *
> > > > + * Results in the following valid placements:
> > > > + * CS[0], CS[1]
> > > > + *
> > > > + * Example 2 pseudo code:
> > > > + * CS[X] = generic engine of same class, logical instance X
> > > > + * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> > > > + * set_engines(INVALID, INVALID)
> > > > + * set_load_balance(engine_index=0, num_siblings=2, engines=CS[0],CS[2])
> > > > + * set_load_balance(engine_index=1, num_siblings=2, engines=CS[1],CS[3])
> > > > + * set_parallel(flags=I915_PARALLEL_IMPLICT_BONDS)
> > > > + *
> > > > + * Results in the following valid placements:
> > > > + * CS[0], CS[1]
> > > > + * CS[2], CS[3]
> > > > + *
> > > > + * This enables a use case where all engines are not equal and certain placement
> > > > + * rules are required (i.e. split-frame requires all contexts to be placed in a
> > > > + * logically contiguous order on the VCS engines on gen11+ platforms). This use
> > > > + * case (logically contiguous placement, within a single engine class) is
> > > > + * supported when using GuC submission. Execlist mode could support all possible
> > > > + * bonding configurations but currently doesn't support this extension.
> > > > + */
> > > > +#define I915_PARALLEL_IMPLICT_BONDS		(1<<0)
> > > > +/*
> > > > + * Do not allow BBs to be preempted mid BB rather insert coordinated preemption
> > > > + * points on all hardware contexts between each set of BBs. An example use case
> > > > + * of this feature is split-frame on gen11+ hardware. When using this feature a
> > > > + * BB must be submitted on each hardware context in the parallel gem context.
> > > > + * The execbuf2 IOCTL enforces the user adheres to policy.
> > > > + */
> > > > +#define I915_PARALLEL_NO_PREEMPT_MID_BATCH	(1<<1)
> > > > +#define I915_PARALLEL_UNKNOWN_FLAGS  (-(I915_PARALLEL_NO_PREEMPT_MID_BATCH << 1))
> > > > +	__u64 flags; /* all undefined flags must be zero */
> > > > +	__u64 mbz64[4]; /* reserved for future use; must be zero */
> > > > +} __attribute__ ((packed));
> > > 
> > > Ok I'm having some serious questions. This looks way too much like it's
> > > inspired by bonded submission, and given we're tossing bonded submission
> > > we need to make sure we're doing this for good independent reasons and not
> > > just for intertia.
> > > 
> > 
> > You are not wrong here, the bonding submission interface was a factor in
> > designing this interface.
> > 
> > > What I expected looking at how media-driver uses bonded submit currently
> > > is:
> > > 
> > > - We create a parallel submit engine, which occupies a virtual engine
> > >   slot. This parallel virtual engine contains all the information we need,
> > >   i.e. the flags you have above, but also how many engines run in parallel
> > >   and how each of those can be load-balanced. So probably a full NxM
> > >   matrix of physical engines needed.
> > > 
> > 
> > Internally we need all this information broken out into individual structures,
> > at least with the current implementation. We need N ring buffers, N timelines, N
> > LRCs, N HWSPs, etc... All of this is encapsulated by a 'struct intel_context'
> > which occupies a slot. Could we create a super object with N 'struct
> > intel_context', sure. I'm just not sure what that buys us and IMO creates an
> > inconsistent uAPI.
> 
> So if the implementation is too much work to adapt, here's a really nasty
> trick: Currently we limit the engine slots to 64 in a gem context, because
> that's the limit of the execbuf field. We could use the engine slots above
> that for all these additional intel_context that we need underneath, at
> least for execlist. Does GuC need them all too?
> 
> But clean approach would be to have an intel_parallal_engine struct which
> has all these pointers internally I think.
> 
> Same on the high-level execbuf flow, doing all that N times is silly. So
> again I'd assume there's one overall i915_request that tracks the parallel
> submission, and then maybe N subordinate i915_request for each piece
> (execlist backend definitely needs those for scheduling, I didn't check
> about GuC).
> 
> Also drm/scheduler only deals with a single thing too, so that way the
> high level code would never need to know that there's actually N things
> underneath doing the job.
>

Again each i915_request points to a single (and different) intel_context,
timeline, lrc, ring, seqno, etc... The whole stack really treats these as
individual things aside from the excl slot where we form a composite fence. Not
saying we couldn't change this over time but initially creating a
'i915_super_request' would be quite the undertaking, very invasive to the mid
layers of the stack, and not sure in the end what it buys us.

Once the parallel submit gets posted you will be able to see that it is a uAPI
context setup extension, updates the execbuf IOCTL to accept N batches which is
basically a for loop, and GuC backend being able to submit N batches at once -
the mid layers are almost completely untouched.

Lastly, if we need to support the parallel submit extension as purposed for
execlists, all we need to do is update the uAPI setup extension to configure the
contexts. If we create a 'i915_super_request' we would have a massive rework in
execlist backend too.

> > > - Execbuf uses that parallel virtual engine to submit all N batchbuffers
> > >   in one go.
> > > 
> > 
> > If we expose 1 or N engines it doesn't really matter, does it? Either way the
> > entire GEM context is configured for N BBs in a single IOCTL.
> > 
> > > - This means we don't create virtual engines (or physical engine mappings)
> > >   for all the individual pieces in a parallel engine. That's a concept
> > >   from bonded submission, and I think that needs to go.
> > > 
> > 
> > Again this isn't strickly true - we need N internal backing structures.
> 
> I didn't check the code, but iirc you said for the GuC backend you do
> nothing until the last submit. Only then it's pushed into the GuC. That
> sounds a bit silly, and by treating parallel submission as a single thing
> (which might or mightnot be split in lower levels) this would go away.
>

We update internal state on each submit, the last submit is the one to interact
with the GuC.
 
> But it also might be way too much churn, because there's a bunch of places
> where we have to do this splitting. If it's all, then maybe just keeping
> the engines around everywhere makes sense.
> 
> But also this is leaking implementation details into uapi, from umd pov
> it's really 1 virtual engine that gets 1 execbuf call to submit N batches.
> Leaking that we treat it as N engines underneath feels like a mistake.
>

Too be clear, changing from N slots to 1 slot isn't that big of a deal. Changing
from N i915_requests to 1 is a *huge* deal.

N slots to 1 slots will just touch the uAPI setup extension and the execbuf
IOCTL.

N i915_requests to 1 will ripple thoughout the entire stack. 
 
> > > - More important not having a parallel virtual engine breaks our already
> > >   badly confusing gem ctx api. Ignoring parallel/bonded submit the gem ctx
> > >   is just a container object, which points at a bunch of engines (plus the
> > >   VM and a few other things). Having parallel context something that sits
> > >   at the gem ctx level, and not as an individual engine (of which you can
> > >   have multiple in the same gem ctx) breaks stuff. E.g. right the perf api
> > >   sits at the gem ctx level, so that you can capture all the perf data for
> > >   an entire workload spawning across multiple engines. If a workload now
> > >   needs multiple parallel engines we'd need multiple gem ctx, which breaks
> > >   this.
> > 
> > This uAPI allows only 1 parallel context per gem context which isn't ideal. I'd
> > love to fix this and changing a context to a single slot might be able to fix
> > this.
> 
> Yeah this is essentially the main gripe I have with this. Everywhere else
> you submit to a (gem_ctx_id, engine_slot) pair. Except for parallel
> submit, where you submit to a gem_ctx_id and the engine slot doesn't
> matter. That's a rather unfortunate uapi.
> 

Yea this isn't ideal but we've kinda backed ourselves into a corner here at
least consistency wise.

As purposed we basically have 2 steps to configure a gem context:

1. Define placement rules (set_engines, set_load_balance)
2. Indicate this context is used for parallel submission (set_parallel)

What would the the uAPI look like where a each parallel context occupies a slot?

1. Define a the number of slots (set_engines)
2. For each slot allow a virtual or parallel context (set_load_balance,
set_parallel)

The set_parallel would have to contain all the placement information for 2 to N
contexts, right? So each set_parallel is chained extension too. Now we have a
two level chain in our IOCTL.

e.g.

set_engines (3 slots) -> set_load_balance (slot 0) -> set_parallel (slot 1) ->                                                            -> set_load_balance (slot 2)
									     | 								  |
									     > placement for context 0 -> placement for context 1, etc...->	

IMO this seems like a bigger mess but I suppose it would work.

As you say below gem contexts are moving towards just being containers so does
it really matter if a UMD has to create a gem context per a parallel context?
They still can share address space, pass fences between them, etc...

If we really want to go the direction of 1 slot per parallel context I can hack
up a PoC branch when I have time. 

Matt

> Now with bonded submit this made some sense (not that bonded submit itself
> made much sense), since you did indeed submit N batchbuffers to N
> (gem_ctx_id, engine_slot) pairs. But with parallel submit it's really just
> one execbuf call.
> 
> > > So what I'd expect we'd have here is roughly:
> > > 
> > > struct i915_context_engines_parallel_submit {
> > > 	struct i915_user_extension base;
> > > 	__u64 flags;
> > > 	__u32 num_engines; /* N, must match what we submit in the execbuf */
> > > 	__u32 num_siblings; /* M, I'm assuming it's ok we require that siblings must match across the entire set of parallel engines */
> > > 	struct engine_info[]; /* NxM array of engine infos, pls fill in the right struct name :-) */
> > > };
> > > 
> > > If we then also require that you always submit the full width of N
> > > batchbuffers then even the execbuf extension doesn't need to exist
> > > anymore, because the virtual parallel engine already contains all the
> > > needed information.
> > > 
> > > And sure for some backends at least (definitely execlist) we'd need to
> > > create a bunch of additional virtual engines behind that virtual engine.
> > > But they'd be entirely hidden, and not visible to userspace nor the higher
> > > levels.
> > >
> > > What am I missing?
> > 
> > Not really, I think you got it. I think at the end of day this really comes down
> > to do we want to allow more than 1 parallel virtual engine per gem context? If
> > the answer is yes we collapse a parallel virtual engine into a single slot, if
> > not we leave as is.
> 
> Yup. So right now media uses one gem context per engine they need. Since
> media doesn't care about perf/OA they could get shared VM by sharing the
> VM across gem ctx, which they already do. So probably we could get away if
> we leave parallel engines as a gem ctx level thing.
> 
> Also on the media-driver code the impact is nil since it's just a
> different chain of context extensions in the same ioctl call.
> 
> Bigger picture is that Jason is quite unhappy withou our gem ctx based
> uapi, and his long term idea is to make gem ctx into a pure container
> object with pointers to engines and a vm. And not something that has
> relevance itself. Currently that's not the case for perf/OA, which works
> on the gem ctx, and Jason's already unhappy about that one. So adding more
> stuff on the gem ctx level feels a bit like a mistake.
> 
> Cheers, Daniel
> 
> > 
> > Matt
> > 
> > > -Daniel
> > > 
> > > >  #define I915_DEFINE_CONTEXT_PARAM_ENGINES(name__, N__) struct { \
> > > >  	__u64 extensions; \
> > > >  	struct i915_engine_class_instance engines[N__]; \
> > > > -- 
> > > > 2.28.0
> > > > 
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
