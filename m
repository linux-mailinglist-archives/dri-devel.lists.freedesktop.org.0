Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057ABB48DC1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A7E10E4F7;
	Mon,  8 Sep 2025 12:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ufv6Hcx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FED10E4F7;
 Mon,  8 Sep 2025 12:39:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D63D60051;
 Mon,  8 Sep 2025 12:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D710C4CEF1;
 Mon,  8 Sep 2025 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757335150;
 bh=Kmgj7JQ2MfTOSMke4wzOHnSg8Sksyl64nAuAQ+DhI4A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ufv6Hcx6jWD5AxW92cK+ljuNUfSXKHnQZv3kXveaEsZj/qc477qtV8lnGeC+yl2LV
 RS+Xs28IVJiEsEENic3DIoEPQdZSHhAU4cy+TktV0KVy4p51YIFXAv1grFur5A4cuH
 6bQZcKwbFMBzc6sdl3QoFscqqxGb0GSshxGjTLYgZ5ZSGs+wSs4Anmp+mAqfz/3G43
 d2i25P5YPiPUgIUQnhTbmOJCWuiJLaNYNMsOWex5ofVrrPe+JZ78aYrYUP0jSNG4sY
 WuOYdOOajtBz008C++gHVHO1nJV3AOOUYzXAxps+DjP5BGGjNMGuX5Ral+AlLsdZhH
 w1T2hkMKtFUDQ==
Message-ID: <af78dfb4-de61-4b8c-a131-cf39a4c3c4b0@kernel.org>
Date: Mon, 8 Sep 2025 07:39:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 RESEND 00/11] Improvements to S5 power consumption
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
 Eric Naim <dnaim@cachyos.org>
References: <20250906143642.2590808-1-superm1@kernel.org>
 <2025090852-coma-tycoon-9f37@gregkh>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <2025090852-coma-tycoon-9f37@gregkh>
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



On 9/8/25 4:19 AM, Greg Kroah-Hartman wrote:
> On Sat, Sep 06, 2025 at 09:36:31AM -0500, Mario Limonciello (AMD) wrote:
>> A variety of issues both in function and in power consumption have been
>> raised as a result of devices not being put into a low power state when
>> the system is powered off.
>>
>> There have been some localized changes[1] to PCI core to help these issues,
>> but they have had various downsides.
>>
>> This series instead tries to use the S4 flow when the system is being
>> powered off.  This lines up the behavior with what other operating systems
>> do as well.  If for some reason that fails or is not supported, run their
>> shutdown() callbacks.
>>
>> Cc: AceLan Kao <acelan.kao@canonical.com>
>> Cc: Kai-Heng Feng <kaihengf@nvidia.com>
>> Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Cc: Merthan Karakaş <m3rthn.k@gmail.com>
>> Cc: Eric Naim <dnaim@cachyos.org>
>> ---
>> v6 RESEND:
>>   * Resent because Greg said he was ignoring it and would like the whole
>>     series to be able to review.
> 
> Messy, but wow, I'll trust you all that this actually works properly.

Yes; I double checked from a UART log all devices (now) went to correct 
state and from power measurement hardware the respective drop in power.

I will note I have a sampling bias of hardware being x86 AMD hardware.
Some of the testers of the series also tested Intel hardware which had 
similar power consumption problem, and I know there were improvements 
there too.

We probably will have to wait for linux-next for non-x86 hardware coverage.
> No objections from me, but I don't want my ack on this as I don't know
> how to maintain it :)
> 

I mean - if all goes well even a failed S4 flow should fall back to old 
path shutdown.  I *did contrive some failures* in an earlier version of 
the series and confirmed in the UART log it emitted the printk that it 
was falling back to shutdown.

I had two ideas that maybe could help for regression risk though:
1) I could add a shutdown= kernel parameter.  I'm not sure what words to 
use for the two paths but the idea would be if someone had a shutdown 
failure they could isolate if it's due to this by adding the parameter.

2) I could make a Documentation/ file explaining some examples how to 
get the shutdown log saved to pstore in case they don't have a UART 
available.

