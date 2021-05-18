Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C12D387836
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148BE6EB3D;
	Tue, 18 May 2021 11:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBFC6EB3C;
 Tue, 18 May 2021 11:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGEDT+ySTRb9PW5VtJuI/vzcaqmEP/+PH/RoZF4/s2cYtGX3YfyW54dftt3jVOrecfF2cfto50N2gAIDWl2TtHspdE0ozBFXWJWjFiCeXFrIsj9ij2VKR2sFKuRAS6u/kUIr/qxy7TylgSpBRFqVwzGsoKa8bluF0ksahA5GhDT8Bnd+S9gSm1zPEYkcZaN75n1GoqvsqMbdHj0GB4xhwQWFtaNRf0LsMSa2jbvX1CV4g5s/5H6KTizZCdfg1fPpEFc0KpaaZI8pa0xp03njRuteYkXlP2Lpof9h3D6Maq/SJdRGM2th6BwvmwEg9uwTJAA9QNhvaFSOqgjtf8RItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/wehBrInaDOfROwG6LnOm9SNU052e16/HPEXQsGyZ8=;
 b=BPeGbNp8+Fag/VMkaXeBgpwM8gSxiMJOCowxO+XhRq0Q7HwvCBaPOLO3MoW4PDYAY530mQhzotCKKl/mK7Z/4NQpo74gR1Ir4ZZMBGvY6M13zBl0SNT6QGtCd0FXlBu9F63WqqISbrIKUlRdFkaXJacK6DwOq3nMFy0wa+tctLdlN+cScwNJgTNj1ahcWbIEOJFCeHm/g/u9oYibxG7uDcz4RIPaPaO8AKvuOQTBX/N8R0wjKrVxa3cv0m6ahfyxgzoHAmcxJBIpWk9MVprk9wPZAq0EEAJw928zrIJnJ0fjoZ4NhAARqf4mFcFb7rsSVLRwIoufrTH8B11J2UxXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/wehBrInaDOfROwG6LnOm9SNU052e16/HPEXQsGyZ8=;
 b=i0bd5wCejobTrowaqwhs8w1VQIPs3zxsGm09c1+tAQce2RoiFDdRH/gr/r24on8j1WCAZ8zE6ZK6/gN154vDBPRj16BfcpmpAjRr+OaOGDrrMkGIWs2KR+36sFKvOhwftwncwjGg96C5eb9kczOTBNe1KEbA4MiGyqypRRLVgA4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 11:59:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 11:59:31 +0000
Subject: Re: [Intel-gfx] [PATCH v2 13/15] drm/ttm: Add BO and offset arguments
 for vm_access and vm_fault ttm handlers.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-14-thomas.hellstrom@linux.intel.com>
 <7ce49dd3-d4f9-61c1-dcc6-a5d303dc36fc@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a93d3f87-1331-e264-13c7-87b29cdbc22f@amd.com>
Date: Tue, 18 May 2021 13:59:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <7ce49dd3-d4f9-61c1-dcc6-a5d303dc36fc@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8470:36a5:2010:f0c4]
X-ClientProxiedBy: PR3P193CA0048.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4]
 (2a02:908:1252:fb60:8470:36a5:2010:f0c4) by
 PR3P193CA0048.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 11:59:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c18fa3a9-583c-4d03-c8a3-08d919f46587
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125EC7393969647E830406D832C9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ghTl+sWdTp2Kz9PKScgUjpMv/2GDwrzW2wFZaPQjKafXpRnFi7GtyCENU4TF8Ka6TArRW+Bj8+CkuriL/TLzEqOWyOAge0dW5biESCTbP0sE41PauD5DXk3CzUtUNMFBgB/Iurye+PDapcMd1JX8YaDbGep4UUb6nhQg/6Kpk40yUkVkg6Gge6cLyyH6ox5eUAAMRv97mRfiJAYOl+K1neFzwrd+n3VHzYXBPEJZFjw01SzY0f1nJsWeHKdVN+rYz8lah47GR+YiGT71TIEyKQboqS3G4c0wdQXx+3bIF0zoZlR9bmg9a0Lq/fIcYXYFuzZ+5RHNRR/Gciq6Jeuk0g93XFam6bQX5d1PnGh/2x7Y2WDTxCZyZ3ytPHfn5gwkfXSVhLSYtxvUeRwdUzFzdgsdkhD1M7dUq/NImPG9uxoMUcynw18yFl5JqJicw4m7xDI/mLnG47LFTdXoLL6ksKZiAFp9xcYO9kImW/uHFB7KD17ncg58GUrin5gIa5mYSSZjq/1uMb3uyp34mLS2y0jl029GQsrjX3OJyFj5tmVI8iltV9eV0VGpX2G2tbQIcwdV8iQ9+a0zDxvgEEC505uCjXhOWHD97+16nSO2p81T22KEC64r2j+1wys1vPxQPhhyhR0ZxqvB3SRxxyOW5oHivEL/GqWjRMxnjjR3f8YWlHQNZ0XMpTvuP6wuwq7V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39850400004)(396003)(136003)(8936002)(36756003)(83380400001)(2616005)(2906002)(478600001)(6666004)(6486002)(66574015)(31686004)(53546011)(86362001)(31696002)(316002)(38100700002)(66946007)(16526019)(186003)(5660300002)(66556008)(66476007)(8676002)(52116002)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U0pzL1RRMnkrd3R6Zko4OURjQTl0ZmZPS3F3S1poYlZxTVRSRGVSYUJQMHlW?=
 =?utf-8?B?U0dzM1VLU3JMYUpCajBJM3o4b21VSVF1aktzVG9XQXNjZ3V5ZVl5Q0UwaGZ0?=
 =?utf-8?B?T3FPdkFzVnJvTkc4T3FKUGtyVTQ4R1JtL2VaTUJ2Z0xVL290c2JsUTFkUFNj?=
 =?utf-8?B?SVEyVTRXMWJ5SWh5VUVYdWt4S3ZuK2VqclY1NmJYeU9LTjlmTmhFSDZYSWVV?=
 =?utf-8?B?V3pZbm1kMy9zOFNmbFFPZDErajY0YWNOdjRRUUhiUC9XL2lEeXcrU29kK0Jh?=
 =?utf-8?B?dzNqKys4OGgya05OZG1JVUtmay9Ec2dWajZaYnd5Wkt4Vk1UUGxXRFFRM3Rm?=
 =?utf-8?B?QndrbG80djhHV0F4ZG4zUStzWkdSMEEzZTYyalNuZnkzbStrWTFEYVdHbmt2?=
 =?utf-8?B?RWlqMTJEMlVxV3BiOS9lSHNWUG8vbGViYU8wMkFDQ2kwQVdaaWsvYUQwSXp5?=
 =?utf-8?B?YjZEUis1NG5zSnhCVllDOUJ1aW5Uams1aGt0MWhrQjRPR1Uxb0xVVkZTR0ZO?=
 =?utf-8?B?YUZHMXdlS05EekJKTTZHZ002TnlISDJpa0xNRGJ5ejBlaFVmTHhpRE1td256?=
 =?utf-8?B?R2htdVBOR0ZMcFR5Qnl0U0EwaUlLQm5YMzJIUm11cXdKU2ZLU09jWWpCL0Fn?=
 =?utf-8?B?dXlNVmEvR0p2cnhhTms3cmRHbDR4UzcvTkdLU2xoWDNnT1lrWk9uQ2l5bG11?=
 =?utf-8?B?UGRjZjdsRFJCRTEyZmVoQVdtdVNzMzZkOUVkTWdXNnVFdXk3b294Tm1rK2VD?=
 =?utf-8?B?QVNJYk45cDdndVBiVjh6ZEhaR1pOaDhyd21NajNvdGd4VmN0cW16WHo0VjZr?=
 =?utf-8?B?WVVkaDlhWUcwRStHdXFnbW1SQWhtbWJ4N2J1VEtiVUsvZUFPUVRCUmxySnQ4?=
 =?utf-8?B?SDhJbXI4YTYycmt1SmREWUhRVFp0dmJ6TW04U3hqcHFIdVVLM1hQbEhMR2RS?=
 =?utf-8?B?TlNzUS9nUmtnWkRxd1NZQklQbUZBVVNHVzlpdWdjVmhvdGQxdU51T0FMTlRN?=
 =?utf-8?B?NEV0YUJNT3ZmSEQxY2RRajdaZVhaMHJ6czZTZjkya3UxMTlXUllFVzAyODZj?=
 =?utf-8?B?Rktlc3lQY3V4RGc2eUJMeFZ6aCtmUFlPK1ZyZWRySmtSRVZySG5BUkg0eUlY?=
 =?utf-8?B?eklINldSdGxxQTNwNXh4MEhsVC9kM0FuMDA3akUxd3FLNGROWmhILzVXeUxu?=
 =?utf-8?B?ay9LUnhlY2lmWmd0WHlRMjFtSWszYVdnZHh2S09panJselJVVkY1cjBFVEVm?=
 =?utf-8?B?eDZyRXRWQnI3alkxSzZlbER4cHdzSmtrWktmUDZONmk1UDlOZ2ZXTGowa2dI?=
 =?utf-8?B?MDV2NzJpV0NtMHd6RnBqM1p6Ty9neGV0Qk52UEFMRjI4N28rZWx1cHp4azlv?=
 =?utf-8?B?dXdEL2p2UHEyR2M0NXJ6NlB6VFZjQkRqT29NMlFOeW1TODRPaWllTWVjNjBn?=
 =?utf-8?B?cTFFVUVTYzEwdVl2Z2orRHRiY00zUjZPalVOMXJNcVc5TmRoSVQ5QzczTUQ4?=
 =?utf-8?B?RjR1TDEzSkJ5cm5EcW1HcFVJM0JBUGJGNEdObmROcTA0a3ByaXQ2VDkxOHJI?=
 =?utf-8?B?M3k0MWNsQUFjMWFiZUFWYlhmdmJORmNkOHVBK0crNS9GTmNCNEl3cis5dFp4?=
 =?utf-8?B?OXJocVp4cjBpamlHWDNVM2QyS1M1MjIzZTJ5MmgyZU1DUG1XRUZuTWx3cTRM?=
 =?utf-8?B?Uk90ZXpwMUQ0cEpROFZJS2VRczFIQTdHdjZpOFRLVTAwZ0ZIaUhsaTZDczd2?=
 =?utf-8?B?U0VlcHVIYytFU0lQaTROTndaSS9SNWxWV3BVUXg3dEdIcXhYb0IyUkFZNnZl?=
 =?utf-8?B?NWNJOVdBRXVPQ0laTGpEaElaZ21yWDhBY0ZWNVRMSjdZKy8zMm1lQ2dRSE9u?=
 =?utf-8?Q?fvk+HSxPTU6+q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18fa3a9-583c-4d03-c8a3-08d919f46587
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 11:59:31.7627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsGhVQVUFTnFnfhnItdG86RE/kr9YlbeDEpkqsoyYCuLZoOM5hhlOYObNWN6OpXI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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

Can you send me the patch directly and not just on CC?

Thanks,
Christian.

Am 18.05.21 um 10:59 schrieb Thomas Hellström:
> + Christian König
>
> On 5/18/21 10:26 AM, Thomas Hellström wrote:
>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> This allows other drivers that may not setup the vma in the same way
>> to use the ttm bo helpers.
>>
>> Also clarify the documentation a bit, especially related to 
>> VM_FAULT_RETRY.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> Lgtm. Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 +-
>>   drivers/gpu/drm/nouveau/nouveau_ttm.c      |  4 +-
>>   drivers/gpu/drm/radeon/radeon_ttm.c        |  4 +-
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c            | 84 +++++++++++++---------
>>   drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  8 ++-
>>   include/drm/ttm/ttm_bo_api.h               |  9 ++-
>>   6 files changed, 75 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index d5a9d7a88315..89dafe14f828 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1919,7 +1919,9 @@ static vm_fault_t amdgpu_ttm_fault(struct 
>> vm_fault *vmf)
>>       if (ret)
>>           goto unlock;
>>   -    ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>> + drm_vma_node_start(&bo->base.vma_node),
>> +                       vmf->vma->vm_page_prot,
>>                          TTM_BO_VM_NUM_PREFAULT, 1);
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           return ret;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c 
>> b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> index b81ae90b8449..555fb6d8be8b 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> @@ -144,7 +144,9 @@ static vm_fault_t nouveau_ttm_fault(struct 
>> vm_fault *vmf)
>>         nouveau_bo_del_io_reserve_lru(bo);
>>       prot = vm_get_page_prot(vma->vm_flags);
>> -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>> TTM_BO_VM_NUM_PREFAULT, 1);
>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>> + drm_vma_node_start(&bo->base.vma_node),
>> +                       prot, TTM_BO_VM_NUM_PREFAULT, 1);
>>       nouveau_bo_add_io_reserve_lru(bo);
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           return ret;
>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c 
>> b/drivers/gpu/drm/radeon/radeon_ttm.c
>> index 3361d11769a2..ba48a2acdef0 100644
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -816,7 +816,9 @@ static vm_fault_t radeon_ttm_fault(struct 
>> vm_fault *vmf)
>>       if (ret)
>>           goto unlock_resv;
>>   -    ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>> + drm_vma_node_start(&bo->base.vma_node),
>> +                       vmf->vma->vm_page_prot,
>>                          TTM_BO_VM_NUM_PREFAULT, 1);
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           goto unlock_mclk;
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index b31b18058965..ed00ccf1376e 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -42,7 +42,7 @@
>>   #include <linux/mem_encrypt.h>
>>     static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
>> -                struct vm_fault *vmf)
>> +                       struct vm_fault *vmf)
>>   {
>>       vm_fault_t ret = 0;
>>       int err = 0;
>> @@ -122,7 +122,8 @@ static unsigned long ttm_bo_io_mem_pfn(struct 
>> ttm_buffer_object *bo,
>>    * Return:
>>    *    0 on success and the bo was reserved.
>>    *    VM_FAULT_RETRY if blocking wait.
>> - *    VM_FAULT_NOPAGE if blocking wait and retrying was not allowed.
>> + *    VM_FAULT_NOPAGE if blocking wait and retrying was not allowed, 
>> or wait interrupted.
>> + *    VM_FAULT_SIGBUS if wait on bo->moving failed for reason other 
>> than a signal.
>>    */
>>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>                    struct vm_fault *vmf)
>> @@ -254,7 +255,9 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct 
>> vm_fault *vmf,
>>     /**
>>    * ttm_bo_vm_fault_reserved - TTM fault helper
>> + * @bo: The buffer object
>>    * @vmf: The struct vm_fault given as argument to the fault callback
>> + * @mmap_base: The base of the mmap, to which the @vmf fault is 
>> relative to.
>>    * @prot: The page protection to be used for this memory area.
>>    * @num_prefault: Maximum number of prefault pages. The caller may 
>> want to
>>    * specify this based on madvice settings and the size of the GPU 
>> object
>> @@ -265,19 +268,28 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct 
>> vm_fault *vmf,
>>    * memory backing the buffer object, and then returns a return code
>>    * instructing the caller to retry the page access.
>>    *
>> + * This function ensures any pipelined wait is finished.
>> + *
>> + * WARNING:
>> + * On VM_FAULT_RETRY, the bo will be unlocked by this function when
>> + * #FAULT_FLAG_RETRY_NOWAIT is not set inside @vmf->flags. In this
>> + * case, the caller should not unlock the @bo.
>> + *
>>    * Return:
>> - *   VM_FAULT_NOPAGE on success or pending signal
>> + *   0 on success.
>> + *   VM_FAULT_NOPAGE on pending signal
>>    *   VM_FAULT_SIGBUS on unspecified error
>>    *   VM_FAULT_OOM on out-of-memory
>> - *   VM_FAULT_RETRY if retryable wait
>> + *   VM_FAULT_RETRY if retryable wait, see WARNING above.
>>    */
>> -vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>> +vm_fault_t ttm_bo_vm_fault_reserved(struct ttm_buffer_object *bo,
>> +                    struct vm_fault *vmf,
>> +                    unsigned long mmap_base,
>>                       pgprot_t prot,
>>                       pgoff_t num_prefault,
>>                       pgoff_t fault_page_size)
>>   {
>>       struct vm_area_struct *vma = vmf->vma;
>> -    struct ttm_buffer_object *bo = vma->vm_private_data;
>>       struct ttm_device *bdev = bo->bdev;
>>       unsigned long page_offset;
>>       unsigned long page_last;
>> @@ -286,15 +298,11 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>> vm_fault *vmf,
>>       struct page *page;
>>       int err;
>>       pgoff_t i;
>> -    vm_fault_t ret = VM_FAULT_NOPAGE;
>> +    vm_fault_t ret;
>>       unsigned long address = vmf->address;
>>   -    /*
>> -     * Wait for buffer data in transit, due to a pipelined
>> -     * move.
>> -     */
>>       ret = ttm_bo_vm_fault_idle(bo, vmf);
>> -    if (unlikely(ret != 0))
>> +    if (ret)
>>           return ret;
>>         err = ttm_mem_io_reserve(bdev, &bo->mem);
>> @@ -302,9 +310,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>> vm_fault *vmf,
>>           return VM_FAULT_SIGBUS;
>>         page_offset = ((address - vma->vm_start) >> PAGE_SHIFT) +
>> -        vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node);
>> -    page_last = vma_pages(vma) + vma->vm_pgoff -
>> -        drm_vma_node_start(&bo->base.vma_node);
>> +        vma->vm_pgoff - mmap_base;
>> +    page_last = vma_pages(vma) + vma->vm_pgoff - mmap_base;
>>         if (unlikely(page_offset >= bo->mem.num_pages))
>>           return VM_FAULT_SIGBUS;
>> @@ -344,8 +351,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>> vm_fault *vmf,
>>               } else if (unlikely(!page)) {
>>                   break;
>>               }
>> -            page->index = drm_vma_node_start(&bo->base.vma_node) +
>> -                page_offset;
>> +            page->index = mmap_base + page_offset;
>>               pfn = page_to_pfn(page);
>>           }
>>   @@ -392,7 +398,10 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
>>           return ret;
>>         prot = vma->vm_page_prot;
>> -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>> TTM_BO_VM_NUM_PREFAULT, 1);
>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>> + drm_vma_node_start(&bo->base.vma_node),
>> +                       prot, TTM_BO_VM_NUM_PREFAULT, 1);
>> +
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           return ret;
>>   @@ -460,22 +469,16 @@ static int ttm_bo_vm_access_kmap(struct 
>> ttm_buffer_object *bo,
>>       return len;
>>   }
>>   -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>> -             void *buf, int len, int write)
>> +int ttm_bo_vm_access_reserved(struct ttm_buffer_object *bo,
>> +                  struct vm_area_struct *vma,
>> +                  unsigned long offset,
>> +                  void *buf, int len, int write)
>>   {
>> -    struct ttm_buffer_object *bo = vma->vm_private_data;
>> -    unsigned long offset = (addr) - vma->vm_start +
>> -        ((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>> -         << PAGE_SHIFT);
>>       int ret;
>>         if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->mem.num_pages)
>>           return -EIO;
>>   -    ret = ttm_bo_reserve(bo, true, false, NULL);
>> -    if (ret)
>> -        return ret;
>> -
>>       switch (bo->mem.mem_type) {
>>       case TTM_PL_SYSTEM:
>>           if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>> @@ -485,16 +488,33 @@ int ttm_bo_vm_access(struct vm_area_struct 
>> *vma, unsigned long addr,
>>           }
>>           fallthrough;
>>       case TTM_PL_TT:
>> -        ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>> -        break;
>> +        return ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>>       default:
>>           if (bo->bdev->funcs->access_memory)
>> -            ret = bo->bdev->funcs->access_memory(
>> +            return bo->bdev->funcs->access_memory(
>>                   bo, offset, buf, len, write);
>>           else
>> -            ret = -EIO;
>> +            return -EIO;
>>       }
>>   +    return ret;
>> +}
>> +EXPORT_SYMBOL(ttm_bo_vm_access_reserved);
>> +
>> +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>> +             void *buf, int len, int write)
>> +{
>> +    struct ttm_buffer_object *bo = vma->vm_private_data;
>> +    unsigned long offset = (addr) - vma->vm_start +
>> +        ((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>> +         << PAGE_SHIFT);
>> +    int ret;
>> +
>> +    ret = ttm_bo_reserve(bo, true, false, NULL);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = ttm_bo_vm_access_reserved(bo, vma, offset, buf, len, write);
>>       ttm_bo_unreserve(bo);
>>         return ret;
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c 
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>> index 45c9c6a7f1d6..56ecace0cf5c 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>> @@ -477,7 +477,9 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>>       else
>>           prot = vm_get_page_prot(vma->vm_flags);
>>   -    ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, 1);
>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>> + drm_vma_node_start(&bo->base.vma_node),
>> +                       prot, num_prefault, 1);
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           return ret;
>>   @@ -546,7 +548,9 @@ vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault 
>> *vmf,
>>           prot = vm_get_page_prot(vma->vm_flags);
>>       }
>>   -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
>> +    ret = ttm_bo_vm_fault_reserved(bo, vmf,
>> + drm_vma_node_start(&bo->base.vma_node),
>> +                       prot, 1, fault_page_size);
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           return ret;
>>   diff --git a/include/drm/ttm/ttm_bo_api.h 
>> b/include/drm/ttm/ttm_bo_api.h
>> index 639521880c29..434f91f1fdbf 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -605,7 +605,9 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>                    struct vm_fault *vmf);
>>   -vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>> +vm_fault_t ttm_bo_vm_fault_reserved(struct ttm_buffer_object *bo,
>> +                    struct vm_fault *vmf,
>> +                    unsigned long mmap_base,
>>                       pgprot_t prot,
>>                       pgoff_t num_prefault,
>>                       pgoff_t fault_page_size);
>> @@ -616,6 +618,11 @@ void ttm_bo_vm_open(struct vm_area_struct *vma);
>>     void ttm_bo_vm_close(struct vm_area_struct *vma);
>>   +int ttm_bo_vm_access_reserved(struct ttm_buffer_object *bo,
>> +                  struct vm_area_struct *vma,
>> +                  unsigned long offset,
>> +                  void *buf, int len, int write);
>> +
>>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>                void *buf, int len, int write);
>>   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);

