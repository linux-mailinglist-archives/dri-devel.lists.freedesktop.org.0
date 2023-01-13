Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E666A5EB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 23:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D0110E035;
	Fri, 13 Jan 2023 22:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026C210E0AD;
 Fri, 13 Jan 2023 22:27:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9DnMWR7DZKjsyCn4K6k/98zka1s+vOJhw9CwUwcMkiGkfbr6Ifn/ZKHII39U0MeiXeP6I+2UygqmSnPqb4LPnTLLlIb7iYTXIM0H/ivgMIfnFsa23xaspwR+xIuvlIBc6JH3Gj8+h/Ky+hHQW9k+kzR3l3SKnNV7PW4Ai56fPV8Asxj1GOM/7oR80GTxv8GMX38Q8zaEQUDZFD1H0kol3Ly+Zh96tYzLoh+SLSDZRJ0CqVNU9kIhE4GEfqUxQ8Ose2KsfXnBv7nIdHVcFkjzz427qtWNC3rCUrPr6ARA1vHcUuKZD5XnSb89Iuz/+qWThTXgsI7qOOSzGlQKUzscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uy21Odwee9zEBDKNtFEIYppD9drucV349Y72Y8lJrBo=;
 b=AHoJ0ELFe0/mm4yPUXYmuAWkZ/eztTsO1yun69Gxbfjq1WlsPrkN185jCJgcfnEwAoZ+cA1o2F+76/zGAf4h6bzaMWm+EECpcLhiQcWnMYK6itxQ9WcaIHlZy1mhF9oxWoCrltjcpx08WaFlBIi2ukXfS7/jmvbBlT5pwWPU+v/nMT7i1fKTNHeujHbQDQ1jkmO8nvIuL6STs3ZfaJ+dpZOkE9F+VWAYWt7LNyUI+nAejXnwFtGmCZ/LIhM3oZu2OIJKhn3R0is+IIIbaGPWxNBcwujjZP42audX6VlBv59fC7x5YAGgc5HIkdfYCbnHS8F+iZsRoo5uMR/Vp5YRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy21Odwee9zEBDKNtFEIYppD9drucV349Y72Y8lJrBo=;
 b=mjxfUkFv0MjmoUc0CMghGB04yHco3bXKepT1iCTk9eJZGVqp0+v5Wyo9okO04B9elvBo/Q8E7C/8Y+GvjvRbZRfVwBG/cLCxVFR8jo+LPxEj2iOl8FPwXVADzcfVU3sUAxI9LYJ2wb0weCXQZugIl6SVHt4XlqfHNfOYiK/OorQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 22:27:00 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411%5]) with mapi id 15.20.5986.019; Fri, 13 Jan 2023
 22:26:59 +0000
Message-ID: <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
Date: Fri, 13 Jan 2023 17:26:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Content-Language: en-US
To: "Chen, Xiaogang" <xiaogang.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
 <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 0adac1d4-9e6c-4a11-05ec-08daf5b5497b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sVdxT+Kh98Jg9X8I2t5ldfTwbioF4HbJz+ELtrBjh/vCH1xUwCscyRwVYjCuD5PidEN1+UQnO/XpxvX49LKq1KHkPmkbFDFrrHWDTxlpt58ZbD+UW3h1Nfd4y3QNXP2fWIcQcZkvKHRnpPX4TH+3qrAnief6rKUBTi5zhKidL0sbk7F0kD9eNWFyIGN4qkfTRxtaLhNLuF3gVrXJTWtpcMuk60tI5OOln7Fzkll2SChpDL/ieQbEdxoozjfg+fDs7A/ZAYoT3qx3zXYKCtAyQ1CabLK3kwmzMh/dVmSf5pv6vKTDQAlhxXfOUkpOdO/U+dNYsg0+AW+C3JWM9Tu/svInY6EcfVBQaEFQwVgiRZ2wf1+c4ZUsNtrpCiPhx1B3pf23bzeodamyCvoKWqKEu+7FT9/waKHu3A+lBhP+73aLGaFAv8TR70e9q4owqJN/h9BOmBkDTqHJ8zhHHMpjrj3AGI8XTteZMft0yYgrY7toKnC9L0NoLWx0Fqarj+84IhIO566/NDWS+7PU536QN3Kyio7lcxvsBVq022sqUuW6kcb6+Q82kRWwOXWPiVJaIU69cGRr01OuafyZRP9YHSIfegsIhARfyES6BMHIhhoU38jf4RyVxDE7yWxUrGl+vobTQczHIvfa0QlqtGiB1DksoqpHDEjp2zX21INdzr7OJHR9wnibj9LA1chY0wgBvda0VdbJ39ZDSOsYMeBSLO5DHD6u5DYb8dW3U9T3owE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199015)(36916002)(6512007)(31686004)(26005)(186003)(478600001)(53546011)(66946007)(316002)(66556008)(2616005)(6506007)(8676002)(450100002)(4326008)(6486002)(66476007)(38100700002)(8936002)(5660300002)(86362001)(41300700001)(83380400001)(44832011)(31696002)(36756003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RCcXR3RWs4UHNMb0NjL3ZkVGQxQkNpak9IM1pja2E4b0lmSUQ5WnMzWHAr?=
 =?utf-8?B?OGpWaVpnamJLS2E2aUg3TFZrbXN3RG5IUEtDQjNaM1dtWHY2d0x6U1hMK00r?=
 =?utf-8?B?N2F2aUhpbEIzNGdRdWcvMlQveDY0ZGJ5MGJESHJtN0N6ZXR1S0pHamRDWTdl?=
 =?utf-8?B?YzNhUGhUcXBYTDU3ZGRGZlZOTGhBL3R3a1YvTExLQmVMaE1rNFRLRzFPRjR6?=
 =?utf-8?B?YmxwSVhFUHZlaFlJblVzWjFNQ25Pak1ib3g3UDBYZXRWWWh6Vmhvd213WDlP?=
 =?utf-8?B?bHdVdlJxck1kcHJMVXZxS3RiMmJlYU5WWTJacnhSVVo1ZEVHa0lVWHUvTTE3?=
 =?utf-8?B?bHNNY0V6OWZtdDBXelBLeWtNMHZaYTI4Q1RnbTlseFhhUUZNM2E3bk5yZW5h?=
 =?utf-8?B?MytZV3l4ZDNGa1dTbHBKeDA5UDhUTDJwNGRSNkpLdjlaRFNaS2prS0ZjK0hT?=
 =?utf-8?B?a1JzczdvQ2pVd0dqamhMaG1wSmZFM2dzTG1KdkM5U2VzZXVKbENydjE4ZHhL?=
 =?utf-8?B?YWVmK1NueUVFZnhwUGtTdDB2QkhlYTU3TU5wU3h5QUsweXcvb1Bqcm1KMklr?=
 =?utf-8?B?RTZoaEhlczR4M2NzKzhGWElsZ0tFc1MvZ0dYdHh4RFlDc0NtK3hGYzlhUlFW?=
 =?utf-8?B?akhUZ08wVyt0NWpXRVRLOUFzaVR0UEpFdnllTElnYUtXejNVQWJneUN2Mk1z?=
 =?utf-8?B?VkV0OVNjckszZ2prd0xwTTRCWjl6dXRQcFNuNy9STDJ4QVpKK21pVENpSHU5?=
 =?utf-8?B?NFFMOWorNWt1eWp4NmZwYkswT1AydXV2dG9PODZFWmdUL01zOTI2WGlxMTVG?=
 =?utf-8?B?Y3ZiNHpFbkhmaWc5WDJMTUZnQkgzclpUVzRGdThOUXY2YkM4RzZIN2ZJVE9y?=
 =?utf-8?B?Q0VxUVNRM3I2NHlFNHlKQytUb0l4UzZZZDdhODh4ajZVdGVmSm5qWGJnT2F6?=
 =?utf-8?B?aWpPcWJPQVpKYzRONTlIcytqM0V5TThMc3JOVU5TNlJUQmxDMjBNRC9xemo4?=
 =?utf-8?B?a3cxdFJaMnMwME5LMWVYVWRlc3VTdWRtYnpNdGk5blhScDlXbFo2LzZ3eVdh?=
 =?utf-8?B?Y2tWaC9uRTAyUnplZks0WTVtd1g5dWcxbW44ZE1MOHdFNjd2bFA5Tm53T05i?=
 =?utf-8?B?V0xyYjYvQTdlMjFQUFBKblM3bzRyMWg0UVV1VUNZWHVnY0xSZm1oOFFqQ09u?=
 =?utf-8?B?SkIrOG14OHRiSmQ0MkpRTHExK3Q2RjFIZGRid3JRT0hLQm5yaXRROTI3eTdo?=
 =?utf-8?B?Ym1TamdEb3NLU1lGVDA2NWQwbVN6Z2tiRHdnMis4bXpid3Qyczk4TDc3OGZj?=
 =?utf-8?B?cEpvaHJoTzJUVmRmTSt2VWI4eFVCL3k5WFZWWnVabzd2ZzZ2T3NnSVROQUU4?=
 =?utf-8?B?VjEzMG1veXRpWFpoRXV3a0g0RUYvRytaMzlTbmhwOHBHUjV0TjdaOUVCclZa?=
 =?utf-8?B?ZHFjRHdkc3lVKys3VXBwYmtPL0tMcktCTDFKVThqY2NsK0dERllRT1QxMXdv?=
 =?utf-8?B?ODBCbzRFNnQ2Vkg4bzFwL0JNWnV1UjdaOWJzUU1MR25UbWxOUDkzbkFrdHdI?=
 =?utf-8?B?ZWk3OEpUVVpWdjlQZkFXeVFpNFpMQVBFZXdzZjRFc2NIbDRuR3VyN1U1R1pK?=
 =?utf-8?B?ZXJTVlpQejBIZGc5bzV1TGRKRDhWcUJacm9WbXRYSUNUbG0vWFgwcUlsMS9t?=
 =?utf-8?B?akFFMmNlbGtwNnc4TzMxRE14Rk1FQmRsRXordFBnUEIvaUZTVUI0cVQ4Szlr?=
 =?utf-8?B?SmtucTZNVkZFRVlsekd2U2hzb0VvVEJ2V0VwL3pYVlFrWFhEZERVcmx0UDlr?=
 =?utf-8?B?ck5jWDdDRUZDWlRlWGg5NDN2aEw1UWh0YkVnN3ZHOWNOUll6aEVrcUd0QzRN?=
 =?utf-8?B?YlpOMlV2NWhuMUZlMU5CUEhXZlV6L1k3Y2ZaTEhxMk8yZDRFQzFXWkNiRFUx?=
 =?utf-8?B?VnlKakc2bTJPVnVEL0NTL0NqWWZ0emFtWVVEeGVxbnA2TFZJSVZJTGpJUGhu?=
 =?utf-8?B?ZWQvWVZwaWtiMXhjazArWmQ1SUlPTTViVjVtcy9wenNwWWN3TlFHY3YzSjQ1?=
 =?utf-8?B?byttK2FOQStOSW5EZVFlYjNKMU5iRVNBajBFbnJtTnFwdjA5a0lIZ1JOTi93?=
 =?utf-8?Q?Ar0a4MfLCXKtgdDzfOOyO1JFd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adac1d4-9e6c-4a11-05ec-08daf5b5497b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 22:26:59.8749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AFgr3KM32QqhmczB6ItTL3phsz9X89I/n0ZcIzlfeINmXRsA8LnKenLkqKCxA9EOKB7VdhmwIUX2amr9iN2NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277
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

On 2023-01-12 17:41, Chen, Xiaogang wrote:
>
> On 1/11/2023 7:31 PM, Felix Kuehling wrote:
>> Use proper amdgpu_gem_prime_import function to handle all kinds of
>> imports. Remember the dmabuf reference to enable proper multi-GPU
>> attachment to multiple VMs without erroneously re-exporting the
>> underlying BO multiple times.
>>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> ---
>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 ++++++++++---------
>>   1 file changed, 21 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index 6f236ded5f12..e13c3493b786 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -2209,30 +2209,27 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct 
>> amdgpu_device *adev,
>>       struct amdgpu_bo *bo;
>>       int ret;
>>   -    if (dma_buf->ops != &amdgpu_dmabuf_ops)
>> -        /* Can't handle non-graphics buffers */
>> -        return -EINVAL;
>> -
>> -    obj = dma_buf->priv;
>> -    if (drm_to_adev(obj->dev) != adev)
>> -        /* Can't handle buffers from other devices */
>> -        return -EINVAL;
>> +    obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
>> +    if (IS_ERR(obj))
>> +        return PTR_ERR(obj);
>>         bo = gem_to_amdgpu_bo(obj);
>>       if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
>> -                    AMDGPU_GEM_DOMAIN_GTT)))
>> +                    AMDGPU_GEM_DOMAIN_GTT))) {
>>           /* Only VRAM and GTT BOs are supported */
>> -        return -EINVAL;
>> +        ret = -EINVAL;
>> +        goto err_put_obj;
>> +    }
>>         *mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
>> -    if (!*mem)
>> -        return -ENOMEM;
>> +    if (!*mem) {
>> +        ret = -ENOMEM;
>> +        goto err_put_obj;
>> +    }
>>         ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
>> -    if (ret) {
>> -        kfree(*mem);
>> -        return ret;
>> -    }
>> +    if (ret)
>> +        goto err_free_mem;
>>         if (size)
>>           *size = amdgpu_bo_size(bo);
>
> Hi Felix:
>
> I have a question when using amdgpu_gem_prime_import. It will allow 
> importing a dmabuf to different gpus, then can we still call 
> amdgpu_bo_mmap_offset on the generated bo if 
> amdgpu_amdkfd_gpuvm_import_dmabuf also ask mmap_offset?

The mmap  offset comes from drm_vma_node_offset_addr. The DRM VMA 
address is allocated when ttm_bo_init_reserved calls drm_vma_offset_add, 
so there should be no problem querying the mmap_offset. Whether mmapping 
of an imported BO is actually supported is a different question. As far 
as I can see, it should be possible. That said, currently ROCm 
(libhsakmt) uses only original BOs for CPU mappings, not imported BOs.

Regards,
   Felix


>
>> @@ -2249,7 +2246,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct 
>> amdgpu_device *adev,
>>           | KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
>>           | KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
>>   -    drm_gem_object_get(&bo->tbo.base);
>> +    get_dma_buf(dma_buf);
>> +    (*mem)->dmabuf = dma_buf;
>>       (*mem)->bo = bo;
>>       (*mem)->va = va;
>>       (*mem)->domain = (bo->preferred_domains & 
>> AMDGPU_GEM_DOMAIN_VRAM) ?
>> @@ -2261,6 +2259,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct 
>> amdgpu_device *adev,
>>       (*mem)->is_imported = true;
>>         return 0;
>> +
>> +err_free_mem:
>> +    kfree(*mem);
>> +err_put_obj:
>> +    drm_gem_object_put(obj);
>> +    return ret;
>>   }
>>     /* Evict a userptr BO by stopping the queues if necessary
