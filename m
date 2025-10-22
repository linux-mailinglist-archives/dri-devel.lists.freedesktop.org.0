Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A111EBFC0D7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5AF610E113;
	Wed, 22 Oct 2025 13:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JcAzFJfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEF010E113
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:13:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9C395629D7;
 Wed, 22 Oct 2025 13:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695B9C4CEFF;
 Wed, 22 Oct 2025 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761138808;
 bh=kp+uQWYXxPMZxgD4LtpXGvVyIG4kByZ/Jkeu70F6K5s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JcAzFJfh69tv2vIvy4N/Wv7LpuetDKvlhz6fxcxNZv5Uwtj2eFKlVbSct+DSbns5x
 QH0WKKwnJOZiadQ1RLKwKKMYY2U8HuoIllbU4SKks+p7xt+lt/rodSNbeWZFwgwvfW
 vYdBUExqBwBPZ7dhTXTv4FmMSkFJErKMhHD1LF+NCWvJpHisXUkNDT7hBKChxCWLm/
 ILc4M8TWtOzh2dE0TjmTlxsdEBbbQnERyoz6AKkxw4jXeUUBgykst6+F1J1SLgAyTv
 uDfXYo8ODEBHIp1dcY3J9mCG17wGcWr3mu7/gDvWBDVRiZT4j6Q1JkXbkyo3HisG/U
 3ZEyZ3QtxLAZg==
Message-ID: <2ec9acd0-3bd7-4233-9b1f-d198340c4066@kernel.org>
Date: Wed, 22 Oct 2025 15:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding EDID support to simpledrm on top of the EFI sysfb ?
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, nickblack@linux.com
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <301d7da1-5101-4f16-90cd-5bb4ac41c87b@kernel.org>
 <b99e3a32-6d3e-48a0-9936-a67999354a44@suse.de>
 <871pn7i5xf.fsf@ocarina.mail-host-address-is-not-set>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <871pn7i5xf.fsf@ocarina.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 13-Oct-25 10:04 AM, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> 
> Hello Hans,
> 
>> Hi Hans
>>
>> Am 11.10.25 um 12:02 schrieb Hans de Goede:
>>> Hi,
>>>
>>> A while ago I did a blogpost about not having the native GPU drivers in
>>> the initrd: https://hansdegoede.dreamwidth.org/28291.html
>>>
>>> With the Fedora /boot partition size increase there has been renewed
>>> interest in this and as a result I got an interesting comment on
>>> the blog post pointing out that there are EFI protocols to get EDID
>>> info for the monitor (presumably for the one the GOP has lit up).
>>>
>>> It would be useful to see if we can hook this up so that the simpledrm
>>> device can report the physical dimensions of the screen and the boot
>>> splash does not need to guess the DPI and thus does not need to guess
>>> whether to do hiDPI scaling or not. The comment is here:
>>>
>>> https://hansdegoede.dreamwidth.org/28291.html?thread=14467#cmt14467
>>>
>>> and it points to:
>>>
>>> https://uefi.org/sites/default/files/resources/2_-_AMD_UEFI_Plugfest_EDID_Spring2012.pdf
>>> https://uefi.org/specs/UEFI/2.9_A/12_Protocols_Console_Support.html
>>>
>>> Unfortunately I do not have time to work on this myself, hence this
>>> email in the hope that someone else can pick this idea up.
>>
>> There are now efidrm and vesadrm, which support specifically the 
>> features that we get from the rsp. standards, hardware  and bootloader. 
>> For VESA and EFI the EDID can be transferred from grub via bootparams. A 
>> patch [1] is on its way into upstream grub. The Linux kernel stores that 
>> data in edid_info, from where it is picked up by efidrm and vesadrm.  If 
>> the EFI framebuffer comes directly from the EFI calls, we need to 
>> implement this in the kernel, but the principle is the same. I also have 
>> ideas for making this work on Coreboot.
>>
>> For simpledrm, I'd rather strip if from the ability to use EFI/VESA 
>> framebuffers and focus on simple-framebuffer DT nodes. These sometimes 
>> come with DPI information. Maybe we could extend the DT to support EDID 
>> as well.
>>
>> [1] https://lists.gnu.org/archive/html/grub-devel/2025-10/msg00043.html
>>
>> I have long been working on all this and it is now slowly coming together.
>>
> 
> I agree with Thomas.
> 
> We are still not enabling these DRM drivers in Fedora though, but maybe it
> is time to do that and just disable CONFIG_SYSFB_SIMPLEFB. I can propose a
> change request for Fedora 44 to do this.

Trying to drive this forward by enabling this in Fedora 44 so this gets
more test coverage sounds like a good plan to me!

Thanks & Regards,

Hans


