Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AAA56FFA1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965AD8DB36;
	Mon, 11 Jul 2022 11:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FD58DB31
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657537296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DoNRjwHn17Mb09qr5SAGudc0KtakAnj1BuIZJeny9no=;
 b=K01GwWpEn2cAtiNcznwwsckJiMVov3v6ybccHuseCtKP55QivQvjzWMO40xICQ0+e/aC/f
 yKdj4HkAJyRAVxGLiD/bXY3CL1VbHwBskt70kFhS7oXuhofnD9EikV1nXam0nxRE3jFtnq
 o2/cPSTiakYTDh1VSmY7NPyETo9pPsE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-UfQQkbALN6mw2c5z28Ar1Q-1; Mon, 11 Jul 2022 07:01:33 -0400
X-MC-Unique: UfQQkbALN6mw2c5z28Ar1Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 p21-20020a05600c1d9500b003a2d6c2b643so3027744wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 04:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DoNRjwHn17Mb09qr5SAGudc0KtakAnj1BuIZJeny9no=;
 b=02dxYtlaBuTp924bjgVgeWOlc6qc6QsjSDiAPPVbCLVUMCtwRbQl++l2B9G7pb27NK
 e73Pr8CcF+278VAQjyYjQ2/L3eAYfBVqaWI9lP34k0kSqWqWJIAt0w9MUNL5V2gfCGEa
 7IJZlsaPKN+w21h/2FU2cDiqJpjx58kjLsG9TgR9hOmefCdmzOWB2j3myAdfHY9KHJij
 bpbPFVhMjrA2OwbJuuD5QRX0PGs8hv5syYNMLfFb+v1t2dQXIIT5it7HbkpMH4tr9tE4
 6ONmhnhCtP5zIeghDFjRq5S8qpi0tXuaz1N4HWX7J9weEcWxlzWnD/TFv0rTaw26EOVq
 eWzA==
X-Gm-Message-State: AJIora/PPqoLS/MWhDqziJJYKaSJX9cXKLOxnBNyGUx5DblGi146OYkG
 7n9lyrrXOn7RugABysS85fFHeGGZv1KVjEUHWOWZcusb+XvnqgGyy1fk5n7mr/GPAqffu5/x9e5
 O4ER5kNhqAaGg3CuQOpTdIVVCri1g
X-Received: by 2002:adf:f1d0:0:b0:21d:9c0d:9b5 with SMTP id
 z16-20020adff1d0000000b0021d9c0d09b5mr8849909wro.689.1657537291749; 
 Mon, 11 Jul 2022 04:01:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u8mnYTbK20OklBYjenRq7ddEU4KkMn7Awl5f5jeOdfl+tJzjz1kN5TZ+19bK982BF8qePriA==
X-Received: by 2002:adf:f1d0:0:b0:21d:9c0d:9b5 with SMTP id
 z16-20020adff1d0000000b0021d9c0d09b5mr8849874wro.689.1657537291410; 
 Mon, 11 Jul 2022 04:01:31 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b00397342e3830sm18871245wms.0.2022.07.11.04.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 04:01:30 -0700 (PDT)
Message-ID: <8ebc1f33-f654-6b93-8a41-1aa66ab1901c@redhat.com>
Date: Mon, 11 Jul 2022 13:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/11] fbdev: Convert drivers to aperture helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-6-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Convert fbdev drivers from fbdev's remove_conflicting_framebuffers() to
> the framework-independent aperture_remove_conflicting_devices(). Calling
> this function will also remove conflicting DRM drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

>  static int lynxfb_kick_out_firmware_fb(struct pci_dev *pdev)
>  {
> -	struct apertures_struct *ap;
> +	resource_size_t base = pci_resource_start(pdev, 0);
> +	resource_size_t size = pci_resource_len(pdev, 0);
>  	bool primary = false;
>  
> -	ap = alloc_apertures(1);
> -	if (!ap)
> -		return -ENOMEM;
> -
> -	ap->ranges[0].base = pci_resource_start(pdev, 0);
> -	ap->ranges[0].size = pci_resource_len(pdev, 0);
>  #ifdef CONFIG_X86
>  	primary = pdev->resource[PCI_ROM_RESOURCE].flags &
>  					IORESOURCE_ROM_SHADOW;
>  #endif
> -	remove_conflicting_framebuffers(ap, "sm750_fb1", primary);
> -	kfree(ap);
> -	return 0;
> +
> +	return aperture_remove_conflicting_devices(base, size, primary, "sm750_fb1");

Do you know why this can't just use aperture_remove_conflicting_pci_devices() ?

It seems that the driver is open coding part of the logic already in that helper.
For example, figuring out if is a primary by checking the IORESOURCE_ROM_SHADOW
flag in the PCI_ROM_RESOURCE.

But also getting the base and size for PCI BAR 0, since the loop in that helper
would already take care of that (it also starts at BAR 0).

>  }
>  
>  static int lynxfb_pci_probe(struct pci_dev *pdev,
> diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
> index b311c07fe66d..e5e362b8c9da 100644
> --- a/drivers/video/fbdev/aty/radeon_base.c
> +++ b/drivers/video/fbdev/aty/radeon_base.c
> @@ -54,6 +54,7 @@
>  
>  #include "radeonfb.h"
>  
> +#include <linux/aperture.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/kernel.h>
> @@ -2239,20 +2240,10 @@ static const struct bin_attribute edid2_attr = {
>  
>  static int radeon_kick_out_firmware_fb(struct pci_dev *pdev)
>  {
> -	struct apertures_struct *ap;
> +	resource_size_t base = pci_resource_start(pdev, 0);
> +	resource_size_t size = pci_resource_len(pdev, 0);
>  
> -	ap = alloc_apertures(1);
> -	if (!ap)
> -		return -ENOMEM;
> -
> -	ap->ranges[0].base = pci_resource_start(pdev, 0);
> -	ap->ranges[0].size = pci_resource_len(pdev, 0);
> -
> -	remove_conflicting_framebuffers(ap, KBUILD_MODNAME, false);
> -
> -	kfree(ap);
> -
> -	return 0;
> +	return aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME, false);

Same for this.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

