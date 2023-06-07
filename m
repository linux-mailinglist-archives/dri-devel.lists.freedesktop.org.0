Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE407271A8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 00:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44DA10E55F;
	Wed,  7 Jun 2023 22:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D020F10E55F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686176920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=irRG2hn1Ih/d+vMuj88e+Lh/5vC/wBK+G/U1UA7S7zo=;
 b=LK7H0Q/x9n71RWDSBYFHRYJ1HIaVYYShaGXFklRU1DeCMHlciQe67/Be8WvsOZA/vYOxeZ
 a4tuZLHbmXqmL04vEYXF33x1pwT+LKJLmCNfM/j5FWjhZ0dIf1L0CXUlWEmuFQ38M7o9ST
 XvMiPRHlC3Bml1UYIm4yF9mZEo8AzUo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-eGk0SPWbNF2hPqHU5ZA_dw-1; Wed, 07 Jun 2023 18:28:37 -0400
X-MC-Unique: eGk0SPWbNF2hPqHU5ZA_dw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30e5c497f90so595694f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 15:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686176916; x=1688768916;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=irRG2hn1Ih/d+vMuj88e+Lh/5vC/wBK+G/U1UA7S7zo=;
 b=Dv4jgmPp/Kyv+6mNasuv4q8vYgot5OrcTT/dVueOxWSSRgipz3W3+HbxYHMSYJ56KH
 Lf1d5iN6LxrjcYfwRBPlFfkwhj5nLAdq+jjLGDxPY0jasjzF/RlPuARhkxlpIHwYjR8Y
 yvhVKodhMBKiNakGY5vOZ1pA42evhgvvrq1KWb2jstb6Q/raV1hxHK8qB5+lN905rpwa
 9AG+i2fjMAA5wAn3zERwEJsvgLD3jb17tzNDCwliBmE5sM+Slm4ohLeGEUjkp8r6HvmD
 sJJ0QZduKxRktP/9MYajzZVNJsB5ct8G1PJXP2/pH/sxnaLFvq16C6OniLTzbUKdwhJJ
 hpKw==
X-Gm-Message-State: AC+VfDx0qO56c+w8uYW+TXi2xMIrvRqXpg6Iqagm505DvyYOUeK3umB1
 42rpLAVSfnrDHvVF7jDRgBD3ooemejAig9KsJ54wwftzfXinfmrvW3sHvK2yJe3fCZcHqD66BAd
 w4muKnsOo8PkgQwdTCC0ggSaHCUEW
X-Received: by 2002:a5d:650e:0:b0:307:9da1:c9d8 with SMTP id
 x14-20020a5d650e000000b003079da1c9d8mr4923756wru.4.1686176916352; 
 Wed, 07 Jun 2023 15:28:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61tYV/VqxAjAws580IyjPbyEEBH7wxqnNFkzkRRkVd9vumKgbQUzpT98wO/2M3vhdVG8VhKw==
X-Received: by 2002:a5d:650e:0:b0:307:9da1:c9d8 with SMTP id
 x14-20020a5d650e000000b003079da1c9d8mr4923745wru.4.1686176916109; 
 Wed, 07 Jun 2023 15:28:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v25-20020a1cf719000000b003f736735424sm3323437wmh.43.2023.06.07.15.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 15:28:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 28/30] fbdev/core: Move file-I/O code into separate file
In-Reply-To: <20230605144812.15241-29-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-29-tzimmermann@suse.de>
Date: Thu, 08 Jun 2023 00:28:35 +0200
Message-ID: <877cseewks.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Move fbdev's file-I/O code into a separate file and contain it in
> init and cleanup helpers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +
> +#include <linux/console.h>

#include <linux/compat.h> here, the robot complained about:

   drivers/video/fbdev/core/fb_devfs.c:183:9: error: unknown type name 'compat_caddr_t'

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

