Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81E6D91CC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170E210EB31;
	Thu,  6 Apr 2023 08:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B8310EB31
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680770311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hkchePf9OLmsTXYWAsI9wTVTm6UQ5Vnb4omxYS3AXNw=;
 b=ACL6mvFobAv5dfoou+87RyD0EwsvR7eTNmnavKKuRJRM4se7SigkuVEedq7gsE9wivIken
 Ha7CzD5dkHYR1e0IZFaBoDi9INHCgQMKgrjN1S1e4V8LFn+/6oxGiLN4Z8LUgRLjQy5jkS
 cIm/XukvVTjaeByOPAM/qq7M3l0BTXw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-m9rThREMPjO7gdhoS8ac4w-1; Thu, 06 Apr 2023 04:38:27 -0400
X-MC-Unique: m9rThREMPjO7gdhoS8ac4w-1
Received: by mail-wm1-f71.google.com with SMTP id
 m7-20020a05600c4f4700b003ee7e120bdfso18014306wmq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 01:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680770306;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hkchePf9OLmsTXYWAsI9wTVTm6UQ5Vnb4omxYS3AXNw=;
 b=P64xNVU6s8/J7ANKqK44t3ZaVo4rcalza+YNjQ6RomCjpegqwP5110S6oCuEW9IpXp
 EDA7fInpb+rJ/fG61uHF61H5msdS7b6V3KXlRFGeAXKt9qztuUXFyRj2N6+jdoihnGzi
 VvRi3pPE9lgmMCE8wLhA2hPW3P9DNOXEvvy4IVVJr/6bl41Z0IfJE3C+w8en9gWRRWI5
 Ijp2LUsqZ//mKHt56CMjcKe2lkzPpLy1k1iaW3h87lj4wRXqz3Z8HF7zAPNRYjUQDsgQ
 e8BrLeP0gH7denSPPcbu8zYnsSBcDysBuyKWnYwJ25AAEty5pjIwH8/qkzecpxEt7YtZ
 HfGw==
X-Gm-Message-State: AAQBX9fdmMC4SjJxv0B1AWt9bMQNSYUbDF1tjKQjUkSVNPPy5cyx7O/L
 SQ2FC14YmmOTXwBzLUjB+IeL5hhc7dZ0RxQbWNMNGedhewrPJn+79WYa1dkDRo93ggtseCldGgJ
 cu/7IFEupggp8BRikRmL1krKK1fSq
X-Received: by 2002:a1c:f216:0:b0:3ee:4ff0:83d6 with SMTP id
 s22-20020a1cf216000000b003ee4ff083d6mr6819316wmc.40.1680770306382; 
 Thu, 06 Apr 2023 01:38:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yojg2hQUkAVKwGstUj4dhtr6KfgtFqksoey1inKawioKRJeSTROyvsWZxKKEZVNw0r4QsONg==
X-Received: by 2002:a1c:f216:0:b0:3ee:4ff0:83d6 with SMTP id
 s22-20020a1cf216000000b003ee4ff083d6mr6819298wmc.40.1680770306081; 
 Thu, 06 Apr 2023 01:38:26 -0700 (PDT)
Received: from localhost ([84.78.248.32]) by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003ee4e99a8f6sm912948wmi.33.2023.04.06.01.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:38:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
In-Reply-To: <66f9196e-df2b-19ce-e2ec-15f7a81d63c7@suse.de>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <66f9196e-df2b-19ce-e2ec-15f7a81d63c7@suse.de>
Date: Thu, 06 Apr 2023 10:38:24 +0200
Message-ID: <87ttxt8kxr.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

> Am 04.04.23 um 22:18 schrieb Daniel Vetter:
> Gma500 therefore calls both helpers to catch all cases. It's confusing
> as it implies that there's something about the PCI device that requires
> ownership management. The relationship between the PCI device and the
> VGA devices is non-obvious. At worst, readers might assume that calling
> two functions for aperture clearing ownership is a bug in the driver.
>

Yeah, or someone looking as the driver for reference may wrongly think
that calling both aperture helpers are needed for PCI drivers and that
is not the case.

> Hence, move the PCI removal helper's code for VGA functionality into
> a separate function and call this function from gma500. Documents the
> purpose of each call to aperture helpers. The change contains comments
> and example code form the discussion at [1].
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.kernel.org/project/dri-devel/patch/20230404201842.567344-1-daniel.vetter@ffwll.ch/ # 1
> ---

Looks good to me and I agree that it makes the code easier to understand.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I've a couple of comments below though:

[...]

> + * Hardware for gma500 is a hybrid device, which both acts as a PCI
> + * device (for legacy vga functionality) but also more like an
> + * integrated display on a SoC where the framebuffer simply
> + * resides in main memory and not in a special PCI bar (that
> + * internally redirects to a stolen range of main memory) like all
> + * other integrated PCI display devices have.
> + *

Is "have" the correct word here or "do" ? Or maybe "are implemented" ?

> + * To catch all cases we need to remove conflicting firmware devices
> + * for the stolen system memory and for the VGA functionality. As we
> + * currently cannot easily find the framebuffer's location in stolen
> + * memory, we remove all framebuffers here.
> + *
> + * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then
> + *       we might be able to read the framebuffer range from the
> + *       device.
> + */
> +static int gma_remove_conflicting_framebuffers(struct pci_dev *pdev,
> +					       const struct drm_driver *req_driver)
>  {
> -	struct drm_psb_private *dev_priv;
> -	struct drm_device *dev;
> +	resource_size_t base = 0;
> +	resource_size_t size = PHYS_ADDR_MAX;
> +	const char *name = req_driver->name;
>  	int ret;
>  
> -	/*
> -	 * We cannot yet easily find the framebuffer's location in memory. So
> -	 * remove all framebuffers here. Note that we still want the pci special
> -	 * handling to kick out vgacon.
> -	 *
> -	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
> -	 *       might be able to read the framebuffer range from the device.
> -	 */
> -	ret = drm_aperture_remove_framebuffers(&driver);
> +	ret = aperture_remove_conflicting_devices(base, size, name);
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
> +	return __aperture_remove_legacy_vga_devices(pdev);

I don't like the __ prefix for this function name, as it usually implies
that is a function that is only local to the compilation unit. But it is
an exported symbol from the aperture infrastructure.

[...]
  
> +/**
> + * __aperture_remove_legacy_vga_devices - remove legacy VGA devices of a PCI devices
> + * @pdev: PCI device
> + *
> + * This function removes VGA devices provided by @pdev, such as a VGA
> + * framebuffer or a console. This is useful if you have a VGA-compatible
> + * PCI graphics device with framebuffers in non-BAR locations. Drivers
> + * should acquire ownership of those memory areas and afterwards call
> + * this helper to release remaining VGA devices.
> + *
> + * If your hardware has its framebuffers accessible via PCI BARS, use
> + * aperture_remove_conflicting_pci_devices() instead. The function will
> + * release any VGA devices automatically.
> + *
> + * WARNING: Apparently we must remove graphics drivers before calling
> + *          this helper. Otherwise the vga fbdev driver falls over if
> + *          we have vgacon configured.
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise
> + */
> +int __aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
> +{
> +	/* VGA framebuffer */
> +	aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
> +
> +	/* VGA textmode console */
> +	return vga_remove_vgacon(pdev);
> +}
> +EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);

I would just call this symbol aperture_remove_legacy_vga_devices() as
mentioned, the fact that aperture_remove_conflicting_pci_devices() use it
internally is an implementation detail IMO. But it's an exported symbol so
the naming should be consistent.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

