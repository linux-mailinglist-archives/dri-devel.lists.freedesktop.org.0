Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC5A6EF704
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 17:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E4010E9DA;
	Wed, 26 Apr 2023 15:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0CC10E9DA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 15:01:41 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-54f8b46d031so83302307b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 08:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682521300; x=1685113300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=InRK/SXUr8n9eTPGJfhjR3lsiyg7RVplSp0EEYbdwVU=;
 b=HGd4nxJ93OZKgpjafhNhH6yKC93gccy8oxbLwRQIzgAo+kYRst9rUAq2EYDhW/L5TD
 7BUBBvYzfw5S90R0QdMIe88HqWiBjmmLmlgNasHx1NPUIvE2L5xqpJhJonl7GEfBaV0w
 h+daCJOJj2nJDDZl0J7s5CUUwognpkAalvAYlt7mnVQaJxh5Ycw0y71Nwk1GixnRs6qf
 Dzpmk5YeY/sssWr2mmTEOvDI+JSdJCkPFv/pREDp9wDdynb+A2pe/NsXiTjBTfARCMrS
 xNhatKuh4tewYbw0Ig1Y5B69fXg9zvSf8GOdjIOsWbPkeF+TEY9LGHBOdUebfAOQ1w4E
 kzNA==
X-Gm-Message-State: AC+VfDxwifK4OHIW86b+GXQxuNVjQMXX/ShojTSeskazErv6RwW32x1r
 2PztHr9JdaHKJfOjyFhFqz75T3hhHx9/ZQ==
X-Google-Smtp-Source: ACHHUZ5e6iDVETBIVAOqGOiOvEgKO95U5c6ZPSAFng7YRGTgAy18mwWXiRmt8YgVr1svsq063L205Q==
X-Received: by 2002:a81:4a46:0:b0:556:a562:66bb with SMTP id
 x67-20020a814a46000000b00556a56266bbmr6974882ywa.26.1682521299346; 
 Wed, 26 Apr 2023 08:01:39 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 r127-20020a0dcf85000000b00552df52450csm4216465ywd.88.2023.04.26.08.01.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 08:01:38 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-555d2b43a23so83384147b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 08:01:38 -0700 (PDT)
X-Received: by 2002:a81:7104:0:b0:54f:b6af:ac15 with SMTP id
 m4-20020a817104000000b0054fb6afac15mr11853502ywc.51.1682521298213; Wed, 26
 Apr 2023 08:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-6-tzimmermann@suse.de>
In-Reply-To: <20230425142846.730-6-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Apr 2023 17:01:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-_w9yQHYhOCD3cz4CEY6ag-dTXjuHSLnzty0hAMBbXw@mail.gmail.com>
Message-ID: <CAMuHMdU-_w9yQHYhOCD3cz4CEY6ag-dTXjuHSLnzty0hAMBbXw@mail.gmail.com>
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Apr 25, 2023 at 4:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Move the existing CFB read and write code for I/O memory into
> the new helpers fb_cfb_read() and fb_cfb_write(). Make them the
> default fp_ops. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/Makefile      |   2 +-
>  drivers/video/fbdev/core/fb_cfb_fops.c | 126 +++++++++++++++++++++++++
>  drivers/video/fbdev/core/fbmem.c       | 113 +---------------------
>  include/linux/fb.h                     |  10 ++
>  4 files changed, 139 insertions(+), 112 deletions(-)
>  create mode 100644 drivers/video/fbdev/core/fb_cfb_fops.c

While the general idea is fine, please do not call any of this "cfb",
as it is not related to chunky color frame buffer formats.
All of these operate on the raw frame buffer contents.

> --- /dev/null
> +++ b/drivers/video/fbdev/core/fb_cfb_fops.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/fb.h>
> +#include <linux/module.h>
> +#include <linux/uaccess.h>
> +
> +ssize_t fb_cfb_read(struct fb_info *info, char __user *buf, size_t count=
, loff_t *ppos)
> +{

[...]

> +       while (count) {
> +               c  =3D (count > PAGE_SIZE) ? PAGE_SIZE : count;
> +               dst =3D buffer;
> +               fb_memcpy_fromfb(dst, src, c);
> +               dst +=3D c;
> +               src +=3D c;
> +
> +               if (copy_to_user(buf, buffer, c)) {

So here's still the buggy copy_to_user() handling, copied from fb_read().

> +                       err =3D -EFAULT;
> +                       break;
> +               }
> +               *ppos +=3D c;
> +               buf +=3D c;
> +               cnt +=3D c;
> +               count -=3D c;
> +       }
> +
> +       kfree(buffer);
> +
> +       return cnt ? cnt : err;
> +}
> +EXPORT_SYMBOL(fb_cfb_read);
> +
> +ssize_t fb_cfb_write(struct fb_info *info, const char __user *buf, size_=
t count, loff_t *ppos)
> +{

[...]

> +       while (count) {
> +               c =3D (count > PAGE_SIZE) ? PAGE_SIZE : count;
> +               src =3D buffer;
> +
> +               if (copy_from_user(src, buf, c)) {

And copy_from_user(), too...

> +                       err =3D -EFAULT;
> +                       break;
> +               }
> +
> +               fb_memcpy_tofb(dst, src, c);
> +               dst +=3D c;
> +               src +=3D c;
> +               *ppos +=3D c;
> +               buf +=3D c;
> +               cnt +=3D c;
> +               count -=3D c;
> +       }
> +
> +       kfree(buffer);
> +
> +       return (cnt) ? cnt : err;
> +}

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
