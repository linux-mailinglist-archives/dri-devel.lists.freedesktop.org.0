Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB52A29B74
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 21:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82B310E1FE;
	Wed,  5 Feb 2025 20:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oX5kXHk0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACEC10E3F0;
 Wed,  5 Feb 2025 20:46:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9274BA439F2;
 Wed,  5 Feb 2025 20:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A75BC4CED1;
 Wed,  5 Feb 2025 20:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738788374;
 bh=npj6L9AKeiuveKAxAG8PM1lE1A0cJNgmSbvCXvO3VQg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oX5kXHk0aoShTYh6mtKtT33qYegB4MVnPrsJghosGJaBhqLiqSorlXZsAUouAoFpK
 qj56v5L6Rbmc3aaKTYdDodf+44GZaS+b/oHdM1ZBofRbvXsZRFXY4cHfLp7C0FwUwb
 Dp3UIoZkPBXrTyzLQHbbALNbnzbemcWOzq5F0SYofhbwK6+Gd5fO++nIdhwERKtYfG
 zaxWszhlkxLAJSqe244lQC/keRN5Z4A8tqc1+39qjWd9rZpFtolFmePxf1ZA4Q5/TH
 198zlA/tQzVS6bmA5a2raRD+9FXNUbnm257ss/ErEL7/VXsfe3PBO7jxs5+/w+VwZR
 n5YU/AKqnIvFw==
Message-ID: <2bc14402-373b-4da7-8f97-da00e7d4ad6d@kernel.org>
Date: Wed, 5 Feb 2025 14:46:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Refactor find_system_memory()
To: Felix Kuehling <felix.kuehling@amd.com>, mario.limonciello@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250204222140.3883013-1-superm1@kernel.org>
 <65b47db9-883b-46c6-919a-e84c3ffde401@amd.com>
 <0451e510-f8e4-4539-a3ce-cc9fbe71964f@kernel.org>
 <30fbb0d6-b911-4a99-bcdc-38e2ede5eaa0@amd.com>
 <1a046955-de2e-4d5f-8b47-ca90d7aebf9f@kernel.org>
 <8d81bf09-ec6f-4753-b324-a9614e2a37a1@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <8d81bf09-ec6f-4753-b324-a9614e2a37a1@amd.com>
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

On 2/5/2025 14:43, Felix Kuehling wrote:
> 
> 
> On 2025-02-05 15:36, Mario Limonciello wrote:
>> On 2/5/2025 14:33, Felix Kuehling wrote:
>>>
>>>
>>> On 2025-02-05 14:31, Mario Limonciello wrote:
>>>> On 2/4/2025 17:19, Felix Kuehling wrote:
>>>>>
>>>>> On 2025-02-04 17:21, Mario Limonciello wrote:
>>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>
>>>>>> find_system_memory() pulls out two fields from an SMBIOS type 17
>>>>>> device and sets them on KFD devices. This however is pulling from
>>>>>> the middle of the field in the SMBIOS device and leads to an unaligned
>>>>>> access.
>>>>>>
>>>>>> Instead use a struct representation to access the members and pull
>>>>>> out the two specific fields.
>>>>>
>>>>> Isn't that still an unaligned access? I don't understand the purpose of this patch.
>>>>
>>>> Unless I added wrong, it looked to me that the offset it was pulling from previously was incorrect.  So I was expecting it should be aligned (and less error prone) to pull from the correct offset from a struct.
>>>
>>> The way I see it, the offsets that were used before were correct and match the offsets in the packed structure definition. I'm annotating the offsets from the end of the header in the structure definition below as proof.
>>>
>>
>> The problem I saw was that the dmi_data field starts a byte late though.  That's why I was thinking this is the source of the unaligned access and the mistake.
>>
>> Let me annotate below.
>>
>>>>
>>>>>
>>>>> One more comment inline.
>>>>>
>>>>>>
>>>>>> Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.8.0.pdf p99
>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 27 +++++++++++------------
>>>>>>     drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 17 ++++++++++++++
>>>>>>     2 files changed, 30 insertions(+), 14 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>>>>>> index ceb9fb475ef13..93d3924dfcba0 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>>>>>> @@ -968,24 +968,23 @@ static void kfd_update_system_properties(void)
>>>>>>         up_read(&topology_lock);
>>>>>>     }
>>>>>>     -static void find_system_memory(const struct dmi_header *dm,
>>>>>> -    void *private)
>>>>>> +static void find_system_memory(const struct dmi_header *dm, void *private)
>>>>>>     {
>>>>>> +    struct dmi_mem_device *memdev = (struct dmi_mem_device *)(dm);
>>>>>
>>>>> I think it would be cleaner to use container_of to get a pointer to the structure containing the header.
>>>>
>>>> Ack.
>>>>
>>>>>
>>>>> Regards,
>>>>>      Felix
>>>>>
>>>>>>         struct kfd_mem_properties *mem;
>>>>>> -    u16 mem_width, mem_clock;
>>>>>>         struct kfd_topology_device *kdev =
>>>>>>             (struct kfd_topology_device *)private;
>>>>>> -    const u8 *dmi_data = (const u8 *)(dm + 1);
>>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> The type of dm is struct dmi_header *. dm + 1 is the first byte after the dmi_header. In other words dmi_data points to the physical_handle field, which is the field with offset 0 as I annotated it below and all the other offsets match my annotations, which match the original code.

Ah got it, I understand now.  I'll adjust the commit message as you're 
right this doesn't change anything for unaligned access and send out a 
v2 just as just being a pure cleanup.

> 
> Regards,
>    Felix
> 
>>>>>> -
>>>>>> -    if (dm->type == DMI_ENTRY_MEM_DEVICE && dm->length >= 0x15) {
>>>>>> -        mem_width = (u16)(*(const u16 *)(dmi_data + 0x6));
>>>>>> -        mem_clock = (u16)(*(const u16 *)(dmi_data + 0x11));
>>>>>> -        list_for_each_entry(mem, &kdev->mem_props, list) {
>>>>>> -            if (mem_width != 0xFFFF && mem_width != 0)
>>>>>> -                mem->width = mem_width;
>>>>>> -            if (mem_clock != 0)
>>>>>> -                mem->mem_clk_max = mem_clock;
>>>>>> -        }
>>>>>> +
>>>>>> +    if (memdev->header.type != DMI_ENTRY_MEM_DEVICE)
>>>>>> +        return;
>>>>>> +    if (memdev->header.length < sizeof(struct dmi_mem_device))
>>>>>> +        return;
>>>>>> +
>>>>>> +    list_for_each_entry(mem, &kdev->mem_props, list) {
>>>>>> +        if (memdev->total_width != 0xFFFF && memdev->total_width != 0)
>>>>>> +            mem->width = memdev->total_width;
>>>>>> +        if (memdev->speed != 0)
>>>>>> +            mem->mem_clk_max = memdev->speed;
>>>>>>         }
>>>>>>     }
>>>>>>     diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>>>>>> index 155b5c410af16..f06c9db7ddde9 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>>>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>>>>>> @@ -24,6 +24,7 @@
>>>>>>     #ifndef __KFD_TOPOLOGY_H__
>>>>>>     #define __KFD_TOPOLOGY_H__
>>>>>>     +#include <linux/dmi.h>
>>>>>>     #include <linux/types.h>
>>>>>>     #include <linux/list.h>
>>>>>>     #include <linux/kfd_sysfs.h>
>>>>>> @@ -179,6 +180,22 @@ struct kfd_system_properties {
>>>>>>         struct attribute    attr_props;
>>>>>>     };
>>>>>>     +struct dmi_mem_device {
>>>>>> +    struct dmi_header header;
>>>
>>> Comments below to annotate the byte offset of each field from the end of the header.
>>>
>>>>>> +    u16 physical_handle; // 0x0
>>>>>> +    u16 error_handle;    // 0x2
>>>>>> +    u16 total_width;     // 0x4
>>>>>> +    u16 data_width;      // 0x6 (matches the original code)
>>>>>> +    u16 size;            // 0x8
>>>>>> +    u8 form_factor;      // 0xa
>>>>>> +    u8 device_set;       // 0xb
>>>>>> +    u8 device_locator;   // 0xc
>>>>>> +    u8 bank_locator;     // 0xd
>>>>>> +    u8 memory_type;      // 0xe
>>>>>> +    u16 type_detail;     // 0xf
>>>>>> +    u16 speed;           // 0x11 (matches the original code)
>>>>>> +} __packed;
>>>
>>> The bottom line is, this patch doesn't change anything about which DMI data is accessed. It's still an unaligned access. Now I think your patch is still a decent cleanup. But the justification in the commit description doesn't make sense.
>>>
>>> Regards,
>>>     Felix
>>>
>>>>>> +
>>>>>>     struct kfd_topology_device *kfd_create_topology_device(
>>>>>>             struct list_head *device_list);
>>>>>>     void kfd_release_topology_device_list(struct list_head *device_list);
>>>>>
>>>>
>>>
>>
> 

