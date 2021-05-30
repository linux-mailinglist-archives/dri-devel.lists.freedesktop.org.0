Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56439514D
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 16:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508656E0FF;
	Sun, 30 May 2021 14:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415AC6E0F6;
 Sun, 30 May 2021 14:30:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n2so8217405wrm.0;
 Sun, 30 May 2021 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6t3J8+C30P/KwAn8557WaaRrcOqXcNIb28Eid5rS1Ss=;
 b=uDiPnuGhAkjMt19s6NVzVAetw8pr0xYSnhO63poVhU4hCJOekF0HGoE4aMDYoqR33N
 HRnpfTNujtuSGbWd9ANiJ/MF2XYmKGk+xiSv859C/IgmNHliyXuCdL1CwK4PIlbM0DVS
 SQo21M/DhdMadVTLrl8mKwQvsI6fv/Y4LkRS7cg4LEyQh7xjHJlaJSFvqnJUQ8cx9C5L
 BQWIo4ueeTzmuvrnd6Mk4KB+Oqg9OjemlXdXCJkG7PU3ChMLYMqy/5PcbsYsWiV5xtVA
 wxsYZ+Ju/LbkKSTGgfya9Dho3Kq8auLYeaBWuoyu9EdTPGKwLg5wIcg7SCpaDiikQ9WH
 ptfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6t3J8+C30P/KwAn8557WaaRrcOqXcNIb28Eid5rS1Ss=;
 b=FpUwIH9UsvxHrwz71SNXkUNe1kei0Q1AkBj1Tlr80PDdlA0joK5SLSycyugZqq1STo
 PdqrkEgZ0fRbwdZ5ZbgzsI3hgYixDZSazaRO1tmiOzg/zqG3o+HOu4Iqm3p0mRmF+tgl
 h459ZTIJmoJR6ENoYK74vr7MLFm6BnnyvHZtDs4+q0+SrYBjuHWf4z61NqNCNZivWNp0
 w9O2P7PAjIg7OBWdUeh3f00MmY/U/8VbwIEgkb+wnA6Xyo8CNuxRHJMd+aLMJUcHHysM
 pMSrG0v9zZwxkY2GCsbq4T0hSpuMkLzzifO9r+ONOuvK9upIGhCQPYeEYGorOOf8QUP+
 0aIw==
X-Gm-Message-State: AOAM531QUuQkj+M5TzGiO9SuxWARMDa8+GaovdVsp4F5AHI8ZmngtpVw
 TgMrRG6dEl2F295bwhchXdA2XHaw+tlBk74mWn8=
X-Google-Smtp-Source: ABdhPJyDbitDVrmcDxOcHq0QHKT9fgqlgjU/u0BkC/alWsIcIKmfMJVN5yDHNrVFHPZFfjLaelLOvJ4wRSV8TgEQBok=
X-Received: by 2002:adf:ec10:: with SMTP id x16mr9704649wrn.83.1622385005776; 
 Sun, 30 May 2021 07:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-3-robdclark@gmail.com>
 <YKaOY3AWgHh5kplS@phenom.ffwll.local>
In-Reply-To: <YKaOY3AWgHh5kplS@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 30 May 2021 07:33:57 -0700
Message-ID: <CAF6AEGv470U7fujLrJOE8fJh1o-BW3=mOpKJ45FFz=Xb8Q0D6A@mail.gmail.com>
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

On Thu, May 20, 2021 at 9:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, May 19, 2021 at 11:38:53AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 560aaecba31b..fe10fc2e7f86 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1435,11 +1435,15 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
> >       int i, ret;
> >
> >       for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> > +             u64 vblank_count;
> > +
> >               if (!new_plane_state->fence)
> >                       continue;
> >
> >               WARN_ON(!new_plane_state->fb);
> >
> > +             vblank_count = drm_crtc_vblank_count(new_plane_state->crtc);
> > +
> >               /*
> >                * If waiting for fences pre-swap (ie: nonblock), userspace can
> >                * still interrupt the operation. Instead of blocking until the
> > @@ -1449,6 +1453,13 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
> >               if (ret)
> >                       return ret;
> >
> > +             /*
> > +              * Check if we've missed a vblank while waiting, and if we have
> > +              * signal the fence that it's signaler should be boosted
> > +              */
> > +             if (vblank_count != drm_crtc_vblank_count(new_plane_state->crtc))
> > +                     dma_fence_boost(new_plane_state->fence);
>
> I think we should do a lot better here:
> - maybe only bother doing this for single-crtc updates, and only if
>   modeset isn't set. No one else cares about latency.
>
> - We should boost _right_ when we've missed the frame, so I think we
>   should have a _timeout wait here that guesstimates when the vblank is
>   over (might need to throw in a vblank wait if we missed) and then boost
>   immediately. Not wait a bunch of frames (worst case) until we finally
>   decide to boost.

I was thinking about this a bit more.. How about rather than calling
some fence->op->boost() type thing when we are about to miss a vblank
(IMO that is also already too late), we do something more like
fence->ops->set_deadline() before we even wait?

It's probably a bit impossible for a gpu driver to really predict how
long some rendering will take, but other cases like video decoder are
somewhat more predictable.. the fence provider could predict given the
remaining time until the deadline what clk rates are required to get
you there.

BR,
-R


>
> Otherwise I really like this, I think it's about the only real reason i915
> isn't using atomic helpers.
>
> Also adding Matt B for this topic.
> -Daniel
>
> > +
> >               dma_fence_put(new_plane_state->fence);
> >               new_plane_state->fence = NULL;
> >       }
> > --
> > 2.30.2
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
