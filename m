Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D19D3653C7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490A26E44D;
	Tue, 20 Apr 2021 08:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57FE6E44D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:12:40 +0000 (UTC)
Received: from mail-lj1-f198.google.com ([209.85.208.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1lYlUs-0001f7-W2
 for dri-devel@lists.freedesktop.org; Tue, 20 Apr 2021 08:12:39 +0000
Received: by mail-lj1-f198.google.com with SMTP id
 z9-20020a2e88490000b02900b896c98249so7117727ljj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 01:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IV9Eebskso7YyD0zMzspoNTbhY3LJpAmQOuTJ1c9y40=;
 b=eh6NhWfXgTeNs9etUHFlCIywz1awp86+qveHNNCDGNsxxPLtJQqjIzm4re1cBmXfZO
 m8OeUvV5O2qyEOoezLU20wvHpYCrc7vk4dc9EzhxftUihKnPZWiTI3QAaULOX0+bY5vp
 /o0jg7Yd2X1uB65qEt0BdS9eLxgo7EuyMSSNqpn1PrZ0uLLrsc+0BBrVRJztBt3Ti3wX
 dGKyG3hh7ds5dFv4YflIFAOKpAne9Jxg2/RGhW/+EPrLI1lCH9gnUdFGS+bEZfina6iC
 YO2LRG3CgmA76oTpwJm1DDovRGIDGV0sWXO/UK4nK8ZfQx3uVJZwGWqFmZHqJqif5MP6
 FrqQ==
X-Gm-Message-State: AOAM531bDmzHfsSNDJkcQYF95NnW+D+s5wEgjWT1aDRtbHwkkGW8BjSv
 y9x0lVwr19e3CLQOLpJEfM4ZyYmnoFOWjCn1foRVPz8sPLUXeAPTSOTaT7YB+rU6rZIN5gaFRvY
 iBfiTt2ztEsN5h/Hg90PRr8wnLLedndU/mVeZ7l9eFHWwQSgDfwV5e/RZ7mmTUg==
X-Received: by 2002:ac2:5f1b:: with SMTP id 27mr14782462lfq.425.1618906358348; 
 Tue, 20 Apr 2021 01:12:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGj+Hlh1J4/cwN5jCaEklO5slca58XNB7qVuci1XVRA8XrEJfTHTIictY7IK+d0qKQHdTKXplsFsdyezE44Ec=
X-Received: by 2002:ac2:5f1b:: with SMTP id 27mr14782427lfq.425.1618906357768; 
 Tue, 20 Apr 2021 01:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210415102224.2764054-1-sudeep.holla@arm.com>
 <20210420075332.t56dlpppb6bnpjzd@bogus>
In-Reply-To: <20210420075332.t56dlpppb6bnpjzd@bogus>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 20 Apr 2021 16:12:26 +0800
Message-ID: <CAAd53p6zti5rmJ5LjW3WbYsSGBs5CgBuOztHv-nvMObGBh7Q+A@mail.gmail.com>
Subject: Re: [PATCH] efifb: Fix runtime pm calls for non PCI efifb device
To: Sudeep Holla <sudeep.holla@arm.com>
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sudeep,

On Tue, Apr 20, 2021 at 3:53 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> Gentle Ping! There is boot failure because of this issue with linux-next
> on few arm platforms with non PCIe efifb. Please review and get the fix
> merged ASAP so the testing on these platforms can continue with linux-next.

It was merged in drm-tip as d510c88cfbb2 ("efifb: Check efifb_pci_dev
before using it").

Kai-Heng

>
> On Thu, Apr 15, 2021 at 11:22:24AM +0100, Sudeep Holla wrote:
> > Commit a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
> > added runtime pm calls to probe and remove routines to ensure the PCI
> > device for efifb stays in D0 state. However not ever efifb is based on
> > PCI device and efifb_pci_dev can be NULL if that is the case.
> >
> > In such cases, we will get a boot splat like below due to NULL dereference:
> > -->8
> >  Console: switching to colour frame buffer device 240x67
> >  fb0: EFI VGA frame buffer device
> >  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000270
> >  Mem abort info:
> >    ESR = 0x96000004
> >    EC = 0x25: DABT (current EL), IL = 32 bits
> >    SET = 0, FnV = 0
> >    EA = 0, S1PTW = 0
> >  Data abort info:
> >    ISV = 0, ISS = 0x00000004
> >    CM = 0, WnR = 0
> >  [0000000000000270] user address but active_mm is swapper
> >  Internal error: Oops: 96000004 [#1] PREEMPT SMP
> >  Modules linked in:
> >  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc7-next-20210413 #1
> >  Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform
> >  pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
> >  pc : pm_runtime_drop_link+0x12c/0x338
> >  lr : efifb_probe+0x7bc/0x7f0
> >  Call trace:
> >   pm_runtime_drop_link+0x12c/0x338
> >   efifb_probe+0x7bc/0x7f0
> >   platform_probe+0x68/0xd8
> >   really_probe+0xe4/0x3a8
> >   driver_probe_device+0x64/0xc8
> >   device_driver_attach+0x74/0x80
> >   __driver_attach+0x64/0xf0
> >   bus_for_each_dev+0x70/0xc0
> >   driver_attach+0x24/0x30
> >   bus_add_driver+0x150/0x1f8
> >   driver_register+0x64/0x120
> >   __platform_driver_register+0x28/0x38
> >   efifb_driver_init+0x1c/0x28
> >   do_one_initcall+0x48/0x2b0
> >   kernel_init_freeable+0x1e8/0x258
> >   kernel_init+0x14/0x118
> >   ret_from_fork+0x10/0x30
> >  Code: 88027c01 35ffffa2 17fff706 f9800051 (885f7c40)
> >  ---[ end trace 17d8da630bf8ff77 ]---
> >  Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> > -->8
> >
> > Fix the issue by checking for non-NULL efifb_pci_dev before dereferencing
> > for runtime pm calls in probe and remove routines.
> >
> > Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
> > Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Peter Jones <pjones@redhat.com>
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  drivers/video/fbdev/efifb.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> > index f58a545b3bf3..8ea8f079cde2 100644
> > --- a/drivers/video/fbdev/efifb.c
> > +++ b/drivers/video/fbdev/efifb.c
> > @@ -575,7 +575,8 @@ static int efifb_probe(struct platform_device *dev)
> >               goto err_fb_dealoc;
> >       }
> >       fb_info(info, "%s frame buffer device\n", info->fix.id);
> > -     pm_runtime_get_sync(&efifb_pci_dev->dev);
> > +     if (efifb_pci_dev)
> > +             pm_runtime_get_sync(&efifb_pci_dev->dev);
> >       return 0;
> >
> >  err_fb_dealoc:
> > @@ -602,7 +603,8 @@ static int efifb_remove(struct platform_device *pdev)
> >       unregister_framebuffer(info);
> >       sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
> >       framebuffer_release(info);
> > -     pm_runtime_put(&efifb_pci_dev->dev);
> > +     if (efifb_pci_dev)
> > +             pm_runtime_put(&efifb_pci_dev->dev);
> >
> >       return 0;
> >  }
> > --
> > 2.25.1
> >
>
> --
> Regards,
> Sudeep
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
