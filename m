Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A30834A6162
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 17:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC3B10E16D;
	Tue,  1 Feb 2022 16:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710B810E5FF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 16:30:48 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id u13so18133018oie.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 08:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SmoAfGUcv3WuX5MTMsQtLDuakLAcJhTCCEdC4MKfCJU=;
 b=hE0dHoYE2FXofMs4e1RcU8c6vfA8rv8R3XWFaQ0os1A+wPd9bM/1RxDIdOUGSJs44C
 IbvTPs4DM04VagcMezxMBUFH8mDLy9QtjjQblNkO/XUP+kEMmcvVuSs6Ghbzv6BTRJkJ
 xLtV9OHhTOddvn0QXAX7viusKmGqEOG1wVJo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SmoAfGUcv3WuX5MTMsQtLDuakLAcJhTCCEdC4MKfCJU=;
 b=srC0v1QiVVlpR0xaM/R6Dn6LphDcWg44eyFp15DajPDfZSYJcK5SAqXv43dOlzJAIR
 +l1bx+yw8QqlDXZg9q6ZZ/6wKlMgtbBcL7Oy1GNF3N6wPwXkJxP77y5sT0wuxsmf1ba8
 TSqld7PZfmUWm4aI66yEAV0ad13b9lWIQQTzIDmo5kA2L7DZF8qEhRY4tVPd8gqkSGil
 AdK5kGM/pMnviR3aKgzrG2oCXZhSmyOJiUBNz0Rc2WlmMRhjuaArK8+x30g/2IlW3YXg
 gnKmnTm2bfMugbz5KNssORB4u9vTsHEuUZXauobf3hBeCx0cjI5DwdEid+ve0bVDN5Eb
 xMjA==
X-Gm-Message-State: AOAM531e1W27u7/NEOM8Cfcofh1Woc8rmo8+Ft+mFGuthnEGxr2Zihgs
 tr7I4dzf1emynUkzz4ICmM6gT7firLjAfhqH4WaUQw==
X-Google-Smtp-Source: ABdhPJz3JayTHVyC51m4kdAPGDzLvlPbnDnx2e6c/T0JZ7beOtPGbdiv2N+Jc7yrinJz0jrqaKDfzGNAZgBoR3v4+Ao=
X-Received: by 2002:a54:4803:: with SMTP id j3mr1774572oij.279.1643733047225; 
 Tue, 01 Feb 2022 08:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-4-daniel.vetter@ffwll.ch>
 <9c22b709-cbcf-6a29-a45e-5a57ba0b9c14@gmx.de>
 <CAKMK7uGvOVe8kkJCTkQBEFw+3i2iAMANsyG9vGqZkcROZ9he4A@mail.gmail.com>
 <63018892-68e8-01b6-1e8f-853892e15c97@gmx.de>
 <CAKMK7uHPn77GA12fFjmvkRUDQXSBkbYK5X=rJp8sfO_xarys_g@mail.gmail.com>
 <313c4c72-364b-1d61-09c1-e4a83cbefe6a@gmx.de>
In-Reply-To: <313c4c72-364b-1d61-09c1-e4a83cbefe6a@gmx.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 1 Feb 2022 17:30:36 +0100
Message-ID: <CAKMK7uE5A6+s6=yaCUsKN0XrMAESLKNwz2_bJR9YL3S7YeDzMw@mail.gmail.com>
Subject: Re: [PATCH 03/21] fbcon: Restore fbcon scrolling acceleration
To: Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 DRI Development <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sven Schnelle <svens@stackframe.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 3:52 PM Helge Deller <deller@gmx.de> wrote:
>
> On 2/1/22 14:45, Daniel Vetter wrote:
> > On Tue, Feb 1, 2022 at 12:01 PM Helge Deller <deller@gmx.de> wrote:
> >> On 2/1/22 11:36, Daniel Vetter wrote:
> >>> On Tue, Feb 1, 2022 at 11:16 AM Helge Deller <deller@gmx.de> wrote:
> >>>>
> >>>> On 1/31/22 22:05, Daniel Vetter wrote:
> >>>>> This functionally undoes 39aead8373b3 ("fbcon: Disable accelerated
> >>>>> scrolling"), but behind the FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> >>>>> option.
> >>>>
> >>>> you have two trivial copy-n-paste errors in this patch which still prevent the
> >>>> console acceleration.
> >>>
> >>> Duh :-(
> >>>
> >>> But before we dig into details I think the big picture would be
> >>> better. I honestly don't like the #ifdef pile here that much.
> >>
> >> Me neither.
> >> The ifdefs give a better separation, but prevents that the compiler
> >> checks the various paths when building.
> >>
> >>> I wonder whether your approach, also with GETVX/YRES adjusted
> >>> somehow, wouldn't look cleaner?
> >> I think so.
> >> You wouldn't even need to touch GETVX/YRES because the compiler
> >> will optimize/reduce it from
> >>
> >> #define GETVYRES(s,i) ({                           \
> >>         (s == SCROLL_REDRAW || s == SCROLL_MOVE) ? \
> >>         (i)->var.yres : (i)->var.yres_virtual; })
> >>
> >> to just become:
> >>
> >> #define GETVYRES(s,i) ((i)->var.yres)
> >
> > Yeah, but you need to roll out your helper to all the callsites. But
> > since you #ifdef out info->scrollmode we should catch them all I
> > guess.
>
> Right. That was the only reason why I ifdef'ed it out.
> Technically we don't need that ifdef.
>
> >>> Like I said in the cover letter I got mostly distracted with fbcon
> >>> locking last week, not really with this one here at all, so maybe
> >>> going with your 4 (or 2 if we squash them like I did here) patches is
> >>> neater?
> >>
> >> The benefit of my patch series was, that it could be easily backported first,
> >> and then cleaned up afterwards. Even a small additional backport patch to disable
> >> the fbcon acceleration for DRM in the old releases would be easy.
> >> But I'm not insisting on backporting the patches, if we find good way forward.
> >>
> >> So, either with the 4 (or 2) patches would be OK for me (or even your approach).
> >
> > The idea behind the squash was that it's then impossible to backport
> > without the Kconfig,
>
> Yes, my proposal was to simply revert the 2 patches and immediatly send
> the Kconfig patch to disable it again.
>
> > and so we'll only enable this code when people
> > intentionally want it. Maybe I'm too paranoid?
>
> I think you are too paranoid :-)
> If all patches incl. the Kconfig patch are backported then people shouldn't
> do it wrong.
>
> > Anyway, you feel like finishing off your approach? Or should I send
> > out v2 of this with the issues fixed you spotted? Like I said either
> > is fine with me.
>
> Ok, then let me try to finish my approach until tomorrow, and then you
> check if you can and want to add your locking and other patches on top of it.
> In the end I leave the decision which approach to take to you.
> Ok?

Sounds good, and yeah rough idea is that the maintainers + revert +
Kconfig should go in for rc3 or rc4 if we hit another bump, and the
locking stuff then in for -next (since it needs a backmerge and is
defo tricky stuff).

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
