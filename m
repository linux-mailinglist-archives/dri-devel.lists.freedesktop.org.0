Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD14AE24EC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 00:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8453110EBC4;
	Fri, 20 Jun 2025 22:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DCGTkk84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D270010EBC4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 22:17:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0CDA61136;
 Fri, 20 Jun 2025 22:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5DBC4CEE3;
 Fri, 20 Jun 2025 22:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750457869;
 bh=snYopvsiCq4b2vwnac6pmoTUyZPOxpsdJWVhg5Rc8Tw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DCGTkk844k/dx7H3Y4wFJdO37+twNnnSN1ap6pg1rC6bsnuygUGQizkn5BibpxKX/
 uy5rok7SzMTt5PHXkZMxiMZKI0lpakipXWmvMdiko31m9U2WjpkGktBoOxyC3KFABv
 eb9ABKwjUTrGE0a7oJn6xub7jSi43BJniBFpKuTEoLb1th3N0b4AlLx3sEKOQhZ7vQ
 6Di4vmZtPdY5nkD6FUgJ7Pq//aFdCHsrSFUgbg5kDu2IVRTv893lVsJucWj54+rO0n
 DLpc74Z+u6fLGkq0Qgk+AD07zXUBnHkrip2fnDykkYEuVWP7Ll3Jo1L5oc1zIg0L3N
 dDCiABPSBa9IQ==
Message-ID: <fa3bfed9-8a6f-4001-bd4a-d4d237b001d3@kernel.org>
Date: Fri, 20 Jun 2025 17:17:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] PCI/VGA: Move check for firmware default out of
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
References: <20250620024943.3415685-1-superm1@kernel.org>
 <20250620024943.3415685-7-superm1@kernel.org>
 <704d2a80-79bb-4247-a2aa-25bd3eb9a7e5@suse.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <704d2a80-79bb-4247-a2aa-25bd3eb9a7e5@suse.de>
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

On 6/20/2025 3:45 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.06.25 um 04:49 schrieb Mario Limonciello:
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
>>   arch/x86/video/video-common.c | 28 +++++++++++++++++++++++++++
>>   drivers/pci/vgaarb.c          | 36 ++---------------------------------
>>   2 files changed, 30 insertions(+), 34 deletions(-)
>>
>> diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video- 
>> common.c
>> index 81fc97a2a837a..718116e35e450 100644
>> --- a/arch/x86/video/video-common.c
>> +++ b/arch/x86/video/video-common.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> +#include <linux/screen_info.h>
>>   #include <linux/vgaarb.h>
>>   #include <asm/video.h>
>> @@ -27,13 +28,40 @@ EXPORT_SYMBOL(pgprot_framebuffer);
>>   bool video_is_primary_device(struct device *dev)
> 
> I'm not sure I understand this patch. video_is_primary_device() already 
> exists for 3 architectures, including x86. [1] Adding it here should 
> produce an error. (?)

I wasn't adding a new implementation of it, I was augmenting the x86 
implementation.

But I guess based on your below point it just needs to call 
screen_info_pci_dev().

> 
> [1] https://elixir.bootlin.com/linux/v6.15.2/A/ident/ 
> video_is_primary_device
> 
> The code on x86 is
> 
> bool <https://elixir.bootlin.com/linux/v6.15.2/C/ident/ 
> bool>video_is_primary_device <https://elixir.bootlin.com/linux/v6.15.2/ 
> C/ident/video_is_primary_device>(structdevice <https:// 
> elixir.bootlin.com/linux/v6.15.2/C/ident/device>*dev) { structpci_dev 
> <https://elixir.bootlin.com/linux/v6.15.2/C/ident/pci_dev>*pdev; if(! 
> dev_is_pci <https://elixir.bootlin.com/linux/v6.15.2/C/ident/ 
> dev_is_pci>(dev)) returnfalse <https://elixir.bootlin.com/linux/v6.15.2/ 
> C/ident/false>; pdev=to_pci_dev <https://elixir.bootlin.com/linux/ 
> v6.15.2/C/ident/to_pci_dev>(dev); return(pdev==vga_default_device 
> <https://elixir.bootlin.com/linux/v6.15.2/C/ident/vga_default_device>()); }
> 
> I was thinking about extending it to test for additional properties, 
> like this
> 
> bool <https://elixir.bootlin.com/linux/v6.15.2/C/ident/ 
> bool>video_is_primary_device <https://elixir.bootlin.com/linux/v6.15.2/ 
> C/ident/video_is_primary_device>(structdevice <https:// 
> elixir.bootlin.com/linux/v6.15.2/C/ident/device>*dev) { structpci_dev 
> <https://elixir.bootlin.com/linux/v6.15.2/C/ident/pci_dev>*pdev; if(! 
> dev_is_pci <https://elixir.bootlin.com/linux/v6.15.2/C/ident/ 
> dev_is_pci>(dev)) returnfalse <https://elixir.bootlin.com/linux/v6.15.2/ 
> C/ident/false>; pdev=to_pci_dev <https://elixir.bootlin.com/linux/ 
> v6.15.2/C/ident/to_pci_dev>(dev); if(pdev==vga_default_device <https:// 
> elixir.bootlin.com/linux/v6.15.2/C/ident/vga_default_device>()) return 
> true for_each_pci_dev() { // test if display and could be primary. } 
> return false; // nothing found }
> 

The above looks like some bad copy / paste.  Could you clarify?

> 
> This would then be called from per-device sysfs code that export a 
> property similar to boot_vga (such as boot_display).

Here's the other idea I had in mind.

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 268c69daa4d57..8535950b4c0f3 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -30,6 +30,7 @@
  #include <linux/msi.h>
  #include <linux/of.h>
  #include <linux/aperture.h>
+#include <asm/video.h>
  #include "pci.h"

  #ifndef ARCH_PCI_DEV_GROUPS
@@ -679,6 +680,13 @@ const struct attribute_group *pcibus_groups[] = {
         NULL,
  };

+static ssize_t boot_console_show(struct device *dev, struct 
device_attribute *attr,
+                                char *buf)
+{
+       return sysfs_emit(buf, "%u\n", video_is_primary_device(dev));
+}
+static DEVICE_ATTR_RO(boot_console);
+
  static ssize_t boot_vga_show(struct device *dev, struct 
device_attribute *attr,
                              char *buf)
  {
@@ -1698,6 +1706,7 @@ late_initcall(pci_sysfs_init);

  static struct attribute *pci_dev_dev_attrs[] = {
         &dev_attr_boot_vga.attr,
+       &dev_attr_boot_console.attr,
         NULL,
  };

@@ -1710,6 +1719,9 @@ static umode_t pci_dev_attrs_are_visible(struct 
kobject *kobj,
         if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
                 return a->mode;

+       if (a == &dev_attr_boot_console.attr && pci_is_display(pdev))
+               return a->mode;
+
         return 0;
  }


> 
> 
> The issue is currently just an x86 problem, but I can imagine something 
> similar happening on ARM. There we'd have to go through the DT tree to 
> figure out the primary device. That's a problem for a later patch set, 
> but we should keep this in mind.

I think that the sysfs file idea above would work for any arch.

> 
>>   {
>> +    u64 base = screen_info.lfb_base;
>> +    u64 size = screen_info.lfb_size;
>>       struct pci_dev *pdev;
>> +    struct resource *r;
>> +    u64 limit;
>>       if (!dev_is_pci(dev))
>>           return false;
>>       pdev = to_pci_dev(dev);
>> +    if (!pci_is_display(pdev))
>> +        return false;
>> +
>> +    /* Select the device owning the boot framebuffer if there is one */
>> +    if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
>> +        base |= (u64)screen_info.ext_lfb_base << 32;
>> +
>> +    limit = base + size;
>> +
>> +    /* Does firmware framebuffer belong to us? */
>> +    pci_dev_for_each_resource(pdev, r) {
>> +        if (resource_type(r) != IORESOURCE_MEM)
>> +            continue;
>> +
>> +        if (!r->start || !r->end)
>> +            continue;
>> +
>> +        if (base < r->start || limit >= r->end)
>> +            continue;
>> +
>> +        return true;
>> +    }
>> +
> 
> You can drop all this code and call screen_info_pci_dev() instead. I 
> simply never got to update vgaarb to use it.

👍

> 
> [2] https://elixir.bootlin.com/linux/v6.15.2/source/drivers/video/ 
> screen_info_pci.c#L109
> 
>>       return (pdev == vga_default_device());
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
> Maybe not change this because you don't want to end up with non-VGA 
> devices here.

👍

> 
> Best regards
> Thomas
> 
>>           vgadev->is_firmware_default = true;
>>           return true;
>>       }
> 

