Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D922A64F0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 14:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB916ED06;
	Wed,  4 Nov 2020 13:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD4D6ED06;
 Wed,  4 Nov 2020 13:20:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d142so2302680wmd.4;
 Wed, 04 Nov 2020 05:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KXLlY1tFPBfYLtF4aKJZ2i7ST3qJcWjmNZ/bwFFMXqU=;
 b=O4iyciNEMiWIZxKDx6zQlIQiYCushdMX3Lj9bORLvxI2E69o+b5pOEh0A+ZFufIqBd
 8txZyQ/aV/ueY3SeZS2WYknWAj336DoeyYcdFuPRWC2aW1yrMt5+3jFOptMvD0DnvPn7
 CQSWLcwuaijvuQFMk0kdyHhYRyUpbdIwi7UXypRWbYfQ+vT08onPzQceEvbg4eaoyePz
 g3bjF/yaLPuxfAcCdXhpjnR8R7nAYJwFNNbwr72rjRIjPDkqZaj/Pfook/gvY6LLA8nW
 JrTAGVbRYYGb78F5REbT+CkuVigKuK2WrI4rSLr66x/Ao++78cqshYtybHseC0tMnhe8
 EkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KXLlY1tFPBfYLtF4aKJZ2i7ST3qJcWjmNZ/bwFFMXqU=;
 b=SW8IhDOHGAzz+HE41j66/SIJHWW4AMFgS2Vbm4fiNoEglC/oirTwgG9f2RqWGvdUWp
 51pQblfpg62Xx9phWgRa+A+GlmGsGp8aidObcAR8Vjw5TB2Y2lsTcMLZaNYtbJ7ZB2d6
 fob5dmjgTSi/QTqolRiVEE2S+HgrxJZXe8vHd0HQ3Kc/CERSqRS52zVcPz/HBf53H6rw
 vEWVb1UbssgVJJ1UeHaBuzMfQOlm7YSIFQW4U3RPLj7jOdE3JoV+hDZkNHAc2eDveK4V
 n5egowQPjvhIyh9a2/hzCHenRjB1fAi64l5aNpmLDasWVfvVn2MdZUwsq87xner1qX7W
 7miQ==
X-Gm-Message-State: AOAM532zrZxkSibp0scbHNpzmL2JMLmHQvrTxX2QAr/cXMMlv/ITEU9R
 i1Za+4JIUZrzIWXCPGPqxZtkNRpC1WpEDWI6O24=
X-Google-Smtp-Source: ABdhPJxqAQqvGMMGWpp0sEtXJ/Qr3ug8dcqlqBhpeDkhlXk4NWf60HnvlHHn3IDlTminMBAMzjLhBmk8G5A4iUy8WMM=
X-Received: by 2002:a05:600c:25a:: with SMTP id
 26mr4546664wmj.39.1604496013810; 
 Wed, 04 Nov 2020 05:20:13 -0800 (PST)
MIME-Version: 1.0
References: <20201103215450.815572-1-alexander.deucher@amd.com>
 <20201104093915.GL401619@phenom.ffwll.local>
In-Reply-To: <20201104093915.GL401619@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Nov 2020 08:20:02 -0500
Message-ID: <CADnq5_NG+xg604Bct96MFY52y=c77TPVtquOc=uQ7Yu1m3CLvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/virt: fix handling of the atomic flag
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 4, 2020 at 4:39 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Nov 03, 2020 at 04:54:50PM -0500, Alex Deucher wrote:
> > Use the per device drm driver feature flags rather than the
> > global one.  This way we can make the drm driver struct const.
> >
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Can we merge this through drm-misc-next so I can follow up with the
> drm_device constification series there? Otherwise I need to sit on that
> for another few weeks until all the backmerges are done.

Sure feel free to add it to your series and merge it with the rest, or
I can merge it now.

Alex


> -Daniel
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> > index d0aea5e39531..8aff6ef50f91 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> > @@ -47,11 +47,13 @@ bool amdgpu_virt_mmio_blocked(struct amdgpu_device *adev)
> >
> >  void amdgpu_virt_init_setting(struct amdgpu_device *adev)
> >  {
> > +     struct drm_device *ddev = adev_to_drm(adev);
> > +
> >       /* enable virtual display */
> >       if (adev->mode_info.num_crtc == 0)
> >               adev->mode_info.num_crtc = 1;
> >       adev->enable_virtual_display = true;
> > -     adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
> > +     ddev->driver_features &= ~DRIVER_ATOMIC;
> >       adev->cg_flags = 0;
> >       adev->pg_flags = 0;
> >  }
> > --
> > 2.25.4
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
