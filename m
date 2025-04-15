Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B33A8A391
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 18:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1216D10E7EC;
	Tue, 15 Apr 2025 16:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ui7ufRea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C778310E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:02:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD73A5C587E;
 Tue, 15 Apr 2025 16:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4240C4CEEB;
 Tue, 15 Apr 2025 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744732958;
 bh=xYa5Lnluzzq1XF7Fg3wlxoInTdc1bHVBlw4ZuU5aC5o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ui7ufReajCs8Nqo/0Btxjg6riJmM4AzFgBXnbUsTJZW2EAoUI++wY04hW+5B0vebP
 peGQ3RxQeDFY2pL2WZM1AO9ULG65sarGtM0Cu75IFDMRQHXm0vcfgUCJJAKVloB8C6
 hzLeceI7VsGuQZQyy6LmY+ni18R1hOSi9DCOkTQP1R1iYazC8ZRausYONXYduWdSOW
 Qd7bhjYvpJhtoOlcnAql5KQCvDghFsGCcSykxnFwBHOLFNNJcAfgdMRDB/++66XGCU
 2yRfBx69dGMTB8AoEvM4CZDQmmef9z6Xll9tYtqSdARhlNJEx7YGV5ShRh0mcXw+SK
 JZ0PFZVCPT18w==
Message-ID: <9663cf9b-6cb6-45b2-9e93-aaf73dec0155@kernel.org>
Date: Tue, 15 Apr 2025 11:02:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: backlight: Clarify `actual_brightness`
To: Lee Jones <lee@kernel.org>
Cc: mario.limonciello@amd.com, danielt@kernel.org, jingoohan1@gmail.com,
 Lennart Poettering <lennart@poettering.net>,
 richard.purdie@linuxfoundation.org, dri-devel@lists.freedesktop.org
References: <20250408192729.4091391-1-superm1@kernel.org>
 <20250415155319.GZ372032@google.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250415155319.GZ372032@google.com>
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

On 4/15/2025 10:53 AM, Lee Jones wrote:
> On Tue, 08 Apr 2025, Mario Limonciello wrote:
> 
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Currently userspace software systemd treats `brightness` and
>> `actual_brightness` identically due to a bug found in an out of tree
>> driver.
>>
>> This however causes problems for in-tree drivers that use brightness
>> to report user requested `brightness` and `actual_brightness` to report
>> what the hardware actually has programmed.
>>
>> Clarify the documentation to match the behavior described in commit
>> 6ca017658b1f9 ("[PATCH] backlight: Backlight Class Improvements").
>>
>> Cc: Lennart Poettering <lennart@poettering.net>
>> Cc: richard.purdie@linuxfoundation.org
>> Link: https://github.com/systemd/systemd/pull/36881
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   Documentation/ABI/stable/sysfs-class-backlight | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/stable/sysfs-class-backlight b/Documentation/ABI/stable/sysfs-class-backlight
>> index 6102d6bebdf9a..909cacde85041 100644
>> --- a/Documentation/ABI/stable/sysfs-class-backlight
>> +++ b/Documentation/ABI/stable/sysfs-class-backlight
>> @@ -26,7 +26,9 @@ Date:		March 2006
>>   KernelVersion:	2.6.17
>>   Contact:	Richard Purdie <rpurdie@rpsys.net>
>>   Description:
>> -		Show the actual brightness by querying the hardware.
>> +		Show the actual brightness by querying the hardware. This
>> +		takes into account other factors besides the value programmed
>> +		for 'brightness' and may not match the value in 'brightness'.
> 
> Which factors?  Under what circumstances may the values not match?

Is this question for your background or are you saying these should be 
enumerated here in the documentation?

Richard Purdie mentioned:

"The challenge back then was that things like framebuffer blanking would 
turn off the backlight but the single brightness attribute was 
implemented inconsistently. Some drivers would report no backlight when 
blanking was active, some would report the value stored in brightness. 
This had multiple issues"

For AMD the two cases that can cause this on amdgpu are Custom 
brightness curves and Adaptive Backlight Management (ABM).


> 
>>   Users:		HAL
>>   
>>   What:		/sys/class/backlight/<backlight>/max_brightness
>> -- 
>> 2.43.0
>>
> 

