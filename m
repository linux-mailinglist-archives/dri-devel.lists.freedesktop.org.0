Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 769DF74B13F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3302C10E580;
	Fri,  7 Jul 2023 12:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFE110E580
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688734014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h5QN/zTz0knK0enedTr/JidWFLInMA5OfMWCoy9t0W4=;
 b=LE392qAiXbUQ3cr/vQswICp98JxVkHQDQ8vA3JrRPsInIb5XUO9RAmPZ3rjZubLLaVheBy
 FId1MTGFoi6ET5NxK6Mdo1mqtXvAk9YP9ZMDQPJ5UH5vrf2dNq5rK9c55tNVBODvDeGS3n
 kvjfhD3ZDLRQv8f2y0eXoS/skKWcl8g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-5CKp8J5LM-uACSRy2qywww-1; Fri, 07 Jul 2023 08:46:53 -0400
X-MC-Unique: 5CKp8J5LM-uACSRy2qywww-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-635e3871cf9so17762656d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 05:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688734012; x=1691326012;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5QN/zTz0knK0enedTr/JidWFLInMA5OfMWCoy9t0W4=;
 b=hyOmZkZVclAsQABxW5pC1tLuoib/d5pGkvLm2YDsaBoW0H/W3Do3C/WZegY2iGXRxg
 rA2HMIne6GaZCsx4mO7DbHXbgNh2/As84QInfHPp7dE+AltLd2UKdmwEWQY4W2atU/UP
 ZGR6o0twmKRW8RMrX1nDcS57gIRFzRWUwdoNfaclaV9oK7iC7xuUmIbO5pDFRsbMMoql
 QvbX0+CsU0N0vbIYAu223AN5yaMg+88CZ+gzMukwBodNV19BaKZEpm66PowIKeZwDaV4
 JhGWf5rNSif/ULXtGNXt0jkbMs4jjpbOhwpD1zha0zU5wKQQSqztZiCb2P05oRpxmtZV
 UM7A==
X-Gm-Message-State: ABy/qLa8Vup47MMm0GpLx/VE2tEEhfNRtf2rp1FDFZZ38MgJt+IyJdsQ
 yDuwDOS1CZW5b5HQ+PnFlz0ghcD2AGDAPBeJgi8tLWzuenzT+6ut6KIpO3UlG6he75eORPwj3ao
 d8WJdRSYB5R0qjvGDQu6h6vBFxnIH
X-Received: by 2002:a0c:f0d3:0:b0:61b:79ab:7129 with SMTP id
 d19-20020a0cf0d3000000b0061b79ab7129mr4220314qvl.37.1688734012544; 
 Fri, 07 Jul 2023 05:46:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGcp7XdvllF4sNBjDAwJcaSQ+CjcIQ9j9kZlZtSX7WDNoNxfe5eM1i4IBqEkd+7xo3F381X9g==
X-Received: by 2002:a0c:f0d3:0:b0:61b:79ab:7129 with SMTP id
 d19-20020a0cf0d3000000b0061b79ab7129mr4220291qvl.37.1688734012219; 
 Fri, 07 Jul 2023 05:46:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::5bb])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a0ca71a000000b006300e1db3ecsm2024091qva.141.2023.07.07.05.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 05:46:51 -0700 (PDT)
Date: Fri, 7 Jul 2023 14:46:50 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH v3 04/17] drm/imagination: Add skeleton PowerVR driver
Message-ID: <qt5b3tuxfcrup7roh2hiwhqzofj7kde3fc43vdblte6dbomupy@lsf7drxz7tx5>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-5-sarah.walker@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yyjythzjpndvm3sj"
Content-Disposition: inline
In-Reply-To: <20230613144800.52657-5-sarah.walker@imgtec.com>
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


--yyjythzjpndvm3sj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

[I just noticed I dropped the Cc list, resending]

Thanks for contributing this driver, it's awesome to see it moving
forward.

And congrats on the documentation too, it's not often we see a driver
that well documented on its v3.

I've stripped some parts of the patch that weren't relevant to my
review.

On Tue, Jun 13, 2023 at 03:47:47PM +0100, Sarah Walker wrote:
> +static __always_inline struct pvr_device *
> +to_pvr_device(struct drm_device *drm_dev)
> +{
> +     return container_of(drm_dev, struct pvr_device, base);
> +}

For that kind of helpers, we're slowly transitioning to using a macro
and container_of_const. This allows to work with const-ness context.

> +static int
> +pvr_probe(struct platform_device *plat_dev)
> +{
> +     struct pvr_device *pvr_dev;
> +     struct drm_device *drm_dev;
> +     int err;
> +
> +     pvr_dev = devm_drm_dev_alloc(&plat_dev->dev, &pvr_drm_driver,
> +                                  struct pvr_device, base);
> +     if (IS_ERR(pvr_dev)) {
> +             err = IS_ERR(pvr_dev);

PTR_ERR?

> +             goto err_out;

The general pattern here is to return directly here, it's simpler to
follow.

> +     }
> +     drm_dev = &pvr_dev->base;
> +
> +     platform_set_drvdata(plat_dev, drm_dev);
> +
> +     err = drm_dev_register(drm_dev, 0);
> +     if (err)
> +             goto err_out;

I guess it would be simpler here too, but I think you're going to move
things around anyway?

> +static const struct of_device_id dt_match[] = {
> +     { .compatible = "ti,am62-gpu", .data = NULL },
> +     { .compatible = "img,powervr-seriesaxe", .data = NULL },

Do you really need both? The binding you documented requires both to be
there, so I think you can either match on the more specific one (and
extend that list when needed) or match the more generic one and be done
with it once and for all. Having both is redundant.

> +     {}
> +};
> +MODULE_DEVICE_TABLE(of, dt_match);
> +
> +static struct platform_driver pvr_driver = {
> +     .probe = pvr_probe,
> +     .remove = pvr_remove,
> +     .driver = {
> +             .name = PVR_DRIVER_NAME,
> +             .of_match_table = dt_match,
> +     },
> +};
> +module_platform_driver(pvr_driver);
> +
> +MODULE_AUTHOR("Imagination Technologies Ltd.");
> +MODULE_DESCRIPTION(PVR_DRIVER_DESC);
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> +MODULE_FIRMWARE("powervr/rogue_4.40.2.51_v1.fw");
> +MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");

That one should probably be moved to the firmware patch?

> diff --git a/drivers/gpu/drm/imagination/pvr_drv.h b/drivers/gpu/drm/imagination/pvr_drv.h
> new file mode 100644
> index 000000000000..8e6f4a4dde3f
> --- /dev/null
> +++ b/drivers/gpu/drm/imagination/pvr_drv.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/* Copyright (c) 2022 Imagination Technologies Ltd. */
> +
> +#ifndef PVR_DRV_H
> +#define PVR_DRV_H
> +
> +#include "linux/compiler_attributes.h"
> +#include <uapi/drm/pvr_drm.h>
> +
> +#define PVR_DRIVER_NAME "powervr"
> +#define PVR_DRIVER_DESC "Imagination PowerVR Graphics"

Do you intend to support the SGX and Rogue GPUs with this driver? If
not, mentioning the generation/architecture name somewhere would be
nice.

Maxime

--yyjythzjpndvm3sj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZKgJOgAKCRDj7w1vZxhR
xRB1AP9QGeAUepZH5gkHw3BQyNM3cnRXBipMbmnq6sjiH7MOCQEA6PVRWzdn+DSQ
yOgBn0LHlio9O0smdCh5HJ2Fl3P/CAA=
=Q6u0
-----END PGP SIGNATURE-----

--yyjythzjpndvm3sj--

