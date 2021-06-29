Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0156F3B7694
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 18:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07656E8C9;
	Tue, 29 Jun 2021 16:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1171F6E8C9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 16:39:29 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 m6-20020a9d1d060000b029044e2d8e855eso21327040otm.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 09:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xZnZ+U4go1KfwiNZo+sk8ZQg5LcypnMWP2JzKM8ADxg=;
 b=X/iJFPSPU8YbBUQrwjpbkr2fsPqACSlQMr2hVz+mkBD+v33C1TaU0rl32msgvojTYy
 UxQ5l5qUzpRLYuFpKAyY83r4MkpRDpYIoKukKAEjyHvuScaYBvewZ3v4hg4kUg0f4Fe6
 t6ctna9jdKfuZaCZyESakroC8DlphWtefIO6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xZnZ+U4go1KfwiNZo+sk8ZQg5LcypnMWP2JzKM8ADxg=;
 b=B3TwOMwFEMS3fqbaZZ7cgXzm86IkhBZvHzbCYAzQDdVSoNAp/mbWOWBUuluyBnRzUZ
 UGyofHq/89cxQEg1AOHgLtKzDWaASzcbaz2XqndSpItAB6KZ5a2ZfQoPRQYBfHb87HlT
 4oR3cgJAap+6lqycqywMX06V+rgLw+ZG7jbD3J2GqYCbjNoYN0M/qEN0+9uWPuJgGtOZ
 s+8klA6a0nEZ6D+zhCn1IlfdTKRFXYStRCNwf15H26+/c4WjFcAEBDxmzupbjD2Mb6TU
 6G2Hr9Vls9NlJDhCszD3UFBv1OkZD/slWzZwv/BtZiOIyAMWlYoPpTY+55IVzWB3laqr
 RCPg==
X-Gm-Message-State: AOAM532I33jcxBJ40rhnl9EHuVi2kp9rK8lLxO+38+58FeCu/PoeFee9
 u2hH4842AtCzsb6xvaCXxG1LG5xssA6r+fJrE7szmA==
X-Google-Smtp-Source: ABdhPJz+eWmuBZcpnYy5rLX2+bRyXE01xMzcDhXowktKtk5lTjpVjGOxnq70s6QTm0uR2dgKDiSXzK6BFS918drS4L8=
X-Received: by 2002:a9d:2037:: with SMTP id n52mr5065798ota.303.1624984769145; 
 Tue, 29 Jun 2021 09:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210625084740.1586-1-tzimmermann@suse.de>
 <YNtGBg1+D6L1MVHl@intel.com>
In-Reply-To: <YNtGBg1+D6L1MVHl@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 29 Jun 2021 18:39:18 +0200
Message-ID: <CAKMK7uGe2W3aRK7cn=JPdQwVbnWSDxjV43ur0CMDPZk5se1LmA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Drop all references to DRM IRQ midlayer
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
Cc: Matthew Brost <matthew.brost@intel.com>, Dave Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 29, 2021 at 6:11 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Jun 25, 2021 at 10:47:40AM +0200, Thomas Zimmermann wrote:
> > Remove all references to DRM's IRQ midlayer.
> >
> > The code in xcs_resume() probably didn't work as intended. It uses
> > struct drm_device.irq, which is allocated to 0, but never initialized
> > by i915 to the device's interrupt number.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Fixes: 536f77b1caa0 ("drm/i915/gt: Call stop_ring() from ring resume, a=
gain")
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_ring_submission.c | 3 ++-
> >  drivers/gpu/drm/i915/i915_drv.c                 | 1 -
> >  drivers/gpu/drm/i915/i915_irq.c                 | 1 -
> >  3 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/=
gpu/drm/i915/gt/intel_ring_submission.c
> > index 5d42a12ef3d6..d893aaaed74f 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > @@ -180,12 +180,13 @@ static bool stop_ring(struct intel_engine_cs *eng=
ine)
> >  static int xcs_resume(struct intel_engine_cs *engine)
> >  {
> >       struct intel_ring *ring =3D engine->legacy.ring;
> > +     struct pci_dev *pdev =3D to_pci_dev(engine->i915->drm.dev);
> >
> >       ENGINE_TRACE(engine, "ring:{HEAD:%04x, TAIL:%04x}\n",
> >                    ring->head, ring->tail);
> >
> >       /* Double check the ring is empty & disabled before we resume */
> > -     synchronize_hardirq(engine->i915->drm.irq);
> > +     synchronize_hardirq(pdev->irq);
>
> We have intel_synchronize_irq() to hide all these mundane details.
> Might want to add a matching intel_synchronize_hardirq().

Hm I wonder whether we shouldn't just use the normal synchronize_irq()
here. We don't have a threaded irq handler, and this should be called
from process context. intel-gfx-ci will catch if I'm wrong :-)
-Daniel

>
> >       if (!stop_ring(engine))
> >               goto err;
> >
> > diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i91=
5_drv.c
> > index 850b499c71c8..73de45472f60 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.c
> > +++ b/drivers/gpu/drm/i915/i915_drv.c
> > @@ -42,7 +42,6 @@
> >  #include <drm/drm_aperture.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_ioctl.h>
> > -#include <drm/drm_irq.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_probe_helper.h>
> >
> > diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i91=
5_irq.c
> > index a11bdb667241..eef616d96f12 100644
> > --- a/drivers/gpu/drm/i915/i915_irq.c
> > +++ b/drivers/gpu/drm/i915/i915_irq.c
> > @@ -33,7 +33,6 @@
> >  #include <linux/sysrq.h>
> >
> >  #include <drm/drm_drv.h>
> > -#include <drm/drm_irq.h>
> >
> >  #include "display/intel_de.h"
> >  #include "display/intel_display_types.h"
> >
> > base-commit: 8c1323b422f8473421682ba783b5949ddd89a3f4
> > prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> > prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> > --
> > 2.32.0
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
