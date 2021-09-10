Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F60406E09
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 17:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4466EA10;
	Fri, 10 Sep 2021 15:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818C06EA10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 15:17:00 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id a25so1888304vso.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3BcYGTvP/p5y9awC2x3olztEkOI5xebLT4gUcpSRmlY=;
 b=vPMUO3F4MjeVn2np4pPSC4UK8+Z3AwFvJungFECXdJ1dxaB73kjo0b2oRcz6Sed55S
 8ttrN+m1LxxdHUPlzsNYeLttWtnoCXl13gjlRh/eOuf/YcfPNZc3FDoP0s6iygF/ACcD
 sFkPpVyJi3xO/oYuhgyAcPZUeFBPTZzaLeDs5Z0KeVtZlRANGHXfQycTyjFw50f0V6X1
 cpcBJNBZaOwPJseK7ENwIqdKBa6vnisgHgJimtlxmGBg290vgXzT+AlMcs32dB9D6UeK
 QQ27yWjQ9vH9cLzfVsf3ImQzBV9FCRdu1HEc/HYaiV58kFKPaww38HpgQUWfQtdeOXpY
 xBxQ==
X-Gm-Message-State: AOAM531RNbLVJgt5X7OK6O5OJfbxdtt/m6k+yzLzOTQ/7oLioK1zxXZB
 0yB1nRNlXU5ngFJkVaBh1XXyQLOmosymhmcNbQ8=
X-Google-Smtp-Source: ABdhPJwT5ETyKLWcQ5k7xuhcbA0yvTD3jh/UbJMdE4jvWnM+tTSMk70pO5NvxTo6u5XWka0X6xtHA4gmLbXeWevGZoo=
X-Received: by 2002:a05:6102:b10:: with SMTP id
 b16mr5775448vst.41.1631287016565; 
 Fri, 10 Sep 2021 08:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <1627293835-17441-1-git-send-email-zheyuma97@gmail.com>
 <1627293835-17441-2-git-send-email-zheyuma97@gmail.com>
In-Reply-To: <1627293835-17441-2-git-send-email-zheyuma97@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Sep 2021 17:16:44 +0200
Message-ID: <CAMuHMdXB_HHgi1iPSnjusQvgdUYJDBwQc=+f+5vpmEjXBKArng@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] video: fbdev: asiliantfb: Error out if 'pixclock'
 equals zero
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: "Antonino A. Daplas" <adaplas@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>
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

Hi Zheyu,

On Mon, Jul 26, 2021 at 12:04 PM Zheyu Ma <zheyuma97@gmail.com> wrote:
> The userspace program could pass any values to the driver through
> ioctl() interface. If the driver doesn't check the value of 'pixclock',
> it may cause divide error.
>
> Fix this by checking whether 'pixclock' is zero first.
>
> The following log reveals it:
>
> [   43.861711] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> [   43.861737] CPU: 2 PID: 11764 Comm: i740 Not tainted 5.14.0-rc2-00513-gac532c9bbcfb-dirty #224
> [   43.861756] RIP: 0010:asiliantfb_check_var+0x4e/0x730
> [   43.861843] Call Trace:
> [   43.861848]  ? asiliantfb_remove+0x190/0x190
> [   43.861858]  fb_set_var+0x2e4/0xeb0
> [   43.861866]  ? fb_blank+0x1a0/0x1a0
> [   43.861873]  ? lock_acquire+0x1ef/0x530
> [   43.861884]  ? lock_release+0x810/0x810
> [   43.861892]  ? lock_is_held_type+0x100/0x140
> [   43.861903]  ? ___might_sleep+0x1ee/0x2d0
> [   43.861914]  ? __mutex_lock+0x620/0x1190
> [   43.861921]  ? do_fb_ioctl+0x313/0x700
> [   43.861929]  ? mutex_lock_io_nested+0xfa0/0xfa0
> [   43.861936]  ? __this_cpu_preempt_check+0x1d/0x30
> [   43.861944]  ? _raw_spin_unlock_irqrestore+0x46/0x60
> [   43.861952]  ? lockdep_hardirqs_on+0x59/0x100
> [   43.861959]  ? _raw_spin_unlock_irqrestore+0x46/0x60
> [   43.861967]  ? trace_hardirqs_on+0x6a/0x1c0
> [   43.861978]  do_fb_ioctl+0x31e/0x700
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Thanks for your patch!

> ---
> Changes in v2:
>     - Make commit log more descriptive
> ---
>  drivers/video/fbdev/asiliantfb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/video/fbdev/asiliantfb.c b/drivers/video/fbdev/asiliantfb.c
> index 3e006da47752..84c56f525889 100644
> --- a/drivers/video/fbdev/asiliantfb.c
> +++ b/drivers/video/fbdev/asiliantfb.c
> @@ -227,6 +227,9 @@ static int asiliantfb_check_var(struct fb_var_screeninfo *var,
>  {
>         unsigned long Ftarget, ratio, remainder;
>
> +       if (!var->pixclock)
> +               return -EINVAL;

While this fixes the crash, it is not correct: according to the
fbdev API, invalid values must be rounded up to a supported value,
if possible.  -EINVAL should only be returned if rounding up values
in fb_var_screeninfo cannot give a valid mode.

The same comment applies to the other patches in this series:
[PATCH v2 2/3] video: fbdev: kyro: Error out if 'pixclock' equals zero
[PATCH v2 3/3] video: fbdev: riva: Error out if 'pixclock' equals zero

> +
>         ratio = 1000000 / var->pixclock;
>         remainder = 1000000 % var->pixclock;
>         Ftarget = 1000000 * ratio + (1000000 * remainder) / var->pixclock;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
