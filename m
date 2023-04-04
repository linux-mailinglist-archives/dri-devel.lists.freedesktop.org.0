Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F4E6D67FD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 17:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8DA10E035;
	Tue,  4 Apr 2023 15:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE1110E035
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 15:55:17 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id y184so24542862oiy.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680623716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSWsk9Y++g6/hpC5vSHS+QJ/lNQNHpTZMHP/2shPmbs=;
 b=VlNEmhrPwxVCbnsPwcFSrwRYrK/x4h05qNwnViQcjea1CQFWrmdbbkzjQeHpHzHKJQ
 1FwZRgRTeJZ0EFQ8eFJaySZ3lK80zRW0+weOLucFgS5XJXMuna6FF7XKjWJFQivwQRpM
 A7e2nkCSnUne7lXs1WN4aqebWq7hyuScfx35Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSWsk9Y++g6/hpC5vSHS+QJ/lNQNHpTZMHP/2shPmbs=;
 b=pGveNOzr1V4IECWDxcD9234vVZyLYC96F/XAAs3p8B4YK1hlE34t/0Dy62iUyvYPNx
 3oRXpNkc5TTcfMQpLyMlGnysgaSOuFilpWB6rFY0spBIehHCMcnhN28C+jGoB2k50AOP
 4Lm3yMeWJ42gbQA05km7Uts6c2l3N+gwsF2VoqCI/Iwnqw9irjMobBYdFM0sZSQluyMU
 Gyk3prfwlhVaC3vQ1EMccALDXC8n62T1eh6Ge9mcqNLFKG5wwRnN3WqI0lHeYcZYG55J
 cRsnrFR7HLW80meGDayZa9VOiQZ6zHHcX0eeCbgrYARcTL5IoJT9Qo1aTcKQ8VnDHpU3
 +W4g==
X-Gm-Message-State: AAQBX9ftXduq7PABPlX4oVWE3I5yyRJn8vJ25n9ZIi09/egU83gJFlNc
 iiN8IFmbEp7/YADM0Q46RP8ipKnx78bcSktDmJ+K9Adk1ugpB9z6
X-Google-Smtp-Source: AKy350YkVp980Bga0qAHmZX81SmximEY846/RtSXXbmAGEafONPYNvmd18elnjsGWqf8OMiuMAkKYyZmwqwkLXoJHzc=
X-Received: by 2002:a05:6808:280a:b0:389:2b9b:fe5f with SMTP id
 et10-20020a056808280a00b003892b9bfe5fmr1166765oib.8.1680623715961; Tue, 04
 Apr 2023 08:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
 <CAMuHMdUR=rx2QPvpzsSCwXTSTsPQOudNMzyL3dtZGQdQfrQGDA@mail.gmail.com>
 <ZCwtMJEAJiId/TJe@phenom.ffwll.local> <ZCwx+2hAmyDqOfWu@phenom.ffwll.local>
 <CAMuHMdVt+fsHhk73hPe=bN5e_vTjKEM014Q1AJ9tnankvsXcHg@mail.gmail.com>
In-Reply-To: <CAMuHMdVt+fsHhk73hPe=bN5e_vTjKEM014Q1AJ9tnankvsXcHg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 Apr 2023 17:55:04 +0200
Message-ID: <CAKMK7uFEmt1=4jDi1xDbnTVH6M2iEZSjcY-UN93do0NiH=GogA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Don't spam dmesg on bad userspace ioctl input
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Helge Deller <deller@gmx.de>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Apr 2023 at 16:51, Geert Uytterhoeven <geert@linux-m68k.org> wrot=
e:
>
> CC linux-fbdev
>
> On Tue, Apr 4, 2023 at 4:19=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
> > On Tue, Apr 04, 2023 at 03:59:12PM +0200, Daniel Vetter wrote:
> > > On Tue, Apr 04, 2023 at 03:53:09PM +0200, Geert Uytterhoeven wrote:
> > > > On Tue, Apr 4, 2023 at 2:36=E2=80=AFPM Daniel Vetter <daniel.vetter=
@ffwll.ch> wrote:
> > > > > There's a few reasons the kernel should not spam dmesg on bad
> > > > > userspace ioctl input:
> > > > > - at warning level it results in CI false positives
> > > > > - it allows userspace to drown dmesg output, potentially hiding r=
eal
> > > > >   issues.
> > > > >
> > > > > None of the other generic EINVAL checks report in the
> > > > > FBIOPUT_VSCREENINFO ioctl do this, so it's also inconsistent.
> > > > >
> > > > > I guess the intent of the patch which introduced this warning was=
 that
> > > > > the drivers ->fb_check_var routine should fail in that case. Real=
ity
> > > > > is that there's too many fbdev drivers and not enough people
> > > > > maintaining them by far, and so over the past few years we've sim=
ply
> > > > > handled all these validation gaps by tighning the checks in the c=
ore,
> > > > > because that's realistically really all that will ever happen.
> > > > >
> > > > > Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.co=
m
> > > > > Link: https://syzkaller.appspot.com/bug?id=3Dc5faf983bfa4a607de53=
0cd3bb008888bf06cefc
> > > >
> > > >     WARNING: fbcon: Driver 'vkmsdrmfb' missed to adjust virtual scr=
een
> > > > size (0x0 vs. 64x768)
> > > >
> > > > This is a bug in the vkmsdrmfb driver and/or DRM helpers.
> > > >
> > > > The message was added to make sure the individual drivers are fixed=
.
> > > > Perhaps it should be changed to BUG() instead, so dmesg output
> > > > cannot be drown?
> > >
> > > So you're solution is to essentially force us to replicate this check=
 over
> > > all the drivers which cannot change the virtual size?
> > >
> > > Are you volunteering to field that audit and type all the patches?
> >
> > Note that at least efifb, vesafb and offb seem to get this wrong. I did=
n't
> > bother checking any of the non-fw drivers. Iow there is a _lot_ of work=
 in
> > your nack.
>
> Please don't spread FUD: efifb, vesafb and offb do not implement
> fb_ops.fb_check_var(), so they are not affected.

Hm I missed that early out. I'll do a patch to fix the drm fb helpers,
as mentioned in the other thread I don't think we can actually just
delete that because it would short-circuit out the fb_set_par call
too.
-Daniel

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
