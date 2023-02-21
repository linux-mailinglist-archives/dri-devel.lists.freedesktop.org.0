Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE7569E651
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 18:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4881510E0BC;
	Tue, 21 Feb 2023 17:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C8910E0BC;
 Tue, 21 Feb 2023 17:50:31 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-172242a14d4so4170217fac.9; 
 Tue, 21 Feb 2023 09:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5Jqc/YZjZyQYqTXnIf8R98ssXuoqvkdUho65IcZjEA=;
 b=lbqDpLvU7c7eLGnGV9F/nEWZ38S8/eURJS12sQQcMSScoQAxnnaBIlqOgM3yW7/U76
 6IZohiU14lbEEt/DRE1VxjjUXZUKHqHFK+CMSJHHk134QvN+sWSHHSdMB4/ApZ8s6RlD
 1xxadoYMiXtzhhB2Jj/DjoBnrxVflrMBRZG/+APjGhSGZE9+k/17e3QR7bujIxJoVAK9
 jdpV5zFTnBEKYV4f/VWQIBTioCRMs9FnKuShRRuTwUakq5aEBxrKOZwxAXXI/7XBwyYE
 Sjqbj7UIuxYsNu5P546GsW8Ph8AKK0AHdL0CZsgFtaUJFTNLJrVnhCfgvQDei9oU0KO9
 i/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O5Jqc/YZjZyQYqTXnIf8R98ssXuoqvkdUho65IcZjEA=;
 b=eC2xjq7CVAQDHB4AX+j+zflMi+tVeEqDBe9Vcm3bi0zRq24H7XJY4QfRX0ukA0fahS
 XhF2LAHkKwegYLvwcYysGH4O2otvNEMxdMb1tgNFFjdI8h2OHb/Fit80EvXUAoY73EM2
 wtv4zwhvCuDp/V22nbdsO/jd9qJHd52dTvrzCwFqvWLmuHEKmhOemLTrG1tASacD+s0W
 k8smnngsCyoXr4bCyImfz6NFinAIXykLK6q3uvxDOpdIylOsh3ad6SodaAmaiX6UkRpE
 7dTbUEBgsDKEbUg87fmuzq0ZZk8ATJgGTtpH19rUfxU1I9/kasgW5jAzGYQBxxtiTsM3
 QqCQ==
X-Gm-Message-State: AO0yUKWAwPHMswjUVnt3ybKpWRlhlEfos0LrK+ixZy6Cav8Xyey+xhhv
 Y5eZHy4CDaGKoieRZuHOizn3tIQhVYcYOoDwWyY=
X-Google-Smtp-Source: AK7set+C8udISyRUP8+aDUE3orCb6yoqc4T3+xIJp+MByhgBco1zccJSqc5WaC0GBnmbCmGM2wG5NoptBUQRgq6lnlk=
X-Received: by 2002:a05:6870:32d4:b0:16e:5e5a:49da with SMTP id
 r20-20020a05687032d400b0016e5e5a49damr1495979oac.58.1677001830435; Tue, 21
 Feb 2023 09:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-11-robdclark@gmail.com>
 <20230220110820.595cfa37@eldfell>
 <CAF6AEGuo-vmW4Va9=RH+kH9KgNvR2vzjJ8meO-oty56xjDhjgg@mail.gmail.com>
 <20230221104551.60d44d1c@eldfell> <Y/TAr64SpxO712RB@intel.com>
In-Reply-To: <Y/TAr64SpxO712RB@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Feb 2023 09:50:20 -0800
Message-ID: <CAF6AEGumfEeGQQaEoEm4hzJajCOBBTrWxPQ9MTh7jt-Mov2FEQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] drm/vblank: Add helper to get next vblank time
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 21, 2023 at 5:01 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Feb 21, 2023 at 10:45:51AM +0200, Pekka Paalanen wrote:
> > On Mon, 20 Feb 2023 07:55:41 -0800
> > Rob Clark <robdclark@gmail.com> wrote:
> >
> > > On Mon, Feb 20, 2023 at 1:08 AM Pekka Paalanen <ppaalanen@gmail.com> =
wrote:
> > > >
> > > > On Sat, 18 Feb 2023 13:15:53 -0800
> > > > Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Will be used in the next commit to set a deadline on fences that =
an
> > > > > atomic update is waiting on.
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++=
++
> > > > >  include/drm/drm_vblank.h     |  1 +
> > > > >  2 files changed, 33 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_v=
blank.c
> > > > > index 2ff31717a3de..caf25ebb34c5 100644
> > > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > > @@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct dr=
m_crtc *crtc,
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> > > > >
> > > > > +/**
> > > > > + * drm_crtc_next_vblank_time - calculate the time of the next vb=
lank
> > > > > + * @crtc: the crtc for which to calculate next vblank time
> > > > > + * @vblanktime: pointer to time to receive the next vblank times=
tamp.
> > > > > + *
> > > > > + * Calculate the expected time of the next vblank based on time =
of previous
> > > > > + * vblank and frame duration
> > > >
> > > > Hi,
> > > >
> > > > for VRR this targets the highest frame rate possible for the curren=
t
> > > > VRR mode, right?
> > > >
> > >
> > > It is based on vblank->framedur_ns which is in turn based on
> > > mode->crtc_clock.  Presumably for VRR that ends up being a maximum?
> >
> > I don't know. :-)
>
> At least for i915 this will give you the maximum frame
> duration.

I suppose one could argue that maximum frame duration is the actual
deadline.  Anything less is just moar fps, but not going to involve
stalling until vblank N+1, AFAIU

> Also this does not calculate the the start of vblank, it
> calculates the start of active video.

Probably something like end of previous frame's video..  might not be
_exactly_ correct (because some buffering involved), but OTOH on the
GPU side, I expect the driver to set a timer for a few ms or so before
the deadline.  So there is some wiggle room.

BR,
-R

> >
> > You need a number of clock cycles in addition to the clock frequency,
> > and that could still be minimum, maximum, the last realized one, ...
> >
> > VRR works by adjusting the front porch length IIRC.
> >
> >
> > Thanks,
> > pq
> >
> > > BR,
> > > -R
> > >
> > >
> > > >
> > > > Thanks,
> > > > pq
> > > >
> > > > > + */
> > > > > +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vb=
lanktime)
> > > > > +{
> > > > > +     unsigned int pipe =3D drm_crtc_index(crtc);
> > > > > +     struct drm_vblank_crtc *vblank =3D &crtc->dev->vblank[pipe]=
;
> > > > > +     u64 count;
> > > > > +
> > > > > +     if (!vblank->framedur_ns)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     count =3D drm_vblank_count_and_time(crtc->dev, pipe, vblank=
time);
> > > > > +
> > > > > +     /*
> > > > > +      * If we don't get a valid count, then we probably also don=
't
> > > > > +      * have a valid time:
> > > > > +      */
> > > > > +     if (!count)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     *vblanktime =3D ktime_add(*vblanktime, ns_to_ktime(vblank->=
framedur_ns));
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_crtc_next_vblank_time);
> > > > > +
> > > > >  static void send_vblank_event(struct drm_device *dev,
> > > > >               struct drm_pending_vblank_event *e,
> > > > >               u64 seq, ktime_t now)
> > > > > diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> > > > > index 733a3e2d1d10..a63bc2c92f3c 100644
> > > > > --- a/include/drm/drm_vblank.h
> > > > > +++ b/include/drm/drm_vblank.h
> > > > > @@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_devi=
ce *dev);
> > > > >  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
> > > > >  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> > > > >                                  ktime_t *vblanktime);
> > > > > +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vb=
lanktime);
> > > > >  void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
> > > > >                              struct drm_pending_vblank_event *e);
> > > > >  void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
> > > >
> >
>
>
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
