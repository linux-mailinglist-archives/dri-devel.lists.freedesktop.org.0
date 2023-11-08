Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1457E6007
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 22:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F01F10E863;
	Wed,  8 Nov 2023 21:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A198710E863
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 21:35:10 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-5af6c445e9eso2470437b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 13:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699479309; x=1700084109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhaph37tDMn0AUVpfdaJ085jmOZUaCnuGtY8dKZyEE8=;
 b=ckdCRdGQzBOfaVPDxL5NWmZVgFQ0T0TvNNgZI3j3V8fINYKbZyoUhdqd31WZLE0xyQ
 u3Y0S6tBTlFl8bXglAKJJXIcV/pu4yztWy2Bke8pKYH1f7lVFSzOkyRqhYNd6YGRUY3w
 54uoYd8c2aGUhjmkoL3pu7jAveMWkCxubbSHOJUmlIdV65zxXhA5qJnPdae2DvrGZ836
 f4UkP9bu5cRN3/cC4V/ZfyUsZ80Apq3pg/3X0BD0p/ruohlNi4MKoTRJ8+8LQE/oNw7L
 ILAFuuKySToBm8BDLeBhQ/aUHbjFS0CBiInMhKHb/QdOor6fCaIW1cUIwDaZs+VR+9Qn
 V7Fw==
X-Gm-Message-State: AOJu0YwTjyYQbwVROKW1078lNhbwckf0PKZ7LzLn8EH9MSU3ALrsT7oJ
 vDgFJecTzhPnL//7ohdLE2bSd4v9RVArpQ==
X-Google-Smtp-Source: AGHT+IHP4tIbVtJ9vaP5o3hY0JLl+C/SOfUN4Z7gpf59qvPY7KhbHm0G9DRIDo5vjUDiwISeCJg77A==
X-Received: by 2002:a81:4a44:0:b0:5ae:732b:ec21 with SMTP id
 x65-20020a814a44000000b005ae732bec21mr3236293ywa.34.1699479309094; 
 Wed, 08 Nov 2023 13:35:09 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 v185-20020a0dd3c2000000b0059bcadded9dsm7449019ywd.116.2023.11.08.13.35.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 13:35:08 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5a7af52ee31so2186217b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 13:35:08 -0800 (PST)
X-Received: by 2002:a81:80c6:0:b0:59a:d42c:5d50 with SMTP id
 q189-20020a8180c6000000b0059ad42c5d50mr2579753ywf.52.1699479308251; Wed, 08
 Nov 2023 13:35:08 -0800 (PST)
MIME-Version: 1.0
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-2-u.kleine-koenig@pengutronix.de>
 <CAMuHMdVaaH_ZJT+jAyxZxnVYT3L=b4B-LEMTP4PqQH2TE0nH6g@mail.gmail.com>
 <9559f1d6-f68e-4c14-83b0-e5a545039124@gmx.de>
In-Reply-To: <9559f1d6-f68e-4c14-83b0-e5a545039124@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Nov 2023 22:34:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsHHPAE5JXjC5rS86H=nDgBMePGU8b1y_wcQYrWZHuTA@mail.gmail.com>
Message-ID: <CAMuHMdVsHHPAE5JXjC5rS86H=nDgBMePGU8b1y_wcQYrWZHuTA@mail.gmail.com>
Subject: Re: [PATCH 01/22] fb: amifb: Stop using platform_driver_probe()
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Atul Raut <rauji.raut@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Wed, Nov 8, 2023 at 10:32=E2=80=AFPM Helge Deller <deller@gmx.de> wrote:
> On 11/8/23 22:06, Geert Uytterhoeven wrote:
> > On Tue, Nov 7, 2023 at 10:20=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> >> On today's platforms the benefit of platform_driver_probe() isn't that
> >> relevant any more. It allows to drop some code after booting (or modul=
e
> >> loading) for .probe() and discard the .remove() function completely if
> >> the driver is built-in. This typically saves a few 100k.
> >
> > Which is a lot on platforms with only a few MiBs of RAM...
>
> True.
> Given the warnings below, what is your suggestion?
> Better to drop the amifb patch ?

I think so. There is a reason these drivers use platform_driver_probe().

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
