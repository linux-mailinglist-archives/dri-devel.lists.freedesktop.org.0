Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD1262DB9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 13:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA8D6EE3C;
	Wed,  9 Sep 2020 11:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DC26EE3D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 11:21:05 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id q34so472855ooi.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 04:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F5vkFVY+5yDtbQC8xbQeFUQjPyEEdRgV1nV9wghNA6s=;
 b=Vv9T76hCYichLO2tZ3YrMw1qQc/nlCaoJFrzfvT54aYmzlQ+4dXVGug0xjZH/Ejd1Y
 +7oIca/MiD6kGlqDbYpmKlCoqRd9p+jUr8FQV534txF3eLfpyh/lOInYW1Vgl2ZUYJau
 od0/XyL0oF+A+Hu/bgLJRM9IrgRdjmwlTgFDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F5vkFVY+5yDtbQC8xbQeFUQjPyEEdRgV1nV9wghNA6s=;
 b=JOMV6CzuP1hP9bo0yddAYuxOqwDHh89v4QfYzdoF3GaNmNFLXt2CMP+SBEkoN+SuPL
 A680ddsTkwnZePpTttq8XTd72YGvMVoHJCMpvg8/PbFvpbjFwHLqohXz57ZATrYG7RSK
 pPBsA2UNawPEtQd4XrGWECwGUeW4jY9H58bqdBAfY/Vr+uf+6JGBb7lIKAY7IVDL9GMt
 a4mGDFRtlivOuTYyMujXp/N4LPx4j5gdm0RKXfjxPxpXM3DeEJoZgPjIelqirjDFDxwv
 zbRBl8hPWMcgHPb7xNWfEuwMdjF34vVWBTRNNmW8O+eZMG5BpnGIPv8wFWC65wI/HgPq
 sSFA==
X-Gm-Message-State: AOAM532Nx4JXHsONbVgohQgoVRH3filj9rhz8/1W6wuWiePu5pRip37H
 j9jM6cH4FGXYSvHXLmGFIGhwLepgJXRSg0H8cRKPuA==
X-Google-Smtp-Source: ABdhPJxe8oYP/kXFxQqNDVb6Oqga1YXdOXt7rAh1XpyVW9fM3NF2/96jNp+xb4aEF0O+fPggtzra7TytYTXfDrMTfj4=
X-Received: by 2002:a4a:344b:: with SMTP id n11mr362136oof.89.1599650465193;
 Wed, 09 Sep 2020 04:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
 <20200904143941.110665-5-daniel.vetter@ffwll.ch>
 <20200909110144.pyptgix7y7yftuxy@smtp.gmail.com>
In-Reply-To: <20200909110144.pyptgix7y7yftuxy@smtp.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 9 Sep 2020 13:20:54 +0200
Message-ID: <CAKMK7uFJ3Yf-rnb5VAYj1xF2VZmoY+yt+zWyRcaMLU0t6eCyoA@mail.gmail.com>
Subject: Re: [PATCH 04/24] drm/vgem: Use devm_drm_dev_alloc
To: Melissa Wen <melissa.srw@gmail.com>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 9, 2020 at 1:01 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> Hi Daniel,
>
> looks good to me, just a few things inline.
>
> On 09/04, Daniel Vetter wrote:
> > This means we also need to slightly restructure the exit code, so that
> > final cleanup of the drm_device is triggered by unregistering the
> > platform device. Note that devres is both clean up when the driver is
> > unbound (not the case for vgem, we don't bind), and also when unregistering
> > the device (very much the case for vgem). Therefore we can rely on devres
> > even though vgem isn't a proper platform device driver.
> >
> > This also somewhat untangles the load code, since the drm and platform device
> > setup are no longer interleaved, but two distinct steps.
> >
> > v2: use devres_open/release_group so we can use devm without real
> > hacks in the driver core or having to create an entire fake bus for
> > testing drivers. Might want to extract this into helpers eventually,
> > maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Emil Velikov <emil.velikov@collabora.com>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/vgem/vgem_drv.c | 55 ++++++++++++++-------------------
> >  1 file changed, 24 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> > index 313339bbff90..f95537627463 100644
> > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > @@ -401,16 +401,8 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
> >       return 0;
> >  }
> >
> > -static void vgem_release(struct drm_device *dev)
> > -{
> > -     struct vgem_device *vgem = container_of(dev, typeof(*vgem), drm);
> > -
> > -     platform_device_unregister(vgem->platform);
> > -}
> > -
> >  static struct drm_driver vgem_driver = {
> >       .driver_features                = DRIVER_GEM | DRIVER_RENDER,
> > -     .release                        = vgem_release,
> >       .open                           = vgem_open,
> >       .postclose                      = vgem_postclose,
> >       .gem_free_object_unlocked       = vgem_gem_free_object,
> > @@ -442,48 +434,49 @@ static struct drm_driver vgem_driver = {
> >  static int __init vgem_init(void)
> >  {
> >       int ret;
> > +     struct platform_device *pdev;
> >
> > -     vgem_device = kzalloc(sizeof(*vgem_device), GFP_KERNEL);
> > -     if (!vgem_device)
> > -             return -ENOMEM;
> > +     pdev = platform_device_register_simple("vgem", -1, NULL, 0);
> > +     if (IS_ERR(pdev))
> > +             return PTR_ERR(vgem_device->platform);
> I caught this line right above.
> It should be: return PTR_ERR (pdev), right?

Yes I will fix.

> > -     vgem_device->platform =
> > -             platform_device_register_simple("vgem", -1, NULL, 0);
> > -     if (IS_ERR(vgem_device->platform)) {
> > -             ret = PTR_ERR(vgem_device->platform);
> > -             goto out_free;
> > +     if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> > +             ret = -ENOMEM;
> > +             goto out_unregister;
> >       }
> >
> > -     dma_coerce_mask_and_coherent(&vgem_device->platform->dev,
> > +     dma_coerce_mask_and_coherent(&pdev->dev,
> >                                    DMA_BIT_MASK(64));
> > -     ret = drm_dev_init(&vgem_device->drm, &vgem_driver,
> > -                        &vgem_device->platform->dev);
> > -     if (ret)
> > -             goto out_unregister;
> > -     drmm_add_final_kfree(&vgem_device->drm, vgem_device);
> > +
> > +     vgem_device = devm_drm_dev_alloc(&pdev->dev, &vgem_driver,
> > +                                      struct vgem_device, drm);
> > +     if (IS_ERR(vgem_device)) {
> > +             ret = PTR_ERR(vgem_device);
> > +             goto out_devres;
> > +     }
> > +     vgem_device->platform = pdev;
> >
> >       /* Final step: expose the device/driver to userspace */
> >       ret = drm_dev_register(&vgem_device->drm, 0);
> >       if (ret)
> > -             goto out_put;
> > +             goto out_devres;
> >
> >       return 0;
> >
> > -out_put:
> > -     drm_dev_put(&vgem_device->drm);
> > -     platform_device_unregister(vgem_device->platform);
> > -     return ret;
> > +out_devres:
> > +     devres_release_group(&pdev->dev, NULL);
> >  out_unregister:
> > -     platform_device_unregister(vgem_device->platform);
> > -out_free:
> > -     kfree(vgem_device);
> > +     platform_device_unregister(pdev);
> >       return ret;
> >  }
> >
> >  static void __exit vgem_exit(void)
> >  {
> > +     struct platform_device *pdev = vgem_device->platform;
> > +
> Well, there has never been a check for a null vgem_device here before,
> as in vkms. Should?

I think it should, but that's kinda a separate patch. Want to type it?
-Daniel

> >       drm_dev_unregister(&vgem_device->drm);
> > -     drm_dev_put(&vgem_device->drm);
> > +     devres_release_group(&pdev->dev, NULL);
> > +     platform_device_unregister(pdev);
> >  }
> >
> >  module_init(vgem_init);
> > --
> > 2.28.0
>
> Apart from these two points,
>
> Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
>
> Thanks!
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
