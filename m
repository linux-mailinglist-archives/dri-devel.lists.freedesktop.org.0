Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611D4569D29
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640E211A14E;
	Thu,  7 Jul 2022 08:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9D911A14E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 08:20:45 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id z7so12812687qko.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 01:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WgXInV/talyaexy4ODdv5tDP4fWPK6BLCSeFlqnzgQQ=;
 b=E4vlzC/gCk0ezNiVueG7doIkuE/3vpVEnl/Onu5PmEFZmvZXNN+Ip+Sg13QsRlaAXN
 6ScSF0kWBMAvipXrtri6Z9IrlCgNqqX6WBSm37L/ppKpHqZkxAbABc/2+2De5EVfP7y3
 vQnnkytDYSgTOp91Ny72lNKDqXv2vTSMjtX99ieEL56/LkjWFlF6hxi1FZgGpyanjkAY
 Yj/lKbwRxXwM/tZ0f3EVU00WsEomeeRRd+3RRs0Y84n3PimCfAI0ddkmOjN4sCkTY0/m
 VS1P1iyOgOjMI0ehzPnPz2GiuON3fZc9zneQ/tI9aZ4NKgqPthXnsBcZjnFaE1C58qSx
 377Q==
X-Gm-Message-State: AJIora9xVmj7iT8lwMGQlv8eFMVKp49NP+9xLtBiKSYGtvCEas06FoEu
 vfwuT+iVMVGE0gGG9pzFdwK6b4ykfF+Nchx8
X-Google-Smtp-Source: AGRyM1v1KnYMsPF587BzgA+SHuSRoNFYRum2uJgSkAVBnig+loc4ph83TEgA8UXlElsa5JdyhIdtVQ==
X-Received: by 2002:a05:620a:2491:b0:6af:265d:72d6 with SMTP id
 i17-20020a05620a249100b006af265d72d6mr31003568qkn.335.1657182043169; 
 Thu, 07 Jul 2022 01:20:43 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 142-20020a370994000000b006a73cb957dasm29959635qkj.20.2022.07.07.01.20.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 01:20:42 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id y195so44781yby.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 01:20:42 -0700 (PDT)
X-Received: by 2002:a05:6902:50e:b0:66e:7f55:7a66 with SMTP id
 x14-20020a056902050e00b0066e7f557a66mr11990868ybs.365.1657182042336; Thu, 07
 Jul 2022 01:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220706150253.2186-1-deller@gmx.de>
 <20220706150253.2186-4-deller@gmx.de>
In-Reply-To: <20220706150253.2186-4-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Jul 2022 10:20:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBOKwtVabCrvsFXi-9Yz=Rnwhn4MDmxxBwA6QOuFyZ6w@mail.gmail.com>
Message-ID: <CAMuHMdWBOKwtVabCrvsFXi-9Yz=Rnwhn4MDmxxBwA6QOuFyZ6w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] fbmem: Check virtual screen sizes in fb_set_var()
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

On Wed, Jul 6, 2022 at 5:02 PM Helge Deller <deller@gmx.de> wrote:
> Verify that the fbdev or drm driver correctly adjusted the virtual
> screen sizes. On failure report the failing driver and reject the screen
> size change.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1016,6 +1016,17 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>         if (ret)
>                 return ret;
>
> +       /* verify that virtual resolution >= physical resolution */
> +       if (var->xres_virtual < var->xres ||
> +           var->yres_virtual < var->yres) {
> +               pr_warn("WARNING: fbcon: Driver '%s' missed to adjust virtual"
> +                       " screen size (%dx%d vs. %dx%d)\n",

%ux%u cs. %ux%u

Please don't split messages, for easier grepping.

> +                       info->fix.id,
> +                       var->xres_virtual, var->yres_virtual,
> +                       var->xres, var->yres);
> +               return -EINVAL;
> +       }
> +
>         if ((var->activate & FB_ACTIVATE_MASK) != FB_ACTIVATE_NOW)
>                 return 0;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
