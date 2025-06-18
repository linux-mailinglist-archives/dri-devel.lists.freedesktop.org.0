Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8A7ADF62C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C780510E909;
	Wed, 18 Jun 2025 18:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hRrNC2H2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0C910E8DF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 18:45:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0DC85629E7;
 Wed, 18 Jun 2025 18:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A706C4CEEF;
 Wed, 18 Jun 2025 18:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750272343;
 bh=kbXAVpybQ2pDJoOh5xCA8sgCP7NubFSj4yGjwUtH7RA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=hRrNC2H2IBsPTgQYQSA8Xg3omiE3vcsZbrhWm88sx6eRH8ApMQXqxoWHRTIPc7Rgg
 sDNxvlqwAJiuitvuH0rkeYX6+Kvh18Eke5FU6A1CzSIyecKPJUq3wqICErHjeFnACP
 wE9z2GZ//HzavUx909tQyzmmHs9QiH5YPvhdRLOuzCYBQCF+1tYQ8B/y8nNiHoeOlZ
 gisotdvj7cUs+u1yyKmAGVYNjvjahEcOmg5E6AvyXgG51oB/DtETcrgxr7q3mQVLnL
 1qlaBFyuXZlEwql4Y3YW+agIOHa9ilzm+eer6pmJbOOwf3Dv5/e6dpaq1W+ml1XtL4
 Jbp89RX+5B4Ng==
Message-ID: <8ee5d492-4777-4dc7-a001-0bdbb3bff2a4@kernel.org>
Date: Wed, 18 Jun 2025 13:45:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] vgaarb: Look at all PCI display devices in VGA
 arbiter
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250617175910.1640546-1-superm1@kernel.org>
 <20250617175910.1640546-7-superm1@kernel.org>
 <20250617132228.434adebf.alex.williamson@redhat.com>
 <08257531-c8e4-47b1-a5d1-1e67378ff129@kernel.org>
 <4b4224b8-aa91-4f21-8425-2adf9a2b3d38@suse.de>
 <aFLJTSIPVE0EnNvh@phenom.ffwll.local>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aFLJTSIPVE0EnNvh@phenom.ffwll.local>
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

On 6/18/2025 9:12 AM, Simona Vetter wrote:
> On Wed, Jun 18, 2025 at 11:11:26AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 17.06.25 um 22:22 schrieb Mario Limonciello:
>>>
>>>
>>> On 6/17/25 2:22 PM, Alex Williamson wrote:
>>>> On Tue, 17 Jun 2025 12:59:10 -0500
>>>> Mario Limonciello <superm1@kernel.org> wrote:
>>>>
>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>
>>>>> On a mobile system with an AMD integrated GPU + NVIDIA discrete GPU the
>>>>> AMD GPU is not being selected by some desktop environments for any
>>>>> rendering tasks. This is because neither GPU is being treated as
>>>>> "boot_vga" but that is what some environments use to select a GPU [1].
>>>>>
>>>>> The VGA arbiter driver only looks at devices that report as PCI display
>>>>> VGA class devices. Neither GPU on the system is a PCI display VGA class
>>>>> device:
>>>>>
>>>>> c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
>>>>> c6:00.0 Display controller: Advanced Micro Devices, Inc.
>>>>> [AMD/ATI] Device 150e (rev d1)
>>>>>
>>>>> If the GPUs were looked at the vga_is_firmware_default()
>>>>> function actually
>>>>> does do a good job at recognizing the case from the device used for the
>>>>> firmware framebuffer.
>>>>>
>>>>> Modify the VGA arbiter code and matching sysfs file entries to
>>>>> examine all
>>>>> PCI display class devices. The existing logic stays the same.
>>>>>
>>>>> This will cause all GPUs to gain a `boot_vga` file, but the
>>>>> correct device
>>>>> (AMD GPU in this case) will now show `1` and the incorrect
>>>>> device shows `0`.
>>>>> Userspace then picks the right device as well.
>>>>>
>>>>> Link: https://github.com/robherring/libpciaccess/commit/b2838fb61c3542f107014b285cbda097acae1e12
>>>>> [1]
>>>>> Suggested-by: Daniel Dadap <ddadap@nvidia.com>
>>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> ---
>>>>>    drivers/pci/pci-sysfs.c | 2 +-
>>>>>    drivers/pci/vgaarb.c    | 8 ++++----
>>>>>    2 files changed, 5 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
>>>>> index 268c69daa4d57..c314ee1b3f9ac 100644
>>>>> --- a/drivers/pci/pci-sysfs.c
>>>>> +++ b/drivers/pci/pci-sysfs.c
>>>>> @@ -1707,7 +1707,7 @@ static umode_t
>>>>> pci_dev_attrs_are_visible(struct kobject *kobj,
>>>>>        struct device *dev = kobj_to_dev(kobj);
>>>>>        struct pci_dev *pdev = to_pci_dev(dev);
>>>>>    -    if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
>>>>> +    if (a == &dev_attr_boot_vga.attr && pci_is_display(pdev))
>>>>>            return a->mode;
>>>>>          return 0;
>>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>>> index 78748e8d2dbae..63216e5787d73 100644
>>>>> --- a/drivers/pci/vgaarb.c
>>>>> +++ b/drivers/pci/vgaarb.c
>>>>> @@ -1499,8 +1499,8 @@ static int pci_notify(struct
>>>>> notifier_block *nb, unsigned long action,
>>>>>          vgaarb_dbg(dev, "%s\n", __func__);
>>>>>    -    /* Only deal with VGA class devices */
>>>>> -    if (!pci_is_vga(pdev))
>>>>> +    /* Only deal with PCI display class devices */
>>>>> +    if (!pci_is_display(pdev))
>>>>>            return 0;
>>>>>          /*
>>>>> @@ -1546,12 +1546,12 @@ static int __init vga_arb_device_init(void)
>>>>>          bus_register_notifier(&pci_bus_type, &pci_notifier);
>>>>>    -    /* Add all VGA class PCI devices by default */
>>>>> +    /* Add all PCI display class devices by default */
>>>>>        pdev = NULL;
>>>>>        while ((pdev =
>>>>>            pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>>>>>                       PCI_ANY_ID, pdev)) != NULL) {
>>>>> -        if (pci_is_vga(pdev))
>>>>> +        if (pci_is_display(pdev))
>>>>>                vga_arbiter_add_pci_device(pdev);
>>>>>        }
>>>>
>>>> At the very least a non-VGA device should not mark that it decodes
>>>> legacy resources, marking the boot VGA device is only a part of what
>>>> the VGA arbiter does.  It seems none of the actual VGA arbitration
>>>> interfaces have been considered here though.
>>>>
>>>> I still think this is a bad idea and I'm not sure Thomas didn't
>>>> withdraw his ack in the previous round[1].  Thanks,
>>>
>>> Ah; I didn't realize that was intended to be a withdrawl.
>>> If there's another version of this I'll remove it.
>>
>> Then let me formally withdraw the A-b.
>>
>> I think this updated patch doesn't address the concerns raised in the
>> previous reviews. AFAIU vgaarb is really only about VGA devices.
> 
> I missed the earlier version, but wanted to chime in that I concur. vgaarb
> is about vga decoding, and modern gpu drivers are trying pretty hard to
> disable that since it can cause pain. If we mix in the meaning of "default
> display device" into this, we have a mess.
> 
> I guess what does make sense is if the kernel exposes its notion of
> "default display device", since we do have that in some sense with
> simpledrm. At least on systems where simpledrm is a thing, but I think you
> need some really old machines for that to not be the case.
> 
> Cheers, Sima

Thanks guys.  Let's discard patch 6.  Here's a spin of an approach for 
userspace that does something similar to what the compositors are doing.
We can iterate on that.

https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/38

I think patches 1-5 still are valuable though.  So please add reviews to 
those and we can take those without patch 6 if there is agreement.
