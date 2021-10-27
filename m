Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD943C357
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 08:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545C089C3B;
	Wed, 27 Oct 2021 06:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2C389C37
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 06:54:06 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id z22so662760uaq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uHeQsCzj+NuIoaUijS+BqVs1TYH9sOv+TDs8LySkQvc=;
 b=0llaMyt0bufMSX58GVIaytM7wZOQTsyZNXywPLdKO+1T4BOTXkJMAhIgsB2obz8LOM
 C8JbKsw+L0lcd/m8HEu4HJnLgVnV9YHphY311iat+KfQYClcL5SosdBF4kkcSOXcKgc3
 7e09YYXyWWKHWZWxYHuHEPMe0X3O/xt4puHrJ8yqNsSzuuIbuQ6HFipC8P9mo+fVBqzZ
 7C+rXDBcY0eaie5Xe3pPq3IzSONDyP/nH916RYyc+6b7EtZHk/RB2ycMOaIypJD6OH+i
 7yeEGPrnWdrEUKdni7R2kBOlZ7QPbNBAa2c0r/GoFMJqRP9J6Q1vzyaz8+z1tSreol5h
 IDhA==
X-Gm-Message-State: AOAM530j3ZMhedNRJ0/IHh6DWfSmhqcdrmdGDz+B/GK+cAPazPypJ2/w
 PvnPaMjd7ZSv0Te6MSooWiaWxv7QgRRfsw==
X-Google-Smtp-Source: ABdhPJx4q12aRtEoFVe7LsK2DiZUMHb9XmMS6g4RsD+GNcOiH4VcnsIqPLS9zW4UbwWLX+RiKsV8GQ==
X-Received: by 2002:a05:6102:143:: with SMTP id
 a3mr15578667vsr.5.1635317645296; 
 Tue, 26 Oct 2021 23:54:05 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id m15sm11142530vsh.31.2021.10.26.23.54.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 23:54:04 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id z22so662684uaq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:54:04 -0700 (PDT)
X-Received: by 2002:ab0:2bd2:: with SMTP id s18mr28311148uar.78.1635317644217; 
 Tue, 26 Oct 2021 23:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
 <YXcAbXJfg/jKCo5h@kroah.com> <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
 <CAMuHMdWcU7wy1dxa_MXuHoUTWebvq6ShP820Bn_v+8tx7-TEdg@mail.gmail.com>
 <c73402dd-ec3f-4df7-6a16-36fb276a50f4@oracle.com>
 <CAMuHMdVHt=9N274SG+B7W83JbVVnbz_U5Nkejs_PR2HqvZvJgQ@mail.gmail.com>
 <d2119d59-89e4-34aa-86df-38fee2a0c6ef@oracle.com>
 <CAMuHMdUZq00r7QYeAKGm36UKpGwH_uEGMvwHBzRi9_nxV-dRhg@mail.gmail.com>
 <4cf6a155-85b7-649b-066d-e56da87dc8fd@oracle.com>
In-Reply-To: <4cf6a155-85b7-649b-066d-e56da87dc8fd@oracle.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Oct 2021 08:53:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJ=92S9Ds66cYZO+96THsOkz-jjYPWUgsJ6oRibEMoCA@mail.gmail.com>
Message-ID: <CAMuHMdVJ=92S9Ds66cYZO+96THsOkz-jjYPWUgsJ6oRibEMoCA@mail.gmail.com>
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

On Wed, Oct 27, 2021 at 3:13 AM George Kennedy
<george.kennedy@oracle.com> wrote:
> On 10/26/2021 1:12 PM, Geert Uytterhoeven wrote:
> > On Tue, Oct 26, 2021 at 5:48 PM George Kennedy
> > <george.kennedy@oracle.com> wrote:
> >> On 10/26/2021 10:11 AM, Geert Uytterhoeven wrote:
> >>> On Tue, Oct 26, 2021 at 3:38 PM George Kennedy
> >>> <george.kennedy@oracle.com> wrote:
> >>>> On 10/26/2021 4:30 AM, Geert Uytterhoeven wrote:
> >>>>> On Mon, Oct 25, 2021 at 9:37 PM George Kennedy
> >>>>> <george.kennedy@oracle.com> wrote:
> >>>>>> On 10/25/2021 3:07 PM, Greg KH wrote:
> >>>>>>> On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
> >>>>>>>> Do a sanity check on pixclock value before using it as a divisor.
> >>>>>>>>
> >>>>>>>> Syzkaller reported a divide error in cirrusfb_check_pixclock.
> >>>>>>>>
> >>>>>>>> divide error: 0000 [#1] SMP KASAN PTI
> >>>>>>>> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
> >>>>>>>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
> >>>>>>>> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
> >>>>>>>>
> >>>>>>>> Call Trace:
> >>>>>>>>      fb_set_var+0x398/0xf90
> >>>>>>>>      do_fb_ioctl+0x4b8/0x6f0
> >>>>>>>>      fb_ioctl+0xeb/0x130
> >>>>>>>>      __x64_sys_ioctl+0x19d/0x220
> >>>>>>>>      do_syscall_64+0x3a/0x80
> >>>>>>>>      entry_SYSCALL_64_after_hwframe+0x44/0xae
> >>>>>>>>
> >>>>>>>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> >>>>>>>> --- a/drivers/video/fbdev/cirrusfb.c
> >>>>>>>> +++ b/drivers/video/fbdev/cirrusfb.c
> >>>>>>>> @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
> >>>>>>>>         struct cirrusfb_info *cinfo = info->par;
> >>>>>>>>         unsigned maxclockidx = var->bits_per_pixel >> 3;
> >>>>>>>>
> >>>>>>>> +    if (!var->pixclock)
> >>>>>>>> +            return -EINVAL;
> >>>>> This is not correct: fbdev drivers should round up invalid values,
> >>>>> and only return an error if rounding up cannot yield a valid value.
> >>>> What default value would you recommend? Here are examples of some of the
> >>>> possible cirrusfb pixclock values:
> >>>> 40000: 25MHz
> >>>> 20000: 50Mhz
> >>>> 12500: 80Mhz
> >>> You should pick the lowest supported value.
> >> In bestclock() the frequency value ("freq") is not allowed to go below 8000.
> >>
> >>           if (freq < 8000)
> >>                   freq = 8000;
> >>
> >> If pixclock is passed in as zero to cirrusfb_check_pixclock(), is it ok
> >> to then set the value of pixclock to 125000, which will result in "freq"
> >> being set to 8000 (or adjust the passed in pixclock value to make sure
> >> "freq" does not get below 8000)?
> > No, clock rate is the inverse of clock period.
> > So the smallest clock period (fb_var_screeninfo.pixclock) corresponds
> > to the largest clock rate (freq in bestclock()).
>
> How about this?
>
> This gets the frequency derived from pixclock to maxclock or rounds up
> pixclock to get the frequency as close to maxclock as possible.
>
> diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
> index 93802ab..2e8e620 100644
> --- a/drivers/video/fbdev/cirrusfb.c
> +++ b/drivers/video/fbdev/cirrusfb.c
> @@ -620,6 +620,18 @@ static int cirrusfb_check_var(struct
> fb_var_screeninfo *var,
>                  return -EINVAL;
>          }
>
> +       if (!var->pixclock) {
> +               long maxclock;
> +               unsigned maxclockidx = var->bits_per_pixel >> 3;
> +
> +               maxclock =
> cirrusfb_board_info[cinfo->btype].maxclock[maxclockidx];
> +
> +               var->pixclock = KHZ2PICOS(maxclock);
> +               while (PICOS2KHZ(var->pixclock) > maxclock) {
> +                       var->pixclock++;
> +               }
> +       }
> +
>          if (cirrusfb_check_pixclock(var, info))
>                  return -EINVAL;
>
> The work can't be done in cirrusfb_check_pixclock() as var->pixclock is
> read-only because "var" is "const struct fb_var_screeninfo *var".

Perhaps the const should be dropped from the var parameter, so the
rounding can be done in the function where it makes most sense,
and where most of the above operations are already done?

Then, you can simplify:

-        freq = PICOS2KHZ(var->pixclock);
+        freq = PICOS2KHZ(var->pixclock ? : 1);

and change the "if (freq > maxclock) return -EINVAL" to use maxclock
instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
