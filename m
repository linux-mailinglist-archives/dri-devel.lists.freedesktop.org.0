Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB564D8B4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 10:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379AA10E0A1;
	Thu, 15 Dec 2022 09:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0B410E0A7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 09:36:43 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id fu10so4766112qtb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 01:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g2NPyqXJNNNln99iz2q7S9fU77v53XVtuYkV5/riHK4=;
 b=cCQQ3CvPAIBU9S8ovrKhMHcJIuxrwKJsLMsJmiJNkNxey7dcZHYBOAKoKIrzMsd0BD
 7iS3Px/IGlgb/mW4+O/nPzdvGj9wxhtsncKjknk3tLcEWTfbjaGmJ0usg+YWIuG0SjYq
 WY79GH+9pGKw+t1F/PrWmuOG/XPm1NkUw6+pWQ9v9B4t8Ip8EX6vpIObBFz50UFeSPu4
 SBWrESu9Bf/dK2uUnsWreTai+Bd1IjpVyi9tYkYOon1EgPY/wVqW8Ofm6un6Do/hturW
 vIoMOgCYlNZeyYspPeLioyFr2muXjQXfy5uDJ7KATjoI+gnIKwCdXgKkkWQr9UYEQzk/
 e96Q==
X-Gm-Message-State: ANoB5pkGXBAj0P79hlEvXH6eMX3pyBMxKH+O88hst+sYkIdZiK9Ras5W
 xE4i679wRGmI7gsvNxG4bJymdtl7VC7alw==
X-Google-Smtp-Source: AA0mqf4V03aRMsgSGP8rBOR7xjnGhyRsrjhfVKfcYJQ9bLahqeSp9poaSaxAQpodc27/UaUAQjGwtw==
X-Received: by 2002:ac8:548a:0:b0:3a6:8f0d:53a6 with SMTP id
 h10-20020ac8548a000000b003a68f0d53a6mr14787576qtq.40.1671097001778; 
 Thu, 15 Dec 2022 01:36:41 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 u13-20020ac8750d000000b0039492d503cdsm3225598qtq.51.2022.12.15.01.36.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 01:36:41 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id e141so2831182ybh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 01:36:40 -0800 (PST)
X-Received: by 2002:a25:7104:0:b0:702:90b4:2e24 with SMTP id
 m4-20020a257104000000b0070290b42e24mr13831647ybc.365.1671097000657; Thu, 15
 Dec 2022 01:36:40 -0800 (PST)
MIME-Version: 1.0
References: <cad03d25-0ea0-32c4-8173-fd1895314bce@I-love.SAKURA.ne.jp>
In-Reply-To: <cad03d25-0ea0-32c4-8173-fd1895314bce@I-love.SAKURA.ne.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Dec 2022 10:36:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com>
Message-ID: <CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com>
Subject: Re: [PATCH] fbcon: Use kzalloc() in fbcon_prepare_logo()
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Handa-san,

On Thu, Nov 17, 2022 at 4:32 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> A kernel built with syzbot's config file reported that
>
>   scr_memcpyw(q, save, array3_size(logo_lines, new_cols, 2))
>
> causes uninitialized "save" to be copied.

> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Thanks for your patch, which is now commit a6a00d7e8ffd78d1
("fbcon: Use kzalloc() in fbcon_prepare_logo()") in v6.1-rc7,
and which is being backported to stable.

> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -577,7 +577,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
>                 if (scr_readw(r) != vc->vc_video_erase_char)
>                         break;
>         if (r != q && new_rows >= rows + logo_lines) {
> -               save = kmalloc(array3_size(logo_lines, new_cols, 2),
> +               save = kzalloc(array3_size(logo_lines, new_cols, 2),
>                                GFP_KERNEL);
>                 if (save) {
>                         int i = min(cols, new_cols);

The next line is:

                        scr_memsetw(save, erase,
array3_size(logo_lines, new_cols, 2));

So how can this turn out to be uninitialized later below?

                scr_memcpyw(q, save, array3_size(logo_lines, new_cols, 2));

What am I missing?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
