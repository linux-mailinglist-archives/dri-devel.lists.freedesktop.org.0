Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEEDBD0A5D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F8010E192;
	Sun, 12 Oct 2025 19:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="koUnk/1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFCD10E192
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:07:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4384160054;
 Sun, 12 Oct 2025 19:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92D5C4CEE7;
 Sun, 12 Oct 2025 19:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760296018;
 bh=DnR0msbAZQb+cqUGYPlAa9RGqHdYtjRoz9MBPzHQDIE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=koUnk/1MK6Oa1TymZBtnRqXIiDLZyuCW5goUBwiCYEdMIsu3ki0zr5T2RYMPjZsZ6
 CuNpcNu6da6S/LH0gASrPQSh+yGvJC79jELyQ+vBanWk/QPdKMXbYYbUUr3+EczDL0
 Mi48QmgwAZF2GBDufa3xPISdwziEpGSdwXaBPLLE+9LkrLvz9L8oO303YMb83z9K7O
 YYLwOhOpts41G3RBqxPi3fQXy+C2bH5bYWjPTzTHZNv42VwxNOgSYkrwvqX/Ro8RbX
 btQIZYq4INTruynJFf/9ltxXPc2H218RjqQPkNatxjMcsmybz/Z/JdwymQjUBWxvqc
 uirkp/OlP/Hrw==
Message-ID: <65c24236-044c-4b65-baaa-dc0011ea69d8@kernel.org>
Date: Sun, 12 Oct 2025 14:06:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] PCI/VGA: Replace vga_is_firmware_default() with a
 screen info check
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>
References: <20250811162606.587759-1-superm1@kernel.org>
 <20250811162606.587759-3-superm1@kernel.org> <20251012182302.GA3412@sol>
 <1be1a119-1fbd-435f-bb27-70f48d677ebf@kernel.org> <20251012184717.GB3412@sol>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251012184717.GB3412@sol>
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



On 10/12/25 1:47 PM, Eric Biggers wrote:
> On Sun, Oct 12, 2025 at 01:37:33PM -0500, Mario Limonciello wrote:
>>
>>
>> On 10/12/25 1:23 PM, Eric Biggers wrote:
>>> Hi,
>>>
>>> On Mon, Aug 11, 2025 at 11:26:04AM -0500, Mario Limonciello (AMD) wrote:
>>>> vga_is_firmware_default() checks firmware resources to find the owner
>>>> framebuffer resources to find the firmware PCI device.  This is an
>>>> open coded implementation of screen_info_pci_dev().  Switch to using
>>>> screen_info_pci_dev() instead.
>>>>
>>>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>
>>> I'm getting a black screen on boot on mainline, and it bisected to this
>>> commit.  Reverting this commit fixed it.
>>>
>>> Please revert.
>>>
>>> - Eric
>>
>> Can you please share more information about your issue before we jump
>> straight into a revert?  What kind of hardware do you have?  Perhaps a
>> kernel log from mainline and another from mainline with the revert could
>> help identify what's going on?
>>
>> A revert might be the right solution, but I would rather fix the issue if
>> it's plausible to do so.
> 
> Relevant hardware is:
>      AMD Ryzen 9 9950X 16-Core Processor
>      Radeon RX 9070
> 
> The following message appears in the good log but not the bad log:
> 
>      fbcon: amdgpudrmfb (fb0) is primary device
> 
> I don't have CONFIG_SCREEN_INFO enabled, so the commit changed
> vga_is_firmware_default() to always return false.

Thanks, that definitely explains it.

> 
> If DRM_AMDGPU depends on SCREEN_INFO now, it needs to select it.
> 
> - Eric

Well the question now is which driver should actually select it.

Although it manifested for you in amdgpu, I don't think this is going to 
be an amdgpu unique issue.

Maybe this:

diff --git a/drivers/video/fbdev/core/Kconfig 
b/drivers/video/fbdev/core/Kconfig
index 006638eefa41..ce2544924b0e 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -5,6 +5,7 @@

  config FB_CORE
         select VIDEO
+       select SCREEN_INFO
         tristate

  config FB_NOTIFY
