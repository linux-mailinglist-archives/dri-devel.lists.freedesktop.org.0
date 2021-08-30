Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF753FB274
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE6688A27;
	Mon, 30 Aug 2021 08:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AA48857E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:26:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u3so29317437ejz.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ak+tlKnNkX9+yzzcUOAfQTl1usY86CHbMm4q/3lNbv4=;
 b=jpmlnBn5HYSzvUcZkFEPLFeQyid703b5P0qBCyr6+hgYjVzujfqx1UvmhYrOruPaQf
 SfhoOktnU4bw08/7GOShj3fR5b2iTFViuvliESEo9J0AVe4nlfcyrx6dMgMIkyoA43yW
 cJDNLDs+LYF/DVVasLPiB+W23evZ1jOK7LK3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ak+tlKnNkX9+yzzcUOAfQTl1usY86CHbMm4q/3lNbv4=;
 b=m6A0razdn3JERD36Zpx37doIBGhc+hTTsoaFQ8ZX2AuKdGdqxhd8YduUXKoDrzu4IM
 v/nQfV/u3YU01HpuVbTzZSyBn/0jxOqYu8FjbMqnJX4IFXNsLToFkgsVRrdzveQ0lZR6
 T4AH/cUJdD0vXlP9iXybDF+DMSSeckLd/fzPjxx/YiiywhGeQjyvSBky/PPj/LZ46ElJ
 jVBpkV/7n94dAQBB8Cno7bqkV202DjvIAXKNOHMIUHwwijG/EMWqwoPxlMaaZvoXFpao
 1AWkFuk3EGKZXbg1P1MCpW+9+I4iI3e+1P9wf4649HN55GNk9jK61oWemZumjn6jUPKB
 UQSA==
X-Gm-Message-State: AOAM532IylNj1v6RSJLlOP5LO+G2g9J6MZerTzzVGc/+enpoWQuDsU+H
 ZHWkO9RpB219UPp3QDNe/ogH2T01eGemIw==
X-Google-Smtp-Source: ABdhPJyUXZPNMWm39wgJHPfHXySZk/2alLQ7sntYXO8bBYcFYwUTKVT4f3PRJ7Q0MO7y3+d1rEty+w==
X-Received: by 2002:a17:906:3854:: with SMTP id
 w20mr23354033ejc.537.1630311989682; 
 Mon, 30 Aug 2021 01:26:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h2sm6408708edd.43.2021.08.30.01.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:26:29 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:26:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Handle Intel igfx + Intel dgfx
 hybrid graphics setup
Message-ID: <YSyWMxUyxgTYZCYw@phenom.ffwll.local>
References: <20210827133039.287075-1-tvrtko.ursulin@linux.intel.com>
 <20210827143941.287958-1-tvrtko.ursulin@linux.intel.com>
 <9c042851-9a27-6bc7-0749-ed0c573e9c80@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c042851-9a27-6bc7-0749-ed0c573e9c80@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Fri, Aug 27, 2021 at 03:44:42PM +0100, Tvrtko Ursulin wrote:
> 
> On 27/08/2021 15:39, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > In short this makes i915 work for hybrid setups (DRI_PRIME=1 with Mesa)
> > when rendering is done on Intel dgfx and scanout/composition on Intel
> > igfx.
> > 
> > Before this patch the driver was not quite ready for that setup, mainly
> > because it was able to emit a semaphore wait between the two GPUs, which
> > results in deadlocks because semaphore target location in HWSP is neither
> > shared between the two, nor mapped in both GGTT spaces.
> > 
> > To fix it the patch adds an additional check to a couple of relevant code
> > paths in order to prevent using semaphores for inter-engine
> > synchronisation between different driver instances.
> > 
> > Patch also moves singly used i915_gem_object_last_write_engine to be
> > private in its only calling unit (debugfs), while modifying it to only
> > show activity belonging to the respective driver instance.
> > 
> > What remains in this problem space is the question of the GEM busy ioctl.
> > We have a somewhat ambigous comment there saying only status of native
> > fences will be reported, which could be interpreted as either i915, or
> > native to the drm fd. For now I have decided to leave that as is, meaning
> > any i915 instance activity continues to be reported.
> > 
> > v2:
> >   * Avoid adding rq->i915. (Chris)
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Can't we just delete semaphore code and done?
- GuC won't have it
- media team benchmarked on top of softpin media driver, found no
  difference
- pre-gen8 semaphore code was also silently ditched and no one cared

Plus removing semaphore code would greatly simplify conversion to
drm/sched.

> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_object.h | 17 ----------
> >   drivers/gpu/drm/i915/i915_debugfs.c        | 39 ++++++++++++++++++++--
> >   drivers/gpu/drm/i915/i915_request.c        | 12 ++++++-
> >   3 files changed, 47 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > index 48112b9d76df..3043fcbd31bd 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > @@ -503,23 +503,6 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
> >   	i915_gem_object_unpin_pages(obj);
> >   }
> > -static inline struct intel_engine_cs *
> > -i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
> > -{
> > -	struct intel_engine_cs *engine = NULL;
> > -	struct dma_fence *fence;
> > -
> > -	rcu_read_lock();
> > -	fence = dma_resv_get_excl_unlocked(obj->base.resv);
> > -	rcu_read_unlock();
> > -
> > -	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
> > -		engine = to_request(fence)->engine;
> > -	dma_fence_put(fence);
> > -
> > -	return engine;
> > -}
> > -
> >   void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
> >   					 unsigned int cache_level);
> >   void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
> > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> > index 04351a851586..55fd6191eb32 100644
> > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > @@ -135,13 +135,46 @@ static const char *stringify_vma_type(const struct i915_vma *vma)
> >   	return "ppgtt";
> >   }
> > +static char *
> > +last_write_engine(struct drm_i915_private *i915,
> > +		  struct drm_i915_gem_object *obj)
> > +{
> > +	struct intel_engine_cs *engine;
> > +	struct dma_fence *fence;
> > +	char *res = NULL;
> > +
> > +	rcu_read_lock();
> > +	fence = dma_resv_get_excl_unlocked(obj->base.resv);
> > +	rcu_read_unlock();
> > +
> > +	if (!fence || dma_fence_is_signaled(fence))
> > +		goto out;
> > +
> > +	if (!dma_fence_is_i915(fence)) {
> > +		res = "<external-fence>";
> > +		goto out;
> > +	}
> > +
> > +	engine = to_request(fence)->engine;
> > +	if (engine->gt->i915 != i915) {
> > +		res = "<external-i915>";
> > +		goto out;
> > +	}
> > +
> > +	res = engine->name;
> > +
> > +out:
> > +	dma_fence_put(fence);
> > +	return res;
> > +}
> > +
> >   void
> >   i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
> >   {
> >   	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
> > -	struct intel_engine_cs *engine;
> >   	struct i915_vma *vma;
> >   	int pin_count = 0;
> > +	char *engine;
> >   	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x %s%s%s",
> >   		   &obj->base,
> > @@ -230,9 +263,9 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
> >   	if (i915_gem_object_is_framebuffer(obj))
> >   		seq_printf(m, " (fb)");
> > -	engine = i915_gem_object_last_write_engine(obj);
> > +	engine = last_write_engine(dev_priv, obj);
> >   	if (engine)
> > -		seq_printf(m, " (%s)", engine->name);
> > +		seq_printf(m, " (%s)", engine);
> 
> Or I zap this from the code altogether. Not sure it is very useful since the
> only caller is i915_gem_framebuffer debugfs file and how much it can care
> about maybe hitting the timing window when exclusive fence will contain
> something.

Ideally we'd just look at the fence timeline name. But i915 has this very
convoluted typesafe-by-rcu reuse which means we actually can't do that,
and our fence timeline name is very useless.

Would be good to fix that, Matt Auld has started an attempt but didn't get
very far.
-Daniel

> 
> Regards,
> 
> Tvrtko
> 
> >   }
> >   static int i915_gem_object_info(struct seq_file *m, void *data)
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index ce446716d092..64adf619fe82 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -1152,6 +1152,12 @@ __emit_semaphore_wait(struct i915_request *to,
> >   	return 0;
> >   }
> > +static bool
> > +can_use_semaphore_wait(struct i915_request *to, struct i915_request *from)
> > +{
> > +	return to->engine->gt == from->engine->gt;
> > +}
> > +
> >   static int
> >   emit_semaphore_wait(struct i915_request *to,
> >   		    struct i915_request *from,
> > @@ -1160,6 +1166,9 @@ emit_semaphore_wait(struct i915_request *to,
> >   	const intel_engine_mask_t mask = READ_ONCE(from->engine)->mask;
> >   	struct i915_sw_fence *wait = &to->submit;
> > +	if (!can_use_semaphore_wait(to, from))
> > +		goto await_fence;
> > +
> >   	if (!intel_context_use_semaphores(to->context))
> >   		goto await_fence;
> > @@ -1263,7 +1272,8 @@ __i915_request_await_execution(struct i915_request *to,
> >   	 * immediate execution, and so we must wait until it reaches the
> >   	 * active slot.
> >   	 */
> > -	if (intel_engine_has_semaphores(to->engine) &&
> > +	if (can_use_semaphore_wait(to, from) &&
> > +	    intel_engine_has_semaphores(to->engine) &&
> >   	    !i915_request_has_initial_breadcrumb(to)) {
> >   		err = __emit_semaphore_wait(to, from, from->fence.seqno - 1);
> >   		if (err < 0)
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
