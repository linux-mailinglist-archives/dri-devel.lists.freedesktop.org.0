Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744AC74D07E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7BB10E168;
	Mon, 10 Jul 2023 08:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F1D10E168
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688978718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z8Md5DxJ/DXNzZNPaIMm/A+OyRkUpEJ0KHRBY8+I9Hg=;
 b=OwQ4pYi99w5JfrwFE0h2/5w69EaH1n3mfB/fHgnzS2y1LfMo8+fUgm4ZljKhWAdQzqZMBI
 dFCTTu2X9AUSBxkOFAt9xXkVtRfqNGYFHXvi5eJ2inDyQDOit7x//tLaY4uKbjnuOgpcut
 TTLdz7+gpW4Wf16eB39sD24tJ3Ev76U=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-IdCcsDDYOVWp1i3QoU6P0g-1; Mon, 10 Jul 2023 04:45:17 -0400
X-MC-Unique: IdCcsDDYOVWp1i3QoU6P0g-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b708d79112so36928551fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 01:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688978716; x=1691570716;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8Md5DxJ/DXNzZNPaIMm/A+OyRkUpEJ0KHRBY8+I9Hg=;
 b=h/hU6rXxrc2qlT/nkia25SSreyypCwP3DzzdWbnldFaDsqVnKN2ZaNIHVKtnTWtS1e
 YlsAHyoINt3xsPHJNmyTfmLYIcnm65L/lFaFIRyO6Btc/BZerfouYd5yzuAVPj/fIXgO
 0js98GsMRP3B9cI9eaPnVM2PlWWhOQtGOh+4zupg5qS1N6RDKdb9BO6Ki9CZw/FVMTX+
 xTBhj3CH2nW/pSBaAcKCQngTHpbsZw+D5aeGlzLLA5caF0AUDCs7FvH2C/EVaU6j9/k5
 8ekzAUsVuWD9gCJlbFchJ0TNIIiH2NLZwnLsxnVbUaV8UCGwqLcxWL/zMAz49CJtc+/z
 YqPQ==
X-Gm-Message-State: ABy/qLZkecLatQAL7nDbn9sGDhY+xaVaNcTLQP/5MdyTIkoaxrgpMZLW
 jDLFjU03xwYDJ7nrJseNQ0jh/Km7ng8gSGNPuQ5fFKSvxNVTC3+0bP8Pa59vbItSIjLDR5gxaA8
 DZebAqbc0nYEQmSd/nySm3cL2ohBB
X-Received: by 2002:a2e:9d45:0:b0:2b4:6ca3:7747 with SMTP id
 y5-20020a2e9d45000000b002b46ca37747mr8749619ljj.28.1688978716100; 
 Mon, 10 Jul 2023 01:45:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHBycuiZhcq3PBfEMMSqEg7n8D8wH0mWIJ/M8B+HzpOeS4E5z8EOtnuZXMLz/KbMGsmr/2rOw==
X-Received: by 2002:a2e:9d45:0:b0:2b4:6ca3:7747 with SMTP id
 y5-20020a2e9d45000000b002b46ca37747mr8749594ljj.28.1688978715728; 
 Mon, 10 Jul 2023 01:45:15 -0700 (PDT)
Received: from localhost ([62.15.161.174]) by smtp.gmail.com with ESMTPSA id
 c16-20020a7bc850000000b003fbb06af219sm9780811wml.32.2023.07.10.01.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 01:45:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 suijingfeng@loongson.cn, decui@microsoft.com, wei.liu@kernel.org,
 haiyangz@microsoft.com, kys@microsoft.com
Subject: Re: [PATCH] fbdev/hyperv_fb: Include <linux/screen_info.h>
In-Reply-To: <20230710075848.23087-1-tzimmermann@suse.de>
References: <20230710075848.23087-1-tzimmermann@suse.de>
Date: Mon, 10 Jul 2023 10:45:14 +0200
Message-ID: <87lefoi291.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Include <linux/screen_info.h> to get the global screen_info state.
> Fixes the following errors:
>
>>> drivers/video/fbdev/hyperv_fb.c:1033:10: error: use of undeclared identifier 'screen_info'
>     1033 |                 base = screen_info.lfb_base;
>          |                        ^
>    drivers/video/fbdev/hyperv_fb.c:1034:10: error: use of undeclared identifier 'screen_info'
>     1034 |                 size = screen_info.lfb_size;
> 	 |                        ^
>>> drivers/video/fbdev/hyperv_fb.c:1080:3: error: must use 'struct' tag to refer to type 'screen_info'
>     1080 |                 screen_info.lfb_size = 0;
> 	 |                 ^
> 	 |                 struct
>>> drivers/video/fbdev/hyperv_fb.c:1080:14: error: expected identifier or '('
>     1080 |                 screen_info.lfb_size = 0;
> 	 |                            ^
>    drivers/video/fbdev/hyperv_fb.c:1081:3: error: must use 'struct' tag to refer to type 'screen_info'
>     1081 |                 screen_info.lfb_base = 0;
> 	 |                 ^
> 	 |                 struct
>    drivers/video/fbdev/hyperv_fb.c:1081:14: error: expected identifier or '('
>     1081 |                 screen_info.lfb_base = 0;
> 	 |                            ^
>    drivers/video/fbdev/hyperv_fb.c:1082:3: error: must use 'struct' tag to refer to type 'screen_info'
>     1082 |                 screen_info.orig_video_isVGA = 0;
> 	 |                 ^
> 	 |                 struct
>     drivers/video/fbdev/hyperv_fb.c:1082:14: error: expected identifier or '('
>     1082 |                 screen_info.orig_video_isVGA = 0;
> 	 |                            ^
>     8 errors generated.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307101042.rqehuauj-lkp@intel.com/
> Fixes: 8b0d13545b09 ("efi: Do not include <linux/screen_info.h> from EFI header")
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com> (supporter:Hyper-V/Azure CORE AND DRIVERS)
> Cc: Haiyang Zhang <haiyangz@microsoft.com> (supporter:Hyper-V/Azure CORE AND DRIVERS)
> Cc: Wei Liu <wei.liu@kernel.org> (supporter:Hyper-V/Azure CORE AND DRIVERS)
> Cc: Dexuan Cui <decui@microsoft.com> (supporter:Hyper-V/Azure CORE AND DRIVERS)
> Cc: Helge Deller <deller@gmx.de> (maintainer:FRAMEBUFFER LAYER)
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-efi@vger.kernel.org
> Cc: linux-hyperv@vger.kernel.org (open list:Hyper-V/Azure CORE AND DRIVERS)
> Cc: linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
> Cc: dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER)
> ---
>  drivers/video/fbdev/hyperv_fb.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

