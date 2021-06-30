Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428403B8756
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 19:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC086EA54;
	Wed, 30 Jun 2021 17:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF026EA54
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 17:02:12 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so3447839oti.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LanJbiIuJSrM0eJck4znYgmaFeJnu95n7I8RioTyy2s=;
 b=V150x5rKc9+KZG9FujomlV/k9YoxkWuDbd2XyCQ91o/eSyBCCW9nbCE2P3b8grEAbF
 Vt83WifN0E1MV3ujzK4kZ9Y/oE4XVjUYNPRoIBfptXVHwfnYokj8yGy06lj6caJP+2LI
 X0iBb0LI4AaOa/OF6ciKPjkgOSd0Ld3QpC5eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LanJbiIuJSrM0eJck4znYgmaFeJnu95n7I8RioTyy2s=;
 b=jjbxFJadOx0FvADKEoxrdpWixKnXdkEVaMCq39WlhW+Wj3lRFcjJotioIxqj577g/D
 c4WNDL+2xtkIO5wm85UdjVj53S62LTAMqhYk7QBw3YgCBZHKdcMzruM/sOqzjZNOWeg6
 +sRD3uVgq4EGsxKvwn6npQ1OL8S4rRx3spCNS4NThuXHMhQnoTaAIidlFdDikjj/WLdS
 so02lJH5bl66ino/02loN3Oom3ChGDpwLJv7rWHGJrFGhplNBXAnaYyMILsFskkL00Ud
 fiXs1UL5nYVIsQzKvQL1MXxTvBeNBraxIOPr37JG27ua28bNv7bIsgtfwLMFkwOJ8CKU
 o1jQ==
X-Gm-Message-State: AOAM533xoZMMCdsatjnHJJIX/yShcGmM/ZwBw53+kk9AL9kWPKTHAq1j
 G2rv8mzAtcElPZZKsKrMMOt71bIND7e02hy1RSJ83w==
X-Google-Smtp-Source: ABdhPJxKhmtOoKMyZgML3RkefNDNQqXej/Tbzmls7BS6+6Dk/qyifJSDnqCk6iKUxNn27FiOcxYChAFcBMphtYOt90E=
X-Received: by 2002:a9d:2037:: with SMTP id n52mr9525780ota.303.1625072532096; 
 Wed, 30 Jun 2021 10:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210630095228.6665-1-tzimmermann@suse.de>
 <20210630095228.6665-2-tzimmermann@suse.de>
 <YNxMLb60vNDuTcdM@phenom.ffwll.local>
 <ce44caf4-1823-121b-5db4-61eaa9827327@suse.de>
In-Reply-To: <ce44caf4-1823-121b-5db4-61eaa9827327@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Jun 2021 19:02:01 +0200
Message-ID: <CAKMK7uFFW1Nxch1s+5CjXhRs4hU12H7C9zRSurO54c+ePzys5w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/i915: Use the correct IRQ during resume
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Dave Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 30, 2021 at 4:18 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 30.06.21 um 12:49 schrieb Daniel Vetter:
> > On Wed, Jun 30, 2021 at 11:52:27AM +0200, Thomas Zimmermann wrote:
> >> The code in xcs_resume() probably didn't work as intended. It uses
> >> struct drm_device.irq, which is allocated to 0, but never initialized
> >> by i915 to the device's interrupt number.
> >>
> >> v3:
> >>      * also use intel_synchronize_hardirq() at another callsite
> >> v2:
> >>      * wrap irq code in intel_synchronize_hardirq() (Ville)
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Fixes: 536f77b1caa0 ("drm/i915/gt: Call stop_ring() from ring resume, =
again")
> >> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> >> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> >> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/gt/intel_engine_cs.c       | 2 +-
> >>   drivers/gpu/drm/i915/gt/intel_ring_submission.c | 2 +-
> >>   drivers/gpu/drm/i915/i915_irq.c                 | 5 +++++
> >>   drivers/gpu/drm/i915/i915_irq.h                 | 1 +
> >>   4 files changed, 8 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/d=
rm/i915/gt/intel_engine_cs.c
> >> index 88694822716a..5ca3d1664335 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> >> @@ -1229,7 +1229,7 @@ bool intel_engine_is_idle(struct intel_engine_cs=
 *engine)
> >>              return true;
> >>
> >>      /* Waiting to drain ELSP? */
> >> -    synchronize_hardirq(to_pci_dev(engine->i915->drm.dev)->irq);
> >> +    intel_synchronize_hardirq(engine->i915);
> >>      intel_engine_flush_submission(engine);
> >>
> >>      /* ELSP is empty, but there are ready requests? E.g. after reset =
*/
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers=
/gpu/drm/i915/gt/intel_ring_submission.c
> >> index 5d42a12ef3d6..1b5a22a83db6 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> >> @@ -185,7 +185,7 @@ static int xcs_resume(struct intel_engine_cs *engi=
ne)
> >>                   ring->head, ring->tail);
> >>
> >>      /* Double check the ring is empty & disabled before we resume */
> >> -    synchronize_hardirq(engine->i915->drm.irq);
> >> +    intel_synchronize_hardirq(engine->i915);
> >>      if (!stop_ring(engine))
> >>              goto err;
> >>
> >> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i9=
15_irq.c
> >> index 7d0ce8b9f8ed..2203dca19895 100644
> >> --- a/drivers/gpu/drm/i915/i915_irq.c
> >> +++ b/drivers/gpu/drm/i915/i915_irq.c
> >> @@ -4575,3 +4575,8 @@ void intel_synchronize_irq(struct drm_i915_priva=
te *i915)
> >>   {
> >>      synchronize_irq(to_pci_dev(i915->drm.dev)->irq);
> >>   }
> >> +
> >> +void intel_synchronize_hardirq(struct drm_i915_private *i915)
> >> +{
> >> +    synchronize_hardirq(to_pci_dev(i915->drm.dev)->irq);
> >
> > I honestly think the hardirq here is about as much cargo-culted as usin=
g
> > the wrong irq number.
> >
> > I'd just use intel_synchronize_irq in both places and see whether CI
> > complains, then go with that.
>
> Well, ok. I don't think I have Sandybridge HW available. Would the Intel
> CI infrastructure catch any problems with such a change?

If there's anything obvious busted with it it should catch it (like if
we end up calling synchronize_irq from softirq context, where only
synchronize_hardirq is allowed, but I don't think that's the case).

And if I'm wrong we know what kind of comment to put there to explain
why things are different.
-Daniel

> Best regards
> Thomas
>
> > -Daniel
> >
> >> +}
> >> diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i9=
15_irq.h
> >> index db34d5dbe402..e43b6734f21b 100644
> >> --- a/drivers/gpu/drm/i915/i915_irq.h
> >> +++ b/drivers/gpu/drm/i915/i915_irq.h
> >> @@ -94,6 +94,7 @@ void intel_runtime_pm_disable_interrupts(struct drm_=
i915_private *dev_priv);
> >>   void intel_runtime_pm_enable_interrupts(struct drm_i915_private *dev=
_priv);
> >>   bool intel_irqs_enabled(struct drm_i915_private *dev_priv);
> >>   void intel_synchronize_irq(struct drm_i915_private *i915);
> >> +void intel_synchronize_hardirq(struct drm_i915_private *i915);
> >>
> >>   int intel_get_crtc_scanline(struct intel_crtc *crtc);
> >>   void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_pr=
iv,
> >> --
> >> 2.32.0
> >>
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
