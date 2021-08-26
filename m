Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF903F8940
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 15:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BD86E851;
	Thu, 26 Aug 2021 13:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C476E851;
 Thu, 26 Aug 2021 13:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjEsCUNV0vpxd2IWFM1qvMMjbwZNXOjO2cukB909GQZsOpezgu+aQlBnUxKHwWYKN3boc1AluDgtPGHs1ONZqtdSbg0skS55itVMu77dJxUts1BvFFOft3+xDXIOK/RAGEZwziNCs59HEyZfew+hzXwymdIVnGTbHeQv3v37qkX+D+DTi/lDCg4hiYulkQi2vGMX4NfDS9ZbbSTufojBZP5RjIR+u95wKjOyDzOf3m5I8vV5rADt96/kVMBA8edkVr69z+U13Di/WaWnWLE+XpqiEim0UMQbSSpKl8rjzEmTbDH/w7x5Yug6tBcHepw7lThqao/DcPJ/zrIrjF3CbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdMFlZWeOfWJy5fYOcJcCsmBbnBp+t/egym8DJzc+qg=;
 b=oD7FKFlbhVV7bOM8xxtlbc8cR4Po/dxrTVkZg7nXU7ZAxtRSUEP1YAmhg6/Y1RpF+owxvzk/wvLnmSMN3rbEkSJWaU+2YdIR+yXtpO5TiWzHKPza12Vk85ozyhWWtrvk+bmE67x9q7uRcIw7Te2kAp8WAqXMGCNiX5WvB/E1fnhMPLl/J/HiCgfCaUe6l0chXx/1qE+l3+dWnhM1xAwCXh9NASKoyISGgT2IZVwxcKYeMMNHlDTvHfb+hopdiU87OPoB59rO8LN1Cyh7a4oyTbdpz7to4DanZmQVsLTptd/F0WzoIQdq0Em/ojmpQpEPCYJod/mo5i20uma1vxeR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdMFlZWeOfWJy5fYOcJcCsmBbnBp+t/egym8DJzc+qg=;
 b=mir59V7KpFN8cjrwDiYK+d17j2cyZSy2tpLNjd7LwaHynEmODe15hUkop8EYZoLB26uWHM3C3gSrM43wxvV7vDUw2aNVbchIff62iOQmkTj83wAOiM0B7qbh64183k7onTyifKz1HQTjsTyugefTsL2wofcc6/nkkT4QelRlMj0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4719.namprd12.prod.outlook.com (2603:10b6:805:e9::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Thu, 26 Aug
 2021 13:43:04 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 13:43:04 +0000
Subject: Re: [PATCH 3/4] drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
 <20210824210120.49812-4-andrey.grodzovsky@amd.com>
 <d4e6682e-2d2f-f271-6041-6bcb145c1fc9@gmail.com>
 <a4f70dd8-5f07-5279-7f7a-723fb3b8b944@amd.com>
Message-ID: <fa925e81-7724-5dbc-7755-d82e597b0841@amd.com>
Date: Thu, 26 Aug 2021 09:43:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a4f70dd8-5f07-5279-7f7a-723fb3b8b944@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::39) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:80cf:5155:1abb:d396]
 (2607:fea8:3edf:49b0:80cf:5155:1abb:d396) by
 YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 13:43:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaddd411-8443-41a5-87e9-08d968976df3
X-MS-TrafficTypeDiagnostic: SN6PR12MB4719:
X-Microsoft-Antispam-PRVS: <SN6PR12MB4719EBEC2BBEBFB7FEA245FCEAC79@SN6PR12MB4719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTeeyWCojZ5cyjG/BDI2wQgFMFkVNrWq4OcUCf8KJ8ls/GQ/Cq8MuWzZNcKEviOH4BmiUx3hgWjtKq+fEdR+BFzRTNCC/IkNDbKryqvqDD/MLnhk4yOXrZPJZvYN9SZIeJ6VuXrTO6+hWPmxbX0cw8BDVB0yOGEX5alCTciBXxUx51BvYW1vrsFzA2CxfsCu2RvBV9ty6Nq6TBaShMPMWzxjh6YhwLRF8eeBVpdmPgO5vT1ImzE9slbQ6nFSpaL+hN6N60jQX9ZHySaplHFc3lzAlBST04VWVMJO8hJJKqv0G1qaPD0r9DYfJ6KEJKhak3FTQOdWrpN3hYx5hwG1g6mk7H+hWDFnCkE9NjbWcrwlbm8DV6owLS+67Yz3enTc3YjeyhiTMPpy8iIZJcxzsNmJx20CfU57VVbWFi1A0bIWa+OrnvEBJkcA6xDMxZVNCZ6UhlvpQprakqPpXPkPLahr+j7vf3JaqunX5On4aLfda7CotqBCTg9bA5S540bqlegr9XT9ESZdMhQmKkAlLlm10/dK+0xKiZ1oqq7lT3A/CiWyrbMt9amYxYGHAu74pPVz9MWqwWJYeBV/Mh8r4fG16ihD8dzlhZJsxerBC861N5Tsc5m2zK0q79i1QWSRsAc5ZU4ahVKgghWZJ2GiCD8JvBH/hmHtmYx2R7LyMC0JL9lkNw8NHNy1Wvyl0kSWzstnwPeyFnkLQJ0WiE/HEG6SKq2kvrhnyppq0vTBpDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(478600001)(66476007)(2616005)(66556008)(44832011)(5660300002)(2906002)(186003)(36756003)(6486002)(66946007)(31686004)(83380400001)(38100700002)(66574015)(8676002)(53546011)(8936002)(316002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZ6OWhkTWt6WjVTN25taHVSNUFsQWVoKzMvSlppQ3o1Wlc1blN4Q0xqTnZB?=
 =?utf-8?B?c1ZSYzRmQUlTNkJjdWovQlVzdlpYUko2MmNXVWJmR3QrMFRnV3F1Wnovc2RW?=
 =?utf-8?B?N2N6eUFGSGVOMFdjVmFNM1ZDc255VTRwSW1hOHZ1a0Zza2ZGQWtNMzlDajZS?=
 =?utf-8?B?d1h3SDB4N0Q3QndxeGdjdlM4aHRoK1djNTlpc3VPS3EzOGQ5ZG1ObHhWd0p1?=
 =?utf-8?B?eFl2NFhmdndLU0dRVmNHZjFucEh5dmNqQlNIeUlualBWVUgyUUFFMjdRZC9U?=
 =?utf-8?B?ek44L2lnYnlSQzhHaHVIL3hRV2xHeWZLVGtYNTZDMzJzM0hQeFR6QUU2ZE8w?=
 =?utf-8?B?UHFleTI5ZUlaWFJRL0c4QTZwTGJSWTY2TktpTUt3dVd1U3FKajI2U3hkcy9O?=
 =?utf-8?B?Q2MyeERaVmU4VWtqQTFYZjFGa25hTEVwVTA5OElZZHhndlNPMzlwV2h6REVj?=
 =?utf-8?B?cFNmVUoxdUdtVTg0VVNzTXRFbjhRSnRITGZxVk1leXNtbGNacE1reGQyVGs1?=
 =?utf-8?B?ZnBtUkNUbGdCUFk1YnBmaXBzQzNzTlNNa3ZtZXJoSG9FSTJ3ZmFSZGdkV1RV?=
 =?utf-8?B?T1dSNU5vMzc1T0FmdTh3YnFocnVpNlJXdWxBb3RiS2tNR0EwVDQyQ0k4Q2tQ?=
 =?utf-8?B?dmJsS2EraFNTK2MyaTZrVDhFb2VaMGxZUWtpTlU5N00yT0Y2eHM1SG14N1hK?=
 =?utf-8?B?LzgwQ041RmlMM1BidWZqUEl0SE1OV2JkRkx0Q1B2TUFJRk5SdEU0cU8vWjZi?=
 =?utf-8?B?c2xSL0o1ZGNublhTd2N4cm9DV29aUXQyQVZFc2dZcEQ0b25LYk0vbU05SmN0?=
 =?utf-8?B?LytEbEVLdis4VHpxU1UzVmVmNmxsczB2MWw0UGpYcDNQK0tsNUNtTXFsaG5G?=
 =?utf-8?B?am5TQSttNXhoVVliOU9mL1N6c203NzhTN3JrWm5lWmFmUVBocERLamhiSVhR?=
 =?utf-8?B?bDVpRXBUYXEyeE94RmJSVDV4UDRjYzJGZGlzeFRJNk5IelM1YXVVc3RRN3lM?=
 =?utf-8?B?R0JtMksxa0oySnZsdVRnTjhybWtEeG81VzZNNWNsRkxKRkRpclByRWZ6MWtT?=
 =?utf-8?B?aHYyK3JGVWtMejB4RjE1b1F1REk2T29UNytTS2xMYm5kWUZDWmx5ZktBc1NE?=
 =?utf-8?B?cm9YeDhTeEx1QnN2SGM1cGFINHdMOHl4eUk5K29XTEg1ZUhMNHNjVy9CQWRn?=
 =?utf-8?B?SGduVXl5OFYyOGpmTzNzdDAxa1JtZHgrSlRyc1NuQVBvYzJrbG1xTnhZejdT?=
 =?utf-8?B?MnRtRERsMjNtT3hSdlYxU3FGV3crODcvd0R1dHN3QUR5bC9sT2hmKzRBVWw3?=
 =?utf-8?B?U2ZuZzVSSC8reEhScHduN1A4SnlaYWZJMXRRMjZtcy9aeXAyeWc4LzE3WThR?=
 =?utf-8?B?UE5DUnZYaGJaY3FwUGs4VFZ2OW5yZzR6VWxwdXdVQStiNlNyRFpmM1Q4VHI1?=
 =?utf-8?B?V2JsYStUTlQrR3Q4VEVpR0Z2MjIwcTMxcUtKS001N1crTmkwbG0yTEVtakxW?=
 =?utf-8?B?MFA0QVpPbHJMZ1czcEFscUFwMHhHeWtDRzBDWGplKzBxOGZrQ3pTMnp2MXQ4?=
 =?utf-8?B?aE9GaHVRS3ZQUmM0U2VDR0xZbmIyUThjSVhjdHNoYk9IUEwwaVYxZUNnSndh?=
 =?utf-8?B?YUNjdUlXTm85cU1sUkgvM2lJaWZiSjRhYUpILzZhQjZZUzhwMjFsa1lRTGsy?=
 =?utf-8?B?VnpBZ0hFUDJrdFFvOFU2Q01iS2lJSEVDVU9DTWFOdUl6TDRTZ2RTNHJhQVFz?=
 =?utf-8?B?K2M3M2doRzMzSXhnT2E3T3hrZzhLbWUyN2RqWkZKemZCY1V0YWFsTmJrS0NR?=
 =?utf-8?B?YjFxZEMvS0REd2xxays0ZGM2S3N6cDZ3eDYvSU9rRTlsRW5lN2ZtQ1JtVEkx?=
 =?utf-8?Q?wbUMxC4fdK5Ik?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaddd411-8443-41a5-87e9-08d968976df3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 13:43:04.5761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7qtYvgMDdyQlivb0lFveQeL1wXhOb/QniY8jqku5GDd2tipWNLLVDIO4jiBwU+UWpvccYEtRYbKNga6soX5YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4719
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

Ping

Andrey

On 2021-08-25 11:36 a.m., Andrey Grodzovsky wrote:
>
> On 2021-08-25 2:43 a.m., Christian König wrote:
>>
>>
>> Am 24.08.21 um 23:01 schrieb Andrey Grodzovsky:
>>> Handle all DMA IOMMU group related dependencies before the
>>> group is removed and we try to access it after free.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 50 
>>> ++++++++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
>>>   3 files changed, 53 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 0b5764aa98a4..288a465b8101 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -3860,6 +3860,8 @@ void amdgpu_device_fini_hw(struct 
>>> amdgpu_device *adev)
>>>         amdgpu_device_ip_fini_early(adev);
>>>   +    amdgpu_ttm_clear_dma_mappings(adev);
>>> +
>>>       amdgpu_gart_dummy_page_fini(adev);
>>>         amdgpu_device_unmap_mmio(adev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 446943e32e3e..f73d807db3b0 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -64,6 +64,7 @@
>>>   static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>>>                      struct ttm_tt *ttm,
>>>                      struct ttm_resource *bo_mem);
>>> +
>>>   static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>>>                         struct ttm_tt *ttm);
>>>   @@ -2293,6 +2294,55 @@ static ssize_t amdgpu_iomem_write(struct 
>>> file *f, const char __user *buf,
>>>       return result;
>>>   }
>>>   +void amdgpu_ttm_clear_dma_mappings(struct amdgpu_device *adev)
>>
>> I strongly think that this function should be part of TTM. Something 
>> like ttm_device_force_unpopulate.
>
>
> Yes, this something I also wanted but see bellow
>
>
>>
>>> +{
>>> +    struct ttm_device *bdev = &adev->mman.bdev;
>>> +    struct ttm_resource_manager *man;
>>> +    struct ttm_buffer_object *bo;
>>> +    unsigned int i, j;
>>> +
>>> +    spin_lock(&bdev->lru_lock);
>>> +    for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>>> +        man = ttm_manager_type(bdev, i);
>>> +        if (!man || !man->use_tt)
>>> +            continue;
>>> +
>>> +        while (!list_empty(&man->pinned)) {
>>> +            bo = list_first_entry(&man->pinned, struct 
>>> ttm_buffer_object, lru);
>>> +            /* Take ref against racing releases once lru_lock is 
>>> unlocked */
>>> +            ttm_bo_get(bo);
>>> +            list_del_init(&bo->lru);
>>> +            spin_unlock(&bdev->lru_lock);
>>> +
>>> +            if (bo->ttm) {
>>> +                amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
>
>
> amdgpu_ttm_backend_unbind is needed to be called separately from 
> ttm_tt_unpopulate to take care of code
> flows that do dma mapping though the gart bind and not through 
> ttm_tt_populate, Since it's inside amdgpu
> i had to place the entire function in amdgpu. Any suggestions ?
>
> Andrey
>
>
>>> + ttm_tt_destroy_common(bo->bdev, bo->ttm);
>>
>> Then you can also cleanly use ttm_tt_unpopulate here, cause this will 
>> result in incorrect statistics inside TTM atm.
>>
>> Regards,
>> Christian.
>>
>>> +            }
>>> +
>>> +            ttm_bo_put(bo);
>>> +            spin_lock(&bdev->lru_lock);
>>> +        }
>>> +
>>> +        for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>> +            while (!list_empty(&man->lru[j])) {
>>> +                bo = list_first_entry(&man->lru[j], struct 
>>> ttm_buffer_object, lru);
>>> +                ttm_bo_get(bo);
>>> +                list_del_init(&bo->lru);
>>> +                spin_unlock(&bdev->lru_lock);
>>> +
>>> +                if (bo->ttm) {
>>> +                    amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
>>> +                    ttm_tt_destroy_common(bo->bdev, bo->ttm);
>>> +                }
>>> +                ttm_bo_put(bo);
>>> +                spin_lock(&bdev->lru_lock);
>>> +            }
>>> +        }
>>> +    }
>>> +    spin_unlock(&bdev->lru_lock);
>>> +
>>> +}
>>> +
>>>   static const struct file_operations amdgpu_ttm_iomem_fops = {
>>>       .owner = THIS_MODULE,
>>>       .read = amdgpu_iomem_read,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> index e69f3e8e06e5..02c8eac48a64 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -190,6 +190,7 @@ bool amdgpu_ttm_tt_is_readonly(struct ttm_tt *ttm);
>>>   uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct 
>>> ttm_resource *mem);
>>>   uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, 
>>> struct ttm_tt *ttm,
>>>                    struct ttm_resource *mem);
>>> +void amdgpu_ttm_clear_dma_mappings(struct amdgpu_device *adev);
>>>     void amdgpu_ttm_debugfs_init(struct amdgpu_device *adev);
>>
