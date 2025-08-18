Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600DB2A03C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 13:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D746D10E1D7;
	Mon, 18 Aug 2025 11:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tXPhIcpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E7E10E1D7;
 Mon, 18 Aug 2025 11:24:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 70F7D5C48E7;
 Mon, 18 Aug 2025 11:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E674C4CEEB;
 Mon, 18 Aug 2025 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755516246;
 bh=S8fx28ZOFv/aRwZ2Xxu1HcW0LeO59Bf0W+4lw52lHUo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tXPhIcprcunHMleGFLIvoG1s0XiCUEY2N9lcE3i6sadmegRADVYTVBlq3c242EyOX
 8sNT3sdezjIpZqJpS4aioZ0DzojutaxSXEkpDyl8YOKEf2N5wefVvj4kwhUYaPX+j3
 dHhf2o/643YaqP84+2K2k2IF0Qrq3BXNbXM+FO8xZU7AjwXHhN8A9Qb/uEWuKjMg6L
 GtNb96H8fqsjP/nYrP2xTdw5csi276T6jCX8kZF08Ijf2y1Dji/QvjrjOOo7vsau6z
 u2B5jxc3FCK33EQ6d73QTTJUQgqHoHJqiYw55TUuk1GsHsCPH66WZeGrRlH1oFirNL
 5Ej4ll1/hIcUA==
Message-ID: <4574e72d-5cc3-4ad2-beab-78dbeb34d42f@kernel.org>
Date: Mon, 18 Aug 2025 06:24:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] USB: Pass PMSG_POWEROFF event to
 suspend_common() for poweroff with S4 flow
To: Oliver Neukum <oneukum@suse.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
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
 <20250818020101.3619237-5-superm1@kernel.org>
 <a1cf393a-9901-469b-90f4-81211f2e1b9b@suse.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <a1cf393a-9901-469b-90f4-81211f2e1b9b@suse.com>
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

On 8/18/25 5:50 AM, Oliver Neukum wrote:
> On 8/18/25 04:00, Mario Limonciello (AMD) wrote:
>> If powering off the system with the S4 flow USB wakeup sources should
>> be ignored. Add a new callback hcd_pci_poweroff() which will 
>> differentiate
>> whether target state is S5 and pass PMSG_POWEROFF as the message so that
>> suspend_common() will avoid doing wakeups.
> 
> Hi,
> 
> how will Wake-On-LAN work with this change?
> 
>      Regards
>          Oliver
> 

 From S5 using a USB dongle?  Is this a use case that is intended to 
work today?  Does it?

I had expected this only intended from S4, S3 and s2idle.
