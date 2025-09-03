Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D9B41397
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 06:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE3110E0E3;
	Wed,  3 Sep 2025 04:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s/wbSSBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4DB10E0E3;
 Wed,  3 Sep 2025 04:41:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C7D0416DF;
 Wed,  3 Sep 2025 04:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2AAC4CEF0;
 Wed,  3 Sep 2025 04:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756874516;
 bh=Ce5ETH+F6WnWDEeaq7pLglfV4JdFcr3PKEJyxp/keno=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=s/wbSSBARIKT8Fd9JqzskawfzifT7+BPOBAzwXDl6WBxhU410noLNvQWfHvv+Nb4Q
 SbPcIb3hxSHQY5dHlRH7uTb7j/F/Gu7pEGr7MuO33HXsvNskDBMUab0jPLJFQsfQGn
 DBDR9JuXyqBeBGip1IjfApmvbUcrJdSUfPe1zWbEw+SMhMPPGSNw74IL9FARn5fKmF
 zjHgI792YdyiwMwWOpQd3S9Oo3Edup8Zqq77sQ1wl2zqgUT6OeYww9IfARtdlcDtB3
 vOHV/VFLi6+2jqm//3XxZoeker+XP6Xe8Qrr8AEKkb368Q3fZA1sXUVv4Sn/GGGapn
 XGwAwOPKYtzMA==
Message-ID: <29e61472-5f41-4e76-9b5b-f3e106d6a629@kernel.org>
Date: Tue, 2 Sep 2025 23:41:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/11] Improvements to S5 power consumption
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>
References: <20250818020101.3619237-1-superm1@kernel.org>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250818020101.3619237-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 8/17/2025 9:00 PM, Mario Limonciello (AMD) wrote:
> A variety of issues both in function and in power consumption have been
> raised as a result of devices not being put into a low power state when
> the system is powered off.
> 
> There have been some localized changes[1] to PCI core to help these issues,
> but they have had various downsides.
> 
> This series instead tries to use the S4 flow when the system is being
> powered off.  This lines up the behavior with what other operating systems
> do as well.  If for some reason that fails or is not supported, run their
> shutdown() callbacks.
> 
> Cc: AceLan Kao <acelan.kao@canonical.com>
> Cc: Kai-Heng Feng <kaihengf@nvidia.com>
> Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
> Cc: Merthan Karakaş <m3rthn.k@gmail.com>
> Cc: Eric Naim <dnaim@cachyos.org>
> ---
> v5->v6:
>   * Fix for LKP robot issue
>   * Some commit message changes
>   * Rebase on 6.17-rc2
> 
> Mario Limonciello (AMD) (11):
>    PM: Introduce new PMSG_POWEROFF event
>    scsi: Add PM_EVENT_POWEROFF into suspend callbacks
>    usb: sl811-hcd: Add PM_EVENT_POWEROFF into suspend callbacks
>    USB: Pass PMSG_POWEROFF event to suspend_common() for poweroff with S4
>      flow
>    PCI: PM: Disable device wakeups when halting system through S4 flow
>    PCI: PM: Split out code from pci_pm_suspend_noirq() into helper
>    PCI: PM: Run bridge power up actions as part of restore phase
>    PCI: PM: Use pci_power_manageable() in pci_pm_poweroff_noirq()
>    PCI: Put PCIe bridges with downstream devices into D3 at hibernate
>    drm/amd: Avoid evicting resources at S5
>    PM: Use hibernate flows for system power off
> 
>   drivers/base/power/main.c                  |  7 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 +
>   drivers/pci/pci-driver.c                   | 99 +++++++++++++++-------
>   drivers/scsi/mesh.c                        |  1 +
>   drivers/scsi/stex.c                        |  1 +
>   drivers/usb/core/hcd-pci.c                 | 11 ++-
>   drivers/usb/host/sl811-hcd.c               |  1 +
>   include/linux/pm.h                         |  5 +-
>   include/trace/events/power.h               |  3 +-
>   kernel/reboot.c                            |  6 ++
>   10 files changed, 103 insertions(+), 35 deletions(-)
> 

Rafael, Bjorn,

Any feedback for this series?

Thanks,
