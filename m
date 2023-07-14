Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CEE7536CD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9C710E0FF;
	Fri, 14 Jul 2023 09:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880D110E0FF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:41:45 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-cae693192d1so1632659276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 02:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689327704; x=1691919704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PvsgLCUoUYBwVIo5eyZX62ki0sLhfFVAuP7bUgSk5YE=;
 b=FXvfzDZNyqYfAU2CJne5ZZkdJ66OHI/inb1pn5KM0i+yOybQ0u7oq+NhqU7fz64LAm
 ofdS5oR1OYHmmLqd+8+gN00z67s3lAHnYwt75gecQx3a0w+5sXfptSprI81A5vTzVsSs
 lBJlwLohLyxvZALCYJ217JRLL5/91oKNVsZlLzyQpN76coIfuybXOkr/h5jIJc/f+LNb
 dq4ncdiEXk1P4czft/cz8ss0qFMKVd06Sqqy/UW+slh096H5pXg7GwcMvef9kW56Pdob
 jjBEPIzkaoHB4eRq97nSYj3lHzRtIeo99JgS9F/YhlepME6XelH9RqAhmjJLDGXS6s8q
 lZag==
X-Gm-Message-State: ABy/qLbnuhpovzMDxc5wMbLjMy1sHwCPOC5wN54TlNhjR3KByEkWWydj
 jL5b78tOZsgakVf8FS8WuyD79XA8P2LXH3m9
X-Google-Smtp-Source: APBJJlGb5KTFeYztoTpkDdvGc8Q43Aqi9cotsgLgjv30CeMNsUkaf3oBYvBbrjqEjIVCGIr2VlVKWw==
X-Received: by 2002:a25:d847:0:b0:c6b:b85f:ea33 with SMTP id
 p68-20020a25d847000000b00c6bb85fea33mr3601961ybg.9.1689327704020; 
 Fri, 14 Jul 2023 02:41:44 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 z7-20020a25ba47000000b00babcd913630sm1694619ybj.3.2023.07.14.02.41.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 02:41:43 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-c5e76dfcc36so1627490276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 02:41:43 -0700 (PDT)
X-Received: by 2002:a25:b44:0:b0:bd7:545e:ab41 with SMTP id
 65-20020a250b44000000b00bd7545eab41mr3609366ybl.27.1689327702982; Fri, 14 Jul
 2023 02:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689252746.git.geert@linux-m68k.org>
 <54deec2ec533e90544faa8c60a0c2518c58f3e9c.1689252746.git.geert@linux-m68k.org>
 <87r0pau99o.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87r0pau99o.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 11:41:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVAXPqjSNGMrZQ2g8FNNL4f7PbdoUCi17g9YOdoqmjFpQ@mail.gmail.com>
Message-ID: <CAMuHMdVAXPqjSNGMrZQ2g8FNNL4f7PbdoUCi17g9YOdoqmjFpQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm/ssd130x: Fix pitch calculation in
 ssd130x_fb_blit_rect()
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Jul 14, 2023 at 11:34=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > The page height must be taken into account only for vertical coordinate=
s
> > and heights, not for horizontal coordinates and widths.
> >
> > Fixes: 179a790aaf2a0127 ("drm/ssd130x: Set the page height value in the=
 device info data")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> > --- a/drivers/gpu/drm/solomon/ssd130x.c
> > +++ b/drivers/gpu/drm/solomon/ssd130x.c
> > @@ -596,7 +596,7 @@ static int ssd130x_fb_blit_rect(struct drm_framebuf=
fer *fb, const struct iosys_m
> >       rect->y1 =3D round_down(rect->y1, page_height);
> >       rect->y2 =3D min_t(unsigned int, round_up(rect->y2, page_height),=
 ssd130x->height);
> >
> > -     dst_pitch =3D DIV_ROUND_UP(drm_rect_width(rect), page_height);
> > +     dst_pitch =3D DIV_ROUND_UP(drm_rect_width(rect), 8);
> >
>
> That's true for ssd130x controllers that use R1, but when doing that
> change one of my goals was to prepare the driver for supporting the
> ssd132x family that use a 16-grayscale pixel format (R4).
>
> For those controllers, the pixels are encoded in 4-bit and each page
> has two pixels. So for those controllers the dst_pitch will need to
> be DIV_ROUND_UP(drm_rect_width(rect), 2) instead since the width is
> not 8 in that case.
>
> So I would prefer to skip this patch from your set, because otherwise
> we will need to revert it when adding support for SSD132x controllers.

My point is that the 8 as used here is related to the number of bits per pi=
xel,
not to the page height.  The page height might also be impacted by the
number of bits per pixel, but that is orthogonal.

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
