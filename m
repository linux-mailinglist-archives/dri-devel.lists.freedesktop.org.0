Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC4E6F5A90
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7036010E2FA;
	Wed,  3 May 2023 15:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C65310E2DC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 15:02:17 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-b980e16b27bso4428124276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 08:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683126135; x=1685718135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NOlHKfxuJYPRynZEw9AN6Z+6KcLUXuz7CAX0Jz+d/Q8=;
 b=DUiv976aMI6N14fakBxYQVbKl7sdb0CGVEtbVZds6VnANUv6CcQtGZwd+7EUbdrnkk
 iDS7VAiEtOC8xQ+cW5huKYdyna4kijvaqr++R2YVhfQ8MuBJGiEJ7NIDrm8H8Ul1Sm9Q
 OSzYlPUUNCE4Jj588Mc+0SdJC8k/xI/0xrfwxWtoPdlTzS5+ZT5zuDhsyytm4w/sq8XC
 uRssxDiY8OsFcbKoK8FnP3bwhOjzbSLyXa1bAJAFbiWMhgyLA8BHxkdQEYGD4U1Cxel8
 K9tcZ5oolxFkNsbwUkeL7yRmUhyMk5ODRljh4YfvHYN85cU4NfJCtdFEQ4nC2EGAAHN4
 vTJA==
X-Gm-Message-State: AC+VfDwVmrdIdp2TBmundwE3RH5nv/JYRnUOeS74wxN11eAeh+eP8dcu
 HfbUNds/JphKcuOEdv8vfDpQP2IgNYxNWg==
X-Google-Smtp-Source: ACHHUZ4/zzkigM1hyzbfVbkcuyxOYaPzR/DYA/HUmJbiR1FIIYJjxHHlfEqYmrBeqb7VxVKq1ZODDw==
X-Received: by 2002:a25:25cb:0:b0:b9e:64b7:3e5c with SMTP id
 l194-20020a2525cb000000b00b9e64b73e5cmr6761402ybl.13.1683126135589; 
 Wed, 03 May 2023 08:02:15 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 v70-20020a25c549000000b00b9dc4620f95sm2353453ybe.6.2023.05.03.08.02.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 08:02:15 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-b980e16b27bso4428042276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 08:02:14 -0700 (PDT)
X-Received: by 2002:a05:6902:723:b0:b99:8359:b485 with SMTP id
 l3-20020a056902072300b00b998359b485mr23672462ybt.18.1683126134306; Wed, 03
 May 2023 08:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-18-tzimmermann@suse.de>
 <CAMuHMdUgsUsNaCvSA+jUNrOvZU3O2xF0b=MnA_GyL-HvAeZy5Q@mail.gmail.com>
 <310b1de3-589d-189b-e6b7-1e146a86f185@suse.de>
In-Reply-To: <310b1de3-589d-189b-e6b7-1e146a86f185@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 17:02:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXD85QqpH5JN=-8bj-8Hsb_opiM1xF0Vu7Cc3_4r2kRAA@mail.gmail.com>
Message-ID: <CAMuHMdXD85QqpH5JN=-8bj-8Hsb_opiM1xF0Vu7Cc3_4r2kRAA@mail.gmail.com>
Subject: Re: [PATCH v2 17/19] fbdev: Validate info->screen_{base,buffer} in
 fb_ops implementations
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 teddy.wang@siliconmotion.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, May 3, 2023 at 4:30=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 03.05.23 um 11:51 schrieb Geert Uytterhoeven:
> > On Fri, Apr 28, 2023 at 2:26=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Push the test for info->screen_base from fb_read() and fb_write() into
> >> the implementations of struct fb_ops.{fb_read,fb_write}. In cases wher=
e
> >> the driver operates on info->screen_buffer, test this field instead.
> >>
> >> While bothi fields, screen_base and screen_buffer, are stored in the
> >
> > both
> >
> >> same location, they refer to different address spaces. For correctness=
,
> >> we want to test each field in exactly the code that uses it.
> >
> > Not a direct comment for this patch: and later the union can be split
> > in two separate fields, to protect against misuse?
>
> No idea. Currently we have sparse that warns about mismatching address
> spaces if the fields are mixed up. That's good enough, as far I'm concern=
ed.

The potential issue that is still present is that an fbdev driver uses
fb_info.screen_base, and configures the use of drawing ops that use
fb_info.screen_buffer (or vice-versa), which will happily use the wrong
type of pointer.  Sparse doesn't protect against that.

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
