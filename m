Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D6DB0B119
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 19:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CCC10E223;
	Sat, 19 Jul 2025 17:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gatwbfxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C75210E21E;
 Sat, 19 Jul 2025 17:36:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 98184A4349F;
 Sat, 19 Jul 2025 17:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDC2C4CEE3;
 Sat, 19 Jul 2025 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752946574;
 bh=44wgI47wrOzsyT1vKaR7dEk+7It5cIoMnjiaGGwhXlc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gatwbfxGjylsKK3L6pBkfAPStX9THgmcE0LyDdcH/bbCuLNF70nqfENxghQizsour
 3b5uUZFGN9GTyo6/Bnu3UDDTSjhuTtn8eKlKeoz0wdZ1AS1t4Au1Q1Y2FWRJ/HE/5u
 BlluDynoYxNpvidyVcMwK+QmkDshIim220euGavmrL5cWpiSeyQ/XnIooJrZzp0nqt
 q7NuiBz1DGwD1Yjgo2mCR5vG8e5oDKwbw6QFEF1SlSVYj7ZY2BnTByQq7rRa3Bglxc
 /jd4+tVrdUMrtBkR4I1sqvwHVa9BBWn6npeY3D4CaKb4uqDV9bUSRmVjJhjFkHXlxU
 KmhLY7dPkVFdQ==
Message-ID: <305ee11e-981a-49e7-b66d-552751921f09@kernel.org>
Date: Sat, 19 Jul 2025 12:36:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: DDC I2C Display Freezing for internal displays
To: Leo Li <sunpeng.li@amd.com>, Felix Richter <judge@felixrichter.tech>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jonas@3j14.de, seanpaul@chromium.org, Harry Wentland <harry.wentland@amd.com>
References: <0863bc3e-7364-4572-bb72-fc85657cbad7@felixrichter.tech>
 <d9706fe0-7965-457d-830e-19f9aafee855@felixrichter.tech>
 <1c64c181-4e96-4274-975b-454f7207af92@kernel.org>
 <5f63ae37-793e-4e34-a8ab-1845121fcd7e@felixrichter.tech>
 <79d7b8a1-b472-4f32-a724-1f2303fb2cab@kernel.org>
 <19229f06-9062-492b-90fd-b6c931e29146@felixrichter.tech>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <19229f06-9062-492b-90fd-b6c931e29146@felixrichter.tech>
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



On 7/19/25 12:02 PM, Felix Richter wrote:
> On 7/19/25 14:23, Mario Limonciello wrote:
>>
>> On 7/19/25 5:10 AM, Felix Richter wrote:
>>> Thanks for the reply.
>>>
>>> I am aware that i can read and `edid` via sysfs from the drm device. 
>>> I did not know about `drm_info` but from a quick look at it I don't 
>>> think it provides the information I need.
>>>
>>> The problem is not that I need more information about the attached 
>>> display. The problem is that there is not enough information about 
>>> the what `i2c` device corresponds to which monitors ddc channel. 
>>> Relying on udev hierarchies is not sufficient, because in many cases 
>>> the relevant i2c device has no parent drm output device. So when I 
>>> have no information about the i2c device I need to get more 
>>> information by reading from it. Then I know more and can map the 
>>> device to the correct display. I am happy to change the approach if 
>>> there is a simpler way for me to get this information.
>>
>> ❯ ls -alh /sys/class/drm/*/ddc
> Nice, I will consider adding that information to the logic for matching 
> i2c devices to displays. But I do have to tell you that still is not 
> sufficient in every case. It probably works for all direct interfaces 
> that are always present on the device. But it fails to match i2c ddc 
> channels when monitors are attached via a docking station using USB-C. 
> Those monitors will not even show up in the command you provided. This 
> again leads me to having to probe the i2c device directly anyway.

Presumably you're meaning with a dock that has an MST hub?

I suppose an optimization that you can do to avoid hitting this issue 
you've raised is exclude the matches to eDP panels from /sys/class/drm/.

> 
>> I get where you're coming from, but there are cases that are 
>> ultimately impossible to prevent when it comes to "long", or 
>> "frequent" sequences and responding to interrupts. There are lots of 
>> examples like this in the kernel that if you break what a driver is 
>> doing with a device from a userspace interface you get to pick up the 
>> pieces.
>>
>> I'll give you two examples:
>>
>> 1) You can access R/W PCI config data.
>> /sys/bus/pci/devices/*/config
>>
>> You can break power management state machines, bus mastering, really 
>> anything a device driver can do from a userspace application.  For 
>> example if I had a userspace app that did something like this:
>>
>> dd if=/dev/zero of=/sys/bus/pci/devices/${BDF}/config bs=1 count=4096
>>
>> and it broke how can the kernel do anything about it?
>>
>> 2) There was a case that fwupd was doing something very similar to you 
>> with a "probe" but with the DP aux character device.  It was trying to 
>> detect devices with updates and would fight specifically with link 
>> training.  The outcome was non-functional devices.  The workaround 
>> currently employed is that fwupd will wait a few seconds (5 or 10, I 
>> forget) and then do the probe to avoid that fight.  This doesn't solve 
>> things though because there are pulse interrupts that could still come 
>> at any time. The DP spec has response requirements for these.
>>
>> We talked about it at the display next hackfest this year and the 
>> decision was this information that fwupd was needing should be pushed 
>> into the kernel (let fwupd probe a sysfs file that gets cached data 
>> the driver fetched).
>>
> I get that you can not protect against every case of malicious use. I am 
> not sure that my example qualifies as that extreme though. I am only 
> trying to read some data, that is in no way comparable to actively 
> changing values.

Reading a lot of data (such as an EDID) can take a "while".  If you're 
in the middle of the I2C transactions and the driver tries to put it 
into PSR I guess that's where things are going wrong.

Maybe what we need in this case is to actively block PSR while userspace 
I2C traffic is happening?

This is a better question for Leo if that's feasible (or reasonable).

>>
>>> People have been experiencing similar screen freezing issues randomly 
>>> on this drm issue thread: https://gitlab.freedesktop.org/drm/amd/-/ 
>>> issues/4141#note_3016182> > This example highlights an issue that can 
>>> be triggered reliably with a
>>> very similar effect. It may not be the same issue, but they may be 
>>> related.
>>
>> Yeah; I'm aware of this thread and agree it's an issue with similar 
>> symptoms.
> 
> At the very least I hope that my example code for triggering a similar 
> issue can help figure out what is going on there ;)

