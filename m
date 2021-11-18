Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4D4554FC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 07:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B0D6F380;
	Thu, 18 Nov 2021 06:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAA56F380;
 Thu, 18 Nov 2021 06:57:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="297546185"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="297546185"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 22:57:14 -0800
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="454943222"
Received: from ntaiyeby-mobl1.ger.corp.intel.com (HELO [10.249.254.166])
 ([10.249.254.166])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 22:57:13 -0800
Message-ID: <ea91cc10df3f0a5463566c1eea00ff044efe0db4.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/6] drm/i915: move the pre_pin earlier
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Thu, 18 Nov 2021 07:57:10 +0100
In-Reply-To: <9ea7ae8e-c9c4-8b1e-2057-5be69eb35555@linux.intel.com>
References: <20211117142024.1043017-1-matthew.auld@intel.com>
 <9ea7ae8e-c9c4-8b1e-2057-5be69eb35555@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-11-17 at 19:49 +0100, Thomas Hellström wrote:
> 
> On 11/17/21 15:20, Matthew Auld wrote:
> > In intel_context_do_pin_ww, when calling into the pre_pin
> > hook(which is
> > passed the ww context) it could in theory return -EDEADLK(which is
> > very
> > likely with debug kernels), once we start adding more ww locking in
> > there,
> > like in the next patch. If so then we need to be mindful of having
> > to
> > restart the do_pin at this point.
> > 
> > If this is the kernel_context, or some other early in-kernel
> > context
> > where we have yet to setup the default_state, then we always
> > inhibit the
> > context restore, and instead rely on the delayed active_release to
> > set
> > the CONTEXT_VALID_BIT for us(if we even care), which should
> > indicate
> > that we have context switched away, and that our newly saved
> > context
> > state should now be valid. However, since we currently grab the
> > active
> > reference before the potential ww dance, we can end up setting the
> > CONTEXT_VALID_BIT much too early, if we need to backoff, and then
> > upon
> > re-trying the do_pin, we could potentially cause the hardware to
> > incorrectly load some garbage context state when later context
> > switching
> > to that context, but at the very least this will trigger the
> > GEM_BUG_ON() in __engine_unpark. For now let's just move any ww
> > dance
> > stuff prior to arming the active reference.
> > 
> > For normal user contexts this shouldn't be a concern, since we
> > should
> > already have the default_state ready when initialising the lrc
> > state,
> > and so there should be no concern with active_release somehow
> > prematurely setting the CONTEXT_VALID_BIT.
> > 
> > v2(Thomas):
> >    - Also re-order the union unwind

Oh should this be 

s/union/onion/ ?


> > 
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c
> > b/drivers/gpu/drm/i915/gt/intel_context.c
> > index 5634d14052bc..4c296de1d67d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -228,17 +228,17 @@ int __intel_context_do_pin_ww(struct
> > intel_context *ce,
> >         if (err)
> >                 return err;
> >   
> > -       err = i915_active_acquire(&ce->active);
> > +       err = ce->ops->pre_pin(ce, ww, &vaddr);
> >         if (err)
> >                 goto err_ctx_unpin;
> >   
> > -       err = ce->ops->pre_pin(ce, ww, &vaddr);
> > +       err = i915_active_acquire(&ce->active);
> >         if (err)
> > -               goto err_release;
> > +               goto err_post_unpin;
> >   
> >         err = mutex_lock_interruptible(&ce->pin_mutex);
> >         if (err)
> > -               goto err_post_unpin;
> > +               goto err_release;
> >   
> >         intel_engine_pm_might_get(ce->engine);
> >   
> > @@ -273,11 +273,11 @@ int __intel_context_do_pin_ww(struct
> > intel_context *ce,
> >   
> >   err_unlock:
> >         mutex_unlock(&ce->pin_mutex);
> > +err_release:
> > +       i915_active_release(&ce->active);
> >   err_post_unpin:
> >         if (!handoff)
> >                 ce->ops->post_unpin(ce);
> > -err_release:
> > -       i915_active_release(&ce->active);
> >   err_ctx_unpin:
> >         intel_context_post_unpin(ce);
> >   


