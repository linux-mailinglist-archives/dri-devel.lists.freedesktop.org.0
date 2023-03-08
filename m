Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91A26B0267
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C3F10E0FC;
	Wed,  8 Mar 2023 09:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E495710E0FC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 09:08:35 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id v11so17033166plz.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 01:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678266515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdds9wfgs29gdzt8sKvKPTyIOCg9hqKMEvaBr114uy4=;
 b=XdvK6v3pSk6FcKi8RUyxgG3I61e4nDI5t1H7Mqjd5NSsrLz0HxnDRxLuYNkkbhkmpg
 wWbZAuVh7PfVpELOcHLp/oTw2KTkxVbXRW5WCNs/1tXRoU/2ncIkVsjChyeJsD5dEFo0
 fvwTrpeWS2QwLdW7AnV8C2Y51DdAeCtvU2afrGfYX1scHmlQtgMgCVqzp7X8/QFJRBm2
 +YdFGFr70xC1GXga7GZGfjzhoWBw2dV1u+Dfy4s4DxSb9YY+WqItDe2hI56LNYBKe178
 IGB0MJsWx8jJpRnkLa1iyzObBdhAcXjrusS/RsUJUuUg+GhUB93NtzCWrT3HtTjA/9UY
 2zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678266515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdds9wfgs29gdzt8sKvKPTyIOCg9hqKMEvaBr114uy4=;
 b=ddMkNwwWuGI/cJq4SDtMYycEcpa2nX9rRrqMWOeLcvs+Ji46vuzRGM56yp2mEkNMVE
 0aMQdCvjy7T47grPQelqYPc/7TRxXSBloKl4mZxwYi9yYEa9FDucztTI0mQ4baajG8sV
 1PgPYnLcjurDv/ynJVcZ+HVlh6RmR5U5DwUk89UhxO7QXkCYZj/GuFbQ6VuQSQaa+U2a
 75DCaj1yrCKEv75sWfhx+8PE000qCp5tVQvJxD7OGxe2DyKfYDpw3MnEUBGGU0671qyz
 3n9ERpN/0U0/LYM+JA02gPNZSQc4kvJ1Jfqeid2tqhgihZ4GuMMZrwoA60xpVw3tPWar
 e/8A==
X-Gm-Message-State: AO0yUKUwadHqWXrAj60OWABSFaWHlrWCsHz/KG4hmcm1UQyDnp5S2JAw
 /o/fPET6MsdFWvU3wUy32pk9ODXmJnjUWgF6mKA=
X-Google-Smtp-Source: AK7set/t4WjcIseNy7HgHhXJu/mVmHYGr8n+kDDLwcJ9O3Ozy2MkSBarTAF0TdNVuc1B4pEIM/ypGE6/jYq8x4NqXKw=
X-Received: by 2002:a17:903:2614:b0:19b:b17:6610 with SMTP id
 jd20-20020a170903261400b0019b0b176610mr7066566plb.4.1678266515368; Wed, 08
 Mar 2023 01:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20230308063628.15233-1-tiwai@suse.de>
In-Reply-To: <20230308063628.15233-1-tiwai@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 8 Mar 2023 10:08:24 +0100
Message-ID: <CAMeQTsYSgXm=Sku99USE+Up+uuJHUFdE8zPj7_B=BUi5SH=6KQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Fix incorrect page mapping clearance at
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

On Wed, Mar 8, 2023 at 7:36=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
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
> Fixes: 3efc61d95259 ("fbdev: Fix invalid page access after closing deferr=
ed I/O devices")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/video/fbdev/core/fb_defio.c | 16 +++++++++++++---
>  include/linux/fb.h                  |  1 +
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/co=
re/fb_defio.c
> index aa5f059d0222..9dcec9e020b6 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -305,17 +305,19 @@ void fb_deferred_io_open(struct fb_info *info,
>                          struct inode *inode,
>                          struct file *file)
>  {
> +       struct fb_deferred_io *fbdefio =3D info->fbdefio;
> +
>         file->f_mapping->a_ops =3D &fb_deferred_io_aops;
> +       fbdefio->opens++;
>  }
>  EXPORT_SYMBOL_GPL(fb_deferred_io_open);
>
> -void fb_deferred_io_release(struct fb_info *info)
> +static void fb_deferred_io_release_internal(struct fb_info *info)

Maybe a better name would be fb_deferred_io_lastclose() to be more in
line with DRM?

>  {
>         struct fb_deferred_io *fbdefio =3D info->fbdefio;
>         struct page *page;
>         int i;
>
> -       BUG_ON(!fbdefio);

Should the BUG_ON be put back into fb_deferred_io_release()?

>         cancel_delayed_work_sync(&info->deferred_work);
>
>         /* clear out the mapping that we setup */
> @@ -324,13 +326,21 @@ void fb_deferred_io_release(struct fb_info *info)
>                 page->mapping =3D NULL;
>         }
>  }
> +
> +void fb_deferred_io_release(struct fb_info *info)
> +{
> +       struct fb_deferred_io *fbdefio =3D info->fbdefio;
> +
> +       if (!--fbdefio->opens)
> +               fb_deferred_io_release_internal(info);

I think this can race so we need locking.

> +}
>  EXPORT_SYMBOL_GPL(fb_deferred_io_release);
>
>  void fb_deferred_io_cleanup(struct fb_info *info)
>  {
>         struct fb_deferred_io *fbdefio =3D info->fbdefio;
>
> -       fb_deferred_io_release(info);
> +       fb_deferred_io_release_internal(info);
>
>         kvfree(info->pagerefs);
>         mutex_destroy(&fbdefio->lock);
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index d8d20514ea05..29674a29d1c4 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -212,6 +212,7 @@ struct fb_deferred_io {
>         /* delay between mkwrite and deferred handler */
>         unsigned long delay;
>         bool sort_pagereflist; /* sort pagelist by offset */
> +       int opens; /* number of opened files */

I would prefer the name num_opens (or open_count as in DRM) instead of
opens since it can be interpreted as a verb.
Also, don't we need it to be atomic_t?

>         struct mutex lock; /* mutex that protects the pageref list */
>         struct list_head pagereflist; /* list of pagerefs for touched pag=
es */
>         /* callback */
> --
> 2.35.3
>
