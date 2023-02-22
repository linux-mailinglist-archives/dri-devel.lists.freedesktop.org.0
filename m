Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B667569F851
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD6B10EA17;
	Wed, 22 Feb 2023 15:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431E710EA17;
 Wed, 22 Feb 2023 15:50:16 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id t22so8311204oiw.12;
 Wed, 22 Feb 2023 07:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6UHAZZhL11gL8UTjrX5E88IcCEXngYleP44TeQvxj0s=;
 b=YdRvd5v12NrKg99SfPtndyWPurVRX+Kx3nmMpqHLX4atNqYHhwHVGg++kO6dVv5//g
 8g3LU99Zd3nF+s+vrxzZ5airWex5WBaSettImAINg2M6ChB/SHfLhS+271CePJxoWMvt
 WhgvwIeglq1xNcgWbJq16m58R991MBKdhk/PD0chH/FMqTwRJgYzmhGkWY1WE/DUE+4Z
 QJy3H7LSr+RRvR19rqezNf0BEk1U52nLMajRohsSjfejNaung+7edg4JriLocxqazSCF
 7pa3wcEYOwaFsLBlFdPf5QYn7Kpn8zYzZ084OT84P2IhVBCiDzBeIfAzWz0W3RVDrZY3
 2N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6UHAZZhL11gL8UTjrX5E88IcCEXngYleP44TeQvxj0s=;
 b=0QruC5goq45zfLHJE1VFm8jyzREJslUvR7+ofvAbDj0lFuyoQpaWZEV1kKxN0xrEXh
 /Sod4bT1BEgO//DW5CyTKATM4Nu7BvYHIVwZYGLLtxSyBvqHuTDYazAN85YS/VCzoM+N
 YaCWFX7Jxb2+/sHFmz9l6zlOehgh4W0EspPSceWnq4tLv/7hqUfF91gt3NmUoKSzd/6L
 xHS0515iCi2LAoPArhsaO/V/+L9CRgRDIB7c7yqTWAIkrfg1goM0ZM+R1GabKwgZvFwp
 baPBeDEcS1sHy4NtU233TMnP6IPvU9t2OFFcPoO3jGp1uQck6BmAg2K8fK4ZG1HqTGXH
 6JuA==
X-Gm-Message-State: AO0yUKVaS49T6+cySjSZgp9yqq/krBoZFUTVW6cFVeRMe9tvbqLC0z2q
 OtIrJPHFFhL5bWb17qSktj0Zg0HuKIY6QwoJ88s=
X-Google-Smtp-Source: AK7set+c0dy4ImZnheb+bG7g5OkK5ckxlgxd/4GTHy65N9mf+AP7QsVeve9HcZDEG2G1Uo5tQ+esjM06YWfaFAGZ3p4=
X-Received: by 2002:a05:6808:16ab:b0:37d:81a9:5103 with SMTP id
 bb43-20020a05680816ab00b0037d81a95103mr1416311oib.38.1677081015390; Wed, 22
 Feb 2023 07:50:15 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-12-robdclark@gmail.com>
 <a4a72b25-2db3-21c4-c8c0-bb027db59d61@amd.com>
In-Reply-To: <a4a72b25-2db3-21c4-c8c0-bb027db59d61@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Feb 2023 07:50:04 -0800
Message-ID: <CAF6AEGvksxih1zVYrD861uVyp=7SVg+_PmJMZd24fo0Rt6jzmA@mail.gmail.com>
Subject: Re: [PATCH v4 11/14] drm/atomic-helper: Set fence deadline for vblank
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 2:46 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> On 2023-02-18 16:15, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For an atomic commit updating a single CRTC (ie. a pageflip) calculate
> > the next vblank time, and inform the fence(s) of that deadline.
> >
> > v2: Comment typo fix (danvet)
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 36 +++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index d579fd8f7cb8..35a4dc714920 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1511,6 +1511,40 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
> >
> > +/*
> > + * For atomic updates which touch just a single CRTC, calculate the time of the
> > + * next vblank, and inform all the fences of the deadline.
> > + */
> > +static void set_fence_deadline(struct drm_device *dev,
> > +                            struct drm_atomic_state *state)
> > +{
> > +     struct drm_crtc *crtc, *wait_crtc = NULL;
> > +     struct drm_crtc_state *new_crtc_state;
> > +     struct drm_plane *plane;
> > +     struct drm_plane_state *new_plane_state;
> > +     ktime_t vbltime;
>
> I've not looked at the latest language spec, but is AFAIR "vbltime"
> would be uninitialized here. Has this changed?
>
> > +     int i;
> > +
> > +     for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
> > +             if (wait_crtc)
> > +                     return;
> > +             wait_crtc = crtc;
> > +     }
> > +
> > +     /* If no CRTCs updated, then nothing to do: */
> > +     if (!wait_crtc)
> > +             return;
> > +
> > +     if (drm_crtc_next_vblank_time(wait_crtc, &vbltime))
> > +             return;
>
> We have a problem here in that we're adding the time remaining to the next
> vblank event to an uninitialized local variable. As per my comment on patch 10,
> I'd rather drm_crtc_next_vblank_time() yield the time remaining to the vblank event,
> and we can do the arithmetic locally here in this function.

if drm_crtc_next_vblank_time() returns 0 then it has initialized
vbltime, so no problem here

BR,
-R

> --
> Regards,
> Luben
>
> > +
> > +     for_each_new_plane_in_state (state, plane, new_plane_state, i) {
> > +             if (!new_plane_state->fence)
> > +                     continue;
> > +             dma_fence_set_deadline(new_plane_state->fence, vbltime);
> > +     }
> > +}
> > +
> >  /**
> >   * drm_atomic_helper_wait_for_fences - wait for fences stashed in plane state
> >   * @dev: DRM device
> > @@ -1540,6 +1574,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
> >       struct drm_plane_state *new_plane_state;
> >       int i, ret;
> >
> > +     set_fence_deadline(dev, state);
> > +
> >       for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> >               if (!new_plane_state->fence)
> >                       continue;
>
