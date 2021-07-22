Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B73D2CE4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F1B6E3AA;
	Thu, 22 Jul 2021 19:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D376E2B4;
 Thu, 22 Jul 2021 19:39:17 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id j2so3961585vsi.6;
 Thu, 22 Jul 2021 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7DaVr1b+362zLHRUtuZLZIEuCblGBWwhIVXIOpe6r18=;
 b=E9UJpR1xCvFg+26nePCbhu6whpQ1S2faC1XeQjKjs2M4cQuCD/CfuhVabZeCMig8Ic
 7lJ1+i3oiebnYl73I6pOPo9dFsbHvegCw+YLJJI3eRgR7bT8cT7sc63ZGbb6t/f7yGGY
 PZhmGUFVL4aVgVku8JaRxteb2It6hQfqIqMgcFiPZ4vpsXFWtTrU91ZDtffUoOtQuQnu
 1pofr1Oehud3HfnGwGWiaKguFZFXEvheKlMIph87Qy4yaLa/OcxsZLIS7/VS2EVEGrEa
 AccCpgh/iRiVzlwfWdbNAf5Kcu8q/APnC1CHiLo1FiNqgAUKWK7T3uhYoTQtdVkvWNTk
 Tukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7DaVr1b+362zLHRUtuZLZIEuCblGBWwhIVXIOpe6r18=;
 b=jeQfIBfkB5m9fWQ+EPS48VdJ4ybTO4/VRth96AHh2PKOmq2usWfkYO/UhSsOW9wlbp
 kRXOjsLcDwK9brOw7VNTKdfrne0yB53nyiETSA/JFxmc4XMul3uStzucOJfYvpInr0cu
 cAre5NjEpG4B4krbbo3lHAJVo4EYsQ2bQW4ea2CdSmlIHPoOJvtZUztNu8v+/y8RNfYw
 FLjyx82vWYu2OsZgNvqTQR3Jir9cdYvW5vVFunLmOOHMinWGphfHZeySezVHDe97o7SH
 PNXZGCFh4YAfIHCz3A5SfiQPL5JivfgIQ8x0XstOKW+8tSyyihVMGr8LNu1vEoEmpl+s
 /mXw==
X-Gm-Message-State: AOAM533bTiQ3OtGE4eZsEllIpOsHyqafkUF+mS2DUVWQwIrKSpu60UJK
 5mzouVkSp8vJs5ihAUu/q14CdXRDl8ZYuuqDqFk=
X-Google-Smtp-Source: ABdhPJw/yqiQRbpZShbSgJJ85ur28nDK8fzSieBMoS3NJdzzjfJU48Ac+fZV56n+164BXuIYpx6m3n8dXqqdcQMGm+g=
X-Received: by 2002:a67:fdc2:: with SMTP id l2mr1969758vsq.7.1626982756301;
 Thu, 22 Jul 2021 12:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210714175138.319514-1-jim.cromie@gmail.com>
 <20210714175138.319514-4-jim.cromie@gmail.com>
 <YPbPvm/xcBlTK1wq@phenom.ffwll.local>
In-Reply-To: <YPbPvm/xcBlTK1wq@phenom.ffwll.local>
From: jim.cromie@gmail.com
Date: Thu, 22 Jul 2021 15:38:50 -0400
Message-ID: <CAJfuBxxFL7bsuyFy6M4LK1QgvR0+0yt_DJQNjY=xMi36FU8jMA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/print: RFC add choice to use dynamic debug in
 drm-debug
To: Jim Cromie <jim.cromie@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jason Baron <jbaron@akamai.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the feedback!


On Tue, Jul 20, 2021 at 9:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jul 14, 2021 at 11:51:36AM -0600, Jim Cromie wrote:
> > drm's debug system uses distinct categories of debug messages, encoded
> > in an enum (DRM_UT_<CATEGORY>), which are mapped to bits in drm.debug.
> > drm_debug_enabled() does a lot of unlikely bit-mask checks on
> > drm.debug; we can use dynamic debug instead, and get all that
> > static_key/jump_label goodness.
> >
> > Dynamic debug has no concept of category, but we can map the DRM_UT_*
> > to a set of distinct prefixes; "drm:core:", "drm:kms:" etc, and
> > prepend them to the given formats.
> >
> > Then we can use:
> >   `echo module drm format ^drm:core: +p > control`
> >
> > to enable every such "prefixed" pr_debug with one query.  This new
> > prefix changes pr_debug's output, so is user visible, but it seems
> > unlikely to cause trouble for log watchers; they're not relying on the
> > absence of class prefix strings.
> >
> > This conversion yields ~2100 new callsites on my i7/i915 laptop:
> >
> >   dyndbg: 195 debug prints in module drm_kms_helper
> >   dyndbg: 298 debug prints in module drm
> >   dyndbg: 1630 debug prints in module i915
> >
> > CONFIG_DRM_USE_DYNAMIC_DEBUG enables this, and is available if
> > CONFIG_DYNAMIC_DEBUG or CONFIG_DYNAMIC_DEBUG_CORE is chosen, and if
> > CONFIG_JUMP_LABEL is enabled; this because its required to get the
> > promised optimizations.
> >
> > The indirection/switchover is layered into the macro scheme:
> >
> > 0. A new callback on drm.debug which calls dynamic_debug_exec_queries
> >    to map those bits to specific query/commands
> >    dynamic_debug_exec_queries("format ^drm:kms: +p", "drm*");
> >    here for POC, this should be in dynamic_debug.c
> >    with a MODULE_PARAM_DEBUG_BITMAP(__drm_debug, { "prefix-1", "desc-1" }+)
>
> This is really awesome. For merging I think we need to discuss with dyn
> debug folks whether they're all ok with this, but it's exported already
> should should be fine.
>

Yay.  FWIW, Im to blame for that export, with this use case in mind.
That said, I dont know if that macro can be written as I described,
but if not, then { BIT(0), "prefix-0", "description-0" }, { BIT(1)
.... } should work.
If its been done elsewhere, Id copy it, or imitate it.





> >
> > 1. A "converted" or "classy" DRM_UT_* map
> >
> >    based on:   DRM_UT_* ( symbol => bit-mask )
> >    named it:  cDRM_UT_* ( symbol => format-class-prefix-string )
> >
> >    So cDRM_UT_* is either:
> >    legacy: cDRM_UT_* <-- DRM_UT_*   ( !CONFIG_DRM_USE_DYNAMIC_DEBUG )
> >    enabled:
> >     #define cDRM_UT_KMS    "drm:kms: "
> >     #define cDRM_UT_PRIME  "drm:prime: "
> >     #define cDRM_UT_ATOMIC "drm:atomic: "
>
> the cDRM looks a bit funny, plus I don't eve have an idea what _UT_ means
> (and git history isn't helpful either). What about just using
> DRM_DBG_CLASS_ as the prefix here for these indirection macros, i.e.
> DRM_DBG_CLASS_KMS.
>

yes.


> Also would be really nice if we could make these a table or something, but
> I guess with the macro magic that's not possible.
>

not obvious to me, I'll watch for an opportunity.

> >
> >    DRM_UT_* are unchanged, since theyre used in drm_debug_enabled()
> >    and elsewhere.
>
> I think for the production version of these we need to retire/deprecate
> them, at least for drm core. Otherwise you have an annoying mismatch
> between drm.debug module option and dyn debug.
>

I will look at renaming it :  __drm_debug_enabled
and making a macro for the old name.
so enabled, it would end up like
if (unlikely(1) && ... )

drivers/gpu/drm/drm_atomic_uapi.c
1457: if (drm_debug_enabled(DRM_UT_STATE))

drivers/gpu/drm/drm_dp_mst_topology.c
1358: if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
2875: if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
2919: if (drm_debug_enabled(DRM_UT_DP)) {


> >
> > 2. drm_dev_dbg & drm_debug are renamed (prefixed with '_')
> >
> >    old names are now macros, calling either:
> >      legacy:  -> to renamed fn
> >      enabled: -> dev_dbg & pr_debug, with cDRM-prefix # format.
> >
> >    these names are used in a fat layer of macros (3) which supply the
> >    category; those macros are used throughout drm code, yielding the
> >    ~2100 new prdbgs reported above.
> >
> > 3. names in (2) are invoked by DRM_DEBUG_<Category>, drm_dbg_<Category>.
> >
> >    all these macros get "converted" to use cDRM_UT_*
> >    to get right token type for both !/!! DRM_USE_DYNAMIC_DEBUG
> >
> > 4. simplification of __DRM_DEFINE_DBG_RATELIMITED macro
> >
> >    remove DRM_UT_ ## KMS as extra indirection
> >    pass both DRM_UT & cDRM_UT, for drm_debug_enabled & drm_dev_dbg
>
> For merging, can we pull out the renames and reorgs from this patch, and
> then maybe also the reorder the next patch in your series here to be
> before the dyn debug stuff?
>

I will drop the 4. RATELIMITED tweaks.
FWIW, I have semi-working code to implement rate limiting
in dynamic debug, controlled by `+r > control`
which would touch this anyway.

wrt reordering 4/5, can you clarify ?
the i915 changes are 1/2 POC, so I'll assume you mean after getting 0.
into dyndbg

> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  drivers/gpu/drm/Kconfig     |  13 +++++
> >  drivers/gpu/drm/drm_print.c |  75 ++++++++++++++++++++++++--
> >  include/drm/drm_print.h     | 102 ++++++++++++++++++++++++++----------
> >  3 files changed, 158 insertions(+), 32 deletions(-)
>
> I really like this, I think you can drop the RFC. A few more things that I
> think we need:
>
> - An overview kerneldoc section which explains the interfaces and how it
>   all works together. Essentially your commit message with some light
>   markup to make it look good.

into include/drm/drm_print.h ?

>
> - I think it would be really good to review the driver docs for all this
>   and make sure it's complete. Some of the interface functions aren't
>   documented yet (or maybe the ones that drivers shouldn't used need more
>   __ prefixes to denote them as internal, dunno).
>

I will look, but I dont have the experience here to make these
qualitative judgements

Also, I renamed drm_dev_dbg to _drm_dev_dbg, with a single underscore.
I'm now thinking this is reserved, and __ prefix is better (legal)
This isnt quite the same is lower-level implementation detail,
since it adds a CONFIG dependent alternative impl.
But I'll do this unless you have a better name

> - I guess deprecation notice for drm_debug_enabled() and all that, so that
>   we have a consistent interface. Doing the conversion will probably
>   highlight the need for a bit more infrastructure and tooling, e.g. the
>   bigger dump functions (like edid hex dump, or also the various decode
>   helpers we have for dp, hdmi infoframes and all that) ideally have a
>   single dyn_debug label to enable all of them instead of line-by-line.
>   Tbh no idea how this should work, might need dyndbg work too.
>

macrofying drm_debug_enabled()  might work for this set.
possibly with different prefixes,  forex: "drmx:*"  or "drm:misc:"

> - For the driver side of this we probably want a
>   Documentation/gpu/TODO.rst entry if it's not all easy to convert
>   directly.

so there are 32 uses of drm_debug_enabled(DRM_UT_*)
and just 1 used in drm_dev_dbg    (with category as arg)
I'll try to macrofy it, see if it will handle the 32 cases.

>
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 7ff89690a976..e4524ccba040 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -57,6 +57,19 @@ config DRM_DEBUG_MM
> >
> >         If in doubt, say "N".
> >
> > +config DRM_USE_DYNAMIC_DEBUG
> > +     bool "use dynamic debug to implement drm.debug"
> > +     default n
> > +     depends on DRM
> > +     depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> > +     depends on JUMP_LABEL
> > +     help
> > +       The drm debug category facility does a lot of unlikely bit-field
> > +       tests at runtime; while cheap individually, the cost accumulates.
> > +       This option uses dynamic debug facility (if configured and
> > +       using jump_label) to avoid those runtime checks, patching
> > +       the kernel when those debugs are desired.
>
> Can't we just make this an internal option that's enabled automatically
> when dyndbg is around? Plus a comment somewhere that we really recommend
> enabling dyndbg for drm. Or would this mean that in certain dyndbg
> configurations we'd loose all the debug lines, which would suck?
>

We could indeed, I took the cautious approach.
keeping the CONFIG simplifies comparing DRM_USE_DD=y/n builds,
and changing default later is easy, and probably should have some numbers
about instructions saved and obj size increase.


> Anyway there's a pile of details, but the big picture I really like.
> Especially that we can make dyndbg seamlessly support drm.debug is really
> nice.
>
> Cheers, Daniel
>

thanks, Jim
