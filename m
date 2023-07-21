Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFC875D7A8
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 00:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3935F10E709;
	Fri, 21 Jul 2023 22:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726C110E709
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 22:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689979581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yE0bLtRIMwP7QfCtqHUeTr/4KJnDlp9DaWfvJbs40ac=;
 b=BqBnZNisgVbOBZQRdS6p5vwh42Hps3h6wUStE6SeSWX3nUKOhhCSgG+3ynMBZIqJX36pVt
 ySGqyowbxRFD9JFiNq4TFa/z5h9ds8KzW04ik2wzWIb/wjN6ahUltHXvvcdGbbFnlIW2i9
 WyDhoADX1LCIYz8gC02B4dabx/KWeeQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-X1RiZ2fdOAKTzfOjjeuzsg-1; Fri, 21 Jul 2023 18:46:19 -0400
X-MC-Unique: X1RiZ2fdOAKTzfOjjeuzsg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbe4cecd66so12481785e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 15:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689979578; x=1690584378;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yE0bLtRIMwP7QfCtqHUeTr/4KJnDlp9DaWfvJbs40ac=;
 b=kLhocpqEySwW0APpackoICj1ytFWjnLig6Ly1eiy8bOyA71yMyupnU821rHneJJ8RN
 SOyTiMaSApxLIxMQCx92RCULCB82IaE/Tf/dWOrSIuthKx/F0siP5LiMmMRQ47tKPHIV
 0zBPGQw4IDBgaT/t6Gmyge++xJmbhI3nqXqoJIx4ydpq32AtJpzukkbbnCHWac4K1AXq
 eIAV6LCni+RfHWY5OmRMablQLpy3bmgxbw8d9ZOlPEUmKyacSqrBuTYJNbFuU462W4Zm
 IH4GDtLDXIMoK5SU6GQ9Zd/arD5U7Nt/BevRTB4LpiApjIU3jAQet8PEijK9q8amuK/x
 lGXA==
X-Gm-Message-State: ABy/qLaeA/y7+zka+ahLvqmI0uHc0GDrn3E63dYtnAjplW96BJ0EFM3T
 9Fhp06ldUNYNi/sd+JnBr/ZoDuaeDiEj0YRcAjBo4+4JbOzvsb5qWHSqoLybIpMdO/Sz+M3/9ye
 lmDEf20Hp1Ib3tUb7mzZ80zpIzHaI
X-Received: by 2002:a05:600c:224b:b0:3fb:b34f:6cd4 with SMTP id
 a11-20020a05600c224b00b003fbb34f6cd4mr2241618wmm.36.1689979578507; 
 Fri, 21 Jul 2023 15:46:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG4o1OxvRmpHFoaNAuc4QqPQ+HeK/yygxg+TEil6F/L2at/FUadRCLQ5fAQrswO0An7WjzHsw==
X-Received: by 2002:a05:600c:224b:b0:3fb:b34f:6cd4 with SMTP id
 a11-20020a05600c224b00b003fbb34f6cd4mr2241612wmm.36.1689979578118; 
 Fri, 21 Jul 2023 15:46:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s19-20020a1cf213000000b003fbaade072dsm4099955wmc.23.2023.07.21.15.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 15:46:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/4] video: Add auxiliary display drivers to Graphics
 support menu
In-Reply-To: <20230719081544.741051-2-javierm@redhat.com>
References: <20230719081544.741051-1-javierm@redhat.com>
 <20230719081544.741051-2-javierm@redhat.com>
Date: Sat, 22 Jul 2023 00:46:16 +0200
Message-ID: <87sf9gublz.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

[adding Miguel Ojeda who was not in the Cc list]

Hello Miguel, could you please ack this patch so that I can take the whole
patch-set through the drm-misc tree?

> The drivers in this subsystem are for character-based LCD displays, which
> can fall into the same category of the DRM/KMS and fbdev drivers that are
> located under the "Graphics support" menu. Add auxdisplay there as well.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Tested-by: Arnd Bergmann <arnd@arndb.de>
> ---
>
> (no changes since v5)
>
> Changes in v5:
> - Take the auxdisplay/Kconfig source out of "if HAS_IOMEM" (Geert Uytterhoeven).
>
>  drivers/Kconfig       | 2 --
>  drivers/video/Kconfig | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 514ae6b24cb2..496ca02ee18f 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -129,8 +129,6 @@ source "drivers/dma-buf/Kconfig"
>  
>  source "drivers/dca/Kconfig"
>  
> -source "drivers/auxdisplay/Kconfig"
> -
>  source "drivers/uio/Kconfig"
>  
>  source "drivers/vfio/Kconfig"
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 8b2b9ac37c3d..e5b1cc54cafa 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -25,6 +25,8 @@ config VIDEO_NOMODESET
>  	bool
>  	default n
>  
> +source "drivers/auxdisplay/Kconfig"
> +
>  if HAS_IOMEM
>  
>  config HAVE_FB_ATMEL
> -- 
> 2.41.0
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

