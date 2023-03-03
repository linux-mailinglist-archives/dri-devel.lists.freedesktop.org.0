Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D3D6A9AF5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 16:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F198110E6CC;
	Fri,  3 Mar 2023 15:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D277010E6CC;
 Fri,  3 Mar 2023 15:45:17 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17652f24da7so3371554fac.4; 
 Fri, 03 Mar 2023 07:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677858317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9oMaAqKp70rucwAbCAe5Akiveom7SO9ApMDc3ILYjPM=;
 b=CZS/kLR1XDmMZutlePV59iDp/P690A0ZT5manMZ7/nS/4HLtN+WFNFuTBRhkgyt2eo
 40+ngPGZ+iH2Gkn34gpMdeRfh/yyRs9V75po+2OL7rtpHz04Hgwt+o/pzt7rumFzY+Dr
 zUKrGit+yK+JsY800eQ0QUIEXMFGXlrxsx9f2Z4mlCRCtKOz4Jh+MrPSFHw2ETuDyM8e
 gA9RxkGtRfTM1wankLqMwUHjHyGC2cjdwnuAYtkQckeS0N8xiOFtXABahQmlgZKM9FWS
 diI+qeta4mNPyERFenvA2ymh+0VvyoD71Ysv5T9uHNAJZuTf2yJyhKUEvfcN5qHT86Fh
 wrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677858317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9oMaAqKp70rucwAbCAe5Akiveom7SO9ApMDc3ILYjPM=;
 b=50QnxRtdv+XqKmSTMPymQlbI5+XXzQRx/BM5Gdka5lt6RYdbyWU2CrESAzeI5P298I
 J9AgW7Ljh+/vm2mIZnqwfU4aUWDAAUzbQ11Dc8wIhQjOOCG/VHwcd6KTmB02z87wtnqW
 +l5OgX//r3VtjnEWljt7XCbttOi7DcsSs5a23gPiO/k8qx4tEVXq1ZS/sFqCPiQ+SjQi
 fyZXx4kRGsmmcHZCMw6V9wiyteIrYfbOQG69L9P8VlryqKF+ETDCQCxelbdBJgDYsmtL
 Mlq0rQeZ0phQNZ0iNWOpmyBe/jv5FdSPbMnlU5ifUZ4fdFs2LvoUWMfB1rxk5WEjcw3D
 8jkQ==
X-Gm-Message-State: AO0yUKXrInojxUOzS7axfumepxnSPdjzSCZpuyULMpUbw9fydvRoiv9/
 RS21IXhfU7DuIR5WXASzkykZ06RL6HSBWPj1zoY=
X-Google-Smtp-Source: AK7set8dni3ftARSzuB7mCn0RHsIaZgP2tzM95InzxXtdqoh5ooukYqrssT6lkvFBO4iOrGptErrOnoURJB1EoAxZZE=
X-Received: by 2002:a05:6870:d2a5:b0:172:6f4:dcdf with SMTP id
 d37-20020a056870d2a500b0017206f4dcdfmr713624oae.3.1677858317098; Fri, 03 Mar
 2023 07:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-12-robdclark@gmail.com>
 <ZAIOaiogeUhhNVfo@intel.com>
In-Reply-To: <ZAIOaiogeUhhNVfo@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Mar 2023 07:45:05 -0800
Message-ID: <CAF6AEGuL+B6sR2=7MFvqT0zfsgraoOdzAJBF=Ke1ce1umYh4Xw@mail.gmail.com>
Subject: Re: [PATCH v9 11/15] drm/atomic-helper: Set fence deadline for vblank
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 3, 2023 at 7:12 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Mar 02, 2023 at 03:53:33PM -0800, Rob Clark wrote:
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
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index d579fd8f7cb8..d8ee98ce2fc5 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1511,6 +1511,40 @@ void drm_atomic_helper_commit_modeset_enables(st=
ruct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
> >
> > +/*
> > + * For atomic updates which touch just a single CRTC, calculate the ti=
me of the
> > + * next vblank, and inform all the fences of the deadline.
> > + */
> > +static void set_fence_deadline(struct drm_device *dev,
> > +                            struct drm_atomic_state *state)
> > +{
> > +     struct drm_crtc *crtc, *wait_crtc =3D NULL;
> > +     struct drm_crtc_state *new_crtc_state;
> > +     struct drm_plane *plane;
> > +     struct drm_plane_state *new_plane_state;
> > +     ktime_t vbltime;
> > +     int i;
> > +
> > +     for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
> > +             if (wait_crtc)
> > +                     return;
> > +             wait_crtc =3D crtc;
> > +     }
> > +
> > +     /* If no CRTCs updated, then nothing to do: */
> > +     if (!wait_crtc)
> > +             return;
>
> Is there an actual point in limiting this to single crtc updates?
> That immediately excludes tiled displays/etc.
>
> Handling an arbitrary number of crtcs shouldn't really be a lot
> more complicated should it?

I guess I could find the soonest upcoming vblank of all the CRTCs and
use that as the deadline?

BR,
-R

> > +
> > +     if (drm_crtc_next_vblank_start(wait_crtc, &vbltime))
> > +             return;
> > +
> > +     for_each_new_plane_in_state (state, plane, new_plane_state, i) {
> > +             if (!new_plane_state->fence)
> > +                     continue;
> > +             dma_fence_set_deadline(new_plane_state->fence, vbltime);
> > +     }
> > +}
> > +
> >  /**
> >   * drm_atomic_helper_wait_for_fences - wait for fences stashed in plan=
e state
> >   * @dev: DRM device
> > @@ -1540,6 +1574,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_=
device *dev,
> >       struct drm_plane_state *new_plane_state;
> >       int i, ret;
> >
> > +     set_fence_deadline(dev, state);
> > +
> >       for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> >               if (!new_plane_state->fence)
> >                       continue;
> > --
> > 2.39.1
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
