Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D890D56CEA7
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 13:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A0312B3D2;
	Sun, 10 Jul 2022 11:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FFA12B3CF
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 11:04:38 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id a21so2830363qtw.10
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 04:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zGi649YbanVlBXxPrZSF50TPFSK0KIadSweXz7i4gE8=;
 b=g7YmW/ugxUM1TK7es29a3bYYhpmb9ALqjEremkItVQnytE6zFzAiqTqV+9Qn7j5cXX
 F4fFK/KD2tYp/mgPePIGFl6C8hqB3eQ55Zq9xooDyuVIRCT3nt3qb1p/BqR5cOB8NgHY
 MO0I+UV+9LdANhc8yOqV6byq+J1/6aE9Hk31I0dfIeZ4nyCznSv+8AicbzP1zvXnrVOh
 M6YGeNOQJISM8qg9AVsvARho3puhL3pdzWN62sy492eMAqBF2J0vqxFYuqXbFuiP7WwL
 MA7FF60UxAmrnDL+ZLEFyurALPyqt5UK/J00APBdW15JoTWXU/DN8n71DQtAYduAZmS8
 uzQg==
X-Gm-Message-State: AJIora/n8Cpr/YGEk+aTOmXiVTTi+r/ElvaxpMLtCWM55o7z3Q+o0NOQ
 VshIbBKB8+JNWWqMxqr4og/woxs2k9KXqg==
X-Google-Smtp-Source: AGRyM1twbw1gFOPiVzKjAn6yNTHY6rfGeH1rwmzyXQPP43bIP+rfsIEqf7LM6f1ZMG/WPO9A2SeF8g==
X-Received: by 2002:a05:6214:2465:b0:472:ffd8:93e9 with SMTP id
 im5-20020a056214246500b00472ffd893e9mr9658694qvb.47.1657451076637; 
 Sun, 10 Jul 2022 04:04:36 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 y17-20020a05620a25d100b006b46a78bc0fsm3414566qko.118.2022.07.10.04.04.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jul 2022 04:04:36 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id n74so4594473yba.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 04:04:36 -0700 (PDT)
X-Received: by 2002:a05:6902:1246:b0:66e:ea31:8d05 with SMTP id
 t6-20020a056902124600b0066eea318d05mr7037454ybu.89.1657451075950; Sun, 10 Jul
 2022 04:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657302034.git.geert@linux-m68k.org>
 <a35154278816426fee7045795aa4894ff615efdf.1657302034.git.geert@linux-m68k.org>
 <YsqqiMAikaBP/3vt@ravnborg.org>
In-Reply-To: <YsqqiMAikaBP/3vt@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 10 Jul 2022 13:04:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJf6HR-jf+UijFgfpXpG2UFj+Z-9ef2y5u6CTrZBsS+g@mail.gmail.com>
Message-ID: <CAMuHMdWJf6HR-jf+UijFgfpXpG2UFj+Z-9ef2y5u6CTrZBsS+g@mail.gmail.com>
Subject: Re: [PATCH libdrm v2 01/10] util: Improve SMPTE color LUT accuracy
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Jul 10, 2022 at 12:31 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Fri, Jul 08, 2022 at 08:21:31PM +0200, Geert Uytterhoeven wrote:
> > Fill in the LSB when converting color components from 8-bit to 16-bit.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > v2:
> >   - New.
> > ---
> >  tests/util/pattern.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> > index 178aee8341a38920..3753ebc1eeae6c9a 100644
> > --- a/tests/util/pattern.c
> > +++ b/tests/util/pattern.c
> > @@ -646,9 +646,9 @@ void util_smpte_c8_gamma(unsigned size, struct drm_color_lut *lut)
> >       memset(lut, 0, size * sizeof(struct drm_color_lut));
> >
> >  #define FILL_COLOR(idx, r, g, b) \
> > -     lut[idx].red = (r) << 8; \
> > -     lut[idx].green = (g) << 8; \
> > -     lut[idx].blue = (b) << 8
> > +     lut[idx].red = (r) * 0x101; \
>
>         (lut[idx].red = (r) << 8) | 1;
>
> had IMO been easier to read.

I guess you mean "| (r)" instead of "| 1"?

>
> Patch is:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> for both ways to do it.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
