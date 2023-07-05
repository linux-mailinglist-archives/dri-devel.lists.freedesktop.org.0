Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03487747EDF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513EE10E141;
	Wed,  5 Jul 2023 08:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5340610E141
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 08:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688544151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XDgcQtPSCk85F9YjOuVpAuyCl327gSG/7+9nyPHiobU=;
 b=HVNH53ZDOszA2ZQz3FXyXsIdeqgezqU0uNVYe9yOyAHL6wluM2dvAM16LhKgyJWDFGOQmn
 tb2JRp6RWWHzNzPXI9PkC+ELtVg840KchYLERyVasoxVVEy+OMxCArJ6ecJOa0Aa21JF+6
 cOz8UIM1odQz1gioutujRaqMF28O6Tc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-udWgERDaOD-P8djyveKEzA-1; Wed, 05 Jul 2023 04:02:30 -0400
X-MC-Unique: udWgERDaOD-P8djyveKEzA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbe356b8deso7664815e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 01:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688544149; x=1691136149;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XDgcQtPSCk85F9YjOuVpAuyCl327gSG/7+9nyPHiobU=;
 b=ZuzIVh7Xp9gpCCyqbt6EpcOTmVmwyfU3r5NOmNufVKDgmiuigrp3JxZem4Pu/YJDcV
 7eA/oiKpsCnbmeozPYPfEogjWTgq/sw0pCSEfjVJNQldy9RdnBV0neF88BNVLGskdPwU
 ivDfqpax6KqK+7OynxJcP4c/usOVBcWs847uhk/5AluYGqHjxh5VE1aq3dOLSgFG/jzj
 psxR2WO8biAMyn9xiMnd5dRfNzhhmo8odlHk9vcVcWWQcLCMp47ZGxHnPAdqULwuW9k6
 ABuzoEAeibORmHgpDFhKHqQeXF7yr9qpDk1N/LIPWKg+c+Co0/UnkqPUGdpxLM2OIKhl
 Loyw==
X-Gm-Message-State: AC+VfDxUe0Lzt5pYN4ipDx0Vmw4/2sKE0I+a+4jbexP1xJ1S6EVSoLTb
 dxmaaEJwnXNEMXooZApvrovE2kHHEfm9HQNb8Y+AGOTwXJK2N2IlMIdU+klsZZYfkGGHrNpwt1j
 on52yE0py6i7PajAUbao97RH2T1ZA
X-Received: by 2002:a05:600c:b54:b0:3f5:ffe3:46a7 with SMTP id
 k20-20020a05600c0b5400b003f5ffe346a7mr12254769wmr.9.1688544149339; 
 Wed, 05 Jul 2023 01:02:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vylDlXvfuU9EWjWb12pZMcRCpkOIK+1WjIMZRSIYzVmT0WCKJ1Gd1jMG8KQnYrrWHnxleng==
X-Received: by 2002:a05:600c:b54:b0:3f5:ffe3:46a7 with SMTP id
 k20-20020a05600c0b5400b003f5ffe346a7mr12254706wmr.9.1688544148234; 
 Wed, 05 Jul 2023 01:02:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x8-20020a5d4908000000b0031432c2fb95sm8956824wrq.88.2023.07.05.01.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 01:02:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH 10/12] fbdev/core: Use fb_is_primary_device() in
 fb_firmware_edid()
In-Reply-To: <20230629121952.10559-11-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-11-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 10:02:27 +0200
Message-ID: <878rbuss4s.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-csky@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 Maik Broemme <mbroemme@libmpq.org>, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-mips@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Detect the primary VGA device with fb_is_primary_device() in the
> implementation of fb_firmware_edid(). Remove the existing code.
>

An explanation about why this is possible would be useful here.

> Adapt the function to receive an instance of struct fb_info and
> update all callers.
>

[...]

> -const unsigned char *fb_firmware_edid(struct device *device)
> +const unsigned char *fb_firmware_edid(struct fb_info *info)
>  {
> -	struct pci_dev *dev = NULL;
> -	struct resource *res = NULL;
>  	unsigned char *edid = NULL;
>  
> -	if (device)
> -		dev = to_pci_dev(device);
> -
> -	if (dev)
> -		res = &dev->resource[PCI_ROM_RESOURCE];
> -
> -	if (res && res->flags & IORESOURCE_ROM_SHADOW)

This open codes what used to be the fb_is_primary_device() logic before
commit 5ca1479cd35d ("fbdev: Simplify fb_is_primary_device for x86").
But now after that commit there is functional change since the ROM
shadowing check would be dropped.

I believe that's OK and Sima explains in their commit message that
vga_default_device() should be enough and the check is redundant.

Still, I think that this change should be documented in your commit
message. 

With that change,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

