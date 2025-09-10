Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F8DB5202D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 20:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8989210E108;
	Wed, 10 Sep 2025 18:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KcZJc5UZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C309210E108;
 Wed, 10 Sep 2025 18:19:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B5FF60144;
 Wed, 10 Sep 2025 18:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61C2C4CEEB;
 Wed, 10 Sep 2025 18:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757528372;
 bh=uBarSWVZDS4Lt/Bpz0Y8ELG+lIiOkRDsn7DHzuClKZc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KcZJc5UZTwc0wofGvxxq2FBhHgbZ5fs5NyP+6wPuiiSgT1bZz0TytSTw/uMELW5ZF
 8UcTllAe/98UFQl0OQ8ytwLrNtZHaf3QpceCrrr1SsWwACyx7bwNSaK4H+Slp1+Nap
 kIDGpx5Jh6iKl6XxgaU9FpjwqC3Qz/sMVL1glg5OgO6o0PsYkaL2WHGQjfkV31HOlo
 6ti4symxV8GXV1B36aN2MmMUs3o/38/i2KJE5uteMXb//OS0WrsV6v4M/8VXwsX2eQ
 vlnecr9Yb7W2/TX/TSIyVnbQQdGOVfhbSupEKE354MLBlmXFK0qun9tHZkH2xms8Iy
 Ze3DQ7yf6G77g==
Message-ID: <b013c9bb-cf7c-424e-9ab0-8136bb9dc744@kernel.org>
Date: Wed, 10 Sep 2025 13:19:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/12] Improvements to S5 power consumption
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
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
 Eric Naim <dnaim@cachyos.org>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>
References: <20250909191619.2580169-1-superm1@kernel.org>
 <CAJZ5v0jZaP41CC_2Q4NfKZWB8VazJbmiOtv55i3QDngh_3YGOw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAJZ5v0jZaP41CC_2Q4NfKZWB8VazJbmiOtv55i3QDngh_3YGOw@mail.gmail.com>
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

On 9/10/25 1:11 PM, Rafael J. Wysocki wrote:
> Hi Mario,
> 
> On Tue, Sep 9, 2025 at 9:16 PM Mario Limonciello (AMD)
> <superm1@kernel.org> wrote:
>>
>> A variety of issues both in function and in power consumption have been
>> raised as a result of devices not being put into a low power state when
>> the system is powered off.
>>
>> There have been some localized changes[1] to PCI core to help these issues,
>> but they have had various downsides.
>>
>> This series instead uses the driver hibernate flows when the system is
>> being powered off or halted.  This lines up the behavior with what other
>> operating systems do as well.  If for some reason that fails or is not
>> supported, run driver shutdown() callbacks.
>>
>> Rafael did mention in earlier versions of the series concerns about
>> regression risk.  He was looking for thoughts from Greg who isn't against
>> it but also isn't sure about how to maintain it. [1]
>>
>> This has been validated by me and several others in AMD
>> on a variety of AMD hardware platforms. It's been validated by some
>> community members on their Intel hardware. To my knowledge it has not
>> been validated on non-x86.
> 
> Still, the patches need more work (see my replies to the relevant patches).

Yes, thanks for the review.
> 
>> On my development laptop I have also contrived failures in the hibernation
>> callbacks to make sure that the fallback to shutdown callback works.
>>
>> In order to assist with potential regressions the series also includes
>> documentation to help with getting a kernel log at shutdown after
>> the disk is unmounted.
>>
>> Cc: AceLan Kao <acelan.kao@canonical.com>
>> Cc: Kai-Heng Feng <kaihengf@nvidia.com>
>> Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Cc: Merthan Karakaş <m3rthn.k@gmail.com>
>> Cc: Eric Naim <dnaim@cachyos.org>
>> Link: https://lore.kernel.org/linux-usb/2025090852-coma-tycoon-9f37@gregkh/ [1]
>> ---
>> v6->v7:
>>   * Add documentation on how to debug a shutdown hang
>>   * Adjust commit messages per feedback from Bjorn
>>
>> Mario Limonciello (AMD) (12):
>>    PM: Introduce new PMSG_POWEROFF event
>>    scsi: Add PM_EVENT_POWEROFF into suspend callbacks
>>    usb: sl811-hcd: Add PM_EVENT_POWEROFF into suspend callbacks
>>    USB: Pass PMSG_POWEROFF event to suspend_common()
>>    PCI/PM: Disable device wakeups when halting or powering off system
>>    PCI/PM: Split out code from pci_pm_suspend_noirq() into helper
>>    PCI/PM: Run bridge power up actions as part of restore phase
>>    PCI/PM: Use pci_power_manageable() in pci_pm_poweroff_noirq()
>>    PCI: Put PCIe bridges with downstream devices into D3 at hibernate
>>    drm/amd: Avoid evicting resources at S5
>>    PM: Use hibernate flows for system power off
>>    Documentation: power: Add document on debugging shutdown hangs
> 
> If I were you, I'd split this series into 3 parts.
> 
> The first part would be the addition of PMSG_POWEROFF just for
> hibernation, which should not be objectionable (the first 4 patches
> above).
> 
> The next one would be changes to allow PCI bridges to go into
> D3hot/cold during the last stage of hibernation (the "power-off"
> transition).  This can be justified by itself even before starting to
> use the same power-off flow for the last stage of hibernation and for
> system power-down.
> 
> The last one would be the hibernation/power-down integration.
> 
> Each of the above can be posted separately and arguably you need to
> get the first part in before the other two and the second part in
> before the third one, preferably not in the same cycle.
> 
> This way, if there are any regressions in the first two parts, there
> will be at least some time to address them before the last part goes
> in.
> 
> Thanks!

Thanks for this proposal.

I do like the idea of splitting it in 3 parts to give time for 
regression control.

It's getting close to the end of this cycle, would you be opposed to a 
re-spun first 4 patches for 6.18?

Thanks,
