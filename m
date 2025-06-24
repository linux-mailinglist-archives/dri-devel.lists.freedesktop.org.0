Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18BAE6CCC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 18:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F1B10E19C;
	Tue, 24 Jun 2025 16:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TfvzZR/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007F110E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 16:48:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2AF3A51FFB;
 Tue, 24 Jun 2025 16:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A303AC4CEE3;
 Tue, 24 Jun 2025 16:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750783728;
 bh=oQ1jbpZY26uLhcovpi99AHhjhynbQIDhCOwniw/kLP0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TfvzZR/fYpui/a9fNXGb7tsI/EUZhlLeCnYb27CR99Srqf6zNPIOsJlmfeTuFanQd
 +U8LSrvF2KJfjmg9Dj8afnFHGuJNPLwcACdFl9oekBU5rVtPUCXwyKp49bEiA6va0G
 D822dRBTWbaEg42k/S41DXH5Fm+CLGFZTkyzOG7ykSr4sOkWqV+nX+CXeB3OUOogMJ
 +hsktnQLM+lh57CpY8wjn/nzK9UO55m2DoY0PiaAF+ylQ4aV6DjBd16hW7pTGD+Piy
 9tWuJ4Lfcrmp1JfhNZoShtc5/hVK1DzqJLhRd0eqhUmr1upBlQhxNkTsFcvNdSBGMt
 ys6f6Kg5zVTRA==
Message-ID: <939129a9-0a93-4539-b651-b08fcddf57b5@kernel.org>
Date: Tue, 24 Jun 2025 11:48:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] PCI/VGA: Move check for firmware default out of
 VGA arbiter
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250623184757.3774786-1-superm1@kernel.org>
 <20250623184757.3774786-8-superm1@kernel.org>
 <f0e70269-b55e-4ac8-b052-da092a177eda@suse.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <f0e70269-b55e-4ac8-b052-da092a177eda@suse.de>
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

On 6/24/25 4:21 AM, Thomas Zimmermann wrote:
> 
> 
> Am 23.06.25 um 20:47 schrieb Mario Limonciello:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> The x86 specific check for whether a framebuffer belongs to a device
>> works for display devices as well as VGA devices.  Callers to
>> video_is_primary_device() can benefit from checking non-VGA display
>> devices.
>>
>> Move the x86 specific check into x86 specific code, and adjust VGA
>> arbiter to call that code as well. This allows fbcon to find the
>> right PCI device on systems that don't have VGA devices.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v4:
>>   * use helper
>> ---
>>   arch/x86/video/video-common.c | 13 ++++++++++++-
>>   drivers/pci/vgaarb.c          | 36 ++---------------------------------
>>   2 files changed, 14 insertions(+), 35 deletions(-)
>>
>> diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video- 
>> common.c
>> index 81fc97a2a837a..917568e4d7fb1 100644
>> --- a/arch/x86/video/video-common.c
>> +++ b/arch/x86/video/video-common.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> +#include <linux/screen_info.h>
>>   #include <linux/vgaarb.h>
>>   #include <asm/video.h>
>> @@ -27,6 +28,7 @@ EXPORT_SYMBOL(pgprot_framebuffer);
>>   bool video_is_primary_device(struct device *dev)
>>   {
>> +    struct screen_info *si = &screen_info;
>>       struct pci_dev *pdev;
>>       if (!dev_is_pci(dev))
>> @@ -34,7 +36,16 @@ bool video_is_primary_device(struct device *dev)
>>       pdev = to_pci_dev(dev);
>> -    return (pdev == vga_default_device());
>> +    if (!pci_is_display(pdev))
>> +        return false;
>> +
>> +    if (pdev == vga_default_device())
>> +        return true;
>> +
>> +    if (pdev == screen_info_pci_dev(si))
>> +        return true;
>> +
>> +    return false;
>>   }
>>   EXPORT_SYMBOL(video_is_primary_device);
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index 78748e8d2dbae..15ab58c70b016 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -26,12 +26,12 @@
>>   #include <linux/poll.h>
>>   #include <linux/miscdevice.h>
>>   #include <linux/slab.h>
>> -#include <linux/screen_info.h>
>>   #include <linux/vt.h>
>>   #include <linux/console.h>
>>   #include <linux/acpi.h>
>>   #include <linux/uaccess.h>
>>   #include <linux/vgaarb.h>
>> +#include <asm/video.h>
>>   static void vga_arbiter_notify_clients(void);
>> @@ -554,38 +554,6 @@ void vga_put(struct pci_dev *pdev, unsigned int 
>> rsrc)
>>   }
>>   EXPORT_SYMBOL(vga_put);
>> -static bool vga_is_firmware_default(struct pci_dev *pdev)
>> -{
>> -#if defined(CONFIG_X86)
>> -    u64 base = screen_info.lfb_base;
>> -    u64 size = screen_info.lfb_size;
>> -    struct resource *r;
>> -    u64 limit;
>> -
>> -    /* Select the device owning the boot framebuffer if there is one */
>> -
>> -    if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
>> -        base |= (u64)screen_info.ext_lfb_base << 32;
>> -
>> -    limit = base + size;
>> -
>> -    /* Does firmware framebuffer belong to us? */
>> -    pci_dev_for_each_resource(pdev, r) {
>> -        if (resource_type(r) != IORESOURCE_MEM)
>> -            continue;
>> -
>> -        if (!r->start || !r->end)
>> -            continue;
>> -
>> -        if (base < r->start || limit >= r->end)
>> -            continue;
>> -
>> -        return true;
>> -    }
>> -#endif
>> -    return false;
>> -}
>> -
>>   static bool vga_arb_integrated_gpu(struct device *dev)
>>   {
>>   #if defined(CONFIG_ACPI)
>> @@ -623,7 +591,7 @@ static bool vga_is_boot_device(struct vga_device 
>> *vgadev)
>>       if (boot_vga && boot_vga->is_firmware_default)
>>           return false;
>> -    if (vga_is_firmware_default(pdev)) {
>> +    if (video_is_primary_device(&pdev->dev)) {
> 
> Doesn't this generate a cyclic dependency between vgaarb and video? I 
> find this call cycle hard to reason about because 
> vgaarb_default_device() depends on the results of these boot-device 
> tests. Maybe keep vga_is_firmware_default() and just replace its content 
> with a call to screen_info_pci_dev().
> Best regards
> Thomas

OK, I'll do that, thanks.

> 
>>           vgadev->is_firmware_default = true;
>>           return true;
>>       }
> 

