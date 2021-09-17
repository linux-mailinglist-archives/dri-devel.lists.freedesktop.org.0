Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ABE40FE34
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 18:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09376EE59;
	Fri, 17 Sep 2021 16:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D20F6EE59
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 16:55:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97AAF61108;
 Fri, 17 Sep 2021 16:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631897701;
 bh=gIN/1/UJ9KFOMMzT+R4qCGsl0N3O4XSWxGatfxzx4dc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=GstmkVwl1605P/G9i50cL7p85qHP8Iyk2IMhCZ8dxd+PX9nRyrirBnIPfakhJHjJb
 UndfnJAdTIIzPQX23o7ZIuCJLdUmwOh9LL2FCUlxH5OLoCG7NyK7dQLrfs995Y9QIK
 AUz1THxXHlNFFArXZn5oxY6Yf3cFa42NFhNzARvsWwfOlXt8pDzSycne3mmt9BA7Ln
 X/in+c1wMbiMO466tFyubRG+l5o63b9PYxxA6yL1O4q1WApo80Bi3JHO92quZI8q4m
 gGlRgpP/lbKk+cEooMFWX9W0GyfW0a20JSGTBcx3wG07nq112b2Bg3ObpXRIHhkIF7
 Hkxna/hyXqpoA==
Date: Fri, 17 Sep 2021 11:55:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 mripard@kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH] vgaarb: Use ACPI HID name to find integrated GPU
Message-ID: <20210917165500.GA1723244@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd53p6XdeYcLNctghOi5VPy1YHEOaGoeo9Wc_T9P-RmYTJKzA@mail.gmail.com>
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

On Fri, Sep 17, 2021 at 11:49:45AM +0800, Kai-Heng Feng wrote:
> On Fri, Sep 17, 2021 at 12:38 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > [+cc Huacai, linux-pci]
> >
> > On Wed, May 19, 2021 at 09:57:23PM +0800, Kai-Heng Feng wrote:
> > > Commit 3d42f1ddc47a ("vgaarb: Keep adding VGA device in queue") assumes
> > > the first device is an integrated GPU. However, on AMD platforms an
> > > integrated GPU can have higher PCI device number than a discrete GPU.
> > >
> > > Integrated GPU on ACPI platform generally has _DOD and _DOS method, so
> > > use that as predicate to find integrated GPU. If the new strategy
> > > doesn't work, fallback to use the first device as boot VGA.
> > >
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > ---
> > >  drivers/gpu/vga/vgaarb.c | 31 ++++++++++++++++++++++++++-----
> > >  1 file changed, 26 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> > > index 5180c5687ee5..949fde433ea2 100644
> > > --- a/drivers/gpu/vga/vgaarb.c
> > > +++ b/drivers/gpu/vga/vgaarb.c
> > > @@ -50,6 +50,7 @@
> > >  #include <linux/screen_info.h>
> > >  #include <linux/vt.h>
> > >  #include <linux/console.h>
> > > +#include <linux/acpi.h>
> > >
> > >  #include <linux/uaccess.h>
> > >
> > > @@ -1450,9 +1451,23 @@ static struct miscdevice vga_arb_device = {
> > >       MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
> > >  };
> > >
> > > +#if defined(CONFIG_ACPI)
> > > +static bool vga_arb_integrated_gpu(struct device *dev)
> > > +{
> > > +     struct acpi_device *adev = ACPI_COMPANION(dev);
> > > +
> > > +     return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
> > > +}
> > > +#else
> > > +static bool vga_arb_integrated_gpu(struct device *dev)
> > > +{
> > > +     return false;
> > > +}
> > > +#endif
> > > +
> > >  static void __init vga_arb_select_default_device(void)
> > >  {
> > > -     struct pci_dev *pdev;
> > > +     struct pci_dev *pdev, *found = NULL;
> > >       struct vga_device *vgadev;
> > >
> > >  #if defined(CONFIG_X86) || defined(CONFIG_IA64)
> > > @@ -1505,20 +1520,26 @@ static void __init vga_arb_select_default_device(void)
> > >  #endif
> > >
> > >       if (!vga_default_device()) {
> > > -             list_for_each_entry(vgadev, &vga_list, list) {
> > > +             list_for_each_entry_reverse(vgadev, &vga_list, list) {
> >
> > Hi Kai-Heng, do you remember why you changed the order of this list
> > traversal?
> 
> The descending order is to keep the original behavior.
> 
> Before this patch, it breaks out of the loop as early as possible, so
> the lower numbered device is picked.
> This patch makes it only break out of the loop when ACPI_VIDEO_HID
> device is found.
> So if there are more than one device that meet "cmd & (PCI_COMMAND_IO
> | PCI_COMMAND_MEMORY)", higher numbered device will be selected.
> So the traverse order reversal is to keep the original behavior.

Can you give an example of what you mean?  I don't quite follow how it
keeps the original behavior.

If we have this:

  0  PCI_COMMAND_MEMORY set   ACPI_VIDEO_HID
  1  PCI_COMMAND_MEMORY set   ACPI_VIDEO_HID

Previously we didn't look for ACPI_VIDEO_HID, so we chose 0, now we
choose 1, which seems wrong.  In the absence of other information, I
would prefer the lower-numbered device.

Or this:

  0  PCI_COMMAND_MEMORY set
  1  PCI_COMMAND_MEMORY set   ACPI_VIDEO_HID

Previously we chose 0; now we choose 1, which does seem right, but
we'd choose 1 regardless of the order.

Or this:

  0  PCI_COMMAND_MEMORY set   ACPI_VIDEO_HID
  1  PCI_COMMAND_MEMORY set

Previously we chose 0, now we still choose 0, which seems right but
again doesn't depend on the order.

The first case, where both devices are ACPI_VIDEO_HID, is the only one
where the order matters, and I suggest that we should be using the
original order, not the reversed order.

> > I guess the list_add_tail() in vga_arbiter_add_pci_device() means
> > vga_list is generally ordered with small device numbers first and
> > large ones last.
> >
> > So you pick the integrated GPU with the largest device number.  Are
> > there systems with more than one integrated GPU?  If so, I would
> > naively expect that in the absence of an indication otherwise, we'd
> > want the one with the *smallest* device number.
> 
> There's only one integrated GPU on the affected system.
> 
> The approach is to keep the list traversal in one pass.
> Is there any regression introduce by this patch?
> If that's the case, we can separate the logic and find the
> ACPI_VIDEO_HID in second pass.

No regression, I'm just looking at Huacai's VGA patches, which affect
this area.
