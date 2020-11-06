Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5972A97D5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 15:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCEA6E03A;
	Fri,  6 Nov 2020 14:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C841F6E03A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604673958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cFd8XANW2NnqIDs5fKPXlkt8TxDQ++SJbHnaDAAQH+k=;
 b=Ds6RtwQUazIDzTCFZIV8kyVFmkjrLvbgDQWyceeYM6MLwcuWlAIUiG64FrBVk6vYlw4kEd
 1EzPKTNsVmDhM57KvG6GLubjL39qMSvc6j4QpaRz22i+AJA+78J2lJYASWYmT97wiYLWA/
 tfVI8PY4AA5BhljKZlhfUR0NsnKTe/w=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-hkoWZY7dM9CVm4sjH4KrNA-1; Fri, 06 Nov 2020 09:45:56 -0500
X-MC-Unique: hkoWZY7dM9CVm4sjH4KrNA-1
Received: by mail-qk1-f200.google.com with SMTP id x5so855898qkn.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 06:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cFd8XANW2NnqIDs5fKPXlkt8TxDQ++SJbHnaDAAQH+k=;
 b=m9OJPJowNKuOd8J/3oSCxko7TQKsbwU/5tU+kArl1OVyvqiNusfGeBINBJHxMsNgOm
 dgxBEF9XY0cW9tvmWjDGPkl2sqo1tOSHd/mkFL8wiFZe91Ex4lMjj6oPjkygPzDksmd0
 t9XmA/Wu2xXQ23fMDcaMYu4JAbcPy0ypcdcakXOHXe6kUTfq7+e9PXuZeWWCgXzeV9YD
 VA0euvCOwPuys7nnggrS5omu7FxlxrzEWqfPNmFMCydthYqCJQzqIl3CQK/iYPLuPFM4
 vU2a/YqgXhEtCKZ/Jk4durGAnxdTu6fyQnhLJTbDXNt075BBfNcCveMts7xEm+e6piiD
 NAZA==
X-Gm-Message-State: AOAM531xhnSs3+LZeRvrMq1Bf4Zc9aSVN9TAXh6+/NfNHY9iLjdCO02Z
 cv91jkwMuBiIq0GfOZJX7/W4TuN5nAHIHY6VCyaS/soeG5c/nm8VKCVRMuIEcJrL4afoWty2QCp
 Qp5bkEhDyUlXJBCF46zYWN07TfhLe
X-Received: by 2002:ac8:7a7b:: with SMTP id w27mr1820842qtt.381.1604673955465; 
 Fri, 06 Nov 2020 06:45:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVvVeyqh85AZyi8q2FX0MGeNnGekEj5wHHNrBCPg310gp4Id2tCxZmt7Ocg8HZKlHCzrDATA==
X-Received: by 2002:ac8:7a7b:: with SMTP id w27mr1820808qtt.381.1604673955102; 
 Fri, 06 Nov 2020 06:45:55 -0800 (PST)
Received: from xps13 ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id h9sm590245qth.78.2020.11.06.06.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 06:45:53 -0800 (PST)
Date: Fri, 6 Nov 2020 09:45:51 -0500
From: Jeremy Cline <jcline@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau: manage nouveau_drm lifetime
 with devres
Message-ID: <20201106144551.GA7656@xps13>
References: <20201106021656.40743-1-jcline@redhat.com>
 <20201106021656.40743-3-jcline@redhat.com>
 <CACO55tsRGOH5rwy-40_6FY_9mGZKfkiFBoAT2jowbQYmaLGK8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tsRGOH5rwy-40_6FY_9mGZKfkiFBoAT2jowbQYmaLGK8g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 02:31:44PM +0100, Karol Herbst wrote:
> On Fri, Nov 6, 2020 at 3:17 AM Jeremy Cline <jcline@redhat.com> wrote:
> >
> > Make use of the devm_drm_dev_alloc() API to bind the lifetime of
> > nouveau_drm structure to the drm_device. This is important because a
> > reference to nouveau_drm is accessible from drm_device, which is
> > provided to a number of DRM layer callbacks that can run after the
> > deallocation of nouveau_drm currently occurs.
> >
> > Signed-off-by: Jeremy Cline <jcline@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_drm.c | 44 ++++++++++++---------------
> >  drivers/gpu/drm/nouveau/nouveau_drv.h | 10 ++++--
> >  2 files changed, 26 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > index bc6f51bf23b7..f750c25e92f9 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > @@ -30,9 +30,11 @@
> >  #include <linux/vga_switcheroo.h>
> >  #include <linux/mmu_notifier.h>
> >
> > +#include <drm/drm_drv.h>
> >  #include <drm/drm_crtc_helper.h>
> >  #include <drm/drm_ioctl.h>
> >  #include <drm/drm_vblank.h>
> > +#include <drm/drm_managed.h>
> >
> >  #include <core/gpuobj.h>
> >  #include <core/option.h>
> > @@ -532,13 +534,8 @@ nouveau_parent = {
> >  static int
> >  nouveau_drm_device_init(struct drm_device *dev)
> >  {
> > -       struct nouveau_drm *drm;
> >         int ret;
> > -
> > -       if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
> > -               return -ENOMEM;
> > -       dev->dev_private = drm;
> > -       drm->dev = dev;
> > +       struct nouveau_drm *drm = nouveau_drm(dev);
> >
> >         nvif_parent_ctor(&nouveau_parent, &drm->parent);
> >         drm->master.base.object.parent = &drm->parent;
> > @@ -620,7 +617,6 @@ nouveau_drm_device_init(struct drm_device *dev)
> >         nouveau_cli_fini(&drm->master);
> >  fail_alloc:
> >         nvif_parent_dtor(&drm->parent);
> > -       kfree(drm);
> >         return ret;
> >  }
> >
> > @@ -654,7 +650,6 @@ nouveau_drm_device_fini(struct drm_device *dev)
> >         nouveau_cli_fini(&drm->client);
> >         nouveau_cli_fini(&drm->master);
> >         nvif_parent_dtor(&drm->parent);
> > -       kfree(drm);
> >  }
> >
> >  /*
> > @@ -720,6 +715,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> >  {
> >         struct nvkm_device *device;
> >         struct drm_device *drm_dev;
> > +       struct nouveau_drm *nv_dev;
> >         int ret;
> >
> >         if (vga_switcheroo_client_probe_defer(pdev))
> > @@ -750,15 +746,16 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> >         if (nouveau_atomic)
> >                 driver_pci.driver_features |= DRIVER_ATOMIC;
> >
> > -       drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
> > -       if (IS_ERR(drm_dev)) {
> > -               ret = PTR_ERR(drm_dev);
> > +       nv_dev = devm_drm_dev_alloc(&pdev->dev, &driver_stub, typeof(*nv_dev), drm_dev);
> > +       if (IS_ERR(nv_dev)) {
> > +               ret = PTR_ERR(nv_dev);
> >                 goto fail_nvkm;
> >         }
> > +       drm_dev = nouveau_to_drm_dev(nv_dev);
> >
> >         ret = pci_enable_device(pdev);
> >         if (ret)
> > -               goto fail_drm;
> > +               goto fail_nvkm;
> >
> >         drm_dev->pdev = pdev;
> >         pci_set_drvdata(pdev, drm_dev);
> > @@ -778,8 +775,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> >         nouveau_drm_device_fini(drm_dev);
> >  fail_pci:
> >         pci_disable_device(pdev);
> > -fail_drm:
> > -       drm_dev_put(drm_dev);
> 
> it sounded like that when using devm_drm_dev_alloc we still have an
> initial refcount of 1, so at least in this regard nothing changed so I
> am wondering why this change is necessary and if the reason is
> unrelated it might make sense to move it into its own patch.
> 

The way I read the supporting code is that when the allocation occurs,
an action is registered on the parent device to call drm_dev_put(), so
as long as the PCI device is dropped, and as far as I could tell it is
when an error is returned, it should be handled automatically. The same
I *think* goes for the platform device variety with Tegra.

However, this is by far the most likely thing for me to have
misunderstood so I'll look through it a second time and would love to
have a second opinion on it.

> >  fail_nvkm:
> >         nvkm_device_del(&device);
> >         return ret;
> > @@ -799,7 +794,6 @@ nouveau_drm_device_remove(struct drm_device *dev)
> >         device = nvkm_device_find(client->device);
> >
> >         nouveau_drm_device_fini(dev);
> > -       drm_dev_put(dev);
> >         nvkm_device_del(&device);
> >  }
> >
> > @@ -1285,7 +1279,8 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
> >                                struct platform_device *pdev,
> >                                struct nvkm_device **pdevice)
> >  {
> > -       struct drm_device *drm;
> > +       struct nouveau_drm *nv_dev;
> > +       struct drm_device *drm_dev;
> >         int err;
> >
> >         err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
> > @@ -1293,22 +1288,21 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
> >         if (err)
> >                 goto err_free;
> >
> > -       drm = drm_dev_alloc(&driver_platform, &pdev->dev);
> > -       if (IS_ERR(drm)) {
> > -               err = PTR_ERR(drm);
> > +       nv_dev = devm_drm_dev_alloc(&pdev->dev, &driver_platform, typeof(*nv_dev), drm_dev);
> > +       if (IS_ERR(nv_dev)) {
> > +               err = PTR_ERR(nv_dev);
> >                 goto err_free;
> >         }
> > +       drm_dev = nouveau_to_drm_dev(nv_dev);
> >
> > -       err = nouveau_drm_device_init(drm);
> > +       err = nouveau_drm_device_init(drm_dev);
> >         if (err)
> > -               goto err_put;
> > +               goto err_free;
> >
> > -       platform_set_drvdata(pdev, drm);
> > +       platform_set_drvdata(pdev, drm_dev);
> >
> > -       return drm;
> > +       return drm_dev;
> >
> > -err_put:
> > -       drm_dev_put(drm);
> >  err_free:
> >         nvkm_device_del(pdevice);
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > index 3e2920a10099..cf6c33e52a5c 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > @@ -137,7 +137,11 @@ struct nouveau_drm {
> >         struct nvif_parent parent;
> >         struct nouveau_cli master;
> >         struct nouveau_cli client;
> > -       struct drm_device *dev;
> > +
> > +       /**
> > +        * @drm_dev: The parent DRM device object.
> > +        */
> > +       struct drm_device drm_dev;
> >
> >         struct list_head clients;
> >
> > @@ -237,7 +241,7 @@ struct nouveau_drm {
> >  static inline struct nouveau_drm *
> >  nouveau_drm(struct drm_device *dev)
> >  {
> > -       return dev->dev_private;
> > +       return container_of(dev, struct nouveau_drm, drm_dev);
> >  }
> >
> >  /**
> > @@ -251,7 +255,7 @@ nouveau_drm(struct drm_device *dev)
> >   */
> >  static inline struct drm_device *
> >  nouveau_to_drm_dev(struct nouveau_drm *nv_dev) {
> > -       return nv_dev->dev;
> > +       return &nv_dev->drm_dev;
> >  }
> >
> >  /**
> > --
> > 2.28.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
