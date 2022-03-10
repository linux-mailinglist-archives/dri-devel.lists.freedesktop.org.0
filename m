Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0324D4979
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47AD10E63C;
	Thu, 10 Mar 2022 14:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84AE10E63C;
 Thu, 10 Mar 2022 14:37:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzs/TptyOaqr29bEKkjahLeKyTg8jlub7liAjyotyBRCXgRnOSQUbbHR5yqUydgvfZI9OflbcbJbFZK1IPofGVw9eFZtnm7ZMXHhjYM4jkYFuygZvwBxZpfe/lpm/RvybPnK9hWjRcvYJEkqM7qAsal3rNhPIF0ndnmHJZMWYQAOxk39fTD8+YWabGeGrRGV4YHaDRIAmffgzGnYXDJpUp9nuaGbCfcQ+FE2scOO9/+ks+R298Es234RGeHtJZIEvjFCjyWAdraBJTQlwSgmqu7kMjQ/FF51HP4FjEepj6kV+rpvBOZD15eUie+UjixLCDtmHKoLfIulwHjaB/YbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKPgRuSafq0izgpYdb/jqvuT0ooesQ1sQlbU0PGySr8=;
 b=B19wdQ4Rc9OTdPElDsozTzZcOcgbHRvPJTONFD4lZgc3+cNLBECp1f+fQfMxNhCokwDKTudpXiH9N1JGFgO42auvkT4s05v1H/NWsxRX21GI9Sn9P8FJSTnc7GgyAad0PMxE+dOsV6dEqwRmSXcVy77dK84exzcMNWJM95SGNNz3v7nEfu9BvTSXKKy6phJqadO8bq4d/zKO9TOZsXhyccvP5W89ysf0Sey9BzQtyQv7cxWau3sEWUVnMjVhF0LN+agsH5ptn5KWeYjx2fHu/LT/vM+nyjNlYSP2qB++3jLPdRu7IbCR4HBQKsgIcT99kvb6EMsxxCzNJEyk7mSp6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKPgRuSafq0izgpYdb/jqvuT0ooesQ1sQlbU0PGySr8=;
 b=amleaaedsvI4s6f/QziIMyMD37ZOaJ1BSUmAHLmJfa6ZdII/QFRGRIlA90HdE+OsUyl6TFW6k97JaOn32maOwvNXE1yqZqukvDOVK0DTUedv0VGPJqNMX5wJz3ubXicaDTOT+F0hX9iEBP/1PaiC7eDn6XnXGheEaoXyvY92Ruw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.18; Thu, 10 Mar
 2022 14:37:01 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%6]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 14:37:01 +0000
Message-ID: <02812310-64ed-fc93-beeb-b8ee08ec14b3@amd.com>
Date: Thu, 10 Mar 2022 20:17:49 +0530
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
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <8909011e-d18b-03cd-aeb5-bae10db41a00@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::28) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3058515a-bfaf-45ed-b2ed-08da02a37026
X-MS-TrafficTypeDiagnostic: DM6PR12MB2633:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB26330C8365FD807F8F2F6009E40B9@DM6PR12MB2633.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1bRshx32pxy6VeZDOYqK01y6zeg5aYyyRhqFYc6st0sHYP9KJm0sMd9ro6iGWfYFeAZr6wDG6XMgkvXKcY1OX8D8qVlrvrCOLpr2vft8PuPRPAADtsGsYkDnluqebcY2mg9EPZy1ImEP6dgMTMvPgPlAMRhnKWyGPzfWiHU1OVQw3wtXutIVdWzbJqrYyqkP/moIl/RJEQ1H0qY997vXTohreLCM6Te22SIFRNuoZ9+1nDEkI9U8soMdJTm8T5GOUTn5Y5tHmkPs4a2EMwNUb3U6VgiPj1OJrDtxXDpuqoWUT60Gt0BXsPHuPMNKShxpyvmCgg4RVmYHZP+t16Jyszg4YLIMjetcuhOLIK9db1uElewaxEocMOrIp98hHCce9qR/faAP/t8Ggm7ubHPmRZ+avY9MDRvWX81hVShY3Qtu8HVuAZtoSCyrLlvrYf2sn+ccZmRigDa2M7o7bk3haGL5M96EQ9KRSqdGeRClrvdiZH9U4JWMmmwhrujQdOXx3znKaawn8+IBKWDR8Fus26KyjMi4zqiA7GPBTnYssR2eMwhnslYQJMuSkNgOSvZx2gajd7WSLOyflMS4kZneks73XiXr54VjCJRt96Htrm1QhOtTfpZCB6TjioUigwbIHaFozY0eOe4HgWsJgALSWBacoMS9seXd5GTwc8Oms083rNWYwUfn1FfWQWMXf3kjjPsc82aZhSTFOl3ZVmKiQyabpThtpfM4Zc2q4TgXbtg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(53546011)(508600001)(5660300002)(86362001)(6666004)(2906002)(83380400001)(6486002)(2616005)(4326008)(8676002)(66476007)(36756003)(66946007)(66556008)(38100700002)(186003)(26005)(6506007)(6512007)(316002)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHR2TXdITDJnc1hVOG5RSEQxVlFNL1Q5UW1NT3dLWHV4eVp4YzN6NEdzclh0?=
 =?utf-8?B?WStybXAxeGpXSnlsVjF5TFpnSE9NZUEzek5OR0ZQWHhhUkUxaGV4ODBPNzlR?=
 =?utf-8?B?Tm84OEZ2WjdJamZFYlQ1ZnFpWHZBUU5VQmwrYllEV29qODM4UFU3Mmh6bEFC?=
 =?utf-8?B?a09jNG9uRXhyYkp5dzk1aEsweEtrVVVYdG52MWJXVjlmS0p0MWxjVnZ5ZWdj?=
 =?utf-8?B?bE02L003OFRJalRZaWxFcGFSanlQVW0xbjYydFhpb1lSUTQweEppemw5b3Zu?=
 =?utf-8?B?ZWRhVDJCRmxaT2Z4c3kwMThFam5ybkI0ODZCSWlvek9jYzJkWVJLU1p3Uy9a?=
 =?utf-8?B?WkpYZDdpV1VwV0lML2NidW9jTk9vNVpOa0hHZUQzTmhxb2s2ZFZqZCs4MEZM?=
 =?utf-8?B?L2pWMnpmMlRTNjBsQ1dQNnR2WnJubjM3MCt5M2RNVWJGT2ZMQWRqNU90R05z?=
 =?utf-8?B?ZW12WDIxMnk0elBRc0lLN2t2QjNBZkR3Slp2Z2gzWktVc2d4am1GRmNsOTRp?=
 =?utf-8?B?MmRyTytRditWck5Bbk8yZHRWbHl5bEwrWnhxaFJVZG50UHZsTmNPMjlZMGQr?=
 =?utf-8?B?aUR5a2xRNXZFMlI1d2ZKbjQ2Mk9LYTROY2tXTFBVMWgyMXVJVXlDYTJRNWZ5?=
 =?utf-8?B?bkhLWWtaenVFRXAyUE1GZytWQUxkNUY1UTlEaHUvR2RSR1ZvR0VDQjJ0OW9n?=
 =?utf-8?B?UmJraWNsbDVlc05TS3d2U2ZGMGpxM0ZxREYyRDNaT0cwRWZCVkJqMGd1dVR4?=
 =?utf-8?B?WmpIWmNaZjFyQmgySnVLTGFIMnJlZGxJTmdoS2pOM3JnbS9WcVo4V0ZZUXRk?=
 =?utf-8?B?NU53dVpqTmtkQ3NZRVpxdXk1alc4Y1c5RklxUDFRM0ttODZ0bUtNUHc4Nmwr?=
 =?utf-8?B?RW80SWZDSG4rZjVzQVB3NFU5R2x0V3pOV1cyU0txRGNqRzJISWI3RENEYVph?=
 =?utf-8?B?NGFIY3ZuS2F4WVpXOEluQkNOZEJKeU9COVR0RHRCU2ZQQjhBMFREcllNWEpK?=
 =?utf-8?B?NS9kWjBtZjd3YU5TNUZzVCtUbkMrSWp0N216QXNDM3VsZThzazlLcDVKT2V4?=
 =?utf-8?B?cmxDL1ZSbU9WNTF3YjA4c0RCT0VsazB3NVZFOHNzVVNLUElVWUpNdm9xamV5?=
 =?utf-8?B?bXhpZlYyMWNNUXc3NkNZT0IvUy9vK2dkeExpZFFyanA2b3ZNdkNobEV2NnUw?=
 =?utf-8?B?T3hNeXl5YldLdGc3dlgwN0VqYi9Hdk9LcXFMU0dLVTNTUEV3ZjFtSXNmRWp1?=
 =?utf-8?B?OUFMY1Zia2tBeDBlK3RBcWFEQ3ovaVVjWlFyKzU4aTN5SjMweHFtRzRkalpu?=
 =?utf-8?B?MUNyam0yNUl3NjI3NC9aRU03RElBcllEZ1BMcHJJZnYwQy9HUkJpL1FVTlVP?=
 =?utf-8?B?bTZMMmhMbWxHMWJQWmFHQ2M5UGtIWkoxanBTMzQ3d1RIMlp1Mlp1bHhYQ3N4?=
 =?utf-8?B?bEF4ekpEaDNYaEdIYS9aaisvQzliZnBGY1ptRmthZTJUWUMvcUoveU5BNXBQ?=
 =?utf-8?B?aWtnMG40aVJoR05rMFZEQUk3ZTV0S0ZMYVpwaldtSnFvWVNST21DM0ZONGZC?=
 =?utf-8?B?LzlzVzBGMW1sMG9POUt4OWNJTFNiaCtYUmFHUndlczQwZENNaUZhalJmRjc1?=
 =?utf-8?B?OGE2cnJ6Z3ZmSXZiOU5EaDJ0STh4aC9vVUVPRWNTUURodWlQSHcyZ0M4RjJD?=
 =?utf-8?B?T3o2MWY4bWpuRVJrV2h6dWJVZ0EzRW1VOWpOUHhJMzBnTWtCeVp3Y0ZpeHgy?=
 =?utf-8?B?SklpNXZMTGIxc0NqTU9ISWRBYjJWZWNTMjhrQUVQV3NrRlhvOHpxbDA1ODda?=
 =?utf-8?B?VURaOWdkNFNjTEh1K2x2bjVTN0ZkbThScXhDNXlETFRoY0VTeExIU1BYK1U2?=
 =?utf-8?B?WVhRTWJmMkN3YytvNFBVOGwyc0Rqd0FtdE82WVNiZFhrajNocGc4ZlZCU0pQ?=
 =?utf-8?B?blgxS1hxS3hRRzlhMFYzM2hqMy96MjdlMzVkRWhaSHc2V1NOYmpIVmVzODZw?=
 =?utf-8?B?eUhpZDRHcEp4amw0R3BjSEc4K0p1d2I2VGNydm9vM2ZhWWVlY0JQNXJUamRh?=
 =?utf-8?B?YjljZ3hmMnRYOFpBRStRRVBXb29IRFBGVlBpT0w3R0hzaGVaR2lOay93ck55?=
 =?utf-8?B?Y01FYzFYZGhlSWRoYkphczh1cmU1VUhaaDJjelI3K01GQTJRbDR1NEFXQWVv?=
 =?utf-8?Q?lBq8IjoBAeBZgaWC2OyA/3Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3058515a-bfaf-45ed-b2ed-08da02a37026
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 14:37:01.4292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UL7hCI6devI9XgylM2EXms5D1/NyQxfSQFg7+wqwWWe72WYCQ0J8IKMyzVq4dRxCknQ0FTHxTqfmMHpFWmkkQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2633
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



On 08/03/22 10:31 pm, Matthew Auld wrote:
> On 08/03/2022 13:59, Arunpravin wrote:
>>
>>
>> On 07/03/22 10:11 pm, Matthew Auld wrote:
>>> On 07/03/2022 14:37, Arunpravin wrote:
>>>> place BUG_ON(order < min_order) outside do..while
>>>> loop as it fails Unigine Heaven benchmark.
>>>>
>>>> Unigine Heaven has buffer allocation requests for
>>>> example required pages are 161 and alignment request
>>>> is 128. To allocate the remaining 33 pages, continues
>>>> the iteration to find the order value which is 5 and
>>>> when it compares with min_order = 7, enables the
>>>> BUG_ON(). To avoid this problem, placed the BUG_ON
>>>> check outside of do..while loop.
>>>>
>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_buddy.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index 72f52f293249..ed94c56b720f 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -669,10 +669,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>    	order = fls(pages) - 1;
>>>>    	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>>>    
>>>> +	BUG_ON(order < min_order);
>>>
>>> Isn't the issue that we are allowing a size that is not aligned to the
>>> requested min_page_size? Should we not fix the caller(and throw a normal
>>> error here), or perhaps add the round_up() here instead?
>>>
>> CASE 1:
>> when size is not aligned to the requested min_page_size, for instance,
>> required size = 161 pages, min_page_size = 128 pages, here we have 3
>> possible options,
>> a. AFAIK,This kind of situation is common in any workload,the first
>> allocation (i.e) 128 pages is aligned to min_page_size, Should we just
>> allocate the left over 33 pages (2 pow 5, 2 pow 0) since the caller does
>> know the left over pages are not in min_page_size alignment?
> 
> So IIUC looking at amdgpu_gem_create_ioctl(), userspace can specify some 
> arbitrary physical alignment for an object? Is that not meant to apply 
> to every page/chunk? The above example would only have the correct 
> physical alignment guaranteed for the first chunk, or so, is this the 
> expected ABI behaviour?
> 
I gone through the function amdgpu_gem_create_ioctl(), it reads the
physical alignment in bytes from userspace, does i915 round up the size
value to the alignment or does i915 fails the allocation request if size
is not aligned with min_page_size? If not, I think running unigine
heaven or similar benchmark triggers BUG_ON() on current version of drm
buddy
> Also looking at this some more, the other related bug here is the 
> order-- == min_order check, since it now won't bail when order == 0, 
> leading to order = -1, if we are unlucky...
will add a fix
> 
> Originally, if asking for min_page_size > chunk_size, then the 
> allocation was meant to fail if it can't fill the resource request with 
> pages of at least that size(and also alignment). Or at least that was 
> the original meaning in i915 IIRC.
we can follow the same here too, failing the allocation request if size
is not aligned with min_page_size?

I added a debug print for requested num_pages from userspace and its
alignment request and executed unigine heaven, I see many such instances
where min_page_size is not aligned to the size, how i915 handles such
requests?
> 
>>
>> b. There are many such instances in unigine heaven workload (there would
>> be many such workloads), throwing a normal error would lower the FPS? is
>> it possible to fix at caller application?
>>
>> c. adding the round_up() is possible, but in every such instances we end
>> up allocating extra unused memory. For example, if required pages = 1028
>> and min_page_size = 1024 pages, we end up round up of left over 4 pages
>> to the min_page_size, so the total size would be 2048 pages.
>>
>>> i.e if someone does:
>>>
>>> alloc_blocks(mm, 0, end, 4096, 1<<16, &blocks, flags);
>> CASE 2:
>> I think this case should be detected (i.e) when min_page_size > size,
>> should we return -EINVAL?
>>>
>>> This will still trigger the BUG_ON() even if we move it out of the loop,
>>> AFAICT.
>>>
>>
>> Should we just allow the CASE 1 proceed for the allocation and return
>> -EINVAL for the CASE 2?
>>
>>>> +
>>>>    	do {
>>>>    		order = min(order, (unsigned int)fls(pages) - 1);
>>>>    		BUG_ON(order > mm->max_order);
>>>> -		BUG_ON(order < min_order);
>>>>    
>>>>    		do {
>>>>    			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>>>
>>>> base-commit: 8025c79350b90e5a8029234d433578f12abbae2b
