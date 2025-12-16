Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AC5CC3BA5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 15:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A6B10E138;
	Tue, 16 Dec 2025 14:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r7jOgzRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFA410E138;
 Tue, 16 Dec 2025 14:48:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E2AAC6017D;
 Tue, 16 Dec 2025 14:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874EDC4CEF1;
 Tue, 16 Dec 2025 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765896520;
 bh=i0AcTcCPtF2GO7wxfnZkdvNES3SqmZBwNVL8UlFm4BY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=r7jOgzRbHM+pVee8VyzocTn6BVeijeq5DBRIVgYuRpniEhQKqxaeUHvPwebTXrFKS
 lIPrOd1Zc+qfZ561coQ1zdL4AgSIlZef6eSkKJ7F1zol2PBfTiaQvg+kY0jS7L+wCf
 Je2TL8Bv2KPlrB2bpPc7T7yDbM8CLzTwww6Gkp8hQCngw7m06xr7ejEGmmfoBDphJs
 ggthRkhgjEMfSSGHpitAg2Aztb5SV+VrQdjCq+qwFbnRD9oa1S0y3xzvT8Vr2kG9TQ
 e0gyqE6O2WN7Miwryr5ob5lwFm8Wy9lXZLvyJciCnYVRpJs3yCxIGANoAluzX50QYV
 0Wo3nlyrWLFvQ==
Message-ID: <7fc41ebc-bbea-44af-80b2-c2baee6eb1a6@kernel.org>
Date: Tue, 16 Dec 2025 08:48:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "Tsao, Anson" <anson.tsao@amd.com>
References: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
 <20251212-vram-carveout-tuning-for-upstream-v6-4-50c02fd180c9@amd.com>
 <1d54ce3b-fbdb-4d1a-bd07-576a6ed85ea5@amd.com>
 <ea30058d-f3e1-4a1f-bdcf-fafc92b221a0@kernel.org>
 <6c83cbdf-e5a6-4443-a642-d1e7b6786945@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <6c83cbdf-e5a6-4443-a642-d1e7b6786945@amd.com>
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

On 12/16/25 8:44 AM, Lazar, Lijo wrote:
> 
> 
> On 16-Dec-25 7:38 PM, Mario Limonciello wrote:
>> On 12/16/25 3:43 AM, Lazar, Lijo wrote:
>>>
>>>
>>> On 12-Dec-25 1:29 PM, Yo-Jung Leo Lin (AMD) wrote:
>>>> Add a uma/ directory containing two sysfs files as interfaces to
>>>> inspect or change UMA carveout size. These files are:
>>>>
>>>> - uma/carveout_options: a read-only file listing all the available
>>>>    UMA allocation options and their index.
>>>>
>>>> - uma/carveout: a file that is both readable and writable. On read,
>>>>    it shows the index of the current setting. Writing a valid index
>>>>    into this file allows users to change the UMA carveout size to that
>>>>    option on the next boot.
>>>>
>>>> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>>> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 143 +++++++++++++++++ 
>>>> + + ++++++++++
>>>>   1 file changed, 143 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/ 
>>>> gpu/ drm/amd/amdgpu/amdgpu_device.c
>>>> index 903c4706040d..e78e6982312c 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -36,6 +36,7 @@
>>>>   #include <linux/pci.h>
>>>>   #include <linux/pci-p2pdma.h>
>>>>   #include <linux/apple-gmux.h>
>>>> +#include <linux/nospec.h>
>>>>   #include <drm/drm_atomic_helper.h>
>>>>   #include <drm/drm_client_event.h>
>>>> @@ -417,6 +418,146 @@ static const struct attribute_group 
>>>> amdgpu_board_attrs_group = {
>>>>       .is_visible = amdgpu_board_attrs_is_visible
>>>>   };
>>>> +static ssize_t carveout_options_show(struct device *dev,
>>>> +                     struct device_attribute *attr,
>>>> +                     char *buf)
>>>> +{
>>>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>>>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>>>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>>>> +    uint32_t memory_carved;
>>>> +    ssize_t size = 0;
>>>> +
>>>> +    if (!uma_info || !uma_info->num_entries)
>>>> +        return -ENODEV;
>>>> +
>>>> +    for (int i = 0; i < uma_info->num_entries; i++) {
>>>> +        memory_carved = uma_info->entries[i].memory_carved_mb;
>>>> +        if (memory_carved >= SZ_1G/SZ_1M) {
>>>> +            size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
>>>> +                          i,
>>>> +                          uma_info->entries[i].name,
>>>> +                          memory_carved >> 10);
>>>> +        } else {
>>>> +            size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
>>>> +                          i,
>>>> +                          uma_info->entries[i].name,
>>>> +                          memory_carved);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return size;
>>>> +}
>>>> +static DEVICE_ATTR_RO(carveout_options);
>>>> +
>>>> +static ssize_t carveout_show(struct device *dev,
>>>> +                 struct device_attribute *attr,
>>>> +                 char *buf)
>>>> +{
>>>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>>>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>>>> +
>>>> +    return sysfs_emit(buf, "%u\n", adev->uma_info.uma_option_index);
>>>
>>> It would be better to show the size along with the index.
>>
>> This idea complicates userspace parsing because rather than a atoi() 
>> parser you now need to do sscanf().
>>
>> IE - I like it the way it is in the series at the moment.
>>
> 
> Userspace already has to go through this for carveout_options parsing. 
> It does not make any difference :)

Oh I guess you're right, userspace wouldn't just present a string from 
carveout options, it would need to know what index went with what string 
which means parsing to populate a UI (for example).
> 
> I was thinking of an easier way without cross reference. It would be 
> better even if you put the actual carve out size instead of an index 
> (assuming carve out size is deterministic).
> 
> Thanks,
> Lijo
> 
> 
>>>
>>> Regardless, series is -
>>>
>>>      Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>>>
>>> Thanks,
>>> Lijo
>>>
>>>> +}
>>>> +
>>>> +static ssize_t carveout_store(struct device *dev,
>>>> +                  struct device_attribute *attr,
>>>> +                  const char *buf, size_t count)
>>>> +{
>>>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>>>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>>>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>>>> +    struct amdgpu_uma_carveout_option *opt;
>>>> +    unsigned long val;
>>>> +    uint8_t flags;
>>>> +    int r;
>>>> +
>>>> +    r = kstrtoul(buf, 10, &val);
>>>> +    if (r)
>>>> +        return r;
>>>> +
>>>> +    if (val >= uma_info->num_entries)
>>>> +        return -EINVAL;
>>>> +
>>>> +    val = array_index_nospec(val, uma_info->num_entries);
>>>> +    opt = &uma_info->entries[val];
>>>> +
>>>> +    if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
>>>> +        !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
>>>> +        drm_err_once(ddev, "Option %lu not supported due to lack of 
>>>> Custom/Auto flag", val);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    flags = opt->flags;
>>>> +    flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
>>>> +
>>>> +    guard(mutex)(&uma_info->update_lock);
>>>> +
>>>> +    r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
>>>> +    if (r)
>>>> +        return r;
>>>> +
>>>> +    uma_info->uma_option_index = val;
>>>> +
>>>> +    return count;
>>>> +}
>>>> +static DEVICE_ATTR_RW(carveout);
>>>> +
>>>> +static struct attribute *amdgpu_uma_attrs[] = {
>>>> +    &dev_attr_carveout.attr,
>>>> +    &dev_attr_carveout_options.attr,
>>>> +    NULL
>>>> +};
>>>> +
>>>> +const struct attribute_group amdgpu_uma_attr_group = {
>>>> +    .name = "uma",
>>>> +    .attrs = amdgpu_uma_attrs
>>>> +};
>>>> +
>>>> +static void amdgpu_uma_sysfs_init(struct amdgpu_device *adev)
>>>> +{
>>>> +    int rc;
>>>> +
>>>> +    if (!(adev->flags & AMD_IS_APU))
>>>> +        return;
>>>> +
>>>> +    if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
>>>> +        return;
>>>> +
>>>> +    rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &adev- 
>>>> >uma_info);
>>>> +    if (rc) {
>>>> +        drm_dbg(adev_to_drm(adev),
>>>> +            "Failed to parse UMA carveout info from VBIOS: %d\n", rc);
>>>> +        goto out_info;
>>>> +    }
>>>> +
>>>> +    mutex_init(&adev->uma_info.update_lock);
>>>> +
>>>> +    rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
>>>> +    if (rc) {
>>>> +        drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout 
>>>> sysfs interfaces %d\n", rc);
>>>> +        goto out_attr;
>>>> +    }
>>>> +
>>>> +    return;
>>>> +
>>>> +out_attr:
>>>> +    mutex_destroy(&adev->uma_info.update_lock);
>>>> +out_info:
>>>> +    return;
>>>> +}
>>>> +
>>>> +static void amdgpu_uma_sysfs_fini(struct amdgpu_device *adev)
>>>> +{
>>>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>>>> +
>>>> +    if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
>>>> +        return;
>>>> +
>>>> +    mutex_destroy(&uma_info->update_lock);
>>>> +    uma_info->num_entries = 0;
>>>> +}
>>>> +
>>>>   static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);
>>>>   /**
>>>> @@ -4492,6 +4633,7 @@ static int 
>>>> amdgpu_device_sys_interface_init(struct amdgpu_device *adev)
>>>>       amdgpu_fru_sysfs_init(adev);
>>>>       amdgpu_reg_state_sysfs_init(adev);
>>>>       amdgpu_xcp_sysfs_init(adev);
>>>> +    amdgpu_uma_sysfs_init(adev);
>>>>       return r;
>>>>   }
>>>> @@ -4507,6 +4649,7 @@ static void 
>>>> amdgpu_device_sys_interface_fini(struct amdgpu_device *adev)
>>>>       amdgpu_reg_state_sysfs_fini(adev);
>>>>       amdgpu_xcp_sysfs_fini(adev);
>>>> +    amdgpu_uma_sysfs_fini(adev);
>>>>   }
>>>>   /**
>>>>
>>>
>>
> 

