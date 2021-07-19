Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D883CD56F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363D489FEA;
	Mon, 19 Jul 2021 13:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAF989D56
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:05:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF97D610A5;
 Mon, 19 Jul 2021 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626699905;
 bh=35IH1Be/xn27F8mXBOPo5R8WaCBnv5MW7j4hM992ZeU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=onoAm0NSVStQeP9V4wR6k8eqWvO+KFUNnqtYFgRjuMLbse6Or2MUtp13xliIfe1qk
 YEO/YIMZ9PAd3PDh9IHJHSZJ4GPoXzRkn+VC2DvhrbCM7WeN/Ta2k3GeMGbM67RtZV
 qojNHhN5gTjV5jrCbHL+ZEJrkuPXOgdchTbUWM88=
Date: Mon, 19 Jul 2021 15:05:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xiaotian Feng <xtfeng@gmail.com>
Subject: Re: [PATCH 5.12 237/242] drm/ast: Remove reference to struct
 drm_device.pdev
Message-ID: <YPV4fkUjqWcqhrRY@kroah.com>
References: <20210715182551.731989182@linuxfoundation.org>
 <20210715182634.577299401@linuxfoundation.org>
 <CAJn8CcF+gfXToErpZv=pWmBKF-i--oVWmaM=6AQ8YZCb21X=oA@mail.gmail.com>
 <YPVgtybrZLxe3XeW@kroah.com>
 <CAJn8CcHHKSo7GF29Z1ufXJJpMUzn6+fdvwiqe9=JvgpcfvnbHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJn8CcHHKSo7GF29Z1ufXJJpMUzn6+fdvwiqe9=JvgpcfvnbHQ@mail.gmail.com>
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
Cc: kernel test robot <lkp@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 07:43:39PM +0800, Xiaotian Feng wrote:
> On Mon, Jul 19, 2021 at 7:23 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jul 19, 2021 at 05:57:30PM +0800, Xiaotian Feng wrote:
> > > On Fri, Jul 16, 2021 at 5:13 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > From: Thomas Zimmermann <tzimmermann@suse.de>
> > > >
> > > > commit 0ecb51824e838372e01330752503ddf9c0430ef7 upstream.
> > > >
> > > > Using struct drm_device.pdev is deprecated. Upcast with to_pci_dev()
> > > > from struct drm_device.dev to get the PCI device structure.
> > > >
> > > > v9:
> > > >         * fix remaining pdev references
> > > >
> > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > > > Fixes: ba4e0339a6a3 ("drm/ast: Fixed CVE for DP501")
> > > > Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
> > > > Cc: kernel test robot <lkp@intel.com>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Link: https://patchwork.freedesktop.org/patch/msgid/20210429105101.25667-2-tzimmermann@suse.de
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > ---
> > > >  drivers/gpu/drm/ast/ast_main.c |    5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > >
> > > > --- a/drivers/gpu/drm/ast/ast_main.c
> > > > +++ b/drivers/gpu/drm/ast/ast_main.c
> > > > @@ -411,7 +411,6 @@ struct ast_private *ast_device_create(co
> > > >                 return ast;
> > > >         dev = &ast->base;
> > > >
> > > > -       dev->pdev = pdev;
> > > >         pci_set_drvdata(pdev, dev);
> > > >
> > > >         ast->regs = pcim_iomap(pdev, 1, 0);
> > > > @@ -453,8 +452,8 @@ struct ast_private *ast_device_create(co
> > > >
> > > >         /* map reserved buffer */
> > > >         ast->dp501_fw_buf = NULL;
> > > > -       if (dev->vram_mm->vram_size < pci_resource_len(dev->pdev, 0)) {
> > > > -               ast->dp501_fw_buf = pci_iomap_range(dev->pdev, 0, dev->vram_mm->vram_size, 0);
> > > > +       if (dev->vram_mm->vram_size < pci_resource_len(pdev, 0)) {
> > > > +               ast->dp501_fw_buf = pci_iomap_range(pdev, 0, dev->vram_mm->vram_size, 0);
> > > >                 if (!ast->dp501_fw_buf)
> > > >                         drm_info(dev, "failed to map reserved buffer!\n");
> > > >         }
> > > >
> > >
> > > Hi Greg,
> > >
> > >      This backport is incomplete for 5.10 kernel,  kernel is panicked
> > > on RIP: ast_device_create+0x7d.  When I look into the crash code, I
> > > found
> > >
> > > struct ast_private *ast_device_create(struct drm_driver *drv,
> > >                                       struct pci_dev *pdev,
> > >                                       unsigned long flags)
> > > {
> > > .......
> > >         dev->pdev = pdev;  // This is removed
> > >         pci_set_drvdata(pdev, dev);
> > >
> > >         ast->regs = pcim_iomap(pdev, 1, 0);
> > >         if (!ast->regs)
> > >                 return ERR_PTR(-EIO);
> > >
> > >         /*
> > >          * If we don't have IO space at all, use MMIO now and
> > >          * assume the chip has MMIO enabled by default (rev 0x20
> > >          * and higher).
> > >          */
> > >         if (!(pci_resource_flags(dev->pdev, 2) & IORESOURCE_IO)) { //
> > > dev->pdev is in used here.
> > >                 drm_info(dev, "platform has no IO space, trying MMIO\n");
> > >                 ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
> > >         }
> > >
> > >         That's because commit 46fb883c3d0d8a823ef995ddb1f9b0817dea6882
> > > is not backported to 5.10 kernel.
> >
> > So what should I do here?  Backport that commit (was was not called
> > out), or just revert this?
> >
> I think we can just simply revert the patch. Because commit 46fb883c
> removed drm_device.pdev usage,
> then commit ba4e0339 used drm_device.pdev again. Since commit 46fb883c
> is not in 5.10.50 kernel,
> it's not a stable fix.

Now qropped, thanks.

greg k-h
