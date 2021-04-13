Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1560F35E68B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 20:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D58F6E860;
	Tue, 13 Apr 2021 18:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD826E860
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 18:37:40 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id k25so17979756oic.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 11:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9l7MhNlE9zmt6nhNqqiUgq+wfQLEas5zTZd2Qi3n29c=;
 b=QOsR2qML+66/IL/2QygasVpniZsHI8EFVaq3gMigiAz1z0nR9iUZDxl2m8vc9Uas8t
 UbUicdnCbJI38veDYp8o7bnzx7trAahcwjmWnNJVBr58E7Z3wG0AFiuOOdaOa/bhmAPM
 UC7Pc5mHm/MRYrAatiU0fjhGoaF6Ez1LMNg6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9l7MhNlE9zmt6nhNqqiUgq+wfQLEas5zTZd2Qi3n29c=;
 b=YcQbbrUwbyKOzMwsQemYvy1gbVbSiYpG2px8avCFQzCGzXihz9BQBanJ8KQJnBJqLl
 EjCs0weUcTE5DsWCjpSu97nNB7F1XG6CwLtM5/k/rdOyetIkR2bGDSNvQ+0if/z1x+4h
 J3c18JM1MOVabO13epaLb/oERT8vf56+pxjuS30QobscUEOq4wG84/wGxZZh9e+Xq4BF
 lhr8DdXoeGK4jQWXTDPKBTDSPqkmLEUenFnctJWwGpX8lKqAF0wbnTt93L+mcpbZQTzd
 VU0UeiLuXpxt+Gw4ZJU4AQU8KAzWAUVMuKf/wktbafkZNAOUoAejxMtFSMIjpZBPif78
 WV/w==
X-Gm-Message-State: AOAM530Atp7M3ffUZJFRrsRuyGg0g4sb8gB/ak7doVCF8RbBDat2tLZK
 mhBkSrMR9abPR5NBeK3d/8FEJEJU8hYjC22AWdZqWA==
X-Google-Smtp-Source: ABdhPJzt3kTr/mnJ3swKnUlL5iVJ4GtE2T/oWlZHUL1YEPuogvLtGB1kNXErK0jci66Ehs3+KW5l0HK9ayVogLDiydM=
X-Received: by 2002:aca:4188:: with SMTP id o130mr964224oia.101.1618339060149; 
 Tue, 13 Apr 2021 11:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210413170508.968148-1-kai.heng.feng@canonical.com>
 <CADnq5_P7_7jOZWTo+KCj3jOpmyDPN8eH3jNTgg3xLC4V9QM7kQ@mail.gmail.com>
In-Reply-To: <CADnq5_P7_7jOZWTo+KCj3jOpmyDPN8eH3jNTgg3xLC4V9QM7kQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 13 Apr 2021 20:37:29 +0200
Message-ID: <CAKMK7uHR0VDk=C+u1d5qiiqQP+3ad5_gXQwvmPbJ56mG=3RjpQ@mail.gmail.com>
Subject: Re: [PATCH] efifb: Check efifb_pci_dev before using it
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 pjones@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 8:02 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Apr 13, 2021 at 1:05 PM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > On some platforms like Hyper-V and RPi4 with UEFI firmware, efifb is not
> > a PCI device.
> >
> > So make sure efifb_pci_dev is found before using it.
> >
> > Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
> > BugLink: https://bugs.launchpad.net/bugs/1922403
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

fbdev is in drm-misc, so maybe you can push this one too?
-Daniel

>
> > ---
> >  drivers/video/fbdev/efifb.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> > index f58a545b3bf3..8ea8f079cde2 100644
> > --- a/drivers/video/fbdev/efifb.c
> > +++ b/drivers/video/fbdev/efifb.c
> > @@ -575,7 +575,8 @@ static int efifb_probe(struct platform_device *dev)
> >                 goto err_fb_dealoc;
> >         }
> >         fb_info(info, "%s frame buffer device\n", info->fix.id);
> > -       pm_runtime_get_sync(&efifb_pci_dev->dev);
> > +       if (efifb_pci_dev)
> > +               pm_runtime_get_sync(&efifb_pci_dev->dev);
> >         return 0;
> >
> >  err_fb_dealoc:
> > @@ -602,7 +603,8 @@ static int efifb_remove(struct platform_device *pdev)
> >         unregister_framebuffer(info);
> >         sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
> >         framebuffer_release(info);
> > -       pm_runtime_put(&efifb_pci_dev->dev);
> > +       if (efifb_pci_dev)
> > +               pm_runtime_put(&efifb_pci_dev->dev);
> >
> >         return 0;
> >  }
> > --
> > 2.30.2
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
