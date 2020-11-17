Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3832B6DD3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 19:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FAA89F75;
	Tue, 17 Nov 2020 18:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1430089F75
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 18:52:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p22so4267967wmg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 10:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7UbF8AsuXhmH7wj3v5E+j02/l27HWDFdddsF4hBpbcU=;
 b=SO3r2NfpD0W35LjzVQdmOQdmmSsJN64kcnM6TUlOAWoLWezgkkebb81zyIkwtFRA8a
 yfeETJRrUFan/JprZgq5cR8RFLqIH4dE0vlql9P63JO/E70lNJzWzxd4rSeWkRisQEHN
 y3EIMICc/8rmPcarHLdY9DiGvgmuOCGXULqk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7UbF8AsuXhmH7wj3v5E+j02/l27HWDFdddsF4hBpbcU=;
 b=Fk0pDfIkM4Y13WXaxl6vARp8czGo8b1QcvSlz0vnJGdPTZEQO7HgwOEUhfCyGJL7B2
 dtJ1kkT4vr0sv72DXjJzrUCcxzV1cdRH6Ffjohnkwopel3dI1b/Crgi5tD9dCP1ZEh7L
 86xP6iTg3eGSrfzwS+49bTZu+hZRgG6+DF1JHsa7rGz1wlPrSIxD7ljtTXQgmw/UmNtS
 ko8bDulAr1WdfIK5YH84QHLJ2pFxhd9Edr6j3PQ4ClNIhFpDmFM37krCsOcgM2zBYtUW
 1EXBeMk6pwZCxYEAw77fRC31YwCtfbiVhdPBPGwVDdKt7Fxe7cz8sxiYe1PvA4yh+yfT
 gkrQ==
X-Gm-Message-State: AOAM5337kX2EDEgQNguzh/gxFKf0qFpE/Zy2tEt0ZUqcyYqIKMMGyEl1
 PsAQKzzqJT1FRagzQfM6LZ2gCg==
X-Google-Smtp-Source: ABdhPJzgYRn5jxUAp30dl2yqJbQbxPPgL58LS+mHCqZTups/OoVFGJuwxvS4nsEcqoNmErSsAV1F4Q==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr529787wmi.174.1605639177797; 
 Tue, 17 Nov 2020 10:52:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t17sm4906351wmi.3.2020.11.17.10.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 10:52:57 -0800 (PST)
Date: Tue, 17 Nov 2020 19:52:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
Message-ID: <20201117185255.GP401619@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095345.GF20149@phenom.ffwll.local>
 <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
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

On Tue, Nov 17, 2020 at 01:38:14PM -0500, Andrey Grodzovsky wrote:
> =

> On 6/22/20 5:53 AM, Daniel Vetter wrote:
> > On Sun, Jun 21, 2020 at 02:03:08AM -0400, Andrey Grodzovsky wrote:
> > > No point to try recovery if device is gone, just messes up things.
> > > =

> > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 16 ++++++++++++++++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  8 ++++++++
> > >   2 files changed, 24 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_drv.c
> > > index 6932d75..5d6d3d9 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > @@ -1129,12 +1129,28 @@ static int amdgpu_pci_probe(struct pci_dev *p=
dev,
> > >   	return ret;
> > >   }
> > > +static void amdgpu_cancel_all_tdr(struct amdgpu_device *adev)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
> > > +		struct amdgpu_ring *ring =3D adev->rings[i];
> > > +
> > > +		if (!ring || !ring->sched.thread)
> > > +			continue;
> > > +
> > > +		cancel_delayed_work_sync(&ring->sched.work_tdr);
> > > +	}
> > > +}
> > I think this is a function that's supposed to be in drm/scheduler, not
> > here. Might also just be your cleanup code being ordered wrongly, or yo=
ur
> > split in one of the earlier patches not done quite right.
> > -Daniel
> =

> =

> This function iterates across all the schedulers=A0 per amdgpu device and=
 accesses
> amdgpu specific structures , drm/scheduler deals with single scheduler at=
 most
> so looks to me like this is the right place for this function

I guess we could keep track of all schedulers somewhere in a list in
struct drm_device and wrap this up. That was kinda the idea.

Minimally I think a tiny wrapper with docs for the
cancel_delayed_work_sync(&sched->work_tdr); which explains what you must
observe to make sure there's no race. I'm not exactly sure there's no
guarantee here we won't get a new tdr work launched right afterwards at
least, so this looks a bit like a hack.
-Daniel

> =

> Andrey
> =

> =

> > =

> > > +
> > >   static void
> > >   amdgpu_pci_remove(struct pci_dev *pdev)
> > >   {
> > >   	struct drm_device *dev =3D pci_get_drvdata(pdev);
> > > +	struct amdgpu_device *adev =3D dev->dev_private;
> > >   	drm_dev_unplug(dev);
> > > +	amdgpu_cancel_all_tdr(adev);
> > >   	ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
> > >   	amdgpu_driver_unload_kms(dev);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_job.c
> > > index 4720718..87ff0c0 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > @@ -28,6 +28,8 @@
> > >   #include "amdgpu.h"
> > >   #include "amdgpu_trace.h"
> > > +#include <drm/drm_drv.h>
> > > +
> > >   static void amdgpu_job_timedout(struct drm_sched_job *s_job)
> > >   {
> > >   	struct amdgpu_ring *ring =3D to_amdgpu_ring(s_job->sched);
> > > @@ -37,6 +39,12 @@ static void amdgpu_job_timedout(struct drm_sched_j=
ob *s_job)
> > >   	memset(&ti, 0, sizeof(struct amdgpu_task_info));
> > > +	if (drm_dev_is_unplugged(adev->ddev)) {
> > > +		DRM_INFO("ring %s timeout, but device unplugged, skipping.\n",
> > > +					  s_job->sched->name);
> > > +		return;
> > > +	}
> > > +
> > >   	if (amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->par=
ent)) {
> > >   		DRM_ERROR("ring %s timeout, but soft recovered\n",
> > >   			  s_job->sched->name);
> > > -- =

> > > 2.7.4
> > > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
