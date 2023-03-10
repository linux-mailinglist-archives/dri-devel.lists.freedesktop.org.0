Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA46B3F01
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 13:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1904110E086;
	Fri, 10 Mar 2023 12:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940F010E21D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 12:18:33 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id c4so3512768pfl.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 04:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678450713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQWRSFkOKg9T+y+gldqtOznj/eHaxJktJYeXp0a1CHE=;
 b=X0m1GIXnFLZSnUIMC8tXN3MjJv2mxoBg8j2HZE1gg2EljBsDDqNYawAJnqQehG+RDZ
 jREisZCDSP7uiTfTAzwc3iYvaxlipaIEe4mVodlCBoTZWs8w6U7akm8BvQ+aWBONC1Ma
 eMo92jTbE2ZwwnlBKTpzCSdPq+/Jj5e6H3mNm1wDenRXdNr5rXW/7S/kmgvV/kVSOi0o
 6NZsvabnM3diJ2x45r8E1KnETDQhbIW6zA367SagnJtl4kDNP1sDJGBjjMLF/D5uyxI7
 /+xD6E14oxPxTw9wQu39kcQgH4J4ZORMsSrYgdK6smLGNG1OOVp4D3C2Vsqqtphi3ZCd
 IHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678450713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQWRSFkOKg9T+y+gldqtOznj/eHaxJktJYeXp0a1CHE=;
 b=J+C9vHl0qd5zK1zTogk8a80eG32J5CppdfhDBbEZvsiOS3usa4C443rWRb3HHIiAz3
 khgGyDcBQLjkAyII+ehnzODMvqKjcAgiVC3iHay/qRxx74htucGBF3CWQGh7UlJnFcQb
 Pyy8LcLYGy9rgXPU5ocvoi8NFK18iXDJW2iRDpoKO4lu9vbeTar/mXpIrTGlOMspaXoW
 tRSmWoEusjIls5ji6tnf2/Bz3D2OAv/pjtvgBp28Wdb8mn1/6u88DdtzaSUQ54hgtcfn
 t0L8chzYVlaG6cfYnSzmDGcauuok3GALbdCr+l77dw1x1IwCT5d+nVhSy/OQ2MVm0CMI
 evQg==
X-Gm-Message-State: AO0yUKUqgVYMuv7R9gRiiX4Ppl4PaOvfhyVHvjOYFhf8gkvqwcAebHyM
 1x+enV15beTpbiKwkTNXzw+HhgJsOCxk3IEFBnE=
X-Google-Smtp-Source: AK7set+IE1/l1QhMtQeSm2c0wnMVPaxpSDAntt8hngJitI03+uAOBDkn81AVlY6BxhtlRQmUYaAGdEm2Y/elvAsSZTg=
X-Received: by 2002:a62:cd83:0:b0:5e5:7675:88e3 with SMTP id
 o125-20020a62cd83000000b005e5767588e3mr10322774pfg.5.1678450713012; Fri, 10
 Mar 2023 04:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20230308105012.1845-1-tiwai@suse.de>
In-Reply-To: <20230308105012.1845-1-tiwai@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 10 Mar 2023 13:18:21 +0100
Message-ID: <CAMeQTsbFuoP4KXmMm4xbwvXOjYw5CYJs6q2nnMuRYHsutrX0aw@mail.gmail.com>
Subject: Re: [PATCH v2] fbdev: Fix incorrect page mapping clearance at
 fb_deferred_io_release()
To: Takashi Iwai <tiwai@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Miko Larsson <mikoxyzzz@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patrik Jakobsson <pjakobsson@suse.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 11:50=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> The recent fix for the deferred I/O by the commit
>   3efc61d95259 ("fbdev: Fix invalid page access after closing deferred I/=
O devices")
> caused a regression when the same fb device is opened/closed while
> it's being used.  It resulted in a frozen screen even if something
> is redrawn there after the close.  The breakage is because the patch
> was made under a wrong assumption of a single open; in the current
> code, fb_deferred_io_release() cleans up the page mapping of the
> pageref list and it calls cancel_delayed_work_sync() unconditionally,
> where both are no correct behavior for multiple opens.
>
> This patch adds a refcount for the opens of the device, and applies
> the cleanup only when all files get closed.
>
> As both fb_deferred_io_open() and _close() are called always in the
> fb_info lock (mutex), it's safe to use the normal int for the
> refcounting.
>
> Also, a useless BUG_ON() is dropped.
>
> Fixes: 3efc61d95259 ("fbdev: Fix invalid page access after closing deferr=
ed I/O devices")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Looks good to me

Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
> v1->v2:
> * Rename to fb_deferred_io_lastclose()
> * Rename the new field from opens to open_count
> * Removed unused variable
> * More comments about fb_info locking
>
>  drivers/video/fbdev/core/fb_defio.c | 17 +++++++++++++----
>  include/linux/fb.h                  |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/co=
re/fb_defio.c
> index aa5f059d0222..274f5d0fa247 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -305,17 +305,18 @@ void fb_deferred_io_open(struct fb_info *info,
>                          struct inode *inode,
>                          struct file *file)
>  {
> +       struct fb_deferred_io *fbdefio =3D info->fbdefio;
> +
>         file->f_mapping->a_ops =3D &fb_deferred_io_aops;
> +       fbdefio->open_count++;
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_open);
>
> -void fb_deferred_io_release(struct fb_info *info)
> +static void fb_deferred_io_lastclose(struct fb_info *info)
>  {
> -       struct fb_deferred_io *fbdefio =3D info->fbdefio;
>         struct page *page;
>         int i;
>
> -       BUG_ON(!fbdefio);
>         cancel_delayed_work_sync(&info->deferred_work);
>
>         /* clear out the mapping that we setup */
> @@ -324,13 +325,21 @@ void fb_deferred_io_release(struct fb_info *info)
>                 page->mapping =3D NULL;
>         }
>  }
> +
> +void fb_deferred_io_release(struct fb_info *info)
> +{
> +       struct fb_deferred_io *fbdefio =3D info->fbdefio;
> +
> +       if (!--fbdefio->open_count)
> +               fb_deferred_io_lastclose(info);
> +}
>  EXPORT_SYMBOL_GPL(fb_deferred_io_release);
>
>  void fb_deferred_io_cleanup(struct fb_info *info)
>  {
>         struct fb_deferred_io *fbdefio =3D info->fbdefio;
>
> -       fb_deferred_io_release(info);
> +       fb_deferred_io_lastclose(info);
>
>         kvfree(info->pagerefs);
>         mutex_destroy(&fbdefio->lock);
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index d8d20514ea05..02d09cb57f6c 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -212,6 +212,7 @@ struct fb_deferred_io {
>         /* delay between mkwrite and deferred handler */
>         unsigned long delay;
>         bool sort_pagereflist; /* sort pagelist by offset */
> +       int open_count; /* number of opened files; protected by fb_info l=
ock */
>         struct mutex lock; /* mutex that protects the pageref list */
>         struct list_head pagereflist; /* list of pagerefs for touched pag=
es */
>         /* callback */
> --
> 2.35.3
>
