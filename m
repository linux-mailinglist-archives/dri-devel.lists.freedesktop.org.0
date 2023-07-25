Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C919761E07
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 18:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036BB10E0FC;
	Tue, 25 Jul 2023 16:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406FC10E167
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690301214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n8WDoL0557ijucVnvFFhXFlCk91a1heL5kHgluQGr74=;
 b=g5K9ZBTXdPpSrOjhbguXGKvYj07frR4WI0v4xtPNlDVs1KL7NnjFL3MDJkgXHqdf14kXvP
 8y2vzBImDn+YZ32B611BJhSsq9nWOQWdHaR92SubW9dYbV+3DqleVrzJ7skFx5Zp1Lywra
 bU5JEY4L1xgLmWfjJoPrR9pfNMgXYGQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-74oB6WO9NSG036mr67uQ-A-1; Tue, 25 Jul 2023 12:06:52 -0400
X-MC-Unique: 74oB6WO9NSG036mr67uQ-A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fd2dec82b7so16556215e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 09:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690301211; x=1690906011;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n8WDoL0557ijucVnvFFhXFlCk91a1heL5kHgluQGr74=;
 b=Rv1VyOu0hkjgDhfH+8rYzywWgcqxk5IzOFhGfT2ns2eHc+6K++7e8qO5TJRL+W3Io8
 BEV367/o9ZuqoueY/bzjwUEfaGa6jILDPzxk+xRCHcTadxiMsAJyaJ4OCEqE4xf5YuOx
 cl+dvyo/bs1J7oQwhwgGgETy5ooNKBdePE2snBmxRUD4ygs6oEe7Gwmw1PetU+0gBa7l
 dAG7Dj7IIpGk1ReUnt3C/zvvZ5dUfhiLgd3nf8yGQsPeHPWFsdeUZpSly9oqkWBIfZdI
 N6xL+eTyRBt5QqgVJNSquN6u0lYH0660mTjRcUuN8n8Z8ZTIZ5S36TEoDirCXO2YO54l
 RWZA==
X-Gm-Message-State: ABy/qLaDBkBD3LSj9GUex84cwVZivBBULY+yrdujBNRLABvX3HdrVo9I
 tRe3802FizL9FPUGSfl/Kbw3MIea443feDvpXELBiYYOqWAMMcNqIdfW6Ogkasq0mwOblLNed7y
 h1ZEoTrYcViVLqscd5NhV/h+LVLfV
X-Received: by 2002:a05:600c:2043:b0:3fa:934c:8350 with SMTP id
 p3-20020a05600c204300b003fa934c8350mr10062660wmg.27.1690301211265; 
 Tue, 25 Jul 2023 09:06:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHhB4b1r6/9EKYpbymuXJFkp9iRDrryPS4kRN5/XpdtSoEVtQGo358UOoZiWwF6PdI9lwFdRA==
X-Received: by 2002:a05:600c:2043:b0:3fa:934c:8350 with SMTP id
 p3-20020a05600c204300b003fa934c8350mr10062636wmg.27.1690301210864; 
 Tue, 25 Jul 2023 09:06:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a17-20020adffad1000000b003143cdc5949sm16909129wrs.9.2023.07.25.09.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 09:06:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller
 <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
In-Reply-To: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
Date: Tue, 25 Jul 2023 18:06:49 +0200
Message-ID: <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

Thanks a lot for your patch!

> If CONFIG_FB_CORE=y but CONFIG_FB=n, the frame buffer bootup logos can
> no longer be enabled.  Fix this by making CONFIG_LOGO depend on
> CONFIG_FB_CORE instead of CONFIG_FB, as there is no good reason for the
> logo code to depend on the presence of real frame buffer device drivers.
>

Indeed.

> Fixes: 55bffc8170bb5813 ("fbdev: Split frame buffer support in FB and FB_CORE symbols")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/video/Kconfig      | 2 +-
>  drivers/video/logo/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index e5b1cc54cafa10d5..b694d7669d3200b1 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -63,7 +63,7 @@ if VT
>  	source "drivers/video/console/Kconfig"
>  endif
>  
> -if FB || SGI_NEWPORT_CONSOLE
> +if FB_CORE || SGI_NEWPORT_CONSOLE
>  	source "drivers/video/logo/Kconfig"
>  
>  endif
> diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
> index 6d6f8c08792dc897..b7d94d1dd1585a84 100644
> --- a/drivers/video/logo/Kconfig
> +++ b/drivers/video/logo/Kconfig
> @@ -5,7 +5,7 @@
>  
>  menuconfig LOGO
>  	bool "Bootup logo"
> -	depends on FB || SGI_NEWPORT_CONSOLE
> +	depends on FB_CORE || SGI_NEWPORT_CONSOLE
>  	help
>  	  Enable and select frame buffer bootup logos.

Should then move this option to drivers/video/fbdev/core/Kconfig ?

Regardless, could be done as a follow-up and the fix looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

