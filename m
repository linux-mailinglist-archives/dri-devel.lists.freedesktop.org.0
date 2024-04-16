Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C48A65BA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F002210F24D;
	Tue, 16 Apr 2024 08:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMIubHsv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D990C10F167;
 Tue, 16 Apr 2024 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713254994; x=1744790994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GbcFHCoSCaV73LfU5vtrX3O9NT1u2DItFCbLcyy0NTs=;
 b=RMIubHsvvZotcKfUuxCaAwo9d0Xlr2DKwo402EIElJQ9LUo9uTk6/Jbt
 ULy6VjksTvChdAnkX6jQBi+442RDEHuQFIS9SVg+Mu6JGMZcWInGMCJhH
 4G2v/07JWb0jJ2AA4UC9Y+jUOzqH1hnvtFDwnay8Uf2L9pe/+Zk4dy+Vr
 m8qOE8ZppMFAjSb7kdKm7owiZsHqFvVq7FIV1J9uwKi8dJE60FfxrtSYA
 2+Qpj1o+ko4voaYhC8rqfh4vpdkV60Gnu1YVd0V8yTIfRbHo4bIv1Obuf
 OapppJd4kSAqLLOuck9kQxsryd1wtu4iixuxt/98uxLoC5QJZyofqW2ah w==;
X-CSE-ConnectionGUID: qhYwSpgaR02w89ouKdTWFw==
X-CSE-MsgGUID: FzuWegywS7KEtY1+HW9Z8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8540729"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8540729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 01:09:52 -0700
X-CSE-ConnectionGUID: NPbHnf28SrmlRHSmnSupEg==
X-CSE-MsgGUID: f6G4AApfS7a+rkcOQ6aPmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="26971105"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.20.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 01:09:49 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/vma: Fix UAF on reopen vs destroy race
Date: Tue, 16 Apr 2024 10:09:46 +0200
Message-ID: <13491837.dW097sEU6C@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Zh3Rb15jVJeg1nex@intel.com>
References: <20240415195310.165934-2-janusz.krzysztofik@linux.intel.com>
 <Zh3Rb15jVJeg1nex@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Rodrigo,

On Tuesday, 16 April 2024 03:16:31 CEST Rodrigo Vivi wrote:
> On Mon, Apr 15, 2024 at 09:53:09PM +0200, Janusz Krzysztofik wrote:
> > We defer actually closing, unbinding and destroying a VMA until next idle
> > point, or until the object is freed in the meantime.  By postponing the
> > unbind, we allow for the VMA to be reopened by the client, avoiding the
> > work required to rebind the VMA.
> > 
> > It was assumed that as long as a GT is held idle, no VMA would be reopened
> > while we destroy them.  That assumption is no longer true in multi-GT
> > configurations, where a VMA we reopen may be handled by a GT different
> > from the one that we already keep active via its engine while we set up
> > an execbuf request.
> > 
> > <4> [260.290809] ------------[ cut here ]------------
> > <4> [260.290988] list_del corruption. prev->next should be ffff888118c5d990, but was ffff888118c5a510. (prev=ffff888118c5a510)
> > <4> [260.291004] WARNING: CPU: 2 PID: 1143 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0xb7/0xe0
> > ..
> > <4> [260.291055] CPU: 2 PID: 1143 Comm: kms_plane Not tainted 6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
> > <4> [260.291058] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
> > <4> [260.291060] RIP: 0010:__list_del_entry_valid_or_report+0xb7/0xe0
> > ...
> > <4> [260.291087] Call Trace:
> > <4> [260.291089]  <TASK>
> > <4> [260.291124]  i915_vma_reopen+0x43/0x80 [i915]
> > <4> [260.291298]  eb_lookup_vmas+0x9cb/0xcc0 [i915]
> > <4> [260.291579]  i915_gem_do_execbuffer+0xc9a/0x26d0 [i915]
> > <4> [260.291883]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
> > ...
> > <4> [260.292301]  </TASK>
> > ...
> > <4> [260.292506] ---[ end trace 0000000000000000 ]---
> > <4> [260.292782] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6ca3: 0000 [#1] PREEMPT SMP NOPTI
> > <4> [260.303575] CPU: 2 PID: 1143 Comm: kms_plane Tainted: G        W          6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
> > <4> [260.313851] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
> > <4> [260.326359] RIP: 0010:eb_validate_vmas+0x114/0xd80 [i915]
> > ...
> > <4> [260.428756] Call Trace:
> > <4> [260.431192]  <TASK>
> > <4> [639.283393]  i915_gem_do_execbuffer+0xd05/0x26d0 [i915]
> > <4> [639.305245]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
> > ...
> > <4> [639.411134]  </TASK>
> > ...
> > <4> [639.449979] ---[ end trace 0000000000000000 ]---
> > 
> > As soon as we start unbinding and destroying a VMA, marked it as parked,
> > and also keep it marked as closed for the rest of its life.  When a VMA
> > to be opened occurs closed, reopen it only if not yet parked.
> > 
> > v3: Fix misplaced brackets.
> > v2: Since we no longer re-init the VMA closed list link on VMA park so it
> >     looks like still on a list, don't try to delete it from the list again
> >     after the VMA has been marked as parked.
> > 
> > Fixes: b0647a5e79b1 ("drm/i915: Avoid live-lock with i915_vma_parked()")
> 
> what about reverting that?

I didn't think of that.  Why you think that might be a better approach?

Anyway, that's a 4 years old patch and a few things have changed since then, 
so simple revert won't work.  Moreover, I've just checked that patch was 
supposed to fix another patch, 77853186e547 ("drm/i915: Claim vma while under 
closed_lock in i915_vma_parked()"), which in turn was supposed to fix 
aa5e4453dc05 ("drm/i915/gem: Try to flush pending unbind events"), and that 
one also referenced still another, cb6c3d45f948 ("drm/i915/gem: Avoid parking 
the vma as we unbind") from December 2019, which finally wasn't a fix but an 
improvement. Then, we would have to consider new fixes alternative to at least 
some of those three, I guess.  I'd rather not dig that deep, unless we invest 
in a completely new solution (e.g. backport VMA handling from xe if more 
effective while compatible to some extent?).  Even then, we need a fix for 
now.

Alternatively, we can try to revert my 1f33dc0c1189 ("drm/i915: Remove extra 
multi-gt pm-references") which was a manual revert of f56fe3e91787 ("drm/i915: 
Fix a VMA UAF for multi-gt platform") -- a workaround that was supposed to 
address some multi-GT related VMA issues.  While it didn't really resolve 
those issues it was addressing, I think it may help with this one, which 
started appearing after I reverted that workaround.  However, its 
effectiveness is limited to MTL topology.

Thanks,
Janusz

> 
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10608
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: stable@vger.kernel.org # v6.0+
> > ---
> >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++++--
> >  drivers/gpu/drm/i915/i915_vma.c               | 32 +++++++++++++++----
> >  drivers/gpu/drm/i915/i915_vma.h               |  2 +-
> >  drivers/gpu/drm/i915/i915_vma_types.h         |  3 ++
> >  4 files changed, 37 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index 42619fc05de48..97e014f94002e 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -847,9 +847,12 @@ static int __eb_add_lut(struct i915_execbuffer *eb,
> >  	if (unlikely(!lut))
> >  		return -ENOMEM;
> >  
> > +	if (!i915_vma_open(vma)) {
> > +		err = -EEXIST;	/* let eb_vma_lookup() retry */
> > +		goto err_lut_free;
> > +	}
> > +
> >  	i915_vma_get(vma);
> > -	if (!atomic_fetch_inc(&vma->open_count))
> > -		i915_vma_reopen(vma);
> >  	lut->handle = handle;
> >  	lut->ctx = ctx;
> >  
> > @@ -880,8 +883,9 @@ static int __eb_add_lut(struct i915_execbuffer *eb,
> >  	return 0;
> >  
> >  err:
> > -	i915_vma_close(vma);
> >  	i915_vma_put(vma);
> > +	i915_vma_close(vma);
> > +err_lut_free:
> >  	i915_lut_handle_free(lut);
> >  	return err;
> >  }
> > diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> > index d2f064d2525cc..4435c76f28c8c 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.c
> > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > @@ -1735,14 +1735,33 @@ static void __i915_vma_remove_closed(struct i915_vma *vma)
> >  	list_del_init(&vma->closed_link);
> >  }
> >  
> > -void i915_vma_reopen(struct i915_vma *vma)
> > +static struct i915_vma *i915_vma_reopen(struct i915_vma *vma)
> > +{
> > +	if (atomic_read(&vma->flags) & I915_VMA_PARKED)
> > +		return NULL;
> > +
> > +	__i915_vma_remove_closed(vma);
> > +	return vma;
> > +}
> > +
> > +struct i915_vma *i915_vma_open(struct i915_vma *vma)
> >  {
> >  	struct intel_gt *gt = vma->vm->gt;
> >  
> > +	if (atomic_inc_not_zero(&vma->open_count))
> > +		return vma;
> > +
> >  	spin_lock_irq(&gt->closed_lock);
> > -	if (i915_vma_is_closed(vma))
> > -		__i915_vma_remove_closed(vma);
> > +	if (!atomic_inc_not_zero(&vma->open_count)) {
> > +		if (i915_vma_is_closed(vma))
> > +			vma = i915_vma_reopen(vma);
> > +
> > +		if (vma)
> > +			atomic_inc(&vma->open_count);
> > +	}
> >  	spin_unlock_irq(&gt->closed_lock);
> > +
> > +	return vma;
> >  }
> >  
> >  static void force_unbind(struct i915_vma *vma)
> > @@ -1770,7 +1789,8 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
> >  	spin_unlock(&obj->vma.lock);
> >  
> >  	spin_lock_irq(&gt->closed_lock);
> > -	__i915_vma_remove_closed(vma);
> > +	if (!(atomic_read(&vma->flags) & I915_VMA_PARKED))
> > +		__i915_vma_remove_closed(vma);
> >  	spin_unlock_irq(&gt->closed_lock);
> >  
> >  	if (vm_ddestroy)
> > @@ -1854,22 +1874,22 @@ void i915_vma_parked(struct intel_gt *gt)
> >  		}
> >  
> >  		list_move(&vma->closed_link, &closed);
> > +		atomic_or(I915_VMA_PARKED, &vma->flags);
> >  	}
> >  	spin_unlock_irq(&gt->closed_lock);
> >  
> > -	/* As the GT is held idle, no vma can be reopened as we destroy them */
> >  	list_for_each_entry_safe(vma, next, &closed, closed_link) {
> >  		struct drm_i915_gem_object *obj = vma->obj;
> >  		struct i915_address_space *vm = vma->vm;
> >  
> >  		if (i915_gem_object_trylock(obj, NULL)) {
> > -			INIT_LIST_HEAD(&vma->closed_link);
> >  			i915_vma_destroy(vma);
> >  			i915_gem_object_unlock(obj);
> >  		} else {
> >  			/* back you go.. */
> >  			spin_lock_irq(&gt->closed_lock);
> >  			list_add(&vma->closed_link, &gt->closed_vma);
> > +			atomic_andnot(I915_VMA_PARKED, &vma->flags);
> >  			spin_unlock_irq(&gt->closed_lock);
> >  		}
> >  
> > diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> > index e356dfb883d34..331d19672c764 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.h
> > +++ b/drivers/gpu/drm/i915/i915_vma.h
> > @@ -268,7 +268,7 @@ int __must_check i915_vma_unbind_async(struct i915_vma *vma, bool trylock_vm);
> >  int __must_check i915_vma_unbind_unlocked(struct i915_vma *vma);
> >  void i915_vma_unlink_ctx(struct i915_vma *vma);
> >  void i915_vma_close(struct i915_vma *vma);
> > -void i915_vma_reopen(struct i915_vma *vma);
> > +struct i915_vma *i915_vma_open(struct i915_vma *vma);
> >  
> >  void i915_vma_destroy_locked(struct i915_vma *vma);
> >  void i915_vma_destroy(struct i915_vma *vma);
> > diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> > index 559de74d0b114..41784c3025349 100644
> > --- a/drivers/gpu/drm/i915/i915_vma_types.h
> > +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> > @@ -263,6 +263,9 @@ struct i915_vma {
> >  #define I915_VMA_SCANOUT_BIT	17
> >  #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
> >  
> > +#define I915_VMA_PARKED_BIT	18
> > +#define I915_VMA_PARKED		((int)BIT(I915_VMA_PARKED_BIT))
> > +
> >  	struct i915_active active;
> >  
> >  #define I915_VMA_PAGES_BIAS 24
> 




