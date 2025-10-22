Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36486BFC0A7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F73389FC9;
	Wed, 22 Oct 2025 13:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VEbSZO0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A26489FC9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:12:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BF5EE40ACA;
 Wed, 22 Oct 2025 13:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8F0C113D0;
 Wed, 22 Oct 2025 13:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761138739;
 bh=yBHR7y586f34RE597LrcoiflUGA6yV2u1+7RPUJObhI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VEbSZO0M8V5yNkjf3zT9+M6ogRcwERrmqzP/TchbiXz/7+REkNA6NUfm2iNGjtWUA
 3PJtTmwo+aLvzSQuTdm2bhY/iYpTLvIqu7YT4QHTVvJxifm/TGmHLA+Hido//ygR1x
 qfv36KpNpGsbdZjfBAy8IHMgfNTDLhl8zmAuILvidkda5PTGhhkHHUbPYU1DOhEi9b
 OsK+4DiwHXMBb2dRydT8EfHhaPZckXvOHELM6LdIuzVKw/3crythIm/rXHwx2sFL3c
 J4IDHxxyPNu7QXaOkDbgJPQaa2kZwpwvkghhulaZ1rcesm6S+FPN+Yl6EUwYMe86Kc
 NWIRwRw2AexQA==
Message-ID: <9eb60fce-b235-4dad-8672-1cc4e61309c5@kernel.org>
Date: Wed, 22 Oct 2025 15:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding EDID support to simpledrm on top of the EFI sysfb ?
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, nickblack@linux.com
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <301d7da1-5101-4f16-90cd-5bb4ac41c87b@kernel.org>
 <b99e3a32-6d3e-48a0-9936-a67999354a44@suse.de>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <b99e3a32-6d3e-48a0-9936-a67999354a44@suse.de>
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

Hi Thomas,

On 11-Oct-25 5:17 PM, Thomas Zimmermann wrote:
> Hi Hans
> 
> Am 11.10.25 um 12:02 schrieb Hans de Goede:
>> Hi,
>>
>> A while ago I did a blogpost about not having the native GPU drivers in
>> the initrd: https://hansdegoede.dreamwidth.org/28291.html
>>
>> With the Fedora /boot partition size increase there has been renewed
>> interest in this and as a result I got an interesting comment on
>> the blog post pointing out that there are EFI protocols to get EDID
>> info for the monitor (presumably for the one the GOP has lit up).
>>
>> It would be useful to see if we can hook this up so that the simpledrm
>> device can report the physical dimensions of the screen and the boot
>> splash does not need to guess the DPI and thus does not need to guess
>> whether to do hiDPI scaling or not. The comment is here:
>>
>> https://hansdegoede.dreamwidth.org/28291.html?thread=14467#cmt14467
>>
>> and it points to:
>>
>> https://uefi.org/sites/default/files/resources/2_-_AMD_UEFI_Plugfest_EDID_Spring2012.pdf
>> https://uefi.org/specs/UEFI/2.9_A/12_Protocols_Console_Support.html
>>
>> Unfortunately I do not have time to work on this myself, hence this
>> email in the hope that someone else can pick this idea up.
> 
> There are now efidrm and vesadrm, which support specifically the features that we get from the rsp. standards, hardware  and bootloader. For VESA and EFI the EDID can be transferred from grub via bootparams. A patch [1] is on its way into upstream grub. The Linux kernel stores that data in edid_info, from where it is picked up by efidrm and vesadrm.  If the EFI framebuffer comes directly from the EFI calls, we need to implement this in the kernel, but the principle is the same. I also have ideas for making this work on Coreboot.
> 
> For simpledrm, I'd rather strip if from the ability to use EFI/VESA framebuffers and focus on simple-framebuffer DT nodes. These sometimes come with DPI information. Maybe we could extend the DT to support EDID as well.
> 
> [1] https://lists.gnu.org/archive/html/grub-devel/2025-10/msg00043.html
> 
> I have long been working on all this and it is now slowly coming together.

Cool, thank you for working on this!

I agree that if we are going to have efidrm and vesadrm that
making simpledrm a DT platform thing only makes sense.

I do wonder about the choice to primarily make the EDID passing
a grub thing though.

Some distros are actively trying to move away from grub since
grub is quite a complex beast and they are trying to move to
something simpler like systemd-boot. As such it would be a good
idea IMHO if efidrm could directly get the EDID from EFI itself.

Note I'm afraid I don't really have time to work on this myself.

Regards,

Hans


