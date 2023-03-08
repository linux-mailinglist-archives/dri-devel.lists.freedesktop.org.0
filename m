Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30256B0300
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A846910E5EF;
	Wed,  8 Mar 2023 09:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AA310E5EF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 09:35:03 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso1321897pjs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678268103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CIp47ayWe59+VWKhH9jfCtYK/GFGqKCWyjnngDque6c=;
 b=Cc+E1Uks3GPCBi+uVQ8Q1bxA242495kRlYnjygJIcW0ttuukBE0hKfF/G4HtH0HGcw
 ZSLSv3maU9K8fpsnB/lasDILBMu+G66n2g28h8UzQLfYaVtRE/v9BpJumos/l+xT0QSg
 EXyKUlKn8IjZvK1CTaNIOI/O52HtQ0PEAlbcOBfjUrOyPuuW6qkh6//4YZSLROGOB62o
 FcrwecFPUocDjdxj4BEWrjdFLGV3eWfpzdygoyrp7LQFhgOMNw9Fbb6zObt/VK7hnvCo
 7bEyGflDAFixQfiteufSq2mu0o8ayAxucG6cpIGSMTxSCox6m8vnOMTIl3HVvsYAddbz
 OhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678268103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CIp47ayWe59+VWKhH9jfCtYK/GFGqKCWyjnngDque6c=;
 b=q3os4cD16ARAuWz30lGsXplRmhKc2wx8FWRQHHdbY3UsTa6DLSlBYyo7hWKn/AZ4V2
 tA4SURFwrFl15PGU88ja4JFQiVYhTEXJviKFoizU8P/7Sg2PzRBZmmm9XEx4LNCM6CdB
 X5DNCRJQra5dabHOil0hvgJwfh7hfLRe55grzRlTTOGicwBNaqbUg/s5Pq7VWBppk8/p
 cEEi6NiRh/mtKI/hMOL7CaNYIQLuMDTpsXHQF5sevX5R6muhcYEiu7ZUWkB5QKYQEBpV
 RhTMKJk9vKYXX9XYZ7PekBPBStAGvQCG2+ywfLjbpxTRv5SZkAROR+IOXSYB/3ps381g
 Iqsw==
X-Gm-Message-State: AO0yUKVpfmn8RZ2M4slQoVfmK81LNkkXwj3BZppsGutu82ZW1QFyvw4V
 TSPuoSvd5wu6uegtW8f/Dou5ioLj2fq7dyeGI8s=
X-Google-Smtp-Source: AK7set+g9/JXVrtZuGiSSDbXHvja+DfYo0/TVYxq59r9hAEn3FcwO4JpGiYOFO8cgm5MHGSE0G+q3mCbuRrCnu4w3+0=
X-Received: by 2002:a17:902:ab45:b0:19b:e4c:2039 with SMTP id
 ij5-20020a170902ab4500b0019b0e4c2039mr7130742plb.4.1678268103137; Wed, 08 Mar
 2023 01:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20230308063628.15233-1-tiwai@suse.de>
 <CAMeQTsYSgXm=Sku99USE+Up+uuJHUFdE8zPj7_B=BUi5SH=6KQ@mail.gmail.com>
 <87v8jbhag1.wl-tiwai@suse.de>
In-Reply-To: <87v8jbhag1.wl-tiwai@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 8 Mar 2023 10:34:51 +0100
Message-ID: <CAMeQTsYuD=umBxom7yha89ZS2GtuapEua28Uo+K1Wb1ApKKT6Q@mail.gmail.com>
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

On Wed, Mar 8, 2023 at 10:14=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 08 Mar 2023 10:08:24 +0100,
> Patrik Jakobsson wrote:
> >
> > On Wed, Mar 8, 2023 at 7:36=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wro=
te:
> > >
> > > The recent fix for the deferred I/O by the commit
> > >   3efc61d95259 ("fbdev: Fix invalid page access after closing deferre=
d I/O devices")
> > > caused a regression when the same fb device is opened/closed while
> > > it's being used.  It resulted in a frozen screen even if something
> > > is redrawn there after the close.  The breakage is because the patch
> > > was made under a wrong assumption of a single open; in the current
> > > code, fb_deferred_io_release() cleans up the page mapping of the
> > > pageref list and it calls cancel_delayed_work_sync() unconditionally,
> > > where both are no correct behavior for multiple opens.
> > >
> > > This patch adds a refcount for the opens of the device, and applies
> > > the cleanup only when all files get closed.
> > >
> > > Fixes: 3efc61d95259 ("fbdev: Fix invalid page access after closing de=
ferred I/O devices")
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > ---
> > >  drivers/video/fbdev/core/fb_defio.c | 16 +++++++++++++---
> > >  include/linux/fb.h                  |  1 +
> > >  2 files changed, 14 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbde=
v/core/fb_defio.c
> > > index aa5f059d0222..9dcec9e020b6 100644
> > > --- a/drivers/video/fbdev/core/fb_defio.c
> > > +++ b/drivers/video/fbdev/core/fb_defio.c
> > > @@ -305,17 +305,19 @@ void fb_deferred_io_open(struct fb_info *info,
> > >                          struct inode *inode,
> > >                          struct file *file)
> > >  {
> > > +       struct fb_deferred_io *fbdefio =3D info->fbdefio;
> > > +
> > >         file->f_mapping->a_ops =3D &fb_deferred_io_aops;
> > > +       fbdefio->opens++;
> > >  }
> > >  EXPORT_SYMBOL_GPL(fb_deferred_io_open);
> > >
> > > -void fb_deferred_io_release(struct fb_info *info)
> > > +static void fb_deferred_io_release_internal(struct fb_info *info)
> >
> > Maybe a better name would be fb_deferred_io_lastclose() to be more in
> > line with DRM?
>
> Sounds good.
>
> > >  {
> > >         struct fb_deferred_io *fbdefio =3D info->fbdefio;
> > >         struct page *page;
> > >         int i;
> > >
> > > -       BUG_ON(!fbdefio);
> >
> > Should the BUG_ON be put back into fb_deferred_io_release()?
>
> It can be, but honestly speaking, such a BUG_ON() is utterly useless.
> It should be WARN_ON() and return, if the sanity check is inevitably
> needed.

I agree. It's rather pointless since it's already checked in fb_release().

>
> > >         cancel_delayed_work_sync(&info->deferred_work);
> > >
> > >         /* clear out the mapping that we setup */
> > > @@ -324,13 +326,21 @@ void fb_deferred_io_release(struct fb_info *inf=
o)
> > >                 page->mapping =3D NULL;
> > >         }
> > >  }
> > > +
> > > +void fb_deferred_io_release(struct fb_info *info)
> > > +{
> > > +       struct fb_deferred_io *fbdefio =3D info->fbdefio;
> > > +
> > > +       if (!--fbdefio->opens)
> > > +               fb_deferred_io_release_internal(info);
> >
> > I think this can race so we need locking.
>
> This one is fine, as it's always called inside the fb lock in the
> caller side.  Maybe worth to comment in the code.

Ah, yes, fb_release() locks around everything. Then we are fine. A
comment would be nice.

>
> > > +}
> > >  EXPORT_SYMBOL_GPL(fb_deferred_io_release);
> > >
> > >  void fb_deferred_io_cleanup(struct fb_info *info)
> > >  {
> > >         struct fb_deferred_io *fbdefio =3D info->fbdefio;
> > >
> > > -       fb_deferred_io_release(info);
> > > +       fb_deferred_io_release_internal(info);
> > >
> > >         kvfree(info->pagerefs);
> > >         mutex_destroy(&fbdefio->lock);
> > > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > > index d8d20514ea05..29674a29d1c4 100644
> > > --- a/include/linux/fb.h
> > > +++ b/include/linux/fb.h
> > > @@ -212,6 +212,7 @@ struct fb_deferred_io {
> > >         /* delay between mkwrite and deferred handler */
> > >         unsigned long delay;
> > >         bool sort_pagereflist; /* sort pagelist by offset */
> > > +       int opens; /* number of opened files */
> >
> > I would prefer the name num_opens (or open_count as in DRM) instead of
> > opens since it can be interpreted as a verb.
>
> I don't mind either way.  I'd choose the latter.
>
> > Also, don't we need it to be atomic_t?
>
> It's always in the fb lock, so that should be fine with the standard
> int.

Yes

>
>
> thanks,
>
> Takashi
