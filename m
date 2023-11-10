Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123A37E7A84
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 10:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D7410E94B;
	Fri, 10 Nov 2023 09:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3807110E94B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 09:17:04 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5be8f04585cso15786747b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 01:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699607823; x=1700212623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5SeoW2Ozl9vYqZb/JuRB8XTAeF65cUnotgZLsCYXGTo=;
 b=H16X3NzSld8mrKOUe1c0rpwqshnSxYJOzgOBqRezreyWxas/A6mctQBro7BS2MevmI
 tTy1mpDrn6IwCq58a3PA2FrK1T4DEzmxw/fM2sohxluF5tQdfF/vo9wQsSXUP795GrmS
 AM6fcBVkCSZm5ZavfSCynMJs+l9OlZNDd+uVYmZJPnnm4IwWzZpDhm7KJffLTuS7pKvK
 sAeTlN4PkPE6yjf1lZQnIO3pa8KaXj+CElzw1rLDxHjncNR3N6YuWoOIaHN89GkmJqWn
 DviTHd3pi7iFdIUUwUZ+wUErHrFBy7HhmRs44BpaF2Nu8unjceKJ8FjxqhxdqXn7CDgB
 mjKg==
X-Gm-Message-State: AOJu0Yw+9K+XxPmX/jzHym1bx+bXlO8yr//g3gPhwr6oev9lgaH40i/Y
 6iBMt5lVY95NB/TfZAqz+icHsLkz06d12Q==
X-Google-Smtp-Source: AGHT+IGQyWEwaCqOAz2re3CI76zxn2vUJ8TspRV5UU6mw1qBfiliXhjWlRlgQIjcpsq2GdOGO2G+Gw==
X-Received: by 2002:a81:6044:0:b0:5b3:3109:3701 with SMTP id
 u65-20020a816044000000b005b331093701mr1076286ywb.21.1699607823191; 
 Fri, 10 Nov 2023 01:17:03 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 z81-20020a816554000000b0059b17647dcbsm8514774ywb.69.2023.11.10.01.17.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 01:17:02 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5a877e0f0d8so25245797b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 01:17:02 -0800 (PST)
X-Received: by 2002:a81:7307:0:b0:5b3:f93c:d55 with SMTP id
 o7-20020a817307000000b005b3f93c0d55mr1077240ywc.4.1699607822211; Fri, 10 Nov
 2023 01:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20231109220151.10654-1-u.kleine-koenig@pengutronix.de>
 <20231109220151.10654-2-u.kleine-koenig@pengutronix.de>
 <CAMuHMdWEGxU8STZrv4q3JgT+U=+Vyr4w_e_VnN23f36kBRBJXA@mail.gmail.com>
 <20231110085718.tzn7crqcahx2yo63@pengutronix.de>
In-Reply-To: <20231110085718.tzn7crqcahx2yo63@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Nov 2023 10:16:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJbmZzyBcmPshLcPv3SBJpZ6qdxgY+nzByfz5Hkhc+YQ@mail.gmail.com>
Message-ID: <CAMuHMdXJbmZzyBcmPshLcPv3SBJpZ6qdxgY+nzByfz5Hkhc+YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] fb: amifb: Mark driver struct with __refdata to
 prevent section mismatch warning
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Atul Raut <rauji.raut@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On Fri, Nov 10, 2023 at 9:57=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Fri, Nov 10, 2023 at 08:58:37AM +0100, Geert Uytterhoeven wrote:
> > On Thu, Nov 9, 2023 at 11:02=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > As described in the added code comment, a reference to .exit.text is =
ok
> > > for drivers registered via module_platform_driver_probe(). Make this
> > > explicit to prevent a section mismatch warning.
> > >
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> >
> > Thanks for your patch!
> > Why am I not seeing the actual section mismatch warning, not even
> > with W=3D1?
>
> Do you have f177cd0c15fcc7bdbb68d8d1a3166dead95314c8 in your tree? And

Yes I have.

> note it's only there if you compile the driver as a module and it is
> only emitted once you completed the whole build.

Thanks, I do see it in a modular build.

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
