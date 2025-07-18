Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0BB0A9E8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 20:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9257410EA2C;
	Fri, 18 Jul 2025 18:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="snR7cUWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1403910EA2C;
 Fri, 18 Jul 2025 18:02:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3190C601E4;
 Fri, 18 Jul 2025 18:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31649C4CEEB;
 Fri, 18 Jul 2025 18:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752861731;
 bh=9gbDS2Rr9beCpsYg25XZUXXeDJsoQe1hI6qfRj03xus=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=snR7cUWK/mqnhvQntZ/tEA5j4RKRYBInG83M9tPbAwqIuBSXNHoDv0e0Aoq8mmoUw
 LBbayIbOIoYIcbahBGFTMGVJ5+62EBIcn41us9JyWav1fTPyvRTX1KS6GvgdUOkB78
 PxbJ+S0NK+b52SYQNj8plmCRWyjTPKR90k1RN3JI+Jp5S0SVhS8EwK6C5zL5xbyTPc
 1SGWNHM3KQ8kOLkGNihvGocduq4zvMkiEuq0h7u4wFmQa5xZU6BssAN7yvLqh/+5C0
 PGy2JINjp/UZ+En3shWkr8cc0zVWaLBPCPJcO6i2TQ0VvEu4ypDjXGrK3cYeGIN6EA
 yRdmRJVw0uEQw==
Message-ID: <1c64c181-4e96-4274-975b-454f7207af92@kernel.org>
Date: Fri, 18 Jul 2025 13:02:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: DDC I2C Display Freezing for internal displays
To: Felix Richter <judge@felixrichter.tech>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, jonas@3j14.de
References: <0863bc3e-7364-4572-bb72-fc85657cbad7@felixrichter.tech>
 <d9706fe0-7965-457d-830e-19f9aafee855@felixrichter.tech>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <d9706fe0-7965-457d-830e-19f9aafee855@felixrichter.tech>
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

On 7/17/2025 2:42 PM, Felix Richter wrote:
> Hi,
> 
> just tested that this Bug still exists in kernel version 6.16-rc6. The 
> example trigger from my previous mail still works triggering screen 
> freezing shortly after invocation.
> 
> I also learned that setting kernel param `amdgpu.dcdebugmask=0x10` works 
> as a workaround.
> 
> Kind regards,
> Felix Richter
> 
> On 4/22/25 21:44, Felix Richter wrote:
>> Hi,
>>
>> it has been quite at while since I first started experiencing this 
>> particular bug I am about to describe. Suffice it to say during my 
>> Easter holiday I finally had the time to dig into it. It all started 
>> with an update of linux LTS from 6.6 to 6.12.
>>
>> I am a user of the sway tiling window manager and have written a small 
>> utility to manage my display configuration across different setups. 
>> With the added twist that I wrote some code to determine which monitor 
>> inputs is currently in use using the monitor command interface. Anyway 
>> the interesting detail here is that, starting with kernel 6.12 I 
>> started running into the following problem. With my display management 
>> daemon running and attaching my Laptop to an external display my 
>> internal display would just freeze with no way to bring it back apart 
>> from power cycling the entire device. When my management daemon was 
>> not running this would not happen, I would then need to manually 
>> configure my display setup. Further investigation into the what is 
>> triggering the display freeze lead me into the part of the code where 
>> I am enumerating attached displays and am trying to match `i2c` 
>> devices to their corresponding display.
>>
>> To get more specific the procedure is as follows, using udev enumerate 
>> all `i2c` busses and filter them base on some heuristics like device 
>> name and devices with parent devices drm / graphics device. Sadly this 
>> is not quite enough to already match an `i2c` command interface to the 
>> corresponding monitor, in many cases it is required to manually read 
>> the EDID information via the i2c interface and compare it to the known 
>> attached displays to get the match. And this is where the trigger for 
>> the display freeze is to be found.
>>
>> Here is the output when scanning sysfs for my internal laptop display:
>> ```
>> # ls -al /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/drm/card1/ 
>> card1-eDP-1
>> total 0
>> drwxr-xr-x  6 root root    0 22. Apr 18:07 .
>> drwxr-xr-x 11 root root    0 22. Apr 18:07 ..
>> drwxr-xr-x  3 root root    0 22. Apr 18:07 amdgpu_bl1
>> -r--r--r--  1 root root 4096 22. Apr 18:07 connector_id
>> lrwxrwxrwx  1 root root    0 22. Apr 18:07 ddc -> ../../../i2c-3
>> lrwxrwxrwx  1 root root    0 22. Apr 18:07 device -> ../../card1
>> -r--r--r--  1 root root 4096 22. Apr 18:07 dpms
>> drwxr-xr-x  3 root root    0 22. Apr 18:07 drm_dp_aux0
>> -r--r--r--  1 root root    0 22. Apr 18:07 edid
>> -r--r--r--  1 root root 4096 22. Apr 18:07 enabled
>> drwxr-xr-x  4 root root    0 22. Apr 18:07 i2c-11
>> -r--r--r--  1 root root 4096 22. Apr 18:07 modes
>> drwxr-xr-x  2 root root    0 22. Apr 18:07 power
>> -rw-r--r--  1 root root 4096 22. Apr 18:07 status
>> lrwxrwxrwx  1 root root    0 22. Apr 18:07 subsystem - 
>> > ../../../../../../../class/drm
>> -rw-r--r--  1 root root 4096 22. Apr 18:07 uevent
>> ```
>>
>> As can be seen there are two i2c devices present, i2c-3 (as ddc 
>> symlink) and i2c-11. Now from the perspective of udev i2c-11 has the 
>> parent set to card1-eDP-1 while i2c-3 has the parent set to the drm 
>> device itself. More importantly I can not rule out i2c-3 as a valid 
>> command interface because in some cases valid command channels are 
>> never assigned to the corresponding display output directly but only 
>> live directly on the drm device, this is especially true when monitors 
>> are not attached directly but via a docking station. So I do have to 
>> look at each i2c device on its own. The freeze is trigged by trying to 
>> read edid from i2c-3: This is the code snipped I used to trigger the 
>> bug: https://github.com/ju6ge/libmonitor/ 
>> blob/918b2543eafb96aca29f66debc70fd18fa21ee11/examples/via-i2c-dev.rs 
>> (adjusted target i2c interface accordingly). To be absolutely clear 
>> this is not the i2c device that is expected to work in every case of 
>> trying this with kernel 6.6 to 6.12 I get the following error message: 
>> DdcError(CommunicationError(ReceiveError(EIO: I/O error))). That is 
>> expected internal laptop displays do not support the command interface 
>> in most cases anyway. But what I do not expect to happen is that my 
>> Laptop screen freezes! And since this did not happen with kernel 6.6 
>> but started happening with 6.12 this seems to be a software issue and 
>> with that a regression!
>>
>> Next I bisected the kernel from 6.6 to 6.12 to determine when this 
>> regression was introduced. I attached the full bisect log to the email ;)
>>
>> The offending commit seems to be:
>>
>> [58a261bfc96763a851cb48b203ed57da37e157b8] drm/amd/display: use a more 
>> lax vblank enable policy for older ASICs
>>
>> Since this is quite a small commit I validated this by reverting the 
>> changes on a newer kernel version (patch attached as well). Testing 
>> actually shows that reverting the change resolves the screen freezing 
>> behavior for me.
>>
>> Now I am not deep enough into graphics drivers to claim that just 
>> reverting the commit should be considered a valid fix. Just that the 
>> change is definitely responsible for the screen freezing now as 
>> apposed to before.
>>
>> So what should be done here? I can validate any other suggested fixes 
>> against my setup or provide more information if need be.
>>
>> Kind regards,
>> Felix Richter
>>
>> #regzbot introduced: v6.6..v6.12
> 
> 

At least to me, this issue sounds like a case that multiple entities are 
trying to communicate with the panel at the same time.

By setting dcdebugmask=0x10 what you're essentially doing is stopping 
the display hardware from trying to put the panel into PSR.  So there is 
"less" I2C traffic to fight with.

*Why* are you using I2C to read the EDID like this?  Could you instead 
use /sys/class/drm/cardX-inputY/edid?  Or even better - can you use the 
information from drm_info to make decisions?

I think the less I2C traffic done directly from userspace the better 
when it comes to synchronization issues..

