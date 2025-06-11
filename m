Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8645DAD4DB9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 10:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037E410E2F1;
	Wed, 11 Jun 2025 07:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2Fu09Oru";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+O98CjUz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Fu09Oru";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+O98CjUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9410E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 07:59:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0CEC921274;
 Wed, 11 Jun 2025 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749628793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YeB/BUI1ymL4xWJG/Ue3ZGAasjWWt2Uycga8/TLXvQ4=;
 b=2Fu09OruyGs+wNvG1uZmpDx06xplqSZDs91u5k5RHdEVvwJ1wFX2nq4MgTSbVBXB5T6Lga
 39elSQ/IS+c846Qu/p2Fu2huN2SrcAtW6GLkoJNSLk9U4QNYOOcEa85HXSU7ViQuXnr9cw
 0DngJmBxHxlZvT9YKQFezWhhmgtQXpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749628793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YeB/BUI1ymL4xWJG/Ue3ZGAasjWWt2Uycga8/TLXvQ4=;
 b=+O98CjUzddNqqAyBUqBTFvgTOh+/sT+vkbV+/QA3AilleJDf7kWCatgquEX6HAXSxqj+7b
 OR095KbHZNlfLkCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749628793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YeB/BUI1ymL4xWJG/Ue3ZGAasjWWt2Uycga8/TLXvQ4=;
 b=2Fu09OruyGs+wNvG1uZmpDx06xplqSZDs91u5k5RHdEVvwJ1wFX2nq4MgTSbVBXB5T6Lga
 39elSQ/IS+c846Qu/p2Fu2huN2SrcAtW6GLkoJNSLk9U4QNYOOcEa85HXSU7ViQuXnr9cw
 0DngJmBxHxlZvT9YKQFezWhhmgtQXpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749628793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YeB/BUI1ymL4xWJG/Ue3ZGAasjWWt2Uycga8/TLXvQ4=;
 b=+O98CjUzddNqqAyBUqBTFvgTOh+/sT+vkbV+/QA3AilleJDf7kWCatgquEX6HAXSxqj+7b
 OR095KbHZNlfLkCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B563E139CE;
 Wed, 11 Jun 2025 07:59:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eqeuKng3SWjbYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jun 2025 07:59:52 +0000
Message-ID: <8736022c-5946-463f-9a5c-42ebf3e5da80@suse.de>
Date: Wed, 11 Jun 2025 09:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] PCI/VGA: Look at all PCI display devices in VGA
 arbiter
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 bhelgaas@google.com, Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
References: <20250609022435.348589-1-superm1@kernel.org>
 <9350317a-b6dc-4ba5-9bd5-2a63066cc460@suse.de>
 <91a83d95-d4bc-49e1-b869-904c877c0f05@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <91a83d95-d4bc-49e1-b869-904c877c0f05@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[kernel.org,amd.com,google.com,gmail.com];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,amd.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Hi

Am 10.06.25 um 15:56 schrieb Mario Limonciello:
> On 6/10/2025 6:35 AM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 09.06.25 um 04:24 schrieb Mario Limonciello:
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> On an A+N mobile system the APU is not being selected by some desktop
>>> environments for any rendering tasks. This is because the neither GPU
>>> is being treated as "boot_vga" but that is what some environments use
>>> to select a GPU [1].
>>>
>>> The VGA arbiter driver only looks at devices that report as PCI display
>>> VGA class devices. Neither GPU on the system is a display VGA class
>>> device:
>>>
>>> c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
>>> c6:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] 
>>> Device 150e (rev d1)
>>
>> My understanding of vgaarb is that it manages concurrent usage of the 
>> fixed VGA I/O ports. So are these actually VGA devices? I'm concerned 
>> about vgaarb handling devices that aren't VGA and possible side 
>> effects of that.
>
> No; neither is a VGA device.  There was a suggestion to do this from 
> userspace in libpciaccess [1] but Dave Airlie suggested it would be 
> better to adjust the "meaning" of boot_vga, which is essentially what 
> this RFC does.
>
> [1] 
> https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/37

I would have done this in userspace as well, but *shrug*.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

I still think that the vgaarb is too complicated and needs an overhaul, 
but that's for another series.

Best regards
Thomas

>
>>
>> As a side note, there's also video_is_primary_device(), which we use 
>> for fbcon and which also uses vga_default_device() on x86. [1] This 
>> helper should likely return the same value as sysfs' boot_vga attribute.
>>
>> [1] https://elixir.bootlin.com/linux/v6.15.1/C/ident/ 
>> video_is_primary_device
>>
>>>
>>> So neither device gets the boot_vga sysfs file. The 
>>> vga_is_boot_device()
>>> function already has some handling for integrated GPUs by looking at 
>>> the
>>> ACPI HID entries, so if all PCI display class devices are looked at it
>>> actually can detect properly with this device ordering. However if 
>>> there
>>> is a different ordering it could flag the wrong device.
>>>
>>> Modify the VGA arbiter code and matching sysfs file entries to 
>>> examine all
>>> PCI display class devices. After every device is added to the 
>>> arbiter list
>>> make a pass on all devices and explicitly check whether one is 
>>> integrated.
>>>
>>> This will cause all GPUs to gain a `boot_vga` file, but the correct 
>>> device
>>> (APU in this case) will now show `1` and the incorrect device shows 
>>> `0`.
>>> Userspace then picks the right device as well.
>>>
>>> Link: https://github.com/robherring/libpciaccess/commit/ 
>>> b2838fb61c3542f107014b285cbda097acae1e12 [1]
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>   drivers/pci/pci-sysfs.c |  2 +-
>>>   drivers/pci/vgaarb.c    | 53 
>>> ++++++++++++++++++++++++++---------------
>>>   include/linux/pci.h     | 15 ++++++++++++
>>>   3 files changed, 50 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
>>> index 268c69daa4d57..c314ee1b3f9ac 100644
>>> --- a/drivers/pci/pci-sysfs.c
>>> +++ b/drivers/pci/pci-sysfs.c
>>> @@ -1707,7 +1707,7 @@ static umode_t 
>>> pci_dev_attrs_are_visible(struct kobject *kobj,
>>>       struct device *dev = kobj_to_dev(kobj);
>>>       struct pci_dev *pdev = to_pci_dev(dev);
>>> -    if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
>>> +    if (a == &dev_attr_boot_vga.attr && pci_is_display(pdev))
>>>           return a->mode;
>>>       return 0;
>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>> index 78748e8d2dbae..8281144747487 100644
>>> --- a/drivers/pci/vgaarb.c
>>> +++ b/drivers/pci/vgaarb.c
>>> @@ -139,7 +139,7 @@ void vga_set_default_device(struct pci_dev *pdev)
>>>   {
>>>       if (vga_default == pdev)
>>>           return;
>>> -
>>> +    vgaarb_info(&pdev->dev, "selecting as VGA boot device\n");
>>
>> vgaarb_dbg() please.
>>
>>>       pci_dev_put(vga_default);
>>>       vga_default = pci_dev_get(pdev);
>>>   }
>>> @@ -676,9 +676,9 @@ static bool vga_is_boot_device(struct vga_device 
>>> *vgadev)
>>>       }
>>>       /*
>>> -     * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>>> -     * other VGA devices, it is the best candidate so far.
>>> -     */
>>> +    * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>>> +    * other VGA devices, it is the best candidate so far.
>>> +    */
>>
>> This should be a separate patch.
>>
>> Best regards
>> Thomas
>>
>>>       if (!boot_vga)
>>>           return true;
>>> @@ -751,6 +751,31 @@ static void 
>>> vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
>>>           vgaarb_info(&vgadev->pdev->dev, "no bridge control 
>>> possible\n");
>>>   }
>>> +static
>>> +void vga_arbiter_select_default_device(void)
>>> +{
>>> +    struct pci_dev *candidate = vga_default_device();
>>> +    struct vga_device *vgadev;
>>> +
>>> +    list_for_each_entry(vgadev, &vga_list, list) {
>>> +        if (vga_is_boot_device(vgadev)) {
>>> +            /* check if one is an integrated GPU, use that if so */
>>> +            if (candidate) {
>>> +                if (vga_arb_integrated_gpu(&candidate->dev))
>>> +                    break;
>>> +                if (vga_arb_integrated_gpu(&vgadev->pdev->dev)) {
>>> +                    candidate = vgadev->pdev;
>>> +                    break;
>>> +                }
>>> +            } else
>>> +                candidate = vgadev->pdev;
>>> +        }
>>> +    }
>>> +
>>> +    if (candidate)
>>> +        vga_set_default_device(candidate);
>>> +}
>>> +
>>>   /*
>>>    * Currently, we assume that the "initial" setup of the system is 
>>> not sane,
>>>    * that is, we come up with conflicting devices and let the arbiter's
>>> @@ -816,13 +841,6 @@ static bool vga_arbiter_add_pci_device(struct 
>>> pci_dev *pdev)
>>>           bus = bus->parent;
>>>       }
>>> -    if (vga_is_boot_device(vgadev)) {
>>> -        vgaarb_info(&pdev->dev, "setting as boot VGA device%s\n",
>>> -                vga_default_device() ?
>>> -                " (overriding previous)" : "");
>>> -        vga_set_default_device(pdev);
>>> -    }
>>> -
>>>       vga_arbiter_check_bridge_sharing(vgadev);
>>>       /* Add to the list */
>>> @@ -833,6 +851,7 @@ static bool vga_arbiter_add_pci_device(struct 
>>> pci_dev *pdev)
>>>           vga_iostate_to_str(vgadev->owns),
>>>           vga_iostate_to_str(vgadev->locks));
>>> +    vga_arbiter_select_default_device();
>>>       spin_unlock_irqrestore(&vga_lock, flags);
>>>       return true;
>>>   fail:
>>> @@ -1499,8 +1518,8 @@ static int pci_notify(struct notifier_block 
>>> *nb, unsigned long action,
>>>       vgaarb_dbg(dev, "%s\n", __func__);
>>> -    /* Only deal with VGA class devices */
>>> -    if (!pci_is_vga(pdev))
>>> +    /* Only deal with display devices */
>>> +    if (!pci_is_display(pdev))
>>>           return 0;
>>>       /*
>>> @@ -1548,12 +1567,8 @@ static int __init vga_arb_device_init(void)
>>>       /* Add all VGA class PCI devices by default */
>>>       pdev = NULL;
>>> -    while ((pdev =
>>> -        pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>>> -                   PCI_ANY_ID, pdev)) != NULL) {
>>> -        if (pci_is_vga(pdev))
>>> -            vga_arbiter_add_pci_device(pdev);
>>> -    }
>>> +    while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev)))
>>> +        vga_arbiter_add_pci_device(pdev);
>>>       pr_info("loaded\n");
>>>       return rc;
>>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>>> index 05e68f35f3923..e77754e43c629 100644
>>> --- a/include/linux/pci.h
>>> +++ b/include/linux/pci.h
>>> @@ -744,6 +744,21 @@ static inline bool pci_is_vga(struct pci_dev 
>>> *pdev)
>>>       return false;
>>>   }
>>> +/**
>>> + * pci_is_display - Check if a PCI device is a display controller
>>> + * @pdev: Pointer to the PCI device structure
>>> + *
>>> + * This function determines whether the given PCI device corresponds
>>> + * to a display controller. Display controllers are typically used
>>> + * for graphical output and are identified based on their class code.
>>> + *
>>> + * Return: true if the PCI device is a display controller, false 
>>> otherwise.
>>> + */
>>> +static inline bool pci_is_display(struct pci_dev *pdev)
>>> +{
>>> +    return (pdev->class >> 16) == PCI_BASE_CLASS_DISPLAY;
>>> +}
>>> +
>>>   #define for_each_pci_bridge(dev, bus)                \
>>>       list_for_each_entry(dev, &bus->devices, bus_list)    \
>>>           if (!pci_is_bridge(dev)) {} else
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

