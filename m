Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D728EE65
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 10:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FA36EC1C;
	Thu, 15 Oct 2020 08:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727826EC1C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 08:22:51 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id m11so2117742otk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 01:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RbfF8nokdxqbUPmfp9WHmzX//GvXPuhhpFjfx5IA4wQ=;
 b=T9t6g+yo9ymX56V38aolG1A/9KAXyZikIasm30R3Ko9pDE6EYmLbKUHzK5HXSbKBO5
 qbeM9yPK6Oz+xJGZMEgWEmIggYkYMU2WT+lQRC32PoOW9lfmZBB0rJTUStrIGRbZDE7u
 0WYfEqGYRzSUsx63jezpHV/KBj26eNgLxMvbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RbfF8nokdxqbUPmfp9WHmzX//GvXPuhhpFjfx5IA4wQ=;
 b=Y9OreIVEqqY6LtJKjIzJwBNC+ksWS6Wc+fmrrvtpHUoBk1UAD8AnqQSn/svOFH62x5
 BcqfjSUJ7I6T4DpfFuZz5NtWcm9TcNjjkOXwNFMHNYqc1ObWoSMKfxMJO4T7ONlqBmuY
 34li2iK9lCIB6qBxZLDh99VHH77jDwtDJNJDGClJ6G/rTOeu7vrgWfGPoqFHLJjjA6Ih
 zbYee5yXwrG/IK9UQxmTSaDsdPQY1yR8tL46N9TMuQ83HcVWOv0xEUIubVSaAHOE4gzp
 F4rz6IvpkeJlTMapDG3VYETXcnr/QnKaWLrP5G1aTsOn9MI562P4GfO5E3ny7/6jCbCA
 M1dg==
X-Gm-Message-State: AOAM531UbjZ7zKLwdmr7giv173IxNsz1iF4wArskr/6nu+A8RG2sEJJQ
 B1lLsvOmKl+6gfZwDM9znQgwwO9HjWy5M1ctJ2A8xg==
X-Google-Smtp-Source: ABdhPJxXDNGfotqx0v5QajM2+CxwSI2ZMgsiK/moGuNgteF9MFJDikzgLrlsfcADZyubWdUn1wBehOQaLWfNouKU5kI=
X-Received: by 2002:a05:6830:8b:: with SMTP id
 a11mr1814721oto.303.1602750170682; 
 Thu, 15 Oct 2020 01:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-23-robdclark@gmail.com>
 <20201012144018.GB438822@phenom.ffwll.local>
 <CAF6AEGuZ0QOCbJDTF=FsHsbJ9J5rqLLPJexk_EvX+SxPGFZLDQ@mail.gmail.com>
 <20201013110826.GD438822@phenom.ffwll.local>
 <CAF6AEGvYJS38JjFzJOA3w9W0W_G47DJYw2bi4GsC1qgo3dAZ0A@mail.gmail.com>
In-Reply-To: <CAF6AEGvYJS38JjFzJOA3w9W0W_G47DJYw2bi4GsC1qgo3dAZ0A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Oct 2020 10:22:39 +0200
Message-ID: <CAKMK7uGJ1+Vr-RCHX6=sMwTcOqMNySiHS2fNo8mke4Vraw4rvQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 22/22] drm/msm: Don't implicit-sync if only
 a single ring
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 6:15 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Oct 13, 2020 at 4:08 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Oct 12, 2020 at 08:07:38AM -0700, Rob Clark wrote:
> > > On Mon, Oct 12, 2020 at 7:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Sun, Oct 11, 2020 at 07:09:49PM -0700, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Any cross-device sync use-cases *must* use explicit sync.  And if there
> > > > > is only a single ring (no-preemption), everything is FIFO order and
> > > > > there is no need to implicit-sync.
> > > > >
> > > > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > > > is undefined when fences are not used to synchronize buffer usage across
> > > > > contexts (which is the only case where multiple different priority rings
> > > > > could come into play).
> > > >
> > > > Uh does this mean msm is broken on dri2/3 and wayland? Or I'm I just
> > > > confused by your commit message?
> > >
> > > No, I don't think so.  If there is only a single priority level
> > > ringbuffer (ie. no preemption to higher priority ring) then everything
> > > is inherently FIFO order.
> >
> > Well eventually you get a scheduler I guess/hope :-)
>
> we do have one currently for some gens, but not others.. hence the
> check for # of rings.  (Ie. there is a ring per priority level, if
> only one ring, that means no preemption/scheduler)

Even without preempt a scheduler is somewhat useful, if you have a
very spammy client. Of course it assumes that everyone submits
reasonably short workloads, otherwise nothing you can do.

> > > For cases where we are sharing buffers with something external to drm,
> > > explicit sync will be used.  And we don't implicit sync with display,
> > > otherwise x11 (frontbuffer rendering) would not work
> >
> > Uh now I'm even more confused. The implicit sync fences in dma_resv are
> > kinda for everyone. That's also why dma_resv with the common locking
> > approach is a useful idea.
> >
> > So display should definitely support implicit sync, and iirc msm does have
> > the helper hooked up.
>
> yup
>
> > Wrt other subsystems, I guess passing dma_fence around somehow doesn't fit
> > into v4l (the patches never landed), so v4l doesn't do any kind of sync
> > right now. But this could be fixed. Not sure what else is going on.
> >
> > So I guess I still have no idea why you put that into the commit message.
> >
> > btw for what you're trying to do yourself, the way to do this is to
> > allocate a fence timeline for your engine, compare fences, and no-op them
> > all out if their own the same timeline.
>
> we do that already (with a fence timeline per-ring, in the case of
> gens which support multiple rings / preemption).. this patch just
> short-circuits that in the case where we already knows the fences will
> of the same timeline

Ok so I think it's all good, no misunderstanding, but the commit
message. I think if you delete the first sentence that cross-device
sync must use explicit fences then it all makes sense and is
consistent. Or clarify it that this is cross-engine sync with explicit
internal synchronization, to differentiate it against cross-device
sync (as seen by userspace, like different drm_device instances) and
explicit dma_fence synchronization controlled by userspace.
-Daniel

> BR,
> -R
>
> > -Daniel
> >
> > >
> > > BR,
> > > -R
> > >
> > > > Since for these protocols we do expect implicit sync accross processes to
> > > > work. Even across devices (and nvidia have actually provided quite a bunch
> > > > of patches to make this work in i915 - ttm based drivers get this right,
> > > > plus dumb scanout drivers using the right helpers also get this all
> > > > right).
> > > > -Daniel
> > > >
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > index 3151a0ca8904..c69803ea53c8 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > @@ -277,7 +277,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > > > >  {
> > > > >       int i, ret = 0;
> > > > >
> > > > > @@ -297,7 +297,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > >                               return ret;
> > > > >               }
> > > > >
> > > > > -             if (no_implicit)
> > > > > +             if (!implicit_sync)
> > > > >                       continue;
> > > > >
> > > > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > > @@ -768,7 +768,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > > >       if (ret)
> > > > >               goto out;
> > > > >
> > > > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > >       if (ret)
> > > > >               goto out;
> > > > >
> > > > > --
> > > > > 2.26.2
> > > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
