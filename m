Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1176793992
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 12:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608DE10E5ED;
	Wed,  6 Sep 2023 10:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAFC10E5E8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693995059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hv8DYu7MTr4kuGV37i9sTqxH6eTvGFMuruIX7/nBGWo=;
 b=YxfF8oxrD4LyTqaO4LY6tc3z1e7DHAQA0kGejkfhOe41FnEa6QevPYjKO/LGvNb7bEOfe5
 011N4F5TmkVHUbncmsBlwwBnX6udM2tRbXauiz+WLcaScG0uS+ii5XeG9dSES6OfBBL4BM
 iwI6BFWS0Y2qwq/iCgaXs6vLNHkhP8Y=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-rGqKMAE4N3WmLF_CjXb7lQ-1; Wed, 06 Sep 2023 06:10:56 -0400
X-MC-Unique: rGqKMAE4N3WmLF_CjXb7lQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2be51691dd5so20309731fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 03:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693995055; x=1694599855;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hv8DYu7MTr4kuGV37i9sTqxH6eTvGFMuruIX7/nBGWo=;
 b=TpKoVi1EwHhBJv/B36xZjJmHrX+hliOFVMwiGWfQTaYISBF/zx/9Z8SRvQ333EZkjI
 ++8KdFGXgm6aVx4vARwZiX9WGq+Unx2H4t+j1GmLe5fg4XmgrlTvKQoCSEm7A2oSZxD6
 9EwLKSi1LQdVYThKLD7uKClY3syJbWYzO/C1B6cAS45fgEhLCtyBtwve4KLBWqzsk5jd
 QuFUVQF/TKwA7VrFazkZ0eTw1glHM2buE9LPG4TZSiYSbXYvtsscqPRdnQtp0mQtsw6v
 5qS2lgofIRSQG6E6foWqzb7dGFvk0qWBuFunoUEaxnKhUqb7x/2Aa5OJMUEqpckzeo0O
 TgIg==
X-Gm-Message-State: AOJu0Yzc2d0ItmWc3kp5nPKdswUss51H3OP7ihfSzlwEbtN79enNHj5G
 tG6MSMIBEyJ05+f1VrGs6js8ykvN3HKIGsIRK02Jgk6qMl7KCRFfWhMRyow90rLDwzduulYe0Z/
 w7rIo3cdcVlcQhEjb0wpxrGaLJh4P
X-Received: by 2002:a2e:870d:0:b0:2bc:b9c7:7ba8 with SMTP id
 m13-20020a2e870d000000b002bcb9c77ba8mr1821977lji.43.1693995054992; 
 Wed, 06 Sep 2023 03:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlEOBg4YUUo+ApwkDK41eZQoOWRKWT9hoI43BTnkb2886b1jJOEBUZMQKvCBA2uq3yLQagdg==
X-Received: by 2002:a2e:870d:0:b0:2bc:b9c7:7ba8 with SMTP id
 m13-20020a2e870d000000b002bcb9c77ba8mr1821960lji.43.1693995054655; 
 Wed, 06 Sep 2023 03:10:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n17-20020a7bcbd1000000b003fee777fd84sm19425278wmi.41.2023.09.06.03.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 03:10:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/7] fbdev/core: Move logo functions into separate
 source file
In-Reply-To: <20230829142109.4521-5-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-5-tzimmermann@suse.de>
Date: Wed, 06 Sep 2023 12:10:53 +0200
Message-ID: <87fs3r4no2.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Move the fbdev function for displaying boot-up logos into their
> own file fb_logo.c. The file can later be build depending on the
> state of CONFIG_LOGO. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/Makefile      |   1 +
>  drivers/video/fbdev/core/fb_internal.h |   6 +
>  drivers/video/fbdev/core/fb_logo.c     | 533 +++++++++++++++++++++++++
>  drivers/video/fbdev/core/fbmem.c       | 524 ------------------------
>  include/linux/fb.h                     |   5 -
>  5 files changed, 540 insertions(+), 529 deletions(-)
>  create mode 100644 drivers/video/fbdev/core/fb_logo.c
>
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index edfde2948e5c..adce31155e92 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>  obj-$(CONFIG_FB_CORE)             += fb.o
>  fb-y                              := fb_info.o \
> +                                     fb_logo.o \

Maybe instead of adding this unconditionally you could only add it when
CONFIG_LOGO is enabled ?

[...]

> diff --git a/drivers/video/fbdev/core/fb_logo.c b/drivers/video/fbdev/core/fb_logo.c
> new file mode 100644
> index 000000000000..76ba5a2bebae
> --- /dev/null
> +++ b/drivers/video/fbdev/core/fb_logo.c
> @@ -0,0 +1,533 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/export.h>
> +#include <linux/fb.h>
> +#include <linux/linux_logo.h>
> +
> +bool fb_center_logo __read_mostly;
> +int fb_logo_count __read_mostly = -1;
> +
> +#ifdef CONFIG_LOGO

[...]

> +#else
> +int fb_prepare_logo(struct fb_info *info, int rotate)
> +{
> +	return 0;
> +}
> +EXPORT_SYMBOL(fb_prepare_logo);
> +
> +int fb_show_logo(struct fb_info *info, int rotate)
> +{
> +	return 0;
> +}
> +EXPORT_SYMBOL(fb_show_logo);

I would move the CONFIG_LOGO #ifdefery to the header file and make these a
static inline function, instead of having the stubs here and exporting
symbols for functions that are a no-op.

I think that will also fix the issues that the robot complained about.

Other than that, the patch looks good to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

