Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F823402FF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 11:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90AE6E8C2;
	Thu, 18 Mar 2021 10:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED036E8C3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 10:16:49 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id k25so874053oic.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 03:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yGgk67kmRUCnXzdEGP0Z/VSN4P43OXWH/sUq91N9s44=;
 b=CkgO2WblG8+rHfpj5zD6bRHZ+HgtdMXcfwv122qlB7+scXAQT1dkCRueW3ePrggDW7
 Z3Pm+DeWhgw0wzPgpXk00lkR7H68ujbOt4NnrvLmrzNcvKPNuoYmP7T2ktQtYzQNGJo0
 y122I/DPj/8CCJvHFkF3pscC3HDHbbzvualBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yGgk67kmRUCnXzdEGP0Z/VSN4P43OXWH/sUq91N9s44=;
 b=Z5pbiLW83F8/RsR0OlffqXI5/1mbRHbSxkm3S9dtgMyWCQFCR1r9X/qtYlaVF8nagT
 ObCduLtM/KGygM3VEITWwOOTNfJWBzcivRw/yh51BQ2XNjT6wIv3cWGQTAm4rx+nssFg
 YmzZu6VeCzn2W7jM3TGO2n1Zbpx3ciHXVWA1bTOjHCvzWEEbkOZGL9IyvpKHuXk3165n
 EY2YCPXnlm2AlTQANWSO98skVXQKHSh/ZcHeRo9NmLoetW4ky9OucXvbY3KS3CN5a5gA
 CiKJFFPSQWwdWekiuOQoFbU+HusXDq64UCWw9o79coxygRl+CsZyVGSv27/kE3nt+RcL
 hwNg==
X-Gm-Message-State: AOAM532rj/ukimyelXTmBi66MCuM6MBjEqauxXrAkj9zift+8/FQBeWI
 rP+0ktP3r/F5FqX9pEYSohhUsaFIzXEt215f5t+ppw==
X-Google-Smtp-Source: ABdhPJy0iOdLkR1u6iDgLSCVVhKmmC+MT6+8Y5Wz9in0xUQRk66gHNkDPEudMYP0TB3yizwlTH+ro0apPHyRvVMnOLA=
X-Received: by 2002:aca:eb56:: with SMTP id j83mr2338268oih.14.1616062608427; 
 Thu, 18 Mar 2021 03:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210126214626.16260-1-brian.welty@intel.com>
 <20210126214626.16260-9-brian.welty@intel.com>
 <YCJp//kMC7YjVMXv@phenom.ffwll.local>
 <dffeb6a7-90f1-e17c-9695-44678e7a39cb@intel.com>
 <YCVOl8/87bqRSQei@phenom.ffwll.local>
 <89a71735-aae5-2617-c017-310207c5873b@intel.com>
In-Reply-To: <89a71735-aae5-2617-c017-310207c5873b@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 18 Mar 2021 11:16:37 +0100
Message-ID: <CAKMK7uG2PFMWXa9o4LzsF1r0Mc-M8KqD-PKZkCj+m7XeO5wCyg@mail.gmail.com>
Subject: Re: [RFC PATCH 8/9] drm/gem: Associate GEM objects with drm cgroup
To: Brian Welty <brian.welty@intel.com>
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
 Eero Tamminen <eero.t.tamminen@intel.com>, David Airlie <airlied@linux.ie>,
 Kenny Ho <Kenny.Ho@amd.com>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 6, 2021 at 1:44 AM Brian Welty <brian.welty@intel.com> wrote:
>
>
> On 2/11/2021 7:34 AM, Daniel Vetter wrote:
> > On Wed, Feb 10, 2021 at 02:00:57PM -0800, Brian Welty wrote:
> >>
> >> On 2/9/2021 2:54 AM, Daniel Vetter wrote:
> >>> On Tue, Jan 26, 2021 at 01:46:25PM -0800, Brian Welty wrote:
> >>>> This patch adds tracking of which cgroup to make charges against for a
> >>>> given GEM object.  We associate the current task's cgroup with GEM objects
> >>>> as they are created.  First user of this is for charging DRM cgroup for
> >>>> device memory allocations.  The intended behavior is for device drivers to
> >>>> make the cgroup charging calls at the time that backing store is allocated
> >>>> or deallocated for the object.
> >>>>
> >>>> Exported functions are provided for charging memory allocations for a
> >>>> GEM object to DRM cgroup. To aid in debugging, we store how many bytes
> >>>> have been charged inside the GEM object.  Add helpers for setting and
> >>>> clearing the object's associated cgroup which will check that charges are
> >>>> not being leaked.
> >>>>
> >>>> For shared objects, this may make the charge against a cgroup that is
> >>>> potentially not the same cgroup as the process using the memory.  Based
> >>>> on the memory cgroup's discussion of "memory ownership", this seems
> >>>> acceptable [1].
> >>>>
> >>>> [1] https://www.kernel.org/doc/Documentation/cgroup-v2.txt, "Memory Ownership"
> >>>>
> >>>> Signed-off-by: Brian Welty <brian.welty@intel.com>
> >>>
> >>> Since for now we only have the generic gpu/xpu/bikeshed.memory bucket that
> >>> counts everything, why don't we also charge in these gem functions?
> >>
> >> I'm not sure what you mean exactly.  You want to merge/move the charging logic
> >> proposed in patch #5 (drm_cgroup_try_charge in kernel/cgroup/drm.c) into
> >> drm_gem_object_charge_mem() ?
> >>
> >> Or reading below, I think you are okay keeping the logic separated as is, but
> >> you want much of the code in kernel/cgroup/drm.c moved to drivers/gpu/cgroup ?
> >> Yes, I see that should allow to reduce number of exported functions.
> >
> > Both. I mean we'd need to look at the code again when it's shuffled, but
> > I'd say:
> >
> > - cgroup code and the charging for general gpu memory moves to
> >   drivers/gpu/cgroup, so dma-buf heaps can use it too.
> >
> > - the charging for gem buffers moves into core gem code, so it happens for
> >   all gpu drivers and all gem buffer allocations.
>
> Daniel, I'm not sure we're in sync on what 'charging for general gpu memory'
> means.  Thus far, I have been proposing to charge/uncharge when backing store is
> allocated/freed.  And thus, this would be done in DRM driver (so then also in
> the dma-buf exporter).
> I can't see how we'd hoist this part into drm gem code.
> The memory limit in this series is for VRAM usage/limit not GEM buffers...

Yes this would be at gem buffer creation time. And just to get cgroups
for drm up&running.

> Unless you are talking about charging for GEM buffer creation?  But this is
> more of a 'soft resource' more along lines of Kenny's earlier GEM buffer limit
> control.
> I raised issue with this then, and at the time, Tejun agreed we should keep to
> 'hard resource' controls, see [1] and [2].
>
> [1] https://lists.freedesktop.org/archives/dri-devel/2019-May/218071.html
> [2] https://lists.freedesktop.org/archives/dri-devel/2020-April/262141.html
>
> >
> > - this might or might not mean a bunch less exported stuff from the
> >   cgroups files (since you don't need separate steps for linking a gem
> >   object to a cgroup from the actual charging), and probably no exports
> >   anymore for drivers (since they charge nothing). That will change
> >   when we add charging for specific memory pools I guess, but we add that
> >   when we add tha functionality.
>
> ... so considering VRAM charging, then yes, we very much need to have exported
> functions for drivers to do the charging.
> But these can be exported from drm.ko (or new .ko?) instead of kernel.  Is
> that still preference?   Also, if number of exported functions is concern, we
> can replace some of it with use of function pointers.

So the reason I suggested we drop all this is because we won't charge
in drivers, we'll charge in ttm buffer management code. Which we'll
adopt for dg1 in upstream. But it will take some time.

> So then returning to this comment of yours:
>
> > - cgroup code and the charging for general gpu memory moves to
> >   drivers/gpu/cgroup, so dma-buf heaps can use it too.
>
> If you agree that we are charging just at backing-store level, then I think
> logic belongs in drivers/gpu/drm/cgroup ??  As charging is done in DRM driver
> (also dma-buf exporter).  In other words, part of drm.
> If I understand, dma-buf heaps is exporter of system memory and doesn't
> need to charge against gpu controller??
> Will need some help to understand the dma-buf heap use case a bit more.

Well we also need to track system gpu memory somehow. Currently that
flies under the radar, and nasty userspace can just easily exhaust all
of system memory with gpu buffers, even if there's otherwise cgroup
limits in place. Which is not good. Hence also the overall limit for
buffers.
-Daniel

>
>
> Thanks,
> -Brian
>
> >
> >>> Also, that would remove the need for all these functions exported to
> >>> drivers. Plus the cgroups setup could also move fully into drm core code,
> >>> since all drivers (*) support it
> >>> That way this would really be a fully
> >>> generic cgroups controller, and we could land it.
> >>
> >>
> >> Patch #2 proposed to have a few setup functions called during drm device
> >> registration.
> >> You are suggesting to have this more tightly integrated?
> >
> > Yeah essentially if DRIVER_GEM is set drm core would simply set this all
> > up. Since with this we'd always account all gem buffers in cgroups, and it
> > would make basic cgroup support a non-optional part of drm drivers.
> >
> >> Okay, can see what that looks like.  It's true most of the exported functions from
> >> kernel/cgroup/drm.c were taking a struct drm_device pointer, so seems it can be
> >> restructured as you suggest.  But I guess we will always need some logic in
> >> kernel/cgroup/drm.c to encapsulate the allocation of the 'struct cgroup_subsys_state'
> >> for this new controller.
> >> But I'm not sure I see how this makes the controller 'fully generic' as you describe.
> >
> > All DRIVER_GEM would automatacially support it. And yes there'll still be
> > some encapsulation ofc.
> >
> >>> The other things I'd do:
> >>> - drop gpu scheduling controller from the initial patch series. Yes we'll
> >>>   need it, but we also need vram limits and all these things for full
> >>>   featured controller. Having the minimal viable cgroup controller in
> >>>   upstream would unblock all these other things, and we could discuss them
> >>>   in separate patch series, instead of one big bikeshed that never reaches
> >>>   full consensus.
> >>>
> >>> - the xpu thing is probably real, I just chatted with Android people for
> >>>   their gpu memory accounting needs, and cgroups sounds like a solution
> >>>   for them too. But unlike on desktop/server linux, on Android all shared
> >>>   buffers are allocated from dma-buf heaps, so outside of drm, and hence a
> >>>   cgroup controller that's tightly tied to drm isn't that useful. So I
> >>>   think we should move the controller/charge functions up one level into
> >>>   drivers/gpu/cgroups.
> >>
> >> Hmm, so for this, you are asking for the cgroup logic to not directly use
> >> DRM data structures?  Okay, that's why you suggest drivers/gpu/cgroups and
> >> not drivers/gpu/drm/cgroups.  So this is your angle to make it 'fully
> >> generic' then.....
> >
> > This is another flavour of "generic", maybe need to split them up:
> > - make it more generic by rolling it out for all DRIVER_GEM
> > - make it more generic by allowing non-drm code to charge gpu memory
> >   (android's dma-buf heaps will need that, maybe v4l eventually too)
> >
> >>>   On the naming bikeshed I think gpu is perfectly fine, just explain in
> >>>   the docs that the G stands for "general" :-) Otherwise we might need to
> >>>   rename drivers/gpu to drivers/xpu too, and that's maybe one bikeshed too
> >>>   far. Plus, right now it really is the controller for gpu related memory,
> >>>   even if we extend it to Android (where it would also include
> >>>   video/camera allocatioons). Extending this cgroup controller to
> >>>   accelerators in general is maybe a bit too much.
> >>>
> >>> - The other disambiguation is how we account dma-buf (well, buffer based)
> >>>   gpu allocations vs HMM gpu memory allocations, that might be worth
> >>>   clarifying in the docs.
> >>>
> >>> - Finally to accelerate this further, I think it'd be good to pull out the
> >>>   cgroup spec for this more minimized series into patch 1, as a draft.
> >>>   That way we could get all stakeholders to ack on that ack, so hopefully
> >>>   we're building something that will work for everyone. That way we can
> >>>   hopefully untangle the controller design discussions from the
> >>>   implementation bikeshedding as much as possible.
> >>
> >> Okay, thanks for all the inputs.
> >> I agree the 'cgroup spec' should be in first patch.  Can redo this way as well.
> >>
> >> As much of the code here for the controller was Kenny's work...
> >> Kenny, any input on Daniel's suggestions?
> >> Otherwise, I can proceed to rework as suggested.
> >
> > If you're worried about acknowledgement if you end up fully rewriting
> > code: Reference an old version from Kenny from archive and mention in the
> > commit log it's based on that work. There's no requirement that you can
> > only reuse patches from other people entirely unchanged, this kind of
> > collaborative patch development mode happens all the time.
> >
> > Cheers, Daniel
> >
> >>
> >> Thanks,
> >> -Brian
> >>
> >>
> >>>
> >>> Cheers, Daniel
> >>>
> >>> *: vmwgfx is the only non-gem driver, but there's plans to move at least
> >>> vmwgfx internals (maybe not the uapi, we'll see) over to gem. Once that's
> >>> done it's truly all gpu memory.
> >>>> ---
> >>>>  drivers/gpu/drm/drm_gem.c | 89 +++++++++++++++++++++++++++++++++++++++
> >>>>  include/drm/drm_gem.h     | 17 ++++++++
> >>>>  2 files changed, 106 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> >>>> index c2ce78c4edc3..a12da41eaafe 100644
> >>>> --- a/drivers/gpu/drm/drm_gem.c
> >>>> +++ b/drivers/gpu/drm/drm_gem.c
> >>>> @@ -29,6 +29,7 @@
> >>>>  #include <linux/slab.h>
> >>>>  #include <linux/mm.h>
> >>>>  #include <linux/uaccess.h>
> >>>> +#include <linux/cgroup_drm.h>
> >>>>  #include <linux/fs.h>
> >>>>  #include <linux/file.h>
> >>>>  #include <linux/module.h>
> >>>> @@ -112,6 +113,89 @@ drm_gem_init(struct drm_device *dev)
> >>>>    return drmm_add_action(dev, drm_gem_init_release, NULL);
> >>>>  }
> >>>>
> >>>> +/**
> >>>> + * drm_gem_object_set_cgroup - associate GEM object with a cgroup
> >>>> + * @obj: GEM object which is being associated with a cgroup
> >>>> + * @task: task associated with process control group to use
> >>>> + *
> >>>> + * This will acquire a reference on cgroup and use for charging GEM
> >>>> + * memory allocations.
> >>>> + * This helper could be extended in future to migrate charges to another
> >>>> + * cgroup, print warning if this usage occurs.
> >>>> + */
> >>>> +void drm_gem_object_set_cgroup(struct drm_gem_object *obj,
> >>>> +                         struct task_struct *task)
> >>>> +{
> >>>> +  /* if object has existing cgroup, we migrate the charge... */
> >>>> +  if (obj->drmcg) {
> >>>> +          pr_warn("DRM: need to migrate cgroup charge of %lld\n",
> >>>> +                  atomic64_read(&obj->drmcg_bytes_charged));
> >>>> +  }
> >>>> +  obj->drmcg = drmcg_get(task);
> >>>> +}
> >>>> +EXPORT_SYMBOL(drm_gem_object_set_cgroup);
> >>>> +
> >>>> +/**
> >>>> + * drm_gem_object_unset_cgroup - clear GEM object's associated cgroup
> >>>> + * @obj: GEM object
> >>>> + *
> >>>> + * This will release a reference on cgroup.
> >>>> + */
> >>>> +void drm_gem_object_unset_cgroup(struct drm_gem_object *obj)
> >>>> +{
> >>>> +  WARN_ON(atomic64_read(&obj->drmcg_bytes_charged));
> >>>> +  drmcg_put(obj->drmcg);
> >>>> +}
> >>>> +EXPORT_SYMBOL(drm_gem_object_unset_cgroup);
> >>>> +
> >>>> +/**
> >>>> + * drm_gem_object_charge_mem - try charging size bytes to DRM cgroup
> >>>> + * @obj: GEM object which is being charged
> >>>> + * @size: number of bytes to charge
> >>>> + *
> >>>> + * Try to charge @size bytes to GEM object's associated DRM cgroup.  This
> >>>> + * will fail if a successful charge would cause the current device memory
> >>>> + * usage to go above the cgroup's GPU memory maximum limit.
> >>>> + *
> >>>> + * Returns 0 on success.  Otherwise, an error code is returned.
> >>>> + */
> >>>> +int drm_gem_object_charge_mem(struct drm_gem_object *obj, u64 size)
> >>>> +{
> >>>> +  int ret;
> >>>> +
> >>>> +  ret = drm_cgroup_try_charge(obj->drmcg, obj->dev,
> >>>> +                              DRMCG_TYPE_MEM_CURRENT, size);
> >>>> +  if (!ret)
> >>>> +          atomic64_add(size, &obj->drmcg_bytes_charged);
> >>>> +  return ret;
> >>>> +}
> >>>> +EXPORT_SYMBOL(drm_gem_object_charge_mem);
> >>>> +
> >>>> +/**
> >>>> + * drm_gem_object_uncharge_mem - uncharge size bytes from DRM cgroup
> >>>> + * @obj: GEM object which is being uncharged
> >>>> + * @size: number of bytes to uncharge
> >>>> + *
> >>>> + * Uncharge @size bytes from the DRM cgroup associated with specified
> >>>> + * GEM object.
> >>>> + *
> >>>> + * Returns 0 on success.  Otherwise, an error code is returned.
> >>>> + */
> >>>> +void drm_gem_object_uncharge_mem(struct drm_gem_object *obj, u64 size)
> >>>> +{
> >>>> +  u64 charged = atomic64_read(&obj->drmcg_bytes_charged);
> >>>> +
> >>>> +  if (WARN_ON(!charged))
> >>>> +          return;
> >>>> +  if (WARN_ON(size > charged))
> >>>> +          size = charged;
> >>>> +
> >>>> +  atomic64_sub(size, &obj->drmcg_bytes_charged);
> >>>> +  drm_cgroup_uncharge(obj->drmcg, obj->dev, DRMCG_TYPE_MEM_CURRENT,
> >>>> +                      size);
> >>>> +}
> >>>> +EXPORT_SYMBOL(drm_gem_object_uncharge_mem);
> >>>> +
> >>>>  /**
> >>>>   * drm_gem_object_init - initialize an allocated shmem-backed GEM object
> >>>>   * @dev: drm_device the object should be initialized for
> >>>> @@ -156,6 +240,8 @@ void drm_gem_private_object_init(struct drm_device *dev,
> >>>>    obj->dev = dev;
> >>>>    obj->filp = NULL;
> >>>>
> >>>> +  drm_gem_object_set_cgroup(obj, current);
> >>>> +
> >>>>    kref_init(&obj->refcount);
> >>>>    obj->handle_count = 0;
> >>>>    obj->size = size;
> >>>> @@ -950,6 +1036,9 @@ drm_gem_object_release(struct drm_gem_object *obj)
> >>>>
> >>>>    dma_resv_fini(&obj->_resv);
> >>>>    drm_gem_free_mmap_offset(obj);
> >>>> +
> >>>> +  /* Release reference on cgroup used with GEM object charging */
> >>>> +  drm_gem_object_unset_cgroup(obj);
> >>>>  }
> >>>>  EXPORT_SYMBOL(drm_gem_object_release);
> >>>>
> >>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> >>>> index 240049566592..06ea10fc17bc 100644
> >>>> --- a/include/drm/drm_gem.h
> >>>> +++ b/include/drm/drm_gem.h
> >>>> @@ -37,6 +37,7 @@
> >>>>  #include <linux/kref.h>
> >>>>  #include <linux/dma-resv.h>
> >>>>
> >>>> +#include <drm/drm_cgroup.h>
> >>>>  #include <drm/drm_vma_manager.h>
> >>>>
> >>>>  struct dma_buf_map;
> >>>> @@ -222,6 +223,17 @@ struct drm_gem_object {
> >>>>     */
> >>>>    struct file *filp;
> >>>>
> >>>> +  /**
> >>>> +   * @drmcg:
> >>>> +   *
> >>>> +   * cgroup used for charging GEM object page allocations against. This
> >>>> +   * is set to the current cgroup during GEM object creation.
> >>>> +   * Charging policy is up to the DRM driver to implement and should be
> >>>> +   * charged when allocating backing store from device memory.
> >>>> +   */
> >>>> +  struct drmcg *drmcg;
> >>>> +  atomic64_t drmcg_bytes_charged;
> >>>> +
> >>>>    /**
> >>>>     * @vma_node:
> >>>>     *
> >>>> @@ -417,4 +429,9 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
> >>>>  int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
> >>>>                        u32 handle, u64 *offset);
> >>>>
> >>>> +void drm_gem_object_set_cgroup(struct drm_gem_object *obj,
> >>>> +                         struct task_struct *task);
> >>>> +void drm_gem_object_unset_cgroup(struct drm_gem_object *obj);
> >>>> +int drm_gem_object_charge_mem(struct drm_gem_object *obj, u64 size);
> >>>> +void drm_gem_object_uncharge_mem(struct drm_gem_object *obj, u64 size);
> >>>>  #endif /* __DRM_GEM_H__ */
> >>>> --
> >>>> 2.20.1
> >>>>
> >>>
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
