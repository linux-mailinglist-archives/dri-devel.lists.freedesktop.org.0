Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C500D43AE04
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 10:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442886E450;
	Tue, 26 Oct 2021 08:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAFE6E450
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 08:30:29 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id s201so4382714vke.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 01:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ahLicdrMZ8Rl440uYSQXYfqc+SmHqq4WEC7k8rF9Ug=;
 b=q6enFpUkYFaaelISRETVCPLYj7cHhkbA1/yqVjwRKJTDYvxRyzs8G0asbfcfEu2Yvj
 r8MqEWEX4vrXvrTZlJV9Qnjouiw1Ts23XGSSYTLkyBFBIXLJJxagWCfDKalMjPFmIDeq
 MoXFfM/26eRMSESlqjycMSIOIZc/XUDoibTOg08IMCoyNa4SwVgpzIX9QWXAByMevmds
 vRUjJK5goLMf19JC/7bYRV+Kajvo+zGCwMikHO81eJBn0152ZffbwmG3LB32Qpqbz5v1
 O9/lCAwbAgKCIFCw+9vAriYSburS9hWg97kPjGxQJQpHg0vIRuxxd2/Dhyv3AHK8QBDa
 dXCw==
X-Gm-Message-State: AOAM531FoJDoKgA+9gSY+8j+95RX8UHBA98+VPpes378fIUmyTJtmI4q
 ux6oPpFm6Q8jUnd7WwrcdVvQTv15I7j4dg==
X-Google-Smtp-Source: ABdhPJxSXtqDbnMcXw3k5d4eCPZ0p+lawvsbo7RoC1aEOcaKZD072tFIY4PrTbbtjJwJYv2qjGv5wQ==
X-Received: by 2002:a1f:b64e:: with SMTP id g75mr21259097vkf.13.1635237027695; 
 Tue, 26 Oct 2021 01:30:27 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id i19sm4522044uat.13.2021.10.26.01.30.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 01:30:27 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id p23so14802759uaa.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 01:30:27 -0700 (PDT)
X-Received: by 2002:ab0:2bd2:: with SMTP id s18mr21259739uar.78.1635237026866; 
 Tue, 26 Oct 2021 01:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
 <YXcAbXJfg/jKCo5h@kroah.com> <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
In-Reply-To: <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Oct 2021 10:30:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcU7wy1dxa_MXuHoUTWebvq6ShP820Bn_v+8tx7-TEdg@mail.gmail.com>
Message-ID: <CAMuHMdWcU7wy1dxa_MXuHoUTWebvq6ShP820Bn_v+8tx7-TEdg@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: cirrusfb: check pixclock to avoid divide by
 zero
To: George Kennedy <george.kennedy@oracle.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
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

Hi George,

On Mon, Oct 25, 2021 at 9:37 PM George Kennedy
<george.kennedy@oracle.com> wrote:
> On 10/25/2021 3:07 PM, Greg KH wrote:
> > On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
> >> Do a sanity check on pixclock value before using it as a divisor.
> >>
> >> Syzkaller reported a divide error in cirrusfb_check_pixclock.
> >>
> >> divide error: 0000 [#1] SMP KASAN PTI
> >> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
> >> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
> >> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
> >>
> >> Call Trace:
> >>   fb_set_var+0x398/0xf90
> >>   do_fb_ioctl+0x4b8/0x6f0
> >>   fb_ioctl+0xeb/0x130
> >>   __x64_sys_ioctl+0x19d/0x220
> >>   do_syscall_64+0x3a/0x80
> >>   entry_SYSCALL_64_after_hwframe+0x44/0xae
> >>
> >> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> >> ---
> >>   drivers/video/fbdev/cirrusfb.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
> >> index 93802ab..099ddcb 100644
> >> --- a/drivers/video/fbdev/cirrusfb.c
> >> +++ b/drivers/video/fbdev/cirrusfb.c
> >> @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
> >>      struct cirrusfb_info *cinfo = info->par;
> >>      unsigned maxclockidx = var->bits_per_pixel >> 3;
> >>
> >> +    if (!var->pixclock)
> >> +            return -EINVAL;

This is not correct: fbdev drivers should round up invalid values,
and only return an error if rounding up cannot yield a valid value.

> > Shouldn't you be checking further up the call chain where this got set
> > to 0?
>
> The same pixclock check is done in these fb drivers:
>
> arch/arm/mach-rpc/include/mach/acornfb.h:    if (!var->pixclock)
> drivers/video/fbdev/asiliantfb.c:    if (!var->pixclock)
> drivers/video/fbdev/clps711x-fb.c:    if (!var->pixclock)
> drivers/video/fbdev/core/fbmon.c:    if (!var->pixclock)
> drivers/video/fbdev/core/modedb.c:    if (!var->pixclock)
> drivers/video/fbdev/cirrusfb.c:    if (!var->pixclock)
> drivers/video/fbdev/kyro/fbdev.c:    if (!var->pixclock)
> drivers/video/fbdev/riva/fbdev.c:    if (!var->pixclock)
> drivers/video/fbdev/uvesafb.c:    if (!var->pixclock)
>
> >
> > What logic allows this to be a valid value?  What about all other fb
> > drivers?
>
> The "check_var" function, which is set into the ".fb_check_var" element
> of the fb_ops struct, should do the check, but in the case of cirrusfb,
> that is not being done.
>
> All this patch does is add the same pixclock check that the other above
> fb drivers do.

Indeed, several drivers are not following the rounding rules.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
