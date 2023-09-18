Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2F97A45EC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E8B10E243;
	Mon, 18 Sep 2023 09:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7524210E243
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695029460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K9mKfMs2axUjRk4VejYXL9YNHsofaFImODtn3an3J0Q=;
 b=GxuETHDkr3U8+2ZZKFv7FI04fgXzO84T/SwrYjcPaI5erLnvYrFEw4vDgu0VlOz1e83fcH
 4iBjcoqR3zYa0HuxSbjQ611JOt4EsllPAYyJgmjHxCJkYRtJxi66sxzFqi8zQZyJE1X+3w
 kyH8jNg9GORv4YuutgjHvxSGE/EbOt0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-FO5JIdVBMCm8piq1wShaVA-1; Mon, 18 Sep 2023 05:30:57 -0400
X-MC-Unique: FO5JIdVBMCm8piq1wShaVA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-321544abeeeso351667f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 02:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695029456; x=1695634256;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K9mKfMs2axUjRk4VejYXL9YNHsofaFImODtn3an3J0Q=;
 b=QAfyHTNqo3cK3PEnT+WCKCgFgWRz0HWYGHp8NjqsfUFStGPwGfXq1/u71soI1DeYw1
 02O7WN4FeQ9AZOfhvrKASa96FamdCCxS18Aw/OzH1UTuFF8sSXzAvWIcTNkYe7jFNwI9
 /XlQ7FSBqmUzK+JSqYQO5R9TkMOT18vv0T1QLxlVG1D6cQzKeD5bOFl/xwev2pqWLgV6
 vcUichjHIqs/xHmkwNEiLe5sq9Gg3G41Lfhd3PEwLK0bCnykvp45XBcpqRL6w9zmYnA3
 Ucv8wA8/aJN6eMuYPfYlDyJEJ4ckFNNa19zaD8sXIVaVNIJaCGohsbgp0Z+ZX6C/6Gpm
 iuaQ==
X-Gm-Message-State: AOJu0YyUhuEPa+RrJ937xjD00TJF0yM11Is/k/2xHG3POwbQww0sbLAQ
 8WToHJprVqM9ks/JUVCvRaPOgiALh8xb5D8hCJ09Lsf0zRg2z5xYQTfrslKj9ULZNAPilQ4wArc
 Lvn9QMRA7s34GEvrxYQ31Go7O282F
X-Received: by 2002:a5d:4152:0:b0:317:5182:7b55 with SMTP id
 c18-20020a5d4152000000b0031751827b55mr6601633wrq.42.1695029455964; 
 Mon, 18 Sep 2023 02:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuVwKer/t6wO8e6EaqpLJk3xr8QAnbzNM6Ra4QUQXA+9orH05TCHII2aGbpDgbji3C7zRZ1Q==
X-Received: by 2002:a5d:4152:0:b0:317:5182:7b55 with SMTP id
 c18-20020a5d4152000000b0031751827b55mr6601614wrq.42.1695029455646; 
 Mon, 18 Sep 2023 02:30:55 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q11-20020adff50b000000b0031c71693449sm12122610wro.1.2023.09.18.02.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 02:30:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 sam@ravnborg.org, arnd@arndb.de, rdunlap@infradead.org,
 glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH] fbdev/sh7760fb: Depend on FB=y
In-Reply-To: <20230918090400.13264-1-tzimmermann@suse.de>
References: <20230918090400.13264-1-tzimmermann@suse.de>
Date: Mon, 18 Sep 2023 11:30:54 +0200
Message-ID: <87o7hz4ylt.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Fix linker error if FB=m about missing fb_io_read and fb_io_write. The
> linker's error message suggests that this config setting has already
> been broken for other symbols.
>
>   All errors (new ones prefixed by >>):
>
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_probe':
>      sh7760fb.c:(.text+0x374): undefined reference to `framebuffer_alloc'
>      sh4-linux-ld: sh7760fb.c:(.text+0x394): undefined reference to `fb_videomode_to_var'
>      sh4-linux-ld: sh7760fb.c:(.text+0x39c): undefined reference to `fb_alloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x3a4): undefined reference to `register_framebuffer'
>      sh4-linux-ld: sh7760fb.c:(.text+0x3ac): undefined reference to `fb_dealloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x434): undefined reference to `framebuffer_release'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_remove':
>      sh7760fb.c:(.text+0x800): undefined reference to `unregister_framebuffer'
>      sh4-linux-ld: sh7760fb.c:(.text+0x804): undefined reference to `fb_dealloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x814): undefined reference to `framebuffer_release'
>   >> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0xc): undefined reference to `fb_io_read'
>   >> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x10): undefined reference to `fb_io_write'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x2c): undefined reference to `cfb_fillrect'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x30): undefined reference to `cfb_copyarea'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x34): undefined reference to `cfb_imageblit'
>
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309130632.LS04CPWu-lkp@intel.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Agreed with your change.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

