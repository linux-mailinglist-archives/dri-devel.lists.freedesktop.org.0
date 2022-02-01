Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850534A5D9C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 14:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C9710E136;
	Tue,  1 Feb 2022 13:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B8A10E2C5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 13:45:28 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso16234463ott.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 05:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2/6KNv9/sT6GkrKOK9WEHCnafWs+1/uASbFZJ68bfvw=;
 b=g5/k9Xnyqr4hCFjiKV9VdFUS0An5UbQmLXEd7/TNbrj3V41u9lCYKOgsPddlPSzOpE
 5eqbEqANjmcVoZeGc/sV7FiuBIFY1wnxkZxKtGkWuM2niUacHpSeS+rYvK+OTJxP7yfd
 /DTGhTzkjZ+3FIkC1a5uMQ1BeznnJ9geArMzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2/6KNv9/sT6GkrKOK9WEHCnafWs+1/uASbFZJ68bfvw=;
 b=JrA7EbM2t7+rBhFVI/DSKAbLNmEc0AflxKEVPFdIFmWRGuAUPlPeS2CligGxF0zWnF
 xxNto5DZTys7aOjEyUPSglKppLT+1A1X5w9aqtHrOOYufTSyi9M30PZ+ylDRRVPr72i3
 edqa3WN8w9l/rx1G8PO+0LMJdUH1MMW8SD/bqBdNZmszCFOQw8zEM9pP6KDjavic6+c9
 x3T3Ny09TB9NFCTC+SVrDGeDpg47GT50OddJCdqkyFgJj8+jk4Pr2g3x3qjBlo73Lcwi
 V4zKwRBPN40YRJ4BVVxM8ywhgQzBcKq192oHPvVNuOVqgQu3jHtV4jMyWxVfj3qbkjQR
 FSww==
X-Gm-Message-State: AOAM532QPaQU197NYT6+5FmzlviAOr9a1EYauxz2fGYBIAlc6cj1PqPB
 tEtgo9LbCkGkyU9Db7xE2fPfGxmRmYA5joQ6YWGT+Q==
X-Google-Smtp-Source: ABdhPJyiUj0c4GiekrFNbqyjKRt2R7hyjIozmCDshxUT1STqLVwWfIk54gQfCldA3xLyzL/9RMHmTB93woo3MVX5US8=
X-Received: by 2002:a05:6830:1153:: with SMTP id
 x19mr13573050otq.321.1643723128054; 
 Tue, 01 Feb 2022 05:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-4-daniel.vetter@ffwll.ch>
 <9c22b709-cbcf-6a29-a45e-5a57ba0b9c14@gmx.de>
 <CAKMK7uGvOVe8kkJCTkQBEFw+3i2iAMANsyG9vGqZkcROZ9he4A@mail.gmail.com>
 <63018892-68e8-01b6-1e8f-853892e15c97@gmx.de>
In-Reply-To: <63018892-68e8-01b6-1e8f-853892e15c97@gmx.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 1 Feb 2022 14:45:16 +0100
Message-ID: <CAKMK7uHPn77GA12fFjmvkRUDQXSBkbYK5X=rJp8sfO_xarys_g@mail.gmail.com>
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

On Tue, Feb 1, 2022 at 12:01 PM Helge Deller <deller@gmx.de> wrote:
> On 2/1/22 11:36, Daniel Vetter wrote:
> > On Tue, Feb 1, 2022 at 11:16 AM Helge Deller <deller@gmx.de> wrote:
> >>
> >> On 1/31/22 22:05, Daniel Vetter wrote:
> >>> This functionally undoes 39aead8373b3 ("fbcon: Disable accelerated
> >>> scrolling"), but behind the FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> >>> option.
> >>
> >> you have two trivial copy-n-paste errors in this patch which still prevent the
> >> console acceleration.
> >
> > Duh :-(
> >
> > But before we dig into details I think the big picture would be
> > better. I honestly don't like the #ifdef pile here that much.
>
> Me neither.
> The ifdefs give a better separation, but prevents that the compiler
> checks the various paths when building.
>
> > I wonder whether your approach, also with GETVX/YRES adjusted
> > somehow, wouldn't look cleaner?
> I think so.
> You wouldn't even need to touch GETVX/YRES because the compiler
> will optimize/reduce it from
>
> #define GETVYRES(s,i) ({                           \
>         (s == SCROLL_REDRAW || s == SCROLL_MOVE) ? \
>         (i)->var.yres : (i)->var.yres_virtual; })
>
> to just become:
>
> #define GETVYRES(s,i) ((i)->var.yres)

Yeah, but you need to roll out your helper to all the callsites. But
since you #ifdef out info->scrollmode we should catch them all I
guess.

> > Like I said in the cover letter I got mostly distracted with fbcon
> > locking last week, not really with this one here at all, so maybe
> > going with your 4 (or 2 if we squash them like I did here) patches is
> > neater?
>
> The benefit of my patch series was, that it could be easily backported first,
> and then cleaned up afterwards. Even a small additional backport patch to disable
> the fbcon acceleration for DRM in the old releases would be easy.
> But I'm not insisting on backporting the patches, if we find good way forward.
>
> So, either with the 4 (or 2) patches would be OK for me (or even your approach).

The idea behind the squash was that it's then impossible to backport
without the Kconfig, and so we'll only enable this code when people
intentionally want it. Maybe I'm too paranoid?

Anyway, you feel like finishing off your approach? Or should I send
out v2 of this with the issues fixed you spotted? Like I said either
is fine with me.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
