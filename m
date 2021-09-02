Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4691B3FEE84
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 15:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05DA6E544;
	Thu,  2 Sep 2021 13:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F416E544
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 13:15:36 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id s126so605718vkd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 06:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=97U7yjyC9u7K560fHPV0AzvZLQ1JtD7v4r1SnsrSUGw=;
 b=kUcS6BcxskmaJD7dvT4PQrJiGnCTuFV+uWYwsgpCyEXXR2QPYylJ1EJiw7nnoWcxfT
 9hGQTKtYLnamwcEnH2unq+gtI8H4nc+soQTZxM9h7GomYERWGEIHjEBBT5Yjrv96bZDJ
 RMr1rYOJeX6Eq0o+tJzCjB7GDPThiOtrm4JNyRT54+/4ruB8lzdccrJN5yTqzDDE2K3r
 AUrR6AxXTtD0mP5YzG46lxsqKuyoobi84PddO15/NZqBPGqQyFxUGbg5/FiT9hS1SyGZ
 YqtSHOLkZYuR8mfnIPip5efqkXu1uJIMyLXRYBiBd6JvxfM6CsgHnlbR88tTI69n9pNS
 dzbA==
X-Gm-Message-State: AOAM533yln3fTtoiHuyMHPPmZqdCdIs/2rdHw7i3q/pHUoEsqT2Y3cGe
 7RIPZAiJMrQBZQWu1ruj+2eCy/PSReIdrQjItq8=
X-Google-Smtp-Source: ABdhPJyQfNHd8eekTjjRF+Djs44a/sSv6U+YNBayDddfjAvJLpLh7J03k+WxXm3fVzYEOjiv/xorOOUMd/FOKfZUqC4=
X-Received: by 2002:a1f:bd0a:: with SMTP id n10mr1537493vkf.5.1630588535725;
 Thu, 02 Sep 2021 06:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210902060213.1702544-1-mudongliangabcd@gmail.com>
In-Reply-To: <20210902060213.1702544-1-mudongliangabcd@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Sep 2021 15:15:24 +0200
Message-ID: <CAMuHMdVPUMGZ7Sq2rBgr+US0H3ZF4WVkfPPnKQD1cMg5Wd0+-w@mail.gmail.com>
Subject: Re: [PATCH 4.19] fbmem: add margin check to fb_check_caps()
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 George Kennedy <george.kennedy@oracle.com>, 
 syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com, 
 Dan Carpenter <dan.carpenter@oracle.com>,
 Dhaval Giani <dhaval.giani@oracle.com>, Sasha Levin <sashal@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dongliang,

On Thu, Sep 2, 2021 at 8:04 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> [ Upstream commit a49145acfb975d921464b84fe00279f99827d816 ]

Oops, looks like I missed when that one was submitted for review...

> A fb_ioctl() FBIOPUT_VSCREENINFO call with invalid xres setting
> or yres setting in struct fb_var_screeninfo will result in a
> KASAN: vmalloc-out-of-bounds failure in bitfill_aligned() as
> the margins are being cleared. The margins are cleared in
> chunks and if the xres setting or yres setting is a value of
> zero upto the chunk size, the failure will occur.
>
> Add a margin check to validate xres and yres settings.

Shouldn't (the caller of) bitfill_aligned() be fixed instead?
Can this be triggered by e.g. using the mini_4x6 font?

> Note that, this patch needs special handling to backport it to linux
> kernel 4.19, 4.14, 4.9, 4.4.
>
> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> Reported-by: syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Dhaval Giani <dhaval.giani@oracle.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/1594149963-13801-1-git-send-email-george.kennedy@oracle.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/video/fbdev/core/fbmem.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 84845275dbef..de04c097d67c 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -991,6 +991,10 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>                         goto done;
>                 }
>
> +               /* bitfill_aligned() assumes that it's at least 8x8 */
> +               if (var->xres < 8 || var->yres < 8)
> +                       return -EINVAL;

Are you sure there don't exist such small displays (e.g. OLED)?

> +
>                 ret = info->fbops->fb_check_var(var, info);
>
>                 if (ret)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
