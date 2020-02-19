Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C5C16489D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 16:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C01B6EC25;
	Wed, 19 Feb 2020 15:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A546EC25
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 15:29:55 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id w6so530454otk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 07:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ef9L7t8Zi2ozv+lyQPsML7iJbsJTkVAOn/7nOem6/jM=;
 b=TGRJpbVdvZtsuwghUO55XmH2A+E8zpcpjRu1MCcUYOGj1GSxkEI8UojFU5/3fGv9ub
 5MXdClzQs/OAAwTUcaK1gOPf8elCSD5E3AZikpvKgJY3jEr0hKVaOMCm6Hi+aR3NQDPl
 lsG+qpi7yi+wbtPBsW7zQa8r1PIRzRhnrxaDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ef9L7t8Zi2ozv+lyQPsML7iJbsJTkVAOn/7nOem6/jM=;
 b=l0Im71i1E8S7WcGBZ12IFVMIJ4pWpM/TVi0otFGiqI1M14db00aZQwEhrpMKGgU8h+
 nSsBFz/GntRbQx5tfYZn2wj2mV+Md0AEyV6TTqwr7iEa9D05GKU0NorkCPvuE0R7Tloy
 lAgbEFpMS5yxM4CR0fmzIYZT8ONuyPEUI3j3bo86EA0+UQsut2Ulr6IrCj7KmxGcPvxe
 b5sS+PYFwHGsqeAx1hVJqzRYMliXd8enLd5SBFk+aH6jh6IWjMOodLZ1cpApUVYVvx3T
 ZNwU/mDcDfrebTBpGDIPNg4tltoJR9zcQ9PsYhUO4iRBoECt9fqQ/m4ebRLZyh8BUfaa
 MWdg==
X-Gm-Message-State: APjAAAUzGnOs1veAdcIncL9R5lDuI6W94X7WVeTdzZVh6H4BXN9sOkJP
 5vdagstZGw624zpQfUlO4Sr3eU+fNUi6Ia30pFfMxKO7
X-Google-Smtp-Source: APXvYqzPlpJWc5OhvhrnTPzyxIFSNGNA2ySP1y/nqze9J5V79MpSaSxDaAHxD+SPGu5gv9Pfe0dNR0JpH0BolPG/isk=
X-Received: by 2002:a05:6830:2015:: with SMTP id
 e21mr19330421otp.106.1582126194901; 
 Wed, 19 Feb 2020 07:29:54 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-20-daniel.vetter@ffwll.ch>
 <20200219141116.GJ5070@pendragon.ideasonboard.com>
 <CAKMK7uGek38Xt_CpYC09eaYrLVfLHf_YZiVLY9sVeN+4N9NA0w@mail.gmail.com>
 <20200219143918.GN5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219143918.GN5070@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 16:29:43 +0100
Message-ID: <CAKMK7uGrgDoXn5KyM9Hn9EawSx=CuNgY6-+qLK-EScx3yQTFzA@mail.gmail.com>
Subject: Re: [PATCH 19/52] drm/<drivers>: Use drmm_add_final_kfree
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 3:39 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> On Wed, Feb 19, 2020 at 03:30:59PM +0100, Daniel Vetter wrote:
> > On Wed, Feb 19, 2020 at 3:11 PM Laurent Pinchart wrote:
> > > On Wed, Feb 19, 2020 at 11:20:49AM +0100, Daniel Vetter wrote:
> > > > These are the leftover drivers that didn't have a ->release hook that
> > > > needed to be updated.
> > > >
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> > > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > > Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> > > > Cc: Russell King <linux@armlinux.org.uk>
> > > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > > ---
> > > >  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 2 ++
> > > >  drivers/gpu/drm/armada/armada_drv.c             | 2 ++
> > > >  drivers/gpu/drm/vboxvideo/vbox_drv.c            | 2 ++
> > > >  3 files changed, 6 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> > > > index 442d4656150a..16dfd5cdb66c 100644
> > > > --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> > > > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> > > > @@ -14,6 +14,7 @@
> > > >  #include <drm/drm_gem_cma_helper.h>
> > > >  #include <drm/drm_gem_framebuffer_helper.h>
> > > >  #include <drm/drm_irq.h>
> > > > +#include <drm/drm_managed.h>
> > > >  #include <drm/drm_probe_helper.h>
> > > >  #include <drm/drm_vblank.h>
> > > >
> > > > @@ -271,6 +272,7 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
> > > >       err = drm_dev_init(drm, &komeda_kms_driver, mdev->dev);
> > > >       if (err)
> > > >               goto free_kms;
> > > > +     drmm_add_final_kfree(drm, kms);
> > >
> > > Instead of sprinkling calls to drmm_add_final_kfree() everywhere,
> > > wouldn't it be better to pass the parent pointer to drm_dev_init() ?
> >
> > Would lead to a horrendous monster patch, and even with this splitting
> > there were a few corner cases.
>
> It could be generated by coccinelle, with the semantic patch included in
> the commit message, so that regenerating it should be possible when
> merging if conflict arise.

It's not that easy, because drivers are buggy. So you need to review
the remove/release implementation for all of them (which I've done) to
make sure you're not making things worse with some additional
use-after-free or something else horrible. That's why this is so much
split up.

So automated patch for this is out of the window imo.
-Daniel

> > My plan is to add a devm_drm_dev_alloc
> > pattern which combines the usual pattern that most drivers use, see
> > the last patch for all these glorious ideas.
>
> OK I will.
>
> > So yeah I hope this will all go away (or mostly at least), but for
> > bisecting I didn't come up with a better idea to get this all off the
> > ground unfortunately.
> >
> > > >
> > > >       drm->dev_private = mdev;
> > > >
> > > > diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> > > > index 197dca3fc84c..dd9ed71ed942 100644
> > > > --- a/drivers/gpu/drm/armada/armada_drv.c
> > > > +++ b/drivers/gpu/drm/armada/armada_drv.c
> > > > @@ -12,6 +12,7 @@
> > > >  #include <drm/drm_atomic_helper.h>
> > > >  #include <drm/drm_drv.h>
> > > >  #include <drm/drm_ioctl.h>
> > > > +#include <drm/drm_managed.h>
> > > >  #include <drm/drm_prime.h>
> > > >  #include <drm/drm_probe_helper.h>
> > > >  #include <drm/drm_fb_helper.h>
> > > > @@ -103,6 +104,7 @@ static int armada_drm_bind(struct device *dev)
> > > >               kfree(priv);
> > > >               return ret;
> > > >       }
> > > > +     drmm_add_final_kfree(&priv->drm, priv);
> > > >
> > > >       /* Remove early framebuffers */
> > > >       ret = drm_fb_helper_remove_conflicting_framebuffers(NULL,
> > > > diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> > > > index 8512d970a09f..13eaae7921f5 100644
> > > > --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> > > > +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> > > > @@ -17,6 +17,7 @@
> > > >  #include <drm/drm_fb_helper.h>
> > > >  #include <drm/drm_file.h>
> > > >  #include <drm/drm_ioctl.h>
> > > > +#include <drm/drm_managed.h>
> > > >
> > > >  #include "vbox_drv.h"
> > > >
> > > > @@ -54,6 +55,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > > >       vbox->ddev.pdev = pdev;
> > > >       vbox->ddev.dev_private = vbox;
> > > >       pci_set_drvdata(pdev, vbox);
> > > > +     drmm_add_final_kfree(&vbox->ddev, vbox);
> > > >       mutex_init(&vbox->hw_mutex);
> > > >
> > > >       ret = pci_enable_device(pdev);
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
