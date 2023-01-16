Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EBA66D21B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F96910E2B8;
	Mon, 16 Jan 2023 22:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2070.outbound.protection.outlook.com [40.107.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343FD10E167;
 Mon, 16 Jan 2023 22:58:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlZMHuZ4fdjSmYhDe1F7bFrG/xMg9LE7/brb/dan5ij5dlrRR2LRRPoKh9iTnekyA8RKpGhNRtW/D7TfgyqFobeKsczm/zmZnpK8xiOvn2Sdnup4JEd3eZ1Q9/eMTPM++aLt5nJFNSAk/HkrteneasQmMU8mxfCmfzuusfENtVtwReo2GjdarbNWE/2CJ4X8GhJ/Kq1P4Tahqos46rTOgBLzt+9HArDr5jumktM5EjSMcWCRK8+Ebzim1ST+QjdJs7DgQva4MtLWKJv9atUNvHZ/bu3u8LLgQ85RxRG1W9Zr6G/zMcsEZnpxeAZQJsBHw5NCnQmd2QBO5rA/mzedZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEc8mhOqQ0UfUwZI55bwuYvYL1ieo90Vdy7XuHf1IO0=;
 b=IS1LZ9LF2dUIUWtEk0AEXJe4UT1077+SVY4T6yivmiUmYbB1rtf/S7oFJk09cMC2tKI+dBo9yvbSsv4EvW8zQhwsiw67xK91Yaa09shwFOm1Q0xnWDC6RoWk7O6wG9Oy1lplYmLe7kWWaRdPmAK0C4vNvZTQCO89GzCb+nCdHq+FQjoG5ptU9+vsjFgOUKsqD/2rNWdeDJT25opepQxCmpTVWvhSIO4WljEZlRg9Rkownu21Mrx2QMJM6EeHIZoMzyZYZqewS1tryQpXc7mMgiY6134IDxI0uYE85cYtB78jhgC/bqrkiRHxzgtMomaKMnjV+owN/R96+8b6k02eYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEc8mhOqQ0UfUwZI55bwuYvYL1ieo90Vdy7XuHf1IO0=;
 b=e6g4IITf1SkHNy3jwPCysy3wcT//a0IHEA6a1oYZu9OayYkNWlzWOfm+hm+MXeZyfQJGpzmd0xUYE0hTQCwJEYh5vj2T3GjccWzrvMDl0orGVkgxQ2EkvoN9GLBCAlEFd+1O6YDwJIH8Fvt8twjLPU5KnOo/kvJba0tW1XLx43U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4933.namprd12.prod.outlook.com (2603:10b6:a03:1d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 22:58:44 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411%4]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 22:58:44 +0000
Message-ID: <da349988-8484-fcc7-87fc-4c5fec1bfd74@amd.com>
Date: Mon, 16 Jan 2023 17:58:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/6] drm/amdgpu: Do bo_va ref counting for KFD BOs
Content-Language: en-US
To: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 "Chen, Xiaogang" <Xiaogang.Chen@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-7-Felix.Kuehling@amd.com>
 <513453ef-4632-9990-e5a6-bb97fffc4c11@amd.com>
 <SN1PR12MB2575D97162C4BF95DF76CB46E3C19@SN1PR12MB2575.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <SN1PR12MB2575D97162C4BF95DF76CB46E3C19@SN1PR12MB2575.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::16) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BY5PR12MB4933:EE_
X-MS-Office365-Filtering-Correlation-Id: a405dc8f-9de0-4134-9812-08daf81537fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +3xq2sb4ibR/lpzIB3WTeql0XNa52zm9FHGEaCjlSgSMwcoiBWdKzCRYvqlpw65OOMxpjoDXk8Q+3jN2MKaSqxYZka9aqR7cZjgR0KVnVe1cWRnTL6GFsm8Z6jotLtmqMsmravUFcC5N4HxcXMos0vOC4Hnop2qrqTmdPU3pLcTPXQhVw9jCLWWKmKYmqof6iFS0Jw7zqjWgOF5EQeMOU798n+65XzBnXZ/N2XCtuofmWNuQALvnu/iHjIKj2j4N8U6mU+QyyxwA6iOYuG/cjrBsOJeEqsOMeIeTSkweGyp4iT17UonHXCGoJ+WSeFQPIS+OquOEklVJKs0M8qux8PKPXevpvmJb9GiUEKyFbiMWr08NkGzHWO6xuJ8ZUJjmE6XEEI8++CCw5+SMy4LD5TooUOhnrgezGP9ndfbUHo14eOR1qqmrY6LDEwpszOIzJE2LMSqvxI8+vaoB2cvUqjcG9vsmH+9H+To852LbY3O/zAMt5bXbsrnCgRfvUXHi0UZfbeqeObz2CtK6HnBOUbJlqx19GWB8uvhsIEYtU2roqQvu4yXF1KOCT9dxOHzKQE8QIDOTftX7myymypY4Na4nwqor4hEbVeEvv6yOgkZORA4i9jhhe3T07SKQirf+WDxxJ3TQK09a6+/qCWE8vdrhHoGjJ2ix6IecdMFrKQl+KALYBNRcU/tDIN0ZLVRpHC7v5XwnAkDNBLWBhv1fgB+YzloC/vhsCHiUYCEulF8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199015)(31686004)(36756003)(44832011)(66556008)(66476007)(4326008)(66946007)(8676002)(31696002)(8936002)(2906002)(5660300002)(38100700002)(83380400001)(86362001)(36916002)(478600001)(316002)(110136005)(6486002)(41300700001)(2616005)(53546011)(6512007)(450100002)(6506007)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWlVdzhqYmI1SWd4djhLdmhuZ1E5dDg2aG5ueWFIV3ZLS1JOdG15UEpGcjBs?=
 =?utf-8?B?aGU5TmNqZm93cjRPbjVXKzZyUlFOTDg5bVBMMDFpZlpqS1pnTng1cGxnODFI?=
 =?utf-8?B?QVY1UDIvMEhPazc1ZkxNTVNLMFRnYXZ6NHJWNDlMV2lwT05WLzJoT3hWMjk0?=
 =?utf-8?B?K1V6LzJvQ2pFMVlndDRSMzRDTndReElIVlgwR2VwL1o2K0d6akVkTXBSenlM?=
 =?utf-8?B?V0xsNXRxZkhpd2ppZkl1cjUxUytKeG5uS2ZBazVvc3pDVk1qckpPbS9CM0xZ?=
 =?utf-8?B?eXNhQzFUY3FmS2VsOFVPcG5oOGQ5NWhML0kwbHg2L2dIdHBqMFFrK3UxUlMr?=
 =?utf-8?B?QlkzbERVQWNDOG9abUdocFhtVTVqcVBpRkozdWtRUjkzUm9ZVWtLMGY4UTg5?=
 =?utf-8?B?TWp0ZmlsNktwQnQzelhMUDltS3o1STQxQWhvK09Dd3RUYnNRSU92SmRwbEtv?=
 =?utf-8?B?eVBuQU10djdoTWpuSnY5WllHOCt2THFmWlZLY0tFTEZzcXJ4WHk0ZFpFTUZP?=
 =?utf-8?B?cXpFVlBJRk85NUtmWkJCU3FldmRnMjJWUDdnaVkvbDRpbk1mUy9wL1dQNndL?=
 =?utf-8?B?TmFhNU42Nm9GbHFEZUhUUElNTWJVVjRVS0tYYUlkTTVCZURZaWQ5ZHlwT0JG?=
 =?utf-8?B?UDJzUDViWGMxRWhTWVV1dFZhdUVxUFRxSlR5azFWN2lCSnpqRHdmSjZUbTBN?=
 =?utf-8?B?ZUc3b2VGTnpkOFZtMXcvR0NKeXZMeFBGVWQ0UHJBR21qMnpkYVhqZzRVS2FX?=
 =?utf-8?B?RW9iQlBud2ZwM0szRCtVM1J3V3JGT282dkgwZHhHd09ZazBBWXk0VVd6b3hx?=
 =?utf-8?B?WUYycHBuN1BPMXRka29LT0VYUkNRdFpIaXJvOVdjckFmSHdLSUc3bXZGcXpv?=
 =?utf-8?B?NHA2amd3aitSaUFoY1hjb0MrenhYOVhIdVV3Rk56Q0hpVjdTUGk4YlRYUU1P?=
 =?utf-8?B?Sk9EdFg3MExqdldKQ3J4c2UxelBjbWVmN3JWK1FadHkvZkJPdXR1UDd2WitQ?=
 =?utf-8?B?V2w4WmVlVVhEaXFneHp6MC96d0lOc1dZbG12Y0pQL3dpTDlObFZQcGVURTd0?=
 =?utf-8?B?b2RNZTdIdk54MFEzQVhnWjh5WTUvbzI0eEpqZVEzeDBZY1M2OGlNYlZsck50?=
 =?utf-8?B?d2VaZDJwOWtMeUVNcllxeXN4SHdBVkIxRE1Sa2JIOGtkUUJTdjZhMXNjQ3Ex?=
 =?utf-8?B?V0xGYWxwQkc5WkJtY3ZROStsbHlBZVhFeE5kWTVYYVE5QTBhTG9ML1VHbnlT?=
 =?utf-8?B?bU92Sy9QMmcwd3Viek8vNHlQbWVnWlJUa0U3U2VyWTNyazlpOXFHLzVQYU5G?=
 =?utf-8?B?L3dWb0YyR1c3YVBjY0hFYW12Ync3aGd2bmhxSGVKOXEvVVZVZ0liSTFGVDJW?=
 =?utf-8?B?SjhmNTI3cjlTc2tLL1ZmR1NqVkgxUEszdVZnYjIrVzJnRVJTakRBbC9zMHRL?=
 =?utf-8?B?clhZS3FTMEUzRVhuSE9nSC9FSTRrOUx6ZWxuTVJJdXJnTW9VVzRibXdHUXc4?=
 =?utf-8?B?dmN0Vk9EbTdHN1NvY3RORWFXM1dTZjNqTWtiQzdLcnlnMVJhS2xBNkVoeFdH?=
 =?utf-8?B?d1pSeVpXNExFcjUzenpXRzIwcHVON2JmSUVaV1ZiZHA5clkwaHE5aElkbGlL?=
 =?utf-8?B?NmRMeGVTTTMwcWYzYUorL0hNcVZzdGZJZTJCbTZIdDNXVmw3bHdYdSs3b0Fx?=
 =?utf-8?B?VVN3Yy9JKzc1SERnRkJuZHliTWdVa2V1aGc1M2wwRzd1VDJjbzg4VTNwRXpH?=
 =?utf-8?B?NWc3eE1oOUwyTkFUYTQ5UXFjMlYrclBwMzZLbnVOUjhnb1FhTWZzK2ZSQjJB?=
 =?utf-8?B?WnJUbDZzM2txODhYaFduVFp0QkdFd0lrUGwyNW1sWHd6YnRTT3MrV3J2YmhI?=
 =?utf-8?B?Vk9lWGFZWkQ1VkJJRk5SL2xnc2FBS0NocjJ1V2ZQVzB5eW44UnQ5M05PMkVM?=
 =?utf-8?B?NmhtT0k0Qk9Tdy9YMFVTamtuSHB1cnE4R0ZYaXEwNTIrRHdtdjgxbjMzK2V5?=
 =?utf-8?B?WnpEaFp6dXVQTTQyZndRODU5UFRycGowMCtjNTA5c0RLRGpGTy9mRmhBaVFE?=
 =?utf-8?B?VmMrcCtDV3JYa1orTGdpdkw4S3MySHo1QlIrTWtsUkR2U3UzRy8zWktudTIv?=
 =?utf-8?Q?C6k3mufUTfNb287T8BrVG/rg1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a405dc8f-9de0-4134-9812-08daf81537fd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 22:58:44.4808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTudXxutf9q0kQbAL532FocfUNKQPu19LiIgdcHagcRp8O5v/iVWk6Oz2foZkzZCcDRuYt55Q9GdKK1gUk83kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4933
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-16 17:12, Errabolu, Ramesh wrote:
> [AMD Official Use Only - General]
>
> Comment inline.
>
> Regards,
> Ramesh
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Chen, Xiaogang
> Sent: Saturday, January 14, 2023 4:28 AM
> To: Kuehling, Felix <Felix.Kuehling@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Koenig, Christian <Christian.Koenig@amd.com>
> Subject: Re: [PATCH 6/6] drm/amdgpu: Do bo_va ref counting for KFD BOs
>
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Reviewed-by: Xiaogang Chen <Xiaoganng.Chen@amd.com>
>
> Regards
>
> Xiaogang
>
> On 1/11/2023 7:31 PM, Felix Kuehling wrote:
>> This is needed to correctly handle BOs imported into the GEM API,
>> which would otherwise get added twice to the same VM.
>>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> ---
>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 28 +++++++++++++++----
>>    1 file changed, 22 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index df08e84f01d7..8b5ba2e04a79 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -370,9 +370,17 @@ static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
>>                return ret;
>>
>>        ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
>> -     if (!ret)
>> -             dma_resv_add_fence(bo->tbo.base.resv, fence,
>> -                                DMA_RESV_USAGE_BOOKKEEP);
>> +     if (ret)
>> +             goto unreserve_out;
>> +
>> +     ret = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
> Ramesh: Could this stmt to reserve space for fence be applied in patch 4.

Done. Thanks for pointing this out.

Regards,
   Felix


>
>> +     if (ret)
>> +             goto unreserve_out;
>> +
>> +     dma_resv_add_fence(bo->tbo.base.resv, fence,
>> +                        DMA_RESV_USAGE_BOOKKEEP);
>> +
>> +unreserve_out:
>>        amdgpu_bo_unreserve(bo);
>>
>>        return ret;
>> @@ -785,6 +793,7 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
>>        uint64_t va = mem->va;
>>        struct kfd_mem_attachment *attachment[2] = {NULL, NULL};
>>        struct amdgpu_bo *bo[2] = {NULL, NULL};
>> +     struct amdgpu_bo_va *bo_va;
>>        bool same_hive = false;
>>        int i, ret;
>>
>> @@ -871,7 +880,12 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
>>                        pr_debug("Unable to reserve BO during memory attach");
>>                        goto unwind;
>>                }
>> -             attachment[i]->bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
>> +             bo_va = amdgpu_vm_bo_find(vm, bo[i]);
>> +             if (!bo_va)
>> +                     bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
>> +             else
>> +                     ++bo_va->ref_count;
>> +             attachment[i]->bo_va = bo_va;
>>                amdgpu_bo_unreserve(bo[i]);
>>                if (unlikely(!attachment[i]->bo_va)) {
>>                        ret = -ENOMEM;
>> @@ -895,7 +909,8 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
>>                        continue;
>>                if (attachment[i]->bo_va) {
>>                        amdgpu_bo_reserve(bo[i], true);
>> -                     amdgpu_vm_bo_del(adev, attachment[i]->bo_va);
>> +                     if (--attachment[i]->bo_va->ref_count == 0)
>> +                             amdgpu_vm_bo_del(adev,
>> + attachment[i]->bo_va);
>>                        amdgpu_bo_unreserve(bo[i]);
>>                        list_del(&attachment[i]->list);
>>                }
>> @@ -912,7 +927,8 @@ static void kfd_mem_detach(struct
>> kfd_mem_attachment *attachment)
>>
>>        pr_debug("\t remove VA 0x%llx in entry %p\n",
>>                        attachment->va, attachment);
>> -     amdgpu_vm_bo_del(attachment->adev, attachment->bo_va);
>> +     if (--attachment->bo_va->ref_count == 0)
>> +             amdgpu_vm_bo_del(attachment->adev, attachment->bo_va);
>>        drm_gem_object_put(&bo->tbo.base);
>>        list_del(&attachment->list);
>>        kfree(attachment);
