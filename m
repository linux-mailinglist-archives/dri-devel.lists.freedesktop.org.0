Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C287F275C33
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DE76E9D3;
	Wed, 23 Sep 2020 15:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE03F6E9D3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:42:02 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w2so503542wmi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ji36v+ulFjvwd5eMeN8llVyHPMW9wU1YMSmHIXO9ifg=;
 b=lkXddpGY7vbvqAnZWOXPosszH1AFHQb1IU/MCHDD41+5nFlSeUTBehNrMKvcNYUJrH
 4gyfbccA+sOmXOeiqQZeu//yfih3raQSN3e7gO17w9/kmQ7iIAg7wyeBw1EGoFntIaEb
 R4Jhh7+puS8IbHEkdBRngJwPjBCBcisU9EmNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ji36v+ulFjvwd5eMeN8llVyHPMW9wU1YMSmHIXO9ifg=;
 b=ihYFbtGp8NxB6CgKu1VZ/EPK4lILncfXp6wtwHpWBMsNbJz/G7H73B6dUvkEUjMjFV
 h4vMDNLG0k8Y5zPfNNfOtC3ar0IunujM4XNCwaMgCRtL+YTmg7yRD2kN0mCWE6+3eZno
 gE0p8WGbiIEQ8lP40qrXtizrIDU3989ODEO9CNp3dAwZSYdn7gg4Y4cQ153nFH+XeISB
 EwpU/W35Nqi7Eqd24yc0sQLl9bCjWJ5KMB+cm2RoZ2XoN7wmr7iTUiIOjJOci6bmhyr+
 BkjJ7BEFpDkR3D/wgnD3hGHNlt5zmhf+B5fvyu0GyH/7aK8RISM4jF0Sa9y0GZvSEjN4
 zvbg==
X-Gm-Message-State: AOAM533QEJwUiDBoMSDSlQk7t1aDB8r4rVQBvcn84H0UVDNYBVV1+S6E
 x3kmJ3W4SSR5lnMX0BIgeP1HUA==
X-Google-Smtp-Source: ABdhPJwwId6TQo7OMwHTXQ6XURMt7suTd8zfavBDtc95JayVaqNV1r2q31tRSq7B3vqxfC0aV/hV9Q==
X-Received: by 2002:a1c:26c3:: with SMTP id m186mr130882wmm.115.1600875721487; 
 Wed, 23 Sep 2020 08:42:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l126sm153435wmf.39.2020.09.23.08.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 08:42:00 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:41:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 1/2] drm/vc4: crtc: Rework a bit the CRTC state code
Message-ID: <20200923154158.GV438822@phenom.ffwll.local>
References: <20200923084032.218619-1-maxime@cerno.tech>
 <CAPY8ntAjiBeAoB=PZzNWW_5Vi3ZstXnD59GSkPXoeBj4XbGt0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPY8ntAjiBeAoB=PZzNWW_5Vi3ZstXnD59GSkPXoeBj4XbGt0Q@mail.gmail.com>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 03:59:04PM +0100, Dave Stevenson wrote:
> Hi Maxime
> 
> On Wed, 23 Sep 2020 at 09:40, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The current CRTC state reset hook in vc4 allocates a vc4_crtc_state
> > structure as a drm_crtc_state, and relies on the fact that vc4_crtc_state
> > embeds drm_crtc_state as its first member, and therefore can be safely
> > casted.
> 
> s/casted/cast
> 
> > However, this is pretty fragile especially since there's no check for this
> > in place, and we're going to need to access vc4_crtc_state member at reset
> > so this looks like a good occasion to make it more robust.

Also your next atomic_check will probably look at this, most definitely in
the memcpy to take over the old state. So yeah KASAN should complain if
you get this wrong :-)

Probably want a Fixes: line for this too.
-Daniel

> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Based on the issue I perceived with the previous patch, I'm happy. I
> haven't thought about how the framework handles losing the state, but
> that's not the driver's problem.
> 
> There is still an implicit assumption that drm_crtc_state is the first
> member from the implementation of to_vc4_crtc_state in vc4_drv.h. To
> make it even more robust that could be a container_of instead. I
> haven't checked for any other places that make the assumption though.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> > ---
> >
> > Changes from v1:
> >   - new patch
> > ---
> >  drivers/gpu/drm/vc4/vc4_crtc.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> > index a393f93390a2..7ef20adedee5 100644
> > --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> > +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> > @@ -852,11 +852,18 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
> >
> >  void vc4_crtc_reset(struct drm_crtc *crtc)
> >  {
> > +       struct vc4_crtc_state *vc4_crtc_state;
> > +
> >         if (crtc->state)
> >                 vc4_crtc_destroy_state(crtc, crtc->state);
> > -       crtc->state = kzalloc(sizeof(struct vc4_crtc_state), GFP_KERNEL);
> > -       if (crtc->state)
> > -               __drm_atomic_helper_crtc_reset(crtc, crtc->state);
> > +
> > +       vc4_crtc_state = kzalloc(sizeof(*vc4_crtc_state), GFP_KERNEL);
> > +       if (!vc4_crtc_state) {
> > +               crtc->state = NULL;
> > +               return;
> > +       }
> > +
> > +       __drm_atomic_helper_crtc_reset(crtc, &vc4_crtc_state->base);
> >  }
> >
> >  static const struct drm_crtc_funcs vc4_crtc_funcs = {
> > --
> > 2.26.2
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
