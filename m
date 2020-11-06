Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC22A9705
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 14:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A5A6E054;
	Fri,  6 Nov 2020 13:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D320E6E0BF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604669519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H+TezUSg7dLvy+l68Hy5i/kXoVUr9enrZZU+nQNhmr4=;
 b=W+lPFUiRhop+e2wZ4Wkli0/K5sPG5Hsu9QfPlEDOt7rSz1rroJLBhG2cJ9PWcNWJryzb3Q
 shwkvSSgat6B3ngky8sQ1N/W06Xf+qtmm9EXaxIqAmqI07KyCbtJuU9adc2WnGVeebnDFu
 yXG7CqYHglC02TXfDWb4SY/kSfo0pvg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-DVtamIshOIiDXnrvNdaETA-1; Fri, 06 Nov 2020 08:31:56 -0500
X-MC-Unique: DVtamIshOIiDXnrvNdaETA-1
Received: by mail-qk1-f197.google.com with SMTP id s5so658258qkj.21
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 05:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H+TezUSg7dLvy+l68Hy5i/kXoVUr9enrZZU+nQNhmr4=;
 b=FBw/22fD4poA+Zg5Gkbp7ZdOwI1aRFW7Bd89CTAnxCanjq45vpuPdGZbG4r9vA0p8a
 +PRk18/XOSblt/xgdbgtLIhWZtm39O2HrRo+AClGllJXkknC6VfcK/fHIsjuvTlekKLd
 rK2aOENis7PwK4682EcNBduWI/BIdyDYAX/wczAx+qjBFQMxo7hSqN6KGYAuEO27LKuJ
 8dtmeCjDKF7SUh0kBhw/Kn1j3bwmXxHIl1HRw/4UNtpOBodhlew6PyBAAlk6d7uWGFur
 iZYJglSNqTmTvtyEN/lfcL5hn99Je6fTn4/+YgKAdBZKKO8PvAhtISFBvQ8ue6u9P+8S
 +yUw==
X-Gm-Message-State: AOAM532SE57PoWnryZ1XJ6AJ4rghmFqmWN6FG1+BFh91M9Sk043RKLJM
 qH8kT2dxSGBINruv0T0vN9S5SlhECIVPmlMZoGXg5fFYDCSv4fnqxVJUafFpUktAOxyhdgx4zcc
 C18agNSuNQVRRY2UoBlRVaCfapOTrIzbN5B8BfItugGYq
X-Received: by 2002:ac8:7091:: with SMTP id y17mr223022qto.137.1604669515557; 
 Fri, 06 Nov 2020 05:31:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyu3cbrhu9g6f3NITckdttARw/NVAeKuSKVHYHWNP1ZBlgHMhdbCGrdhVO1eRoSn+j5wMPadxGqseSifPCLlas=
X-Received: by 2002:ac8:7091:: with SMTP id y17mr222996qto.137.1604669515256; 
 Fri, 06 Nov 2020 05:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20201106021656.40743-1-jcline@redhat.com>
 <20201106021656.40743-3-jcline@redhat.com>
In-Reply-To: <20201106021656.40743-3-jcline@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 6 Nov 2020 14:31:44 +0100
Message-ID: <CACO55tsRGOH5rwy-40_6FY_9mGZKfkiFBoAT2jowbQYmaLGK8g@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau: manage nouveau_drm lifetime
 with devres
To: Jeremy Cline <jcline@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Fri, Nov 6, 2020 at 3:17 AM Jeremy Cline <jcline@redhat.com> wrote:
>
> Make use of the devm_drm_dev_alloc() API to bind the lifetime of
> nouveau_drm structure to the drm_device. This is important because a
> reference to nouveau_drm is accessible from drm_device, which is
> provided to a number of DRM layer callbacks that can run after the
> deallocation of nouveau_drm currently occurs.
>
> Signed-off-by: Jeremy Cline <jcline@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 44 ++++++++++++---------------
>  drivers/gpu/drm/nouveau/nouveau_drv.h | 10 ++++--
>  2 files changed, 26 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index bc6f51bf23b7..f750c25e92f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -30,9 +30,11 @@
>  #include <linux/vga_switcheroo.h>
>  #include <linux/mmu_notifier.h>
>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_managed.h>
>
>  #include <core/gpuobj.h>
>  #include <core/option.h>
> @@ -532,13 +534,8 @@ nouveau_parent = {
>  static int
>  nouveau_drm_device_init(struct drm_device *dev)
>  {
> -       struct nouveau_drm *drm;
>         int ret;
> -
> -       if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
> -               return -ENOMEM;
> -       dev->dev_private = drm;
> -       drm->dev = dev;
> +       struct nouveau_drm *drm = nouveau_drm(dev);
>
>         nvif_parent_ctor(&nouveau_parent, &drm->parent);
>         drm->master.base.object.parent = &drm->parent;
> @@ -620,7 +617,6 @@ nouveau_drm_device_init(struct drm_device *dev)
>         nouveau_cli_fini(&drm->master);
>  fail_alloc:
>         nvif_parent_dtor(&drm->parent);
> -       kfree(drm);
>         return ret;
>  }
>
> @@ -654,7 +650,6 @@ nouveau_drm_device_fini(struct drm_device *dev)
>         nouveau_cli_fini(&drm->client);
>         nouveau_cli_fini(&drm->master);
>         nvif_parent_dtor(&drm->parent);
> -       kfree(drm);
>  }
>
>  /*
> @@ -720,6 +715,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>  {
>         struct nvkm_device *device;
>         struct drm_device *drm_dev;
> +       struct nouveau_drm *nv_dev;
>         int ret;
>
>         if (vga_switcheroo_client_probe_defer(pdev))
> @@ -750,15 +746,16 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>         if (nouveau_atomic)
>                 driver_pci.driver_features |= DRIVER_ATOMIC;
>
> -       drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
> -       if (IS_ERR(drm_dev)) {
> -               ret = PTR_ERR(drm_dev);
> +       nv_dev = devm_drm_dev_alloc(&pdev->dev, &driver_stub, typeof(*nv_dev), drm_dev);
> +       if (IS_ERR(nv_dev)) {
> +               ret = PTR_ERR(nv_dev);
>                 goto fail_nvkm;
>         }
> +       drm_dev = nouveau_to_drm_dev(nv_dev);
>
>         ret = pci_enable_device(pdev);
>         if (ret)
> -               goto fail_drm;
> +               goto fail_nvkm;
>
>         drm_dev->pdev = pdev;
>         pci_set_drvdata(pdev, drm_dev);
> @@ -778,8 +775,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>         nouveau_drm_device_fini(drm_dev);
>  fail_pci:
>         pci_disable_device(pdev);
> -fail_drm:
> -       drm_dev_put(drm_dev);

it sounded like that when using devm_drm_dev_alloc we still have an
initial refcount of 1, so at least in this regard nothing changed so I
am wondering why this change is necessary and if the reason is
unrelated it might make sense to move it into its own patch.

>  fail_nvkm:
>         nvkm_device_del(&device);
>         return ret;
> @@ -799,7 +794,6 @@ nouveau_drm_device_remove(struct drm_device *dev)
>         device = nvkm_device_find(client->device);
>
>         nouveau_drm_device_fini(dev);
> -       drm_dev_put(dev);
>         nvkm_device_del(&device);
>  }
>
> @@ -1285,7 +1279,8 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>                                struct platform_device *pdev,
>                                struct nvkm_device **pdevice)
>  {
> -       struct drm_device *drm;
> +       struct nouveau_drm *nv_dev;
> +       struct drm_device *drm_dev;
>         int err;
>
>         err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
> @@ -1293,22 +1288,21 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>         if (err)
>                 goto err_free;
>
> -       drm = drm_dev_alloc(&driver_platform, &pdev->dev);
> -       if (IS_ERR(drm)) {
> -               err = PTR_ERR(drm);
> +       nv_dev = devm_drm_dev_alloc(&pdev->dev, &driver_platform, typeof(*nv_dev), drm_dev);
> +       if (IS_ERR(nv_dev)) {
> +               err = PTR_ERR(nv_dev);
>                 goto err_free;
>         }
> +       drm_dev = nouveau_to_drm_dev(nv_dev);
>
> -       err = nouveau_drm_device_init(drm);
> +       err = nouveau_drm_device_init(drm_dev);
>         if (err)
> -               goto err_put;
> +               goto err_free;
>
> -       platform_set_drvdata(pdev, drm);
> +       platform_set_drvdata(pdev, drm_dev);
>
> -       return drm;
> +       return drm_dev;
>
> -err_put:
> -       drm_dev_put(drm);
>  err_free:
>         nvkm_device_del(pdevice);
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 3e2920a10099..cf6c33e52a5c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -137,7 +137,11 @@ struct nouveau_drm {
>         struct nvif_parent parent;
>         struct nouveau_cli master;
>         struct nouveau_cli client;
> -       struct drm_device *dev;
> +
> +       /**
> +        * @drm_dev: The parent DRM device object.
> +        */
> +       struct drm_device drm_dev;
>
>         struct list_head clients;
>
> @@ -237,7 +241,7 @@ struct nouveau_drm {
>  static inline struct nouveau_drm *
>  nouveau_drm(struct drm_device *dev)
>  {
> -       return dev->dev_private;
> +       return container_of(dev, struct nouveau_drm, drm_dev);
>  }
>
>  /**
> @@ -251,7 +255,7 @@ nouveau_drm(struct drm_device *dev)
>   */
>  static inline struct drm_device *
>  nouveau_to_drm_dev(struct nouveau_drm *nv_dev) {
> -       return nv_dev->dev;
> +       return &nv_dev->drm_dev;
>  }
>
>  /**
> --
> 2.28.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
