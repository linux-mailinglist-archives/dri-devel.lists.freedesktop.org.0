Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D13543B3B5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 16:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4DC6E53E;
	Tue, 26 Oct 2021 14:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAF46E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 14:12:02 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id f4so29371763uad.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 07:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CRfQV5P44DJIIjFOVODNH7vxAWsLcKoctro6Rd4M6L0=;
 b=oGp/MprP9mZ4iikXjgNiV0NhdLIDWTD1CuoYQFLyWFHGfEd605yT/CQKltLggwL0Ki
 99r/fNo5L8RMNWN6ol6uafrYxByZ0MRYTHXIz+IVwLrYidsx6POI6Bl840TRVOilRSNQ
 xLwhHpyvlpA6ONbtRCMpETQZZbdJwGyqYb0gYjHEVW7khJssvk46boE5wjGVd8NYZHCz
 V+47eTaqaPiMNi+kxCNiiTBFWTKjm9V4cF165WqnTbF5MYT4faT7JXpyUoCmjr8khR80
 MHcQ/rq7l8xo5wDDh61/H3AbxUMc6zgxjtcc5z4qySdmSiyvJZWgPwl0209CrwlEitF/
 rITg==
X-Gm-Message-State: AOAM530gxfxa06Qr299dOJs0FzgezH2i3N0Z8zhwPq8Iu8Zpw7YoGvej
 3RHIMN+50IGxcI45TmF3gWgOISszAfOdnw==
X-Google-Smtp-Source: ABdhPJx5G+dVRAId1y0M/oSMSi1OnF4c8CnxmxQkNm9CENt8YLY3Oca1llTi9h7dXu3OMOujVt8gdw==
X-Received: by 2002:a67:e1cd:: with SMTP id p13mr23864653vsl.29.1635257520926; 
 Tue, 26 Oct 2021 07:12:00 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id m186sm4294426vsm.11.2021.10.26.07.12.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 07:12:00 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id o64so2234576vke.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 07:12:00 -0700 (PDT)
X-Received: by 2002:a1f:1604:: with SMTP id 4mr22564190vkw.11.1635257520204;
 Tue, 26 Oct 2021 07:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
 <YXcAbXJfg/jKCo5h@kroah.com> <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
 <CAMuHMdWcU7wy1dxa_MXuHoUTWebvq6ShP820Bn_v+8tx7-TEdg@mail.gmail.com>
 <c73402dd-ec3f-4df7-6a16-36fb276a50f4@oracle.com>
In-Reply-To: <c73402dd-ec3f-4df7-6a16-36fb276a50f4@oracle.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Oct 2021 16:11:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHt=9N274SG+B7W83JbVVnbz_U5Nkejs_PR2HqvZvJgQ@mail.gmail.com>
Message-ID: <CAMuHMdVHt=9N274SG+B7W83JbVVnbz_U5Nkejs_PR2HqvZvJgQ@mail.gmail.com>
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

On Tue, Oct 26, 2021 at 3:38 PM George Kennedy
<george.kennedy@oracle.com> wrote:
> On 10/26/2021 4:30 AM, Geert Uytterhoeven wrote:
> > On Mon, Oct 25, 2021 at 9:37 PM George Kennedy
> > <george.kennedy@oracle.com> wrote:
> >> On 10/25/2021 3:07 PM, Greg KH wrote:
> >>> On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
> >>>> Do a sanity check on pixclock value before using it as a divisor.
> >>>>
> >>>> Syzkaller reported a divide error in cirrusfb_check_pixclock.
> >>>>
> >>>> divide error: 0000 [#1] SMP KASAN PTI
> >>>> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
> >>>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
> >>>> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
> >>>>
> >>>> Call Trace:
> >>>>    fb_set_var+0x398/0xf90
> >>>>    do_fb_ioctl+0x4b8/0x6f0
> >>>>    fb_ioctl+0xeb/0x130
> >>>>    __x64_sys_ioctl+0x19d/0x220
> >>>>    do_syscall_64+0x3a/0x80
> >>>>    entry_SYSCALL_64_after_hwframe+0x44/0xae
> >>>>
> >>>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>

> >>>> --- a/drivers/video/fbdev/cirrusfb.c
> >>>> +++ b/drivers/video/fbdev/cirrusfb.c
> >>>> @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
> >>>>       struct cirrusfb_info *cinfo = info->par;
> >>>>       unsigned maxclockidx = var->bits_per_pixel >> 3;
> >>>>
> >>>> +    if (!var->pixclock)
> >>>> +            return -EINVAL;
> > This is not correct: fbdev drivers should round up invalid values,
> > and only return an error if rounding up cannot yield a valid value.
>
> What default value would you recommend? Here are examples of some of the
> possible cirrusfb pixclock values:
> 40000: 25MHz
> 20000: 50Mhz
> 12500: 80Mhz

You should pick the lowest supported value.

> We can plug in a default value, but I believe it is just covering up the
> fact that an incorrect value has been copied in.

Passing zero is not incorrect.  The driver is supposed to round it
up to a valid value.

> I would think we would want to keep this driver consistent with the
> other fb drivers that return failure with the incorrect value.

I disagree: non-conformant behavior should be fixed, not copied.

> >>> Shouldn't you be checking further up the call chain where this got set
> >>> to 0?
> >> The same pixclock check is done in these fb drivers:
> >>
> >> arch/arm/mach-rpc/include/mach/acornfb.h:    if (!var->pixclock)
> >> drivers/video/fbdev/asiliantfb.c:    if (!var->pixclock)
> >> drivers/video/fbdev/clps711x-fb.c:    if (!var->pixclock)
> >> drivers/video/fbdev/core/fbmon.c:    if (!var->pixclock)
> >> drivers/video/fbdev/core/modedb.c:    if (!var->pixclock)
> >> drivers/video/fbdev/cirrusfb.c:    if (!var->pixclock)
> >> drivers/video/fbdev/kyro/fbdev.c:    if (!var->pixclock)
> >> drivers/video/fbdev/riva/fbdev.c:    if (!var->pixclock)
> >> drivers/video/fbdev/uvesafb.c:    if (!var->pixclock)
> >>
> >>> What logic allows this to be a valid value?  What about all other fb
> >>> drivers?
> >> The "check_var" function, which is set into the ".fb_check_var" element
> >> of the fb_ops struct, should do the check, but in the case of cirrusfb,
> >> that is not being done.
> >>
> >> All this patch does is add the same pixclock check that the other above
> >> fb drivers do.
> > Indeed, several drivers are not following the rounding rules.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
