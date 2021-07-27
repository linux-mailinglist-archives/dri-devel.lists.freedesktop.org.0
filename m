Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A43D787B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 16:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD956E187;
	Tue, 27 Jul 2021 14:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F656E106
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:28:51 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id q18so12202221ile.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 07:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9Prx0Bs3bi2Iedu+a31xFuqWG2tgHJduHwRz4ZIFies=;
 b=iwg3INetBSvSrA2PFYqyLYPB7PI8YxE5YBgzSCjQ63DsueVurjkfTnHSKQEF6hucc3
 lFDNFSEZz98jxNKhV8ssutp8hNDO8ukVScHrxzMfINjJzxgaxtgKRX0AGiR0DvW78tMd
 OP2U76sZRXONyVQpFCrlDKn8QBC5427e/FOgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9Prx0Bs3bi2Iedu+a31xFuqWG2tgHJduHwRz4ZIFies=;
 b=IjMAg1cFRi7Ve3WwwrB+44GrXqCY5paJu+SzWjJRku81qno6x5J8EgZx1CXNwa+eaU
 XAQtQTbfOWcEGb10iFruqXuR1z5Csk0IqGhGSrWkhcItwWuH/zI9y/oZ+zaCEGJv0IK4
 A9LC0MisAdQSr0SYZTduyncf1QDwAz7N0mHqO1imNMZksjjGGHzyvqiYl9GAph4XJXPL
 mi7GiWvf4ouPR0qtx+lQ0mEbcoQE14EL5q/I81BeBwk/Nnh9WHY7GKzReJIHtWoKH0Sc
 MxjQyzYQqgFu+Ya9uM5Ks0wYut8KQD7SI08ZJuhET+9oL2mFeWJA5oOpUKQe9R7fL5zX
 nMXA==
X-Gm-Message-State: AOAM531CcGr++hln8HoZZFF9nPJTPxYMF/+3kD9G1lRV/aDCOvrDMuj+
 aCl4sKfuEKzWvYR5W4Qhzomnn0YPWrwSs0CUaJwT0w==
X-Google-Smtp-Source: ABdhPJybYxwYy18KLwUbJfyvL+fb6T2BlYafeEVAj/NR03+20aiC9dS9LWK4oQGWXgLiZRehkrarL9nMSfFaH1DpM90=
X-Received: by 2002:a92:3206:: with SMTP id z6mr16785042ile.201.1627396130923; 
 Tue, 27 Jul 2021 07:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <20210726233854.2453899-4-robdclark@gmail.com>
 <db6cdec8-d44c-a09c-3fbd-60fb55c66efb@daenzer.net>
In-Reply-To: <db6cdec8-d44c-a09c-3fbd-60fb55c66efb@daenzer.net>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 27 Jul 2021 07:33:01 -0700
Message-ID: <CAJs_Fx6dmNcjAvAJASr-YOZSDPrPfb0iwxNTZwmn1AQXpQevYQ@mail.gmail.com>
Subject: Re: [RFC 3/4] drm/atomic-helper: Set fence deadline for vblank
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 3:44 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
>
> On 2021-07-27 1:38 a.m., Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For an atomic commit updating a single CRTC (ie. a pageflip) calculate
> > the next vblank time, and inform the fence(s) of that deadline.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 36 +++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index bc3487964fb5..f81b20775b15 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1406,6 +1406,40 @@ void drm_atomic_helper_commit_modeset_enables(st=
ruct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
> >
> > +/*
> > + * For atomic updates which touch just a single CRTC, calculate the ti=
me of the
> > + * next vblank, and inform all the fences of the of the deadline.
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
> > +             if (!wait_crtc)
> > +                     return;
>
> Either this return or the next one below would always be taken, I doubt t=
his was intended.

oops, the condition here is mistakenly inverted, it was meant to bail
if there is more than a single CRTC

>
> > +             wait_crtc =3D crtc;
> > +     }
> > +
> > +     /* If no CRTCs updated, then nothing to do: */
> > +     if (!wait_crtc)
> > +             return;
> > +
> > +     if (drm_crtc_next_vblank_time(wait_crtc, &vbltime))
> > +             return;
> > +
> > +     for_each_new_plane_in_state (state, plane, new_plane_state, i) {
> > +             if (!new_plane_state->fence)
> > +                     continue;
> > +             dma_fence_set_deadline(new_plane_state->fence, vbltime);
> > +     }
>
> vblank timestamps correspond to the end of vertical blank, the deadline s=
hould be the start of vertical blank though.
>

hmm, I suppose this depends on whether the hw actually has separate
irq's for frame-done and vblank (and whether the driver
differentiates).. and if the display controller is doing some
buffering, the point at which it wants to flip could be a bit earlier
still.  Maybe we just want a kms driver provided offset for how early
it wants the deadline relative to vblank?

BR,
-R

>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
