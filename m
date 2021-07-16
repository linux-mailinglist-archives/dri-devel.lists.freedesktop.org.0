Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA63CB857
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861CE6E98E;
	Fri, 16 Jul 2021 14:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CEE6E98F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:02:34 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id b13so15028399ybk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FZW+IovK761DmRpL6sqAlAhMexqAHHwi+olrjJsPr24=;
 b=pdbsUEczI/VSlqT3aSPF6pR3InFYMxzsnTHXIE3nwSo9N5W/QCi0XtfCA0Mg7WyQSO
 u2c2Qw7XJ/RGeTqoqaNhbZSVhAVlPGFnH6ZbyiGmipaXa3IqRUAY3D/JxvCL2cigk+1k
 nVLnEWtK0DGv8A9IFxsDP/GDi8OjnQtttpcEuJncgQDCOs1YfUYsQKhvf6GwU8OORAmx
 /ENIvsk0rWipEqCRjbm9ojmHedCBzFDYKRaeq1D/7lj71nxG+bwW9kw5Ge6riD2ZL6c9
 n37UBYbmvNfgzCHt6FU0u9Z4s1RWgWXJr6Z3ssJGC+SLVQ1cpoRwPEaKdc/9wOIHIbz/
 Wv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FZW+IovK761DmRpL6sqAlAhMexqAHHwi+olrjJsPr24=;
 b=LrCym5pcCqRVUelxRMTIuGDUr1CqiSVFZ7NlZDFuDiOHcSdWMXq0wIA++p8MAUPEnT
 8Id4SK7+rZMAdE8aGXVWUn0jdRv+oVMZQTFBrggo8uKuBRcUbfK16bzTNdTR70xP+gkq
 I9xl0wruiX8u9LtvLp6x4R6Mwh3k2HgmXI59ZU1qbuEb5r114i30W2yDfDLXrullCpVw
 rpytUVzZXdTIjFQ8B5ung6c6iSFPe4HKQL6ejv8U6ehUhNTBo5tA06ifgF9Kv8lliYi+
 W/hwNmVPzOErhHEpMC6+/07gbZRD4VjcR67aIdDjPT2hSp+FTICOVGw6xwXIptanL/EJ
 K6iA==
X-Gm-Message-State: AOAM533K3yjbtWO2PzvrswqZLVpNOfFvJE3F7C12FS1NkmmYW6DaTtG7
 IGqXFf9z7EpQ3Z29pGgTjxk8g2svTlwo355JNY26Xw==
X-Google-Smtp-Source: ABdhPJwFxPKbIUAe3hWuDFU4bEEBjrR1hegs29z4wPgNWB3Y9la7qjVsSO+w4b5ALDFEK4atwQhyZpuqYce2+8ocTqU=
X-Received: by 2002:a25:d113:: with SMTP id i19mr13534550ybg.180.1626444153203; 
 Fri, 16 Jul 2021 07:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-4-jason@jlekstrand.net>
 <CAM0jSHMU82eH15qC_dpYRkMm9dh+KRrCaJh6Y07nG+==6S4AQA@mail.gmail.com>
In-Reply-To: <CAM0jSHMU82eH15qC_dpYRkMm9dh+KRrCaJh6Y07nG+==6S4AQA@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 16 Jul 2021 09:02:22 -0500
Message-ID: <CAOFGe97h+XsCD4-tVGoZr7D6Nmi-VUmfrTMr41Wj3XfQBar7BA@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/i915/gem: Unify user object creation
To: Matthew Auld <matthew.william.auld@gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 6:21 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > Instead of hand-rolling the same three calls in each function, pull them
> > into an i915_gem_object_create_user helper.  Apart from re-ordering of
> > the placements array ENOMEM check, the only functional change here
> > should be that i915_gem_dumb_create now calls i915_gem_flush_free_objects
> > which it probably should have been calling all along.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_create.c | 106 +++++++++------------
> >  1 file changed, 43 insertions(+), 63 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > index 391c8c4a12172..69bf9ec777642 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > @@ -11,13 +11,14 @@
> >  #include "i915_trace.h"
> >  #include "i915_user_extensions.h"
> >
> > -static u32 object_max_page_size(struct drm_i915_gem_object *obj)
> > +static u32 object_max_page_size(struct intel_memory_region **placements,
> > +                               unsigned int n_placements)
> >  {
> >         u32 max_page_size = 0;
> >         int i;
> >
> > -       for (i = 0; i < obj->mm.n_placements; i++) {
> > -               struct intel_memory_region *mr = obj->mm.placements[i];
> > +       for (i = 0; i < n_placements; i++) {
> > +               struct intel_memory_region *mr = placements[i];
> >
> >                 GEM_BUG_ON(!is_power_of_2(mr->min_page_size));
> >                 max_page_size = max_t(u32, max_page_size, mr->min_page_size);
> > @@ -81,22 +82,35 @@ static int i915_gem_publish(struct drm_i915_gem_object *obj,
> >         return 0;
> >  }
> >
> > -static int
> > -i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
> > +static struct drm_i915_gem_object *
> > +i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
>
> create_user sounds nice.
>
> > +                           struct intel_memory_region **placements,
> > +                           unsigned int n_placements)
> >  {
> > -       struct intel_memory_region *mr = obj->mm.placements[0];
> > +       struct intel_memory_region *mr = placements[0];
> > +       struct drm_i915_gem_object *obj;
> >         unsigned int flags;
> >         int ret;
> >
> > -       size = round_up(size, object_max_page_size(obj));
> > +       i915_gem_flush_free_objects(i915);
>
> Needs to be a separate patch.

Done.

> > +
> > +       obj = i915_gem_object_alloc();
> > +       if (!obj)
> > +               return ERR_PTR(-ENOMEM);
>
> Should move this way down, so we don't accidently leak it.

Done.

--Jason
