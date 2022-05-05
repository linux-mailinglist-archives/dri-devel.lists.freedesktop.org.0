Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B051BFB7
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 14:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A9D10E2E4;
	Thu,  5 May 2022 12:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7A810E2E4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 12:46:05 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id g6so8520230ejw.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 05:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3T4SzsAtNhNuo5rY56MV7HRELTHKhvquVI7Gt9UPCoQ=;
 b=AHRBdmaDrmzzh0gfsvRGfrpNJDd6xe+7uvXakuHWw6NO8XLUpVwk6Y7Dvn8JcOpCK8
 +2YP8rD9o+ceDtYzsLGvU52XC/uyZ9CzT0TJiK/IyFAgEqvuTQhqjNjdfv+iA7NNKdhH
 2rbB5Iq3vpcsURkFBj5sSTKu0xxOeZRTxdEpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3T4SzsAtNhNuo5rY56MV7HRELTHKhvquVI7Gt9UPCoQ=;
 b=0V26r1BAgfrqV17JqMl25P1PyppraLMkdCS7tPeZL5G/Gp6YCQ4kZERSHUOasX0qNd
 pOZcSyFSVI5He5RZSYwpBoZDl3GeyaY/ceOUqM6lg6DBHio76UsQebHsGp6mm9vv+d4J
 yCmcZMjmp283bB8oXv+ZvQztjokmteWIkoec6jrgCdLOqOlWUM5LANaEq+O7wahTmK+U
 gHeHNaVSKffOX8B54Qba7BW8UAqJC0t51DocwlsR+ob5k22p2wqJNSMD4eVdk/l/r0WN
 T4WUp4zx+JheIh0DQXLaa305BFxwdrDTjEDBCYg9gW5wqgYIckJzWu4djNqfRGu62rGx
 qdKA==
X-Gm-Message-State: AOAM530DG6gZ+12xHsEulM5eD4bMYLOFhVOpTLp1vNFUrnqakboXZyGx
 lcQhbybGz15ZvnEQA9EidmzS7A==
X-Google-Smtp-Source: ABdhPJyCXQf/76OE9sbpvWUSz3CBXOa/E2zFUs7VJ1SuA7HPeAvwE0peVrbLUTPawmxDZNK4o995KQ==
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr25569671ejc.572.1651754763690; 
 Thu, 05 May 2022 05:46:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s30-20020a508d1e000000b0042617ba63b0sm793271eds.58.2022.05.05.05.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 05:46:03 -0700 (PDT)
Date: Thu, 5 May 2022 14:46:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/i915: Change semantics of context isolation
 reporting to UM
Message-ID: <YnPHCcMwEeU5vsTu@phenom.ffwll.local>
References: <20220429151112.1041959-1-adrian.larumbe@collabora.com>
 <CAKMK7uHMh_BneHXvXxUsFaE1h3FWAEFungKrPAJORzk5Y3LOSw@mail.gmail.com>
 <YnKUzxHJ9oPQ6eLQ@mdroper-desk1.amr.corp.intel.com>
 <YnKs/cWGz7kZHWBA@phenom.ffwll.local>
 <YnLCCp6eehxVM09a@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnLCCp6eehxVM09a@mdroper-desk1.amr.corp.intel.com>
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
Cc: bob.beckett@collabora.com, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, Adrian Larumbe <adrian.larumbe@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 11:12:26AM -0700, Matt Roper wrote:
> On Wed, May 04, 2022 at 06:42:37PM +0200, Daniel Vetter wrote:
> > On Wed, May 04, 2022 at 07:59:27AM -0700, Matt Roper wrote:
> > > On Wed, May 04, 2022 at 02:24:07PM +0200, Daniel Vetter wrote:
> > > > On Fri, 29 Apr 2022 at 17:11, Adrian Larumbe
> > > > <adrian.larumbe@collabora.com> wrote:
> > > > > I915_PARAM_HAS_CONTEXT_ISOLATION was already being used as a boolean by
> > > > > both Iris and Vulkan , and stood for the guarantee that, when creating a
> > > > > new context, all state set by it will not leak to any other context.
> > > > >
> > > > > However the actual return value was a bitmask where every bit stood for an
> > > > > initialised engine, and IGT test gem_ctx_isolation makes use of this mask
> > > > > for deciding on the actual context engine isolation status.
> > > > >
> > > > > However, we do not provide UAPI for IGT tests, so the value returned by the
> > > > > PARAM ioctl has to reflect Mesa usage as a boolean.
> > > > >
> > > > > This change only made sense after compute engine support was added to the
> > > > > driver in commit 944823c9463916dd53f3 ("drm/i915/xehp: Define compute class
> > > > > and engine") because no context isolation can be assumed on any device with
> > > > > both RCS annd CCS engines.
> > > > >
> > > > > Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
> > > > 
> > > > Top level post and adding Matt Roper and dri-devel.
> > > > 
> > > > This was meant as a simple cleanup after CCS enabling in upstream, but
> > > > that CCS enabling seems to have gone wrong.
> > > > 
> > > > What I thought we should be done for CCS enabling is the following:
> > > > - actually have some igt-side hardcoded assumption about how much
> > > > engines are isolated from each another, which is a hw property. I
> > > > think some of that landed, but it's very incomplete
> > > > 
> > > > - convert all igt tests over to that. At least gem_ctx_isolation.c is
> > > > not converted over, as Adrian pointed out.
> > > 
> > > I pointed that out last week in one of our offline syncs and that's what
> > > got the ball rolling on that test again.  But you specifically told us
> > > that the uapi cleanup for context isolation shouldn't block the CCS
> > > patches from landing since that was still happening in parallel:
> > > 
> > >     "...I do see the uapi cleanup as part of this multi engine/CCS
> > >     enabling, but it's not a blocker to land the patches..."
> > > 
> > > Did we misunderstand what you were trying to say in that email or was
> > > there a change of direction here?
> > 
> > The cleanup (which Adrian is now working on, but there's confusion) is
> > totally fine to do later. What looks really iffy is the test coverage, and
> > at least from me looking around gem_ctx_isolation wasn't touched or
> > updated for CCS engines, and that looks like it's not enough. Either those
> > tests are bogus or not actually testing a lot, and then we should delete
> > them. Or there's probably going to be some impact on how much exactly the
> > engines/contexts are isolated against each another.
> 
> The test automatically picks up any new engines that show up and
> includes them in execution.  The test is already running properly on DG2
> CCS engines in CI right now.  E.g.,
> 
>     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11599/re-dg2-12/igt@gem_ctx_isolation@dirty-create@ccs0.html
> 
> Is the concern just that we haven't added extra registers to the list to
> check on the CCS engines?  For that matter, we're missing a bunch of
> registers for RCS, BCS, VCS, and VECS for newer platforms too; the CCS
> isn't really special there.

Hm I guess I'm just confused and this isn't actually the testcase that was
discussed at length.

I think I was mixing up gem_ctx_isolation with gem_ctx_persistence. The
latter also neeed adjustments for CCS enabling, and that patch seems to
have landed. Except it's not done with a shared helper, so now it's still
as hard as ever to find these tests that validate cross-engine
interactions.

> My understanding is that most of what gem_ctx_isolation tests is that
> context switches really do save/restore registers properly (i.e., the
> hardware behavior is sane) and there's really nothing special about CCS
> engines regarding general context switching behavior.  Where things get
> unusual with CCS engines is the shared reset domain, and that's more the
> realm of what tests like i915_hangman cover.  But even there, the
> workarounds that are in place right now (which only allow parallelism
> between engines if they belong to the same VM) means that in most cases
> there actually isn't any userspace-visible impact of the shared resets.
> 
> Adding JohnH and Umesh since they're a lot more familiar with all of
> this stuff than I.
> 
> I can send a revert if you think that's what we need, but from what I'm
> hearing we don't really expect many areas where there's
> userspace-visible behavior from CCS engines that would need non-standard
> IGT handling, and the few places where there are have already been
> updated.  But there are so many orphaned IGT tests out there, many of
> which have bitrotted away over the years, that it's possible we might
> still be missing something.

Nah I think it's ok. I guess I was just hoping that someone would review
the entire area a bit and help to structure things more, instead of
piling a bunch of local additions into various tests without much
coordination and calling it a day. It would have been a great opportunity
to clarify what exactly we guarantee wrt context/engine/reset isolation.

I'm not sure where that leaves the patch from Adrian, since tasking Adrian
with reviewing the entirety of igt test coverage around ctx and engines is
probably not what he signed up for and also doesn't make much sense, since
he didn't handle any of the CCS enabling.

I guess we'll just leave the igt testcase dungeons as is and hope they
don't end up eating us?

Dunno, Daniel


> 
> 
> Matt
> 
> > 
> > That's the part that I think should be done before we call CCS support
> > done and ready for merging. And if that's done properly it should also
> > take care of the "igt uses HAS_CONTEXT_ISOLATION getparam" issue, since
> > you need something more fancy anyway.
> > -Daniel
> > 
> > 
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > - once igt stopped using this context isolation getparam (we do not,
> > > > ever, create uapi just for testcases), fix up the uapi to what iris
> > > > actually needs, which is _only_ a boolean which indicates whether the
> > > > kernel's context setup code leaks register state from existing
> > > > contexts to newly created ones. Which is the bug iris works around
> > > > here, where using iris caused gpu hangs in libva. Iow, the kernel
> > > > should always and unconditionally return true here. Check out iris
> > > > history for details please, actual iris usage has nothing to do with
> > > > any other cross-context or cross-engine isolation guarantee we're
> > > > making, it's purely about whether our hw ctx code is buggy or not and
> > > > leaks state between clients, because we accidentally used the
> > > > currently running ctx as template instead of a fixed one created once
> > > > at driver load.
> > > > 
> > > > Matt, since the CCS enabling on the igt validation side looks very
> > > > incomplete I'm leaning very much towards "pls revert, try again".
> > > > 
> > > > Cheers, Daniel
> > > > 
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gt/intel_engine_user.c | 13 ++++++++++++-
> > > > >  drivers/gpu/drm/i915/gt/intel_engine_user.h |  1 +
> > > > >  drivers/gpu/drm/i915/i915_drm_client.h      |  2 +-
> > > > >  drivers/gpu/drm/i915/i915_getparam.c        |  2 +-
> > > > >  include/uapi/drm/i915_drm.h                 | 14 +++-----------
> > > > >  5 files changed, 18 insertions(+), 14 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > > index 0f6cd96b459f..2d6bd36d6150 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > > @@ -47,7 +47,7 @@ static const u8 uabi_classes[] = {
> > > > >         [COPY_ENGINE_CLASS] = I915_ENGINE_CLASS_COPY,
> > > > >         [VIDEO_DECODE_CLASS] = I915_ENGINE_CLASS_VIDEO,
> > > > >         [VIDEO_ENHANCEMENT_CLASS] = I915_ENGINE_CLASS_VIDEO_ENHANCE,
> > > > > -       /* TODO: Add COMPUTE_CLASS mapping once ABI is available */
> > > > > +       [COMPUTE_CLASS] = I915_ENGINE_CLASS_COMPUTE,
> > > > >  };
> > > > >
> > > > >  static int engine_cmp(void *priv, const struct list_head *A,
> > > > > @@ -306,3 +306,14 @@ unsigned int intel_engines_has_context_isolation(struct drm_i915_private *i915)
> > > > >
> > > > >         return which;
> > > > >  }
> > > > > +
> > > > > +bool intel_cross_engine_isolated(struct drm_i915_private *i915)
> > > > > +{
> > > > > +       unsigned int which = intel_engines_has_context_isolation(i915);
> > > > > +
> > > > > +       if ((which & BIT(I915_ENGINE_CLASS_RENDER)) &&
> > > > > +           (which & BIT(I915_ENGINE_CLASS_COMPUTE)))
> > > > > +               return false;
> > > > > +
> > > > > +       return !!which;
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.h b/drivers/gpu/drm/i915/gt/intel_engine_user.h
> > > > > index 3dc7e8ab9fbc..ff21349db4d4 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.h
> > > > > @@ -15,6 +15,7 @@ struct intel_engine_cs *
> > > > >  intel_engine_lookup_user(struct drm_i915_private *i915, u8 class, u8 instance);
> > > > >
> > > > >  unsigned int intel_engines_has_context_isolation(struct drm_i915_private *i915);
> > > > > +bool intel_cross_engine_isolated(struct drm_i915_private *i915);
> > > > >
> > > > >  void intel_engine_add_user(struct intel_engine_cs *engine);
> > > > >  void intel_engines_driver_register(struct drm_i915_private *i915);
> > > > > diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> > > > > index 5f5b02b01ba0..f796c5e8e060 100644
> > > > > --- a/drivers/gpu/drm/i915/i915_drm_client.h
> > > > > +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> > > > > @@ -13,7 +13,7 @@
> > > > >
> > > > >  #include "gt/intel_engine_types.h"
> > > > >
> > > > > -#define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_VIDEO_ENHANCE
> > > > > +#define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
> > > > >
> > > > >  struct drm_i915_private;
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> > > > > index c12a0adefda5..3d5120d2d78a 100644
> > > > > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > > > > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > > > > @@ -145,7 +145,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
> > > > >                 value = 1;
> > > > >                 break;
> > > > >         case I915_PARAM_HAS_CONTEXT_ISOLATION:
> > > > > -               value = intel_engines_has_context_isolation(i915);
> > > > > +               value = intel_cross_engine_isolated(i915);
> > > > >                 break;
> > > > >         case I915_PARAM_SLICE_MASK:
> > > > >                 value = sseu->slice_mask;
> > > > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > > > index 35ca528803fd..84c0af77cc1f 100644
> > > > > --- a/include/uapi/drm/i915_drm.h
> > > > > +++ b/include/uapi/drm/i915_drm.h
> > > > > @@ -166,6 +166,7 @@ enum drm_i915_gem_engine_class {
> > > > >         I915_ENGINE_CLASS_COPY          = 1,
> > > > >         I915_ENGINE_CLASS_VIDEO         = 2,
> > > > >         I915_ENGINE_CLASS_VIDEO_ENHANCE = 3,
> > > > > +       I915_ENGINE_CLASS_COMPUTE       = 4,
> > > > >
> > > > >         /* should be kept compact */
> > > > >
> > > > > @@ -635,17 +636,8 @@ typedef struct drm_i915_irq_wait {
> > > > >  #define I915_PARAM_HAS_EXEC_FENCE_ARRAY  49
> > > > >
> > > > >  /*
> > > > > - * Query whether every context (both per-file default and user created) is
> > > > > - * isolated (insofar as HW supports). If this parameter is not true, then
> > > > > - * freshly created contexts may inherit values from an existing context,
> > > > > - * rather than default HW values. If true, it also ensures (insofar as HW
> > > > > - * supports) that all state set by this context will not leak to any other
> > > > > - * context.
> > > > > - *
> > > > > - * As not every engine across every gen support contexts, the returned
> > > > > - * value reports the support of context isolation for individual engines by
> > > > > - * returning a bitmask of each engine class set to true if that class supports
> > > > > - * isolation.
> > > > > + * Query whether the device can make cross-engine isolation guarantees for
> > > > > + * all the engines whose default state has been initialised.
> > > > >   */
> > > > >  #define I915_PARAM_HAS_CONTEXT_ISOLATION 50
> > > > >
> > > > > --
> > > > > 2.35.1
> > > > >
> > > > 
> > > > 
> > > > -- 
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > VTT-OSGC Platform Enablement
> > > Intel Corporation
> > > (916) 356-2795
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
> (916) 356-2795

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
