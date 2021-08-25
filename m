Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480DD3F79E9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 18:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867AB6E3B2;
	Wed, 25 Aug 2021 16:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01586E3B2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:09:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxrAM3q72nHcBZpojRpZRnh0pY2dowgM+VbIKrGVyPo5TicB8NO8xHdViLi37jDVKAW2FrCX8hg/PR+yyEVfCmctg5vv00mOLvJgDjguGi0L2GFw4z6m1v4IxZTOdEavv5k/Lhm+dMsVuuJiVF4Fi+99nFeAGnSutW5c59ypJC1SyqOx5bcfjD5C26+JBs+sViE9FnvEA/43tvIRTWbisWdyPlMKkYv/wNoq1wzuovLRvFisDJlENeZT/4/DD+w3OUMlHaxrEUpBgInbKwM88y36w8elDjRWzrTqut3Hsj0l4fUX8ZrjSkpHWL8q2y6+LJDJcPkpR5EROmj+IVIM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9uKNhVcaqbxvNhchQEqh2rIWksRD0tBrbOcke98yvo=;
 b=YyvaKIuWdcVUVekcWHyDNK9I/HBnYkxNIowx0Ns/jMwU8BOT5zNuwaWkxPlUpkJ3viRaOpj6NS6XDJyLLD24K/DjdWyCUDrR3jnbhIijUS2CtfWOmMjzmfk7hcVFIhmPzsoJvIDVKBWXSyomb8fuK/WIUtbmCaO0TKNkERbM6z/WXL5/mzxr2ZtOXBroB/fQUbYfM3e4d0R6J0ERPzYvvLgJSr3kgYy+Yay1thnWCMkAy70BwYxnLrSHLgDkE41Ai2XZVRoQthX4Oq/T2cIOqx7sQ7QdAM9nB1XlCjJfj3fm6O9P8dwpI2cogjSgWrOXhj9G3u8eMpRmexqBwjH9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9uKNhVcaqbxvNhchQEqh2rIWksRD0tBrbOcke98yvo=;
 b=JOv5daiLPP7bQ76bw+MG03qFMWiF3tCzoVpskGpnM6Cr52cjm83zTqbO+MLAT1D1J8WuNDcSC8areFLbU8KP1uOuqZGpQERty/IyFNwhm9xavcIu6nKReAYnVzJCe0orR3P9MekICqfBWdlsAzFgtCs5a018nLbJIZUj4W1q9Uk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 15:36:25 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 15:36:25 +0000
Subject: Re: [PATCH 3/4] drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
 <20210824210120.49812-4-andrey.grodzovsky@amd.com>
 <d4e6682e-2d2f-f271-6041-6bcb145c1fc9@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <a4f70dd8-5f07-5279-7f7a-723fb3b8b944@amd.com>
Date: Wed, 25 Aug 2021 11:36:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d4e6682e-2d2f-f271-6041-6bcb145c1fc9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::36) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d73f:dbf6:dbb5:c86d]
 (2607:fea8:3edf:49b0:d73f:dbf6:dbb5:c86d) by
 YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 15:36:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4da654a-7d36-4abe-5909-08d967de1920
X-MS-TrafficTypeDiagnostic: SA0PR12MB4493:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4493B52DF1E31AF01CD18393EAC69@SA0PR12MB4493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6hZultGlTW/VQgS7lCyRD1uBl7HiL0mlrO0rauHcOtwbrHM01OOGA/ST5oQdPdLeXtcryYmIP5u+p1889k5qQvs7V2J4i/+ruALGa3ejrUNuxLmkVXM4CFsDCQ2C39utXMng7Vhbuz70CKm9a3DQX/cj6puY7/0hSI0qhvuaFAUqfGEGTc1C0aXFDlNKvcO2xw9a/NZjKLHsBojvWOWN+59LpegwsTCxSH7uDiLXO2FHotlz/bxCi+paWshQRuFGwYqXOHQWn7uThwYhvbORPNKE1eGhSTGg0TASyE8u2MQ+2y17ILET0rzHRtFzCKbl/Ye7BhBfsg09zy+l9d0nBP0vTpXnJlkDZ6G0TuNkExdMLcUcAkIHLuPiJaQ4YdNKgEKzNfQ+8HgxDMe647ik/J0I4mSXNJDn/r5B+AK3uCJ6NbFuDRWZxBpV6lrbaDqGqvFRK0rOfvCo2tvY6AiQGQjzQAzd7nITDd+biiFw9DZxIjrniJ2aGwZ5GmnNYKWMzYAifgk4JjApQbBfRqoM96mODv2dFDnn4oYjJ4EVrv5RL7E/izZ8asJRPvXUDKLuqc0d0Pw3B88a9MSaxylD5BC5vqYKXN7qyCHM05Re0MjQOkn8K2I8iG66AY3Gmd4V5CaQKNtQ/gbUYL5jucTO7dC6/JR51x9MIb08iy4Sya7kA/2x3zl903cM7go6qikINu5f3NixApIT54sqH8kpWSlDkGHBYM1tk9J3xcarjJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66946007)(83380400001)(44832011)(31686004)(66574015)(316002)(2906002)(2616005)(66556008)(186003)(508600001)(31696002)(8676002)(6486002)(8936002)(36756003)(38100700002)(5660300002)(53546011)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFppMjRiV1hIMWp3TU5MQk9JR2phOTBlU3ZOSlhicEY4MnU5SG1ScStIS3Rr?=
 =?utf-8?B?V1RFaEhTQ2hWWmthMnZIMWlCRnZFYVVMdzlxSWU3dzI5dVZlMUp2dVVZT0h3?=
 =?utf-8?B?SlBncWpMQ1BUdnE2UTNTOWpNUWtzU1NQK1NuT3ExZzNqUjM3b2phNnhNWCt1?=
 =?utf-8?B?eXBIdlY3clFITllmNE1oRFdmS1h1NGpvUThzWXZkMTloMk5mdUw5cU1mempH?=
 =?utf-8?B?ODBLSTNJNStKMFd6b3lRWnhYZVU5YXJCN2ZDRWt5RTFEd1dybXZFTm1RNk5U?=
 =?utf-8?B?ZFVDL3N0VktRVnVjdlFNYk8wRThSa1l1TXF4c3lJcnNzSE5HVXFPc0ZLZXJh?=
 =?utf-8?B?cllING96SitHejhrbkpIakJOZVU5SGsxQWlMK01QdUlnQmFXSDN6SXM4OFN2?=
 =?utf-8?B?SXhqOFo2SkxTdEdsaXFpb0tVUE1BUVAwcmVxTDFUUXRaR3g3OU5KN0N3empX?=
 =?utf-8?B?aEtselAxNXZGNG9abzZsUWo1TXhGUzF1MW5NZy9RVjE1U0srRTZRREwwZDQy?=
 =?utf-8?B?OUwzeEpvaU55VVhsTUQ1Ykp5V29lK1UyK05QQjZkdm5TZGdEWFdpWk1kelFw?=
 =?utf-8?B?RHYxZnNGYW1wbGo5T3RuZTBoejQwU1Y4eDJ0dW1MVUFnL2c2MFltZ1U1ZlI0?=
 =?utf-8?B?NGdyTjdFR3J2dHpRN3E1NzMvTFB5d2ovb25QVFdDa3NNcElUenVOcmpCWXJu?=
 =?utf-8?B?Q2xlaVFyNEd4L3VwOE0xZ1QyVmlLMXcwVWdlbitUZFpPSHhMWll3aXV5OHVS?=
 =?utf-8?B?S2JKNmt4V2FrSXEyd1ZLYTc2SW1rNnROWks3R3pNTEEyQmtQVTZkd1phcTVk?=
 =?utf-8?B?NHIwQU9nMmtMNHlYYmFIY2NLcFh6d1R3WnRIZ3o3cVJ0c0hGWkpYeU1UWFRp?=
 =?utf-8?B?NjJ0bHkwZ0pkTUFjV2ZXS2JOM2JHQjFYMWdqWDdFMXF1Q2dPWHZzK3Bkc3Zp?=
 =?utf-8?B?S1dwL1VwZzBmSlg0Vi9mUGJ2SHNaQkxOMzhmcUlBQ3I2OGJwTXBSUitHWTJ0?=
 =?utf-8?B?Vks0ZzV4bys4SEYxNTI4SEhYMTRrRGd5T1o5Q1ArTzQ1Z0I1UUpCR1c5TDhx?=
 =?utf-8?B?RjcvM3EybDlZUlVOeDN1UXRYT0JtUE9YSzVOVjVTM1BCSk5Mc1kwU1hHQW51?=
 =?utf-8?B?SXBhY0lGbllvUHBKUlF5N0psVzloaXRZd3c1dFUvV3QvMk92WWZqQjlqcjJt?=
 =?utf-8?B?MjFwSTNBWjRZaTNaUkREYVUrT0NtOXllL01ZN2hMRUFoVDhvMFZTYnovOHV3?=
 =?utf-8?B?MXhtaHFjeDlNWXBBWUVvdHpZS0dyK2U4cjZwWmdrM2VlWnhkM2dObVkrRGNU?=
 =?utf-8?B?UkNhb1drZExMQm9nUHJEVW9DNkx3QjJXdnNPc21KMWJUR3VwK2V0M0d0eW9M?=
 =?utf-8?B?YWN2WGdYUE5PeEw1VDBZOU1vUlJma0Z3a2NpMXJqOXdibGQ5UUFSNiszOWpP?=
 =?utf-8?B?U3pCQnBBZWt2aktid3VaTytLczZXeG1oSnkrUEdqVVo5MVUwcVRncndjb2Fv?=
 =?utf-8?B?VVRVaVpqUkQ0Nm1mbWhMcVRTbm9lb1Y2QWtnK1pBZTgzUGRpM3FXbVF6ZFVB?=
 =?utf-8?B?UkhDNzZVQzNhRU5mK0ZaNXFiMnpmV01VM1BUaGZ6Z0FOYy9zZWRBRG1jdXdv?=
 =?utf-8?B?MmhRU2hvcFpOS2habjQ0YXMxR2ZVdlBZSFpCM0ZpdXRtOTJzQUoyNGRubWRF?=
 =?utf-8?B?MmlrQklQaHhKWmMrUi92QlYzMmVxUEp5MVc3ZHVGSTBWY2ZwTWtlZ2hFQmVS?=
 =?utf-8?B?SWFta3dTSytoWThxTVBtVm9GTmFoMFA1UlNmT3NFcFFYclMvQlRaZ1dYS2Y2?=
 =?utf-8?B?RVE4M0dTeWhBZ2ZPZzBOUzFNeFJyVlZLaGE5akRuM0JhSXFrekxvN1A5RE1z?=
 =?utf-8?Q?/1Ll4Kq8KbbnO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4da654a-7d36-4abe-5909-08d967de1920
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:36:25.2696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGFIxe/AT3jXdHXWBZzk5JFPMtYBH5PabgjDs8YjIyGt3qzQEdTcVCN3J7iSHbga783G2DFtUHTwk1b53fo8uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493
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


On 2021-08-25 2:43 a.m., Christian König wrote:
>
>
> Am 24.08.21 um 23:01 schrieb Andrey Grodzovsky:
>> Handle all DMA IOMMU group related dependencies before the
>> group is removed and we try to access it after free.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 50 ++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
>>   3 files changed, 53 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 0b5764aa98a4..288a465b8101 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3860,6 +3860,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device 
>> *adev)
>>         amdgpu_device_ip_fini_early(adev);
>>   +    amdgpu_ttm_clear_dma_mappings(adev);
>> +
>>       amdgpu_gart_dummy_page_fini(adev);
>>         amdgpu_device_unmap_mmio(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 446943e32e3e..f73d807db3b0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -64,6 +64,7 @@
>>   static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>>                      struct ttm_tt *ttm,
>>                      struct ttm_resource *bo_mem);
>> +
>>   static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>>                         struct ttm_tt *ttm);
>>   @@ -2293,6 +2294,55 @@ static ssize_t amdgpu_iomem_write(struct 
>> file *f, const char __user *buf,
>>       return result;
>>   }
>>   +void amdgpu_ttm_clear_dma_mappings(struct amdgpu_device *adev)
>
> I strongly think that this function should be part of TTM. Something 
> like ttm_device_force_unpopulate.


Yes, this something I also wanted but see bellow


>
>> +{
>> +    struct ttm_device *bdev = &adev->mman.bdev;
>> +    struct ttm_resource_manager *man;
>> +    struct ttm_buffer_object *bo;
>> +    unsigned int i, j;
>> +
>> +    spin_lock(&bdev->lru_lock);
>> +    for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>> +        man = ttm_manager_type(bdev, i);
>> +        if (!man || !man->use_tt)
>> +            continue;
>> +
>> +        while (!list_empty(&man->pinned)) {
>> +            bo = list_first_entry(&man->pinned, struct 
>> ttm_buffer_object, lru);
>> +            /* Take ref against racing releases once lru_lock is 
>> unlocked */
>> +            ttm_bo_get(bo);
>> +            list_del_init(&bo->lru);
>> +            spin_unlock(&bdev->lru_lock);
>> +
>> +            if (bo->ttm) {
>> +                amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);


amdgpu_ttm_backend_unbind is needed to be called separately from 
ttm_tt_unpopulate to take care of code
flows that do dma mapping though the gart bind and not through 
ttm_tt_populate, Since it's inside amdgpu
i had to place the entire function in amdgpu. Any suggestions ?

Andrey


>> + ttm_tt_destroy_common(bo->bdev, bo->ttm);
>
> Then you can also cleanly use ttm_tt_unpopulate here, cause this will 
> result in incorrect statistics inside TTM atm.
>
> Regards,
> Christian.
>
>> +            }
>> +
>> +            ttm_bo_put(bo);
>> +            spin_lock(&bdev->lru_lock);
>> +        }
>> +
>> +        for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>> +            while (!list_empty(&man->lru[j])) {
>> +                bo = list_first_entry(&man->lru[j], struct 
>> ttm_buffer_object, lru);
>> +                ttm_bo_get(bo);
>> +                list_del_init(&bo->lru);
>> +                spin_unlock(&bdev->lru_lock);
>> +
>> +                if (bo->ttm) {
>> +                    amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
>> +                    ttm_tt_destroy_common(bo->bdev, bo->ttm);
>> +                }
>> +                ttm_bo_put(bo);
>> +                spin_lock(&bdev->lru_lock);
>> +            }
>> +        }
>> +    }
>> +    spin_unlock(&bdev->lru_lock);
>> +
>> +}
>> +
>>   static const struct file_operations amdgpu_ttm_iomem_fops = {
>>       .owner = THIS_MODULE,
>>       .read = amdgpu_iomem_read,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index e69f3e8e06e5..02c8eac48a64 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -190,6 +190,7 @@ bool amdgpu_ttm_tt_is_readonly(struct ttm_tt *ttm);
>>   uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct 
>> ttm_resource *mem);
>>   uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct 
>> ttm_tt *ttm,
>>                    struct ttm_resource *mem);
>> +void amdgpu_ttm_clear_dma_mappings(struct amdgpu_device *adev);
>>     void amdgpu_ttm_debugfs_init(struct amdgpu_device *adev);
>
