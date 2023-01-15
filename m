Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B166B36B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 19:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2D510E0FB;
	Sun, 15 Jan 2023 18:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F5710E036;
 Sun, 15 Jan 2023 18:32:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BD3IZ0n+lAuGU4jg+6EBasEKwVui1WhlSyLeRuLwzkuSJe9tMKL+SaRmz9Cemx5BRlpXX83FkArxB7Gd+3NXzZ49/Jk1I9zHEL/w3xlmDQlyT3lhL/qEc09mNG9Q50VNy4pCd5MdigikDC1z7xVe5UZ5jDfURrSRWjwJYo0pfRcBgi2aKZs39BvcYJmQTaXt4cVvIK+Vrx1DJmCgfUt6Nd2YpjPHeXx6b5d1/PSVkwz0Es5iE6ffGu/X8HyUxGEbrjCI5eszomttPY6QPCbNHp1hRPLntlCHjtyA2PPgkz9S5xiakm2IRd1ZsVwPxaLl31TBZwOuVxvRY5tBmRxvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0JCt1VuYom5gbM3dRPRoxR7vJsGYKLuRNwWXzIV8t4=;
 b=Qnv306v431dKz53C3+mdMJ2A7yttbiViltmYdwQgp+jcV4uU+RI6rZ4hPDum8+MIYrPUgBUTCy5JNmdlMZUps9D3mgmOSNx2mMIi5n5YuqX2n8sZCDsb6BAspDIqw0IAs5MIYcKNZR2/UfwGL3D4z1UQlmyNpuhet+LY7bGaZIP9ohs7sqvnI3wCPL6sS++RZ3Hm4idSgx8vrwWrYtD3fkrTRnwEOh1VBlzEMzr1gEe4+Q1VQSFk4r1wQajDoNXEDhqBAwcj3iM4HdDvO2GLM6oOtSuKLy5zQpyh2TF7oVf+9rv7j+IPYT596nm+/Cp2zypnfuQOVMV3lzWf62hLMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0JCt1VuYom5gbM3dRPRoxR7vJsGYKLuRNwWXzIV8t4=;
 b=bvoKNcQ4098AyZIurCHINo124kHOR5VKBGIl7etSmhmP0p7TNCT1/r/CAGAsdKkN/tUJZVMu35bAyFTTWWRA3sDa6bkPQM0MarXJERc4xvwYUMcRuIXsZeMveyPgUlINGga9i+gnfcyqTVaQy3m3ARNVvO/wJ9A9xFNUbK1DcK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS0PR12MB8247.namprd12.prod.outlook.com (2603:10b6:8:f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Sun, 15 Jan
 2023 18:32:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411%5]) with mapi id 15.20.5986.021; Sun, 15 Jan 2023
 18:32:06 +0000
Message-ID: <e55cc02a-3180-20b9-8255-f95f5910e7fe@amd.com>
Date: Sun, 15 Jan 2023 13:32:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Chen, Xiaogang" <xiaogang.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
 <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
 <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
 <1437874c-4b4b-191f-4486-de6ac69e99cc@amd.com>
 <19873c87-5d01-30dd-84d2-ced61b236fa0@amd.com>
 <27d2a3eb-541f-fd5b-6a92-77e49c74d1b4@gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <27d2a3eb-541f-fd5b-6a92-77e49c74d1b4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTBP288CA0018.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS0PR12MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b528e5-eb0d-47a8-5943-08daf726cde6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D5wB9aT9oHLqVRWP2bh6cSzXActu/ps3HYn5GM4HBlR7mUZT3yS/fdFENUYPs8JesXs5ojRg3QCmWRWTl08xqN6OSiraM4tU7JLEhyBRepkp80V29siqE3S4wM08ZCrMrQbDKSpmpu0mp1vho/bycVpOeeY3jnRH0K9kVKxp1Ik/N6VJSzC/phe+vtqAJQ6Ai/zQg6rgh3jaU8WZph4q9Viah8+XFsb77Mvwyja3oC4BLXfOUwNZf3DVLXlwPrTOAZzC5slvbiSY+zIvDmSjeJRo+J3LWzYZaIDMnurMpXJaH1hHpegD52WIW132do26QNNLDjLd9oDG3lG9tR093l3xuKpKFUBkgGjTfCcZfG2feaJFxB4BqU8rS2oqhjB+SBPH4Tf8DlZ13am9dZIuLhk9hj0zrHzbRr1mrjFaqk6wmjXiZX3kQ+YkZL1/QVH7d0efITFGYGs9rGEBzVAZNWUVxN1QjEKT51OjnXLRKs/MJrEfX/fUdIVy+NEkUGQfHMmy1SSusCPOC8smrFxuFa3cnedczzSbp08ftZpmwqTNg0JVXeMDc7i6bmMgZfsPoeBAF7fvO91T4kvAJ/9/WFeMR4Z03fGtnofpex0bZI2m8LkFceUCNq3ryp+mgAC3d7q34K/JvVOx0Z1t0EQsp9WPpenJe9X2yMo1IgwRvBX0slf6I8lyujCyRFUxHwnvndbRhGa0kNOXzUAWbxif2vKgxjIAWmxgcMM6lb5LxhSH4dlSyvinDb/o9ghv96rMlX2em6Vq6M7ezLIlnWSfrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199015)(36756003)(31686004)(86362001)(4326008)(8676002)(2906002)(66946007)(66476007)(66556008)(5660300002)(83380400001)(38100700002)(44832011)(31696002)(8936002)(478600001)(6486002)(110136005)(316002)(6512007)(41300700001)(66574015)(53546011)(6506007)(2616005)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHhrOEtuZFVoU2s2UFM0K3VkTEV1M2FKTFd6bFFDRzdzc0d5VFpuUUwyUmhV?=
 =?utf-8?B?dHpyb05WT0tHQUhnTHNCTTFWTlp3VnpidFI3UXM4QUFibWNFODg0UUVHSytl?=
 =?utf-8?B?bXRjT1gyLzdxODBGVVN0UjNuY0VGb2pvSU5oc3pwWlRzT1RJTzN5YXM2S3lC?=
 =?utf-8?B?a3M1aVhNZ1RKcGhxdzVXZ3Y0blgycnVMYnZqa1NyT2FKZ05OdnI1MjdPTDFU?=
 =?utf-8?B?VVhWTGVvUlZ3ZVdyWjBPeWJSQXc0b3hqd3RNbzRqSWNZNVArUFV0NmJwRXU4?=
 =?utf-8?B?ckNWZnVTclErbkRCVGxkdzVHUk9JWHRxYzhrcitVWnU3QnYwOFRaOHlXNDE0?=
 =?utf-8?B?U2FHR1NSejlaZlplbXJYY2dlRlhpbXc1a25Dd3YyR1d0elovZmRmbk5LVXcx?=
 =?utf-8?B?MHdyRTZTU2pVenRURFN6VERibkRhVEdETHFCWG5mNFNZZTdlYk1DNzZsdGtU?=
 =?utf-8?B?NlJLa1RxWDUwRnV3a3FQN1hNazNvWEp2TkplWk5WNTlXejJ1SFRCMWU3S21Y?=
 =?utf-8?B?UzBtYU1sZTBmK0NVL3ZLSHRwY1VVd0hjSElvQURZclZsSFUrTjM1V091cjdy?=
 =?utf-8?B?Rnd3NFF3SWNaYW4ybkJGOFFnQVltQUJ3QzRoNlhtc3cyWW5VbHZFdVZ2bFdm?=
 =?utf-8?B?MTl4WlF2SUxlZU9pODVWTkZqbDJCQldaazVsQXA1dDlEQnF2LzcwVk0wSEkv?=
 =?utf-8?B?a1EvemFkYUFUVE1uK2tRTjQ5clJFazdkVHV2RnFldUU2YlNqVnZoS1Q5U25s?=
 =?utf-8?B?bXJ4by8zSzdReTdJUzVISUhrS2xjVGJ3MjN0N0V2a05oZ0hOV0JMV1pqK2Ny?=
 =?utf-8?B?TlQxby92cUhkcWFpMDhXbkpnUk5BZDBmTis5RVpISzY3TW1ybHpqTmtEN0Jo?=
 =?utf-8?B?YldiZFlFVTlxVkFJSUVJVkFuem5GNUQ2bnFYdjVCWmp3ZkQ1ODcxMTNNeTNW?=
 =?utf-8?B?Mm1JOVd4Nks1UE80SXJRcjF0T3gyNStIOXRTZEhaUE1DN0JRaVVPdnhKVTVP?=
 =?utf-8?B?K1lKNHBLUDYyaUJlYWl5SmpTWWdzQkpqYjY2amRXR2VsSGVVcHR2ejMwdWNK?=
 =?utf-8?B?MndlZGtwSEM5aHBZcTRhZVBvZy9mK3h3UU9WT0ZpaG1mSjg5TnNlWEhjeVhI?=
 =?utf-8?B?VUhsenk1TXBxUFJhWDFjdCtkS25VbmhSOVJzMitWcDUxZ1JLanRoMG9WK2lX?=
 =?utf-8?B?UmtOTjJMQTBGamhHcE1UbzdieWJGdzlIU3NLR2FEMEZDbXJzaFkwdHVySnBL?=
 =?utf-8?B?c0RTUkh2eWlvWUh2Z2E0QlZpbXlESVI0c3ptTkU0Y3VPMWcvbDJ6RnZmTFNv?=
 =?utf-8?B?RENPSlk4d0FzeGE1a2E2cnA3cDJ5OTNvbVJsOC8xb0RLU1k5N01zLzdyOTFJ?=
 =?utf-8?B?bC9TdlEwUUU0WTVHSW16VjVlaTdwMFV3VkIrY1hHL3ZzNktNZGRndHZrYVZD?=
 =?utf-8?B?WVgvNk9kWUJIRjNVRlc0NTNjRTlaUC9ndm1QcVZNei9yNnNPVWkwMlJLRmNH?=
 =?utf-8?B?L2dHVkdWRXNLSGNWcEJVTkk5UTZ0ajU5aWNzdU5rVGdMMHRNdWx1b2MyaTc0?=
 =?utf-8?B?empDUEdTRkJBdEZQMWJsRnhFdFAxeTFvS0FlK01MWkQ0N3ZZQjVMR3V4U0Ri?=
 =?utf-8?B?aVBxMVRoRUFlT1lMeVdobUtGeEF5bmZpUkF2NEFhcGJOYkZ0TVZOTlNJeFQr?=
 =?utf-8?B?bWk2M2JuNnZNV29TeGtXMHBwYjJIeU02MDN0ZDBmYllTWmJPZDRYZGdZOUxB?=
 =?utf-8?B?VWJKVmYrSTAwc1FzZmc3bDlwWXNNd2M1cTBQKzJWNm03Z2grb2N6TmtvS0d2?=
 =?utf-8?B?aW9yc1FRQWtZRG9URkl3RU1iTVZhUDJ1NzFiSmhDUmRrNS9taTl4WUdNbnNj?=
 =?utf-8?B?djhVbHpkQlJMS1NMREdZU3BNd1FZUGV1aUJvb3g3NVh6aW03ZTRSTUJYZGt5?=
 =?utf-8?B?eGZXSW5obTYrWXYrWTBRTStpdU5uQklLY05KNnJJNlIzNFFmcFZTcmQ5dzRt?=
 =?utf-8?B?T1VNUXR5K25mbHZaTVUvZGNkS3F1Nzd1aUNUUkN4QUkyNlNvS0dEOE4vbjJK?=
 =?utf-8?B?QlA1L0VQYkNFU0dJTVBEUStPR2MrdWFUZE9IMmJkUEFwTEVZN2p0V2M5TXdC?=
 =?utf-8?Q?a/BPCYxc0Qmvnos7xroqGU61T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b528e5-eb0d-47a8-5943-08daf726cde6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 18:32:06.3320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSPmQ2d4dKXP8majyjJQFXzH1kpWYtNFQR1wUp5WBuxtkVYDBxblKChBxh5xYH8YguxeiFFGHKsUxvqh1dHBsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8247
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-01-15 um 11:43 schrieb Christian König:
>
>
> Am 14.01.23 um 00:15 schrieb Felix Kuehling:
>> On 2023-01-13 18:00, Chen, Xiaogang wrote:
>>>
>>> On 1/13/2023 4:26 PM, Felix Kuehling wrote:
>>>> On 2023-01-12 17:41, Chen, Xiaogang wrote:
>>>>>
>>>>> On 1/11/2023 7:31 PM, Felix Kuehling wrote:
>>>>>> Use proper amdgpu_gem_prime_import function to handle all kinds of
>>>>>> imports. Remember the dmabuf reference to enable proper multi-GPU
>>>>>> attachment to multiple VMs without erroneously re-exporting the
>>>>>> underlying BO multiple times.
>>>>>>
>>>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>> ---
>>>>>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 
>>>>>> ++++++++++---------
>>>>>>   1 file changed, 21 insertions(+), 17 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>> index 6f236ded5f12..e13c3493b786 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>> @@ -2209,30 +2209,27 @@ int 
>>>>>> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>>>>>>       struct amdgpu_bo *bo;
>>>>>>       int ret;
>>>>>>   -    if (dma_buf->ops != &amdgpu_dmabuf_ops)
>>>>>> -        /* Can't handle non-graphics buffers */
>>>>>> -        return -EINVAL;
>>>>>> -
>>>>>> -    obj = dma_buf->priv;
>>>>>> -    if (drm_to_adev(obj->dev) != adev)
>>>>>> -        /* Can't handle buffers from other devices */
>>>>>> -        return -EINVAL;
>>>>>> +    obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
>>>>>> +    if (IS_ERR(obj))
>>>>>> +        return PTR_ERR(obj);
>>>>>>         bo = gem_to_amdgpu_bo(obj);
>>>>>>       if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
>>>>>> -                    AMDGPU_GEM_DOMAIN_GTT)))
>>>>>> +                    AMDGPU_GEM_DOMAIN_GTT))) {
>>>>>>           /* Only VRAM and GTT BOs are supported */
>>>>>> -        return -EINVAL;
>>>>>> +        ret = -EINVAL;
>>>>>> +        goto err_put_obj;
>>>>>> +    }
>>>>>>         *mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
>>>>>> -    if (!*mem)
>>>>>> -        return -ENOMEM;
>>>>>> +    if (!*mem) {
>>>>>> +        ret = -ENOMEM;
>>>>>> +        goto err_put_obj;
>>>>>> +    }
>>>>>>         ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
>>>>>> -    if (ret) {
>>>>>> -        kfree(*mem);
>>>>>> -        return ret;
>>>>>> -    }
>>>>>> +    if (ret)
>>>>>> +        goto err_free_mem;
>>>>>>         if (size)
>>>>>>           *size = amdgpu_bo_size(bo);
>>>>>
>>>>> Hi Felix:
>>>>>
>>>>> I have a question when using amdgpu_gem_prime_import. It will 
>>>>> allow importing a dmabuf to different gpus, then can we still call 
>>>>> amdgpu_bo_mmap_offset on the generated bo if 
>>>>> amdgpu_amdkfd_gpuvm_import_dmabuf also ask mmap_offset?
>>>>
>>>> The mmap  offset comes from drm_vma_node_offset_addr. The DRM VMA 
>>>> address is allocated when ttm_bo_init_reserved calls 
>>>> drm_vma_offset_add, so there should be no problem querying the 
>>>> mmap_offset. Whether mmapping of an imported BO is actually 
>>>> supported is a different question. As far as I can see, it should 
>>>> be possible. That said, currently ROCm (libhsakmt) uses only 
>>>> original BOs for CPU mappings, not imported BOs.
>>>>
>>>> Regards,
>>>>   Felix
>>>
>>> The mmap_offset is actually not returned to user space. I just 
>>> wonder if here we should get mmap_offset of imported vram buffer if 
>>> allow bo be imported to difference gpus. If a vram buffer is 
>>> imported to same gpu device amdgpu_bo_mmap_offset is ok, otherwise I 
>>> think amdgpu_bo_mmap_offset would not give correct mmap_offset for 
>>> the device that the buffer is imported to.
>>
>> When the BO is imported into the same GPU, you get a reference to the 
>> same BO, so the imported BO has the same mmap_offset as the original BO.
>>
>> When the BO is imported into a different GPU, it is a new BO with a 
>> new mmap_offset.
>
> That won't work.
>
>> I don't think this is incorrect.
>
> No, this is completely incorrect. It mixes up the reverse tracking of 
> mappings and might crash the system.

I don't understand that. The imported BO is a different BO with a 
different mmap offset in a different device file. I don't see how that 
messes with the tracking of mappings.


> This is the reason why we can't mmap() imported BOs.

I don't see anything preventing that. For userptr BOs, there is this 
code in amdgpu_gem_object_mmap:

         if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm))
                 return -EPERM;

I don't see anything like this preventing mmapping of imported dmabuf 
BOs. What am I missing?


>
>> mmapping the memory with that new offset should still work. The 
>> imported BO is created with ttm_bo_type_sg, and AFAICT ttm_bo_vm.c 
>> supports mapping of SG BOs.
>
> Actually it shouldn't. This can go boom really easily.

OK. I don't think we're doing this, but after Xiaogang raised the 
question I went looking through the code whether it's theoretically 
possible. I didn't find anything in the code that says that mmapping 
imported dmabufs would be prohibited or even dangerous. On the contrary, 
I found that ttm_bo_vm explicitly supports mmapping SG BOs.


>
> When you have imported a BO the only correct way of to mmap() it is to 
> do so on the original exporter.

That seems sensible, and this is what we do today. That said, if 
mmapping an imported BO is dangerous, I'm missing a mechanism to protect 
against this. It could be as simple as setting 
AMDGPU_GEM_CREATE_NO_CPU_ACCESS in amdgpu_dma_buf_create_obj.

Regards,
   Felix


>
> Regards,
> Christian.
>
>>
>> Regards,
>>   Felix
>>
>>
>>>
>>> Maybe we should remove mmap_offset parameter of 
>>> amdgpu_amdkfd_gpuvm_import_dmabuf since we do not return it to user 
>>> space anyway. With that:
>>>
>>> Reviewed-by: Xiaogang Chen <Xiaoganng.Chen@amd.com>
>>>
>>> Regards
>>>
>>> Xiaogang
>>>
>>>
>>>>
>>>>
>>>>>
>>>>>> @@ -2249,7 +2246,8 @@ int 
>>>>>> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>>>>>>           | KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
>>>>>>           | KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
>>>>>>   -    drm_gem_object_get(&bo->tbo.base);
>>>>>> +    get_dma_buf(dma_buf);
>>>>>> +    (*mem)->dmabuf = dma_buf;
>>>>>>       (*mem)->bo = bo;
>>>>>>       (*mem)->va = va;
>>>>>>       (*mem)->domain = (bo->preferred_domains & 
>>>>>> AMDGPU_GEM_DOMAIN_VRAM) ?
>>>>>> @@ -2261,6 +2259,12 @@ int 
>>>>>> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>>>>>>       (*mem)->is_imported = true;
>>>>>>         return 0;
>>>>>> +
>>>>>> +err_free_mem:
>>>>>> +    kfree(*mem);
>>>>>> +err_put_obj:
>>>>>> +    drm_gem_object_put(obj);
>>>>>> +    return ret;
>>>>>>   }
>>>>>>     /* Evict a userptr BO by stopping the queues if necessary
>
