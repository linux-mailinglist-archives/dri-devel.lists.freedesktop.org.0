Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA39552880
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 02:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72E810E649;
	Tue, 21 Jun 2022 00:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D850110E4B8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 00:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655770471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVrVeKPAQSI4AB4vZ7MyOJPPx0q5Q+PSH+24GSNfDdk=;
 b=AuB9LtRBzVHe4ONsU+OjiLEooVfZeGqG/wdPilMPon9xPjaAKs5fVmrZi5oFqdTY4VmbUQ
 B+HEDKpdhkm9/tez23xN4X3Ene3ctDs9qfuvFkM0RA6BLzJqybJoTAllJBXulgXDqBEtam
 O7zi5NO1q7Vzjp9Pmma4vEKUqSFXbus=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-O-UvsTuyNHa6WDaakvaDgw-1; Mon, 20 Jun 2022 20:14:30 -0400
X-MC-Unique: O-UvsTuyNHa6WDaakvaDgw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p22-20020a05600c359600b0039c7b23a1c7so7614495wmq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 17:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YVrVeKPAQSI4AB4vZ7MyOJPPx0q5Q+PSH+24GSNfDdk=;
 b=VNWia6TadK+e+RY1THWy6Er7kvbGH6+/05s0RCuVHIdHTYBvv1AGWDMT+6tCo18/1h
 NXr3oqjpDZ1pKDoI5LN+JCG5c4OpyQJhFcGsot+WvqcG/8ONhcLN2yHrYBHeAFLDB1/H
 VaC++boOZ2OpWFzB/uDvm+5BiQ2x4pqoge98m7rG9LGbmAkMTZA6AZ7BC/UnHN6+x/r9
 IBm1eHBqFnVg282E5eQNUSP2px/+XTLWc0y73YTUzm5ggdZkFH9lzEZF22JnHm3nRVll
 SYZgVuZ/iV4QBT+zKURMgG/moTgRQsEQbHDuobefoT6PYeLU1RXgerI8Gah16crn2Gos
 sAPQ==
X-Gm-Message-State: AOAM530S0oRqcnmPjb8QHSqtj1fiLbtzCMwqg2zLwzbyJdvShrQZ7PsS
 v5YYcs9g3T0GJmpaxGxEBY1BshgvoJBjkLxJK2Jn40ghhBllXxFIAcHnlN/siQ8n1bfJz5DL1ty
 n8oLFbm1OhrqwYri5HaBzasgT+Upm
X-Received: by 2002:a1c:7318:0:b0:39c:7ab9:934c with SMTP id
 d24-20020a1c7318000000b0039c7ab9934cmr37918729wmb.200.1655770469030; 
 Mon, 20 Jun 2022 17:14:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+niHvOlBzhdAVy81+ewTZLfHJj94jM8s0LNLjY3ov8z2Zpwsyks99Njqzq1zWmToWQYxOWg==
X-Received: by 2002:a1c:7318:0:b0:39c:7ab9:934c with SMTP id
 d24-20020a1c7318000000b0039c7ab9934cmr37918708wmb.200.1655770468669; 
 Mon, 20 Jun 2022 17:14:28 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b0021b932de5d6sm2877092wrt.39.2022.06.20.17.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 17:14:28 -0700 (PDT)
Message-ID: <e1fd76ae-a865-889f-b4f0-878c00837368@redhat.com>
Date: Tue, 21 Jun 2022 02:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] drm: Implement DRM aperture helpers under video/
To: Alex Williamson <alex.williamson@redhat.com>, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, gregkh@linuxfoundation.org
References: <165541020563.1955826.16350888595945658159.stgit@omen>
 <165541192621.1955826.6848784198896919390.stgit@omen>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <165541192621.1955826.6848784198896919390.stgit@omen>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/16/22 22:38, Alex Williamson wrote:
> From: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Implement DRM's aperture helpers under video/ for sharing with other
> sub-systems. Remove DRM-isms from the interface. The helpers track
> the ownership of framebuffer apertures and provide hand-over from
> firmware, such as EFI and VESA, to native graphics drivers.
> 
> Other subsystems, such as fbdev and vfio, also have to maintain ownership
> of framebuffer apertures. Moving DRM's aperture helpers to a more public
> location allows all subsystems to interact with each other and share a
> common implementation.
> 
> The aperture helpers are selected by the various firmware drivers within
> DRM and fbdev, and the VGA text-console driver.
>

Thanks a lot for working on this.
 
> The original DRM interface is kept in place for use by DRM drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---

[...]

> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 427a993c7f57..c69b45f8c427 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -5,6 +5,12 @@
>  
>  menu "Graphics support"
>  
> +config APERTURE_HELPERS
> +	bool
> +	help
> +	  Support tracking and hand-over of aperture ownership. Required
> +	  for firmware graphics drivers.
> +

Maybe "graphics drivers using a firmware-provided framebuffer" is more clear?

[...]

> +++ b/drivers/video/aperture.c
> @@ -0,0 +1,340 @@
> +// SPDX-License-Identifier: MIT
> +
> +#include <linux/aperture.h>
> +#include <linux/device.h>
> +#include <linux/fb.h> /* for old fbdev helpers */
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/vgaarb.h>
> +
> +/**
> + * DOC: overview
> + *
> + * A graphics device might be supported by different drivers, but only one
> + * driver can be active at any given time. Many systems load a generic
> + * graphics drivers, such as EFI-GOP or VESA, early during the boot process.
> + * During later boot stages, they replace the generic driver with a dedicated,
> + * hardware-specific driver. To take over the device the dedicated driver
> + * first has to remove the generic driver. Aperture functions manage
> + * ownership of framebuffer memory and hand-over between drivers.
> + *
> + * Graphics drivers should call remove_conflicting_devices()
> + * at the top of their probe function. The function removes any generic
> + * driver that is currently associated with the given framebuffer memory.
> + * If the framebuffer is located at PCI BAR 0, the rsp code looks as in the

s/rsp/respective 

> + * example given below. The cod assumes a DRM driver.
> + *

s/cod/code

> + * .. code-block:: c
> + *
> + *	static const struct drm_driver example_driver = {
> + *		.name = "exampledrm",
> + *		...
> + *	};
> + *
> + *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
> + *	{
> + *		bool primary = false;
> + *		resource_size_t base, size;
> + *		int ret;
> + *
> + *		base = pci_resource_start(pdev, 0);
> + *		size = pci_resource_len(pdev, 0);
> + *	#ifdef CONFIG_X86
> + *		primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
> + *	#endif

This example seems to be copied from drivers/gpu/drm/ast/ast_drv.c and I
don't see any other driver that has its framebuffer located in PCI BAR 0
or at least having a similar code.

So I wonder if we really want to have this example for such a corner case ? 

Also, remove_conflicting_pci_framebuffers() seems to already at least check
for the IORESOURCE_ROM_SHADOW flag so it would be better to grow that and
support this special case of PCI BAR 0 (maybe adding another param that is
passed through remove_conflicting_pci_devices() ?

In any case, it seems to me that it is something that ast shouldn't really
have to open code it and instead the helpers should be fixed to cover that
case for drivers not to care. I would really not add the snippet in the doc.

Since we are talking about remove_conflicting_devices() here, a better code
example could be for a platform device instead of a PCI device, like this:

*	static const struct platform_driver example_driver = {
*		.name = "example",
*		...
*	};
*
*	static int probe(struct platform_device *pdev)
*	{
*		struct resource *mem;
*		resource_size_t base, size;
*
*		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
*		if (!mem)
*			return -EINVAL;
*		base = mem->start;
*		size = resource_size(mem);
*
*		ret = remove_conflicting_devices(base, size, false, &example_driver->name);
*		if (ret)
*			return ret;
*
*		// ... and initialize the hardware.
*		...
*
*		return 0;
*	}

> + *	static int probe(struct pci_dev *pdev)
> + *	{
> + *		int ret;
> + *
> + *		// Remove any generic drivers...
> + *		ret = remove_conflicting_framebuffers(pdev);

And here we can just use remove_conflicting_pci_devices(pdev) without the
unnecessary level of indirection. It makes the example more clear IMO and
it could be moved as an example for the remove_conflicting_pci_devices().

Another option is to have here an example for platform devices instead of
a PCI device (and move this example when talking about remove

[...]

> + * PCI device drivers can also call remove_conflicting_pci_devices() and let the
> + * function detect the apertures automatically. Device drivers without knowledge of
> + * the framebuffer's location shall call remove_all_conflicting_devices(),
> + * which removes all known devices.
> + *

Can we get all the public aperture functions be in the aperture namespace? i.e:
aperture_remove_conflicting_devices(), aperture_remove_all_conflicting_devices()
and so on. That makes easier to grep, ftrace and also read the drivers' code.

> + * Drivers that are susceptible to being removed by other drivers, such as
> + * generic EFI or VESA drivers, have to register themselves as owners of their
> + * framebuffer apertures. Ownership of the framebuffer memory is achieved
> + * by calling devm_acquire_aperture_of_platform_device(). On success, the driver

AFAICT the aperture infrastructure only allows to remove platform devices, even
when it can check if the requested I/O resource overlaps with a PCI BAR range,
so maybe all functions also should use _platform_device() as suffix instead of
just _device() ? Or maybe the _platform is just verbose but I think that the
functions should be named consistently and only use either _device or _platform.

[...]

> + *	static int acquire_framebuffers(struct drm_device *dev, struct platform_device *pdev)
> + *	{
> + *		resource_size_t base, size;
> + *

This example is missing a struct resource *mem declaration.

> + * The generic driver is now subject to forced removal by other drivers. This
> + * only works for platform drivers that support hot unplugging.
> + * When a driver calls remove_conflicting_devices() et al
> + * for the registered framebuffer range, the aperture helpers call
> + * platform_device_unregister() and the generic driver unloads itself. It
> + * may not access the device's registers, framebuffer memory, ROM, etc
> + * afterwards.
> + */
> +
> +struct dev_aperture {
> +	struct device *dev;

And here we could just use a struct platform_device *pdev since currently we
only support platform devices. It seems to me that this is a DRM-ism that we
are carrying since for DRM drivers made sense to use struct device.

Doing that would also allow get rid of indirections like the need of both a
devm_acquire_aperture_of_platform_device() and devm_aperture_acquire() just
to do a &pdev->dev.

And also some to_platform_device() in drm_aperture_detach_firmware() and
detach_platform_device().

If we ever support non-platform devices then we can refactor it, but I don't
think that is worth to complicate just in case we ever support struct device.

> +	resource_size_t base;
> +	resource_size_t size;
> +	struct list_head lh;
> +	void (*detach)(struct device *dev);

Same here, just	void (*detach)(struct platform_device *pdev) if you agree with
that I mentioned above.

> +};
> +
> +static LIST_HEAD(apertures);
> +static DEFINE_MUTEX(apertures_lock);
> +
> +static bool overlap(resource_size_t base1, resource_size_t end1,
> +		    resource_size_t base2, resource_size_t end2)
> +{
> +	return (base1 < end2) && (end1 > base2);
> +}

There's a resource_overlaps() helper in include/linux/ioport.h, I wonder if it
could just be used, maybe declaring and filling a struct resource just to call
that helper. Later as an optimization a resource_range_overlap() or something
could be proposed for include/linux/ioport.h.

Also, I noticed that resource_overlaps() uses <= and >= but this helper uses
< and >. It seems there's an off-by-one error here but maybe I'm wrong on this.

[...]

> +static void detach_platform_device(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +
> +	/*
> +	 * Remove the device from the device hierarchy. This is the right thing
> +	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
> +	 * the new driver takes over the hardware, the firmware device's state
> +	 * will be lost.
> +	 *
> +	 * For non-platform devices, a new callback would be required.
> +	 *

I wonder if we ever are going to need this. AFAICT the problem only happens for
platform devices. Or do you envision a case when some a bus could need this and
the aperture unregister the device instead of the Linux kernel device model ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

