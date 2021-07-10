Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BDC3C2C0F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 02:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E3B6EAA2;
	Sat, 10 Jul 2021 00:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FA66EA97;
 Sat, 10 Jul 2021 00:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFyJuGQRgWxSE2WxyTUrYuDRwyrZORhFLka1ezx3yjJG/41zlXCGC7iruuzrVHOK+gwiBq0tJMEHQM3yazPY3kIbLhhzlChADGlFLC3em048j9fAXGCwS+hGjtzaKuN5kqluQIJNNAjYV+z9vTNdHWV2jezQAfiRzncd8n5yJjTpG25OeM1Vd081N2ggYBP8/p553JB240j8SBT8sZErTHSJNjFqCNkztfblXmDUzJkfNX5Ab9ErAmoXAxvuZyZ6Q7CTAeU3GI/uQHb9VOpUu3bI5km6kGYRsUt6HE5tcDoGAiOHoAcmyDgPVRLwmr8FZYEPrtLZOpEjLm//+/QzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEi9hS8cRwFrqDkZucGtCz7MjYwXrPHRModazDy3ovw=;
 b=Neii1qTI51GYF5M7O8DGeZuy1Sr/nMtODofrt/2FtT8Ytp0pIqBPKfy3u4QPegxbn88F7lLnMjWKHY4pF06kKSqgPEt97+f3gLB8un3bgNQZU23Htu4eK37Tk80p3/2+rrUwN73illvsJWxA4tFIl1Y/EN40V0uY9dwIKnsP3TiY0RLbUiF4Vb7LI0MjH0+szSFk0uUL1SjHZAI/dD+IAO6xrWRkggpotsxqO3gc1ztMWB5+nuM1vDWXSixc9OVrVPyrIoqi5lEjSi0MpFClF/GYJZPw3RTpZITvzmXrkXPJ2PtxYyJXU2L0JzuEzeIEJrO8f+rgIgXcNMrU7xUPTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEi9hS8cRwFrqDkZucGtCz7MjYwXrPHRModazDy3ovw=;
 b=lMvtEDRynxj3tp5FvyB9cyOzIWTyZUeExpqvky5EGZku2F1ZiVQTbf5cyDR8O4PrSh5wpPeTgLxM41AfLT/DXbsILQcYSkI69yTyUGoqIoEbyyyIjS9FSjYX/P/RoVnb3fkP20PFUulGmW0vmlXxIuly7xEeTHp8At5RWGRhdwc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5116.namprd12.prod.outlook.com (2603:10b6:408:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Sat, 10 Jul
 2021 00:29:33 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4308.023; Sat, 10 Jul 2021
 00:29:33 +0000
Subject: Re: [PATCH 2/2] drm/ttm: Fix COW check
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210708193621.2198733-1-alexander.deucher@amd.com>
 <20210708193621.2198733-2-alexander.deucher@amd.com>
 <a25f93e7-8c03-542c-f594-64a7c1fba292@gmail.com>
 <2fd0006e-f005-b11c-3918-a9d690a1831a@amd.com>
 <19fbefce-b9c8-8f22-2789-0eee8f58c61a@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <98be904c-0bcb-fab2-8cbf-978aa161dc5a@amd.com>
Date: Fri, 9 Jul 2021 20:29:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <19fbefce-b9c8-8f22-2789-0eee8f58c61a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29)
 To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Sat, 10 Jul 2021 00:29:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04059e20-90df-4a50-d5aa-08d94339ca16
X-MS-TrafficTypeDiagnostic: BN9PR12MB5116:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB51168F716F3FD03F5E8BC8E692179@BN9PR12MB5116.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: crsHW0yE0R49bna5/JGlDfNp0Vo/N7tEEtDBKTOkFDxz3tbOamxYVOxOxhd0117U63fr8VpU2BY/qQbQHlTWiWF2PWZZvFDMdWfqFnTTLQyL4Y8fP10KK7cYNsQFvERSo8lh8wfWCh5xKBb8tNDpVqPVp9GwlcttWYckcA+Vyhm2aCkXi53SvCmwKZjW78bKFwXjn2iZmfUhwlpLPMNm5FHPNbL3BeV5y14Q03n2SgFfB5eY8ohZux6X8/uIP/wNyr0HavMoOsZ2BYyBv/jnxh2h95RfKDzJUpzQsJ4/WcuSi+ujObqVn/Ldk4XfkWZWuJ4vR5l2EP+C6IU4thXd+Unf4YJLQYF2XCYqm6lXCuFrcB2q0kvigLsaWRjlnfEY7hXbFljmsP34d85Ua+pWGEBtnN1JZ+XDjjKasFWVdqDCUQm8DB9B49JYpHXcn1oiCaH4QsgT7EVoDq9/+UxQvKtBxoN+ipK/xMI3H9MMtOosCNoSERP2fqRvODeaM0jn06DhCsVlIOHcOfQjUSqSDVyWeme9zRfSBNDoZ2uqPWWNJaGV6Nx7QIJw3Gzo2s2EFxZrks8SI/svQdgqKHavRl7O8GC1ED54c5vJQOc7a6T3pJLP207sIton5k2dkGjXjidoJmrinUeWitJZL/2aHhZbwtBHamYGHb+djcCZ67vqgcOazVWygFkjJVMnS6xfjylr4NBOebJs0BRtQEAkqMvQxQNzw7Hl+nTZUe1dmNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(6486002)(8676002)(36916002)(316002)(16576012)(2616005)(66946007)(31686004)(478600001)(956004)(66556008)(66476007)(8936002)(38100700002)(110136005)(66574015)(83380400001)(36756003)(44832011)(186003)(5660300002)(26005)(2906002)(53546011)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmZwbHFLY1ZiZUVRa1RnSG9sMUNrc3RNWURPeGpCWjhwR0o4cFBtWTNIRS80?=
 =?utf-8?B?TzI4eDkzckpQL1h1ajYzbGF1MmJzdkZNTzNSUnRjRENTbXYvL0pPYkhVVlE2?=
 =?utf-8?B?SzFZbXVKempEUk0zN045bVNkb1YrOFVFVUZJZjBhZDRxaVFVelF2YUFGb2w3?=
 =?utf-8?B?NnNiaUYxaVFjdDE0RWw0Tlg3UGV0UEhleEtyZWZSTGU5a2hJWE5MVEN2bXNM?=
 =?utf-8?B?aUFsOTVFWDdCUDJEUG5Md3FUbkJHRy9xcGp6T1lYOTJZVHRXTEgzdXFGVW5C?=
 =?utf-8?B?QmNyelJRSHBzYlREZmM2ZzE0OWZHc0hONndnNFYyNzhmUHZVNlhUZDhaZFl5?=
 =?utf-8?B?TW9Idys1RkFMTGJWbHlOSlJ1anUzL2lROTZXRDNITlduSndUdDhLd2xIb1hp?=
 =?utf-8?B?M1p4WGRiUXUvTlZnVFpmSGw2NlNRQnFrYk82YnhEMzhCMVRrQ1hNNXkyMHN5?=
 =?utf-8?B?VGJ1c2xJYzRMb1J6UzZYRjFnNmxkT2JzcFVDK2s4dE9CbUtqRVF4TUZFQklV?=
 =?utf-8?B?WnI2NmpwYk5tTGE0NDdlS2RRREV0Rjl1NU1Ba1VXK0UxODdtaHdsbU4zQVdS?=
 =?utf-8?B?bHF1Qk9CUmg2cXhWSHh0d1pmZGJJRjJRYWxXbVRGN1d0eUFhY2dQUHQyaEY1?=
 =?utf-8?B?Wkd3NGZ4MzJTVDJOai9MRUorRzNlWnJuMXNGSm0zVTVaTmNPVjI0Nkg0OFl0?=
 =?utf-8?B?eG5SdWx1VGpVT2owV3JST3FVYmdwZG42ZENydTZXeExJT1RMa3pzalJuc0l4?=
 =?utf-8?B?a0QzZFVEN0RHYlU5Y0I1MGo3S2tndkZSYlh6K0VrZG41QStLMGZock5ndnd2?=
 =?utf-8?B?bjBjYUZVdjhyWVE2Q0RzLy9CRTg1YzJpV282RXM2RnY4QXRmaktwNjlBSmpw?=
 =?utf-8?B?QWFtZG1udmtEa2pkYnk4NXFGWHpwNlU5Mi96VU0rcnhnSzZQSW5iZFdLdEl1?=
 =?utf-8?B?a3hidS9kRFVvVEgxS3NqU1NJRTB3TCtvUHpzdVZpYVlmdHJVdElMRlI1RklB?=
 =?utf-8?B?R2VoL3pKNjVPVGhiQ1lFKzNxZGZqNjljSXVpUHRDN3VmZWgzUFhNbk1XQ3Mw?=
 =?utf-8?B?b2hiaTF5cVlzUzdLbWZ2U0VWeXd5L3JsYmxXcFNsSFM1MG5uaTg5UzR1dGc4?=
 =?utf-8?B?dzFnNDlsdjdiT3FOUWN4ampha1pQZVNjTmd5c0FReUxIWkkvZmU3WTlBaXEr?=
 =?utf-8?B?ZTl1QnBMT05NclFOZStET1p5NEZhaDNEMVhWZFpmNUFLL082Ly92QWFTYnJ1?=
 =?utf-8?B?UXRFZW9CWVVJS3A1eWV2ZCtjS240Y2l0RUVoUHBIdHFmSUhwNmNCTUUrZkM1?=
 =?utf-8?B?S1RlQmtyNTVSeGh0Uk1VdzlxVldCRHNVYjgvYUdLUFJKRHB1d1p4NXZPR1o2?=
 =?utf-8?B?d1o1bnh5RjkrajZUVGY4ejBqdklSakVlVjIvTTZRdFRnWkRmNmc4akZYMTBQ?=
 =?utf-8?B?dG1FQ3ZPcEJneGVwT0ZmVnRadFBDbkpkbEJOTUIxVUQzV21XRzdyNmlMbXVS?=
 =?utf-8?B?ZnVFTUtoNXJJY1JNTUpCWHFIUU04QzBZSk9KOVg4N2hPeXVaeVhwa2R6S3FM?=
 =?utf-8?B?YUswdmhEL2VTUm01ejJ2c0lReVptTVhhQzdyeW9CSDdJT2Q2T2JaNUwzRlFO?=
 =?utf-8?B?aTFvR0IzTWF6STVLcForRFVFS2xGeG9ETkhCTDk0cjNMOGNxZ3FXeWl2K2dQ?=
 =?utf-8?B?NnE5VVFXdVU5RjhqakhuOHVuQzJsM01PMTExTE9sMmpHSjc2dk9IVW9PNnQz?=
 =?utf-8?Q?mWh2UePjLJw6SUSNG2mKqD/tOqu4+pK5FIjpHP8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04059e20-90df-4a50-d5aa-08d94339ca16
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2021 00:29:33.3451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYwJSB1qEWmurfoxyoR8lY50pXiLotpxANVhcr8dR0t1r9HZx1U/FAtSQDqntrMIO84CHxdSDLKS1Som7ZpA7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5116
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


On 2021-07-09 3:37 p.m., Christian König wrote:
> Am 09.07.21 um 21:31 schrieb Felix Kuehling:
>> On 2021-07-09 2:38 a.m., Christian König wrote:
>>>
>>>
>>> Am 08.07.21 um 21:36 schrieb Alex Deucher:
>>>> From: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>
>>>> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
>>>> is_cow_mapping returns true for these mappings. Add a check for
>>>> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
>>>> PROT_NONE mappings.
>>>
>>> I'm pretty sure that this is not working as expected.
>>
>> Not sure what you mean. Debugger access to the memory through the 
>> PROT_NONE VMAs is definitely working, with both ptrace and 
>> /proc/<pid>/mem.
>>
>>
>>>
>>>>
>>>> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>> ---
>>>> drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> index f56be5bc0861..a75e90c7d4aa 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> @@ -552,7 +552,7 @@ static const struct vm_operations_struct 
>>>> ttm_bo_vm_ops = {
>>>>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct 
>>>> ttm_buffer_object *bo)
>>>>   {
>>>>       /* Enforce no COW since would have really strange behavior 
>>>> with it. */
>>>> -    if (is_cow_mapping(vma->vm_flags))
>>>> +    if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>>>
>>> is_cow_mapping() already checks for VM_MAYWRITE, so this here 
>>> shouldn't be necessary.
>>
>> AFAICT, VM_MAYWRITE is not based on the PROT_... bits used to create 
>> the VMA, but based on the permissions of the file. So as long as the 
>> render node is writable, VM_MAYWRITE is set for all VMAs that map it.
>>
>> I would agree that it's probably a bad idea for the Thunk to map 
>> these VMAs with MAP_PRIVATE. We can try changing the Thunk to use 
>> MAP_SHARED for these PROT_NONE mappings. But that doesn't change the 
>> fact that this kernel patch broke existing usermode.

For the record, changing the Thunk to use MAP_SHARED works.


>
> Yeah, but see the discussion around MAP_PRIVATE and COW regarding 
> this. What Thunk did here was a really bad idea.

Hindsight ... Which part was a bad idea?

  * Creating a PROT_NONE VMA? That's necessary to let ptrace or
    /proc/<pid>/mem access the memory. It's a brilliant idea, IMHO
  * Making that VMA MAP_PRIVATE? Probably a bad idea in hindsight. The
    process itself can't access this memory, let alone write to it. So I
    didn't think too much about whether to make it shared or private.
    Either way, we are not causing any actual COW on these mappings
    because they are not writable, and we never make them writable with
    mprotect either
  * Introducing a COW check after letting it slide for 15 years? It's a
    reasonable check. In this case it catches a false positive. Had this
    check been in place 4 or 5 years ago, it would have easily prevented
    this mess


>
> I think we have only two options here:
> 1. Accept the breakage of thunk.

Really?


> 2. Add a workaround in amdgpu/amdkfd to force MAP_PRIVATE into 
> MAP_SHARED in the kernel.

I tried to do this in amdgpu_gem_object_mmap and spent 4 hours debugging 
why it doesn't work. It breaks because the mapping->i_mmap_writable gets 
unbalanced and causes subsequent mappings to fail when that atomic 
counter becomes negative (indicating DENYWRITE). I could fix it by 
calling mapping_map_writable. But I don't think this is intended as 
driver API. I see no precedent of any driver calling this. For the 
record this works, but it feels fragile and ugly:

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -255,6 +255,20 @@ static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_str
  	if (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
  		return -EPERM;
  
+	/* Workaround for Thunk bug creating PROT_NONE,MAP_PRIVATE mappings
+	 * for debugger access to invisible VRAM. Should have used MAP_SHARED
+	 * instead.
+	 */
+	if (is_cow_mapping(vma->vm_flags) &&
+	    !(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC))) {
+		int ret;
+
+		ret = mapping_map_writable(vma->vm_file->f_mapping);
+		if (ret)
+			return ret;
+		vma->vm_flags |= VM_SHARED | VM_MAYSHARE;
+	}
+
  	return drm_gem_ttm_mmap(obj, vma);
  }

3. Improve my previous workaround by adding a similar check for COW in 
ttm_bo_vm_ops.mprotect. I'll send an updated patch.

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
>>> Christian.
>>>
>>>>           return -EINVAL;
>>>>         ttm_bo_get(bo);
>>>
>
