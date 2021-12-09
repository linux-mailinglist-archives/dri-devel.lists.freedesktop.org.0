Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72BA46EEAC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73E210E8D7;
	Thu,  9 Dec 2021 16:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABF189E59;
 Thu,  9 Dec 2021 14:27:48 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id de30so5051244qkb.0;
 Thu, 09 Dec 2021 06:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/0cDy0z+fhEje508h1DeCadhZVBvPccbE1h0Fcx0X3c=;
 b=YQslUMIUb48xtLcZ4Mhc9SfHtjisQhu4wHGXIe3ldB68qvNt11G0+RZDvZ5OIKb2aP
 x6dD1VmchxW9JFN/3YrQkjEKV3EwOShE2/fEShnIshllfwAw5PrnuSJEhaK4OxrKA1eB
 F55HieDnWAg+ugLxV49S3c0zi4AHq2CeX5gi9mpKZNRmi2gZrU/MSVXBVhVYJezsg9h7
 NwtncvT5W6YnA8JiWcWkcEm2fjYK9pAt7q7v9KazAPGi5fgD8sC8AUsOgWRXqz6kwnE9
 DuNMuC/0xRPkwfEkR2pe3sFUpUYhSMeIlZocOo1g0I9LF6ELT6P89X86ga+OuZKmiM2Q
 239A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/0cDy0z+fhEje508h1DeCadhZVBvPccbE1h0Fcx0X3c=;
 b=tCM1ynmj6o6PStGBMATaIklm76HxxpjF/wWXgnl/9QqRoG71LGgglclmpuozjxhlV8
 sz8Ke6MW++Xpy3Gp0y5zTsBoEusrwxheyWktnoeJcIF5DhnZy3AEE5E0prvId0eHwi+m
 LraTrjT+rzDe6NtA0DwvYeIrlZDD71jLLCKgW8ajcsUVIXHSZQTiWL8cY+QRk6EBIi9o
 SC0JeMj/+WErlw5/MoktGDZUGW0lQrcqiu++93GosSIVLeDG5hQMP/Nh0F30LIHnIUDT
 k7AM2PTx672OAT+YX8KON1pvE9dKMA4xXQc7FdbO38iI9NFA2Pb1ChGYaSoZSuiyxJI7
 htTA==
X-Gm-Message-State: AOAM5300j/7aMvretQip7y178vI6XkaI3k2Tav+To2oidpDh5LTADzdP
 H0I8WV28oFUpEyucjRjmnVfekIXb83KMtlMWjNShZ/xOeuA=
X-Google-Smtp-Source: ABdhPJx+5cRyaanHtZ3Vk/3q9kxImvBJ87Fnno98rJ8ruMzZWNukQWMpeTn/DlMvSIkV2wEa/cmsOdUQHKS0mdHtKVs=
X-Received: by 2002:a05:620a:2413:: with SMTP id
 d19mr14202022qkn.82.1639060067905; 
 Thu, 09 Dec 2021 06:27:47 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-13-maarten.lankhorst@linux.intel.com>
 <CAM0jSHM1P0-UqYC01vpjvogW_5ECwonnnmtmiKi3go4Di4+NKQ@mail.gmail.com>
 <f7bb808e-65c6-5e81-e129-58858a94db79@linux.intel.com>
 <CAM0jSHOZv54mLng+CHCajFq2eberkaRX8RdKWsSDwOQPG2rdGQ@mail.gmail.com>
 <1188bcc7-9415-adbb-1ec2-7016392d2923@linux.intel.com>
In-Reply-To: <1188bcc7-9415-adbb-1ec2-7016392d2923@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 9 Dec 2021 14:27:21 +0000
Message-ID: <CAM0jSHPdWQ3_ee0dO5gwPK4rOzbLiiKJ-yujwXYEcuPc6C1HTw@mail.gmail.com>
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

On Thu, 9 Dec 2021 at 13:46, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> On 09-12-2021 14:40, Matthew Auld wrote:
> > On Thu, 9 Dec 2021 at 13:25, Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com> wrote:
> >> On 09-12-2021 14:05, Matthew Auld wrote:
> >>> On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
> >>> <maarten.lankhorst@linux.intel.com> wrote:
> >>>> We want to remove more members of i915_vma, which requires the locking to be
> >>>> held more often.
> >>>>
> >>>> Start requiring gem object lock for i915_vma_unbind, as it's one of the
> >>>> callers that may unpin pages.
> >>>>
> >>>> Some special care is needed when evicting, because the last reference to the
> >>>> object may be held by the VMA, so after __i915_vma_unbind, vma may be garbage,
> >>>> and we need to cache vma->obj before unlocking.
> >>>>
> >>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>> ---
> >>> <snip>
> >>>
> >>>> @@ -129,22 +129,47 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
> >>>>
> >>>>         drm_WARN_ON(&vm->i915->drm, !vm->is_ggtt && !vm->is_dpt);
> >>>>
> >>>> +retry:
> >>>> +       i915_gem_drain_freed_objects(vm->i915);
> >>>> +
> >>>>         mutex_lock(&vm->mutex);
> >>>>
> >>>>         /* Skip rewriting PTE on VMA unbind. */
> >>>>         open = atomic_xchg(&vm->open, 0);
> >>>>
> >>>>         list_for_each_entry_safe(vma, vn, &vm->bound_list, vm_link) {
> >>>> +               struct drm_i915_gem_object *obj = vma->obj;
> >>>> +
> >>>>                 GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
> >>>> +
> >>>>                 i915_vma_wait_for_bind(vma);
> >>>>
> >>>> -               if (i915_vma_is_pinned(vma))
> >>>> +               if (i915_vma_is_pinned(vma) || !i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND))
> >>>>                         continue;
> >>>>
> >>>> -               if (!i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND)) {
> >>>> -                       __i915_vma_evict(vma);
> >>>> -                       drm_mm_remove_node(&vma->node);
> >>>> +               /* unlikely to race when GPU is idle, so no worry about slowpath.. */
> >>>> +               if (!i915_gem_object_trylock(obj, NULL)) {
> >>>> +                       atomic_set(&vm->open, open);
> >>> Does this need a comment about barriers?
> >> Not sure, it's guarded by vm->mutex.
> >>>> +
> >>>> +                       i915_gem_object_get(obj);
> >>> Should this not be kref_get_unless_zero? Assuming the vm->mutex is the
> >>> only thing keeping the object alive here, won't this lead to potential
> >>> uaf/double-free or something? Also should we not plonk this before the
> >>> trylock? Or maybe I'm missing something here?
> >> Normally you're correct, this is normally the case, but we drain freed objects and this path should only be run during s/r, at which point userspace should be dead, GPU idle, and we just drained all freed objects above.
> >>
> >> It would be a bug if we still found a dead object, as nothing should be running.
> > Hmm, Ok. So why do we expect the trylock to ever fail here? Who else
> > can grab it at this stage?
> It probably shouldn't, should probably be a WARN if it happens.

r-b with that then.

> >>>> +                       mutex_unlock(&vm->mutex);
> >>>> +
> >>>> +                       i915_gem_object_lock(obj, NULL);
> >>>> +                       open = i915_vma_unbind(vma);
> >>>> +                       i915_gem_object_unlock(obj);
> >>>> +
> >>>> +                       GEM_WARN_ON(open);
> >>>> +
> >>>> +                       i915_gem_object_put(obj);
> >>>> +                       goto retry;
> >>>>                 }
> >>>> +
> >>>> +               i915_vma_wait_for_bind(vma);
> >>> We also call wait_for_bind above, is that intentional?
> >> Should be harmless, but first one should probably be removed. :)
> >>
>
