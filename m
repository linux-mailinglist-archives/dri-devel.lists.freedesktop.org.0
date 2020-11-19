Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171382B9632
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5E689A61;
	Thu, 19 Nov 2020 15:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ACA89A61
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:29:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k2so6919810wrx.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=du/XZLhELlOGLcoo1QiqkS84fYpPAz0Q6FUDJggJGHo=;
 b=JYY7pbjrnjtxWvIEZdNqtd4/ltrWyulI3GtPgvnv+72isEZgxkjSy3G/Lvr/l83Tfv
 5LdHPbege5B51PNCV/pcnBScTdOIgI6jaW7mpM71tGzDrXVqAwbzgjidnGMF3ymjHoMh
 XbzzXKkL/O4wcdDg+hTp3yV5b1QLocm+k0edg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=du/XZLhELlOGLcoo1QiqkS84fYpPAz0Q6FUDJggJGHo=;
 b=B9yTdXMNK8v9yJFxdH7qQS3w8T2XUsypeWdj3ssrLnCoo5YC8SblUveR8j0Mgj4ePk
 XL3OX38tUdgQH79ieZzdh4H3llHRhuKWkicXJPiubqo+dgcgQoMTurBb+D5B8TWeIM0v
 NPIF335J0lQQffrrcpqd4m/d8RL2X60+B1LfNeIDdN78ky0p0b6/AsfJep/nKHAYJVGd
 8lPY7RSZP0i0/gloLVudaoNgGdwTNGeHm0wf3NQHPeSDpDFi4mFqLCMp6rKwHF9LrcTB
 etohwmeR83jKoPMvOg/iuxwRjqDqvOddNY8LXStOcZkP18i3F5BLf0EHj/INgfojTRQa
 q6TA==
X-Gm-Message-State: AOAM533gdjlQLvh+9D1nBbojXxGNnsZEZYh+w8xFpK8Ql1VRKzdASrw9
 D7t9fiRsHW7k9t1U5QNzq8GoQA==
X-Google-Smtp-Source: ABdhPJxsdu5zTD1prq2edk3j9DnTcHIyPtkdH4hHBI8JrZtrCTEIVuDqw8sexG23iag9C3e2iA4zjA==
X-Received: by 2002:a5d:510a:: with SMTP id s10mr10661109wrt.402.1605799794915; 
 Thu, 19 Nov 2020 07:29:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n10sm173181wrx.9.2020.11.19.07.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 07:29:54 -0800 (PST)
Date: Thu, 19 Nov 2020 16:29:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
Message-ID: <20201119152951.GD401619@phenom.ffwll.local>
References: <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
 <20201117185255.GP401619@phenom.ffwll.local>
 <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
 <20201117194922.GW401619@phenom.ffwll.local>
 <064ef461-8f59-2eb8-7777-6ff5b8d28cdd@amd.com>
 <CAKMK7uF9uvT09zDb6fS0j68fWrq2qV7h_JQAt8vpaGPJ1d64cQ@mail.gmail.com>
 <d0a3ee49-64f3-a223-7e84-0c8eb3481f61@gmail.com>
 <e462f296-75d0-316a-e30f-c985e7aac88d@amd.com>
 <f65c5d45-8cb2-fde1-1785-756088aa95d5@gmail.com>
 <d67bcb18-c26c-542c-3fbb-67c69c0980b5@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d67bcb18-c26c-542c-3fbb-67c69c0980b5@amd.com>
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 10:02:28AM -0500, Andrey Grodzovsky wrote:
> =

> On 11/19/20 2:55 AM, Christian K=F6nig wrote:
> > Am 18.11.20 um 17:20 schrieb Andrey Grodzovsky:
> > > =

> > > On 11/18/20 7:01 AM, Christian K=F6nig wrote:
> > > > Am 18.11.20 um 08:39 schrieb Daniel Vetter:
> > > > > On Tue, Nov 17, 2020 at 9:07 PM Andrey Grodzovsky
> > > > > <Andrey.Grodzovsky@amd.com> wrote:
> > > > > > =

> > > > > > On 11/17/20 2:49 PM, Daniel Vetter wrote:
> > > > > > > On Tue, Nov 17, 2020 at 02:18:49PM -0500, Andrey Grodzovsky w=
rote:
> > > > > > > > On 11/17/20 1:52 PM, Daniel Vetter wrote:
> > > > > > > > > On Tue, Nov 17, 2020 at 01:38:14PM -0500, Andrey Grodzovs=
ky wrote:
> > > > > > > > > > On 6/22/20 5:53 AM, Daniel Vetter wrote:
> > > > > > > > > > > On Sun, Jun 21, 2020 at 02:03:08AM -0400, Andrey Grod=
zovsky wrote:
> > > > > > > > > > > > No point to try recovery if device is gone, just me=
sses up things.
> > > > > > > > > > > > =

> > > > > > > > > > > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky=
@amd.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > > =A0=A0=A0=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.=
c | 16 ++++++++++++++++
> > > > > > > > > > > > =A0=A0=A0=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_job.=
c | 8 ++++++++
> > > > > > > > > > > > =A0=A0=A0=A0 2 files changed, 24 insertions(+)
> > > > > > > > > > > > =

> > > > > > > > > > > > diff --git
> > > > > > > > > > > > a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > > > > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > > > > > > > > index 6932d75..5d6d3d9 100644
> > > > > > > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > > > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > > > > > > > > @@ -1129,12 +1129,28 @@ static
> > > > > > > > > > > > int amdgpu_pci_probe(struct
> > > > > > > > > > > > pci_dev *pdev,
> > > > > > > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > > > > > > > > > > =A0=A0=A0=A0 }
> > > > > > > > > > > > +static void amdgpu_cancel_all_tdr(struct amdgpu_de=
vice *adev)
> > > > > > > > > > > > +{
> > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 int i;
> > > > > > > > > > > > +
> > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < AMDGPU_MAX=
_RINGS; ++i) {
> > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 stru=
ct amdgpu_ring *ring =3D adev->rings[i];
> > > > > > > > > > > > +
> > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (=
!ring || !ring->sched.thread)
> > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > > > > > > > > > +
> > > > > > > > > > > > + cancel_delayed_work_sync(&ring->sched.work_tdr);
> > > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > > > > > +}
> > > > > > > > > > > I think this is a function that's supposed to be in d=
rm/scheduler, not
> > > > > > > > > > > here. Might also just be your
> > > > > > > > > > > cleanup code being ordered wrongly,
> > > > > > > > > > > or your
> > > > > > > > > > > split in one of the earlier patches not done quite ri=
ght.
> > > > > > > > > > > -Daniel
> > > > > > > > > > This function iterates across all the
> > > > > > > > > > schedulers per amdgpu device and
> > > > > > > > > > accesses
> > > > > > > > > > amdgpu specific structures ,
> > > > > > > > > > drm/scheduler deals with single
> > > > > > > > > > scheduler at most
> > > > > > > > > > so looks to me like this is the right place for this fu=
nction
> > > > > > > > > I guess we could keep track of all schedulers somewhere i=
n a list in
> > > > > > > > > struct drm_device and wrap this up. That was kinda the id=
ea.
> > > > > > > > > =

> > > > > > > > > Minimally I think a tiny wrapper with docs for the
> > > > > > > > > cancel_delayed_work_sync(&sched->work_tdr); which explain=
s what you must
> > > > > > > > > observe to make sure there's no race.
> > > > > > > > Will do
> > > > > > > > =

> > > > > > > > =

> > > > > > > > > I'm not exactly sure there's no
> > > > > > > > > guarantee here we won't get a new tdr work launched right=
 afterwards at
> > > > > > > > > least, so this looks a bit like a hack.
> > > > > > > > Note that for any TDR work happening post amdgpu_cancel_all=
_tdr
> > > > > > > > amdgpu_job_timedout->drm_dev_is_unplugged
> > > > > > > > will return true and so it will return early. To make it wa=
ter proof tight
> > > > > > > > against race
> > > > > > > > i can switch from drm_dev_is_unplugged to drm_dev_enter/exit
> > > > > > > Hm that's confusing. You do a work_cancel_sync, so that at le=
ast looks
> > > > > > > like "tdr work must not run after this point"
> > > > > > > =

> > > > > > > If you only rely on drm_dev_enter/exit check with the tdr wor=
k, then
> > > > > > > there's no need to cancel anything.
> > > > > > =

> > > > > > Agree, synchronize_srcu from drm_dev_unplug should play the role
> > > > > > of 'flushing' any earlier (in progress) tdr work which is
> > > > > > using drm_dev_enter/exit pair. Any later arising tdr
> > > > > > will terminate early when
> > > > > > drm_dev_enter
> > > > > > returns false.
> > > > > Nope, anything you put into the work itself cannot close this rac=
e.
> > > > > It's the schedule_work that matters here. Or I'm missing somethin=
g ...
> > > > > I thought that the tdr work you're cancelling here is launched by
> > > > > drm/scheduler code, not by the amd callback?
> > > =

> > > =

> > > My bad, you are right, I am supposed to put drm_dev_enter.exit pair
> > > into drm_sched_job_timedout
> > > =

> > > =

> > > > =

> > > > Yes that is correct. Canceling the work item is not the right
> > > > approach at all, nor is adding dev_enter/exit pair in the
> > > > recovery handler.
> > > =

> > > =

> > > Without adding the dev_enter/exit guarding pair in the recovery
> > > handler you are ending up with GPU reset starting while
> > > the device is already unplugged, this leads to multiple errors and ge=
neral mess.
> > > =

> > > =

> > > > =

> > > > What we need to do here is to stop the scheduler thread and then
> > > > wait for any timeout handling to have finished.
> > > > =

> > > > Otherwise it can scheduler a new timeout just after we have cancele=
d this one.
> > > > =

> > > > Regards,
> > > > Christian.
> > > =

> > > =

> > > Schedulers are stopped from amdgpu_driver_unload_kms which indeed
> > > happens after drm_dev_unplug
> > > so yes, there is still a chance for new work being scheduler and
> > > timeout armed after but, once i fix the code
> > > to place drm_dev_enter/exit pair into drm_sched_job_timeout I don't
> > > see why that not a good solution ?
> > =

> > Yeah that should work as well, but then you also don't need to cancel
> > the work item from the driver.
> =

> =

> Indeed, as Daniel pointed out no need and I dropped it. One correction - I
> previously said that w/o
> dev_enter/exit guarding pair in scheduler's TO handler you will get GPU
> reset starting while device already gone -
> of course this is not fully preventing this as the device can be extracted
> at any moment just after we
> already entered GPU recovery. But it does saves us processing a futile=A0=
 GPU
> recovery which always
> starts once you unplug the device if there are active gobs in progress at
> the moment and so I think it's
> still justifiable to keep the dev_enter/exit guarding pair there.

Yeah sprinkling drm_dev_enter/exit over the usual suspect code paths like
tdr to make the entire unloading much faster makes sense. Waiting for
enormous amounts of mmio ops to time out isn't fun. A comment might be
good for that though, to explain why we're doing that.
-Daniel

> =

> Andrey
> =

> =

> > =

> > =

> > > Any tdr work started after drm_dev_unplug finished will simply abort
> > > on entry to drm_sched_job_timedout
> > > because drm_dev_enter will be false and the function will return
> > > without rearming the timeout timer and
> > > so will have no impact.
> > > =

> > > The only issue i see here now is of possible use after free if some
> > > late tdr work will try to execute after
> > > drm device already gone, for this we probably should add
> > > cancel_delayed_work_sync(sched.work_tdr)
> > > to drm_sched_fini after sched->thread is stopped there.
> > =

> > Good point, that is indeed missing as far as I can see.
> > =

> > Christian.
> > =

> > > =

> > > Andrey
> > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
