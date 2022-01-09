Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 665304888A1
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 11:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521BD10E47A;
	Sun,  9 Jan 2022 10:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD5610E47A
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 10:02:35 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id n124so1817378vke.6
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 02:02:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDvAPw0xd5cx+5QwR7u2cboYnfSLEx7aiq6fPxnv/Dw=;
 b=R17pKl6xsF+00bfT6Sji4bHhjp+oZ1bAtMkaOL1rAq5oOZXn9aQSe4mHGYBufMs4sG
 HtGvqXUFv2HWNF/yKBIlFcil43VUTc/uO2KIuo0JM//guHUG3mLNRbd/jMXyPz3KyuiP
 SZcPiWNe2uXHfJ/V1uDAhuVd7h/Ud7LMty+fK6Z64DyRkcDSu1HhdUFLg0MDneAoucpG
 duj6BqWGRiM0RXN3E145yIfvhuDliJSCUdpl7v2gpIwr7Pp5z0EQtT0KLXhIXg+g6jIc
 NQYv8l3flnmH+LHnnHXTLk5sTKXNK0xgDfCpQDw2jsiVXG4vAkFmqraoZGHVdkwPOmCV
 EVbw==
X-Gm-Message-State: AOAM531z1bDplwLHkokutXKIrqfM7dhKFDsUjH8/fajwYg9o3n4ehuyV
 d7qJ9s7XR9+CtVI/HSZVbvM4RQzZ9NaJoQ==
X-Google-Smtp-Source: ABdhPJysDBSJ11lZJfm7xz945bxl3QLo769mreAZxAootJQejdjbXlUyEBVwOhzrzT64Dsxy/W6nig==
X-Received: by 2002:a05:6122:130a:: with SMTP id
 e10mr24476718vkp.26.1641722554094; 
 Sun, 09 Jan 2022 02:02:34 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id m25sm2280024vsl.34.2022.01.09.02.02.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 02:02:33 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id l15so7048540uai.11
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 02:02:33 -0800 (PST)
X-Received: by 2002:a67:e985:: with SMTP id b5mr16239vso.77.1641722553460;
 Sun, 09 Jan 2022 02:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20220107110723.323276-1-javierm@redhat.com>
 <20220107110723.323276-2-javierm@redhat.com>
In-Reply-To: <20220107110723.323276-2-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 9 Jan 2022 11:02:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXG3xOUrzOoRQVgpb4MmuQKJ1y3yPXv=p4AiNEohrzZug@mail.gmail.com>
Message-ID: <CAMuHMdXG3xOUrzOoRQVgpb4MmuQKJ1y3yPXv=p4AiNEohrzZug@mail.gmail.com>
Subject: Re: [PATCH 1/2] video: vga16fb: Fix logic that checks for the display
 standard
To: Javier Martinez Canillas <javierm@redhat.com>
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
 Kris Karas <bugs-a21@moonlit-rail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Jan 7, 2022 at 9:00 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The vga16fb framebuffer driver supports both Enhanced Graphics Adapter
> (EGA) and Video Graphics Array (VGA) 16 color graphic cards.
>
> But the logic to check whether the EGA or VGA standard are used is not
> correct. It just checks if screen_info.orig_video_isVGA is set, but it
> should check if is set to VIDEO_TYPE_VGAC instead.
>
> This means that it assumes to be VGA even if is set to VIDEO_TYPE_EGAC.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!

> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -1332,7 +1332,7 @@ static int vga16fb_probe(struct platform_device *dev)
>         printk(KERN_INFO "vga16fb: mapped to 0x%p\n", info->screen_base);
>         par = info->par;
>
> -       par->isVGA = screen_info.orig_video_isVGA;
> +       par->isVGA = screen_info.orig_video_isVGA == VIDEO_TYPE_VGAC;

All non-x86 architectures (except for 2 MIPS platforms) treat
orig_video_isVGA as a boolean flag, and just assign 1 to it.
Hence this change would break them.

>         par->palette_blanked = 0;
>         par->vesa_blanked = 0;
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
