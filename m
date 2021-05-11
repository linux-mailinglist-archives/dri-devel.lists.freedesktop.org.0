Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328E37AB3D
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 17:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F7E6EA74;
	Tue, 11 May 2021 15:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2082.outbound.protection.outlook.com [40.107.95.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27FA6EA74;
 Tue, 11 May 2021 15:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KR4rQ99Jktqcsj6FnHTQhVRtv94wY3rE9IipzRS3slAVTLjS8V5IZ+LtGe+omp139GWs6F5yT0JyI8Kj6C0SY1VgebfZHA5EZKuPxa4/dIrnxvXL78PaqklwYmiiI79Ydef3jhWID/I96d9hqdcPfdswn0cyFON+ZjlH4JtZ3RfvSuKBtN4XM69UBaqGt19MDkRFqNjhLlIZoQNL1wxtatLcUR+F9rnmnGkySn7lQPBu5HSfdaWRzAQqs3k9Q387gOhNH9JgJ9tXK56yPBdHgTiZWqGdo3UkG4eW1zGkJJ8j3g8c9qyWc+j1TCdUYuhY2ytzeZFb/grMnfzf7i4u3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NE7ZOdn95letbVWqTDWEglb3oMGBl7ZgC7QXk1h39Og=;
 b=kTy7Um65yn/6T/wtQ7Bi3S/J6/FMT12e2fgKUniw9YsYEXiPcTTSt6zWLCB/73sEiHB8tERet4eHdFAGJgkB3rbhGMF2RZyeJLSBpHa9t2HWjg/jUabjeOc3XI3PyRZIYyML2WMuhadpsRz87el5zDWODM1TOQcUa7ltZv9VtLNqdD6Nm2tGaPzXh1toAJRtA/bpeM0VDqfV97R1Jkc04H9m8dIsHsPbM+bLyVid49UehmOZgM25/+UOvhdI7G6xHn8Nf7g7IxB5nFI5D58sh0HrIlxW3z3F53EiRXzYioZEVZVtsG43N2fJ47DDwVz5X2YVsYLdil6IlftP949M1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NE7ZOdn95letbVWqTDWEglb3oMGBl7ZgC7QXk1h39Og=;
 b=tJYtLAzhxA4pXqfrXhW/eX7K20Ua/UxtizkN/KtuR3btgWPEY7NJUP8Pm23kvz+I8l/HLqnEbl+aOHgnfN7RFi+1KE3FZUJmo4IuaTQT+oVT7irIUwCFm4pdLf1B20TJbWpWavI2JDhmO79oNHwsMacHnEp7u9I+p0XJtKlOSTI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Tue, 11 May
 2021 15:59:28 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 15:59:28 +0000
Subject: Re: [PATCH v6 06/16] drm/amdgpu: Handle IOMMU enabled case.
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-7-andrey.grodzovsky@amd.com>
 <CADnq5_MNd+2BLV-v9EJPR-zwW_qT4UVLMRowyY2_tEvsQRYvew@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <951d4db9-87c3-66eb-370a-01ab14deec42@amd.com>
Date: Tue, 11 May 2021 11:59:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADnq5_MNd+2BLV-v9EJPR-zwW_qT4UVLMRowyY2_tEvsQRYvew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Tue, 11 May 2021 15:59:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a255761f-cbbf-440c-ec32-08d91495c1c7
X-MS-TrafficTypeDiagnostic: SA0PR12MB4397:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43970247FC5BBBDF9D624913EA539@SA0PR12MB4397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2sCcjVyGE8Y2NiaVExiRAizzkOZqWNyWl13j222Flgjum7qXebkhGNaT9UMGhXn3IReEBXpseVucNV2rya+z2F06dR7QeJmwmUSv92K+1kYjzEemtJo6kSi1OrvEvIF3mFwb3gSg2KnXfwzlH7ZiLSuXQ9b6NtaOrOrFP9L5s3rHfeXtRc9alDd9+s80ht4aPoMM67aYuSL2DLU9K6foBaClXnRxqvkTqH9woKI7Bqxz/e/9dzodhlue3f3X3rXOsUjk/wLGJYfrbQN/wPg0x4XScdhjgnAWxlJCdoBpO1PCENGzlNgjmvo3s8Urm1c+oKCzRHrRO8sqsWjPvI4w9wlkG30jw6YXWJONX5joF1iPuK3RCwOIk90xITCm34WhouN8/ZqyKAtmWeRBapOvoAHfM6WoGble+C7oY11sC3d821or/lxZTbbCpf07rXocNW/MpfjdNIAvrpQf+iKwOSQJcKnKJutv6MLiOfKhqPJ37+YiL+/J066DV/snr0m3EdEPs2XA03+ztuN5k4OtwjcCahaNvpTFdi7MncG8J4wG7xGiU9TMTym6y6NXfqECMUT9TdI3QxjuC21t+x9Y8zRQZs5nvJpJfrvBflBZravxz5UP364a+x9lzCtxO1yomWW9EivF7eeG/lP/eFeEwpLKWxFHaU0SHbO4a3kwPXPJIwT+5Ds54fz63bLn9Za6Zg6El4RTWH9YoOCkFcsrhh8jMuQo0mweNqYHpCBxmwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(44832011)(31696002)(966005)(54906003)(83380400001)(478600001)(45080400002)(38100700002)(16526019)(5660300002)(2906002)(316002)(53546011)(36756003)(66556008)(4326008)(8676002)(66476007)(31686004)(8936002)(2616005)(66946007)(6916009)(52116002)(186003)(6486002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qmo1WU1iQ2ZxZm4vWWdBMWI4QUwwdUdMLzBNOU1tYXhLZGZ3YjhOcnRwSXpQ?=
 =?utf-8?B?L2VIbXlidjRYVWR5QXozaG9scVVaV09WekhaVXpSck91KzcrSG95RUoxNzZR?=
 =?utf-8?B?a1JRK3pUdHFTQ3lmQVFLNDZ0L1FUY2htUW1YWDFtL1F5SUhlTnBmZTd2clhJ?=
 =?utf-8?B?QTl3aGpqSzQ5dUV5THljblJTemlaR2JZL0tzaHU5cmJ4V3A4QndySzlScWdx?=
 =?utf-8?B?MmVOcTRYWVlRVHphVzdsOVRlRm5sRzkyVXdYa1BQZERPeDFGSGZ1d0pSRUZu?=
 =?utf-8?B?M3p5ZUhpb0RwbG9aWEc5MUZ4YUdUMUl2WkRSVHZZRXNZU3ZlNmE3WkdMQkFv?=
 =?utf-8?B?WnhKaTRsRitqajFqWFphMm5tQjkvOXlwZ21hSzg3d0tiNUdqSkZ2dXBEZUlX?=
 =?utf-8?B?eVRzVkZaUndDbEJseURlMS9ObE9SVWRzbXF4V2tnb0dDRnBzTUtQSzFpUm51?=
 =?utf-8?B?cGFZRHB4Ynl6eG9CcmZzK3ZkZkwyUWQ1czVHUnE3Qi9EK1daM2hNZ0lXZlRM?=
 =?utf-8?B?ZmdKOVBoYkpKUjhYYUkxZE1mc0ZScWkxU2lmV3hUQTZQUjhnY2grUWoyVHdF?=
 =?utf-8?B?NWNWZGtDZVYvMVNPM2Z6aVdIUVdOVndwU2k1Q2ZReE5waVhYVVJTejJ2OTcz?=
 =?utf-8?B?cTA1ek54S21WdFR0cHNIUWl3ME9OQ0NVWDE4VzA5NVdnYkhLaUpnaWlYL2sx?=
 =?utf-8?B?eVhRTTJha2dJZnRrSkxRdEM1NDNlK2Ztd29vcFhvbWtLV1B6TERQR3ZKRzRa?=
 =?utf-8?B?dStKa1dLcTBFRWxQcGVITjlIUWw1STgzVUZEQjA4cjk1U2RDdnA1RUVXdVZ6?=
 =?utf-8?B?UWgvaGNZL2l5MlVySkFBeWswaXRFVHZoTnVQSkR6TmIybWN2bEVNRnpDeVM1?=
 =?utf-8?B?elBVMStpa0xvR3U3N2prZkRYbVByR0twcW1YQ2ZJMW9VMlk1aGpNS1dOR2RX?=
 =?utf-8?B?Vk1VTzN1aklpQXczSFhOZE5XaUxXZUMzTkRoQnF6SzRVL1Q3NHdQY1VXMFVH?=
 =?utf-8?B?YTZFUVpjTk5BbWFwQ0FET1lPNllkUFZDYXp2RVZoWi91Rkd2ZWxTQlRNOUo4?=
 =?utf-8?B?dHFvcm9JUWo5Q05raUR4eGY2OFNGV0FtQVJLanAzSzY4cm1HV1pRNjVsK2N5?=
 =?utf-8?B?WUR5Z0sxZ1pLQWNnb3gwd1JUOWVnZ0NmZmFzMzlHR2M4Si9ndWN4Uy9kcitF?=
 =?utf-8?B?MzlhYWxTaUc3anYvb1JzVUkzUkdZSEVZamxRekV1a2swVDNzNzNyWTlxcFpn?=
 =?utf-8?B?eGF6dUxVbFJVUlNaRHowQ0RDSEFrN0xUR3RRcG13RitVVVFyM2JPRWM1K2lF?=
 =?utf-8?B?R1EycGcxZUFSUEtDL1Y5VmFxeE1GUFZtWHYrQm9Od3dRTEhSQVlpRkFUcXpF?=
 =?utf-8?B?dTlxZlhzWW5UUW0wVDVWNUI2aFFSN0RaYVZOQU8rQW5DdFRmRU43c0dVZm5O?=
 =?utf-8?B?U3JNd3ByYlNmVzNUTWpKOFhkUjhVbi9GcThRbjFpOTZ3YVJlSTB6RkNXYVIv?=
 =?utf-8?B?ZC93c3BMdTd3SVhWdlAzMnFjZU9tRklZazNhWXhseCtLQ29oWnRUOHhpcm8r?=
 =?utf-8?B?eDZ3eWl4UmtmdjdtczZjZGU2TjR0VmdqZUVvQlU4ZTJvMlI2dUN3Z0J2eFUr?=
 =?utf-8?B?ZnJUQjBRU2lYZXJZQXhJenBUWSttYlhkeExKbTFsZERPakdwdXQyd21CZ0p0?=
 =?utf-8?B?TjhDck9Vc1ArcEVWUTRBZTZnallTQjg2emwzNjdwZTNCVmh1blhkTlB5WUcz?=
 =?utf-8?B?YnBFZ0gzQ0FzdEwxaCszYmVQNDhwU1VIdFNGY2RDUDd4Ymt6MnFrcDZwSmhv?=
 =?utf-8?B?TkdoLzB4dUxNb2ZteXVzQ3lUR0xHZkl2SkZWTElDajlEYjcrRFVhWWNvelJ5?=
 =?utf-8?Q?5MaSH77YfcdOL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a255761f-cbbf-440c-ec32-08d91495c1c7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 15:59:28.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TK2M+lZ2cMjqq9JoGt4Caps5jz1alufDPTBjvIBHTZfzmHs+56saoqG5aQz7JoNP92Rjrgtk7tVZ1VUGJ73yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-11 11:56 a.m., Alex Deucher wrote:
> On Mon, May 10, 2021 at 12:37 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>> Handle all DMA IOMMU gropup related dependencies before the
>> group is removed.
>>
>> v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
>> v6: Drop the BO unamp list
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   | 3 +--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   | 1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 9 +++++++++
>>   drivers/gpu/drm/amd/amdgpu/cik_ih.c        | 1 -
>>   drivers/gpu/drm/amd/amdgpu/cz_ih.c         | 1 -
>>   drivers/gpu/drm/amd/amdgpu/iceland_ih.c    | 1 -
>>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c     | 3 ---
>>   drivers/gpu/drm/amd/amdgpu/si_ih.c         | 1 -
>>   drivers/gpu/drm/amd/amdgpu/tonga_ih.c      | 1 -
>>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c     | 3 ---
>>   11 files changed, 13 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 18598eda18f6..a0bff4713672 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3256,7 +3256,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>>          NULL
>>   };
>>
>> -
>>   /**
>>    * amdgpu_device_init - initialize the driver
>>    *
>> @@ -3698,12 +3697,13 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>>                  amdgpu_ucode_sysfs_fini(adev);
>>          sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>>
>> -
>>          amdgpu_fbdev_fini(adev);
>>
>>          amdgpu_irq_fini_hw(adev);
>>
>>          amdgpu_device_ip_fini_early(adev);
>> +
>> +       amdgpu_gart_dummy_page_fini(adev);
>>   }
>>
>>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> index c5a9a4fb10d2..354e68081b53 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>>    *
>>    * Frees the dummy page used by the driver (all asics).
>>    */
>> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>>   {
>>          if (!adev->dummy_page_addr)
>>                  return;
>> @@ -375,5 +375,4 @@ int amdgpu_gart_init(struct amdgpu_device *adev)
>>    */
>>   void amdgpu_gart_fini(struct amdgpu_device *adev)
>>   {
>> -       amdgpu_gart_dummy_page_fini(adev);
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> index a25fe97b0196..78dc7a23da56 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> @@ -58,6 +58,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>>   void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>>   int amdgpu_gart_init(struct amdgpu_device *adev);
>>   void amdgpu_gart_fini(struct amdgpu_device *adev);
>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>>   int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>>                         int pages);
>>   int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> index 233b64dab94b..a14973a7a9c9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> @@ -361,6 +361,15 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>>                  if (!amdgpu_device_has_dc_support(adev))
>>                          flush_work(&adev->hotplug_work);
>>          }
>> +
>> +       if (adev->irq.ih_soft.ring)
>> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> 
> Why is the ih_soft handled here and in the various ih sw_fini functions?

Post last rebase new ASICs i think were added which i missed.
Taking care of this with prev. comment by Christian together right now.

Andrey

> 
>> +       if (adev->irq.ih.ring)
>> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>> +       if (adev->irq.ih1.ring)
>> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> +       if (adev->irq.ih2.ring)
>> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>>   }
>>
>>   /**
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> index 183d44a6583c..df385ffc9768 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> @@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>
>>          amdgpu_irq_fini_sw(adev);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>          amdgpu_irq_remove_domain(adev);
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> index d32743949003..b8c47e0cf37a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> @@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>
>>          amdgpu_irq_fini_sw(adev);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>          amdgpu_irq_remove_domain(adev);
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> index da96c6013477..ddfe4eaeea05 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> @@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>
>>          amdgpu_irq_fini_sw(adev);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>          amdgpu_irq_remove_domain(adev);
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> index 5eea4550b856..e171a9e78544 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> @@ -571,9 +571,6 @@ static int navi10_ih_sw_fini(void *handle)
>>
>>          amdgpu_irq_fini_sw(adev);
>>          amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>
>>          return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> index 751307f3252c..9a24f17a5750 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> @@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>
>>          amdgpu_irq_fini_sw(adev);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>
>>          return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> index 973d80ec7f6c..b08905d1c00f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> @@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>
>>          amdgpu_irq_fini_sw(adev);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>          amdgpu_irq_remove_domain(adev);
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> index dead9c2fbd4c..d78b8abe993a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> @@ -515,9 +515,6 @@ static int vega10_ih_sw_fini(void *handle)
>>
>>          amdgpu_irq_fini_sw(adev);
>>          amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>
>>          return 0;
>>   }
>> --
>> 2.25.1
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cb45a1bb9b62c47513d8a08d914955fb0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637563454058642697%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=lKXHkne%2FTx7abQcPBaINBt769zrJzEvcHwQ7KfxG1ZY%3D&amp;reserved=0
