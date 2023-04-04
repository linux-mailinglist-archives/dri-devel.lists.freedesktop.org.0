Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B626D65C4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 16:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B4C10E6D1;
	Tue,  4 Apr 2023 14:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC1810E6D1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 14:51:59 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id k17so38976350ybm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 07:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680619918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yqbEKKpaE4PIYS+ITrNwhkrKR/seTx+VrHN0WKCC4QQ=;
 b=jKzBlmigXxFQ7A6kTOf2LhOGQO1jDAuCNnXh35ORbZ5ZdZnujBFYsSKx7dbwKfLkcg
 GESGCKGWAhA/TkuaWep5zF7kOi5AC2Oj8fsS3ld1DvK7IgRm18ATNc4F0PDsLPND6L8y
 75KQRCtH8nNEytmdp6ktCfdLoo2RSwTWgbfbV6nk6luXc/gnHVO+KbZFnCJ2/OycO/fX
 XlU4kxIAI2vuIIgLC6v9yR3M3H3t2ps0EBB/KjiYcUjT7ua1SrE/jfrD0D2TQciY0nS/
 PdxUB28+OOC4NwK2Mx6KeJG/A8a1cpI/6VRArhjN26WZLJZ5YubrVgjrDSJ0iu1ubkCO
 eCpQ==
X-Gm-Message-State: AAQBX9e4JEbzJGwcQyf3alT3sTnDzKiSfjFsp4j05UNelN2oZ8t87e0T
 DgpNz5L1fXp9TRCOShwV/OX/pF4jBrJRmZ/i
X-Google-Smtp-Source: AKy350YipMCfqsVvLEKbE+wTYmVqufXQJgccdTQR+SUemV3zAKgR54YxdiQh5nDDrgS9UU0MnPauAg==
X-Received: by 2002:a25:4190:0:b0:b73:8718:3c49 with SMTP id
 o138-20020a254190000000b00b7387183c49mr3332852yba.13.1680619917928; 
 Tue, 04 Apr 2023 07:51:57 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 w5-20020a25ef45000000b00b7767ca7474sm3354387ybm.17.2023.04.04.07.51.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:51:57 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id z83so39020433ybb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 07:51:57 -0700 (PDT)
X-Received: by 2002:a25:1185:0:b0:a27:3ecc:ffe7 with SMTP id
 127-20020a251185000000b00a273eccffe7mr11286072ybr.3.1680619916862; Tue, 04
 Apr 2023 07:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
 <CAMuHMdUR=rx2QPvpzsSCwXTSTsPQOudNMzyL3dtZGQdQfrQGDA@mail.gmail.com>
 <ZCwtMJEAJiId/TJe@phenom.ffwll.local> <ZCwx+2hAmyDqOfWu@phenom.ffwll.local>
In-Reply-To: <ZCwx+2hAmyDqOfWu@phenom.ffwll.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Apr 2023 16:51:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVt+fsHhk73hPe=bN5e_vTjKEM014Q1AJ9tnankvsXcHg@mail.gmail.com>
Message-ID: <CAMuHMdVt+fsHhk73hPe=bN5e_vTjKEM014Q1AJ9tnankvsXcHg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Don't spam dmesg on bad userspace ioctl input
To: Daniel Vetter <daniel@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC linux-fbdev

On Tue, Apr 4, 2023 at 4:19=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
> On Tue, Apr 04, 2023 at 03:59:12PM +0200, Daniel Vetter wrote:
> > On Tue, Apr 04, 2023 at 03:53:09PM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Apr 4, 2023 at 2:36=E2=80=AFPM Daniel Vetter <daniel.vetter@f=
fwll.ch> wrote:
> > > > There's a few reasons the kernel should not spam dmesg on bad
> > > > userspace ioctl input:
> > > > - at warning level it results in CI false positives
> > > > - it allows userspace to drown dmesg output, potentially hiding rea=
l
> > > >   issues.
> > > >
> > > > None of the other generic EINVAL checks report in the
> > > > FBIOPUT_VSCREENINFO ioctl do this, so it's also inconsistent.
> > > >
> > > > I guess the intent of the patch which introduced this warning was t=
hat
> > > > the drivers ->fb_check_var routine should fail in that case. Realit=
y
> > > > is that there's too many fbdev drivers and not enough people
> > > > maintaining them by far, and so over the past few years we've simpl=
y
> > > > handled all these validation gaps by tighning the checks in the cor=
e,
> > > > because that's realistically really all that will ever happen.
> > > >
> > > > Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com
> > > > Link: https://syzkaller.appspot.com/bug?id=3Dc5faf983bfa4a607de530c=
d3bb008888bf06cefc
> > >
> > >     WARNING: fbcon: Driver 'vkmsdrmfb' missed to adjust virtual scree=
n
> > > size (0x0 vs. 64x768)
> > >
> > > This is a bug in the vkmsdrmfb driver and/or DRM helpers.
> > >
> > > The message was added to make sure the individual drivers are fixed.
> > > Perhaps it should be changed to BUG() instead, so dmesg output
> > > cannot be drown?
> >
> > So you're solution is to essentially force us to replicate this check o=
ver
> > all the drivers which cannot change the virtual size?
> >
> > Are you volunteering to field that audit and type all the patches?
>
> Note that at least efifb, vesafb and offb seem to get this wrong. I didn'=
t
> bother checking any of the non-fw drivers. Iow there is a _lot_ of work i=
n
> your nack.

Please don't spread FUD: efifb, vesafb and offb do not implement
fb_ops.fb_check_var(), so they are not affected.

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
