Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3B412753
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 22:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDD889BF6;
	Mon, 20 Sep 2021 20:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576E589BF6;
 Mon, 20 Sep 2021 20:34:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="202728293"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="202728293"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 13:34:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="511527894"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 13:34:11 -0700
Date: Mon, 20 Sep 2021 13:29:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Hugh Dickins <hughd@google.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: fix blank screen booting crashes
Message-ID: <20210920202915.GB19283@jons-linux-dev-box>
References: <20210917233818.33659-1-matthew.brost@intel.com>
 <8c906ac4-c6a3-ee45-970f-07679456fd18@linux.intel.com>
 <87fstzvgrr.fsf@intel.com>
 <5fbbf1dc-e5fa-263c-ab2a-f308fae035f6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fbbf1dc-e5fa-263c-ab2a-f308fae035f6@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 08:42:42AM +0100, Tvrtko Ursulin wrote:
> 
> On 20/09/2021 08:38, Jani Nikula wrote:
> > On Mon, 20 Sep 2021, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > > On 18/09/2021 00:38, Matthew Brost wrote:
> > > > From: Hugh Dickins <hughd@google.com>
> > > > 
> > > > 5.15-rc1 crashes with blank screen when booting up on two ThinkPads
> > > > using i915.  Bisections converge convincingly, but arrive at different
> > > > and surprising "culprits", none of them the actual culprit.
> > > 
> > > It is certainly surprising this patch crashed SNB and KBL.
> > > 
> > > How feasible would it be to make this code just not run when GuC is not
> > > used? Given the field it adds is called ce->guc_blocked it sounds like a
> > > natural and preferable thing to do... if possible.
> > > 
> > > > netconsole (with init_netconsole() hacked to call i915_init() when
> > > > logging has started, instead of by module_init()) tells the story:
> > > > 
> > > > kernel BUG at drivers/gpu/drm/i915/i915_sw_fence.c:245!
> > > > with RSI: ffffffff814d408b pointing to sw_fence_dummy_notify().
> > > > I've been building with CONFIG_CC_OPTIMIZE_FOR_SIZE=y, and that
> > > > function needs to be 4-byte aligned.
> > > > 
> > > > v2:
> > > >    (Jani Nikula)
> > > >     - Change BUG_ON to WARN_ON
> > > 
> > > However in this case the code would then go on and call into a wrong
> > > function offset which may be worse than a BUG_ON, no?
> > 
> > So how about just
> > 
> > if (WARN_ON(...))
> > 	return;

I don't think it is quite that simple as if we short circuit this
function fence->flags will be NULL which would be bad too. I'll have
make a few more changes to make this safe.

Matt

> > 
> > or whatever is needed to give both the user and the CI a better
> > opportunity to see the error.
> 
> Sounds good to me.
> 
> Regards,
> 
> Tvrtko
> 
> 
> > 
> > BR,
> > Jani
> > 
> > 
> > > 
> > > > 
> > > > Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> > > > Signed-off-by: Hugh Dickins <hughd@google.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/gt/intel_context.c | 1 +
> > > >    drivers/gpu/drm/i915/i915_sw_fence.c    | 4 +++-
> > > >    2 files changed, 4 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > > > index ff637147b1a9..f02c2202da9d 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > > > @@ -362,6 +362,7 @@ static int __intel_context_active(struct i915_active *active)
> > > >    	return 0;
> > > >    }
> > > > +__aligned(4)	/* Respect the I915_SW_FENCE_MASK */
> > > 
> > > Hugh suggested __i915_sw_fence_call which I think would be the right
> > > thing to do.
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > >    static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
> > > >    				 enum i915_sw_fence_notify state)
> > > >    {
> > > > diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> > > > index c589a681da77..1217b124c1d0 100644
> > > > --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> > > > +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> > > > @@ -14,8 +14,10 @@
> > > >    #if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
> > > >    #define I915_SW_FENCE_BUG_ON(expr) BUG_ON(expr)
> > > > +#define I915_SW_FENCE_WARN_ON(expr) WARN_ON(expr)
> > > >    #else
> > > >    #define I915_SW_FENCE_BUG_ON(expr) BUILD_BUG_ON_INVALID(expr)
> > > > +#define I915_SW_FENCE_WARN_ON(expr) BUILD_BUG_ON_INVALID(expr)
> > > >    #endif
> > > >    static DEFINE_SPINLOCK(i915_sw_fence_lock);
> > > > @@ -242,7 +244,7 @@ void __i915_sw_fence_init(struct i915_sw_fence *fence,
> > > >    			  const char *name,
> > > >    			  struct lock_class_key *key)
> > > >    {
> > > > -	BUG_ON(!fn || (unsigned long)fn & ~I915_SW_FENCE_MASK);
> > > > +	I915_SW_FENCE_WARN_ON(!fn || (unsigned long)fn & ~I915_SW_FENCE_MASK);
> > > >    	__init_waitqueue_head(&fence->wait, name, key);
> > > >    	fence->flags = (unsigned long)fn;
> > > > 
> > 
