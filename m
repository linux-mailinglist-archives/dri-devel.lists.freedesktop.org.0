Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2EA6EF7B1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 17:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8E010E09B;
	Wed, 26 Apr 2023 15:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5E510E09B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 15:21:52 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5562c93f140so44249237b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 08:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682522512; x=1685114512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fNU02MgisC2DVRfyuqUz0GaaJRwku9M+1H+Ra/NSpEw=;
 b=c+jkNP6atG15jpkfBp+oZjnDBD4JIMk8ezwERUVB0sZJ3GyMPTQLRiqI5NS8RKbUAT
 W3VAwYCwRGyyA8qRG8ii5pbYjTPh1pMDRMwn5gyhtWXydWZMcNzHL9PgSqZ5Vq8xwo7G
 oYFUrHoW0mrMAgleLc2JLqox+Cq6ys8zCb9qsZPXe5+bCnePFmA/7meq3jHblf70F/Di
 RkKDex0hEc44WBivCsXn4MwixjlzRyXtOaSDT7Q7687SpB+Yg7xFRiWNaIzRMQ9lBvY4
 zfvVXE4E7GgX+rY9Wqko6qua9iHXC1nnfTiNJIzSRavmy8jfeORr7yEpkhjwXgpcJJf2
 ZJ6g==
X-Gm-Message-State: AAQBX9cbahxkAxixShw/+Mx8+ZcY/UR8ncFaJr88YiE1Ovs1sUYclKLj
 WK5fJOI7SFLnPQaXyVNWyY7nC/t5uIjLkg==
X-Google-Smtp-Source: AKy350ZjmsVtrXhpcuE1lCrjyYuzs6IHSlWpLmixfo/DiCFsc0TZPSJ1LUPdxGl+6PLC3Mn+crQJLg==
X-Received: by 2002:a25:fd4:0:b0:b8e:e3e7:2b76 with SMTP id
 203-20020a250fd4000000b00b8ee3e72b76mr12882026ybp.40.1682522511708; 
 Wed, 26 Apr 2023 08:21:51 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 p203-20020a255bd4000000b00b9a3dd3776bsm279882ybb.2.2023.04.26.08.21.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 08:21:50 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5562c93f140so44248437b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 08:21:50 -0700 (PDT)
X-Received: by 2002:a0d:c606:0:b0:54f:e33d:f1d1 with SMTP id
 i6-20020a0dc606000000b0054fe33df1d1mr12872900ywd.13.1682522510366; Wed, 26
 Apr 2023 08:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-6-tzimmermann@suse.de>
 <CAMuHMdU-_w9yQHYhOCD3cz4CEY6ag-dTXjuHSLnzty0hAMBbXw@mail.gmail.com>
 <1d81e4cc-5079-12a7-4cf5-c31879396e56@suse.de>
In-Reply-To: <1d81e4cc-5079-12a7-4cf5-c31879396e56@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Apr 2023 17:21:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDyabYxtRHtvuNZy8BjoukRdycAMK2jX+qmgc51HU5Xw@mail.gmail.com>
Message-ID: <CAMuHMdWDyabYxtRHtvuNZy8BjoukRdycAMK2jX+qmgc51HU5Xw@mail.gmail.com>
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Apr 26, 2023 at 5:06=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 26.04.23 um 17:01 schrieb Geert Uytterhoeven:
> > On Tue, Apr 25, 2023 at 4:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Move the existing CFB read and write code for I/O memory into
> >> the new helpers fb_cfb_read() and fb_cfb_write(). Make them the
> >> default fp_ops. No functional changes.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>   drivers/video/fbdev/core/Makefile      |   2 +-
> >>   drivers/video/fbdev/core/fb_cfb_fops.c | 126 +++++++++++++++++++++++=
++
> >>   drivers/video/fbdev/core/fbmem.c       | 113 +---------------------
> >>   include/linux/fb.h                     |  10 ++
> >>   4 files changed, 139 insertions(+), 112 deletions(-)
> >>   create mode 100644 drivers/video/fbdev/core/fb_cfb_fops.c
> >
> > While the general idea is fine, please do not call any of this "cfb",
> > as it is not related to chunky color frame buffer formats.
> > All of these operate on the raw frame buffer contents.
>
> Shall I call it fb_raw_() or fb_io_()?

Given fb_memcpy_fromfb() is mapped to memcpy_fromio() on
most architectures, I'd go for fb_io_*().

> CFB is used by the drawing helpers, which are usually used together with
> this code. Hence the current naming.

That's because your drawing helpers operate (only) on chunky color
frame buffer formats ;-)

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
