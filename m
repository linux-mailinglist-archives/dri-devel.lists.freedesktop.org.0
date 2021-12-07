Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430A646B96B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 11:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59347B5DC;
	Tue,  7 Dec 2021 10:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC2C7B5D9;
 Tue,  7 Dec 2021 10:46:24 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id g9so12734872qvd.2;
 Tue, 07 Dec 2021 02:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3HTNTnLEO4Onxj3HJCKAfvonV0QBvdRaJFc8oMSdcWM=;
 b=XkbRvMGlsbNkI+5s+A1RGWK5D0fosISbujrkzdr6hVm2jtxqLCryPz/SlRrsQGtEhW
 ya/7+W7Jn88gMyUKLzqwM/9LqEJLsXE3wopq3JlARdT1PrSZrWnDdpqteVz90POrjZ9l
 k+5zNjrPFzxnnHs10T09rP5obdpVACcvoVhIX3nZAAlkMxqENrgoYAarckDMmLU7uL+P
 Wb71SCXTaQpX8gaQliefYL4LPdJf+sWGgOpUHql0SKttkKpqV1syTkt3Crwrt8051pC4
 7eRTTE33RItX+crM8D/5gn1C7ZFIuMskVQKQBNACrapgHmfMft52FNYSpnXBB9Ogncgo
 rnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3HTNTnLEO4Onxj3HJCKAfvonV0QBvdRaJFc8oMSdcWM=;
 b=1So9tzVPZis8N/sazZ/GVCV2IC7pCsPrTsqY6X73bNZBTmXx8LDfQ06HjndsWt4bf2
 UmKfMsLuYG8dBhw9a/393co5tu0CWaX5GPZX6khEEBjrCv8bkkQ5mq0gfgD9fHPeQg+z
 9GLE4mUr6WckZ+PTGSpRHbEjOUs44zTogw4Rzt03YbCLgECD5paeoqvqdp+Sx5N62ufs
 EJvqv++tP+zlKvquyQc0rsNpomxEK9ABsjeD6UMXCzAOZ9GYBwDXg5rbSZ629eAtNVbF
 6bTLK48emKJNg7ArCeos5kjHMOaGOW2FS/hobLcl+0Mi0Qpn12++iO/rYhRcW1sLXn+3
 gYMw==
X-Gm-Message-State: AOAM532a2XgFT7bccHJYwRy1tESqFOztzI+1G67tZvzQL4Et/IQkYXtS
 XpMZjD2V7KoCijCtRohtwbfkfFe9qwEhPc1Ydm2B90dI2Do=
X-Google-Smtp-Source: ABdhPJzlsGTK/3RTUxM79tPK5LkNGU0zOhDJd9npPzp/4tAlJ17EW3ozvTgHJxtgVPxIUe8FYg76yl2PzIxz6h+oWzY=
X-Received: by 2002:ad4:5ce8:: with SMTP id iv8mr44431950qvb.21.1638873983643; 
 Tue, 07 Dec 2021 02:46:23 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-4-maarten.lankhorst@linux.intel.com>
 <CAM0jSHMdahtPqwh559wBNitxm=XBm1Mws6F7UEWVrns2Qtxa1g@mail.gmail.com>
 <efa921e6-2a26-a275-9532-11d8efeb650c@linux.intel.com>
In-Reply-To: <efa921e6-2a26-a275-9532-11d8efeb650c@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 7 Dec 2021 10:45:57 +0000
Message-ID: <CAM0jSHPgC8MQ3+XqbRzegJ=jFN5aiN-E9G6dvbitqwL1S0OMEQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 03/16] drm/i915: Remove pages_mutex and
 intel_gtt->vma_ops.set/clear_pages members, v2.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

On Tue, 7 Dec 2021 at 10:06, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> On 06-12-2021 18:10, Matthew Auld wrote:
> > On Mon, 29 Nov 2021 at 13:57, Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com> wrote:
> >> Big delta, but boils down to moving set_pages to i915_vma.c, and removing
> >> the special handling, all callers use the defaults anyway. We only remap
> >> in ggtt, so default case will fall through.
> >>
> >> Because we still don't require locking in i915_vma_unpin(), handle this by
> >> using xchg in get_pages(), as it's locked with obj->mutex, and cmpxchg in
> >> unpin, which only fails if we race a against a new pin.
> >>
> >> Changes since v1:
> >> - aliasing gtt sets ZERO_SIZE_PTR, not -ENODEV, remove special case
> >>   from __i915_vma_get_pages(). (Matt)
> >>
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > <snip>
> >
> >> +static int
> >> +__i915_vma_get_pages(struct i915_vma *vma)
> >> +{
> >> +       struct sg_table *pages;
> >> +       int ret;
> >> +
> >> +       /*
> >> +        * The vma->pages are only valid within the lifespan of the borrowed
> >> +        * obj->mm.pages. When the obj->mm.pages sg_table is regenerated, so
> >> +        * must be the vma->pages. A simple rule is that vma->pages must only
> >> +        * be accessed when the obj->mm.pages are pinned.
> >> +        */
> >> +       GEM_BUG_ON(!i915_gem_object_has_pinned_pages(vma->obj));
> >> +
> >> +       switch (vma->ggtt_view.type) {
> >> +       default:
> >> +               GEM_BUG_ON(vma->ggtt_view.type);
> >> +               fallthrough;
> >> +       case I915_GGTT_VIEW_NORMAL:
> >> +               pages = vma->obj->mm.pages;
> >> +               break;
> >> +
> >> +       case I915_GGTT_VIEW_ROTATED:
> >> +               pages =
> >> +                       intel_rotate_pages(&vma->ggtt_view.rotated, vma->obj);
> >> +               break;
> >> +
> >> +       case I915_GGTT_VIEW_REMAPPED:
> >> +               pages =
> >> +                       intel_remap_pages(&vma->ggtt_view.remapped, vma->obj);
> >> +               break;
> >> +
> >> +       case I915_GGTT_VIEW_PARTIAL:
> >> +               pages = intel_partial_pages(&vma->ggtt_view, vma->obj);
> >> +               break;
> >> +       }
> >> +
> >> +       ret = 0;
> >> +       if (IS_ERR(pages)) {
> >> +               ret = PTR_ERR(pages);
> >> +               pages = NULL;
> >> +               drm_err(&vma->vm->i915->drm,
> >> +                       "Failed to get pages for VMA view type %u (%d)!\n",
> >> +                       vma->ggtt_view.type, ret);
> >> +       }
> >> +
> >> +       pages = xchg(&vma->pages, pages);
> >> +
> >> +       /* did we race against a put_pages? */
> >> +       if (pages && pages != vma->obj->mm.pages) {
> >> +               sg_free_table(vma->pages);
> >> +               kfree(vma->pages);
> > So should this one rather be:
> >
> > sg_free_table(pages);
> > kfree(pages);
> >
> > Or am I missing something?
>
> Correct! I missed it. Will fix it up when committing, or if a new version is needed.
>

r-b with that.
