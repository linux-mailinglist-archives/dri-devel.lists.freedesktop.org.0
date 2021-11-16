Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FCA452E49
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EEC6E138;
	Tue, 16 Nov 2021 09:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F476E138
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:44:12 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id o1so8194369uap.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 01:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QboxZaD2WJSCfrRwQW0wjmUeNXv+y+DA5Jn72gGB79E=;
 b=ul+WUaAypZCWE+DFm8PnSSffvdYAHDIpN36pPOojowbWqFySTM28q8WZicBANexXem
 X1WN9Rpsx02ueJgIjuUss846i4tyRZlPBXQ+ST66c4GjHzanIYNCYtzGeQwS+o2DbSBQ
 8qjH5FrnUIczakJ8eS6ZCbDk73kLapBEJfYa277rkj3d/ln7yn83AG+Yme4GWgcg1Beo
 YamE07YoXzf1ICvy8NI9vt/g8FH+06ciVPyA6jbHKnYaqlQJrG/20kVhYH1sCfgtvKhy
 g3xpt/WR/bo9bJUPoTb39OfZN9xqSSjs40AU9xmiawpOaoxfSOi6TCNqGVR2R1RSKEzV
 7+eQ==
X-Gm-Message-State: AOAM531T8MdPXKFEx0jMs3CWO7gkfJZmxQp0ZHxhNV/3xVOd+5L6C0yg
 O5mH+EVkDXNI6zpZysI0hnZlfPbYXed1SA==
X-Google-Smtp-Source: ABdhPJzJ9ypyiCdj4UCfkEdhY7RcseGR6hBtTMuU+FGTGYpXcY26F03R3rFLv3bBwkkNNJ5DnH9SVQ==
X-Received: by 2002:a05:6102:6c4:: with SMTP id
 m4mr53032990vsg.20.1637055851531; 
 Tue, 16 Nov 2021 01:44:11 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id e13sm9834404vkd.21.2021.11.16.01.44.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 01:44:11 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id b192so10825912vkf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 01:44:10 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id
 x14mr71391026vko.7.1637055850664; 
 Tue, 16 Nov 2021 01:44:10 -0800 (PST)
MIME-Version: 1.0
References: <20211111111120.1344613-1-javierm@redhat.com>
 <CAMuHMdWA2V_KDpcpMw3yRKmN+6YDjmysJoz6D-6JjJs-3+XYTQ@mail.gmail.com>
 <579a584a-68af-d5c9-0547-30cb1592d46f@redhat.com>
In-Reply-To: <579a584a-68af-d5c9-0547-30cb1592d46f@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Nov 2021 10:43:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWotEN1TtTr7douLkQPkpXE-rQgamM3GOYO1XNHbUiguw@mail.gmail.com>
Message-ID: <CAMuHMdWotEN1TtTr7douLkQPkpXE-rQgamM3GOYO1XNHbUiguw@mail.gmail.com>
Subject: Re: [PATCH v2] fbdev: Prevent probing generic drivers if a FB is
 already registered
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
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Nov 16, 2021 at 10:30 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 11/15/21 17:20, Geert Uytterhoeven wrote:
> >> @@ -351,6 +351,17 @@ static int efifb_probe(struct platform_device *dev)
> >>         char *option = NULL;
> >>         efi_memory_desc_t md;
> >>
> >> +       /*
> >> +        * Generic drivers must not be registered if a framebuffer exists.
> >> +        * If a native driver was probed, the display hardware was already
> >> +        * taken and attempting to use the system framebuffer is dangerous.
> >> +        */
> >> +       if (num_registered_fb > 0) {
> >
> > Who says this registered fbdev is driving the same hardware as efifb?
> > This might be e.g. a small external display connected to i2c or spi.
> >
> >> +               dev_err(&dev->dev,
> >> +                       "efifb: a framebuffer is already registered\n");
> >> +               return -EINVAL;
> >> +       }
> >> +
>
> That's true, although I wonder if the {efi,simple}fb drivers should even be
> probed in that case. As I see it, these are always a best effort that are
> only useful for earlycon or if there isn't another display driver supported.
>
> Since there may be other conditions needed in order for these to work. For
> example, when using the u-boot EFI stub in most cases the unused clocks and
> power domains can't be gated or otherwise the firmware frame buffer could go
> away (e.g: will need to boot with "clk_ignore_unused" and "pd_ignore_unused").
>
> Same for the simplefb driver, if the DT node is missing resources that are
> needed by the display controller to continue working (clocks, regulators,
> power domains), the firmware setup framebuffer will go away at some point.
>
> So this is already a fragile solution and $SUBJECT doesn't make things worse
> IMO. Since not having something like this can lead to issues as reported by:
>
> https://lore.kernel.org/all/20211110200253.rfudkt3edbd3nsyj@lahvuun/
>
> We could probably do some smarter here by providing a function that checks
> if the registered fbdev drivers matches the aperture base. But I'm unsure
> if that's worth it. After all, fbdev drivers are likely to be disabled by
> most distros soon now that we have the simpledrm driver.

Checking the aperture base is what was done in all other cases of
preventing generic (fbdev) drivers from stepping on specific drivers'
toes...

But as you're only impacting efifb and simplefb, thus not crippling
generic fbdev support, I don't care that much.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
