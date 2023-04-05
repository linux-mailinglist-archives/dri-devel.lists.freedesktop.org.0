Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A46D7B44
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCF910E8EC;
	Wed,  5 Apr 2023 11:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9308910E8EF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680694070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IQAzVcvbALN+4zchowqIgolmdBCfNGbq9PZTSMW02q4=;
 b=YRFZ+qN54uAez4AUOZlbnpQ7I4YOkVKwPNMaoNVN4+le2EHCEjXErjyFxQbNl0VlJQhJDE
 kMTdgIRvasYFq2TcDUePxRkAJUyi/wiCgh/azX7UTe2q+Me3hnEmXUt+G6pEeLwhiTEo1H
 zuI8X2bSUV6tPK9K0lepRd2ammXAmN8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-7O4xqtvUPCuRUUfcdMH7dQ-1; Wed, 05 Apr 2023 07:27:47 -0400
X-MC-Unique: 7O4xqtvUPCuRUUfcdMH7dQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m27-20020a05600c3b1b00b003ee502f1b16so17004894wms.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 04:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680694066;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQAzVcvbALN+4zchowqIgolmdBCfNGbq9PZTSMW02q4=;
 b=16WPZVo7nt4eEeGUGWrR7NUd+WKXBKpH2LB5/n+PmffMlIn/Uhr3EGhcZcq8x/oJwT
 17SwU4HRwBc15rPm9RHaVunhvJNj+W4wqoj41ZnEXMbVfEEi7sp+P3JursSt7IWedzsJ
 9qE+Ip7/zv5KgU1oafeoleWz6D9+cs8mFVX4IvrzDn8ny+E4Z4BwWb3LnQdbSu9774lf
 MaE0nlYiUgsZbA1fR58VdMMWC/ipgCWt9TzYcEYhTULq5z7kSQutzOpQRF7pV3eyVNFw
 3bGwUde/RY/fVr38ac+78Suh3EPNNOq9k6qE1/bXY9srsK1gJ6WXSLw5wdrCJyo7++ae
 vzsQ==
X-Gm-Message-State: AAQBX9fM2pDD4KQ/oEPyYLnUj0plKJvWXPL7MX/uQINd70OnR/fZkYRD
 iqvkmgNkA12YjososHa2+ealXX17AdNYJNpbhQxTP9/1wznK9MQe6fiCc87Zm1Q4XsQSvE960Z9
 B7rF2RIwyWuiQBphJC9aT5n4H6W1+
X-Received: by 2002:a05:600c:21a:b0:3f0:46cd:c9d2 with SMTP id
 26-20020a05600c021a00b003f046cdc9d2mr4444096wmi.16.1680694066172; 
 Wed, 05 Apr 2023 04:27:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZzTSpH0dlIR9VSJkSVxYJXQwsT62p5V7VWpSKXwUL+Qge1Vw8p6lDnbGeqjb+SWtxtq6KLIw==
X-Received: by 2002:a05:600c:21a:b0:3f0:46cd:c9d2 with SMTP id
 26-20020a05600c021a00b003f046cdc9d2mr4444082wmi.16.1680694065839; 
 Wed, 05 Apr 2023 04:27:45 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003ef7058ea02sm1929216wmq.29.2023.04.05.04.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:27:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/8] video/aperture: use generic code to figure out the
 vga default device
In-Reply-To: <20230404201842.567344-2-daniel.vetter@ffwll.ch>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <20230404201842.567344-2-daniel.vetter@ffwll.ch>
Date: Wed, 05 Apr 2023 13:27:44 +0200
Message-ID: <874jpud0wf.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> Since vgaarb has been promoted to be a core piece of the pci subsystem
> we don't have to open code random guesses anymore, we actually know
> this in a platform agnostic way, and there's no need for an x86
> specific hack. See also 1d38fe6ee6a8 ("PCI/VGA: Move vgaarb to
> drivers/pci")
>
> This should not result in any functional change, and the non-x86
> multi-gpu pci systems are probably rare enough to not matter (I don't
> know of any tbh). But it's a nice cleanup, so let's do it.
>
> There's been a few questions on previous iterations on dri-devel and
> irc:
>
> - fb_is_primary_device() seems to be yet another implementation of
>   this theme, and at least on x86 it checks for both
>   vga_default_device OR rom shadowing. There shouldn't ever be a case
>   where rom shadowing gives any additional hints about the boot vga
>   device, but if there is then the default vga selection in vgaarb
>   should probably be fixed. And not special-case checks replicated all
>   over.
>

Agreed and if there are regressions reported then could be added there.

> - Thomas also brought up that on most !x86 systems
>   fb_is_primary_device() returns 0, except on sparc/parisc. But these
>   2 special cases are about platform specific devices and not pci, so
>   shouldn't have any interactions.
>
> - Furthermore fb_is_primary_device() is a bit a red herring since it's
>   only used to select the right fbdev driver for fbcon, and not for
>   the fw handover dance which the aperture helpers handle. At least
>   for x86 we might want to look into unifying them, but that's a
>   separate thing.
>
> v2: Extend commit message trying to summarize various discussions.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org
> ---
>  drivers/video/aperture.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
> index b009468ffdff..8835d3bc39bf 100644
> --- a/drivers/video/aperture.c
> +++ b/drivers/video/aperture.c
> @@ -324,13 +324,11 @@ EXPORT_SYMBOL(aperture_remove_conflicting_devices);
>   */
>  int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
>  {
> -	bool primary = false;
> +	bool primary;
>  	resource_size_t base, size;
>  	int bar, ret;
>  
> -#ifdef CONFIG_X86
> -	primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
> -#endif
> +	primary = pdev == vga_default_device();
>

Maybe enclose the check in parenthesis to make it easier to read ?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

