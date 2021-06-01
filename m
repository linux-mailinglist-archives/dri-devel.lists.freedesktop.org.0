Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C133976F1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 17:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D126E8C6;
	Tue,  1 Jun 2021 15:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353B46E81F;
 Tue,  1 Jun 2021 15:42:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 o2-20020a05600c4fc2b029019a0a8f959dso2203962wmq.1; 
 Tue, 01 Jun 2021 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ej3vlHeKK1+uQ8+If+YtX+yV0AeomMPg/9tYvhXhlPE=;
 b=CxMW+c3L3LN09Ja/Gp1nCIEMlaF9lzN1sjUuZlg7SuItpgg/3DTnB+FedhwxEQZh0Y
 qwQ55cSDvxXetARJDYA317Z72y/NcwOqs99DDzfsuAk3rsUcPNOy6ho/kd77pP3KJryO
 Z+fpP2KrQyJNy/whNf3NmFYq8vWRu0O+CraTKsj1M3EpEscqFxnQe2r7P42GKofrrDXl
 CoC3sZ6bVKaF2J50CtjISgqzYU5BCpuyBX2KN51MddYptEtcjxm1d1LR+LQT4ynqZs49
 6kcxnxhcN9dovPl+V3iWC9khbuTw5SIFB5u2kvTe3XbdzW3kiBeFEMPf7ibPqIRJrmmh
 IQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ej3vlHeKK1+uQ8+If+YtX+yV0AeomMPg/9tYvhXhlPE=;
 b=QtAPoXS+qgVq171Nr09h0oINumHLlLrH7JBrLsC/JfviiLsKj3Sx+EHeTVrUo+VD2y
 E6D6uO2bDOHtRqYbtw2YTeJYnUwM8Dq1UstEOH8u4gNZwHX08rd7a4/zb60Ywt913trb
 A/xPXdEmW6/mqGlb3dRIbFWL4clpRSN203yY1Ar9sSv6fvxCzj6OrBQLKyzZyAhZ1XDV
 nSBrArNznT1xfgrN+cWTiVmdT6TDXyl2FpeCZ3jVeNUi6DTuxY+XzbVbgjwBrj/MJQ/d
 oQuwp4cjbDWvydqPcbitnWRqsXLP9rjt6vrwVgsCm7KpsJ1KLpTxb/xhJ1CDV11OvLXT
 iR7w==
X-Gm-Message-State: AOAM5311r+yXC3i+byoo+E7snSYw8jVkwTvE+fL0y6zByoviuewRTWFa
 QeV2+7bb6S2T5TIfobD7973RvrCgJy/g5u4W+Jw=
X-Google-Smtp-Source: ABdhPJzEaksrb+hHKQ9SPfqQ+6MhwcSJ2MqH5GsyPc/+E5hCwuMuCX5aXcRibJVEJkvPlTtRLTBbviOQEFeTLqTYJzY=
X-Received: by 2002:a1c:23d6:: with SMTP id j205mr564816wmj.94.1622562142833; 
 Tue, 01 Jun 2021 08:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-3-robdclark@gmail.com>
 <YKaOY3AWgHh5kplS@phenom.ffwll.local>
 <CAF6AEGv470U7fujLrJOE8fJh1o-BW3=mOpKJ45FFz=Xb8Q0D6A@mail.gmail.com>
 <YLZBzKlb7xpJaG4+@phenom.ffwll.local>
In-Reply-To: <YLZBzKlb7xpJaG4+@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 1 Jun 2021 08:46:14 -0700
Message-ID: <CAF6AEGvcFMejnN1032+=9E=8f2=E4CpqHiARHHQ_Bin+f5DQTg@mail.gmail.com>
Subject: Re: [RFC 2/3] drm/atomic: Call dma_fence_boost() when we've missed a
 vblank
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 open list <linux-kernel@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 1, 2021 at 7:18 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, May 30, 2021 at 07:33:57AM -0700, Rob Clark wrote:
> > On Thu, May 20, 2021 at 9:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, May 19, 2021 at 11:38:53AM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
> > > >  1 file changed, 11 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > > index 560aaecba31b..fe10fc2e7f86 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > @@ -1435,11 +1435,15 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
> > > >       int i, ret;
> > > >
> > > >       for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> > > > +             u64 vblank_count;
> > > > +
> > > >               if (!new_plane_state->fence)
> > > >                       continue;
> > > >
> > > >               WARN_ON(!new_plane_state->fb);
> > > >
> > > > +             vblank_count = drm_crtc_vblank_count(new_plane_state->crtc);
> > > > +
> > > >               /*
> > > >                * If waiting for fences pre-swap (ie: nonblock), userspace can
> > > >                * still interrupt the operation. Instead of blocking until the
> > > > @@ -1449,6 +1453,13 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
> > > >               if (ret)
> > > >                       return ret;
> > > >
> > > > +             /*
> > > > +              * Check if we've missed a vblank while waiting, and if we have
> > > > +              * signal the fence that it's signaler should be boosted
> > > > +              */
> > > > +             if (vblank_count != drm_crtc_vblank_count(new_plane_state->crtc))
> > > > +                     dma_fence_boost(new_plane_state->fence);
> > >
> > > I think we should do a lot better here:
> > > - maybe only bother doing this for single-crtc updates, and only if
> > >   modeset isn't set. No one else cares about latency.
> > >
> > > - We should boost _right_ when we've missed the frame, so I think we
> > >   should have a _timeout wait here that guesstimates when the vblank is
> > >   over (might need to throw in a vblank wait if we missed) and then boost
> > >   immediately. Not wait a bunch of frames (worst case) until we finally
> > >   decide to boost.
> >
> > I was thinking about this a bit more.. How about rather than calling
> > some fence->op->boost() type thing when we are about to miss a vblank
> > (IMO that is also already too late), we do something more like
> > fence->ops->set_deadline() before we even wait?
>
> Hm yeah that sounds like a clean idea.
>
> Even more, why not add the deadline/waiter information to the callback
> we're adding? That way drivers can inspect it whenever they feel like and
> don't have to duplicate the tracking. And it's probably easier to
> tune/adjust to the myriads of use-cases (flip target miss, userspace wait,
> wakeup boost maybe too ...).

You mean, enumerate the types of deadline?

For userspace waits, we might have a timeout, but not really
(currently) any more information than that?  The vblank deadline is
the only type of deadline that seems pretty clear to me.

I suppose we could do something like:

   dma_fence_set_deadline(fence, &(struct dma_fence_deadline){
           .type = DMA_FENCE_DEADLINE_VBLANK,
           .time = next_vblank_ktime,
       });

to make it a bit more extensible to add more deadline types or
additional optional information

BR,
-R

>
> I like this direction a lot more than what we discussed with post-miss
> hints thus far.
>
> > It's probably a bit impossible for a gpu driver to really predict how
> > long some rendering will take, but other cases like video decoder are
> > somewhat more predictable.. the fence provider could predict given the
> > remaining time until the deadline what clk rates are required to get
> > you there.
>
> Well if we do have a deadline the driver can note that in its scheduler
> and arm a driver to kick the clocks. Or maybe use past history to do this
> upfront.
> -Daniel
>
> >
> > BR,
> > -R
> >
> >
> > >
> > > Otherwise I really like this, I think it's about the only real reason i915
> > > isn't using atomic helpers.
> > >
> > > Also adding Matt B for this topic.
> > > -Daniel
> > >
> > > > +
> > > >               dma_fence_put(new_plane_state->fence);
> > > >               new_plane_state->fence = NULL;
> > > >       }
> > > > --
> > > > 2.30.2
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
