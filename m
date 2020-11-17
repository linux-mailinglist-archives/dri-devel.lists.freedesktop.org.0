Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7CC2B6F47
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 20:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA9389CA8;
	Tue, 17 Nov 2020 19:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D559689C13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:49:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a3so4425611wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=T+O67atxrMjS42aF6AxSWVUQwFYASgd1s3YWBVqT95M=;
 b=dhbgiQ7+YM7E55qiIy8/5X6E2qpBt+4MkOm4GCdOZN0EhKxYT292Z+j2WVJ76JlTH/
 t3InQO2fpoFFrG2gpogVUDvPAJksVZmZ3SibbZ0xIjmcI/bH/zwJ4/ot3opa1yia8l4z
 7E10Vs9q+SUf37QXk/oDwAzsoC/Kt2h9NNUgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=T+O67atxrMjS42aF6AxSWVUQwFYASgd1s3YWBVqT95M=;
 b=QJYxO/wVYSRkrBV46U1n9JHz20NAlCkB4i1dSBx6e1furaYNVVExpU1OnVeHp08v/e
 nxBUl/gDXSMxJ9Lk/fa4qNJ8iNIsAJfs+rRGZdWeAUU8Scv7ccK9yrpGhZjsoaKUA2Tt
 hJegXE4UXIC6YflvxLFrBqA+reISvdxsz9DI4IdQV98T3wuGlvZF5XUdm9Mvyq/wmXGB
 NufLJrBh6pqXEcGAhhhvRU0Vbkp4dRlWBkT1VFVivDgr8BkGtjm2GI5Lzyq9dZskSqM5
 N/ISBPjkT25+ZJZloRq4jsfJen7bUX+egbhmNqn/Xq5qNaOVAOGPNkFtYUp86Qdglx9V
 Cgyg==
X-Gm-Message-State: AOAM532B3BYmXMrNH52DnXrwgXfbZk1uiKtgq1VgEcJ6NsWzJGaUsSiM
 4BXDkUIPeX6XyoCrP3ucrqIxPw==
X-Google-Smtp-Source: ABdhPJxHT3L36GQaNFn67PO7tTb5gZYD/rSqerFybPuNyvkz/bX9i3rV+itwHiE0RZWq+TA2nNYPrw==
X-Received: by 2002:a1c:56c4:: with SMTP id k187mr737772wmb.92.1605642565508; 
 Tue, 17 Nov 2020 11:49:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f18sm15313207wru.42.2020.11.17.11.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 11:49:24 -0800 (PST)
Date: Tue, 17 Nov 2020 20:49:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
Message-ID: <20201117194922.GW401619@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095345.GF20149@phenom.ffwll.local>
 <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
 <20201117185255.GP401619@phenom.ffwll.local>
 <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 02:18:49PM -0500, Andrey Grodzovsky wrote:
> =

> On 11/17/20 1:52 PM, Daniel Vetter wrote:
> > On Tue, Nov 17, 2020 at 01:38:14PM -0500, Andrey Grodzovsky wrote:
> > > On 6/22/20 5:53 AM, Daniel Vetter wrote:
> > > > On Sun, Jun 21, 2020 at 02:03:08AM -0400, Andrey Grodzovsky wrote:
> > > > > No point to try recovery if device is gone, just messes up things.
> > > > > =

> > > > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > > ---
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 16 ++++++++++++++++
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  8 ++++++++
> > > > >    2 files changed, 24 insertions(+)
> > > > > =

> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_drv.c
> > > > > index 6932d75..5d6d3d9 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > @@ -1129,12 +1129,28 @@ static int amdgpu_pci_probe(struct pci_de=
v *pdev,
> > > > >    	return ret;
> > > > >    }
> > > > > +static void amdgpu_cancel_all_tdr(struct amdgpu_device *adev)
> > > > > +{
> > > > > +	int i;
> > > > > +
> > > > > +	for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
> > > > > +		struct amdgpu_ring *ring =3D adev->rings[i];
> > > > > +
> > > > > +		if (!ring || !ring->sched.thread)
> > > > > +			continue;
> > > > > +
> > > > > +		cancel_delayed_work_sync(&ring->sched.work_tdr);
> > > > > +	}
> > > > > +}
> > > > I think this is a function that's supposed to be in drm/scheduler, =
not
> > > > here. Might also just be your cleanup code being ordered wrongly, o=
r your
> > > > split in one of the earlier patches not done quite right.
> > > > -Daniel
> > > =

> > > This function iterates across all the schedulers=A0 per amdgpu device=
 and accesses
> > > amdgpu specific structures , drm/scheduler deals with single schedule=
r at most
> > > so looks to me like this is the right place for this function
> > I guess we could keep track of all schedulers somewhere in a list in
> > struct drm_device and wrap this up. That was kinda the idea.
> > =

> > Minimally I think a tiny wrapper with docs for the
> > cancel_delayed_work_sync(&sched->work_tdr); which explains what you must
> > observe to make sure there's no race.
> =

> =

> Will do
> =

> =

> > I'm not exactly sure there's no
> > guarantee here we won't get a new tdr work launched right afterwards at
> > least, so this looks a bit like a hack.
> =

> =

> Note that for any TDR work happening post amdgpu_cancel_all_tdr
> amdgpu_job_timedout->drm_dev_is_unplugged
> will return true and so it will return early. To make it water proof tight
> against race
> i can switch from drm_dev_is_unplugged to drm_dev_enter/exit

Hm that's confusing. You do a work_cancel_sync, so that at least looks
like "tdr work must not run after this point"

If you only rely on drm_dev_enter/exit check with the tdr work, then
there's no need to cancel anything.

For race free cancel_work_sync you need:
1. make sure whatever is calling schedule_work is guaranteed to no longer
call schedule_work.
2. call cancel_work_sync

Anything else is cargo-culted work cleanup:

- 1. without 2. means if a work got scheduled right before it'll still be
  a problem.
- 2. without 1. means a schedule_work right after makes you calling
  cancel_work_sync pointless.

So either both or nothing.
-Daniel

> =

> Andrey
> =

> =

> > -Daniel
> > =

> > > Andrey
> > > =

> > > =

> > > > > +
> > > > >    static void
> > > > >    amdgpu_pci_remove(struct pci_dev *pdev)
> > > > >    {
> > > > >    	struct drm_device *dev =3D pci_get_drvdata(pdev);
> > > > > +	struct amdgpu_device *adev =3D dev->dev_private;
> > > > >    	drm_dev_unplug(dev);
> > > > > +	amdgpu_cancel_all_tdr(adev);
> > > > >    	ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
> > > > >    	amdgpu_driver_unload_kms(dev);
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_job.c
> > > > > index 4720718..87ff0c0 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > > > @@ -28,6 +28,8 @@
> > > > >    #include "amdgpu.h"
> > > > >    #include "amdgpu_trace.h"
> > > > > +#include <drm/drm_drv.h>
> > > > > +
> > > > >    static void amdgpu_job_timedout(struct drm_sched_job *s_job)
> > > > >    {
> > > > >    	struct amdgpu_ring *ring =3D to_amdgpu_ring(s_job->sched);
> > > > > @@ -37,6 +39,12 @@ static void amdgpu_job_timedout(struct drm_sch=
ed_job *s_job)
> > > > >    	memset(&ti, 0, sizeof(struct amdgpu_task_info));
> > > > > +	if (drm_dev_is_unplugged(adev->ddev)) {
> > > > > +		DRM_INFO("ring %s timeout, but device unplugged, skipping.\n",
> > > > > +					  s_job->sched->name);
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > >    	if (amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence=
->parent)) {
> > > > >    		DRM_ERROR("ring %s timeout, but soft recovered\n",
> > > > >    			  s_job->sched->name);
> > > > > -- =

> > > > > 2.7.4
> > > > > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
