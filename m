Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA1AF8564
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 04:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6424C10E204;
	Fri,  4 Jul 2025 02:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hkT6XxXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F03C10E1F7;
 Fri,  4 Jul 2025 02:01:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E90615C67CE;
 Fri,  4 Jul 2025 02:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9390DC4CEE3;
 Fri,  4 Jul 2025 02:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751594492;
 bh=bOYiwreUJd6fupghKK4N1Ov79oxyIiLE7aijDZhysuo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hkT6XxXaM+qLqZ/3aN9wdEephOGUKE6kkqGZMAEWEgdc1TTY/L69D4WqUyWr7Nbxc
 Y95DZlsS+lZBDLlJaNCATZ0IgyVLyvhtQDle6KE9JbY5lE4cPFIczsZc7wZF2FUbH2
 rqUe0BXglbQA8Wx/nZZn6HlZlNtINB6SWw/9MbITS571lQQgWMQ3A1iFi13iv0wLSn
 NKq2KHwUTb17SyaP32hsHnQMOhx8WSffRIWv0NgGpgaPci4MSQNCxDGntkM+0kRElN
 +m4tAlN53C9n7HRIGewrKAFpT0udTf4CVlzaVP5i/ZVA8z+zfKhmLkCobJ1r7VqUUK
 pF0Fx9/E7iWHA==
Message-ID: <8fda8cf1-1291-422e-bb63-094e38c47b7b@kernel.org>
Date: Thu, 3 Jul 2025 22:01:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Improvements to S5 power consumption
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250616175019.3471583-1-superm1@kernel.org>
 <CAJZ5v0jc-tjs_a+RCzu6bvrbfhv5QHqsWx-zKjH0wpisiJciKA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAJZ5v0jc-tjs_a+RCzu6bvrbfhv5QHqsWx-zKjH0wpisiJciKA@mail.gmail.com>
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

On 7/3/25 10:29, Rafael J. Wysocki wrote:
> On Mon, Jun 16, 2025 at 7:50 PM Mario Limonciello <superm1@kernel.org> wrote:
>>
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> A variety of issues both in function and in power consumption have been
>> raised as a result of devices not being put into a low power state when
>> the system is powered off.
>>
>> There have been some localized changes[1] to PCI core to help these issues,
>> but they have had various downsides.
>>
>> This series instead tries to use the S4 flow when the system is being
>> powered off.  This lines up the behavior with what other operating systems
>> do as well.  If for some reason that fails or is not supported, unwind and
>> do the previous S5 flow that will wake all devices and run their shutdown()
>> callbacks.
> 
> I actually like this approach, but I think that it is risky.

Yeah; it does touch a lot of areas.

> 
> It also requires more work/review from other people.

I view patches 3-5 as being dependent upon patch 1, so until we have 
agreement on that one the others might not make a lot of sense.

Bjorn,

Can you take a look at patch 2?

> 
> I'll be sending some comments on the individual patches going forward,
> but I think the earliest it can go in is after 6.17-rc1 (given it is
> reviewed properly till then).

Thanks!

> 
> Thanks!
> 
>> v3->v4:
>>   * Fix LKP robot failure
>>   * Rebase on v6.16-rc2
>>
>> Previous submissions [1]:
>> Link: https://lore.kernel.org/linux-pm/CAJZ5v0hrKEJa8Ad7iiAvQ3d_0ysVhzZcXSYc5kkL=6vtseF+bg@mail.gmail.com/T/#m91e4eae868a7405ae579e89b135085f4906225d2
>> Link: https://lore.kernel.org/linux-pci/20250506041934.1409302-1-superm1@kernel.org/
>> Link: https://lore.kernel.org/linux-pci/20231213182656.6165-1-mario.limonciello@amd.com/ (v1)
>> Link: https://lore.kernel.org/linux-pm/20250514193406.3998101-1-superm1@kernel.org/ (v2)
>> Link: https://lore.kernel.org/linux-pm/20250609024619.407257-1-superm1@kernel.org/ (v3)
>>
>> Mario Limonciello (5):
>>    PM: Use hibernate flows for system power off
>>    PCI: Put PCIe ports with downstream devices into D3 at hibernate
>>    drm/amd: Avoid evicting resources at S5
>>    scsi: Add PM_EVENT_POWEROFF into suspend callbacks
>>    usb: sl811-hcd: Add PM_EVENT_POWEROFF into suspend callbacks
>>
>>   drivers/base/power/main.c                  |  7 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 +
>>   drivers/pci/pci-driver.c                   | 94 ++++++++++++++--------
>>   drivers/scsi/mesh.c                        |  1 +
>>   drivers/scsi/stex.c                        |  1 +
>>   drivers/usb/host/sl811-hcd.c               |  1 +
>>   include/linux/pm.h                         |  3 +
>>   include/trace/events/power.h               |  3 +-
>>   kernel/reboot.c                            |  6 ++
>>   9 files changed, 86 insertions(+), 34 deletions(-)
>>
>> --
>> 2.43.0
>>

