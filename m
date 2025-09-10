Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BF7B51ED6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 19:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE27F10E98C;
	Wed, 10 Sep 2025 17:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IaFCKbV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5C710E188;
 Wed, 10 Sep 2025 17:24:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B2C444198;
 Wed, 10 Sep 2025 17:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDA5C4CEEB;
 Wed, 10 Sep 2025 17:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757525072;
 bh=1IdKMoeb2R+xnIWdnO7rRaMblx2EnlGCpTsdLPuakQM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IaFCKbV81ZeaLR3AD5rUkKSYgXSVzQVcu9fg8JUs10Fq0M7K22m2AbssN0bP1q6Ux
 B6rCHuW3lfqsdW4bib8qfmqLO56KZGiYD5A5cVINpNmOAsbHhw5G115+3oHcsLHfnb
 i5zEbnRZGnzxhc3OVdJVVTLWIhsMcMtH7l21By5E23FkdULVegygSNCSK+ijas9uiy
 bDmf0B+MF82+JdaCthE501HqOmx9AtUJpCvQJ2yNu/bzldJWzYbJM/rO1KT9Ca2kMz
 6qfF3QG9IJYbXXJDYoKLjoXS8u8PunK0sQQq6K9X3EvjtNy52w0TRvV7aIZHzO3Bcy
 jfwyKi4rfvltg==
Message-ID: <0bb2cb92-0d31-4e42-b6ef-2cc3fdf0df40@kernel.org>
Date: Wed, 10 Sep 2025 12:24:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/12] PCI/PM: Disable device wakeups when halting or
 powering off system
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
References: <20250910171132.GA1541776@bhelgaas>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250910171132.GA1541776@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 9/10/25 12:11 PM, Bjorn Helgaas wrote:
> On Wed, Sep 10, 2025 at 11:52:00AM -0500, Mario Limonciello wrote:
>> On 9/10/25 10:06 AM, Bjorn Helgaas wrote:
>>> On Tue, Sep 09, 2025 at 02:16:12PM -0500, Mario Limonciello (AMD) wrote:
>>>> PCI devices can be configured as wakeup sources from low power states.
>>>> However, when the system is halting or powering off such wakeups are
>>>> not expected and may lead to spurious behavior.
>>>
>>> I'm a little unclear on the nomenclature for these low power states,
>>> so I think it would be helpful to connect to the user action, e.g.,
>>> suspend/hibernate/etc, and the ACPI state, e.g.,
>>>
>>>     ... when the system is hibernating (e.g., transitioning to ACPI S4
>>>     and halting) or powering off (e.g., transitioning to ACPI S5 soft
>>>     off), such wakeups are not expected ...
>>
>> I will try to firm it up in the commit message.  But yes you're getting the
>> intent, having a wakeup occur at S5 would be unexpected, and would likely
>> change semantics of what people "think" powering off a machine means.
>>
>>> When I suspend or power off my laptop from the GUI user interface, I
>>> want to know if keyboard or mouse activity will resume or if I need to
>>> press the power button.
>>
>> The way the kernel is set up today you get a single wakeup sysfs file for a
>> device and that wakeup file means 3 things:
>> * abort the process of entering a suspend state or hibernate
>> * wake up the machine from a suspend state
>> * wake up the machine from hibernate
>>
>>>> ACPI r6.5, section 16.1.5 notes:
>>>>
>>>>       "Hardware does allow a transition to S0 due to power button press
>>>>        or a Remote Start."
>>>
>>> Important to note here that sec 16.1.5 is specifically for "S5
>>> Soft Off State".
>>>
>>> S4 is a sleeping state and presumably sec 16.1.6 ("Transitioning
>>> from the Working to the Sleeping State") applies.  That section
>>> mentions wakeup devices, so it's not obvious to me that PCI device
>>> wakeup should be disabled for S4.
>>
>> It actually /shouldn't/ be disabled for S4 - it should only be
>> disabled for S5.
>>
>> Are you implying a bug in the flow?  I didn't think there was one:
>>
>> During entering hibernate the poweroff() call will have system_state
>> = SYSTEM_SUSPEND so wakeups would be enabled.
>>
>> For powering off the system using hibernate flows poweroff() call
>> would have system_state = SYSTEM_HALT or SYSTEM_POWER_OFF.
> 
> OK.  I assumed that since you check for two states (SYSTEM_HALT or
> SYSTEM_POWER_OFF), one must be hibernate (ending up in S4?) and the
> other a soft power off (ending up in S5?).
> 
> But it sounds like there are two ways to power off.  I'm just confused
> about the correspondence between hibernate, soft poweroff, S4, S5,
> SYSTEM_HALT, and SYSTEM_POWER_OFF.
> 
> *Do* both SYSTEM_HALT and SYSTEM_POWER_OFF lead to S5 on an ACPI
> system?  If so, what's the difference between them?

The two functions are kernel_halt() and kernel_power_off().

And looking again, Ahhhh!  kernel_power_off() is the only thing that 
actually leads to machine_power_off().  Halt just stops the CPUs.

I think we should only be using the hibernate flows for SYSTEM_POWER_OFF.

This has implications for a lot of the patches.  Thanks a lot for 
pointing this out. I'll walk the series again and change accordingly.

> 
>>>> This implies that wakeups from PCI devices should not be relied upon
>>>> in these states. To align with this expectation and avoid unintended
>>>> wakeups, disable device wakeup capability during these transitions.
>>>>
>>>> Tested-by: Eric Naim <dnaim@cachyos.org>
>>>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>> ---
>>>> v7:
>>>>    * Reword title
>>>>    * Reword commit
>>>> v5:
>>>>    * Re-order
>>>>    * Add tags
>>>> v4:
>>>>    * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@kernel.org/
>>>> ---
>>>>    drivers/pci/pci-driver.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
>>>> index 63665240ae87f..f201d298d7173 100644
>>>> --- a/drivers/pci/pci-driver.c
>>>> +++ b/drivers/pci/pci-driver.c
>>>> @@ -1139,6 +1139,10 @@ static int pci_pm_poweroff(struct device *dev)
>>>>    	struct pci_dev *pci_dev = to_pci_dev(dev);
>>>>    	const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : NULL;
>>>> +	if (device_may_wakeup(dev) &&
>>>> +	    (system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF))
>>>> +		device_set_wakeup_enable(dev, false);
>>>> +
>>>>    	if (pci_has_legacy_pm_support(pci_dev))
>>>>    		return pci_legacy_suspend(dev, PMSG_HIBERNATE);
>>>> -- 
>>>> 2.43.0
>>>>
>>

