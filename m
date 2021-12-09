Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E0C46EF6B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8624210EB1A;
	Thu,  9 Dec 2021 16:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972E310E11E;
 Thu,  9 Dec 2021 13:40:40 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id o17so5330492qtk.1;
 Thu, 09 Dec 2021 05:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yDCPdr4+0+qqn/StnpPomsYmh7TpSPnVu8R/Y30zDaw=;
 b=GMGrGwiOUuLy/fRiRdKPDvna5ttdUGPOiHQH3ZarDW8YDDVc11pty7l48ur73IcO7G
 sR5f4ZYawFZrgtLRdZalWdWrh0eeTsoN0g6iU3DNY9lpv9rDaUvjfA/TZPGU6TKHMC8f
 IQ71zucKCjZkO+Tip0BLYhpCR17D4ZXqF5bc2mXm69oM5CddJe5OX1k6Pnt4/3wKDskn
 GRUfktBzdhUQ+oEm27DVmhQYm8Q5u1P+m+aYNUNtn/McvWFtqebOyEHAybZAoDHYaIg7
 dZUOhUw3RXRoVG0bRmS8+u+Txq9YZPi2N8vqQsEYDSiFHYcHaAIZTwZaip73xvG8QlG2
 A+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yDCPdr4+0+qqn/StnpPomsYmh7TpSPnVu8R/Y30zDaw=;
 b=THZ3bnR1qtZKYHGibZuhXlYWhj00LBpFA1wYYaTT8Uf6MjVGpi5ZDlopvrTS0c9cys
 IB/Rs6cwhA9fk7Lvii+N6jcFJh9HCP6Nksw1nAoMko6YfoVBZMRbhxA5JHGxUV/6fSUi
 9YnXrxzKtNTeSxVwd2vSR46VVVM8cl5bLtdZkz1iAjlwMawpSlcYjKQdSMW/BzoXkmcz
 WCJcnQn4G9x/6kpqdWlbsP6I4iqrK9H7GZ94l6M9dGSTy+JG5I++ovl38ng79NCI1U9q
 WE30aG+sB+xzr8BnyhIjGXwFhr0sJq2Pniy6FlqHEDsQOCZISyOE9jP/e/wygjprwZOY
 VYlw==
X-Gm-Message-State: AOAM533cpH4izkRH40QhTtmsdrNDdci/f6UJZ0Wfe90qR3WxhEO33QBd
 ay5Wxaf6/WtqjZj7JojH5YX1KLa5P7rs/NfQ21i2Pw5Py/Q=
X-Google-Smtp-Source: ABdhPJzPLgVT0RXic9X4Xuq9YQQTB1O3bSEGI74T7CqQ9aI5TNgnpRb6k5RY5BOO6Hjc1WSrhA9yebNLhTahbL4ovoQ=
X-Received: by 2002:ac8:4d87:: with SMTP id a7mr17567455qtw.410.1639057239509; 
 Thu, 09 Dec 2021 05:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-13-maarten.lankhorst@linux.intel.com>
 <CAM0jSHM1P0-UqYC01vpjvogW_5ECwonnnmtmiKi3go4Di4+NKQ@mail.gmail.com>
 <f7bb808e-65c6-5e81-e129-58858a94db79@linux.intel.com>
In-Reply-To: <f7bb808e-65c6-5e81-e129-58858a94db79@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 9 Dec 2021 13:40:13 +0000
Message-ID: <CAM0jSHOZv54mLng+CHCajFq2eberkaRX8RdKWsSDwOQPG2rdGQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] drm/i915: Add i915_vma_unbind_unlocked, and take
 obj lock for i915_vma_unbind
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

On Thu, 9 Dec 2021 at 13:25, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> On 09-12-2021 14:05, Matthew Auld wrote:
> > On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com> wrote:
> >> We want to remove more members of i915_vma, which requires the locking to be
> >> held more often.
> >>
> >> Start requiring gem object lock for i915_vma_unbind, as it's one of the
> >> callers that may unpin pages.
> >>
> >> Some special care is needed when evicting, because the last reference to the
> >> object may be held by the VMA, so after __i915_vma_unbind, vma may be garbage,
> >> and we need to cache vma->obj before unlocking.
> >>
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> ---
> > <snip>
> >
> >> @@ -129,22 +129,47 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
> >>
> >>         drm_WARN_ON(&vm->i915->drm, !vm->is_ggtt && !vm->is_dpt);
> >>
> >> +retry:
> >> +       i915_gem_drain_freed_objects(vm->i915);
> >> +
> >>         mutex_lock(&vm->mutex);
> >>
> >>         /* Skip rewriting PTE on VMA unbind. */
> >>         open = atomic_xchg(&vm->open, 0);
> >>
> >>         list_for_each_entry_safe(vma, vn, &vm->bound_list, vm_link) {
> >> +               struct drm_i915_gem_object *obj = vma->obj;
> >> +
> >>                 GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
> >> +
> >>                 i915_vma_wait_for_bind(vma);
> >>
> >> -               if (i915_vma_is_pinned(vma))
> >> +               if (i915_vma_is_pinned(vma) || !i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND))
> >>                         continue;
> >>
> >> -               if (!i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND)) {
> >> -                       __i915_vma_evict(vma);
> >> -                       drm_mm_remove_node(&vma->node);
> >> +               /* unlikely to race when GPU is idle, so no worry about slowpath.. */
> >> +               if (!i915_gem_object_trylock(obj, NULL)) {
> >> +                       atomic_set(&vm->open, open);
> > Does this need a comment about barriers?
> Not sure, it's guarded by vm->mutex.
> >> +
> >> +                       i915_gem_object_get(obj);
> > Should this not be kref_get_unless_zero? Assuming the vm->mutex is the
> > only thing keeping the object alive here, won't this lead to potential
> > uaf/double-free or something? Also should we not plonk this before the
> > trylock? Or maybe I'm missing something here?
>
> Normally you're correct, this is normally the case, but we drain freed objects and this path should only be run during s/r, at which point userspace should be dead, GPU idle, and we just drained all freed objects above.
>
> It would be a bug if we still found a dead object, as nothing should be running.

Hmm, Ok. So why do we expect the trylock to ever fail here? Who else
can grab it at this stage?

>
> >> +                       mutex_unlock(&vm->mutex);
> >> +
> >> +                       i915_gem_object_lock(obj, NULL);
> >> +                       open = i915_vma_unbind(vma);
> >> +                       i915_gem_object_unlock(obj);
> >> +
> >> +                       GEM_WARN_ON(open);
> >> +
> >> +                       i915_gem_object_put(obj);
> >> +                       goto retry;
> >>                 }
> >> +
> >> +               i915_vma_wait_for_bind(vma);
> > We also call wait_for_bind above, is that intentional?
>
> Should be harmless, but first one should probably be removed. :)
>
