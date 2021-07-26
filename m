Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352733D5D80
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7018C6E4EC;
	Mon, 26 Jul 2021 15:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995CE6E4EC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:42:17 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id x192so15597574ybe.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UE0IrG3eNeMzhEZHqZmhnXD0NVVDI7NJd2TFtD0KNRw=;
 b=tt7UxSoXoQOYUskg83QJstgxZ+ybTMQhukn9l1tDK4ctagiyCpFZPVhik86Ngp7RmC
 uFAam6s5eHGD/GZ3sg9o2u2+z6znTIWnRzqYU6NR29/Nweux5ZikTHGKp8z63BrxQ5iT
 h741f904fGfGXHzVDdkHHlXuKP0CIhUL0Y12PSlsIDGCBEmIWCzWlEzOxzmes/kPhYxr
 6x6ERmkSMpDmvyUiYOWeM5mdgGCwzjEHuZscG72wtqryLlTzf2qQZgQf3zZQZAmbXLNl
 qvBxMacM3lZYOks2zuE+EpzDQ6T3cxWJ9JH4aueWnfidr5tyYF5jNZKjSkvUA76p8Pcb
 T3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UE0IrG3eNeMzhEZHqZmhnXD0NVVDI7NJd2TFtD0KNRw=;
 b=Vnip4V7hO1P2Dqd0S4DN1VXlIEwBFP9iXW7Ri6dwzYsIV/LkZHCHJ8OUlda3eZF12N
 c7rE8/8+qj9nrr2Ssfm+zmU+WTcLQzTMu1Diw0cHv9Dv0vM3ISZsL0iFfqxiz+SQ+hu5
 QKjegDOsjr8+qH15Z0Kz14iHZRjx0pN1i34vAYDGKP6XnF45O6ocQamArxZrINsnrfjJ
 g9zcieG78h2GFyBOldPGvrjyqHlHxUY0tGekq+SR9CPk3Ztf+jT2UR9Z36u2inW42viN
 0H81kRHYUWoU571LCW1YHGt3RFSDsJ0pDgpMtiuSuU0IyHMa/6iiw2lbWmfnh2LFhN47
 P1/A==
X-Gm-Message-State: AOAM533VQpR8Gcn3/IJxagMqUZ23tpcMHLpdTO+K7hcMsoPMBqFepsxu
 sPo+qVxFk8tPCZ4sbvEw8LpvAfzhNkxcJsNKMpNmaA==
X-Google-Smtp-Source: ABdhPJwCmFdQlpXUCbHiVE/uyJZTuf81XaX1q/dK1GE6xlWAVtLO6X7/SQ+l0q/9YvpFA9cVbcohGUKkzUk4/T0LHg4=
X-Received: by 2002:a25:208b:: with SMTP id
 g133mr24099710ybg.211.1627314136636; 
 Mon, 26 Jul 2021 08:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
 <20210723192934.1004427-4-daniel.vetter@ffwll.ch>
 <0edb5c4d-1faf-4b24-a21d-fd2e5be6591d@linux.intel.com>
 <CAOFGe96Da_O7VBaw85LsNTfMZhb2ycVg3WJ0fFe6xekB0m2NnA@mail.gmail.com>
In-Reply-To: <CAOFGe96Da_O7VBaw85LsNTfMZhb2ycVg3WJ0fFe6xekB0m2NnA@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:42:05 -0500
Message-ID: <CAOFGe96OBK3W_c8YU=4LHysumEOm3Y27KX_Mok=P686aa3c0Bw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 04/10] drm/i915: move intel_context slab to
 direct module init/exit
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 10:30 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Mon, Jul 26, 2021 at 3:35 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> >
> > On 23/07/2021 20:29, Daniel Vetter wrote:
> > > With the global kmem_cache shrink infrastructure gone there's nothing
> > > special and we can convert them over.
> > >
> > > I'm doing this split up into each patch because there's quite a bit of
> > > noise with removing the static global.slab_ce to just a
> > > slab_ce.
> > >
> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_context.c | 25 ++++++++-----------------
> > >   drivers/gpu/drm/i915/gt/intel_context.h |  3 +++
> > >   drivers/gpu/drm/i915/i915_globals.c     |  2 --
> > >   drivers/gpu/drm/i915/i915_globals.h     |  1 -
> > >   drivers/gpu/drm/i915/i915_pci.c         |  2 ++
> > >   5 files changed, 13 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > > index baa05fddd690..283382549a6f 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > > @@ -7,7 +7,6 @@
> > >   #include "gem/i915_gem_pm.h"
> > >
> > >   #include "i915_drv.h"
> > > -#include "i915_globals.h"
> > >   #include "i915_trace.h"
> > >
> > >   #include "intel_context.h"
> > > @@ -15,14 +14,11 @@
> > >   #include "intel_engine_pm.h"
> > >   #include "intel_ring.h"
> > >
> > > -static struct i915_global_context {
> > > -     struct i915_global base;
> > > -     struct kmem_cache *slab_ce;
> > > -} global;
> > > +struct kmem_cache *slab_ce;
>
> Static?  With that,
>
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
>
> > >
> > >   static struct intel_context *intel_context_alloc(void)
> > >   {
> > > -     return kmem_cache_zalloc(global.slab_ce, GFP_KERNEL);
> > > +     return kmem_cache_zalloc(slab_ce, GFP_KERNEL);
> > >   }
> > >
> > >   static void rcu_context_free(struct rcu_head *rcu)
> > > @@ -30,7 +26,7 @@ static void rcu_context_free(struct rcu_head *rcu)
> > >       struct intel_context *ce = container_of(rcu, typeof(*ce), rcu);
> > >
> > >       trace_intel_context_free(ce);
> > > -     kmem_cache_free(global.slab_ce, ce);
> > > +     kmem_cache_free(slab_ce, ce);
> > >   }
> > >
> > >   void intel_context_free(struct intel_context *ce)
> > > @@ -410,22 +406,17 @@ void intel_context_fini(struct intel_context *ce)
> > >       i915_active_fini(&ce->active);
> > >   }
> > >
> > > -static void i915_global_context_exit(void)
> > > +void i915_context_module_exit(void)
> > >   {
> > > -     kmem_cache_destroy(global.slab_ce);
> > > +     kmem_cache_destroy(slab_ce);
> > >   }
> > >
> > > -static struct i915_global_context global = { {
> > > -     .exit = i915_global_context_exit,
> > > -} };
> > > -
> > > -int __init i915_global_context_init(void)
> > > +int __init i915_context_module_init(void)
> > >   {
> > > -     global.slab_ce = KMEM_CACHE(intel_context, SLAB_HWCACHE_ALIGN);
> > > -     if (!global.slab_ce)
> > > +     slab_ce = KMEM_CACHE(intel_context, SLAB_HWCACHE_ALIGN);
> > > +     if (!slab_ce)
> > >               return -ENOMEM;
> > >
> > > -     i915_global_register(&global.base);
> > >       return 0;
> > >   }
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > > index 974ef85320c2..a0ca82e3c40d 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > > @@ -30,6 +30,9 @@ void intel_context_init(struct intel_context *ce,
> > >                       struct intel_engine_cs *engine);
> > >   void intel_context_fini(struct intel_context *ce);
> > >
> > > +void i915_context_module_exit(void);
> > > +int i915_context_module_init(void);
> > > +
> > >   struct intel_context *
> > >   intel_context_create(struct intel_engine_cs *engine);
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> > > index 3de7cf22ec76..d36eb7dc40aa 100644
> > > --- a/drivers/gpu/drm/i915/i915_globals.c
> > > +++ b/drivers/gpu/drm/i915/i915_globals.c
> > > @@ -7,7 +7,6 @@
> > >   #include <linux/slab.h>
> > >   #include <linux/workqueue.h>
> > >
> > > -#include "gem/i915_gem_context.h"
> > >   #include "gem/i915_gem_object.h"
> > >   #include "i915_globals.h"
> > >   #include "i915_request.h"
> > > @@ -32,7 +31,6 @@ static void __i915_globals_cleanup(void)
> > >   }
> > >
> > >   static __initconst int (* const initfn[])(void) = {
> > > -     i915_global_context_init,
> > >       i915_global_gem_context_init,
> > >       i915_global_objects_init,
> > >       i915_global_request_init,
> > > diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
> > > index d80901ba75e3..60daa738a188 100644
> > > --- a/drivers/gpu/drm/i915/i915_globals.h
> > > +++ b/drivers/gpu/drm/i915/i915_globals.h
> > > @@ -23,7 +23,6 @@ int i915_globals_init(void);
> > >   void i915_globals_exit(void);
> > >
> > >   /* constructors */
> > > -int i915_global_context_init(void);
> > >   int i915_global_gem_context_init(void);
> > >   int i915_global_objects_init(void);
> > >   int i915_global_request_init(void);
> > > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > > index f9527269e30a..266618157775 100644
> > > --- a/drivers/gpu/drm/i915/i915_pci.c
> > > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > > @@ -33,6 +33,7 @@
> > >   #include "i915_active.h"
> > >   #include "i915_buddy.h"
> > >   #include "i915_drv.h"
> > > +#include "gem/i915_gem_context.h"
> >
> > It's a bit ugly to go to a design where i915_pci.c has to include so
> > many random parts of i915. IMO for a complex driver like i915,
> > compartmentalizing so much knowledge about the internals was better
> > inside the globals layer.
>
> I agree that i915_pci feels like the wrong place to put this but I
> don't think that's so much because globals don't belong in i915_pci
> but because i915_init/exit don't belong there.  Maybe, once this is
> all said and done (or at the start of the series), we should move
> i915_init/exit to i915_drv.c?  Of course, there's a bunch of PCI
> probing stuff in i915_drv.c so..... yeah.... our organization is
> pretty busted.

To put a finer point on this, the new "design" is really to have a
single flat list instead of two, one nested inside the other.  There's
nothing wrong with that at all.  The fact that all this stuff now
lives in i915_pci.c is ugly.  But, as I said, that's kind-of an
accident of history because that's where i915_init() and i915_exit()
currently live.  We should just move the lot to i915_drv.c.

> --Jason
>
> > Maybe add a cover letter to explain the perceived pros and cons and
> > thinking in general?
> >
> > Regards,
> >
> > Tvrtko
> >
> > >   #include "i915_perf.h"
> > >   #include "i915_globals.h"
> > >   #include "i915_selftest.h"
> > > @@ -1297,6 +1298,7 @@ static const struct {
> > >       { i915_check_nomodeset, NULL },
> > >       { i915_active_module_init, i915_active_module_exit },
> > >       { i915_buddy_module_init, i915_buddy_module_exit },
> > > +     { i915_context_module_init, i915_context_module_exit },
> > >       { i915_globals_init, i915_globals_exit },
> > >       { i915_mock_selftests, NULL },
> > >       { i915_pmu_init, i915_pmu_exit },
> > >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
