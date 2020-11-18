Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 338172B770B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 08:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1475E6E342;
	Wed, 18 Nov 2020 07:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5CB6E342
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 07:39:36 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id f16so849571otl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 23:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kQ6WU7h/KCapyngIq31d2yV3S3yozxhq6mrduz4N64=;
 b=IsrxZxKX1cyEH7sgnmk34hmPhVToxcCrEboPDGgCST6VhxJu9pBN0cx9Gl7n4VIROb
 Px8FRUosxQ0O+sQ614Er1ro5X8qCA2vuPTVZL6EMXhZ7pmO1gteGSZt/rexYjYWJ4WEh
 4Wsor0NwivyOln5ACe1Aeiprr3Z4phF3ATCZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kQ6WU7h/KCapyngIq31d2yV3S3yozxhq6mrduz4N64=;
 b=nX8LWqli5QsDB98D1ntWv8YsWktfq/zsmHh616OD7lAgGWqvhHfKbJ4HSauYHJaWph
 GO/WQND0O4QlCKwLKempVCMCaKqxGtDJFN/UqGxw/LedxDRmpPyezJF8VBu1QUA2MCJM
 SdA4MZCmurgyt39eGfGmci4biBH7DjyKp6FHLE+Sm3mmdU0AQ6y7aKhrVf4lz5tQBSCb
 loqEfM2qC4IB9+9hNxNWdL5YLx5rF8mUFoPU0H0ro1jDQWGajG6LtB7aAgQG9KgM7y0a
 bp2mgb0s0aZlD4qUXqga2DHvnu4UkjNA+TnohaPTaZAk41Rmf2EPxKnXUvL0K9e4H9+g
 kZyA==
X-Gm-Message-State: AOAM530EstLMtP3XTxUM+kiEdZ0vr2GdmYQB38QjpOAXr9oYiJbfX7i/
 mNSXs9hvjk7Q+VuKcuy+wkcZgJ3mOQCHzNrr7tm5OA==
X-Google-Smtp-Source: ABdhPJwj9CxjkkFvHfpjLmodNPyNpUxvc36JEbfllBWiteLDbR8g86BcWCvWOFpfvqOkbt7ZvR9wgazdvPdrrxRc9Vo=
X-Received: by 2002:a05:6830:3155:: with SMTP id
 c21mr6001762ots.281.1605685176133; 
 Tue, 17 Nov 2020 23:39:36 -0800 (PST)
MIME-Version: 1.0
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095345.GF20149@phenom.ffwll.local>
 <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
 <20201117185255.GP401619@phenom.ffwll.local>
 <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
 <20201117194922.GW401619@phenom.ffwll.local>
 <064ef461-8f59-2eb8-7777-6ff5b8d28cdd@amd.com>
In-Reply-To: <064ef461-8f59-2eb8-7777-6ff5b8d28cdd@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Nov 2020 08:39:24 +0100
Message-ID: <CAKMK7uF9uvT09zDb6fS0j68fWrq2qV7h_JQAt8vpaGPJ1d64cQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 9:07 PM Andrey Grodzovsky
<Andrey.Grodzovsky@amd.com> wrote:
>
>
> On 11/17/20 2:49 PM, Daniel Vetter wrote:
> > On Tue, Nov 17, 2020 at 02:18:49PM -0500, Andrey Grodzovsky wrote:
> >> On 11/17/20 1:52 PM, Daniel Vetter wrote:
> >>> On Tue, Nov 17, 2020 at 01:38:14PM -0500, Andrey Grodzovsky wrote:
> >>>> On 6/22/20 5:53 AM, Daniel Vetter wrote:
> >>>>> On Sun, Jun 21, 2020 at 02:03:08AM -0400, Andrey Grodzovsky wrote:
> >>>>>> No point to try recovery if device is gone, just messes up things.
> >>>>>>
> >>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 16 ++++++++++++++++
> >>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  8 ++++++++
> >>>>>>     2 files changed, 24 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>> index 6932d75..5d6d3d9 100644
> >>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>> @@ -1129,12 +1129,28 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> >>>>>>          return ret;
> >>>>>>     }
> >>>>>> +static void amdgpu_cancel_all_tdr(struct amdgpu_device *adev)
> >>>>>> +{
> >>>>>> +        int i;
> >>>>>> +
> >>>>>> +        for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >>>>>> +                struct amdgpu_ring *ring = adev->rings[i];
> >>>>>> +
> >>>>>> +                if (!ring || !ring->sched.thread)
> >>>>>> +                        continue;
> >>>>>> +
> >>>>>> +                cancel_delayed_work_sync(&ring->sched.work_tdr);
> >>>>>> +        }
> >>>>>> +}
> >>>>> I think this is a function that's supposed to be in drm/scheduler, not
> >>>>> here. Might also just be your cleanup code being ordered wrongly, or your
> >>>>> split in one of the earlier patches not done quite right.
> >>>>> -Daniel
> >>>> This function iterates across all the schedulers  per amdgpu device and accesses
> >>>> amdgpu specific structures , drm/scheduler deals with single scheduler at most
> >>>> so looks to me like this is the right place for this function
> >>> I guess we could keep track of all schedulers somewhere in a list in
> >>> struct drm_device and wrap this up. That was kinda the idea.
> >>>
> >>> Minimally I think a tiny wrapper with docs for the
> >>> cancel_delayed_work_sync(&sched->work_tdr); which explains what you must
> >>> observe to make sure there's no race.
> >>
> >> Will do
> >>
> >>
> >>> I'm not exactly sure there's no
> >>> guarantee here we won't get a new tdr work launched right afterwards at
> >>> least, so this looks a bit like a hack.
> >>
> >> Note that for any TDR work happening post amdgpu_cancel_all_tdr
> >> amdgpu_job_timedout->drm_dev_is_unplugged
> >> will return true and so it will return early. To make it water proof tight
> >> against race
> >> i can switch from drm_dev_is_unplugged to drm_dev_enter/exit
> > Hm that's confusing. You do a work_cancel_sync, so that at least looks
> > like "tdr work must not run after this point"
> >
> > If you only rely on drm_dev_enter/exit check with the tdr work, then
> > there's no need to cancel anything.
>
>
> Agree, synchronize_srcu from drm_dev_unplug should play the role
> of 'flushing' any earlier (in progress) tdr work which is
> using drm_dev_enter/exit pair. Any later arising tdr will terminate early when
> drm_dev_enter
> returns false.

Nope, anything you put into the work itself cannot close this race.
It's the schedule_work that matters here. Or I'm missing something ...
I thought that the tdr work you're cancelling here is launched by
drm/scheduler code, not by the amd callback?
-Daniel

>
> Will update.
>
> Andrey
>
>
> >
> > For race free cancel_work_sync you need:
> > 1. make sure whatever is calling schedule_work is guaranteed to no longer
> > call schedule_work.
> > 2. call cancel_work_sync
> >
> > Anything else is cargo-culted work cleanup:
> >
> > - 1. without 2. means if a work got scheduled right before it'll still be
> >    a problem.
> > - 2. without 1. means a schedule_work right after makes you calling
> >    cancel_work_sync pointless.
> >
> > So either both or nothing.
> > -Daniel
> >
> >> Andrey
> >>
> >>
> >>> -Daniel
> >>>
> >>>> Andrey
> >>>>
> >>>>
> >>>>>> +
> >>>>>>     static void
> >>>>>>     amdgpu_pci_remove(struct pci_dev *pdev)
> >>>>>>     {
> >>>>>>          struct drm_device *dev = pci_get_drvdata(pdev);
> >>>>>> +        struct amdgpu_device *adev = dev->dev_private;
> >>>>>>          drm_dev_unplug(dev);
> >>>>>> +        amdgpu_cancel_all_tdr(adev);
> >>>>>>          ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
> >>>>>>          amdgpu_driver_unload_kms(dev);
> >>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >>>>>> index 4720718..87ff0c0 100644
> >>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >>>>>> @@ -28,6 +28,8 @@
> >>>>>>     #include "amdgpu.h"
> >>>>>>     #include "amdgpu_trace.h"
> >>>>>> +#include <drm/drm_drv.h>
> >>>>>> +
> >>>>>>     static void amdgpu_job_timedout(struct drm_sched_job *s_job)
> >>>>>>     {
> >>>>>>          struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
> >>>>>> @@ -37,6 +39,12 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
> >>>>>>          memset(&ti, 0, sizeof(struct amdgpu_task_info));
> >>>>>> +        if (drm_dev_is_unplugged(adev->ddev)) {
> >>>>>> +                DRM_INFO("ring %s timeout, but device unplugged, skipping.\n",
> >>>>>> +                                          s_job->sched->name);
> >>>>>> +                return;
> >>>>>> +        }
> >>>>>> +
> >>>>>>          if (amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
> >>>>>>                  DRM_ERROR("ring %s timeout, but soft recovered\n",
> >>>>>>                            s_job->sched->name);
> >>>>>> --
> >>>>>> 2.7.4
> >>>>>>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
