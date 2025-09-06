Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18291B46CA6
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 14:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32F410E08B;
	Sat,  6 Sep 2025 12:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xMzXnXPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306EB10E08B;
 Sat,  6 Sep 2025 12:20:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 67836408D0;
 Sat,  6 Sep 2025 12:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37BBC4CEE7;
 Sat,  6 Sep 2025 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1757161203;
 bh=BKol4HL6/ZqnDnGKyyGY4AZwj2Kf559stTCHV+WJ3C0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xMzXnXPXsnW6iNHHptu6P/KVB3USWJaQnvXka/ambFUDvR3lg6FqZYyOI3r1RNndi
 u2fv3uRS9bVa1wDwex9kaVS1nRPpJGrYCRulB/ZjnaRPoj/iXM3XTqXoLEI7FdGNf1
 0RiQvbmzpAWS+iFI19unGE4ng0138yMmmwnzKQrg=
Date: Sat, 6 Sep 2025 14:20:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:HIBERNATION (aka Software Suspend,
 aka swsusp)" <linux-pm@vger.kernel.org>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Merthan =?utf-8?Q?Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>
Subject: Re: [PATCH v6 00/11] Improvements to S5 power consumption
Message-ID: <2025090644-connected-coping-fbd2@gregkh>
References: <20250818020101.3619237-1-superm1@kernel.org>
 <29e61472-5f41-4e76-9b5b-f3e106d6a629@kernel.org>
 <CAJZ5v0hLO5xhmjniO4=rLK1JK9OM8naxXVEGuHUT3cuhRp=Atw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hLO5xhmjniO4=rLK1JK9OM8naxXVEGuHUT3cuhRp=Atw@mail.gmail.com>
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

On Wed, Sep 03, 2025 at 01:14:18PM +0200, Rafael J. Wysocki wrote:
> On Wed, Sep 3, 2025 at 6:41 AM Mario Limonciello <superm1@kernel.org> wrote:
> >
> > On 8/17/2025 9:00 PM, Mario Limonciello (AMD) wrote:
> > > A variety of issues both in function and in power consumption have been
> > > raised as a result of devices not being put into a low power state when
> > > the system is powered off.
> > >
> > > There have been some localized changes[1] to PCI core to help these issues,
> > > but they have had various downsides.
> > >
> > > This series instead tries to use the S4 flow when the system is being
> > > powered off.  This lines up the behavior with what other operating systems
> > > do as well.  If for some reason that fails or is not supported, run their
> > > shutdown() callbacks.
> > >
> > > Cc: AceLan Kao <acelan.kao@canonical.com>
> > > Cc: Kai-Heng Feng <kaihengf@nvidia.com>
> > > Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > Cc: Merthan Karakaş <m3rthn.k@gmail.com>
> > > Cc: Eric Naim <dnaim@cachyos.org>
> > > ---
> > > v5->v6:
> > >   * Fix for LKP robot issue
> > >   * Some commit message changes
> > >   * Rebase on 6.17-rc2
> > >
> > > Mario Limonciello (AMD) (11):
> > >    PM: Introduce new PMSG_POWEROFF event
> > >    scsi: Add PM_EVENT_POWEROFF into suspend callbacks
> > >    usb: sl811-hcd: Add PM_EVENT_POWEROFF into suspend callbacks
> > >    USB: Pass PMSG_POWEROFF event to suspend_common() for poweroff with S4
> > >      flow
> > >    PCI: PM: Disable device wakeups when halting system through S4 flow
> > >    PCI: PM: Split out code from pci_pm_suspend_noirq() into helper
> > >    PCI: PM: Run bridge power up actions as part of restore phase
> > >    PCI: PM: Use pci_power_manageable() in pci_pm_poweroff_noirq()
> > >    PCI: Put PCIe bridges with downstream devices into D3 at hibernate
> > >    drm/amd: Avoid evicting resources at S5
> > >    PM: Use hibernate flows for system power off
> > >
> > >   drivers/base/power/main.c                  |  7 ++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 +
> > >   drivers/pci/pci-driver.c                   | 99 +++++++++++++++-------
> > >   drivers/scsi/mesh.c                        |  1 +
> > >   drivers/scsi/stex.c                        |  1 +
> > >   drivers/usb/core/hcd-pci.c                 | 11 ++-
> > >   drivers/usb/host/sl811-hcd.c               |  1 +
> > >   include/linux/pm.h                         |  5 +-
> > >   include/trace/events/power.h               |  3 +-
> > >   kernel/reboot.c                            |  6 ++
> > >   10 files changed, 103 insertions(+), 35 deletions(-)
> > >
> >
> > Rafael, Bjorn,
> >
> > Any feedback for this series?
> 
> I still have the same basic concern as before: It is an intrusive
> change likely to cause regressions to occur.
> 
> It also changes the driver ABI quite dramatically because different
> callbacks will now be used for system shutdown and kexec, for example,
> at least on some platforms.
> 
> Frankly, I'd like to know Greg's and Danilo's opinions on the direction here.
> 

I've been ignoring this, sorry.  Can someone resend the series and ask
for my review then?

thanks,

greg k-h
