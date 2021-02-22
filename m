Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6252321127
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 08:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58A86E904;
	Mon, 22 Feb 2021 07:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BFF6E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 07:08:33 +0000 (UTC)
Received: from mail-lj1-f200.google.com ([209.85.208.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1lE5KZ-0006Bi-N4
 for dri-devel@lists.freedesktop.org; Mon, 22 Feb 2021 07:08:31 +0000
Received: by mail-lj1-f200.google.com with SMTP id 19so12208159ljq.13
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 23:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xQb/U05beEqXDSOnU2R2gxKRYcy1C5Xug7vclRhtUZo=;
 b=UZmhQ+wYQEkOMiBTtFqBucl5ewOLQxeRD6rKK3bgjLTPtn6I6kKcVGUzJQy4Dt6fzE
 13lI1U00bRtK6HMILMIfes3+WdiJ2r0nDXZzhMQ0TjLWiUcJL1MghXVGI5AyrdA91Pzj
 cVAmd0mm9ORJUJK1WFcO7EboxaZL/gpJHsu4YN5bZTkwWM1ExZJBPjO2/5MdgacCuY/x
 nh9mEvsqTMVdZw3XMHidcwFg3e3n7T55RcVG6CQKG/8i1Cb1fgCkDjUEzhsDkgPiodai
 VdFZwwcgiJMt90pPdWL5nCwySGcYcS5z2o5BDhQYULOyhXMoK2aE0KQMQttLFONV9HKD
 m0VA==
X-Gm-Message-State: AOAM533a3bwLfVjyYnMlz5rYX+/H8V0j6SchUToTuk4ZDFkEhINPypjF
 NBbajJSOXN06SvfpyO8jClwPibVE0qZmS8Gbtp3vaXdj8dqcJZNxnIVJrl2C4ByalHF254oW+bB
 xicSPHbcX7co1CfodWIz/3iLs8ZX8f5f1GN3VNkZpWZwSIEJm3Jvx691HfS2N9g==
X-Received: by 2002:a05:6512:b1b:: with SMTP id
 w27mr12697027lfu.10.1613977711158; 
 Sun, 21 Feb 2021 23:08:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmwJFwD2hfSbm4znFNjHvhOMUpClGNSy8bAWfw5K3mLGPr7XuvEwm2N8RU7BjYzrcSZSXdCO0BDnrFKhpgUyk=
X-Received: by 2002:a05:6512:b1b:: with SMTP id
 w27mr12697017lfu.10.1613977710921; 
 Sun, 21 Feb 2021 23:08:30 -0800 (PST)
MIME-Version: 1.0
References: <20210129084327.986630-1-kai.heng.feng@canonical.com>
 <CADnq5_MduzcezmAjEGK0X7bDiY98f68s8roXc6gOTWjcpNC9Rw@mail.gmail.com>
In-Reply-To: <CADnq5_MduzcezmAjEGK0X7bDiY98f68s8roXc6gOTWjcpNC9Rw@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 22 Feb 2021 15:08:19 +0800
Message-ID: <CAAd53p4y+A5Bv4nUKZw+kzrmxcYm8DXrY06QqkU4iopj0dRrzw@mail.gmail.com>
Subject: Re: [PATCH] efifb: Ensure graphics device for efifb stays at PCI D0
To: pjones@redhat.com
X-Mailman-Approved-At: Mon, 22 Feb 2021 07:09:16 +0000
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 1, 2021 at 11:21 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Sat, Jan 30, 2021 at 6:27 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > We are seeing root ports on some desktop boards support D3cold for
> > discrete graphics card. So when efifb is in use while graphics device
> > isn't bound to a driver, PCI and ACPI will put the graphics to D3cold
> > when runtime suspend kicks in, makes efifb stop working.
> >
> > So ensure the graphics device won't be runtime suspended, to keep efifb
> > work all the time.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

A gentle ping...

>
> > ---
> >  drivers/video/fbdev/efifb.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> > index e57c00824965..19edd7206409 100644
> > --- a/drivers/video/fbdev/efifb.c
> > +++ b/drivers/video/fbdev/efifb.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/printk.h>
> >  #include <linux/screen_info.h>
> > +#include <linux/pm_runtime.h>
> >  #include <video/vga.h>
> >  #include <asm/efi.h>
> >  #include <drm/drm_utils.h> /* For drm_get_panel_orientation_quirk */
> > @@ -575,6 +576,7 @@ static int efifb_probe(struct platform_device *dev)
> >                 goto err_fb_dealoc;
> >         }
> >         fb_info(info, "%s frame buffer device\n", info->fix.id);
> > +       pm_runtime_get_sync(&efifb_pci_dev->dev);
> >         return 0;
> >
> >  err_fb_dealoc:
> > @@ -601,6 +603,7 @@ static int efifb_remove(struct platform_device *pdev)
> >         unregister_framebuffer(info);
> >         sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
> >         framebuffer_release(info);
> > +       pm_runtime_put(&efifb_pci_dev->dev);
> >
> >         return 0;
> >  }
> > --
> > 2.29.2
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
