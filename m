Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE225623B5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6020312B00B;
	Thu, 30 Jun 2022 20:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D8F12B010
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:00:26 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id n10so28763qkn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 13:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/Z/fowSl/l3Fs0mK7uiWWNdhRxBZYpUZvpWJxYSlOo=;
 b=NO8ebkyXbRtyWZN12KIsJfcxPPRPAhosKQMyvE45iQelLe/lT+pK0d1Iuq7Z0gBD1h
 fYgFOKo211IhjwlOKTjcd4IcvRNQl5T+kaTvHyl9C0OKAzrdTboIH4wwUETJtbDQXIhW
 ej5CU6IQF4mHAXX89361xdKQrR/8Xg2q68F5rWHRxWBX9UVbCfMlcrLVatwA7eIkp0k6
 WBallLEMdxZUKzzv8K8ZTXbBzLzfHZOdQoPA6DVE0DQ6avz4gkYMbRx8WWZlQllCua08
 MtIkcg5YvvTb8ww01keJrsTprDes9JhQeLHZXypdBsFvy/x2V2RCMlRV+TgTatkfZx/v
 /UQA==
X-Gm-Message-State: AJIora90rDzu6Kb59Hyc6ADJEPQh8NQwJoFRkPrw+0DESAl5smHAqTvY
 kHVoY2eEoMV8OOTTUQbgDGlKh6zv5O9rvA==
X-Google-Smtp-Source: AGRyM1sSgB0TEodBa8SmPJvHxobIyg515VYQTJf5SePDILOO4elEf+w/olrF1iRbpF9apdatoinQig==
X-Received: by 2002:a05:620a:4547:b0:6b1:4f80:d5a8 with SMTP id
 u7-20020a05620a454700b006b14f80d5a8mr6912090qkp.87.1656619224960; 
 Thu, 30 Jun 2022 13:00:24 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 ay37-20020a05620a17a500b006af0d99c7fesm5233980qkb.132.2022.06.30.13.00.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 13:00:24 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-317741c86fdso4173787b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 13:00:24 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr12479126ywd.283.1656619224368; Thu, 30
 Jun 2022 13:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-3-deller@gmx.de>
 <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
 <0c418b7d-474a-3f93-a1fb-2f13c4d19941@gmx.de>
 <CAMuHMdUoMJ6CmiKDh4MW_b-7uoxEF+H6QimsA7SfcE5kjo17vw@mail.gmail.com>
 <d57655b2-44d1-4083-c4e9-ef4f004f2b64@gmx.de>
In-Reply-To: <d57655b2-44d1-4083-c4e9-ef4f004f2b64@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 22:00:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXk9Kz4-pv7-M9tufj-pruhOZWw_b51fegkr2JSqzL65g@mail.gmail.com>
Message-ID: <CAMuHMdXk9Kz4-pv7-M9tufj-pruhOZWw_b51fegkr2JSqzL65g@mail.gmail.com>
Subject: Re: [PATCH 2/5] fbcon: Fix up user-provided virtual screen size
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

On Thu, Jun 30, 2022 at 9:46 PM Helge Deller <deller@gmx.de> wrote:
> On 6/30/22 21:36, Geert Uytterhoeven wrote:
> > On Thu, Jun 30, 2022 at 9:31 PM Helge Deller <deller@gmx.de> wrote:
> >> On 6/30/22 21:00, Geert Uytterhoeven wrote:
> >>> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
> >>>> The virtual screen size can't be smaller than the physical screen size.
> >>>> Based on the general rule that we round up user-provided input if
> >>>> neccessary, adjust the virtual screen size as well if needed.
> >>>>
> >>>> Signed-off-by: Helge Deller <deller@gmx.de>
> >>>> Cc: stable@vger.kernel.org # v5.4+
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- a/drivers/video/fbdev/core/fbmem.c
> >>>> +++ b/drivers/video/fbdev/core/fbmem.c
> >>>> @@ -1106,6 +1106,11 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> >>>>                         return -EFAULT;
> >>>>                 console_lock();
> >>>>                 lock_fb_info(info);
> >>>> +               /* adjust virtual screen size if user missed it */
> >>>> +               if (var.xres_virtual < var.xres)
> >>>> +                       var.xres_virtual = var.xres;
> >>>> +               if (var.yres_virtual < var.yres)
> >>>> +                       var.yres_virtual = var.yres;
> >>>>                 ret = fb_set_var(info, &var);
> >>>>                 if (!ret)
> >>>>                         fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
> >>>
> >>> Given "[PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
> >>> fb_set_var", I don't think we need this patch.
> >>
> >> We do.
> >
> > Why? It will be caught by [PATCH 4/5].
>
> Right, it will be caught by patch #4.
> But if you drop this part, then everytime a user runs
>         fbset -xres 800 -yres 600 -xvres 200
> users will get the KERNEL BUG WARNING (from patch #4) including
> a kernel backtrace in their syslogs.

No, they will only see that warning if they are using a broken fbdev
driver that implements .fb_check_var(), but fails to validate or
update the passed geometry.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
