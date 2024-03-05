Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D36871D28
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C3910E462;
	Tue,  5 Mar 2024 11:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iEqDksJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE1310E132;
 Tue,  5 Mar 2024 11:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKwl+vMB/8mUQ1SUs3YhIoWUWP5NVuk0tyXfWUDSxXyYEJqfS+PVSTM3+SsZluP/wmylf5kmcfyGXS1WPtOXGRZJ+gjRv1XcNoAmf8O8sv2F1NJnAO3zNMXq+SI1ZboLEiHMn/ILFnuc8KUiYcMeo0+7fXSon96L67ZNgd5lC8SrUqNudXXo7KZKELXAotJC0frHfh1VH+9MRR949NQ9oftNpuK+sPQvQ32e3BmLIUTli4MhWR3IlngfCvT76rDfFQiN5QjqrXB2NRaasTlIqIZ8SSvikKh21Hpihl4MxvpCz6SAVkTyosA0ml9hSdEl4H0pTTBDeXizmhADD5JmuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWA61J0XsfD4Ndjdvay4D+a2LQsE2HbG87Iq7eL8pww=;
 b=YRflGTZrXfTDHlUaqWuremkohPM9NZZdbQhmh3HeVX/sQzlbOgxd+oDqH6Gni8hBcJEp/YU0zu14+w5ZOutpDRg8h2rVdBSiQapM9h/DibHHxYyVoG06ag+ZBhGpbQsetQysH2auD7sYmBCxTzTiRipfur+vG2MWau6MWMxznOHB0rm20NTeh/4umQp2dkztWsNeQIhIpgBNntrYfhod73PDH0IVcAk4K/3nsvKFPaGfGSo+WGEshnAl45q17dlhxvy248ov/wX68k7mKjUivP0YBho8uE8hUgDe7lYzcDnRr88Fw5WYIo0bUzGVIaEt/KiiLM87Bx6PKfiF4hYTcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWA61J0XsfD4Ndjdvay4D+a2LQsE2HbG87Iq7eL8pww=;
 b=iEqDksJ/ZU9V/ncy4weeAIoKiNIui5oKt55jfMz1li2CWH7+LxO7mj0FkwgCrOlYxdms23cIYD1l/TKoii630LaGvFVrpTHSXEdd/CQf03FDqW2rmopNrPHOzHHOCnxGOtpJUZFDzvZbhls8v8PB79whKgP61RKtCBZxG/0Sqps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 11:14:23 +0000
Received: from DM6PR12MB4338.namprd12.prod.outlook.com
 ([fe80::66b0:e265:696f:ad0e]) by DM6PR12MB4338.namprd12.prod.outlook.com
 ([fe80::66b0:e265:696f:ad0e%2]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 11:14:23 +0000
Message-ID: <f0fae5dd-533b-4649-b338-935f4518036c@amd.com>
Date: Tue, 5 Mar 2024 16:44:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] drm/buddy: Add user for defragmentation
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, felix.kuehling@amd.com, mario.limonciello@amd.com
References: <20240304163220.3093-1-Arunpravin.PaneerSelvam@amd.com>
 <20240304163220.3093-3-Arunpravin.PaneerSelvam@amd.com>
 <77148946-83ef-4576-a26b-ec84f9a4c63a@gmail.com>
 <aaf76e24-787d-4ca7-b3af-3636d065c1f6@amd.com>
In-Reply-To: <aaf76e24-787d-4ca7-b3af-3636d065c1f6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::11) To DM6PR12MB4338.namprd12.prod.outlook.com
 (2603:10b6:5:2a2::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4338:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: f417b681-03a7-411c-9706-08dc3d056937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ThndbSeHXGYdamloG5DdstHrA+cIP2TJWcJ7yRUgu872cdz1wMAey/wh/KQGSNBcD7zhKb8YrRzPBipahBLhK8KfPHVnoIuvBw84h/U2fTcp6891ZQtiLqhjCVoODsm4fXsWjTHj0S/EBAAJm98+6WY3I/TfKGDd6Ixf2CkKclK5xyKBVYllwUVv/HB20z9rhLrOqXC4AD+kdVImYm/dyXH5FEdER40J9Shi1OWCJiHAx27JInCG05aOGQhq5dY7dOz77XHOXYzgwTkVSabqnzCnVqokh2PcmylwtQxqqBwMnV9JopLSRWka2p+WtC29e4DeEgcPQQX6hw9na/E6ve69YdzQIthI+AwZURRC2wQ9rsIMMtDocdTq/k9/8KCxVTGYBuzZlCjP/t8Q1cJZJwSuI+up1lH44bep2X3oRZdoUikpC2734CiK0UczZ2xJtvMbK8xnntkwZxypyIGOy3TyTTPrZmG6yleqzwVWqPejowkm7BM7T5JpwTmrQipSxN/4+/9k7ZSKz4B4K41vLwR+4AsB/x6INm9LCPo8faQOHC6W6XHAlhDGW7X1mdAXG2fiYIz6yn1CXKfuqxknYAI5rGwlyDi19NU6alzcUzg0lVet34+SZyauJYhFJbv/IFLdAi0lLS9bJRJFptYJMsrpFZxXfDU9mReU9nn26o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4338.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ci9RMVJ0NHlXSlNIckF6M3E0ejN5bDRWQkYwZ3ZpTHEycEQzcFQvWHdmREJj?=
 =?utf-8?B?Q2pqWVBaRFArZ3ZGVFNBTkt1WkdlYy9GVEg3Sk9qY2lsM1drWGx0cS9kMDFE?=
 =?utf-8?B?YXVCSk1wZC81c2dDbkVYSEs1M0Z2cVhRV0JEWHRhU1JlNlFTdC9vTlR4Y0My?=
 =?utf-8?B?KzlPK08rdHdvTmF5bjJraGg0TU1CTUFBNmxtaGs2MXRhSUtZM0lFUmRKeGxU?=
 =?utf-8?B?ZlVaZS84a1NabG9jaC9pT0NEM2x5T3lLcnFxZXV1bkY3WFMwQTdNVmVnSWt6?=
 =?utf-8?B?NWlCWFo5Tm95Z3pHWEllaVpDOFdXaTJTckt3bVBUQVlSUk05YksxYVF6aklG?=
 =?utf-8?B?M0RyaFVuS0hRbDQxQmh2SFQrWFozY01WVnhETTJzVldkQ1ZLaTJTTEJmOVRN?=
 =?utf-8?B?S29RdllzTHdRQTVlTy9tODU4eDBPdGloN1NkZVNXclpUS3VpZ0ZuaEFEeWx0?=
 =?utf-8?B?Z3BrTDFCT3RYZ2lkRUZubktzRWRTNlQwTGs0cytFK1pObEROZnJjbjdrdGlY?=
 =?utf-8?B?cmppK3Z6c1poMEQ5WmkvM1h1a1hUN21wN3lIT3YvNUN3VzAwbXdwYUNTVHlz?=
 =?utf-8?B?NW1VM0hKYmtBZmFoSnJ6cXJyR1NEUzFOamFDemVMWW5PNXhEZFFwK0JSRFVl?=
 =?utf-8?B?Z3hWdHo3YTEwRGcwVWFOVkdPQVNmVzJaZGZudC9HZHZWNmJjY1ZYaExiN1VG?=
 =?utf-8?B?QjAxOEg3WGhVZFhXTDNHMXZLR09FQUdSMjBlanZjVU5lSzZsWEkzRjRzMXFu?=
 =?utf-8?B?aTNVTEtxTkFwaFNKNkJUbHlhRzI2Z1g0ZVVFZTZNV3lSbEFhVlI1N2FISVp5?=
 =?utf-8?B?VERiVjl1T3hLa2FFVTdmSHlEeU9kUEgyQXo4M3RNeFV2UnEyUytpYVBqUnpa?=
 =?utf-8?B?VVpDS0R1WUpLNW56NUNwUTF2b081akp5djM1QmdvU0pLYTRyVUdJVlYwN2FK?=
 =?utf-8?B?bjhQeGw0VlBIY1FrdCswNkxMU0gxb09UMTVBa000OTVsaUJmcnhXcUh2anlF?=
 =?utf-8?B?UjZBNGMyUFFwTHkyVFp5bnAwSkNRbERRR2RrT3VzRlB2eWY4OFp2Sm5ONWFQ?=
 =?utf-8?B?R3dybkVuMC9hOW5WUlByZkJpci9vQ3JTd1lHVVk5WTFjTm1VUWIzeThjdnRl?=
 =?utf-8?B?bzhSWmMrN3hWN0VnR3NINUdCQnRHNFZqRTU2M1FCNXhpWThlcWxkVkljSGh3?=
 =?utf-8?B?anhmTjgzMFFsSytkVWtickE2cWtBMHZyZXY5YTJ5ZmlFY3VpYW5OV0ljeW5w?=
 =?utf-8?B?N2dnS1lsWVlUcGpJUmI4UWszSHF3MjAwVS9oWExXQlpnZ1M5WDVEZEU3UUxU?=
 =?utf-8?B?NHUyM3oyNTBKakIvWWFIVnpuR2hIb1RMaStXUHRCbThJcGlDUmVnTFlsMkNM?=
 =?utf-8?B?VjdENVVHZ1NhL2NWRjZNS1B0a2RlMUVNcmNtNmEvazdCOXhEWk9UUURrYnpo?=
 =?utf-8?B?YzZ5ODlESm5CbzZETWxFYzJUOTBvMDhOY0p1S3BoQ0p1aXgyTTFwbkpnMm83?=
 =?utf-8?B?aisybmdVakU3dUFkVWtsOFhtS3l5UE1HMkRaV2IxNVRyU3YzOUNHTU81Vms0?=
 =?utf-8?B?VkhONk9JTllmOGVhcTZxOHFRTFZWZ1NwdDU5NGZZWUZEb3Q4MmFYWVlCOVpw?=
 =?utf-8?B?cGZkYUtiTUFRdFk3bGZWbE1YL0tXZkIzaU1ubVVZaGF2N1VTU1ZOWWZqZlZH?=
 =?utf-8?B?R25jMFVOd1FCUmNhUGNKZC9rcGFBY0xBOTZ5bTNCaVNKa3Z3WXNhdWplT2Vu?=
 =?utf-8?B?MXBTK1BzWGZDNllhVUZxMTk1UHJtQTlScllnUVcxdW1HT0JocDlsZkdqTjBs?=
 =?utf-8?B?T0ZhZFJqYkZkOFI2L01pRUVHMWVVdysyMnN3ZFYrbjlrVFNOekduQ1Ezd2lY?=
 =?utf-8?B?aUkxbkFDeWZnbCt0SS82UkU5WTBSdlg2RVpDRGlpclRBM1diOWYrbTJ1d28y?=
 =?utf-8?B?QTdHTkNBdUFpc1Q2UkFuTGRxQ2lHbU41dEw5YkdCMzQxd08xamd1aGRaakZs?=
 =?utf-8?B?QXZ6dU50dnMrWWZSNC9rQXlWOGZsSHJGeDRlZjA5SVc0dGVUMC9rSzV0UzB5?=
 =?utf-8?B?bDBWaytmenZTSnVlNkQyMmRtdGFpR0NQdWVmQSsxUWl2WUdwY3c3bkY1WFFH?=
 =?utf-8?Q?6hw7D/3aqZ47Rs9SeUwHiErXf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f417b681-03a7-411c-9706-08dc3d056937
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4338.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 11:14:23.2801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBrfP2fPY9CFS5jtfZzWDS/L3hNTx/O1KKWQ5Jxq8NF1YURAHSHUDUt8SgRiQBRXteuddkARkgtsJeMvNHAdbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175
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



On 3/5/2024 4:33 PM, Paneer Selvam, Arunpravin wrote:
> Hi Christian,
>
> On 3/4/2024 10:09 PM, Christian König wrote:
>> Am 04.03.24 um 17:32 schrieb Arunpravin Paneer Selvam:
>>> Add amdgpu driver as user for the drm buddy
>>> defragmentation.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++++++++++++++--
>>>   drivers/gpu/drm/drm_buddy.c                  |  1 +
>>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> index e494f5bf136a..cff8a526c622 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> @@ -533,8 +533,21 @@ static int amdgpu_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>                          min_block_size,
>>>                          &vres->blocks,
>>>                          vres->flags);
>>> -        if (unlikely(r))
>>> -            goto error_free_blocks;
>>> +        if (unlikely(r)) {
>>> +            if (r == -ENOSPC) {
>>> +                drm_buddy_defrag(mm, min_block_size);
>>> +                r = drm_buddy_alloc_blocks(mm, fpfn,
>>> +                               lpfn,
>>> +                               size,
>>> +                               min_block_size,
>>> +                               &vres->blocks,
>>> +                               vres->flags);
>>
>> That doesn't looks like something we should do.
>>
>> We might fallback when contiguous memory is requested, but certainly 
>> not on normal allocation failure.
> yes, defrag here not useful for normal allocations. But worried about 
> the bigger min_block_size normal allocations.
> In such cases, I think we should move this drm_buddy_defrag() call 
> into buddy allocator file. For example if the required
> size is 1024KiB and if min_block_size is 256KiB, the allocator first 
> tries to find the 1024KiB block, when there is no single 1024KiB block,
> the allocator goes one level below in freelist and tries to search for 
> two 512KiB blocks and goes on. At one point of time if we have less 
> space,
> we might go further levels below to search four 256KiB blocks to 
> satisfy the request.
>
> Assuming if the allocator cannot find the first 256KiB block, that 
> time I think we might need to merge the two 128KiB blocks
> through defragmentation function. And again for the second 256KiB 
> block, we might need to call the defragmentation again to
> merge two 128KiB blocks or four 64KiB blocks to form minimum alignment 
> size of 256KiB. This goes on for the third and fourth
> 256KiB blocks to complete the required size allocation of 1024KiB. 
> Please let me know if my understanding is not correct.

As you have suggested we can also rename this as force merge or some 
other names.

Thanks,
Arun.
>
> Thanks,
> Arun.
>>
>> Regards,
>> Christian.
>>
>>> +                if (unlikely(r))
>>> +                    goto error_free_blocks;
>>> +            } else {
>>> +                goto error_free_blocks;
>>> +            }
>>> +        }
>>>             if (size > remaining_size)
>>>               remaining_size = 0;
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 40131ed9b0cd..19440f8caec0 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -396,6 +396,7 @@ void drm_buddy_defrag(struct drm_buddy *mm,
>>>           }
>>>       }
>>>   }
>>> +EXPORT_SYMBOL(drm_buddy_defrag);
>>>     /**
>>>    * drm_buddy_free_block - free a block
>>
>

