Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D0A571549
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 11:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989C8939EA;
	Tue, 12 Jul 2022 09:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D00939EA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 09:05:38 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id ck6so8897203qtb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 02:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=79jxf1/kdmUa0DtMVFvghcUuGAxzDeb5XSEGWDL7KSE=;
 b=gTK1YiHJDZWULlej1m2RQ+EIsolgWLXhoGHOgVYHgo9atH7R8lLb3pqHpyBK/kbbt/
 OcFOyuucKICr1GNT9ZnPrKm07TaaALeVsKlhXcPovryRmGEgoOliBBzZbKES2TjN1LFD
 yDRMUNi1h/c4o6hm7T+uHhstkDe8EGnn+6OPlV6bksYjLVpei1WIy7FxJQGvhs1frbYn
 CdRtLnftWS93Ubk0tcp784puxl8S6tbTF0rasJrGVIkxigJRwitLH/xPKWFRwWd7wTjV
 0Lt9GGE0D/FZRT7ww4qW94DQ71Ua83yjU9vdGyqYfD36q0s2EvnwwTI4bFhu5yHx9qrY
 HJ8Q==
X-Gm-Message-State: AJIora/GTz6sLi5IgfSWEHvgHQ6i8TlrItFs/e4t+4KExeSRA3C6VDNN
 RkFl1BxZaVsWcsa3Dc8bsOb486tuCnaiXQ==
X-Google-Smtp-Source: AGRyM1sGKc7+BatB3lJoSq42VyQIQtMdpmn94PzfcMZJxc7EFes9G+/ge6mbT5lSMtD0qAyKSf+E6g==
X-Received: by 2002:a05:622a:13:b0:317:9bb2:b0ae with SMTP id
 x19-20020a05622a001300b003179bb2b0aemr17029655qtw.411.1657616737698; 
 Tue, 12 Jul 2022 02:05:37 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 s2-20020ac85282000000b0031ec2a48050sm507710qtn.34.2022.07.12.02.05.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 02:05:37 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-31c89653790so73985907b3.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 02:05:37 -0700 (PDT)
X-Received: by 2002:a81:9209:0:b0:31c:b1b7:b063 with SMTP id
 j9-20020a819209000000b0031cb1b7b063mr24535147ywg.383.1657616737038; Tue, 12
 Jul 2022 02:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657302034.git.geert@linux-m68k.org>
 <a35154278816426fee7045795aa4894ff615efdf.1657302034.git.geert@linux-m68k.org>
 <YsqqiMAikaBP/3vt@ravnborg.org>
 <CAMuHMdWJf6HR-jf+UijFgfpXpG2UFj+Z-9ef2y5u6CTrZBsS+g@mail.gmail.com>
 <Ysq+RUzLURDxmQqZ@ravnborg.org>
In-Reply-To: <Ysq+RUzLURDxmQqZ@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Jul 2022 11:05:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOzoMdKBiArApqDPkUUE82Oi59e37o1T7+1PbPoHNDwA@mail.gmail.com>
Message-ID: <CAMuHMdVOzoMdKBiArApqDPkUUE82Oi59e37o1T7+1PbPoHNDwA@mail.gmail.com>
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

> On Sun, Jul 10, 2022 at 01:04:23PM +0200, Geert Uytterhoeven wrote:
> > On Sun, Jul 10, 2022 at 12:31 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > On Fri, Jul 08, 2022 at 08:21:31PM +0200, Geert Uytterhoeven wrote:
> > > > Fill in the LSB when converting color components from 8-bit to 16-bit.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > --- a/tests/util/pattern.c
> > > > +++ b/tests/util/pattern.c
> > > > @@ -646,9 +646,9 @@ void util_smpte_c8_gamma(unsigned size, struct drm_color_lut *lut)
> > > >       memset(lut, 0, size * sizeof(struct drm_color_lut));
> > > >
> > > >  #define FILL_COLOR(idx, r, g, b) \
> > > > -     lut[idx].red = (r) << 8; \
> > > > -     lut[idx].green = (g) << 8; \
> > > > -     lut[idx].blue = (b) << 8
> > > > +     lut[idx].red = (r) * 0x101; \
> > >
> > >         (lut[idx].red = (r) << 8) | 1;
> > >
> > > had IMO been easier to read.
> >
> > I guess you mean "| (r)" instead of "| 1"?
>
> Well, I meant what I wrote but it is obviously wrong.

;-)

> So yes
>         lut[idx].red = (r) << 8 | (r);
>
> is the equivalent of multiplying with 0x101.
>
> Whatever works, but if you update this patch, then please update the
> later patch where the multiply with 0x101 is also used.

The advantage of the multiplication is that the macro's parameters
are used only once, hence no temporaries are needed to keep them safe.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
