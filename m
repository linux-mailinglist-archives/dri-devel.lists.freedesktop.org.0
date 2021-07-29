Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EA73DA326
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 14:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF9E6ED99;
	Thu, 29 Jul 2021 12:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F176E115
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 12:29:05 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id o185so8149713oih.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+98nEpBE+gADykXKMkirC+bM7IejUnREzhLqEYmoSLA=;
 b=KaDoNmdouJhpQ44R36Q2Y/Sam+oI3j/Qs+XjYdGYmi88yzqp4/MSrzwAQDY1y+sf46
 X+60xCdTQmqZLRZ0mSb9QigahN5X7pyTlWCYRnZK1QCi4AsLKa3h1GdYUInhGp0FX/0Z
 cjfsF7m/SY762zQOxD+emsTCOq+8her9VqLoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+98nEpBE+gADykXKMkirC+bM7IejUnREzhLqEYmoSLA=;
 b=GOrjKWEQnc4oSKexPP9c76jnkT6dHrwxJbVOlbvpc/ql/H3+NIi3PWxRVXT/UiFbXb
 UaxL3Ql0xGLNA243yVfkw2XUvGnv6yIE92Xstd+RCqZOin8PwzwSt+qNfC1QS5jrOjZ0
 HS1iRHyIkXGZ/Tz9z7M1ydPjd3ZoGKoS+XZghoV/AXvuYtM3VYBW53STP9NpG+oG6ScK
 LCsaggIu4IA7oMj/3KCqCanNGjxCJNypao6tfeKLo1gRNctOgWChk+5+pIk9K9TPDKMR
 E3ok1BpeVhfxFrddZuN+9QPzFHTK+N0lm5ZKLa/wOA3M6Jxn3bjSOqXTcTLlpdiZrdVa
 lAMw==
X-Gm-Message-State: AOAM531cNC8bqL8sAa+Wq0AXr2VP/d6E18wzifbA6PtqzRG8UbJ9L0EE
 ogWbUROVbCTVLIyKjJn5oElBJWRzCBUoiibYyf5xRE+6zZ0=
X-Google-Smtp-Source: ABdhPJw7EFqf+JfplWa6rgw56VktkKVFibeN7uc80v+zJsVwApLxtEoPqdD3YnbMsWOVoNQkniPJfIOz+lseVyTGPus=
X-Received: by 2002:aca:3085:: with SMTP id w127mr9598908oiw.101.1627561744545; 
 Thu, 29 Jul 2021 05:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210729111848.729888-1-tvrtko.ursulin@linux.intel.com>
 <20210729111848.729888-2-tvrtko.ursulin@linux.intel.com>
 <CAKMK7uGe-S+rtHGDQm0hRfc=0F99RZdCsz0aBBptPxkcpjUXgg@mail.gmail.com>
 <fea78982-71a8-509c-1453-a6ceaad872dc@linux.intel.com>
In-Reply-To: <fea78982-71a8-509c-1453-a6ceaad872dc@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 29 Jul 2021 14:28:53 +0200
Message-ID: <CAKMK7uF-D_kgq5TFkxoV5p4pbKEgdkX=fY7cf0BhSaOVk+8ZYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915: Use Transparent Hugepages when IOMMU is
 enabled
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 intel-gfx <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 2:21 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> On 29/07/2021 13:07, Daniel Vetter wrote:
> > On Thu, Jul 29, 2021 at 1:19 PM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> Usage of Transparent Hugepages was disabled in 9987da4b5dcf
> >> ("drm/i915: Disable THP until we have a GPU read BW W/A"), but since it
> >> appears majority of performance regressions reported with an enabled IOMMU
> >> can be almost eliminated by turning them on, lets do that by adding a
> >> couple of Kconfig options.
> >>
> >> To err on the side of safety we keep the current default in cases where
> >> IOMMU is not active, and only when it is default to the "huge=within_size"
> >> mode. Although there probably would be wins to enable them throughout,
> >> more extensive testing across benchmarks and platforms would need to be
> >> done.
> >>
> >> With the patch and IOMMU enabled my local testing on a small Skylake part
> >> shows OglVSTangent regression being reduced from ~14% to ~2%.
> >
> > I guess the 14% regression is iommu disabled vs iommu enabled? Would
> > be good to clarify that.
>
> Should be clear from the first paragraph above - "...majority of
> performance regressions reported with an _enabled_ IOMMU can be almost
> eliminated...".

Yeah I inferred, but might be good to hammer that in by repeating, like

"reduced from 14% (for IOMMU on vs off case) to 2% (IOMMU on with THP
enabled vs IOMMU off with THP disabled)"

> >> v2:
> >>   * Add Kconfig dependency to transparent hugepages and some help text.
> >
> > Uh I'm really not a huge fan of Kconfig for everything, especially for
> > tuning stuff. Maybe if there's a need a module param for debugging,
> > but otherwise can't we just pick the right default?
>
> Kconfig is picking the right default so I do not see a problem by
> allowing override from a deep enough menu. But I also do not feel so
> strongly about bikeshedding this to no kconfig, or a module param, or
> whatever - there are votes for all three options already, as usual. Main
> problem I have is actually..

Yeah that's pretty much what Kconfig is abused for: Everyone brings
their bikeshed because they're not quite happy, and it gets "resolved"
by Kconfigs to give everyone what they want. It just leads to
combinatorial explosion that no on tests. Hence unless we have a
demonstrated benefit of the choices there's going to be one default,
and you get to decide (which you did).

> > And it very much sounds like the right default here is "enable it
> > unconditionally if we have iommu support".
>
> .. about this - who knows? I will remind you of a certain VLK-20150
> which I thought was very important for going forward but was falling on
> deaf ears for years. As such I am waiting for Eero to come back and
> improvise some unofficial testing. It's extra bewildering to me given
> how we had the facility and then shut it down just like that.

Oh sure the general performance tuning is terrible, and also the
specific case of when THP. But we're looking the very specific case of
"IOMMU is enabled and it sucks away perf", and it looks like enabling
THP is the answer. So let's just do that.

Ofc we don't have full perf data, but we never have that even with a
nice perf lab (there's always more to benchmark than there's machine
time), so just doing as good as we can is imo perfectly fine enough.
You've put in the work (at least a bit), you get to pick the default
until we find something new.
-Daniel


>
> Regards,
>
> Tvrtko
>
> > -Daniel
> >
> >>   * Move to helper for easier handling of kernel build options.
> >>
> >> References: b901bb89324a ("drm/i915/gemfs: enable THP")
> >> References: 9987da4b5dcf ("drm/i915: Disable THP until we have a GPU read BW W/A")
> >> References: https://gitlab.freedesktop.org/drm/intel/-/issues/430
> >> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> >> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >> Cc: Matthew Auld <matthew.auld@intel.com>
> >> Cc: Eero Tamminen <eero.t.tamminen@intel.com>
> >> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
> >> ---
> >>   drivers/gpu/drm/i915/Kconfig.profile  | 73 +++++++++++++++++++++++++++
> >>   drivers/gpu/drm/i915/gem/i915_gemfs.c | 27 ++++++++--
> >>   2 files changed, 97 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
> >> index 39328567c200..d49ee794732f 100644
> >> --- a/drivers/gpu/drm/i915/Kconfig.profile
> >> +++ b/drivers/gpu/drm/i915/Kconfig.profile
> >> @@ -119,3 +119,76 @@ config DRM_I915_TIMESLICE_DURATION
> >>            /sys/class/drm/card?/engine/*/timeslice_duration_ms
> >>
> >>            May be 0 to disable timeslicing.
> >> +
> >> +choice
> >> +       prompt "Transparent Hugepage Support (native)"
> >> +       default DRM_I915_THP_NATIVE_NEVER
> >> +       depends on TRANSPARENT_HUGEPAGE
> >> +       help
> >> +         Select the preferred method for allocating from Transparent Hugepages
> >> +         when IOMMU is not enabled.
> >> +
> >> +       config DRM_I915_THP_NATIVE_NEVER
> >> +       bool "Never"
> >> +       help
> >> +         Disable using THP for system memory allocations, individually
> >> +         allocating each 4K chunk as a separate page. It is unlikely that such
> >> +         individual allocations will return contiguous memory.
> >> +
> >> +       config DRM_I915_THP_NATIVE_WITHIN
> >> +       bool "Within size"
> >> +       help
> >> +         Allocate whole 2M superpages while those chunks do not exceed the
> >> +         object size. The remainder of the object will be allocated from 4K
> >> +         pages. No overallocation.
> >> +
> >> +       config DRM_I915_THP_NATIVE_ALWAYS
> >> +       bool "Always"
> >> +       help
> >> +         Allocate the whole object using 2M superpages, even if the object does
> >> +         not require an exact number of superpages.
> >> +
> >> +endchoice
> >> +
> >> +config DRM_I915_THP_NATIVE
> >> +       string
> >> +       default "always" if DRM_I915_THP_NATIVE_ALWAYS
> >> +       default "within_size" if DRM_I915_THP_NATIVE_WITHIN
> >> +       default "never" if DRM_I915_THP_NATIVE_NEVER
> >> +
> >> +choice
> >> +       prompt "Transparent Hugepage Support (IOMMU)"
> >> +       default DRM_I915_THP_IOMMU_WITHIN if TRANSPARENT_HUGEPAGE=y
> >> +       default DRM_I915_THP_IOMMU_NEVER if TRANSPARENT_HUGEPAGE=n
> >> +       depends on TRANSPARENT_HUGEPAGE
> >> +       help
> >> +         Select the preferred method for allocating from Transparent Hugepages
> >> +         with IOMMU active.
> >> +
> >> +       config DRM_I915_THP_IOMMU_NEVER
> >> +       bool "Never"
> >> +       help
> >> +         Disable using THP for system memory allocations, individually
> >> +         allocating each 4K chunk as a separate page. It is unlikely that such
> >> +         individual allocations will return contiguous memory.
> >> +
> >> +       config DRM_I915_THP_IOMMU_WITHIN
> >> +       bool "Within size"
> >> +       help
> >> +         Allocate whole 2M superpages while those chunks do not exceed the
> >> +         object size. The remainder of the object will be allocated from 4K
> >> +         pages. No overallocation.
> >> +
> >> +       config DRM_I915_THP_IOMMU_ALWAYS
> >> +       bool "Always"
> >> +       help
> >> +         Allocate the whole object using 2M superpages, even if the object does
> >> +         not require an exact number of superpages.
> >> +
> >> +endchoice
> >> +
> >> +config DRM_I915_THP_IOMMU
> >> +       string
> >> +       default "always" if DRM_I915_THP_IOMMU_ALWAYS
> >> +       default "within_size" if DRM_I915_THP_IOMMU_WITHIN
> >> +       default "never" if DRM_I915_THP_IOMMU_NEVER
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> >> index 5e6e8c91ab38..871cbfb02fdf 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> >> @@ -11,6 +11,26 @@
> >>   #include "i915_drv.h"
> >>   #include "i915_gemfs.h"
> >>
> >> +#if defined(CONFIG_DRM_I915_THP_NATIVE) && defined(CONFIG_DRM_I915_THP_IOMMU)
> >> +static char *gemfd_mount_opts(struct drm_i915_private *i915)
> >> +{
> >> +       static char thp_native[] = "huge=" CONFIG_DRM_I915_THP_NATIVE;
> >> +       static char thp_iommu[] = "huge=" CONFIG_DRM_I915_THP_IOMMU;
> >> +       char *opts;
> >> +
> >> +       opts = intel_vtd_active() ? thp_iommu : thp_native;
> >> +       drm_info(&i915->drm, "Transparent Hugepage mode '%s'", opts);
> >> +
> >> +       return opts;
> >> +}
> >> +#else
> >> +static char *gemfd_mount_opts(struct drm_i915_private *i915)
> >> +{
> >> +       return NULL;
> >> +}
> >> +#endif
> >> +
> >> +
> >>   int i915_gemfs_init(struct drm_i915_private *i915)
> >>   {
> >>          struct file_system_type *type;
> >> @@ -26,10 +46,11 @@ int i915_gemfs_init(struct drm_i915_private *i915)
> >>           *
> >>           * One example, although it is probably better with a per-file
> >>           * control, is selecting huge page allocations ("huge=within_size").
> >> -        * Currently unused due to bandwidth issues (slow reads) on Broadwell+.
> >> +        * However, we only do so to offset the overhead of iommu lookups
> >> +        * due to bandwidth issues (slow reads) on Broadwell+.
> >>           */
> >> -
> >> -       gemfs = kern_mount(type);
> >> +       gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name,
> >> +                              gemfd_mount_opts(i915));
> >>          if (IS_ERR(gemfs))
> >>                  return PTR_ERR(gemfs);
> >>
> >> --
> >> 2.30.2
> >>
> >
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
