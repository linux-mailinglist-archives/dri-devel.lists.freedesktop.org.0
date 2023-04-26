Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4700E6EF6ED
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 16:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7A710E436;
	Wed, 26 Apr 2023 14:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0F310E436
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 14:56:30 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-b8f599b9277so10862219276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682520989; x=1685112989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/XCTcDbpPB/liGF983vey6mh6nUAjd3zqT7KMY+SE1g=;
 b=bArwaiA1ZgZxFyeFN4w3b4067VnyadaVQaysfHjkSYN8RTZ1UIC72WX/dbrhMU9LHF
 GHkBl8w9Xe4oOmf/YX313XfQB6ZxC0pW4vj3+aE3ENqU0AWiiIA3W63t5hF8qRt6ToYy
 5NsTlsIDIH8nhOatWmHJYt8syJ8Po9dSUzTKcvbTzXBra+YajNb5dLYoMMw0qldvCx5b
 6lSvESC71OZt13EPiWXxTUG+9qJ47Kbw6jgm1JdfugxhDffX0g/69Q+aGMy3EVqoK7O4
 TkDouaquESnBGl3boRbgo8XqhJ78mZuksb7dJDxuKgeSP8b39AUvBjsy4K0AqthVydKY
 KjLQ==
X-Gm-Message-State: AAQBX9dzoQ8UM6vSiDfnzda5iXvVfswcb5RVho8MIFqiAQXidz6y9aL/
 t9QVwhEUDAQCk7iujYjrIvsltpKdPNbg+A==
X-Google-Smtp-Source: AKy350Z5IW5vsmr9bJ18abPJppEda+3olQD47tTVNCgzRGBqDGXpP7ioPuUiH2cBC/slxLKEhsfyjQ==
X-Received: by 2002:a25:c502:0:b0:b98:d45e:7bd4 with SMTP id
 v2-20020a25c502000000b00b98d45e7bd4mr15773614ybe.13.1682520988627; 
 Wed, 26 Apr 2023 07:56:28 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 y69-20020a81a148000000b00545a081847bsm4233884ywg.11.2023.04.26.07.56.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 07:56:27 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-54f8d59a8a9so87483637b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:56:27 -0700 (PDT)
X-Received: by 2002:a0d:fc46:0:b0:54f:b133:b2d with SMTP id
 m67-20020a0dfc46000000b0054fb1330b2dmr14383489ywf.26.1682520986826; Wed, 26
 Apr 2023 07:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-5-tzimmermann@suse.de>
In-Reply-To: <20230425142846.730-5-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Apr 2023 16:56:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8A_5Kd_D4qQfmYLbECekLWHFzrcK-xMTeyBaz=T_a-A@mail.gmail.com>
Message-ID: <CAMuHMdX8A_5Kd_D4qQfmYLbECekLWHFzrcK-xMTeyBaz=T_a-A@mail.gmail.com>
Subject: Re: [PATCH 4/6] fbdev: Validate info->screen_{base,
 buffer} in fb_ops implementations
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


On Tue, Apr 25, 2023 at 4:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Push the test for info->screen_base from fb_read() and fb_write() into
> the implementations of struct fb_ops.{fb_read,fb_write}. In cases where
> the driver operates on info->screen_buffer, test this field instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!
You forgot to mention why it is a good idea to duplicate this in all
the implementations, instead of doing it once in the core?

>  drivers/video/fbdev/cobalt_lcdfb.c     |  6 ++++++
>  drivers/video/fbdev/core/fb_sys_fops.c |  6 ++++++
>  drivers/video/fbdev/core/fbmem.c       | 10 ++++++++--
>  drivers/video/fbdev/sm712fb.c          |  4 ++--
>  4 files changed, 22 insertions(+), 4 deletions(-)

Aren't there more fbdev drivers to fix, before you can move the checks
in drivers/video/fbdev/core/fbmem.c?

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
