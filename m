Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E1B4D8C64
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 20:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3370C10E20F;
	Mon, 14 Mar 2022 19:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D9410E11B;
 Mon, 14 Mar 2022 19:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLJ39eckV0TCNznhJ+PJmbU9CWJ1IZuBmCQqRz7EiP1XgHbouCLLubrFBEM5Jj/0byZE3Wo3Fxs5PVCFlXRYXFtleOAVOJ/roXlkgfXK9YrCJliq/8FrfhvqGZmNIs3PrT1FYPYWR4yWDgoREvHuZuLLxnAoMH4ACEMzMxueym+tXcFDO5rehop6mKezrd8Ho+cEWGYdDheXq0svoSdrVqiE2vDB5Z6qQzra+BMmUFLQvq2MOSR1ZkAA92Hgpzg4z0JT0x/IlgVXazbneT1i2D87ha5HCra3ifUbxBVhQadc/m1RovgKwVYow1ePe2rFqCVflHf6cW/Di3dv7H1wyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RngFWZgz5utUA4SxsCfYEhrzfpyxEA9LnfMJzJvOLo4=;
 b=WxKUks0kFG/HEVEV9mW4XWmEFCrv9ojz99tsEBKgL9J7SfkNADX3eYLaakqKReN+N46svXDHsITiT3p6f3C8DJCLyrekDewjVohMPd6D/TiP5prkyciJDdoW+c6BNWgKe/WNfpKn8q8ai57fZBREApc8Tc+0os0ld3gYksqQW5+rsAjVm+TtASe8qTfrVO4qKQ9QAx3PQ8xJwwKIWGZY8C5gb/mPw0sNaiMsBMIcPfr7CCV9C6vwkzslG75Xnh9Q6ieMFVjk5TZO8O+gjeoLca4IfNQWD9uZtD5Io94fdprjrak7jnAjRTvO5KD+jqbXll9BThb5pJ7yver2XUqLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RngFWZgz5utUA4SxsCfYEhrzfpyxEA9LnfMJzJvOLo4=;
 b=SUnItFr+SIReGN08YPDu0l+4oTtxk03CEYDnbLR4XelRjS/zTgKgjsopBQOiJq97DGxAZ1C6rET7LzYluKUCmYjhOf9QUmDKBMH1YuRqEIIIMu8UWXDIWQVm6dAzdTBmz0xpgMIcxJ5uF8FLvflmmzqZa5jIk2/qSy1ZYYR22B8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BN7PR12MB2802.namprd12.prod.outlook.com (2603:10b6:408:25::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Mon, 14 Mar
 2022 19:27:37 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 19:27:36 +0000
Message-ID: <6291e000-73aa-cf18-1674-7ca76e39fdfa@amd.com>
Date: Tue, 15 Mar 2022 01:08:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: remove min_order BUG_ON check
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
 <78232c15-0d0c-3594-ab59-63560e63eb4e@intel.com>
 <1ff8a246-8df9-c098-302c-f73b4425ccbf@amd.com>
 <8909011e-d18b-03cd-aeb5-bae10db41a00@intel.com>
 <02812310-64ed-fc93-beeb-b8ee08ec14b3@amd.com>
 <c3a4f6b5-3f61-4e52-da12-cbbe629fa080@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <c3a4f6b5-3f61-4e52-da12-cbbe629fa080@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0096.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::12)
 To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e49dcbe-802c-4217-1b4e-08da05f0b1e3
X-MS-TrafficTypeDiagnostic: BN7PR12MB2802:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB28024A0D79D714D7ED37BF08E40F9@BN7PR12MB2802.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1APEyrZXxDtMeDKL1p2ld3HpRzkFF+Ju98RjUhhDJ30dp0FpdF2d1p0rP02cXhseqrZDlZeYKaqs6pHh6F+rddS3vSfP7aC9/blz+vYvNuugUAFDMlaJvU8rV/cSNUqqulBVpuNQ2irtUkJ9zE06Lss1VQj5MJeMFAY/+tkBXDbi2/BuEHMcOUofox7zm3GM+mLaIDzyQ2AJsZx1lnGxXl9go2bhT1e3Nyj1eeiAWFqmTZGtmU7YdYPG24TAkNbqDXUtPlcrE05RfmTywAbXICJ93C1YG6R55jJgqiwVa8oUfnFTiT4B4fUeOy08fj0Kxem0b/JWg2HYoHEtUNaFxdUTgomidryeDd5OpSlvUOqkUi/aKd6mEUWYIUTis4nuEsRt1oRNPIS7aA0B+oy/OI6I2kbTaBnEd/Fm5BkQwGSPG1iKRq6PUFbe5H1znPtEzFm8PWIdaakXosl21yMeu8EeNAAA+L/ISBambF2AKPuyZ8nzSlNeHZPhKo6cWQwdkE2eYDEbBJoDFV3NPMuyhCljWp1Ua0yeTzRYywj2YvMR2BgduEygVoUBiXm9puxpQJkT95qcO9xAExM6yrYzJtqItP0FZ6xNGQZPoy8VFpt5f4HnhmqtrTsJqdGN95ukwZzCZ1U2IIJfhNt3W6cDjr2+411LQysxWuElJzh5TELG97E+68ehi1AQY+MGWjKv6X+YEr3cPsdX3eG7DIwKXlFLlH11ogCgHiFHrLs4eLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(316002)(2906002)(31696002)(86362001)(4326008)(8676002)(66476007)(66556008)(6506007)(508600001)(53546011)(8936002)(6666004)(38100700002)(2616005)(6512007)(36756003)(6486002)(5660300002)(26005)(31686004)(186003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlVqTEJSeFRiT05nWHdCUU5memRMVEtINkNuZEU3Y0VBVFc3Mm1rbnYvVkE2?=
 =?utf-8?B?UkhKaVoyQlllVGFVcnRGcU1admhTYlRXTjFKSE9VTHdkQ3F5emZpUmJiUGtS?=
 =?utf-8?B?cVh4RytBSVZUTnhLQkFiZHkzQ0ljWmVxRlZOVmZMbnlILzgvNGVJTVVXdGY2?=
 =?utf-8?B?b2NBcE9DNGk1STNJTnVnKzRqK3l1azlGM1VyazdZaGhMTk1DOWZ5TmVwVmhI?=
 =?utf-8?B?OEN0cGluOGZwZjg1dCtJUXZOWU1IbVVDanFqM2ZxMElIUFNoTjloeDZuUFVH?=
 =?utf-8?B?aEV0dVZLZzZqeG9XWmx5eHlCNWZ1bHM1b25JZ2lqaWlFT1RNK3RwZVhDSHl2?=
 =?utf-8?B?OVBVb1BybVRnZzl6THRPQTJqN0hLSGcxUjJYU0lFa1JrL2xsTTlRbEhUdnFG?=
 =?utf-8?B?ek1VRUs5QUxZTGxpdC9RQU53Y3BoYlBjbURyT0YxZm9ITHlXd0pmRE5kaENU?=
 =?utf-8?B?ZFE3Z1M2a3pTY291TFJlbFI0OEdWTDZVZFBNSERwWWpZb0psVDcxWVI2QzRT?=
 =?utf-8?B?aWlvYjFSSlB5YXBoL0k5aFp4elViRFJvbmpYSGlYd2ZWTGt0bmlYVnJnU21V?=
 =?utf-8?B?OGJBdXVtbXp6ZzZQWEpaQ3huRkhrZ2hDeURJWTMzMk1WRlRsdmcxU3hCR3Vv?=
 =?utf-8?B?VnpCOGYwczM3bmt0UnUxVSs3N3NiZmRNQTY4ZDVkODB0VTRUaEtXQnZaVnJ3?=
 =?utf-8?B?aXluVEd4SkVCWTFKSTg3dDFHNEhlV1Y3eHB4ZzdCd3dyQ1MxWmk3TmkyMGI3?=
 =?utf-8?B?Uml5WGswakFPaFNGanlydTJOd0craDZmZ0pVM3lENDJjRzZaTTdsbjR1dGt1?=
 =?utf-8?B?eHdhVnROVnlBdzlQVXJaMWQxNzZWN2tETitsSTFiRjhWZzRKMWg4NDJYaHg2?=
 =?utf-8?B?TEM1UU40ZjJwSWRhWXlja2tKWTNYQWpCV1M1MEsvMHlMditwdzNOcGVZSkVa?=
 =?utf-8?B?ZE9SanNlZEcvV0xoY0hoeXJKTWkrellrdUR0NENUb1FYcHhFZENzSldTOFo3?=
 =?utf-8?B?eVhHWEt4V0xqM1c3OFFtZFN1Y1o2cCtxRWNJU3VyMkNxd3RUU2g0ZW9BMVdN?=
 =?utf-8?B?YWx0YUdOU3R2cE5PWlQ2RU5yd21rM2ZxZGRxdkRnVWY0aEtCMnpsMjlnMVNF?=
 =?utf-8?B?dk9sVGRSSFkraGo3Z0NHQUQrRDJBUUo2T3JWVzFEQ21nRDVKbmc1VGdlZ3dE?=
 =?utf-8?B?YVA0ZW56WTFxSG9GTFBGM0l6SFdoTGhRNTR0L3FkLzF3TXc5czNnMFFySzNm?=
 =?utf-8?B?MTlpQ1h0S01XWGtYeG9Zb0tPSnpJRzMwVXZLd041N0taZEhNalkzR2FIZUxM?=
 =?utf-8?B?TzZ3dFd5UGUxWXUwWUVVUC9CYnBjS3hsdlhUWUhWQUk5VmI3ay92ZC9OSjNE?=
 =?utf-8?B?SHhVeHY5UTV0YU1nRVZRWUsyOGFvY2xjb2RrYktVZ0pFdnh6K0paYkEvVnZV?=
 =?utf-8?B?UEtObVhyd21rRFdyQ2c2RUxRQ21Rb1hlWWwwSWd6RnMwS0JnNEJ0bHUvQWNK?=
 =?utf-8?B?UHpybHJkR1ZUTEFVVmxCVXNualpCcStsMXdXNk52RWx1bzkrL28wZ21JUkZ1?=
 =?utf-8?B?ZTR5MS9uL0hDWVBmb3NFY2hCc05JY1FTSVA5V0J2QmxrL3RSU0oxaU53eHQ1?=
 =?utf-8?B?TnRRZ1FJME5TVVVPVjcrRDFFbHRPaDhTWk1aajF1bHI3MDFEaWtjbnd0ajlv?=
 =?utf-8?B?SnZqREx1bDZoblFQU0RySmpvZEU4Zkk3UmdueVFBcHdQU0Fhb1UzeGdoT1o5?=
 =?utf-8?B?bTA3WlQ5N0JVREZjdnZMZmJsQk83SFBXc2VEalhScUVlT0IxTU05VmwvcW5k?=
 =?utf-8?B?aDVjUHh4S0l1VHVjU2ZtaGVIQ3Eyd3cvdmh2Z0docmRTaGlLV01qZjgrVmhj?=
 =?utf-8?B?OVU3QkhzZ3c4dFJ3THl2N1JJWTd4ZGErNkZaZnlzQUF2TmpuYTFsMzdoUHJW?=
 =?utf-8?Q?2GPw5JfeuStKvfF4IkGZU+LQol6m+oxL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e49dcbe-802c-4217-1b4e-08da05f0b1e3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 19:27:36.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KF700ggfUaQUL1t7wSkTn/o4uOqipUy9nT4Y9bODVkvmIpK/GLxBTDQ/vKnr/bBF3ihO9EtaRRAlFAQEwqfL7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2802
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/03/22 8:59 pm, Matthew Auld wrote:
> On 10/03/2022 14:47, Arunpravin wrote:
>>
>>
>> On 08/03/22 10:31 pm, Matthew Auld wrote:
>>> On 08/03/2022 13:59, Arunpravin wrote:
>>>>
>>>>
>>>> On 07/03/22 10:11 pm, Matthew Auld wrote:
>>>>> On 07/03/2022 14:37, Arunpravin wrote:
>>>>>> place BUG_ON(order < min_order) outside do..while
>>>>>> loop as it fails Unigine Heaven benchmark.
>>>>>>
>>>>>> Unigine Heaven has buffer allocation requests for
>>>>>> example required pages are 161 and alignment request
>>>>>> is 128. To allocate the remaining 33 pages, continues
>>>>>> the iteration to find the order value which is 5 and
>>>>>> when it compares with min_order = 7, enables the
>>>>>> BUG_ON(). To avoid this problem, placed the BUG_ON
>>>>>> check outside of do..while loop.
>>>>>>
>>>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/drm_buddy.c | 3 ++-
>>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>>>> index 72f52f293249..ed94c56b720f 100644
>>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>>> @@ -669,10 +669,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>>>     	order = fls(pages) - 1;
>>>>>>     	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>>>>>     
>>>>>> +	BUG_ON(order < min_order);
>>>>>
>>>>> Isn't the issue that we are allowing a size that is not aligned to the
>>>>> requested min_page_size? Should we not fix the caller(and throw a normal
>>>>> error here), or perhaps add the round_up() here instead?
>>>>>
>>>> CASE 1:
>>>> when size is not aligned to the requested min_page_size, for instance,
>>>> required size = 161 pages, min_page_size = 128 pages, here we have 3
>>>> possible options,
>>>> a. AFAIK,This kind of situation is common in any workload,the first
>>>> allocation (i.e) 128 pages is aligned to min_page_size, Should we just
>>>> allocate the left over 33 pages (2 pow 5, 2 pow 0) since the caller does
>>>> know the left over pages are not in min_page_size alignment?
>>>
>>> So IIUC looking at amdgpu_gem_create_ioctl(), userspace can specify some
>>> arbitrary physical alignment for an object? Is that not meant to apply
>>> to every page/chunk? The above example would only have the correct
>>> physical alignment guaranteed for the first chunk, or so, is this the
>>> expected ABI behaviour?
>>>
>> I gone through the function amdgpu_gem_create_ioctl(), it reads the
>> physical alignment in bytes from userspace, does i915 round up the size
>> value to the alignment or does i915 fails the allocation request if size
>> is not aligned with min_page_size? If not, I think running unigine
>> heaven or similar benchmark triggers BUG_ON() on current version of drm
>> buddy
> 
> i915 will always round_up the obj->base.size as per the 
> default_page_size. But in our case the default_page_size is selected by 
> the kernel, which is always either PAGE_SIZE, or 64K on some platforms, 
> due to the HW having some minimum GPU page-size for mapping VRAM pages. 
> We don't currently have anything similar to 
> amdgpu_gem_create_in.alignment, where userspace can request some 
> arbitrary physical alignment.
> 
>>> Also looking at this some more, the other related bug here is the
>>> order-- == min_order check, since it now won't bail when order == 0,
>>> leading to order = -1, if we are unlucky...
>> will add a fix
>>>
>>> Originally, if asking for min_page_size > chunk_size, then the
>>> allocation was meant to fail if it can't fill the resource request with
>>> pages of at least that size(and also alignment). Or at least that was
>>> the original meaning in i915 IIRC.
>> we can follow the same here too, failing the allocation request if size
>> is not aligned with min_page_size?
> 
> Yeah, seems reasonable to me.
I had internal discussion with Christian and he suggested to round_up
the size to the alignment and trim the block to the required original
size. I have sent the patch, please review.

Thanks,
Arun
> 
>>
>> I added a debug print for requested num_pages from userspace and its
>> alignment request and executed unigine heaven, I see many such instances
>> where min_page_size is not aligned to the size, how i915 handles such
>> requests?
>>>
>>>>
>>>> b. There are many such instances in unigine heaven workload (there would
>>>> be many such workloads), throwing a normal error would lower the FPS? is
>>>> it possible to fix at caller application?
>>>>
>>>> c. adding the round_up() is possible, but in every such instances we end
>>>> up allocating extra unused memory. For example, if required pages = 1028
>>>> and min_page_size = 1024 pages, we end up round up of left over 4 pages
>>>> to the min_page_size, so the total size would be 2048 pages.
>>>>
>>>>> i.e if someone does:
>>>>>
>>>>> alloc_blocks(mm, 0, end, 4096, 1<<16, &blocks, flags);
>>>> CASE 2:
>>>> I think this case should be detected (i.e) when min_page_size > size,
>>>> should we return -EINVAL?
>>>>>
>>>>> This will still trigger the BUG_ON() even if we move it out of the loop,
>>>>> AFAICT.
>>>>>
>>>>
>>>> Should we just allow the CASE 1 proceed for the allocation and return
>>>> -EINVAL for the CASE 2?
>>>>
>>>>>> +
>>>>>>     	do {
>>>>>>     		order = min(order, (unsigned int)fls(pages) - 1);
>>>>>>     		BUG_ON(order > mm->max_order);
>>>>>> -		BUG_ON(order < min_order);
>>>>>>     
>>>>>>     		do {
>>>>>>     			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>>>>>
>>>>>> base-commit: 8025c79350b90e5a8029234d433578f12abbae2b
