Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED715AD3A09
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F34710E131;
	Tue, 10 Jun 2025 13:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aVH1Jyaf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3297510E131
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:56:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4D3C3629F0;
 Tue, 10 Jun 2025 13:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B653DC4CEED;
 Tue, 10 Jun 2025 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749563780;
 bh=x8HxLtgh49bwcnaj+7dJSZyXTtOC1Z2x11pOJ/tiFpk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aVH1JyafE4SGFg5ojO7QC6JcoGBCYuo6+y9Kwd5Cu3Ad3oMm3DlLawk2wcQrU+1YQ
 v/UwZ+Rlj4PJOGP+eynC1NmmIjWVnAuC8DTlgHdn5VIlkKQwlLqd3z+pwKcOGh8th3
 kVv+K8zAzObgE53lzFDN6zaOmh9YbZI4f/pXHUUBIrjTlMJYhfB+o45/O5HgC00UdD
 RfErLpMXizpMLoLMGQPVffR02XnbBSopWkD74/bxcSRogB1MPQFpX+sDV6tjmTztLM
 aIPIhoGftUNnoITvgFLTk99DpqDulM5M8wfW+YhNFk2lNEEqXwr80pfGzcin9ikVvS
 Du8LmSnvcAIzQ==
Message-ID: <91a83d95-d4bc-49e1-b869-904c877c0f05@kernel.org>
Date: Tue, 10 Jun 2025 06:56:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] PCI/VGA: Look at all PCI display devices in VGA
 arbiter
To: Thomas Zimmermann <tzimmermann@suse.de>, mario.limonciello@amd.com,
 bhelgaas@google.com, Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
References: <20250609022435.348589-1-superm1@kernel.org>
 <9350317a-b6dc-4ba5-9bd5-2a63066cc460@suse.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <9350317a-b6dc-4ba5-9bd5-2a63066cc460@suse.de>
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

On 6/10/2025 6:35 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.06.25 um 04:24 schrieb Mario Limonciello:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> On an A+N mobile system the APU is not being selected by some desktop
>> environments for any rendering tasks. This is because the neither GPU
>> is being treated as "boot_vga" but that is what some environments use
>> to select a GPU [1].
>>
>> The VGA arbiter driver only looks at devices that report as PCI display
>> VGA class devices. Neither GPU on the system is a display VGA class
>> device:
>>
>> c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
>> c6:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] 
>> Device 150e (rev d1)
> 
> My understanding of vgaarb is that it manages concurrent usage of the 
> fixed VGA I/O ports. So are these actually VGA devices? I'm concerned 
> about vgaarb handling devices that aren't VGA and possible side effects 
> of that.

No; neither is a VGA device.  There was a suggestion to do this from 
userspace in libpciaccess [1] but Dave Airlie suggested it would be 
better to adjust the "meaning" of boot_vga, which is essentially what 
this RFC does.

[1] https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/37

> 
> As a side note, there's also video_is_primary_device(), which we use for 
> fbcon and which also uses vga_default_device() on x86. [1] This helper 
> should likely return the same value as sysfs' boot_vga attribute.
> 
> [1] https://elixir.bootlin.com/linux/v6.15.1/C/ident/ 
> video_is_primary_device
> 
>>
>> So neither device gets the boot_vga sysfs file. The vga_is_boot_device()
>> function already has some handling for integrated GPUs by looking at the
>> ACPI HID entries, so if all PCI display class devices are looked at it
>> actually can detect properly with this device ordering.  However if there
>> is a different ordering it could flag the wrong device.
>>
>> Modify the VGA arbiter code and matching sysfs file entries to examine 
>> all
>> PCI display class devices. After every device is added to the arbiter 
>> list
>> make a pass on all devices and explicitly check whether one is 
>> integrated.
>>
>> This will cause all GPUs to gain a `boot_vga` file, but the correct 
>> device
>> (APU in this case) will now show `1` and the incorrect device shows `0`.
>> Userspace then picks the right device as well.
>>
>> Link: https://github.com/robherring/libpciaccess/commit/ 
>> b2838fb61c3542f107014b285cbda097acae1e12 [1]
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/pci/pci-sysfs.c |  2 +-
>>   drivers/pci/vgaarb.c    | 53 ++++++++++++++++++++++++++---------------
>>   include/linux/pci.h     | 15 ++++++++++++
>>   3 files changed, 50 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
>> index 268c69daa4d57..c314ee1b3f9ac 100644
>> --- a/drivers/pci/pci-sysfs.c
>> +++ b/drivers/pci/pci-sysfs.c
>> @@ -1707,7 +1707,7 @@ static umode_t pci_dev_attrs_are_visible(struct 
>> kobject *kobj,
>>       struct device *dev = kobj_to_dev(kobj);
>>       struct pci_dev *pdev = to_pci_dev(dev);
>> -    if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
>> +    if (a == &dev_attr_boot_vga.attr && pci_is_display(pdev))
>>           return a->mode;
>>       return 0;
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index 78748e8d2dbae..8281144747487 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -139,7 +139,7 @@ void vga_set_default_device(struct pci_dev *pdev)
>>   {
>>       if (vga_default == pdev)
>>           return;
>> -
>> +    vgaarb_info(&pdev->dev, "selecting as VGA boot device\n");
> 
> vgaarb_dbg() please.
> 
>>       pci_dev_put(vga_default);
>>       vga_default = pci_dev_get(pdev);
>>   }
>> @@ -676,9 +676,9 @@ static bool vga_is_boot_device(struct vga_device 
>> *vgadev)
>>       }
>>       /*
>> -     * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>> -     * other VGA devices, it is the best candidate so far.
>> -     */
>> +    * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>> +    * other VGA devices, it is the best candidate so far.
>> +    */
> 
> This should be a separate patch.
> 
> Best regards
> Thomas
> 
>>       if (!boot_vga)
>>           return true;
>> @@ -751,6 +751,31 @@ static void 
>> vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
>>           vgaarb_info(&vgadev->pdev->dev, "no bridge control 
>> possible\n");
>>   }
>> +static
>> +void vga_arbiter_select_default_device(void)
>> +{
>> +    struct pci_dev *candidate = vga_default_device();
>> +    struct vga_device *vgadev;
>> +
>> +    list_for_each_entry(vgadev, &vga_list, list) {
>> +        if (vga_is_boot_device(vgadev)) {
>> +            /* check if one is an integrated GPU, use that if so */
>> +            if (candidate) {
>> +                if (vga_arb_integrated_gpu(&candidate->dev))
>> +                    break;
>> +                if (vga_arb_integrated_gpu(&vgadev->pdev->dev)) {
>> +                    candidate = vgadev->pdev;
>> +                    break;
>> +                }
>> +            } else
>> +                candidate = vgadev->pdev;
>> +        }
>> +    }
>> +
>> +    if (candidate)
>> +        vga_set_default_device(candidate);
>> +}
>> +
>>   /*
>>    * Currently, we assume that the "initial" setup of the system is 
>> not sane,
>>    * that is, we come up with conflicting devices and let the arbiter's
>> @@ -816,13 +841,6 @@ static bool vga_arbiter_add_pci_device(struct 
>> pci_dev *pdev)
>>           bus = bus->parent;
>>       }
>> -    if (vga_is_boot_device(vgadev)) {
>> -        vgaarb_info(&pdev->dev, "setting as boot VGA device%s\n",
>> -                vga_default_device() ?
>> -                " (overriding previous)" : "");
>> -        vga_set_default_device(pdev);
>> -    }
>> -
>>       vga_arbiter_check_bridge_sharing(vgadev);
>>       /* Add to the list */
>> @@ -833,6 +851,7 @@ static bool vga_arbiter_add_pci_device(struct 
>> pci_dev *pdev)
>>           vga_iostate_to_str(vgadev->owns),
>>           vga_iostate_to_str(vgadev->locks));
>> +    vga_arbiter_select_default_device();
>>       spin_unlock_irqrestore(&vga_lock, flags);
>>       return true;
>>   fail:
>> @@ -1499,8 +1518,8 @@ static int pci_notify(struct notifier_block *nb, 
>> unsigned long action,
>>       vgaarb_dbg(dev, "%s\n", __func__);
>> -    /* Only deal with VGA class devices */
>> -    if (!pci_is_vga(pdev))
>> +    /* Only deal with display devices */
>> +    if (!pci_is_display(pdev))
>>           return 0;
>>       /*
>> @@ -1548,12 +1567,8 @@ static int __init vga_arb_device_init(void)
>>       /* Add all VGA class PCI devices by default */
>>       pdev = NULL;
>> -    while ((pdev =
>> -        pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>> -                   PCI_ANY_ID, pdev)) != NULL) {
>> -        if (pci_is_vga(pdev))
>> -            vga_arbiter_add_pci_device(pdev);
>> -    }
>> +    while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev)))
>> +        vga_arbiter_add_pci_device(pdev);
>>       pr_info("loaded\n");
>>       return rc;
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 05e68f35f3923..e77754e43c629 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -744,6 +744,21 @@ static inline bool pci_is_vga(struct pci_dev *pdev)
>>       return false;
>>   }
>> +/**
>> + * pci_is_display - Check if a PCI device is a display controller
>> + * @pdev: Pointer to the PCI device structure
>> + *
>> + * This function determines whether the given PCI device corresponds
>> + * to a display controller. Display controllers are typically used
>> + * for graphical output and are identified based on their class code.
>> + *
>> + * Return: true if the PCI device is a display controller, false 
>> otherwise.
>> + */
>> +static inline bool pci_is_display(struct pci_dev *pdev)
>> +{
>> +    return (pdev->class >> 16) == PCI_BASE_CLASS_DISPLAY;
>> +}
>> +
>>   #define for_each_pci_bridge(dev, bus)                \
>>       list_for_each_entry(dev, &bus->devices, bus_list)    \
>>           if (!pci_is_bridge(dev)) {} else
> 

