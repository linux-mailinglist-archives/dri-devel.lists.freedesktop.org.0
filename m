Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8688403D2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 12:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6642C10F309;
	Mon, 29 Jan 2024 11:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4666D10F309
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706527738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T8SlJkgyf4F72zAmTqwHZjwa5jBZV7W7p8nr0oKMhHk=;
 b=GPtRqnePaLkOECQkojiiuXS2eheiu/Irtabx9SS/KL85gxO0O1hDjtSXeyTwCK9CDR3UPC
 NMuXKUseLB42AXYW3k4/kGRy1+KhB0UrctIkmplMyo7HATFIN8xXP/cDTQPkv/Fy545tlE
 O8r19uRUbHRyzCNBtZC27ApCPFR0Wjs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-sg2AZVqqMe-1ST8j11m_nQ-1; Mon, 29 Jan 2024 06:28:56 -0500
X-MC-Unique: sg2AZVqqMe-1ST8j11m_nQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40ef9f4ef41so2791595e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 03:28:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706527735; x=1707132535;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T8SlJkgyf4F72zAmTqwHZjwa5jBZV7W7p8nr0oKMhHk=;
 b=YZQ1k+QQjJSi9a2/k17FBo6njwD++7uUZ/1dh8D3/bXHFu3bCTNhjBntvSPTTBOf2U
 7zD3ta6L4gFA7m0NFU+LS3Ybl+Qvc+YOBlkdUs/HPBnSjRTbeOJr1C1IZo7iKc6qosu6
 xQH/cAlHw2bDcPZg8Ck05qo9D005YlZxo3caawJdk01RjeDDimPJp04zMTDzqa+VEJc2
 ap8XZnJMlpk/9AL56c2hMbG74/R6XAsK8k7BBKSStp3qScdfsaDlG/n27KuUAApuVAZs
 L0hmuZfMIpCPqf4V3sO5Y7kWPXWV+pphLhS588bAJOSyuU6oWowHsgWaujsVuImsV7hL
 tDrw==
X-Gm-Message-State: AOJu0YyfkvfLFFOKqesFHXOVH7IO268Qpff5P1tw0J3SVLHrb9m2OXuV
 E5698M8da592bLb50PL1E+Dc9Vi44IUlSNzhPLZVHR0oGYgzWUlUpX8/ZPiuTRJmgEwJJGd+O6S
 JuI5v4Asmn5+Ehvsjp1n791AillfcPhA83x6MXe73ST5dpWt3GQ9zwC0wrudrAkTycQ==
X-Received: by 2002:a05:600c:4e8c:b0:40e:e25c:41cf with SMTP id
 f12-20020a05600c4e8c00b0040ee25c41cfmr4504918wmq.12.1706527735805; 
 Mon, 29 Jan 2024 03:28:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0xVaWWL3o51Qn/gqs0+H0Eyaw1ZIB6VRyL1cww2mueAr4kLpgaFw+NXNnWMf5iFyHSjpDsA==
X-Received: by 2002:a05:600c:4e8c:b0:40e:e25c:41cf with SMTP id
 f12-20020a05600c4e8c00b0040ee25c41cfmr4504907wmq.12.1706527735466; 
 Mon, 29 Jan 2024 03:28:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp19-20020a5d5a93000000b003394495566dsm7950616wrb.22.2024.01.29.03.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 03:28:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Subject: Re: [PATCH 3/8] firmware/sysfb: Set firmware-framebuffer parent device
In-Reply-To: <20240117125527.23324-4-tzimmermann@suse.de>
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-4-tzimmermann@suse.de>
Date: Mon, 29 Jan 2024 12:28:54 +0100
Message-ID: <87r0i0v0nd.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Set the firmware framebuffer's parent device, which usually is the
> graphics hardware's physical device. Integrates the framebuffer in
> the Linux device hierarchy and lets Linux handle dependencies among
> devices. For example, the graphics hardware won't be suspended while
> the firmware device is still active.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/sysfb.c          | 11 ++++++++++-
>  drivers/firmware/sysfb_simplefb.c |  5 ++++-
>  include/linux/sysfb.h             |  3 ++-
>  3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 19706bd2642a..8a42da3f67a9 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -29,6 +29,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
> +#include <linux/pci.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
>  #include <linux/screen_info.h>
> @@ -72,6 +73,8 @@ EXPORT_SYMBOL_GPL(sysfb_disable);
>  static __init int sysfb_init(void)
>  {
>  	const struct screen_info *si = &screen_info;
> +	struct device *parent = NULL;
> +	struct pci_dev *pparent;

Maybe pci_parent? It's easier to read than pparent IMO.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

