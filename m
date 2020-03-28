Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3515197536
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFB289F75;
	Mon, 30 Mar 2020 07:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFBC6E139
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 16:57:42 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id a6so11761613ilr.4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WLDYwWYbolvs0EFALE9dMKsppiAeImVTfUdChbO3aow=;
 b=pPgqIvdZ9uNU7ousZa8O2z2V+0gFzTJGZ7ABV8Gxi8q3uDmusxPuaKdRJSwm57b/cL
 ruYb656wWLtlY53QjVAUZSag3Ic2h5PDKDET4B6KrQ4YvXehJDb8JVrBSMKU2oro5vuz
 Z+KZjfk5YlZ2DFwobx/GMAQIFRWYxJwHEBSDRV9fQs9ADG4BJfSyMPunk+oJg3vfD7Ua
 vH3VBF077y1DVtJC2Gob+dulzgj6ELBrZH1wI/SLzDii9zSBTasHK8CazQAqJ4nleT5A
 vXX7suRnXWPWuxdeSUACQ2lwZ4ZLKDGPZrB0AuFsd09SRFIqO1/XMt3c/OH/3YXle8+v
 1zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WLDYwWYbolvs0EFALE9dMKsppiAeImVTfUdChbO3aow=;
 b=g/r8AjSoS2LzxYKenVxVZehid+xZH0EYPBW/VHUGcQK2fHgdA3V0iCZZXueKJCMdZ2
 FdiQg9gNVUrpuQ/RSgIfwEct0xD4RQX6vmhfB80SOLrFcHe/OUgk9pF1sfGY2jwEILHP
 /4rnYnBbOFBPBZlhgRXFre4gwM4K+p1LWgS/idacbEn7tysWcu+DU9rrNOdITm8+NMkZ
 Te8VTqzuU4rinP1jJ8PK0rrZ8Wo6z0BXsmSsMmtXyjZwnEfSr+kMOizHEY2zfsKQMF1X
 +N1lDHzAfu7nMc7RkbDMZ7RPq8o7yEX8KyC2zouNAmrjXHZHy5i2/fnCCqaYjlWFU2na
 VZcw==
X-Gm-Message-State: ANhLgQ2+F/N5vQtOR9/j3vA/HoocRdpvuJBp4n6PBKEz2gCAXTk8wyGm
 fao8m6TswE9hVTgBCLPotx7sC9Ty72Qx0iEd7Ik=
X-Google-Smtp-Source: ADFU+vuddmVyw+A7IZajazkq9naRHRcxcUddjdccvYWE0Sz6p4/HG+6kcqL17pjFizx9jh7A3zQERI6a2RANMmH2NOY=
X-Received: by 2002:a92:77c2:: with SMTP id s185mr4244689ilc.297.1585414661819; 
 Sat, 28 Mar 2020 09:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200328151511.22932-1-hqjagain@gmail.com>
 <CAKMK7uF2mipUSr-XRESrRJ8JdOZCekNTCVsDPW5hNp-mWwPj6Q@mail.gmail.com>
In-Reply-To: <CAKMK7uF2mipUSr-XRESrRJ8JdOZCekNTCVsDPW5hNp-mWwPj6Q@mail.gmail.com>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Sun, 29 Mar 2020 00:57:29 +0800
Message-ID: <CAJRQjocxe+KfSBX3uFv+_ajcY6agF9oXWvkon_kPM+3dk6Pz2Q@mail.gmail.com>
Subject: Re: [PATCH] fbcon: fix null-ptr-deref in fbcon_switch
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ghalat@redhat.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 29, 2020 at 12:31 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Sat, Mar 28, 2020 at 4:15 PM Qiujun Huang <hqjagain@gmail.com> wrote:
> > Add check for vc_cons[logo_shown].d, as it can be released by
> > vt_ioctl(VT_DISALLOCATE).
>
> Can you pls link to the syzbot report and distill the essence of the
> crash/issue here in the commit message? As-is a bit unclear what's
> going on. Patch itself looks correct.

https://lkml.org/lkml/2020/3/27/403
Thanks.

>
> Thanks, Daniel
>
> > Reported-by: syzbot+732528bae351682f1f27@syzkaller.appspotmail.com
> > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> > ---
> >  drivers/video/fbdev/core/fbcon.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index bb6ae995c2e5..7ee0f7b55829 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -2254,7 +2254,7 @@ static int fbcon_switch(struct vc_data *vc)
> >                 fbcon_update_softback(vc);
> >         }
> >
> > -       if (logo_shown >= 0) {
> > +       if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
> >                 struct vc_data *conp2 = vc_cons[logo_shown].d;
> >
> >                 if (conp2->vc_top == logo_lines
> > @@ -2852,7 +2852,7 @@ static void fbcon_scrolldelta(struct vc_data *vc, int lines)
> >                         return;
> >                 if (vc->vc_mode != KD_TEXT || !lines)
> >                         return;
> > -               if (logo_shown >= 0) {
> > +               if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
> >                         struct vc_data *conp2 = vc_cons[logo_shown].d;
> >
> >                         if (conp2->vc_top == logo_lines
> > --
> > 2.17.1
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
