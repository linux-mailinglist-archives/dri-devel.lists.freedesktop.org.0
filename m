Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEC269F84C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F103E10EA1B;
	Wed, 22 Feb 2023 15:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DC310EA26;
 Wed, 22 Feb 2023 15:48:26 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-17213c961dfso9653391fac.0; 
 Wed, 22 Feb 2023 07:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WIODxKaZNfL4fwslKYd7hOIM/6nmDjWBdUykTwKKB1s=;
 b=V95x3BlvB8iT9s1Zm/s5NwaXnZJ5pJH1zDWkkw3AN8U987/2vtYPhG6kIjAshVN4Dx
 fMc0QmnxXz4K1BWSBmzxCJitBbBMkC+vrIvAAbtNfAH5uPSqvTmV3f5Bp2wbkOGORlDX
 9OFm2EahsZgXNSwEw1b7z+/J+7xeTxgCCa/dNQUZcMuyglq7RVyoa0c8U0AD8NvbZiMY
 HCsUj7dP6ml2JHCiAmVKzLYebTKxR3x0kTrP35Zn9MutGplI+x5HBo10371F7fnovbIl
 7LOwkYzYlNqVY/QMdVuYYdqLJEx7W99izmjqPaT1xIo49TQ7A0xzopCpBU0snFJNEN1Y
 E7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WIODxKaZNfL4fwslKYd7hOIM/6nmDjWBdUykTwKKB1s=;
 b=MU/ZSbYaoS722vqC9NUCgrp6d4Z1floDyemZ2zIpW2w1hqHCuxZb8ycG6hJVmLyGGq
 ydV9paIFl8Xhwhhi4JYu5YrihK8+tIEwqOgllMfjmXzvH9luqAEZ9js/GT2jErBrX66h
 GzBxvr7R4GksJNOvE6ornAS0pDzc/36Bo+cobIordKCVHYPReELBsivUY3aU7QszzHTH
 x6jMuJ1+VLnikcykfCrfYBEH3mz9/cK1wZgjU3MrI0gb2nFlZLVfvInLR4zTD8j1BGrx
 piETONgwZtU7P6wZWr6pdymA48ukVOaWgVA1Lbh/TVD4+bWCjOGYmVu0ubroJ9CaAcsu
 aFcA==
X-Gm-Message-State: AO0yUKUkeCUZszW6lA40xfH/7muVpA3TyhbwfWGCZMN/LG+RN7HcQUIS
 7VW8St28vvV5BSTAXGaw9rwr1XIZ5vPWS2l18aNBNsNjhpY=
X-Google-Smtp-Source: AK7set9vvMT13wVoInnhoPbA0XKpPFlOK6tu3llzxDttE3XichZT68mvUN2/6c2Jx7Zip1xhAeTqyrNWildOXfC0Dms=
X-Received: by 2002:a05:6870:808d:b0:16e:8a56:d0d2 with SMTP id
 q13-20020a056870808d00b0016e8a56d0d2mr1363347oab.38.1677080905259; Wed, 22
 Feb 2023 07:48:25 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-11-robdclark@gmail.com>
 <7f18a41d-e8e2-52db-2fe3-2463144fc48c@amd.com>
In-Reply-To: <7f18a41d-e8e2-52db-2fe3-2463144fc48c@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Feb 2023 07:48:14 -0800
Message-ID: <CAF6AEGt691H_NYNXCVa-ESADYGDORJPtU=rr7absCzW29RnRHg@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] drm/vblank: Add helper to get next vblank time
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 2:37 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> On 2023-02-18 16:15, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Will be used in the next commit to set a deadline on fences that an
> > atomic update is waiting on.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++++
> >  include/drm/drm_vblank.h     |  1 +
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index 2ff31717a3de..caf25ebb34c5 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> >  }
> >  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> >
> > +/**
> > + * drm_crtc_next_vblank_time - calculate the time of the next vblank
> > + * @crtc: the crtc for which to calculate next vblank time
> > + * @vblanktime: pointer to time to receive the next vblank timestamp.
> > + *
> > + * Calculate the expected time of the next vblank based on time of previous
> > + * vblank and frame duration
> > + */
> > +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime)
> > +{
> > +     unsigned int pipe = drm_crtc_index(crtc);
> > +     struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
> > +     u64 count;
> > +
> > +     if (!vblank->framedur_ns)
> > +             return -EINVAL;
> > +
> > +     count = drm_vblank_count_and_time(crtc->dev, pipe, vblanktime);
> > +
> > +     /*
> > +      * If we don't get a valid count, then we probably also don't
> > +      * have a valid time:
> > +      */
> > +     if (!count)
> > +             return -EINVAL;
> > +
> > +     *vblanktime = ktime_add(*vblanktime, ns_to_ktime(vblank->framedur_ns));
>
> I'd rather this not do any arithmetic, i.e. add, and simply return the calculated
> remaining time, i.e. time left--so instead of add, it would simply assign
> the remaining time, and possibly rename the vblanktime to something like "time_to_vblank."
>

Note that since I sent the last iteration, I've renamed it to
drm_crtc_next_vblank_start().

I would prefer to keep the arithmetic, because I have another use for
this helper in drm/msm (for async/cursor updates, where we want to set
an hrtimer for start of vblank).  It is a bit off the topic of this
series, but I can include the patch when I repost.

BR,
-R

> Changing the top comment to "calculate the time remaining to the next vblank".
> --
> Regards,
> Luben
>
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(drm_crtc_next_vblank_time);
> > +
> >  static void send_vblank_event(struct drm_device *dev,
> >               struct drm_pending_vblank_event *e,
> >               u64 seq, ktime_t now)
> > diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> > index 733a3e2d1d10..a63bc2c92f3c 100644
> > --- a/include/drm/drm_vblank.h
> > +++ b/include/drm/drm_vblank.h
> > @@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev);
> >  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
> >  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> >                                  ktime_t *vblanktime);
> > +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime);
> >  void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
> >                              struct drm_pending_vblank_event *e);
> >  void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
>
