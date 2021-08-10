Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F73E5E5D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 16:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAEF897E4;
	Tue, 10 Aug 2021 14:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F1F897C3;
 Tue, 10 Aug 2021 14:49:00 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 y23-20020a4a62570000b029028727ffa408so3412751oog.5; 
 Tue, 10 Aug 2021 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lsM74LGQdwKcOOf8FqPV9S8g1kidgq4fXYEQaQYkzBw=;
 b=gfH5nspkpPkuAmf0v8/++cM8edO2l0gEiNXFyf9Rme9pQjN2NGyTD3TRALfidXdofb
 xirSOeOw3Fhha/DgUX2GHODdBHhJaOz0tPdPDEdcskYvTvbK0m/NJbaiOMztzHtO0BfK
 6tlgFHt8FYHamLCAX+DUaw2rSnUqY0RaYQBWlbEWqwK8OVeLOZqZPUW/OrZBMPRh1+47
 LVaT/B03EYhlrYFKxwxH6ETGWGFY9CVNjmYV+oe56fRWwLF+lEwxVHiF0X+cvNG67USp
 IYKFBZisJjs0NKedNYjplvHaeJa31e2tlw9A9Y9zuct7hKetUUTKwkUhBPuFNuF5PYwh
 N4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lsM74LGQdwKcOOf8FqPV9S8g1kidgq4fXYEQaQYkzBw=;
 b=Z1yvnWp9eYtpRUdWmODF1Fq0pJrsycOKwaef5/PRM9hJ0U09A0d5XIBWs3KeHyjCaY
 nMDw8NiOC5+Vw9N5gLgVmmCtaDfCAR05jBu1IRvRSF1ZSgl8SNAT2QBvTQRut8yGu3L5
 eCifY5NIcucQJIYN9myg4gsYCnfxvZNp85Kx0vgi822BGeGUvhDdZSylel+Xv81ZTAoD
 Gsw6Mqtsl0ZaAiEbD3EUcN3Bp1GerI4r2IpAjQmsbl3kNCAospeOKMiKwOAdGu/cpKem
 ZK2xr8n0km649mk0J8qNqfhQRMWnzQ4DsWcGD+CUh6QQPPyL9YloVb3tthD9qpaMmIqn
 TriA==
X-Gm-Message-State: AOAM532KLSX+BOpvGmVda7bc7ws/ldeLsSIp8jdEx52DNKQUVT5/x1RS
 NURboD5cgMNZ7L3u40Bwms5Vi61TyyteizRZnfM=
X-Google-Smtp-Source: ABdhPJzIAm+EOG6KiSLzJgnJqp+2NTOLJ4ifPln6rlixx8lUqfef4a5XWVDuiaB+Q2wFtfzSTt5pMnrHTfTA4D7uBiQ=
X-Received: by 2002:a4a:c989:: with SMTP id u9mr7092050ooq.61.1628606939631;
 Tue, 10 Aug 2021 07:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210802133551.1904964-1-imre.deak@intel.com>
 <20210809133146.2478382-1-imre.deak@intel.com>
 <20210810083629.GA2517380@ideak-desk.fi.intel.com>
In-Reply-To: <20210810083629.GA2517380@ideak-desk.fi.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Aug 2021 10:48:48 -0400
Message-ID: <CADnq5_Pjz2gP2465S1aEzKMZXiSB2WqEPUdkpqh58XzJcKLu+g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2] fbdev/efifb: Release PCI device's runtime
 PM ref during FB destroy
To: Imre Deak <imre.deak@intel.com>
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>, 
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Tue, Aug 10, 2021 at 4:36 AM Imre Deak <imre.deak@intel.com> wrote:
>
> Hi Kai-Heng, Alex,
>
> could you add your ack if the fix looks ok and you're ok if I push it to
> the i915 tree?
>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> Thanks,
> Imre
>
> On Mon, Aug 09, 2021 at 04:31:46PM +0300, Imre Deak wrote:
> > Atm the EFI FB platform driver gets a runtime PM reference for the
> > associated GFX PCI device during probing the EFI FB platform device and
> > releases it only when the platform device gets unbound.
> >
> > When fbcon switches to the FB provided by the PCI device's driver (for
> > instance i915/drmfb), the EFI FB will get only unregistered without the
> > EFI FB platform device getting unbound, keeping the runtime PM reference
> > acquired during the platform device probing. This reference will prevent
> > the PCI driver from runtime suspending the device.
> >
> > Fix this by releasing the RPM reference from the EFI FB's destroy hook,
> > called when the FB gets unregistered.
> >
> > While at it assert that pm_runtime_get_sync() didn't fail.
> >
> > v2:
> > - Move pm_runtime_get_sync() before register_framebuffer() to avoid its
> >   race wrt. efifb_destroy()->pm_runtime_put(). (Daniel)
> > - Assert that pm_runtime_get_sync() didn't fail.
> > - Clarify commit message wrt. platform/PCI device/driver and driver
> >   removal vs. device unbinding.
> >
> > Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
> > Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/video/fbdev/efifb.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> > index 8ea8f079cde26..edca3703b9640 100644
> > --- a/drivers/video/fbdev/efifb.c
> > +++ b/drivers/video/fbdev/efifb.c
> > @@ -47,6 +47,8 @@ static bool use_bgrt = true;
> >  static bool request_mem_succeeded = false;
> >  static u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
> >
> > +static struct pci_dev *efifb_pci_dev;        /* dev with BAR covering the efifb */
> > +
> >  static struct fb_var_screeninfo efifb_defined = {
> >       .activate               = FB_ACTIVATE_NOW,
> >       .height                 = -1,
> > @@ -243,6 +245,9 @@ static inline void efifb_show_boot_graphics(struct fb_info *info) {}
> >
> >  static void efifb_destroy(struct fb_info *info)
> >  {
> > +     if (efifb_pci_dev)
> > +             pm_runtime_put(&efifb_pci_dev->dev);
> > +
> >       if (info->screen_base) {
> >               if (mem_flags & (EFI_MEMORY_UC | EFI_MEMORY_WC))
> >                       iounmap(info->screen_base);
> > @@ -333,7 +338,6 @@ ATTRIBUTE_GROUPS(efifb);
> >
> >  static bool pci_dev_disabled;        /* FB base matches BAR of a disabled device */
> >
> > -static struct pci_dev *efifb_pci_dev;        /* dev with BAR covering the efifb */
> >  static struct resource *bar_resource;
> >  static u64 bar_offset;
> >
> > @@ -569,17 +573,22 @@ static int efifb_probe(struct platform_device *dev)
> >               pr_err("efifb: cannot allocate colormap\n");
> >               goto err_groups;
> >       }
> > +
> > +     if (efifb_pci_dev)
> > +             WARN_ON(pm_runtime_get_sync(&efifb_pci_dev->dev) < 0);
> > +
> >       err = register_framebuffer(info);
> >       if (err < 0) {
> >               pr_err("efifb: cannot register framebuffer\n");
> > -             goto err_fb_dealoc;
> > +             goto err_put_rpm_ref;
> >       }
> >       fb_info(info, "%s frame buffer device\n", info->fix.id);
> > -     if (efifb_pci_dev)
> > -             pm_runtime_get_sync(&efifb_pci_dev->dev);
> >       return 0;
> >
> > -err_fb_dealoc:
> > +err_put_rpm_ref:
> > +     if (efifb_pci_dev)
> > +             pm_runtime_put(&efifb_pci_dev->dev);
> > +
> >       fb_dealloc_cmap(&info->cmap);
> >  err_groups:
> >       sysfs_remove_groups(&dev->dev.kobj, efifb_groups);
> > @@ -603,8 +612,6 @@ static int efifb_remove(struct platform_device *pdev)
> >       unregister_framebuffer(info);
> >       sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
> >       framebuffer_release(info);
> > -     if (efifb_pci_dev)
> > -             pm_runtime_put(&efifb_pci_dev->dev);
> >
> >       return 0;
> >  }
> > --
> > 2.27.0
> >
