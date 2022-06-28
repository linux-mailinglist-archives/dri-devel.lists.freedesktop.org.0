Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D709155BF83
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 10:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFF110FF41;
	Tue, 28 Jun 2022 08:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B6610FF41
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 08:40:13 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id i17so18913403qvo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 01:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2YpN+xGTRMUaw3KBiJiQ1vTuL3RZYxt01a0NoSjORfw=;
 b=FPMffF78h9cpl9xrBBdoLMXtK0FkT2R9+CdyVyyOuPpJs/mTqbNBr8x5ZdbfmvoC+r
 Gl+rUz0qEJpAjXwQnG/XcQNx30qpVQU5L7CaaRvs/d8l+hJsJS1SGSVO/8CqM0Dm4FSK
 U9ycfKpG75gyABzyXB7O07YuQRgGFFBA7agX4J5EtzATnjZ8JAWUZ0qQdUyl1n66TAFl
 Pk8h1OYWPdf7FWYOZJAcLPmRnhY7oXJK4fl716zPvU++0pTFNEvgC7q7cJ8zZq4bgmx7
 v8uUXEZCXg+/vh8/kadoFh4vc7a1HXjj6HW+sGqY0RxyXJzLrDmtaByXjpS2iS8z2aWv
 nvuA==
X-Gm-Message-State: AJIora+HiTtiaAd/rbVmSpxS4HqSftScCEBqeeqo/X0DsLjQEVxeMZ38
 LZ5FOlUBJYaWRhKfF/1tXDjVCC6GPNg6+w==
X-Google-Smtp-Source: AGRyM1tmDOal40RS+vGO46Py4tBmKTgsxK52wg17Hwo89me7lWstuxDEIC9Bi48Yq/moSgKXSllHdw==
X-Received: by 2002:a05:622a:2305:b0:31b:9495:c1b0 with SMTP id
 ck5-20020a05622a230500b0031b9495c1b0mr4080679qtb.681.1656405612346; 
 Tue, 28 Jun 2022 01:40:12 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 bi32-20020a05620a31a000b006af3f3b385csm2706958qkb.98.2022.06.28.01.40.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 01:40:12 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id x184so18277727ybg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 01:40:11 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr18412036ybq.543.1656405611671; Tue, 28
 Jun 2022 01:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220626102853.124108-1-deller@gmx.de>
 <20220626102853.124108-4-deller@gmx.de>
In-Reply-To: <20220626102853.124108-4-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jun 2022 10:39:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5zLoQWi2qd9HpP65WEvCw_q3VTsZ0MnBV1t8xM7KFUw@mail.gmail.com>
Message-ID: <CAMuHMdV5zLoQWi2qd9HpP65WEvCw_q3VTsZ0MnBV1t8xM7KFUw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] fbcon: Prevent that screen size is smaller than
 font size
To: Helge Deller <deller@gmx.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Sun, Jun 26, 2022 at 12:33 PM Helge Deller <deller@gmx.de> wrote:
> We need to prevent that users configure a screen size which is smaller than the
> currently selected font size. Otherwise rendering chars on the screen will
> access memory outside the graphics memory region.
>
> This patch adds a new function fbcon_modechange_possible() which
> implements this check and which later may be extended with other checks
> if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
> ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
> for a too small screen size.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: stable@vger.kernel.org # v5.4+

Thanks for your patch, which is now commit f0b6a66d33ca6e7e ("fbcon:
Prevent that screen size is smaller than font size") in fbdev/for-next

> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1112,7 +1112,9 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>                         return -EFAULT;
>                 console_lock();
>                 lock_fb_info(info);
> -               ret = fb_set_var(info, &var);
> +               ret = fbcon_modechange_possible(info, &var);

Again, this should be done (if done at all) after the call to
fb_ops.check_var(), as it breaks the FBIOPUT_VSCREENINFO rounding rule.

What if the user just wants to display graphics, not text?
Can't the text console be disabled instead?

> +               if (!ret)
> +                       ret = fb_set_var(info, &var);
>                 if (!ret)
>                         fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>                 unlock_fb_info(info);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
