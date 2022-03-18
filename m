Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB154DD9D9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 13:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E5110E336;
	Fri, 18 Mar 2022 12:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6C010E1EA;
 Fri, 18 Mar 2022 12:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdM3rYq32WvIp20erSh3X/QZyTtyfHhk7BL0sj9IeCu8IFsqdVF/kuMVZH2QJ0ZoKa+WipShKNB3Hfwh1KAtr/dByUFdmQm0IgDK3EqK3eMU54J6PCYVLDH5GnsanqgWQnZTvCKxy1Xn1FT5lIjdEbhLKCsjDiNtjskqovEYbJvQbgDLWUlgnuEVH1O2zcCDbAWtn4EbltHhJR+2EQXuZEUJH5bTzIxpG5UQON2cALTHR7GWzftYvGgzz0Ae066SCdBRzuujbc6AhjBi/1vnOjovsCywded3FqwiZCbx+KfsscK/aqgPHQX5sLUZimF3ADuweD0kdyUe9flDeKM2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALawTFB0SIcsaPFs2CSbdzPlVHrJSV2HkQRuRXXNzYk=;
 b=Ya8Vvw67NnCJpfKY/tlO9NCmsczXNH5RPz27U4c+k4OBsu74vvy4Q3qFoYd5C9SSWsd7tJnINR5cJrmmN8o3kWHw/E4jDoKnbjScd9RRnDlxFFx4+pW/y2xyH/Fhn11Y56LpK4UmZs9nOqdAIMlEJXRZ8Ef0KjxNxAAWtvo93d2EBDlYcYsOqe8gLoDoVsOwxOZ2a6FudJn06/4ipKV2i3ZBL94Qqb83qxiOqKkEcqOdruJofgQtYD5t8OPMtP0bsVccAdtholQFsdU4szAVZ0ooya8ugkUk4KZXfWbJO/BNR/9q9wP0s+8D/4Z17mHLg9CGosmt3JdXMzDl3v8yog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALawTFB0SIcsaPFs2CSbdzPlVHrJSV2HkQRuRXXNzYk=;
 b=aiuQvuFxpvNAs0B1QNnpECGsflJkAefr/SlCYoQds8BATUITCSAsOgu7KUBu5t52NPY+8Ra2VeMSBGEZPlGksj3N7JhxAOf3VEwUEg7+htb6MVMwOYuPUXMr/1lepbu1gtc3OIpDfnMce8A1JBSIazk7Lm6t9UXcOqnCfcYjtMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB2883.namprd12.prod.outlook.com (2603:10b6:408:98::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 12:38:44 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 12:38:44 +0000
Message-ID: <74d1b5aa-7cfc-8cf0-b94e-efb19a7f1920@amd.com>
Date: Fri, 18 Mar 2022 13:38:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/4] drm/amdkfd: Improve amdgpu_vm_handle_moved
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220317002006.342457-1-Felix.Kuehling@amd.com>
 <20220317002006.342457-2-Felix.Kuehling@amd.com>
 <5054ada1-9f2d-1297-5f37-0b05ec2ae37f@amd.com>
 <f9f2bbdb-74bc-e286-07d6-4f1972f0e743@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <f9f2bbdb-74bc-e286-07d6-4f1972f0e743@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae0855c4-5eb1-4055-54f4-08da08dc3d1e
X-MS-TrafficTypeDiagnostic: BN8PR12MB2883:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB28839ABB07A086267A5FA8B283139@BN8PR12MB2883.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ieu8UC3CRsSslbbnotAOt3vsnH2BxAC1rOeY8S8w73zUdriCH7bkQU57lTPYp73LfJhys3AoFsvq2gZpewlBwRv5A30fgxoRfcoYjknm5k0rkxbmkWhTuYkibE9b7DmdlIKLuiaWiCOH3441AC8r4dANMwe5xgrNb3rprPee4tcgmk0rPU8X2GiiysOEtP4R9JsG4erxPaNPe1JSN9mVEmHBrqAnDBLd7fNeDihiDrTm8qklAgYypPowHghRvDOuWdrnlatMHqIAuKRQe7IFQmsZgDoB8cBGeEBjuV6fU/yFZQDjwGk0bGGtpzd4gLE3BirUN4unLvZgRBuLz7bm/XTqHvRxK8bMmmDic4cACa+o10CoL3jIEcdlD12KXc6xb7Kvo1t6KP40M7Vl6ftTN/f5HkKZC5OF1DJNSkAT5pQw64JXEKHlkVAeVuH+9Jy+Gf1JwJeUZs4sVQijxORSUpMichZCtP1yXn+0WVsTH3u57CSBo43CCQvHuHD/1jneaYAS1JjAmR8x0ZXTH7KcgDC7edhD9h3REfJU2cmIkw6MrV2S7fKsZuTtAc/9HMsHBHibLMdJyU0eJoOu+UASHwasiS5BxOX2t9zwrGtsePIlSu45igOJFsUczqJsauyq5IeB23IgIsSgXJ8e8DNKrefmCKRzbeYBLA0YfWM4JumXs8Xf+EU4ZGQyXsN0XmxQArrAiIzlwi08uHtxxzS9h1CCuQyqYBnZCSF7eUTZ6K3tI3yrPAfR+0Ob+3wGKvcY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(31696002)(66476007)(38100700002)(8676002)(4326008)(450100002)(86362001)(31686004)(36756003)(66556008)(6486002)(508600001)(66946007)(8936002)(186003)(6512007)(6666004)(83380400001)(66574015)(6506007)(2906002)(2616005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEU5eXd5NlVKZWs1bHdsTWVMMzdBV3I4azFEOVpJbXVibGw1RUx4S1hIQ0Fa?=
 =?utf-8?B?SjdDZ1FLaDJHMGxaRHN0S28wcTMwWUd5QmFEajlTZWFURzF4cERqcWt0U1pF?=
 =?utf-8?B?M04rV0hXUXlJYXp2OUhudE1kNWZQNmF5VnRkMzEwdit1OTFTWStGS0dIc3N1?=
 =?utf-8?B?VnYybHB5ZmgrSjVralVydVJENXNTelVhSnQ3ZFJrYmFnMXdHdEc0Q1p0TGhh?=
 =?utf-8?B?Q3lIeS9zYndlNVlSSnRTc3JuK0ljVWxJZGtMalNRbW85QUdYOGpIMThGTjB3?=
 =?utf-8?B?TXpNMS9CTkhlM1lCOGhadG81VUNhcUdHWjY3ZVY0ZUZoaTZVRTM4WkQrL3FG?=
 =?utf-8?B?WWo0NnhabDloMktGZVRQZFhpVm52ZFN3RUJnL0FLeDc0VFc5UnhHNHZxMzMy?=
 =?utf-8?B?dkpLSWlWUzdSZEE1b2FzeHNxWDc0TjdVUHlFTE1zcjJuQm5JWHEzWmphbE01?=
 =?utf-8?B?ajc1bmlpV2tPVVBjdGdtK3lJV2xpL2JRS0tQeUZDWUUvczBSREIvZVhWL29B?=
 =?utf-8?B?MU11YkxpSFZ5a3V3SVRGSjJoVHpEcStzdFFTSDhuVmFTSzlNRkFteTk2QWlE?=
 =?utf-8?B?S05oM05FM251VFFzYkdSd3pPTkF2YXNnZzlNWERpUEVld3NhRm1ud1NRYVJw?=
 =?utf-8?B?OGpqdE92aWNqMVpnRFhJSC9UcmlCbnM4S2k4VGFDVzNhb3NkVUlPSUoxSk0x?=
 =?utf-8?B?OFhNdXZLZ1JkbGoyMU0wL2RIZFpWNGVwa0NnNFgycFkzV3hOS0YyZlZBNUxM?=
 =?utf-8?B?ZjBhd0hBN0xSeXN2UFJYYmd4STlaMWwxSmdhaUhWU0dHZDZIUFZSYmd6RGo4?=
 =?utf-8?B?aGlROGdwQ2VtWmdDUmlRa2hXcENPdmlobDVJRWVSV0JIcXRxMmNyU0FkcWdp?=
 =?utf-8?B?aHFkTzExN01hR0VzRldObDRoWFpFeGtXSU9pRnJRbDNzelpveUg0Sk9BaHZk?=
 =?utf-8?B?dENXc1hQeFFSY2xtK0h3cm9aUUtoS2krR3VtWUFwWUJyZnpzcy84TEl0bERL?=
 =?utf-8?B?VlUwd1F4ZjBtSGEvcWZGTnFpamZzVDZpOGpxKytjN2dVbnJoSThFMHJwaEIw?=
 =?utf-8?B?WjAwTFErcFpPczcwOVQ1L0dPOU8xSGtuVkdCS1laaFV3bTFYdTYxRnMwS2pj?=
 =?utf-8?B?cmg3STlRdGg1U2NoTEVzK1FibGdDYW0rYisvSUZkN3Jvdjg2RUVtZkl3NG85?=
 =?utf-8?B?Q3NkWDNsRUZyMDAxNlgxMWdVb1VXSGIrc2hKVFROTnlmQXR6QjAzRnBNYlFW?=
 =?utf-8?B?UVhIZytNV0U1eXNsbGFsbmFFR0xIOHo5SjdkWGhnbUdLcC9kZ1V6SUFEbjd1?=
 =?utf-8?B?SS92UUNQN0hmZXhDZjhJM2YrN2VkTTQvN1FoU3hHYkN1c0NFME1PWWZMZnlz?=
 =?utf-8?B?K0JjUTVVSnZHd243STNrTnBEd0Q2QnVjRGNrZVQ2a05ROVlKSXNsYzYyUjFs?=
 =?utf-8?B?MHVGMmdBajJLUEI5cUtzdm5kR05vdnF6NFJqRUFTaHU3d0tqTXA3OFNzakRK?=
 =?utf-8?B?VTJWS1FVV0srSFY2clY2NXo1VFdBZGdWUlZPUGtGTHZnQkFvQk5KNG1HeEVt?=
 =?utf-8?B?cGpxUkV4cERJK21pUFJuL0FnV0ltSjh5TWloMmxmc2k2NiszY2xGeHRFZFJC?=
 =?utf-8?B?M1RzdGNDYlZyMDlONSt1TnZDSU1UN3FFVWR3Ukpoam83YytKT1pvY1lrdW0r?=
 =?utf-8?B?REI1WDQyYjBuMHBhaktyVkllM3h1cW10SHI2RFhHNW5QSjgxaVJpODYwQWlw?=
 =?utf-8?B?Q09BelVreW9mb1pubUVZM3RRdnJQRHhNUENQVDBLckwzTWhNWkVZekUwOEV3?=
 =?utf-8?B?TnhaV1NXL2pISVVsdEtKZERHenBSQlJQaXdjM2YxVlh4d3dYaXM5R3lRN1BH?=
 =?utf-8?B?YldCcjF6ZkhoKzUveWhXMWRCcUlWV29yOUVua3hxYlh1Q2FBSGxzUDBlWEhU?=
 =?utf-8?B?UzJGK0lSbDJmSXF4RURDY3lwc24rMnBwbkpPc0NQaEtOMk9pT01IYTQxeUxV?=
 =?utf-8?B?Z2l3RG1qUjk4TFFES21RQVIrb2JwNUlqU0pYaXhXeW0yZjVoUEIweFZzUyth?=
 =?utf-8?Q?1eEUP8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0855c4-5eb1-4055-54f4-08da08dc3d1e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 12:38:43.9134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHrbrFu/EiPE/kxM/t+0ybv4pP67tNtA47kTl7U4kA7gHO+WI2zVCqYnhxKboUnD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2883
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.03.22 um 20:11 schrieb Felix Kuehling:
>
> Am 2022-03-17 um 04:21 schrieb Christian König:
>> Am 17.03.22 um 01:20 schrieb Felix Kuehling:
>>> Let amdgpu_vm_handle_moved update all BO VA mappings of BOs reserved by
>>> the caller. This will be useful for handling extra BO VA mappings in
>>> KFD VMs that are managed through the render node API.
>>
>> Yes, that change is on my TODO list for quite a while as well.
>>
>>> TODO: This may also allow simplification of amdgpu_cs_vm_handling. See
>>> the TODO comment in the code.
>>
>> No, that won't work just yet.
>>
>> We need to change the TLB flush detection for that, but I'm already 
>> working on those as well.
>
> Your TLB flushing patch series looks good to me.
>
> There is one other issue, though. amdgpu_vm_handle_moved doesn't 
> update the sync object, so I couldn't figure out I can wait for all 
> the page table updates to finish.

Yes, and inside the CS we still need to go over all the BOs and gather 
the VM updates to wait for.

Not sure if you can do that in the KFD code as well. How exactly do you 
want to use it?

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>
>> Please update the TODO, with that done: Reviewed-by: Christian König 
>> <christian.koenig@amd.com>
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  6 +++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 18 +++++++++++++-----
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  3 ++-
>>>   4 files changed, 21 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index d162243d8e78..10941f0d8dde 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -826,6 +826,10 @@ static int amdgpu_cs_vm_handling(struct 
>>> amdgpu_cs_parser *p)
>>>               return r;
>>>       }
>>>   +    /* TODO: Is this loop still needed, or could this be handled by
>>> +     * amdgpu_vm_handle_moved, now that it can handle all BOs that are
>>> +     * reserved under p->ticket?
>>> +     */
>>>       amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>>>           /* ignore duplicates */
>>>           bo = ttm_to_amdgpu_bo(e->tv.bo);
>>> @@ -845,7 +849,7 @@ static int amdgpu_cs_vm_handling(struct 
>>> amdgpu_cs_parser *p)
>>>               return r;
>>>       }
>>>   -    r = amdgpu_vm_handle_moved(adev, vm);
>>> +    r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
>>>       if (r)
>>>           return r;
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> index 579adfafe4d0..50805613c38c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> @@ -414,7 +414,7 @@ amdgpu_dma_buf_move_notify(struct 
>>> dma_buf_attachment *attach)
>>>             r = amdgpu_vm_clear_freed(adev, vm, NULL);
>>>           if (!r)
>>> -            r = amdgpu_vm_handle_moved(adev, vm);
>>> +            r = amdgpu_vm_handle_moved(adev, vm, ticket);
>>>             if (r && r != -EBUSY)
>>>               DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index fc4563cf2828..726b42c6d606 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -2190,11 +2190,12 @@ int amdgpu_vm_clear_freed(struct 
>>> amdgpu_device *adev,
>>>    * PTs have to be reserved!
>>>    */
>>>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>>> -               struct amdgpu_vm *vm)
>>> +               struct amdgpu_vm *vm,
>>> +               struct ww_acquire_ctx *ticket)
>>>   {
>>>       struct amdgpu_bo_va *bo_va, *tmp;
>>>       struct dma_resv *resv;
>>> -    bool clear;
>>> +    bool clear, unlock;
>>>       int r;
>>>         list_for_each_entry_safe(bo_va, tmp, &vm->moved, 
>>> base.vm_status) {
>>> @@ -2212,17 +2213,24 @@ int amdgpu_vm_handle_moved(struct 
>>> amdgpu_device *adev,
>>>           spin_unlock(&vm->invalidated_lock);
>>>             /* Try to reserve the BO to avoid clearing its ptes */
>>> -        if (!amdgpu_vm_debug && dma_resv_trylock(resv))
>>> +        if (!amdgpu_vm_debug && dma_resv_trylock(resv)) {
>>>               clear = false;
>>> +            unlock = true;
>>> +        /* The caller is already holding the reservation lock */
>>> +        } else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
>>> +            clear = false;
>>> +            unlock = false;
>>>           /* Somebody else is using the BO right now */
>>> -        else
>>> +        } else {
>>>               clear = true;
>>> +            unlock = false;
>>> +        }
>>>             r = amdgpu_vm_bo_update(adev, bo_va, clear, NULL);
>>>           if (r)
>>>               return r;
>>>   -        if (!clear)
>>> +        if (unlock)
>>>               dma_resv_unlock(resv);
>>>           spin_lock(&vm->invalidated_lock);
>>>       }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> index a40a6a993bb0..120a76aaae75 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> @@ -396,7 +396,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device 
>>> *adev,
>>>                 struct amdgpu_vm *vm,
>>>                 struct dma_fence **fence);
>>>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>>> -               struct amdgpu_vm *vm);
>>> +               struct amdgpu_vm *vm,
>>> +               struct ww_acquire_ctx *ticket);
>>>   int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
>>>                   struct amdgpu_device *bo_adev,
>>>                   struct amdgpu_vm *vm, bool immediate,
>>

