Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E42B47DCF81
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 15:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F21510E514;
	Tue, 31 Oct 2023 14:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A1D10E503;
 Tue, 31 Oct 2023 14:44:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC/ZrE5izMQyNzlyePuFQ1lcALk2q6TFLshnQF58XukePCpUHiVhd6RTqOCqFsTMZoESXstUlrxeiIWKeRTg4PmewWa+Sl9J6g7JnfYNK5B6fbf5D0ndh/zoP+5SAeb5OYp3K+WiIGjDsAOyOIiJxBtFPl9q6CyLDgSecm6agbPB88hLn1hR30HQ14s61FOkBqylEdc1qRLyOpHLoWBon8WaZxTQCg4svWc0nWCMvYNcPPv644BSNhQODUJt/2x5VbO+8M2tEiby6+0zkhDkWYdQDA70cN9g1lZRoGqxiVx8dBmHpc2xhN1Cc8t3q8jFWH9ugd/rO+it6kc4DIsI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLdz909Hx0PpvfnOxz9Bu1ggNb/ob0HKC65J5ITYSSk=;
 b=hamKIR8vl1xutjLtelA6TCeHCPxrs3jFMb/XoxUSBPOZ6ymmp6GbJAQArih0Ui8WV1X8x74PLcpMUfdakONKlIjGTrYI8Eg0Y4unVqvuedkIKM52srFTVCwdJvE/FEJkETIuwQgFG1EsdZcNPLbFv1k1KmqlKoeihrx0wAxwyO3jZyzN9Hv6j40NirWIEvrbE2LrYc9VzrTqDnK/b4cgUaavEJ1EcrU5tYlEML+bu+De9UZW5SRIllEsvx5lvrWExLPSmcf9QedAtwzY+lhzc3rfWufA29XTe8FZUYMaRzxSqjxiiWT+eqfZszaj2nj8pvmW/N5I6zydcaMAx+LDIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLdz909Hx0PpvfnOxz9Bu1ggNb/ob0HKC65J5ITYSSk=;
 b=TnUYe0Ws5OsyurF9S8AGO/UCyV1WVlFaMj40PxzYeC6VCcD7+LjZoxz+B40FkWpE6Yf04DdT6RUQUviL4Sk3vQv1fyToqkPFN5K4PuGS1ZjMZAY+1xmdo1RRr1Y7RNvhYHrY7Rw/JUydPXVTH4lO77kt0wFXVdDdRZD6eZvOR5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5705.namprd12.prod.outlook.com (2603:10b6:208:384::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Tue, 31 Oct
 2023 14:44:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 14:44:34 +0000
Message-ID: <716f6369-6ffb-46c2-9658-d68c200c571d@amd.com>
Date: Tue, 31 Oct 2023 15:44:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/amdgpu: Separate eviction from VM status.
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-3-ishitatsuyuki@gmail.com>
 <e2349c50-5d15-4e76-b63a-904abc4f6802@amd.com>
 <011E5998-09CB-4AE4-AEB8-1619BF005B64@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <011E5998-09CB-4AE4-AEB8-1619BF005B64@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0415.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a25fd7d-eddd-4062-b490-08dbda1fe64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3OvXj7XHGgL/RazwxSzd47WpsLg4tnCo5PslPbobFPs4NhvVFt1jyHkZWCSYb776yrHt8GGPWdlwtuTv1W7oFBDE9ie6Ze6DjD28HUe8rmCA8sOt/6v6kf3pIh/F9envuFKGAUNJhcB/sIOEddZ+bP3GHU/eSE1e0Sdn9eFSFpg/cJ/7pmn3CxIa1lcBodrc6XYcLiUEj/ToiIdfLssGL7JvFPcf6Ujf31tQalVN7+BmZNkID+yok05H+c4w9D83aOThen9f/VcfQdbSq850dmuIMlCWbyIS1SRq5iRfdKdEzhxF82PME0zHeKeR4JHiwyek+i/ZjDTtzNuKVrxRwBhEZpL64NjF3z6X4R366aTjr9cm+tZlvuCe6tsHX2xbh6/F+yTm/h0wgBishHFkWVqAVdJjVPXPXeBl1xhHei9FJlrIhrBDhKumhfl1F3STmWE/Hzj2Q7ybYUxm14WayNSyESYLRMX9MeDGrVG7TzpGbL2NPkvqbElQ5F9U+ztA3681Xxnz/0JUakPtVoJ3+3WEMuHmK9xiOUHjt/UDySIzj/QJA1F4XX98W+tgSRyTz2sB9AtVDs9ps6QAW+jMuDWcAleZyHUHhYUlszlum3ovlImAPHd3W+Jrydaa1JJJsR5WDw6a5IMwCMuCK44wkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2616005)(31686004)(26005)(6512007)(38100700002)(8676002)(5660300002)(4326008)(53546011)(36756003)(8936002)(66556008)(66946007)(66476007)(6506007)(41300700001)(2906002)(6916009)(316002)(6486002)(86362001)(478600001)(31696002)(66574015)(83380400001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THpxa1BmM2Z5UGZGS1lBR0dnenJkZDdCUHdGQnBJMmdaSmM2MlpLenl3ejdT?=
 =?utf-8?B?NnY4WkRtY3B4RWRCdWxoSWpIS2owNElpZEZGcmMrczc1cWNBRElKOW5nK2Iv?=
 =?utf-8?B?aVV3WEdHZXJzL1NzV3MxYlYxM25YTUtmMWs4ZGg4b3JjOGh0OStJaUh6NmZm?=
 =?utf-8?B?OWtNSHFaaENHbkhMOGJwZmowSVI5MnF0eUQrQnExM0o3dFBEWUlITVJFZE9R?=
 =?utf-8?B?eVB3WXZ6bXpTRm1iU0NEL0l3dmYyQ2pNY3ErQllqV0ZuVHdZTm9DTVNlQi81?=
 =?utf-8?B?LzZUL0V1bW42SC8vYXZ4ZmQzVzFnR3doenUrSlRUeElZcUI4ODRGSFUwUEZN?=
 =?utf-8?B?bVo5TGszckh2OFVyNmVaRHFVTzJSaXJpV29DdWY4T2srUU1qVSs1MkFManM2?=
 =?utf-8?B?bzVyN3RmQmJlMUV5NGU3N2J3VXN2R29qZnNvbWdQTHZmNHhWZ3J2YTd5SHJj?=
 =?utf-8?B?Y0gzNWN4OFg0TVBPSExuVUFLWC91Q2hzNG1QY2pwVDBneDhkUTlLVXp1Vmha?=
 =?utf-8?B?ZHhCQVhOVldsUldJQnM2SUh1MzVDVytsUXJLUm1BUko5OEdmdHd5SHlwODdC?=
 =?utf-8?B?WUR6VmV5cXZwcUp2dkxvVmc0Q2dYTUc4cDAzc0EwcGt0R0FGdEpBOEZ0aENE?=
 =?utf-8?B?UkRoc0RjcEx3cTZ1bzNpbGxTQmxSSTBUSVh1L2FZWlFZbEtTeEQwcGFRUnJN?=
 =?utf-8?B?U0VSQTh5WEZpb3FrVVl2WS9OcXBvNFlpN1g0TUg4RGpwV21pTFNiS0FhK2Z4?=
 =?utf-8?B?aTlWdVJOcVRaZDhZajhDQ2ZNenBGMG1sYkRRb09BRWEzcWhXeGF1ZTM1L3pH?=
 =?utf-8?B?NWVTN3ZiZHJPcHVKSzlUaFg3bzRHMC9aazRHNldXSUNXR3JJWUtPN25iakhL?=
 =?utf-8?B?YTEzNWNHdXg5UTRSVzJ5MHR1VVJ4UzNmS1RRVEdlRE0vV2p5M2FPVURQWWZ1?=
 =?utf-8?B?UzdONFVuVWZjUnhodU9nRXhQSDFtUUhCWTJwTGN4SE1zV0M5S29LUy91cTdR?=
 =?utf-8?B?c3ZwTGFNNGVlaGNZNEVEUEI3VUNZQ3RxRlcxQXN2dlFqemRHdGFUdlhvbk1z?=
 =?utf-8?B?QXBnVHBhcHB1WUtlWW5zdzY4UnpzaFF1OXZHMWMrOWNsUlBNeTRYT3psMUxQ?=
 =?utf-8?B?cC9qQngzdE9vakVtQzJyVGk5TDEzek56ZW5MTVBZSTRIU2xoM1NiVjVYeHgx?=
 =?utf-8?B?RS9JOVo5VUJzWGM1R1dZQWkyRWdYNzBEZ3JtNjBKc0U0NVNONWVkUXE5c0VO?=
 =?utf-8?B?YTBxTmRGd0dYRmthcGN0VjBuZitPUjZuTWpSdG1Pc21CWHZCaHRxaGFlazhU?=
 =?utf-8?B?SW9wM2hBNWVMRytKQXlFUTVOSHR6azg0UW9XcStrRVoyeUR1UTR1Z0xiVGRX?=
 =?utf-8?B?ZFdxV1NlUWpwOUs0TXFWTmNxdXBsRlczWDYwMjFyUVJWa2NaUDNWMVlyL1or?=
 =?utf-8?B?Mm5MaERlOVA3WXVOSERtVUZoSDVFTW9TT253NGZKTWdEbDVMeGJHK2RmMDhX?=
 =?utf-8?B?VjJYaGhOY1dENTRCR01kSHFFa2pkSkQ1cDVrL3FYTVhNaWRFZnBtek5tWUVU?=
 =?utf-8?B?NnJqbHRHUWt3OGJmQ1AwVWVsZ1lrRHdSZVE3VGpLSWxGNk1weHY2YitORkRD?=
 =?utf-8?B?QUVVREd2YUxEWlQ0TFU4MW9CV0M0a1M2Q3RjcTNTR1RTdmJZMkdydXNoaUpm?=
 =?utf-8?B?NURIR20rOFhnanNHNlpXbGNteFdMMC9IdEJ5UVVjTktDSS9WMk5kNnRJcGw3?=
 =?utf-8?B?UWN2a2JZT3BmV3pLMUhFZjRwUVNrakRma0tHdUZNWGgzQTY5a2QwRUNFOFAw?=
 =?utf-8?B?WWlVaDJxQXpyMzdxQlhnejlMVUFnMkJrdXpISG92cVpEdm9KUkFHdkZmait3?=
 =?utf-8?B?QUNoa0lGQndQMXFhMGs4S09UaXZKNlNsYmM4VWVYQkV0d1k1N0V1ZzFHVmdy?=
 =?utf-8?B?dTQ0OXNmVDFTdENuTERrQngxOFN1UThaSkYyYVpoZlBvZjYxalorNS9xdVVR?=
 =?utf-8?B?SEM0SWtSVWVJYnU0aE1xNE02M1Q4bkJiWTQ3azFaM1RLeXNEcmg0NzFsQzcr?=
 =?utf-8?B?U2dvOW9TRHRZcytLYWVUeWZFL1pZRktSY2tVZnJ5bWVlajlnY1lzY2xTMXNn?=
 =?utf-8?Q?LRsIgNhi9XmHlE4s0pMLRr1Ge?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a25fd7d-eddd-4062-b490-08dbda1fe64d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 14:44:34.7186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYdCzESBdRo6ifUpK7L1sTZ1EHQY4a+uhwmFqqvI18lV9ZNO0KCsX9TGkkZNJAQq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5705
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.10.23 um 15:39 schrieb Tatsuyuki Ishi:
>
>> On Oct 31, 2023, at 22:55, Christian König <christian.koenig@amd.com> wrote:
>>
>> Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
>>> In short, eviction never really belonged to the vm_status state machine.
>> I strongly disagree to that.
>>
>>> Even when evicted, the BO could belong to either the moved or done state.
>>> The "evicted" state needed to handle both cases, causing greater confusion.
>>>
>>> Additionally, there were inconsistencies in the definition of an evicted
>>> BO. Some places are based on the `evict` parameter passed from the TTM move
>>> callback, while the others were updated based on whether the BO got its
>>> optimal placement. The second is more accurate for our use case. With this
>>> refactor, the evicted state is solely determined by the second rule.
>> That strongly sounds like you don't understand what the evicted state it good for.
>>
>> The evicted state is for page directories, page tables and per VM BOs which needs to move around before doing the next CS.
>>
>> Please further explain what you try to do here.
> This is mainly an attempt to address inconsistency in the definition of “eviction”. The TTM move callback sets eviction when eviction happens through ttm_bo_evict. This is however not the only way a BO might end up outside its preferred domains.
>
> amdgpu_vm_bo_update later updates the eviction state based on whether the BO is in its preferred domains. In my understanding this includes all cases where the BO is evicted through ttm_bo_evict. Therefore we should apply this definition right from the move callback, not only after amdgpu_vm_bo_update has been called at least once.

No, that is something completely separated. The evicted state just means 
that we need to re-validate the BO.

One cause of this is that TTM moved the BO.

But a different cause is that TTM moved the BO, we tried to validated it 
but fallen back to GTT for now and called amdgpu_vm_bo_update(). 
amdgpu_vm_bo_update() then moves the BO into the evicted state again so 
that we try to move it into VRAM on the next command submission.

This is purely an optimization done to create enough pressure so that 
TTM can do it's work.

Christian.

>
> Tatsuyuki.
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c    | 67 +++++++++--------------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h    |  1 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c |  1 +
>>>   3 files changed, 29 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index 7b9762f1cddd..dd6f72e2a1d6 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -174,19 +174,23 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>    * State for PDs/PTs and per VM BOs which are not at the location they should
>>>    * be.
>>>    */
>>> -static void amdgpu_vm_bo_evicted(struct amdgpu_vm_bo_base *vm_bo)
>>> +static void amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base *vm_bo, bool evicted)
>>>   {
>>>   	struct amdgpu_vm *vm = vm_bo->vm;
>>>   	struct amdgpu_bo *bo = vm_bo->bo;
>>>   -	vm_bo->moved = true;
>>>   	spin_lock(&vm_bo->vm->status_lock);
>>> -	if (bo->tbo.type == ttm_bo_type_kernel)
>>> -		list_move(&vm_bo->vm_status, &vm->evicted);
>>> -	else
>>> -		list_move_tail(&vm_bo->vm_status, &vm->evicted);
>>> +	if (evicted && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
>>> +		if (bo->tbo.type == ttm_bo_type_kernel)
>>> +			list_move(&vm_bo->eviction_status, &vm->evicted);
>>> +		else
>>> +			list_move_tail(&vm_bo->eviction_status, &vm->evicted);
>>> +	} else {
>>> +		list_del_init(&vm_bo->eviction_status);
>>> +	}
>>>   	spin_unlock(&vm_bo->vm->status_lock);
>>>   }
>>> +
>>>   /**
>>>    * amdgpu_vm_bo_moved - vm_bo is moved
>>>    *
>>> @@ -310,6 +314,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>>>   	base->bo = bo;
>>>   	base->next = NULL;
>>>   	INIT_LIST_HEAD(&base->vm_status);
>>> +	INIT_LIST_HEAD(&base->eviction_status);
>>>     	if (!bo)
>>>   		return;
>>> @@ -336,7 +341,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>>>   	 * is currently evicted. add the bo to the evicted list to make sure it
>>>   	 * is validated on next vm use to avoid fault.
>>>   	 * */
>>> -	amdgpu_vm_bo_evicted(base);
>>> +	amdgpu_vm_bo_set_evicted(base, true);
>>>   }
>>>     /**
>>> @@ -460,7 +465,7 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>   	while (!list_empty(&vm->evicted)) {
>>>   		bo_base = list_first_entry(&vm->evicted,
>>>   					   struct amdgpu_vm_bo_base,
>>> -					   vm_status);
>>> +					   eviction_status);
>>>   		spin_unlock(&vm->status_lock);
>>>     		bo = bo_base->bo;
>>> @@ -1034,7 +1039,7 @@ void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
>>>   	list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status)
>>>   		amdgpu_vm_bo_get_memory(bo_va, stats);
>>>   -	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status)
>>> +	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.eviction_status)
>>>   		amdgpu_vm_bo_get_memory(bo_va, stats);
>>>     	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status)
>>> @@ -1153,21 +1158,10 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>>>   			return r;
>>>   	}
>>>   -	/* If the BO is not in its preferred location add it back to
>>> -	 * the evicted list so that it gets validated again on the
>>> -	 * next command submission.
>>> -	 */
>>> -	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
>>> -		uint32_t mem_type = bo->tbo.resource->mem_type;
>>> -
>>> -		if (!(bo->preferred_domains &
>>> -		      amdgpu_mem_type_to_domain(mem_type)))
>>> -			amdgpu_vm_bo_evicted(&bo_va->base);
>>> -		else
>>> -			amdgpu_vm_bo_idle(&bo_va->base);
>>> -	} else {
>>> +	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv)
>>> +		amdgpu_vm_bo_idle(&bo_va->base);
>>> +	else
>>>   		amdgpu_vm_bo_done(&bo_va->base);
>>> -	}
>>>     	list_splice_init(&bo_va->invalids, &bo_va->valids);
>>>   	bo_va->cleared = clear;
>>> @@ -1883,6 +1877,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
>>>     	spin_lock(&vm->status_lock);
>>>   	list_del(&bo_va->base.vm_status);
>>> +	list_del(&bo_va->base.eviction_status);
>>>   	spin_unlock(&vm->status_lock);
>>>     	list_for_each_entry_safe(mapping, next, &bo_va->valids, list) {
>>> @@ -1959,13 +1954,18 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
>>>   	if (bo->parent && (amdgpu_bo_shadowed(bo->parent) == bo))
>>>   		bo = bo->parent;
>>>   +	/* If the BO is not in its preferred location add it back to
>>> +	 * the evicted list so that it gets validated again on the
>>> +	 * next command submission.
>>> +	 */
>>> +	uint32_t mem_type = bo->tbo.resource->mem_type;
>>> +	bool suboptimal = !(bo->preferred_domains &
>>> +			 amdgpu_mem_type_to_domain(mem_type));
>>> +
>>>   	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
>>>   		struct amdgpu_vm *vm = bo_base->vm;
>>>   -		if (evicted && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
>>> -			amdgpu_vm_bo_evicted(bo_base);
>>> -			continue;
>>> -		}
>>> +		amdgpu_vm_bo_set_evicted(bo_base, suboptimal);
>>>     		if (bo_base->moved)
>>>   			continue;
>>> @@ -2648,13 +2648,11 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
>>>   {
>>>   	struct amdgpu_bo_va *bo_va, *tmp;
>>>   	u64 total_idle = 0;
>>> -	u64 total_evicted = 0;
>>>   	u64 total_relocated = 0;
>>>   	u64 total_moved = 0;
>>>   	u64 total_invalidated = 0;
>>>   	u64 total_done = 0;
>>>   	unsigned int total_idle_objs = 0;
>>> -	unsigned int total_evicted_objs = 0;
>>>   	unsigned int total_relocated_objs = 0;
>>>   	unsigned int total_moved_objs = 0;
>>>   	unsigned int total_invalidated_objs = 0;
>>> @@ -2671,15 +2669,6 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
>>>   	total_idle_objs = id;
>>>   	id = 0;
>>>   -	seq_puts(m, "\tEvicted BOs:\n");
>>> -	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status) {
>>> -		if (!bo_va->base.bo)
>>> -			continue;
>>> -		total_evicted += amdgpu_bo_print_info(id++, bo_va->base.bo, m);
>>> -	}
>>> -	total_evicted_objs = id;
>>> -	id = 0;
>>> -
>>>   	seq_puts(m, "\tRelocated BOs:\n");
>>>   	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status) {
>>>   		if (!bo_va->base.bo)
>>> @@ -2718,8 +2707,6 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
>>>     	seq_printf(m, "\tTotal idle size:        %12lld\tobjs:\t%d\n", total_idle,
>>>   		   total_idle_objs);
>>> -	seq_printf(m, "\tTotal evicted size:     %12lld\tobjs:\t%d\n", total_evicted,
>>> -		   total_evicted_objs);
>>>   	seq_printf(m, "\tTotal relocated size:   %12lld\tobjs:\t%d\n", total_relocated,
>>>   		   total_relocated_objs);
>>>   	seq_printf(m, "\tTotal moved size:       %12lld\tobjs:\t%d\n", total_moved,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> index 204ab13184ed..d9ab97eabda9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> @@ -156,6 +156,7 @@ struct amdgpu_vm_bo_base {
>>>     	/* protected by spinlock */
>>>   	struct list_head		vm_status;
>>> +	struct list_head		eviction_status;
>>>     	/* protected by the BO being reserved */
>>>   	bool				moved;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>>> index 96d601e209b8..f78f4040f466 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
>>> @@ -652,6 +652,7 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
>>>     	spin_lock(&entry->vm->status_lock);
>>>   	list_del(&entry->vm_status);
>>> +	list_del(&entry->eviction_status);
>>>   	spin_unlock(&entry->vm->status_lock);
>>>   	amdgpu_bo_unref(&entry->bo);
>>>   }

