Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD474B143
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481EA10E57C;
	Fri,  7 Jul 2023 12:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6C510E57C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688734060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ZTPvwORxcIkhTMzwCYudWgV77gCBI+QMvBmqJPES5o=;
 b=e/4t/rYRCRbB14+cr4iCXJ+w1tvjXRpPxyGZURvjS3PAuFyE10w9FO9JlfH1lHMrUzHyK+
 ea0vCpujoX2bq9rLy942enmb8oW7GcoiDWb8RXmlo+GFl7Kkw4hrJU6v5i51JP4vfH13Fi
 kRnIwMNyWdFkQ/EhDi+N/xBnXltJBzg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-BsA3SH78PUWg3SWcR1CNdg-1; Fri, 07 Jul 2023 08:47:38 -0400
X-MC-Unique: BsA3SH78PUWg3SWcR1CNdg-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6238c3bf768so20762706d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 05:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688734058; x=1691326058;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZTPvwORxcIkhTMzwCYudWgV77gCBI+QMvBmqJPES5o=;
 b=LSTNLi/hjzhwWhvWhF2+/QY666pEsV4QbLlJ02YhKIJQcX90DCbLI2b5fdmycyg+uB
 IGh/MGP2c9+FVwSu8YWWJD1JMBRw1DbqZ92rDpkg3YAJo22gVn+T6ST8Quzgid+k3nan
 dDpPa+0PbaT4BBWJhUH3mPvgPrvppm+4JFcy+YY3AkD0K1f2WPILG6/pdflVc+c5KIT+
 ylscM1Wc2ht/VAy2F08kywZ8myCfKAKWt5F5yPhdBpNjM9W2OzH+jj9NWbBoYG96q/Tj
 cjyKHWlEXBsXpi9/zo3J01gcZVmIn3K7pkWvO0PsUx90hXviqNjPrtXbIs9sHrEIiO4p
 tQyg==
X-Gm-Message-State: ABy/qLbMKifmZdijpOws2psYnjb6o70xi2zkeHEeIKq5uewHupfn4Tia
 Q/i5Gua2C2ED9nhE4l/rIlqQiVundW/cgo64mnWMtm8jDSIN37uNO3Q7ZsmdVmD4KSxkgH9tG0j
 WRRFcBmLsENJzFEJ0YqfgIYFjvzYu
X-Received: by 2002:a0c:e554:0:b0:636:afa1:345e with SMTP id
 n20-20020a0ce554000000b00636afa1345emr4651301qvm.12.1688734057969; 
 Fri, 07 Jul 2023 05:47:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFTGMvFUDnJ6dfedq+YUJSF/ShXqsfVoVX122TAF4yTo3CuHtXye/pmTEIZ5kZdEyflfHB/Zw==
X-Received: by 2002:a0c:e554:0:b0:636:afa1:345e with SMTP id
 n20-20020a0ce554000000b00636afa1345emr4651274qvm.12.1688734057524; 
 Fri, 07 Jul 2023 05:47:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::5bb])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a0cf4d4000000b0063007ccaf42sm2058494qvm.57.2023.07.07.05.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 05:47:37 -0700 (PDT)
Date: Fri, 7 Jul 2023 14:47:35 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH v3 05/17] drm/imagination: Get GPU resources
Message-ID: <jcency6zbrhkqpjaxkt3z3dh6d5ac7q75xp6pqedrycrvqhgfm@knpvdv6sqofh>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-6-sarah.walker@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3cbbwlulsuj2hp4o"
Content-Disposition: inline
In-Reply-To: <20230613144800.52657-6-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 sumit.semwal@linaro.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3cbbwlulsuj2hp4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 03:47:48PM +0100, Sarah Walker wrote:
> Acquire clock, regulator and register resources, and enable/map as
> appropriate.
>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
>  drivers/gpu/drm/imagination/Makefile     |   1 +
>  drivers/gpu/drm/imagination/pvr_device.c | 271 +++++++++++++++++++++++
>  drivers/gpu/drm/imagination/pvr_device.h | 214 ++++++++++++++++++
>  drivers/gpu/drm/imagination/pvr_drv.c    |  11 +-
>  4 files changed, 496 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device.c
>
> diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
> index 62ccf0ccbd51..186f920d615b 100644
> --- a/drivers/gpu/drm/imagination/Makefile
> +++ b/drivers/gpu/drm/imagination/Makefile
> @@ -4,6 +4,7 @@
>  subdir-ccflags-y := -I$(srctree)/$(src)
>
>  powervr-y := \
> +     pvr_device.o \
>       pvr_drv.o \
>
>  obj-$(CONFIG_DRM_POWERVR) += powervr.o
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
> new file mode 100644
> index 000000000000..790c36cebec1
> --- /dev/null
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/* Copyright (c) 2022 Imagination Technologies Ltd. */
> +
> +#include "pvr_device.h"
> +
> +#include <drm/drm_print.h>
> +
> +#include <linux/clk.h>
> +#include <linux/compiler_attributes.h>
> +#include <linux/compiler_types.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/gfp.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/stddef.h>
> +#include <linux/types.h>
> +
> +/**
> + * pvr_device_reg_init() - Initialize kernel access to a PowerVR device's
> + * control registers.
> + * @pvr_dev: Target PowerVR device.
> + *
> + * Sets struct pvr_device->regs.
> + *
> + * This method of mapping the device control registers into memory ensures that
> + * they are unmapped when the driver is detached (i.e. no explicit cleanup is
> + * required).
> + *
> + * Return:
> + *  * 0 on success, or
> + *  * Any error returned by devm_platform_ioremap_resource().
> + */
> +static int
> +pvr_device_reg_init(struct pvr_device *pvr_dev)
> +{
> +     struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> +     struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
> +     struct resource *regs_resource;
> +     void __iomem *regs;
> +     int err;
> +
> +     pvr_dev->regs_resource = NULL;
> +     pvr_dev->regs = NULL;
> +
> +     regs = devm_platform_get_and_ioremap_resource(plat_dev, 0, &regs_resource);
> +     if (IS_ERR(regs)) {
> +             err = PTR_ERR(regs);
> +             drm_err(drm_dev, "failed to ioremap gpu registers (err=%d)\n",
> +                     err);
> +             return err;
> +     }
> +
> +     pvr_dev->regs = regs;
> +     pvr_dev->regs_resource = regs_resource;

Do you actually need the resources somewhere?

> +
> +     return 0;
> +}
> +
> +/**
> + * pvr_device_reg_fini() - Deinitialize kernel access to a PowerVR device's
> + * control registers.
> + * @pvr_dev: Target PowerVR device.
> + *
> + * This is essentially a no-op, since pvr_device_reg_init() already ensures that
> + * struct pvr_device->regs is unmapped when the device is detached. This
> + * function just sets struct pvr_device->regs to %NULL.
> + */
> +static __always_inline void
> +pvr_device_reg_fini(struct pvr_device *pvr_dev)
> +{
> +     pvr_dev->regs = NULL;

But if you do, I guess clearing the regs_resource pointer would be nice too.

> +}
> +
> +/**
> + * pvr_device_clk_init() - Initialize clocks required by a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + *
> + * Sets struct pvr_device->core_clk, struct pvr_device->sys_clk and
> + * struct pvr_device->mem_clk.
> + *
> + * Three clocks are required by the PowerVR device: core, sys and mem. On
> + * return, this function guarantees that the clocks are in one of the following
> + * states:
> + *
> + *  * All successfully initialized,
> + *  * Core errored, sys and mem uninitialized,
> + *  * Core deinitialized, sys errored, mem uninitialized, or
> + *  * Core and sys deinitialized, mem errored.
> + *
> + * Return:
> + *  * 0 on success,
> + *  * Any error returned by devm_clk_get(), or
> + *  * Any error returned by clk_prepare_enable().
> + */
> +static int pvr_device_clk_init(struct pvr_device *pvr_dev)
> +{
> +     struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> +     struct clk *core_clk;
> +     struct clk *sys_clk;
> +     struct clk *mem_clk;
> +     int err;
> +
> +     pvr_dev->core_clk = NULL;
> +     pvr_dev->sys_clk = NULL;
> +     pvr_dev->mem_clk = NULL;
> +
> +     core_clk = devm_clk_get(drm_dev->dev, "core");
> +     if (IS_ERR(core_clk)) {
> +             err = PTR_ERR(core_clk);
> +             drm_err(drm_dev, "failed to get core clock (err=%d)\n", err);
> +             goto err_out;
> +     }
> +
> +     sys_clk = devm_clk_get(drm_dev->dev, "sys");
> +     if (IS_ERR(sys_clk))
> +             sys_clk = NULL;
> +
> +     mem_clk = devm_clk_get(drm_dev->dev, "mem");
> +     if (IS_ERR(mem_clk))
> +             mem_clk = NULL;

If those two are optionals, you can use devm_clk_get_optional. This has
the advantage of only ignoring the case where the clock isn't there, but
not the other error conditions.

> +
> +     err = clk_prepare(core_clk);
> +     if (err)
> +             goto err_out;
> +
> +     if (sys_clk) {
> +             err = clk_prepare(sys_clk);

It's valid to call clk_prepare(NULL), which will be a nop. I think you
can remove the check on the null pointer.

Also do you need to split prepare and enable? The usual reason to do so
is that prepare can sleep and thus can't be called in an atomic context,
but enable can. I can't think of a case where that would happen for a
GPU though, so you should probably do both at once?

You should also consider using the devm variants there like
devm_clk_get_optional_prepared and similar, depending on how you address
the comments above. This will greatly simplify your exit / cleanup path.

> +             if (err)
> +                     goto err_deinit_core_clk;
> +     }
> +
> +     if (mem_clk) {
> +             err = clk_prepare(mem_clk);
> +             if (err)
> +                     goto err_deinit_sys_clk;
> +     }
> +
> +     pvr_dev->core_clk = core_clk;
> +     pvr_dev->sys_clk = sys_clk;
> +     pvr_dev->mem_clk = mem_clk;
> +
> +     return 0;
> +
> +err_deinit_sys_clk:
> +     if (sys_clk)
> +             clk_disable_unprepare(sys_clk);
> +err_deinit_core_clk:
> +     clk_disable_unprepare(core_clk);

Since the clocks haven't been enabled yet, this will create an enable
count imbalance.

> +/**
> + * pvr_device_regulator_init() - Initialise regulator required by a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + *
> + * The regulator is not a required devicetree property. If it is not present then this function will
> + * succeed, but &pvr_device->regulator will be %NULL.
> + *
> + * Returns:
> + *  * 0 on success, or
> + *  * Any error returned by devm_regulator_get().
> + */
> +static int
> +pvr_device_regulator_init(struct pvr_device *pvr_dev)
> +{
> +     struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> +     struct regulator *regulator;
> +     int err;
> +
> +     regulator = devm_regulator_get(drm_dev->dev, "power");
> +     if (IS_ERR(regulator)) {
> +             err = PTR_ERR(regulator);
> +             /* Regulator is not required, so ENODEV is allowed here. */
> +             if (err != -ENODEV)
> +                     goto err_out;

This is what regulator_get_optional does :)

> +/**
> + * pvr_device_init() - Initialize a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + *
> + * If this function returns successfully, the device will have been fully
> + * initialized. Otherwise, any parts of the device initialized before an error
> + * occurs will be de-initialized before returning.
> + *
> + * NOTE: The initialization steps currently taken are the bare minimum required
> + *       to read from the control registers. The device is unlikely to function
> + *       until further initialization steps are added. [This note should be
> + *       removed when that happens.]
> + *
> + * Return:
> + *  * 0 on success,
> + *  * Any error returned by pvr_device_reg_init(),
> + *  * Any error returned by pvr_device_clk_init(), or
> + *  * Any error returned by pvr_device_gpu_init().
> + */
> +int
> +pvr_device_init(struct pvr_device *pvr_dev)
> +{
> +     int err;
> +
> +     /* Enable and initialize clocks required for the device to operate. */
> +     err = pvr_device_clk_init(pvr_dev);
> +     if (err)
> +             goto err_out;
> +
> +     err = pvr_device_regulator_init(pvr_dev);
> +     if (err)
> +             goto err_device_clk_fini;
> +
> +     /* Map the control registers into memory. */
> +     err = pvr_device_reg_init(pvr_dev);
> +     if (err)
> +             goto err_device_reg_fini;
> +
> +     return 0;
> +
> +err_device_reg_fini:
> +     pvr_device_reg_fini(pvr_dev);

I think you got that one wrong, I don't think you should call
pvr_device_reg_fini if pvr_device_reg_init failed?

But switching to devm will solve this too.

>  /**
>   * struct pvr_device - powervr-specific wrapper for &struct drm_device
> @@ -26,6 +42,29 @@ struct pvr_device {
>        * from_pvr_device().
>        */
>       struct drm_device base;
> +
> +     /** @regs_resource: Resource representing device control registers. */
> +     struct resource *regs_resource;
> +
> +     /**
> +      * @regs: Device control registers.
> +      *
> +      * These are mapped into memory when the device is initialized; that
> +      * location is where this pointer points.
> +      */
> +     void __iomem *regs;
> +
> +     /** @core_clk: General core clock. */
> +     struct clk *core_clk;
> +
> +     /** @sys_clk: System bus clock. */
> +     struct clk *sys_clk;
> +
> +     /** @mem_clk: Memory clock. */
> +     struct clk *mem_clk;

It's not really a review but more of a suggestion: the semantics around
the clocks vary from one vendor to another, so having a bit more context
here in what those clocks are used for by the hardware and how we should
use them in the driver would be great.

> +     /** @regulator: Power regulator. */
> +     struct regulator *regulator;
>  };
>
>  /**
> @@ -72,6 +111,181 @@ to_pvr_file(struct drm_file *file)
>       return file->driver_priv;
>  }
>
> +int pvr_device_init(struct pvr_device *pvr_dev);
> +void pvr_device_fini(struct pvr_device *pvr_dev);
> +
> +int
> +pvr_device_clk_core_get_freq(struct pvr_device *pvr_dev, u32 *freq_out);

Do we really need a wrapper around clk_get_rate(pvr_dev->core_clk) ?

Also, this function is defined in patch 7.

> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
> index e203a2370f55..48a870715426 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -485,12 +485,19 @@ pvr_probe(struct platform_device *plat_dev)
>
>       platform_set_drvdata(plat_dev, drm_dev);
>
> -     err = drm_dev_register(drm_dev, 0);
> +     err = pvr_device_init(pvr_dev);
>       if (err)
>               goto err_out;
>
> +     err = drm_dev_register(drm_dev, 0);
> +     if (err)
> +             goto err_device_fini;
> +
>       return 0;
>
> +err_device_fini:
> +     pvr_device_fini(pvr_dev);
> +
>  err_out:
>       return err;
>  }
> @@ -499,8 +506,10 @@ static int
>  pvr_remove(struct platform_device *plat_dev)
>  {
>       struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
> +     struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
>
>       drm_dev_unregister(drm_dev);
> +     pvr_device_fini(pvr_dev);
>
>       return 0;
>  }

There's one gotcha you'll need to consider: DRM devices are unregistered
and freed not when the device goes away but when the last (userspace)
application closed its file descriptor.

This means that you have an undefined window during which devm will have
run (and thus cleaned up the resources) but the driver is still live and
can still get called.

So you need to protect all device resources access (registers, clocks
and regulator in your case I guess?) by calls to
drm_dev_enter/drm_dev_exit and use drm_dev_unplug instead of
drm_dev_unregister.

Maxime

--3cbbwlulsuj2hp4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZKgJZwAKCRDj7w1vZxhR
xYjyAQC5qzzIne58ExmwK5vrW1zuS54i7+eTWyOOBzkC0MNnZwEA3Eg0xp7/6S2U
7xNxncMFPMLs93aLpxz3KNvrWguv5g8=
=BpUG
-----END PGP SIGNATURE-----

--3cbbwlulsuj2hp4o--

