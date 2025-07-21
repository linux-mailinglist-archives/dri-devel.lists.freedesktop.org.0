Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E18B0CD6D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 01:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228C210E102;
	Mon, 21 Jul 2025 23:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y3/h5a43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E14910E102
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 23:00:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 11EDD456B9;
 Mon, 21 Jul 2025 23:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47ADC4CEED;
 Mon, 21 Jul 2025 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753138814;
 bh=SnHb5Ff2Sxs8l3uYD7IYErUPUDBONk0p5oJ0NjX4EOs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Y3/h5a43DOytbrvY/BlcgPbSMxWUB93+MZtw+hgxr0Imk3Lm4UBoCF5wPCnSH+91C
 Xasgl3FtnWEB0ajbTTPnoxXchSdPm+ZiC5yhv2oFrr3MWTfbU3peH+EbNRQkC6rawc
 +/p3ygrqSZ86w0UJS3eZ0NkdoPPmdpiCenB+WbQWxh5n/SgMtXx8y0e9Za0PIKcc4x
 gOnUwYkBZappo9o59gUPFNzB9zoUK22nmMZAxkvE3ygWgfT8hirYcVGihGaX4sJThI
 HdMhfeLwpibSU83+rDUDmWk0M4Lh6h67rag2NDwbE/1tylJAk9Zl2WEsp5cSKqRUk7
 vf1DiAByuE14w==
Date: Mon, 21 Jul 2025 18:00:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v9 9/9] PCI: Add a new 'boot_display' attribute
Message-ID: <20250721230013.GA2759370@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7c8b0bf-8602-4030-acbe-ac56678b633c@kernel.org>
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

On Fri, Jul 18, 2025 at 12:44:11PM -0500, Mario Limonciello wrote:
> On 7/18/2025 12:36 PM, Bjorn Helgaas wrote:
> > On Fri, Jul 18, 2025 at 12:29:05PM -0500, Mario Limonciello wrote:
> > > On 7/18/2025 12:25 PM, Bjorn Helgaas wrote:
> > > > On Thu, Jul 17, 2025 at 12:38:12PM -0500, Mario Limonciello wrote:
> > > > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > > > 
> > > > > On systems with multiple GPUs there can be uncertainty which GPU is the
> > > > > primary one used to drive the display at bootup. In some desktop
> > > > > environments this can lead to increased power consumption because
> > > > > secondary GPUs may be used for rendering and never go to a low power
> > > > > state. In order to disambiguate this add a new sysfs attribute
> > > > > 'boot_display' that uses the output of video_is_primary_device() to
> > > > > populate whether a PCI device was used for driving the display.
> > > > 
> > > > > +What:		/sys/bus/pci/devices/.../boot_display
> > > > > +Date:		October 2025
> > > > > +Contact:	Linux PCI developers <linux-pci@vger.kernel.org>
> > > > > +Description:
> > > > > +		This file indicates that displays connected to the device were
> > > > > +		used to display the boot sequence.  If a display connected to
> > > > > +		the device was used to display the boot sequence the file will
> > > > > +		be present and contain "1".
> > > > 
> > > > >    int __must_check pci_create_sysfs_dev_files(struct pci_dev *pdev)
> > > > >    {
> > > > > +	int retval;
> > > > > +
> > > > >    	if (!sysfs_initialized)
> > > > >    		return -EACCES;
> > > > > +	retval = pci_create_boot_display_file(pdev);
> > > > 
> > > > In addition to Mani's question about whether /sys/bus/pci/ is
> > > > the right place for this (which is a very good question), it's
> > > > also been pointed out to me that we've been trying to get rid
> > > > of pci_create_sysfs_dev_files() for years.
> > > > 
> > > > If it's possible to make this a static attribute that would be
> > > > much, much cleaner.
> > > 
> > > Right - I tried to do this, but the problem is at the time the
> > > PCI device is created the information needed to make the
> > > judgement isn't ready.  The options end up being:
> > > * a sysfs file for every display device with 0/1
> > > * a sysfs file that is not accurate until later in the boot
> > 
> > What's missing?  The specifics might be helpful if someone has
> > another crack at getting rid of pci_create_sysfs_dev_files() in
> > the future.
> 
> The underlying SCREEN_INFO code tries to walk through all the PCI
> devices in a loop, but at the time all the devices are walked the
> memory regions associated with the device weren't populated.

Which loop are you referring to that walks through all the PCI
devices?  I see this:

  efifb_set_system
    for_each_pci_dev(dev)

but that only looks at VGA devices and IIUC you also want to look at
non-VGA GPUs.

I don't see a loop in *this* series, where the screen_info path looks
like this:

  pci_create_boot_display_file
    video_is_primary_device
      screen_info_pci_dev      # added by "fbcon: Use screen info to find primary device"
        screen_info_resources
        __screen_info_pci_dev

and we're basically matching the screen_info base/address with BAR
values.

The usual problem is that BARs may not have been assigned by the time
pci_device_add() -> device_add() creates the static attributes.

So we call pci_assign_unassigned_root_bus_resources() to assign all
the BARs.  Then we call pci_create_sysfs_dev_files(), where
pci_create_resource_files() creates a "resource%d" file for each BAR.

But since we're trying to find the GPU that was used by BIOS, I assume
its BARs were programmed by BIOS and we shouldn't have to wait until
after pci_assign_unassigned_root_bus_resources().

Bjorn
