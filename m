Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FA3562342
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC3212ACB3;
	Thu, 30 Jun 2022 19:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5103512ACB3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:37:00 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id t16so785330qvh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p6c5f2NCl92cN1Bu7KR0c/XkNY03WVgxoY3koBCNk38=;
 b=QLQ+3YfkdWgfT3pR/A8+uWHiwAIfE1GMGElhrDCe9SPw2NcrvHSbyZ6bDzB/qXvhrX
 CEAHtPvK9WAutaVCj+uPiG0Vt9l+oxJSm0zxIjc/zCacoOXJevbtQDRCvaKozOR3rx1R
 bNicILN8FrC8GZzac+U1wLkbfNCePJPNzaD9zvHY+F2BKnV2cY+mPDT1w11Y98ies2c0
 ETANvWhgWZyITfA0sykIjiqa5dQnbw03mwxRFVKTmWo6IG88iu2az1YYbHe0dj8jbUB8
 MeJalHo5g+V4AF4zsTBfi7RoMosdnXG/jApzlGxJeW91SHUJ3Jx+6RiV38qZMaAwIoa+
 fD0w==
X-Gm-Message-State: AJIora+c3kxu2XC+cPlisHmtFv8qou4r4cGpOpy+CISWvXOa3kV4tZns
 SL8GXtThnoqlVpY8IAubeq6z2mJuRgmb6w==
X-Google-Smtp-Source: AGRyM1uy5E2PcLLBJHk66A1Pr3VAVhIv/JCAPfQ8wwKeMYzNtVq+owzi266Q5n1HhyTCXuQefvSy4Q==
X-Received: by 2002:a05:6214:27e7:b0:471:c3cf:1490 with SMTP id
 jt7-20020a05621427e700b00471c3cf1490mr12865910qvb.13.1656617818892; 
 Thu, 30 Jun 2022 12:36:58 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 c19-20020a05622a059300b00304edcfa109sm14291456qtb.33.2022.06.30.12.36.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:36:58 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id q132so171584ybg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:36:58 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr11068429ybu.604.1656617818106; Thu, 30
 Jun 2022 12:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-3-deller@gmx.de>
 <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
 <0c418b7d-474a-3f93-a1fb-2f13c4d19941@gmx.de>
In-Reply-To: <0c418b7d-474a-3f93-a1fb-2f13c4d19941@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 21:36:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoMJ6CmiKDh4MW_b-7uoxEF+H6QimsA7SfcE5kjo17vw@mail.gmail.com>
Message-ID: <CAMuHMdUoMJ6CmiKDh4MW_b-7uoxEF+H6QimsA7SfcE5kjo17vw@mail.gmail.com>
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

On Thu, Jun 30, 2022 at 9:31 PM Helge Deller <deller@gmx.de> wrote:
> On 6/30/22 21:00, Geert Uytterhoeven wrote:
> > On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
> >> The virtual screen size can't be smaller than the physical screen size.
> >> Based on the general rule that we round up user-provided input if
> >> neccessary, adjust the virtual screen size as well if needed.
> >>
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >> Cc: stable@vger.kernel.org # v5.4+
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/video/fbdev/core/fbmem.c
> >> +++ b/drivers/video/fbdev/core/fbmem.c
> >> @@ -1106,6 +1106,11 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> >>                         return -EFAULT;
> >>                 console_lock();
> >>                 lock_fb_info(info);
> >> +               /* adjust virtual screen size if user missed it */
> >> +               if (var.xres_virtual < var.xres)
> >> +                       var.xres_virtual = var.xres;
> >> +               if (var.yres_virtual < var.yres)
> >> +                       var.yres_virtual = var.yres;
> >>                 ret = fb_set_var(info, &var);
> >>                 if (!ret)
> >>                         fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
> >
> > Given "[PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
> > fb_set_var", I don't think we need this patch.
>
> We do.

Why? It will be caught by [PATCH 4/5].

> > Moreover, this
> > patch will prevent triggering the WARN_ON()s in [PATCH 4/5]
>
> Right.
>
> > in the most common buggy case of drivers plainly ignoring var.[xy]res_virtual.
>
> In summary:
> This patch #2 is fixing up user-space invalid input and is not
> allowed to trigger any WARN_ON().

It's the responsibility of the driver to at least look at its parameters.
What other invalid values might it let pass, that we cannot catch
at the generic level?

> We could drop patch #4, but then we wouldn't catch bad drivers.

I do want to keep patch #4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
