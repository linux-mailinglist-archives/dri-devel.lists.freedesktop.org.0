Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AC0AEE6DC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 20:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BBA10E4B5;
	Mon, 30 Jun 2025 18:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cN0BY4IO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3910010E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 18:37:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2EF295C5CEE;
 Mon, 30 Jun 2025 18:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30071C4CEE3;
 Mon, 30 Jun 2025 18:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751308626;
 bh=c9uAtQKv4NYSwOH3r6TmzxlDwchzoTPDdAumVK3QfAE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cN0BY4IOJa5X2g2U3gCon69bn9LJ3stx8QA5hrzXp/BuSkQlIBXr9owVFkfIQTC+i
 gbevZsHJPC1WyYnYvdPYEL91IJ2/N6DoxveR04QbFyx6sA2nWsmVNYb+lJgXF96SeX
 fTjZxs0DpCyyGxjUuaRuWOYr6/l9sIVsSazrq5LY2WB2f0ldsBh5FxaOJ/LUm5hb/G
 f+VS55iyLyYAY0W6MI5CHOqOhkPU+GCAeYMEAit1eh6ZOWaRVokC0AYuKghiH9ePAu
 1USlB1R/WPC6UZHa4PM5WQsndNqeQ7z2FC8TedHUsWzGl4QbBpdCr6Ld4RD2WKYpPy
 9JTJKfTYMm60g==
Message-ID: <8f9efe23-c774-477d-97ad-8e22532ad6b2@kernel.org>
Date: Mon, 30 Jun 2025 14:37:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] PCI: Add a new 'boot_display' attribute
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
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
 Mario Limonciello <mario.limonciello@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20250627043108.3141206-1-superm1@kernel.org>
 <20250627043108.3141206-10-superm1@kernel.org>
 <41587824-4a05-4ead-b24c-4729007cd663@suse.de>
 <8878af70-3eb8-495b-b8df-43a10285c4f5@kernel.org>
 <732aeb75-71e7-49e7-a5f2-2080ee94a273@suse.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <732aeb75-71e7-49e7-a5f2-2080ee94a273@suse.de>
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

On 6/30/2025 2:24 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.06.25 um 17:37 schrieb Mario Limonciello:
>> On 6/27/2025 2:07 AM, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 27.06.25 um 06:31 schrieb Mario Limonciello:
>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>
>>>> On systems with multiple GPUs there can be uncertainty which GPU is the
>>>> primary one used to drive the display at bootup. In order to 
>>>> disambiguate
>>>> this add a new sysfs attribute 'boot_display' that uses the output of
>>>> video_is_primary_device() to populate whether a PCI device was used for
>>>> driving the display.
>>>>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>> v6:
>>>>   * Only show for the device that is boot display
>>>>   * Only create after PCI device sysfs files are initialized to ensure
>>>>     that resources are ready.
>>>> v4:
>>>>   * new patch
>>>> ---
>>>>   Documentation/ABI/testing/sysfs-bus-pci |  8 +++++
>>>>   drivers/pci/pci-sysfs.c                 | 46 +++++++++++++++++++++ 
>>>> ++++
>>>
>>> The code looks good. Just one more question: could this be added 
>>> independently from the PCI bus (at a reasonable cost)? There are 
>>> other busses that can host the boot display. Alternatively, we'd add 
>>> this attribute per bus as needed.
>>
>> It depends upon the underlying hardware implementation.  On x86 it's 
>> always PCI and so I realized there is a requirement that PCI resources 
>> are setup before screen_info event works.
>>
>> That is the v5 version of this patch would have had a potential race 
>> condition with userspace where boot_display didn't always show '1' if 
>> userspace read it too quickly.
>>
>> Other architecture's hardware implementation might have similar problem.
>>
>> So in summary I think it would be better to do it per-bus.  If we 
>> realize there is indeed code duplication we can always move this to a 
>> common helper at that point.
> 
> Ok, makes sense. With the kernel test robot's issues fixed:
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, I've got a fix locally for it.
> 
> I guess that interface also needs some sort of OK from user-space devs?
> 

Who needs to OK it?  I do have MR's for matching userspace 
implementations mentioned in the cover letter already.

> Best regards
> Thomas
> 
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>>   2 files changed, 54 insertions(+)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-pci b/ 
>>>> Documentation/ ABI/testing/sysfs-bus-pci
>>>> index 69f952fffec72..8b455b1a58852 100644
>>>> --- a/Documentation/ABI/testing/sysfs-bus-pci
>>>> +++ b/Documentation/ABI/testing/sysfs-bus-pci
>>>> @@ -612,3 +612,11 @@ Description:
>>>>             # ls doe_features
>>>>             0001:01        0001:02        doe_discovery
>>>> +
>>>> +What:        /sys/bus/pci/devices/.../boot_display
>>>> +Date:        October 2025
>>>> +Contact:    Linux PCI developers <linux-pci@vger.kernel.org>
>>>> +Description:
>>>> +        This file indicates the device was used as a boot
>>>> +        display. If the device was used as the boot display, the file
>>>> +        will be present and contain "1".
>>>> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
>>>> index 268c69daa4d57..cc766461de1da 100644
>>>> --- a/drivers/pci/pci-sysfs.c
>>>> +++ b/drivers/pci/pci-sysfs.c
>>>> @@ -30,6 +30,7 @@
>>>>   #include <linux/msi.h>
>>>>   #include <linux/of.h>
>>>>   #include <linux/aperture.h>
>>>> +#include <asm/video.h>
>>>>   #include "pci.h"
>>>>   #ifndef ARCH_PCI_DEV_GROUPS
>>>> @@ -679,6 +680,13 @@ const struct attribute_group *pcibus_groups[] = {
>>>>       NULL,
>>>>   };
>>>> +static ssize_t boot_display_show(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                 char *buf)
>>>> +{
>>>> +    return sysfs_emit(buf, "1\n");
>>>> +}
>>>> +static DEVICE_ATTR_RO(boot_display);
>>>> +
>>>>   static ssize_t boot_vga_show(struct device *dev, struct 
>>>> device_attribute *attr,
>>>>                    char *buf)
>>>>   {
>>>> @@ -1246,6 +1254,37 @@ static int pci_create_attr(struct pci_dev 
>>>> *pdev, int num, int write_combine)
>>>>       return 0;
>>>>   }
>>>> +/**
>>>> + * pci_create_boot_display_file - create a file in sysfs for @dev
>>>> + * @pdev: dev in question
>>>> + *
>>>> + * Creates a file `boot_display` in sysfs for the PCI device @pdev
>>>> + * if it is the boot display device.
>>>> + */
>>>> +static int pci_create_boot_display_file(struct pci_dev *pdev)
>>>> +{
>>>> +#ifdef CONFIG_VIDEO
>>>> +    if (video_is_primary_device(&pdev->dev))
>>>> +        return sysfs_create_file(&pdev->dev.kobj, 
>>>> &dev_attr_boot_display.attr);
>>>> +#endif
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * pci_remove_boot_display_file - remove the boot display file for 
>>>> @dev
>>>> + * @pdev: dev in question
>>>> + *
>>>> + * Removes the file `boot_display` in sysfs for the PCI device @pdev
>>>> + * if it is the boot display device.
>>>> + */
>>>> +static void pci_remove_boot_display_file(struct pci_dev *pdev)
>>>> +{
>>>> +#ifdef CONFIG_VIDEO
>>>> +    if (video_is_primary_device(&pdev->dev))
>>>> +        sysfs_remove_file(&pdev->dev.kobj, 
>>>> &dev_attr_boot_display.attr);
>>>> +#endif
>>>> +}
>>>> +
>>>>   /**
>>>>    * pci_create_resource_files - create resource files in sysfs for 
>>>> @dev
>>>>    * @pdev: dev in question
>>>> @@ -1654,9 +1693,15 @@ static const struct attribute_group 
>>>> pci_dev_resource_resize_group = {
>>>>   int __must_check pci_create_sysfs_dev_files(struct pci_dev *pdev)
>>>>   {
>>>> +    int retval;
>>>> +
>>>>       if (!sysfs_initialized)
>>>>           return -EACCES;
>>>> +    retval = pci_create_boot_display_file(pdev);
>>>> +    if (retval)
>>>> +        return retval;
>>>> +
>>>>       return pci_create_resource_files(pdev);
>>>>   }
>>>> @@ -1671,6 +1716,7 @@ void pci_remove_sysfs_dev_files(struct pci_dev 
>>>> *pdev)
>>>>       if (!sysfs_initialized)
>>>>           return;
>>>> +    pci_remove_boot_display_file(pdev);
>>>>       pci_remove_resource_files(pdev);
>>>>   }
>>>
>>
> 

