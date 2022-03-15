Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00594D9B8E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DFA10E2AF;
	Tue, 15 Mar 2022 12:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4549C10E2AF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:49:03 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id t7so5097024qta.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CKZh5yP21BRJU6B3iVZohrjJUcGpXAcyv437fSYRC0Y=;
 b=svuUVvsB3ptBxM3AP8ui8RPH8rGu/driAhjlDfGFxVU7t+vMKC+yG1goxUCeBUajJ+
 3hqd44pR7dDmqCSIlPH1cde/QOqhTQsLCTQS0rIeT7+nZeILctgsgyGqfOu31H02x0Ev
 LXT5ygb0b02IbZ0RPsN3rZkHNNl4/F4rTQQ73RFL59Dw+Cs1oxr0UsRcjXsPNSgX/Smn
 JPgPZVrKjVyt5CuWWegUBE1G61g7tV9VHF6P6cTyRqpPfQ58+o/JJawGLFIlzSucXhxc
 jg7KUB1bIRQuM1m23Y7KwRYYkTf8kbnu47ZYxMkHFgc1zqWdnF6qMFvwmLonb9XMrIth
 2yNA==
X-Gm-Message-State: AOAM533HHhh58No8MpURNYYCoc0zufXwre9YAp6OUG3KvI03AjYAqAV0
 n6jLulTWTN+ePYEqDc2E9jOg5iEEDqnTOw==
X-Google-Smtp-Source: ABdhPJxMrtXd4RMmGLpWA3UtHcbPKqQr5uWFjLPA22vwcL/KuyAY565KhFsDdWMvX2kMbYkrerQozg==
X-Received: by 2002:ac8:7f44:0:b0:2e0:7756:8b68 with SMTP id
 g4-20020ac87f44000000b002e077568b68mr22183136qtk.583.1647348541601; 
 Tue, 15 Mar 2022 05:49:01 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05622a149400b002e1e7df16fasm83864qtx.1.2022.03.15.05.49.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:49:01 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2e57826a10bso41835877b3.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:49:00 -0700 (PDT)
X-Received: by 2002:a81:49d0:0:b0:2db:dc6d:445d with SMTP id
 w199-20020a8149d0000000b002dbdc6d445dmr24764496ywa.512.1647348539863; Tue, 15
 Mar 2022 05:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-3-geert@linux-m68k.org>
 <27e1c911-798a-c14b-e5a0-622a7c5d8755@redhat.com>
In-Reply-To: <27e1c911-798a-c14b-e5a0-622a7c5d8755@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Mar 2022 13:48:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQ=A1uRYdO+da9wFpzLbGEDprVjnuFcD8B=MPkOePEKw@mail.gmail.com>
Message-ID: <CAMuHMdUQ=A1uRYdO+da9wFpzLbGEDprVjnuFcD8B=MPkOePEKw@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/format-helper: Fix XRGB888 to monochrome
 conversion
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Mar 15, 2022 at 1:18 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 3/15/22 12:07, Geert Uytterhoeven wrote:
> > The conversion functions drm_fb_xrgb8888_to_mono() and
> > drm_fb_gray8_to_mono_line() do not behave correctly when the
> > horizontal boundaries of the clip rectangle are not multiples of 8:
> >   a. When x1 % 8 != 0, the calculated pitch is not correct,
> >   b. When x2 % 8 != 0, the pixel data for the last byte is wrong.
> >
>
> Thanks a lot for tracking down and fixing these issues.
>
> > Simplify the code and fix (a) by:
> >   1. Removing start_offset, and always storing the first pixel in the
> >      first bit of the monochrome destination buffer.
> >      Drivers that require the first pixel in a byte to be located at an
> >      x-coordinate that is a multiple of 8 can always align the clip
> >      rectangle before calling drm_fb_xrgb8888_to_mono().
> >      Note that:
> >        - The ssd130x driver does not need the alignment, as the
> >        monochrome buffer is a temporary format,
> >        - The repaper driver always updates the full screen, so the clip
> >        rectangle is always aligned.
> >   2. Passing the number of pixels to drm_fb_gray8_to_mono_line(),
> >      instead of the number of bytes, and the number of pixels in the
> >      last byte.
> >
> > Fix (b) by explicitly setting the target bit, instead of always setting
> > bit 7 and shifting the value in each loop iteration.
> >
> > Remove the bogus pitch check, which operates on bytes instead of pixels,
> > and triggers when e.g. flashing the cursor on a text console with a font
> > that is 8 pixels wide.
> >
> > Drop the confusing comment about scanlines, as a pitch in bytes always
> > contains a multiple of 8 pixels.
> >
> > While at it, use the drm_rect_height() helper instead of open-coding the
> > same operation.
> >
> > Update the comments accordingly.
> >
> > Fixes: bcf8b616deb87941 ("drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!

> I just have a small comment below.
>
> [snip]
>
> > +static void drm_fb_gray8_to_mono_line(u8 *dst, const u8 *src, unsigned int pixels)
> > +{
> > +     while (pixels) {
> > +             unsigned int i, bits = min(pixels, 8U);
> > +             u8 byte = 0;
> >
> > -                     byte >>= 1;
> > -                     if (src[x] >> 7)
> > -                             byte |= BIT(7);
> > +             for (i = 0; i < bits; i++, pixels--) {
>
> I think is worth to add a comment here explaining that the pixel is set to
> 1 for brightness > 127 and to 0 for brightness < 128. Or as kernel-doc for
> this helper function.
>
> > +                     if (*src++ & BIT(7))
>
> Pekka also mentioned that if (*src++ > 127) would make this easier to read.

Sure, will update. Nicely removes the need for a comment.

> > +                             byte |= BIT(i);
> >               }
> >               *dst++ = byte;
> >       }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
