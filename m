Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4903FF00A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 17:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BC06E5B6;
	Thu,  2 Sep 2021 15:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF6F6E5B6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 15:22:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1626347wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eYfNsjWAGWa623rCnflxklPtZi93OK2VSo08Skapft0=;
 b=jAQNe9N2U/atme78b/13J15ozOYPCGbEps3ZyjxAttsei66SH8RTeZg0TXaxipMk62
 fcd79kytBoQOY3rNfjtHmYht32ADLlrhxaS7++SBEczPseHEatj2ngROEV9EraqyZslx
 jkSVHWRIuH5m6mExUMm9ulnenvMvLTjteWfl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eYfNsjWAGWa623rCnflxklPtZi93OK2VSo08Skapft0=;
 b=JbrTX0g+4/9RBJtfW8QY3K7o1erfIlWRChuqfn+81lvy7kQT3LVGeCj7VzFHkZppzv
 KGLHdVW5XDwE53raz2PVrfKu6Nl//8T2GEr+/p5eWPP+Xeh19bxnzZuSNES/ObEkJVNe
 N/pVWdqigU2TlP6r662Kt1d5pn5JZlkeIreKM/5TJScCWew4l6bNQg3/SQX5nC3X6kH3
 4aPN1K4Vl38vbKgbIYdgnhVNX5L3kTAbaR7l40kpIjp3qCGeFHk6lDLQ0mcsEtynBXlf
 FUSsR5iMczHBTVQDAAKHjbPZ7a4+ttx+XExuBKyvDchibA7n77WtYpKd5WG/J/Vdpqmf
 VmJg==
X-Gm-Message-State: AOAM533EJT4FD5hw7jjYWV9joS1jODvHon1lv0XyXfheKeySaC46UkGh
 OGOtE2kQIEBCRV1kWZK3ZIJgZg==
X-Google-Smtp-Source: ABdhPJx6wGelPQ7D98WnZI6ng3+BeepkX5B4B9tMqYfjH+GLU0kX5M6jDrCiayUdLVHvychTAB7QSw==
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr3711733wml.58.1630596140022; 
 Thu, 02 Sep 2021 08:22:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w9sm1868297wmc.19.2021.09.02.08.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:22:19 -0700 (PDT)
Date: Thu, 2 Sep 2021 17:22:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 07/11] drm/i915: Add
 i915_gem_context_is_full_ppgtt
Message-ID: <YTDsKX2rQ4Kjr3io@phenom.ffwll.local>
References: <20210902142057.929669-1-daniel.vetter@ffwll.ch>
 <20210902142057.929669-7-daniel.vetter@ffwll.ch>
 <1cb4b910-ad02-ff02-46ef-7b3b4f393eb3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cb4b910-ad02-ff02-46ef-7b3b4f393eb3@linux.intel.com>
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

On Thu, Sep 02, 2021 at 03:54:36PM +0100, Tvrtko Ursulin wrote:
> On 02/09/2021 15:20, Daniel Vetter wrote:
> > And use it anywhere we have open-coded checks for ctx->vm that really
> > only check for full ppgtt.
> > 
> > Plus for paranoia add a GEM_BUG_ON that checks it's really only set
> > when we have full ppgtt, just in case. gem_context->vm is different
> > since it's NULL in ggtt mode, unlike intel_context->vm or gt->vm,
> > which is always set.
> > 
> > v2: 0day found a testcase that I missed.
> > 
> > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c           | 2 +-
> >   drivers/gpu/drm/i915/gem/i915_gem_context.h           | 7 +++++++
> >   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c        | 2 +-
> >   drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 6 +++---
> >   4 files changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 7a566fb7cca4..1eec85944c1f 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -1566,7 +1566,7 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
> >   	int err;
> >   	u32 id;
> > -	if (!rcu_access_pointer(ctx->vm))
> > +	if (!i915_gem_context_is_full_ppgtt(ctx))
> 
> It reads a bit wrong because GEM context cannot *be* full ppggt. It can be
> associated with a VM which is or isn't full ppgtt. So a test on a VM
> retrieved from a context is semnntically more correct. Perhaps you want to
> consider adding a helper to that effect instead? It could mean splitting
> into two helpers (getter + test) or maybe just renaming would work. Like
> i915_gem_context_has_full_ppgtt_vm(ctx)?

The pointer isn't set when the driver/context isn't running in full ppgtt
mode. This is why I've added the GEM_BUG_ON to check we're not breaking
any invariants. So yeah it is a full ppgtt context or it's not, that is
indeed the question here.

I'm happy to bikeshed the naming, but I don't see how your suggestion is
an improvement.
-Daniel


> 
> Regards,
> 
> Tvrtko
> 
> >   		return -ENODEV;
> >   	rcu_read_lock();
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> > index da6e8b506d96..37536a260e6e 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> > @@ -154,6 +154,13 @@ i915_gem_context_vm(struct i915_gem_context *ctx)
> >   	return rcu_dereference_protected(ctx->vm, lockdep_is_held(&ctx->mutex));
> >   }
> > +static inline bool i915_gem_context_is_full_ppgtt(struct i915_gem_context *ctx)
> > +{
> > +	GEM_BUG_ON(!!rcu_access_pointer(ctx->vm) != HAS_FULL_PPGTT(ctx->i915));
> > +
> > +	return !!rcu_access_pointer(ctx->vm);
> > +}
> > +
> >   static inline struct i915_address_space *
> >   i915_gem_context_get_eb_vm(struct i915_gem_context *ctx)
> >   {
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index 905b1cbd22d5..40f08948f0b2 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -749,7 +749,7 @@ static int eb_select_context(struct i915_execbuffer *eb)
> >   		return PTR_ERR(ctx);
> >   	eb->gem_context = ctx;
> > -	if (rcu_access_pointer(ctx->vm))
> > +	if (i915_gem_context_is_full_ppgtt(ctx))
> >   		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
> >   	return 0;
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> > index fc7fb33a3a52..947154e445a7 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> > @@ -704,7 +704,7 @@ static int igt_ctx_exec(void *arg)
> >   				pr_err("Failed to fill dword %lu [%lu/%lu] with gpu (%s) [full-ppgtt? %s], err=%d\n",
> >   				       ndwords, dw, max_dwords(obj),
> >   				       engine->name,
> > -				       yesno(!!rcu_access_pointer(ctx->vm)),
> > +				       yesno(i915_gem_context_is_full_ppgtt(ctx)),
> >   				       err);
> >   				intel_context_put(ce);
> >   				kernel_context_close(ctx);
> > @@ -838,7 +838,7 @@ static int igt_shared_ctx_exec(void *arg)
> >   				pr_err("Failed to fill dword %lu [%lu/%lu] with gpu (%s) [full-ppgtt? %s], err=%d\n",
> >   				       ndwords, dw, max_dwords(obj),
> >   				       engine->name,
> > -				       yesno(!!rcu_access_pointer(ctx->vm)),
> > +				       yesno(i915_gem_context_is_full_ppgtt(ctx)),
> >   				       err);
> >   				intel_context_put(ce);
> >   				kernel_context_close(ctx);
> > @@ -1417,7 +1417,7 @@ static int igt_ctx_readonly(void *arg)
> >   				pr_err("Failed to fill dword %lu [%lu/%lu] with gpu (%s) [full-ppgtt? %s], err=%d\n",
> >   				       ndwords, dw, max_dwords(obj),
> >   				       ce->engine->name,
> > -				       yesno(!!ctx_vm(ctx)),
> > +				       yesno(i915_gem_context_is_full_ppgtt(ctx)),
> >   				       err);
> >   				i915_gem_context_unlock_engines(ctx);
> >   				goto out_file;
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
