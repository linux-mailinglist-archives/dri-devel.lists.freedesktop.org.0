Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F81A29A16
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 20:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C557310E16E;
	Wed,  5 Feb 2025 19:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EqEahlyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0F410E16E;
 Wed,  5 Feb 2025 19:31:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB8435C6E34;
 Wed,  5 Feb 2025 19:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2AAC4CED1;
 Wed,  5 Feb 2025 19:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738783896;
 bh=TklnhMPTz9MZgTgCoP4k/AarOTEH8Uakl9lWKzjBM9I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EqEahlyfZ8Ezb14/+a4acIV54dlmKExnStf2tR7ipYhKw+RFI9VvVpiwvXWkZpXMA
 l/gAqPa+3lEBXghlB7DLmDUsVE1QgP7JjHxoq5V/YQNhdonL7mDJrv1tL3eDDowPaj
 rn6O+qX3WpUF+53KefWwFHuc9o+AA45FTY942mOAP0iU6sdxAu3Evu20t6Qk/JGB1I
 9DxVFwPnC8B0sbqUMVnDVWQPiKVo0fAna9gLiXurBZr4HrTw3MZSpDdUvF0Av7C9Sr
 Tv1avIXo/nav9foVGoJmrml9kWT0PGm10ffpr62xjVkUmlKpME3yhAdwgyAGzLkA+f
 Acnu8V5qGN8Cw==
Message-ID: <0451e510-f8e4-4539-a3ce-cc9fbe71964f@kernel.org>
Date: Wed, 5 Feb 2025 13:31:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Refactor find_system_memory()
To: Felix Kuehling <felix.kuehling@amd.com>, mario.limonciello@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250204222140.3883013-1-superm1@kernel.org>
 <65b47db9-883b-46c6-919a-e84c3ffde401@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <65b47db9-883b-46c6-919a-e84c3ffde401@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2/4/2025 17:19, Felix Kuehling wrote:
> 
> On 2025-02-04 17:21, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> find_system_memory() pulls out two fields from an SMBIOS type 17
>> device and sets them on KFD devices. This however is pulling from
>> the middle of the field in the SMBIOS device and leads to an unaligned
>> access.
>>
>> Instead use a struct representation to access the members and pull
>> out the two specific fields.
> 
> Isn't that still an unaligned access? I don't understand the purpose of this patch.

Unless I added wrong, it looked to me that the offset it was pulling 
from previously was incorrect.  So I was expecting it should be aligned 
(and less error prone) to pull from the correct offset from a struct.

> 
> One more comment inline.
> 
>>
>> Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.8.0.pdf p99
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 27 +++++++++++------------
>>   drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 17 ++++++++++++++
>>   2 files changed, 30 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>> index ceb9fb475ef13..93d3924dfcba0 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>> @@ -968,24 +968,23 @@ static void kfd_update_system_properties(void)
>>   	up_read(&topology_lock);
>>   }
>>   
>> -static void find_system_memory(const struct dmi_header *dm,
>> -	void *private)
>> +static void find_system_memory(const struct dmi_header *dm, void *private)
>>   {
>> +	struct dmi_mem_device *memdev = (struct dmi_mem_device *)(dm);
> 
> I think it would be cleaner to use container_of to get a pointer to the structure containing the header.

Ack.

> 
> Regards,
>    Felix
> 
>>   	struct kfd_mem_properties *mem;
>> -	u16 mem_width, mem_clock;
>>   	struct kfd_topology_device *kdev =
>>   		(struct kfd_topology_device *)private;
>> -	const u8 *dmi_data = (const u8 *)(dm + 1);
>> -
>> -	if (dm->type == DMI_ENTRY_MEM_DEVICE && dm->length >= 0x15) {
>> -		mem_width = (u16)(*(const u16 *)(dmi_data + 0x6));
>> -		mem_clock = (u16)(*(const u16 *)(dmi_data + 0x11));
>> -		list_for_each_entry(mem, &kdev->mem_props, list) {
>> -			if (mem_width != 0xFFFF && mem_width != 0)
>> -				mem->width = mem_width;
>> -			if (mem_clock != 0)
>> -				mem->mem_clk_max = mem_clock;
>> -		}
>> +
>> +	if (memdev->header.type != DMI_ENTRY_MEM_DEVICE)
>> +		return;
>> +	if (memdev->header.length < sizeof(struct dmi_mem_device))
>> +		return;
>> +
>> +	list_for_each_entry(mem, &kdev->mem_props, list) {
>> +		if (memdev->total_width != 0xFFFF && memdev->total_width != 0)
>> +			mem->width = memdev->total_width;
>> +		if (memdev->speed != 0)
>> +			mem->mem_clk_max = memdev->speed;
>>   	}
>>   }
>>   
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>> index 155b5c410af16..f06c9db7ddde9 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>> @@ -24,6 +24,7 @@
>>   #ifndef __KFD_TOPOLOGY_H__
>>   #define __KFD_TOPOLOGY_H__
>>   
>> +#include <linux/dmi.h>
>>   #include <linux/types.h>
>>   #include <linux/list.h>
>>   #include <linux/kfd_sysfs.h>
>> @@ -179,6 +180,22 @@ struct kfd_system_properties {
>>   	struct attribute	attr_props;
>>   };
>>   
>> +struct dmi_mem_device {
>> +	struct dmi_header header;
>> +	u16 physical_handle;
>> +	u16 error_handle;
>> +	u16 total_width;
>> +	u16 data_width;
>> +	u16 size;
>> +	u8 form_factor;
>> +	u8 device_set;
>> +	u8 device_locator;
>> +	u8 bank_locator;
>> +	u8 memory_type;
>> +	u16 type_detail;
>> +	u16 speed;
>> +} __packed;
>> +
>>   struct kfd_topology_device *kfd_create_topology_device(
>>   		struct list_head *device_list);
>>   void kfd_release_topology_device_list(struct list_head *device_list);
> 

