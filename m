Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD96DD64B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 11:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FAF10E0D1;
	Tue, 11 Apr 2023 09:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAFD10E0D1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 09:10:34 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5491fa028adso469828957b3.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 02:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681204233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KCkkco9adKfwM1mqsRyiXm9kdgSxvcC5TKthffG1ZPk=;
 b=EzbphGW6CuxgaTcIAHIn2lr0qiI6RReba2omsnD+UmzOwLFJJGntZyZvshF0T/Z8dZ
 LRNjOOD3ymz5BLMauA6FxmP+PkwhOvvVSBzQczcFw8LXUu04zvi8mIx9AkoUSgRcWC0V
 rP9iUHNfK/900yX4MUuVotAx59aOPmCf8pEc5GT7YSKqH0W5ynzeAm1pF35PDqzmCVp3
 QFMvZH9ht6TTY+BRs6mSIQgEu75NQLeiikw2P8T//Sy04dFDGY6POiEhsD7qc7ummAKc
 U8LhKc/V8YVipK8ZaXB02Ku/kLiKb/qGfke5Txj8Qc50LBJE+0qu1xtc+kTgovXpJcF0
 HAhA==
X-Gm-Message-State: AAQBX9dRVejQU7BcbPd070rwUwOioKrEYUDAaw0/ZcP+Je1Vzg+Z0bYx
 AvvydOdKtQY+2kgr2p+xur9nKgW2OSL9SA==
X-Google-Smtp-Source: AKy350bprwJZU6kadm7wGXz+Nc6haGNLrdtr24dHySGdxl5OKqQhEL41AaKiVc8rUBClywW2mVMY7A==
X-Received: by 2002:a81:52c2:0:b0:54f:4d99:9ae8 with SMTP id
 g185-20020a8152c2000000b0054f4d999ae8mr2732412ywb.28.1681204233060; 
 Tue, 11 Apr 2023 02:10:33 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 n124-20020a0dcb82000000b00545a0818493sm3363724ywd.35.2023.04.11.02.10.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 02:10:32 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-54c17fa9ae8so245448397b3.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 02:10:32 -0700 (PDT)
X-Received: by 2002:a81:c54d:0:b0:544:8bc1:a179 with SMTP id
 o13-20020a81c54d000000b005448bc1a179mr7428390ywj.4.1681204232496; Tue, 11 Apr
 2023 02:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
 <03a575e1-b4ed-7bd6-b68a-0583d76803ff@mailbox.org>
In-Reply-To: <03a575e1-b4ed-7bd6-b68a-0583d76803ff@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 11:10:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXj8PG=aidRbSaP-792wGZuRyZE6VF1BARRz7LeUrWfeA@mail.gmail.com>
Message-ID: <CAMuHMdXj8PG=aidRbSaP-792wGZuRyZE6VF1BARRz7LeUrWfeA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Don't spam dmesg on bad userspace ioctl input
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michel,

On Wed, Apr 5, 2023 at 10:50=E2=80=AFAM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
> On 4/4/23 14:36, Daniel Vetter wrote:
> > There's a few reasons the kernel should not spam dmesg on bad
> > userspace ioctl input:
> > - at warning level it results in CI false positives
> > - it allows userspace to drown dmesg output, potentially hiding real
> >   issues.
> >
> > None of the other generic EINVAL checks report in the
> > FBIOPUT_VSCREENINFO ioctl do this, so it's also inconsistent.
> >
> > I guess the intent of the patch which introduced this warning was that
> > the drivers ->fb_check_var routine should fail in that case. Reality
> > is that there's too many fbdev drivers and not enough people
> > maintaining them by far, and so over the past few years we've simply
> > handled all these validation gaps by tighning the checks in the core,
> > because that's realistically really all that will ever happen.
> >
> > Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=3Dc5faf983bfa4a607de530cd3bb=
008888bf06cefc
> > Fixes: 6c11df58fd1a ("fbmem: Check virtual screen sizes in fb_set_var()=
")
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: stable@vger.kernel.org # v5.4+
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/video/fbdev/core/fbmem.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/cor=
e/fbmem.c
> > index 875541ff185b..9757f4bcdf57 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1021,10 +1021,6 @@ fb_set_var(struct fb_info *info, struct fb_var_s=
creeninfo *var)
> >       /* verify that virtual resolution >=3D physical resolution */
> >       if (var->xres_virtual < var->xres ||
> >           var->yres_virtual < var->yres) {
> > -             pr_warn("WARNING: fbcon: Driver '%s' missed to adjust vir=
tual screen size (%ux%u vs. %ux%u)\n",
> > -                     info->fix.id,
> > -                     var->xres_virtual, var->yres_virtual,
> > -                     var->xres, var->yres);
> >               return -EINVAL;
> >       }
> >
>
> Make it pr_warn_once? 99.9...% of the benefit, without spam.

Except that it should be pr_warn_once_per_fb_info, which requires
a flag in fb_info.

If fb_info.fbops wasn't const, we could also nuke
info->fbops->check_var() ;-)

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
