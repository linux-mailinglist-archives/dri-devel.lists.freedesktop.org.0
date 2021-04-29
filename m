Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA8836EEA5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 19:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98626F3F7;
	Thu, 29 Apr 2021 17:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333F46F3F7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 17:13:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q9so13530212wrs.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 10:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XSHJDrx6zqbFTW31hKYEYEuVCH3XKC3FLfJdfIIKFA4=;
 b=iV7bzvhxOfT+pDV/wGSrWunwcs40SsYJSBJ1vuyFhI5t/LTsjo+X0YUPVOCLFcaZJ8
 DPUqg9FNNTPFYI98FgPlD0+im3gCu30j9wfXPCCFUui6XJsu9um2R/Pi3biAevZlHDZZ
 t5uVS85GOTX3ENWN0MylObmKZsxV8eqHin7Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XSHJDrx6zqbFTW31hKYEYEuVCH3XKC3FLfJdfIIKFA4=;
 b=be+mbCiPlubUiPk88gm/5tH6KnUOFgoYRF9Ui/qjo2CRc0VnhNjLyQCqvp6naXOpEV
 1lNzkLWQg1lanGxVA4MMhytLpwY+dRbwoMYt72rXu/aIa19O/Epx+Mq1C/LzFle102ud
 So085P2EyXs4W+JWRZMUCsUwct2Q9vODiwj1tAsjHvRJ+XO/QAdGiz1oU7FPI5bKNSl2
 sk9TaXzfogsibK+y8J1JBBw9lZM2TjxiRMXRyExbBHOMEezgagdOHpbxT4rO4ZZVvN2g
 l8hcx0+oXjPNX+uBxnXYUlAmBtVKzA83tUvqlbtJFRG2kgI5VeiLD/fpYSlH26+4uA3G
 Sinw==
X-Gm-Message-State: AOAM5338HmSkBLKqgS8wvgtybIVBsbrc5UM0sBtin4nmJRD+B+QKHRsx
 iLpZPsC+yTuoiHiJEOzb7I6q+A==
X-Google-Smtp-Source: ABdhPJweCdHxRDeruFs8CiCzgjet96eS034S7ia1Z1VkRuu/4qWlafZinmQS5sKckJ/+ua5U/2SBqA==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr958112wrv.254.1619716395897; 
 Thu, 29 Apr 2021 10:13:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s21sm747587wmc.10.2021.04.29.10.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:13:15 -0700 (PDT)
Date: Thu, 29 Apr 2021 19:13:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 03/21] drm/i915/gem: Set the watchdog timeout
 directly in intel_context_set_gem
Message-ID: <YIrpKQPXSCUUaDiI@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-4-jason@jlekstrand.net>
 <417fe44a-61f9-c90a-c255-309db5bb48ab@linux.intel.com>
 <CAOFGe96jXtyx2-hiYBmZPFqSx1G32Ph7SGguJQ=ZD4im=ZPJ5A@mail.gmail.com>
 <19ee110c-f251-20b1-5ca8-d280b724ccbf@linux.intel.com>
 <CAOFGe95D81vvT1AQPF_sbqWQMZAJeZmr92xgd2m=GZY4TxGYUw@mail.gmail.com>
 <YIro5QLQQcf0CI4v@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIro5QLQQcf0CI4v@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 07:12:05PM +0200, Daniel Vetter wrote:
> On Thu, Apr 29, 2021 at 09:54:15AM -0500, Jason Ekstrand wrote:
> > On Thu, Apr 29, 2021 at 3:04 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> > >
> > >
> > > On 28/04/2021 18:24, Jason Ekstrand wrote:
> > > > On Wed, Apr 28, 2021 at 10:55 AM Tvrtko Ursulin
> > > > <tvrtko.ursulin@linux.intel.com> wrote:
> > > >> On 23/04/2021 23:31, Jason Ekstrand wrote:
> > > >>> Instead of handling it like a context param, unconditionally set it when
> > > >>> intel_contexts are created.  This doesn't fix anything but does simplify
> > > >>> the code a bit.
> > > >>>
> > > >>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > >>> ---
> > > >>>    drivers/gpu/drm/i915/gem/i915_gem_context.c   | 43 +++----------------
> > > >>>    .../gpu/drm/i915/gem/i915_gem_context_types.h |  4 --
> > > >>>    drivers/gpu/drm/i915/gt/intel_context_param.h |  3 +-
> > > >>>    3 files changed, 6 insertions(+), 44 deletions(-)
> > > >>>
> > > >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > >>> index 35bcdeddfbf3f..1091cc04a242a 100644
> > > >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > >>> @@ -233,7 +233,11 @@ static void intel_context_set_gem(struct intel_context *ce,
> > > >>>            intel_engine_has_timeslices(ce->engine))
> > > >>>                __set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
> > > >>>
> > > >>> -     intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
> > > >>> +     if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
> > > >>> +         ctx->i915->params.request_timeout_ms) {
> > > >>> +             unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
> > > >>> +             intel_context_set_watchdog_us(ce, (u64)timeout_ms * 1000);
> > > >>
> > > >> Blank line between declarations and code please, or just lose the local.
> > > >>
> > > >> Otherwise looks okay. Slight change that same GEM context can now have a
> > > >> mix of different request expirations isn't interesting I think. At least
> > > >> the change goes away by the end of the series.
> > > >
> > > > In order for that to happen, I think you'd have to have a race between
> > > > CREATE_CONTEXT and someone smashing the request_timeout_ms param via
> > > > sysfs.  Or am I missing something?  Given that timeouts are really
> > > > per-engine anyway, I don't think we need to care too much about that.
> > >
> > > We don't care, no.
> > >
> > > For completeness only - by the end of the series it is what you say. But
> > > at _this_ point in the series though it is if modparam changes at any
> > > point between context create and replacing engines. Which is a change
> > > compared to before this patch, since modparam was cached in the GEM
> > > context so far. So one GEM context was a single request_timeout_ms.
> > 
> > I've added the following to the commit message:
> > 
> > It also means that sync files exported from different engines on a
> > SINGLE_TIMELINE context will have different fence contexts.  This is
> > visible to userspace if it looks at the obj_name field of
> > sync_fence_info.
> > 
> > How's that sound?
> 
> If you add "Which media-driver as the sole user of this doesn't do" then I
> think it's perfect.

Uh I think you replied to the wrong thread :-)

This here is about watchdog, not timeline.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
