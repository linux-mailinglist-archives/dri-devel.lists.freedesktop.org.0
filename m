Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF076B51B4E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE8D10E948;
	Wed, 10 Sep 2025 15:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ahGOrzwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B5B10E946;
 Wed, 10 Sep 2025 15:18:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D32A601A8;
 Wed, 10 Sep 2025 15:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBF3C4CEEB;
 Wed, 10 Sep 2025 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757517517;
 bh=0uSCp23NvXz2hqHp/yS8FBYbn/cdIneP8YL/ZnCmcUk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ahGOrzwuhX9CBWzkao0VsZrDeUgXAGaATsukNto6O3QzeHDmkfiuxJvh+6DPAin2B
 1HC5a3v3pW1bS8mc4JaKFZVhsOxsb74sDYfEfwV+Uh3DY36qvJmMA6Rz0nxAz2aoUw
 5hoVr0rgmmHjir7QvWrodXujPsN70tleBK9gUAodzR7anFALHxkjrDKOQEirFI7/m/
 qp2zMCcToTXnu/HDkCBizXniqC7ZCnNFGt1AMGAUr1t2GOov9qIdDorDNFTouT2V6Q
 pLXvsFeyOkxuP20BDSIFiADuqwuH6TyxaEGEOx9Fp+3v/0RjSBUCN0M74v0gA5TfTs
 CkUfNTyNFNkWA==
Date: Wed, 10 Sep 2025 10:18:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
 Eric Naim <dnaim@cachyos.org>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v7 11/12] PM: Use hibernate flows for system power off
Message-ID: <20250910151836.GA1536103@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909191619.2580169-12-superm1@kernel.org>
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

On Tue, Sep 09, 2025 at 02:16:18PM -0500, Mario Limonciello (AMD) wrote:
> When the system is powered off the kernel will call device_shutdown()
> which will issue callbacks into PCI core to wake up a device and call
> it's shutdown() callback.  This will leave devices in ACPI D0 which can
> cause some devices to misbehave with spurious wakeups and also leave some
> devices on which will consume power needlessly.

The connection between this change and spurious wakeups seems pretty
tenuous.  If we don't want wakeups, powering off the device seems like
a sledgehammer approach.

s/it's/its/

> The issue won't happen if the device is in D3 before system shutdown, so
> putting device to low power state before shutdown solves the issue.
> 
> ACPI Spec 6.5, "7.4.2.5 System \_S4 State" says "Devices states are
> compatible with the current Power Resource states. In other words, all
> devices are in the D3 state when the system state is S4."

Re patch 05/12, also interesting that this section mentions "devices
that are enabled to wake the system and that can do so from their
device state in S4 can initiate a hardware event that transitions the
system state to S0."

So it looks like wakeup from S4 should work in at least some cases.

> The following "7.4.2.6 System \_S5 State (Soft Off)" states "The S5
> state is similar to the S4 state except that OSPM does not save any
> context." so it's safe to assume devices should be at D3 for S5.
> 
> To accomplish this, use the PMSG_POWEROFF event to call all the device
> hibernate callbacks when the kernel is compiled with hibernate support.
> If compiled without hibernate support or hibernate fails fall back into
> the previous shutdown flow.
> 
> Cc: AceLan Kao <acelan.kao@canonical.com>
> Cc: Kai-Heng Feng <kaihengf@nvidia.com>
> Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
> Cc: Merthan Karakaş <m3rthn.k@gmail.com>
> Tested-by: Eric Naim <dnaim@cachyos.org>
> Tested-by: Denis Benato <benato.denis96@gmail.com>
> Link: https://lore.kernel.org/linux-pci/20231213182656.6165-1-mario.limonciello@amd.com/
> Link: https://lore.kernel.org/linux-pci/20250506041934.1409302-1-superm1@kernel.org/
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
> v5:
>  * split to multiple commits, re-order
> v4:
>  * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@kernel.org/
> v3:
>  * Add new PMSG_POWEROFF and PM_EVENT_POWEROFF which alias to poweroff
>    callbacks
>  * Don't try to cleanup on dpm_suspend_start() or dpm_suspend_end() failures
>    Jump right into normal shutdown flow instead.
>  * https://lore.kernel.org/linux-pm/20250609024619.407257-1-superm1@kernel.org/T/#me6db0fb946e3d604a8f3d455128844ed802c82bb
> ---
>  kernel/reboot.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index ec087827c85cd..c8835f8e5f271 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -13,6 +13,7 @@
>  #include <linux/kexec.h>
>  #include <linux/kmod.h>
>  #include <linux/kmsg_dump.h>
> +#include <linux/pm.h>
>  #include <linux/reboot.h>
>  #include <linux/suspend.h>
>  #include <linux/syscalls.h>
> @@ -305,6 +306,11 @@ static void kernel_shutdown_prepare(enum system_states state)
>  		(state == SYSTEM_HALT) ? SYS_HALT : SYS_POWER_OFF, NULL);
>  	system_state = state;
>  	usermodehelper_disable();
> +#ifdef CONFIG_HIBERNATE_CALLBACKS
> +	if (!dpm_suspend_start(PMSG_POWEROFF) && !dpm_suspend_end(PMSG_POWEROFF))
> +		return;
> +	pr_emerg("Failed to power off devices, using shutdown instead.\n");
> +#endif
>  	device_shutdown();
>  }
>  /**
> -- 
> 2.43.0
> 
