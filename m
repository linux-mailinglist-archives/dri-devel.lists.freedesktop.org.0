Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C8D47F8D5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 21:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E8710F184;
	Sun, 26 Dec 2021 20:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B8810F17E;
 Sun, 26 Dec 2021 20:51:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6BgHz5vDRZJd4T8yyO+eDWN+zRN5Ed64lx4ZemDuNomJiOWxhw2YMbMjJ2vx/SFYBKXGjBMeUR7geGdiiZDpGJoZKL4v2bBOJr/GtDsKBTsXVuZu1O6dYCWGIJcb1WAIIk+vBuh2ZUsRK8VEa2dWlWXjKcjAYxoTogEDlQSknOtnzCEzKYdQrdoBZe0/l/yrLYRopD11JIrwa3nubTvBVyyngLRpugcbFh1hj2aT4xpuqMW7D3rzxcSgH0awhWuwA6UlEQ4Ddq5XxOQbaPczdEPjtwFnnTWZWYghn/pTti+0tbTfkl1jVXFpy6JwnUeb+7UW9Axp/qLtsvteDIeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+c8OTizs3Y4SjfIU529bAXorh/A5RrsnkSs3+l7Fxio=;
 b=TQPX494jWFtiN7S/YUD4TPQbiGozH6dCDWXDQqE4W4ZiL3qfbZK8xvvrNjsrzi0xM7g5M66CKGRuvXmvuUQ3ADJuOCskB9I8xwdGMoEnNz2BjNXpP5FB70E2sAS5H0UgbjTpe6WZRLCmb5KFrnhFAf02aCqZuBzUxi2mhyB76BlFiOr7eBVTQC2fMms4VxTzw7Z7Y3g40iENue/YiITs6pz+NWJhsB+PjvZMdHCUp9vSEX4F62EUsdPo15UMhC5hqbpmlFeqTJzJsmB9mI5bwNVTweCsYO2SubhiIOUd7szSTTCgSuh/wm9ixnc5dJ2amL2AszuMDq/dXr3fGraNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+c8OTizs3Y4SjfIU529bAXorh/A5RrsnkSs3+l7Fxio=;
 b=w3kfh14dJTrt+r0Y5c4723aQm3etGzmsIboL2M3RCLcWoi/dnRlF+R12UHt5/vNwLpFfpENcCSwbBUhSqNlX+M5405LNiQqQhjwlHW6K0aJ9FKHRfDQCkG/B1/TDugNr2xelUCuSDYj0524nzvRE2WQNf/AHgzM2JXAjsR0p/vw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL0PR12MB4690.namprd12.prod.outlook.com (2603:10b6:208:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Sun, 26 Dec
 2021 20:51:00 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::98f9:b924:cedc:93ad]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::98f9:b924:cedc:93ad%8]) with mapi id 15.20.4823.022; Sun, 26 Dec 2021
 20:51:00 +0000
Message-ID: <fb3d8dc7-a0ff-f5ec-2fce-75515843eb92@amd.com>
Date: Mon, 27 Dec 2021 02:29:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 2/6] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
 <20211201163938.133226-2-Arunpravin.PaneerSelvam@amd.com>
 <d76d347f-7dcb-546a-efc0-a324d773861c@suse.de>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <d76d347f-7dcb-546a-efc0-a324d773861c@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0100.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::16)
 To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dbdeded-099e-4d6b-529d-08d9c8b16c26
X-MS-TrafficTypeDiagnostic: BL0PR12MB4690:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4690D3DB4B24FD93F1D5656CE4419@BL0PR12MB4690.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuXT4sa8W5Cdxgi07LRlRLLhE8EmHuKNzGgGFCb6g04wceF0H6fHVvp1B2QpNb9UIhx0rNWrOiJCvFQbm3B5Hmq2OyKUOGXHjAN0lZKjQgQ435Ky6q4Ud+7ZIN5+lCHbgr/6YP5ES9o3ia+t9eKjGJuOVDS6jPCcYQ0Rb7mxuqNCzjLWjQGO1txU21YQuDpi222ympiwMuGbWI31mhc+W0/o8W0sjjNnkniypTnSvA3NNcRBUrz33KOvQlbAS3q0keDtzMTMmFTWwfq3UCvskzT5M6z2xN17d7YjV+9nRHxDs9AkZ6ru3yY96L7dyOKt10JCuR0IuWb/9BoRf7YcC+zxl7EZcejSMfbhscuOhcwCvsR+QLGeZijUoicWnwoUiwzacpuA/0UwzdO0eV8dgSgnaMvXaziWUm01FgZUU65AP2dIIuZJT5WdMYrtqm0X/ov4WaCXxGDI2CmG9qA4s1rsQrgIQjTp6f2q3SXEebfNrfAx7IRtGTKrqI00/Hse4/sBzX+KPas2U/g2dsftZ+1Qa5m91MRUg43AXpdrw4WNevFukOeJDRg46PhKmYeDfu4bHo9IuXqcD0u++BWZZ7mA3+qtyuyb7Vq5HFkhI9CxAWtbN1YupQYGUwayz3dx64IoXhpfULz+L5DAntlwguLugr4lBTq5IfcJlBA7eq9H8Cj4Aj0WaYjhcEgYQfeLTY2zjE3YbOy0KUBq74yfYDk8Bl2chQ3rh/hIOnToSNXy7B17ESuQhG09I9mtOJRV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(31686004)(6666004)(6486002)(186003)(2906002)(83380400001)(53546011)(6506007)(4326008)(6512007)(2616005)(86362001)(36756003)(508600001)(66946007)(5660300002)(31696002)(66476007)(38100700002)(26005)(8676002)(8936002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z00wZEhjbENpanBrZlVuelg4ZEZKQ2lBMGgyTTU2ZFhLT1pVNFVmWkI1clpL?=
 =?utf-8?B?UGk0MWFKaWtzbnF2S1pFQTZpbWNJS2RaK1l2ZGFoajAzNHorcXoyZUNiamJq?=
 =?utf-8?B?ajJCZkFSYWcyaXIzbTlmOHJoOFBQUml1YXRWSUo5eTZXODg2WGVuZnVNZFFq?=
 =?utf-8?B?eW9hZG5YY3ZqK0ptbnhkdDgvYUhSNmpRcjFGNHJkTkYrN1BiNkJqOG85N3dv?=
 =?utf-8?B?ZEt2WVZMR0JlRXFoY0ZGZmJrUUxmRVNmNGFQVHhYVi9xczVJMFY0WE4rQ3dq?=
 =?utf-8?B?RmJqTUhnUzZpZkZuNkVaT21qZS9JdmpIbmdlaXdkWnBwRmE0QWo0UklLZWV3?=
 =?utf-8?B?OUlScWtETURDQTVpeFBFMmMvNkNTU09MWnRUTXdCZS9BRWxkSTI5Y0ZKbUNT?=
 =?utf-8?B?U3N3WDk5eTBHamkvZDQwb2JmV1NkZTBJb0VhQXFOWEVMd2VsdHJ4U0U1ajBX?=
 =?utf-8?B?UjV5OTZRd1JuMW1Uc2lDNWpvTFVyZ3B2eU5lTFo0alUxdjJOWFpPRm9LeUli?=
 =?utf-8?B?ZjFITHZUdHpZNGxldHRYWUJWaGlYUUhucmpGSkdPbkEvTzZpZWhyN3g0YjE1?=
 =?utf-8?B?aVlyWmZXV2JqSEp1WitkTVZ0YysxWEI1eHVmTzV4Y29SOXVMRm44N0srUTlI?=
 =?utf-8?B?MzhkcU04N2pERzVrSlAyTnNNRmhVbEU4YXNUcUFWODJuV1ZqNmc4V0psc3Y4?=
 =?utf-8?B?ZVJjRlAydC9vSlhBbHBuT0xjYWdPR0JyVzk0R2YxbXpaZ2tSUUZBQXo3SXJu?=
 =?utf-8?B?RUh4SE9FQy9GSi9QT0I1UzNGRkZSeDRYRjRjczVXVEgxMDBPRWljSmdhQU05?=
 =?utf-8?B?bHdMbTF4SmJueGp4UWkvMy95d2lQaHI0enBVRy9FU05DVUFOclhMT0gzbDhj?=
 =?utf-8?B?Qm8rRjUyZFg3MmtwUkJEcVJVLzZnaEU2SlRldUJOcnllUFZGU3JaYVpFZUNC?=
 =?utf-8?B?djdLdUZieWhmTDJDM29kV2R6U0FCbUFJS05MWVFEeXlTeUpjeFhMSTg5UDdu?=
 =?utf-8?B?b3dlRStxaTBoNkpCby9zS1NTZnFvbzM4dE5pVEJoVVMrWm9KN3dSaHdtQ2VL?=
 =?utf-8?B?WEg5NHlLcC84QUVFZmU3dDRkWThPWGtQT2VodTRTRXZiRXJ5VXViaGZRbVhW?=
 =?utf-8?B?eVlFeldlK1hEK2NvR2l2dWdWdXN5Z1BwQ1BpMGp3ekF0VVFZUG9JNksyRmtK?=
 =?utf-8?B?T0p2Q05EdC9HN1E2Uk83bWNvcXNPeUhCZUFxWGRMVENXWndPTURFblIvRlRu?=
 =?utf-8?B?Y04zcmNFUk9yOCtJNUJiS2FJVU9keGR0MjkrSnBNNE56aFBlYUxaMGoxa3NQ?=
 =?utf-8?B?Wm9pM1RRZ21PeXdtMTZJOHpwTEV1VEo0dmNHUWZBSXFuUGM2UEF1Y2pvc25p?=
 =?utf-8?B?YTBmRlFNUnFocEVJcmhMR2dnNEVET0ZkajNpZndHRVAzOFpmZWZ1dk52cVdC?=
 =?utf-8?B?RXkzTC9RTkEyVU11aHVGaTI0WWpPZ21BYUo3RlcyTnVCd1haTG4yb3U4OGtT?=
 =?utf-8?B?RXYyTWZLbnRSNit1NmNFdWx2OXg5VWtITnFLcnFjZXM2b0Ixdk1hYlhvRTdL?=
 =?utf-8?B?ei9jTE1memhVajY1enArYjVKc0VIV1kwNG1zSjA5RnV2bkxVODc5d3l3a3ZM?=
 =?utf-8?B?M1R4Tlo0cXdzTlYzckZBbHJVdm1mZ0FCSnpDeU1ORHhoMFo5a1d1Tm9VUWlG?=
 =?utf-8?B?aHd5bElKYlpzOWRQRlRCU01Vd2hJMndFZFFPTEFnTVp3UUQ2U044RTI1TElK?=
 =?utf-8?B?TFJNR2FZSzZ4RjR4Q09Ha0VkUUxabWFvTkozSXRPRzhXMmcyemxQQXRYRUNZ?=
 =?utf-8?B?b2xreEdLQU1QVTdnRk1kQ2UwMXU4bmtFdzlXcXc3TGJRK243ek11dEJvejR3?=
 =?utf-8?B?b0paNitOcklETExLZXpvNlkrZFo5TDBRUFVhVGlNblRhK1JoUUZxWWQrYndk?=
 =?utf-8?B?dmdvcC90RE1aWklaL2dUdXFCbW9yV2tKVzV3N21CQjMwVFgxejJWZklTTUJF?=
 =?utf-8?B?cklhenpyOGx3dldGelhaRkdCbURQSWFobmt3aHpFVENwemNmWEpjV0VyTDNE?=
 =?utf-8?B?NmZiWmJFbm5PTGlrVm1rNGcrK2ZpeWVJMUgyNll1QXB1bWxoMHV6aVY1azQ5?=
 =?utf-8?B?enFkMkdmVHJTQng1R00yU2NBRVA4TmRvLzJQQjgyTHBNSHdxaWRRL2JMNTRy?=
 =?utf-8?Q?Fs25IeYk8QJimthhwQlgWsI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbdeded-099e-4d6b-529d-08d9c8b16c26
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2021 20:51:00.2133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTPW+sbxK3NeA5e6dfd3k/URAPs/zyXZ2H2FyjtMbMJmRyZ4B9pyHXnOoTSp4BFDr9bxZOdbgJnxDYuyxMSA6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4690
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas

On 16/12/21 5:05 pm, Thomas Zimmermann wrote:
> Hi
> 
> Am 01.12.21 um 17:39 schrieb Arunpravin:
>> - Make drm_buddy_alloc a single function to handle
>>    range allocation and non-range allocation demands
>>
>> - Implemented a new function alloc_range() which allocates
>>    the requested power-of-two block comply with range limitations
>>
>> - Moved order computation and memory alignment logic from
>>    i915 driver to drm buddy
>>
>> v2:
>>    merged below changes to keep the build unbroken
>>     - drm_buddy_alloc_range() becomes obsolete and may be removed
>>     - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>>     - apply enhanced drm_buddy_alloc() function to i915 driver
>>
>> v3(Matthew Auld):
>>    - Fix alignment issues and remove unnecessary list_empty check
>>    - add more validation checks for input arguments
>>    - make alloc_range() block allocations as bottom-up
>>    - optimize order computation logic
>>    - replace uint64_t with u64, which is preferred in the kernel
>>
>> v4(Matthew Auld):
>>    - keep drm_buddy_alloc_range() function implementation for generic
>>      actual range allocations
>>    - keep alloc_range() implementation for end bias allocations
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>

<SNIP>

>> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>> +
>>   struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>> @@ -132,12 +139,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
>>   
>>   void drm_buddy_fini(struct drm_buddy_mm *mm);
>>   
>> -struct drm_buddy_block *
>> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
> 
> Just a style issue. The structure is called drm_buddy_mm. For 
> consistency, I like to suggest to name all the public interfaces and 
> defines drm_buddy_mm_* instead of just drm_buddy_*.
> 
Thanks for the suggestion, I think renaming drm_buddy_* to
drm_buddy_mm_* creates a long name for the public interfaces, for
instance - drm_buddy_mm_alloc_blocks(),
discussing the style issue internally
@Matthew, @christian - please let me know your opinion

> 
>> -
>> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>> -			  struct list_head *blocks,
>> -			  u64 start, u64 size);
>> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
>> +		    u64 start, u64 end, u64 size,
>> +		    u64 min_page_size,
>> +		    struct list_head *blocks,
>> +		    unsigned long flags);
>>   
>>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
> 
> I'd call those *_alloc_blocks() and _free_blocks(). Right now it sounds 
> as if they allocate and free instances of drm_buddy_mm.
can we call those drm_buddy_alloc_blocks() and drm_buddy_free_blocks()
Does this make sense?
> 
> Best regards
> Thomas
>>   
>>
> 
