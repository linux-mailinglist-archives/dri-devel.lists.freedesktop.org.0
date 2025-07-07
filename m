Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8FCAFAFEE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 11:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BE910E059;
	Mon,  7 Jul 2025 09:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="J4ja/z0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 932 seconds by postgrey-1.36 at gabe;
 Mon, 07 Jul 2025 09:39:45 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C47F10E059
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
 Content-Type; bh=W66/dbK4Xwfefk7OxFMLWKDsjpz1zv53LGHljDMha0g=;
 b=J4ja/z0gMlVEeTQWzO56zWx5vjtxfAxkGz/Oz4FCye1bdJbp8FK15ugawAbhax
 XYxHkXm1nDExGEQVlT7sGOWKIAZ9Bmx3C0fPvHB1tAJZtH/y6Zocj5L5YBhbwuEm
 PKHvQaII3ABxCd/wCPl9V+0eG1Lcgdm8luuflM7B5aLng=
Received: from [10.42.20.80] (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wDnTyAzkmto5RUbDQ--.50855S2; 
 Mon, 07 Jul 2025 17:24:04 +0800 (CST)
Message-ID: <a937f41f-2cee-459d-b94f-b7f979072f3e@163.com>
Date: Mon, 7 Jul 2025 17:24:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: efifb: do not load efifb if PCI BAR has changed
 but not fixuped
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Cc: Peter Jones <pjones@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250626094937.515552-1-oushixiong1025@163.com>
 <3b3feb03-c417-4569-b7b0-44565d7cce4f@suse.de>
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <3b3feb03-c417-4569-b7b0-44565d7cce4f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnTyAzkmto5RUbDQ--.50855S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr4UuF43ZryfuFy3ur47twb_yoW7Ar4rpF
 WfGFW3CF48Xrn7Gws8G3WDAF1fZr4kWFyqkFZxK3W8Ary7Ar1YvrnruryDury5ZrWkJF1x
 tr4jyw1akF15CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTbytUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXAd5D2heWMK4AgADs4
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


在 2025/6/27 17:13, Thomas Zimmermann 写道:
> Hi
>
> Am 26.06.25 um 11:49 schrieb oushixiong1025@163.com:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
>> [WHY]
>> On an ARM machine, the following log is present:
>> [    0.900884] efifb: framebuffer at 0x1020000000, using 3072k, total 
>> 3072k
>> [    2.297884] amdgpu 0000:04:00.0: 
>> remove_conflicting_pci_framebuffers: bar 0: 0x1000000000 -> 0x100fffffff
>> [    2.297886] amdgpu 0000:04:00.0: 
>> remove_conflicting_pci_framebuffers: bar 2: 0x1010000000 -> 0x10101fffff
>> [    2.297888] amdgpu 0000:04:00.0: 
>> remove_conflicting_pci_framebuffers: bar 5: 0x58200000 -> 0x5823ffff
>>
>> It show that the efifb framebuffer base is out of PCI BAR, and this
>> results in both efi-framebuffer and amdgpudrmfb co-existing.
>>
>> The fbcon will be bound to efi-framebuffer by default and cannot be 
>> used.
>>
>> [HOW]
>> Do not load efifb driver if PCI BAR has changed but not fixuped.
>> In the following cases:
>>     1. screen_info_lfb_pdev is NULL.
>>     2. __screen_info_relocation_is_valid return false.
>
> Apart from ruling out invalid screen_info, did you figure out why the 
> relocation tracking didn't work? It would be good to fix this if 
> possible.
>
> Best regards
> Thomas
>
I haven’t figure out the root cause yet.

This issue is quite rare and might be related to the EFI firmware.
However, I wonder if we could add some handling when no PCI resources 
are found in screen_info_fixup_lfb(), as a temporary workaround for the 
problem I mentioned earlier.

Best regards
Shixiong Ou

>>
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>> ---
>>   drivers/video/fbdev/efifb.c     |  4 ++++
>>   drivers/video/screen_info_pci.c | 24 ++++++++++++++++++++++++
>>   include/linux/screen_info.h     |  5 +++++
>>   3 files changed, 33 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
>> index 0e1bd3dba255..de8d016c9a66 100644
>> --- a/drivers/video/fbdev/efifb.c
>> +++ b/drivers/video/fbdev/efifb.c
>> @@ -303,6 +303,10 @@ static void efifb_setup(struct screen_info *si, 
>> char *options)
>>     static inline bool fb_base_is_valid(struct screen_info *si)
>>   {
>> +    /* check whether fb_base has changed but not fixuped */
>> +    if (!screen_info_is_useful())
>> +        return false;
>> +
>>       if (si->lfb_base)
>>           return true;
>>   diff --git a/drivers/video/screen_info_pci.c 
>> b/drivers/video/screen_info_pci.c
>> index 66bfc1d0a6dc..ac57dcaf0cac 100644
>> --- a/drivers/video/screen_info_pci.c
>> +++ b/drivers/video/screen_info_pci.c
>> @@ -9,6 +9,8 @@ static struct pci_dev *screen_info_lfb_pdev;
>>   static size_t screen_info_lfb_bar;
>>   static resource_size_t screen_info_lfb_res_start; // original start 
>> of resource
>>   static resource_size_t screen_info_lfb_offset; // framebuffer 
>> offset within resource
>> +static bool screen_info_changed;
>> +static bool screen_info_fixuped;
>>     static bool __screen_info_relocation_is_valid(const struct 
>> screen_info *si, struct resource *pr)
>>   {
>> @@ -24,6 +26,24 @@ static bool 
>> __screen_info_relocation_is_valid(const struct screen_info *si, stru
>>       return true;
>>   }
>>   +bool screen_info_is_useful(void)
>> +{
>> +    unsigned int type;
>> +    const struct screen_info *si = &screen_info;
>> +
>> +    type = screen_info_video_type(si);
>> +    if (type != VIDEO_TYPE_EFI)
>> +        return true;
>> +
>> +    if (screen_info_changed && !screen_info_fixuped) {
>> +        pr_warn("The screen_info has changed but not fixuped");
>> +        return false;
>> +    }
>> +
>> +    pr_info("The screen_info is useful");
>> +    return true;
>> +}
>> +
>>   void screen_info_apply_fixups(void)
>>   {
>>       struct screen_info *si = &screen_info;
>> @@ -32,18 +52,22 @@ void screen_info_apply_fixups(void)
>>           struct resource *pr = 
>> &screen_info_lfb_pdev->resource[screen_info_lfb_bar];
>>             if (pr->start != screen_info_lfb_res_start) {
>> +            screen_info_changed = true;
>>               if (__screen_info_relocation_is_valid(si, pr)) {
>>                   /*
>>                    * Only update base if we have an actual
>>                    * relocation to a valid I/O range.
>>                    */
>>                   __screen_info_set_lfb_base(si, pr->start + 
>> screen_info_lfb_offset);
>> +                screen_info_fixuped = true;
>>                   pr_info("Relocating firmware framebuffer to offset 
>> %pa[d] within %pr\n",
>>                       &screen_info_lfb_offset, pr);
>>               } else {
>>                   pr_warn("Invalid relocating, disabling firmware 
>> framebuffer\n");
>>               }
>>           }
>> +    } else {
>> +        screen_info_changed = true;
>>       }
>>   }
>>   diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
>> index 923d68e07679..632cdbb1adbe 100644
>> --- a/include/linux/screen_info.h
>> +++ b/include/linux/screen_info.h
>> @@ -138,9 +138,14 @@ ssize_t screen_info_resources(const struct 
>> screen_info *si, struct resource *r,
>>   u32 __screen_info_lfb_bits_per_pixel(const struct screen_info *si);
>>     #if defined(CONFIG_PCI)
>> +bool screen_info_is_useful(void);
>>   void screen_info_apply_fixups(void);
>>   struct pci_dev *screen_info_pci_dev(const struct screen_info *si);
>>   #else
>> +bool screen_info_is_useful(void)
>> +{
>> +    return true;
>> +}
>>   static inline void screen_info_apply_fixups(void)
>>   { }
>>   static inline struct pci_dev *screen_info_pci_dev(const struct 
>> screen_info *si)
>

