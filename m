Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1693A49D476
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 22:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F8610E433;
	Wed, 26 Jan 2022 21:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6090E10E367;
 Wed, 26 Jan 2022 21:26:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6IPrsmgpa965Su6+q4k+4gglNZdIzsYo04m1lWCCexaZsB7SS49gwfrWL88m0EO1xoBuWyPjU1vBvEOE551ENYGF6WRpQNJ5TLBYPCTlqMjIIs4CBsK4SvC4EFb1ZFSsBhO9eXX/fBb6VMZTR/NY9EUrxd72A3j0IU26JdTDqqCYPkFq0Ewel3NztMkt8T0RsnszF8m4e5MKhPCpooGvdHalbJMPCotfFs2oP9TGQpjYr3rUQlwuB9aDUiL5DQqoUpbl37sxquf7eIFXH0GvBFTobq+9VuDZUDqH21nAdQw7R8k77oqEyOk0MNPgm+qUb0CiBn4H53IHU+eSNCNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQmxeSsNnpUfk36omNZTD5Ae7QHkWAoRCNsWrBqSLag=;
 b=FqNLiJu57KRMT1YH/6bh5fFJb4NtggbxlUKDXNS24Y0gN90+lhCiBzKDrsO3VKNupmAj8ZdNZcrxp0nvg7PGJBwdwMskTpB+PP9t78+KAVgRxVMjFinJH4/ozOR2YIBCE2Gb0lgcaed08ykw261OPRDYd2eRGPijDUv/YnRSU5aQA7OmIu5vs5673PWVr6j+T8Gkuop+3alCkPfadJthMbb+F7stRG6jrq3IT9i27AA1JeazRgBI8wB9+GC0cOxvnQ1/vpHI3+GV5Wht3dhpnp1PZxaKh/zDpasRag4XesTo3on3wsltJzqLPNrx/2r6Eh19xCIsqgcgiBIlWd4yCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQmxeSsNnpUfk36omNZTD5Ae7QHkWAoRCNsWrBqSLag=;
 b=FYd9Ht6qnMSOtXg7Rge36yxH14LN0OuHIlHoWfLLIyMc8ZeGSrRhAgXpnjSlqgkDxDD+Nfig//F/HBaChlgLh3rESEmA3JvTfQophYJMJ+pRUVcdEIotOcY85VgH0q0Kc4QLR2qPu6OdyNxibk9TB+ZVjEUEf5DuYIThrd0suWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL1PR12MB5253.namprd12.prod.outlook.com (2603:10b6:208:30b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 26 Jan
 2022 21:26:17 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6%4]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 21:26:16 +0000
Message-ID: <da58a1da-327c-929f-d1d9-159744d68864@amd.com>
Date: Thu, 27 Jan 2022 03:04:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 2/6] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220119113718.3311-1-Arunpravin.PaneerSelvam@amd.com>
 <230e6d6c-99c0-642f-f02a-7f5673b6e66c@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <230e6d6c-99c0-642f-f02a-7f5673b6e66c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f02e123-2508-4faa-43a3-08d9e1127c7c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5253:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB525313400277A653993A783CE4209@BL1PR12MB5253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUcsfTOCEImiDI4aBRh8fHxvbTLnkgmTOBOH2EZz1IkZXkpStso0dD3Hghiiacjo93ug2kOIasWl6eKDl7XNKuC4kI80ukZyYmtFlTDbAlxisFloRr+LnF08e+McY3euRLK9Z+s9ffwE4P2rPS4AB+gtG5JUN4SlRvtUj8DqnpMbtaorSW7CTKLVIFGYhYdUiN7SJQQZ7aBbe39OU/V7cllObsAlhYqcUd8lIT+RlYWSkHUqZYYHLmmmo/YW/2+7SNy1Sj9lyXxcQeJkKusM1Or+Eo6V46YqCWcBZ6GxpFrCqrSMBHUiQ2GjZFbfp6fJC74J63ew2Z66tdFnVM4TfsocI42rW1Yu+G3UJ9GR9CCaoRrx0kFJibEmmAMALw/lDQVyWv+0gdt3qiO0rPmKJFc3a2YFbHSmXKHuNDBMpE3cTizHMT3xjesBdInbFuYJrvqDXppXXSUahsj/6BzvJkL+6UbWQMRuvkHsrmqbJvSPJoOMocf/49vcZx+pZAyfwWg4nQ3uodCA5LWmk7Y8xculpactBrO5K0+bk9kv9Nk5wyBCFUijMJcU61aUdIvH900/jAPd0zLKoIE7eeUnYopcN2iWOdZExJTRLGZ7Pvv8B3ANQMpYqLA6TxlUZzRp3gJB7xrNABXp29rATVz4jCxa8fWDbTNH+YP9Y6UEmkELfO4zkjm6i7WTTrEfogvBz8Unw/mCTdtbQTFMKlkElBy1m2Zve5LjEmwr6wG1tuYIC7YAc8cx8+lVgVTkbd9e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(30864003)(31696002)(36756003)(966005)(6512007)(66946007)(86362001)(6666004)(2906002)(38100700002)(8936002)(8676002)(6486002)(83380400001)(26005)(31686004)(316002)(66476007)(66556008)(508600001)(186003)(5660300002)(2616005)(4326008)(45080400002)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmYzMVBuSnVWU0ZBdEJpM2d3UlpJeGJ0Q2RWQTlFMXNRVTJvWmVCcEIwY05n?=
 =?utf-8?B?NTdZT1YwbldDcXUwcXhHckNCN0NodVdRZHYvK1lIR2hVOU85Z1h3TFFSUkQx?=
 =?utf-8?B?RHEzNWUyQk1ncWpnSXlzT09la3ovTWJrQTJhODkrUkZHRTY4d1N3ekZiMUl6?=
 =?utf-8?B?MTgvZE84OFZ4d21XdGdFSXpMRE52ZzY2QUEzTU1pVU1lQmZpVDBBdDVVY09N?=
 =?utf-8?B?aW51VXRyUzdBYjhkTWR1dlZGZHpqcEpIaUs1SnpsTWxLenlEdnRJK280OTln?=
 =?utf-8?B?N0psbWdrWG1iRnV3dXkyQVNYN2RHazNSNmlMay9hOFlTOU9XaWxMV3hQL1Yw?=
 =?utf-8?B?YkxlLzNlbXFidnpBYzVSdDZUZE5XZXpJRGlLbXdPc0F0VWxscFJaS1lCUFEx?=
 =?utf-8?B?UnozWUFhRk5Qb0ZDZFI3K2p0YnhXODgrL2JEbm5mekgreUNLclZMQ1JlaFg0?=
 =?utf-8?B?aTdyL1dTbUxDMmJSU1dFSUhQdGFua0RFV1M5emZOeGxGbEJKeWY3MnR0WXF6?=
 =?utf-8?B?LzhnMVdIdkxCVGxqRzBtZ3dSUFhBRktHK3NGUDVXQndjM2VWRXlrL0FldEY5?=
 =?utf-8?B?SDBDbXhUbXlhWEgwaG93NkNqWEpIK0FVcVpaMU1DaE91YXQxK1pkb1dNaDNw?=
 =?utf-8?B?UDRjWDhHL3plQlorWCtzeHcxQlBFNU9JS3FQdTJOSHh3ZWxsd2ZpYkFnekRK?=
 =?utf-8?B?N2dWUUwvMFVrcmlXVFlTWlBNUnNKd2VHOFZUVEJvQmVlb1dyVjkvUDNwc2Vx?=
 =?utf-8?B?RnRaSGN2bjdURnVOVitkSkFYQS9MVWVibHFtNDhYdk5YdDhKeEhGVXFEUjJ4?=
 =?utf-8?B?dnJNekE1bkM0RG9MekhsUTNWRm1XcldPMDAvaERaSWdFYVdMeXBKR1IrS013?=
 =?utf-8?B?Zk85Z3ZVTWY1VDR1T2l5aGdJd0FvOGovR3BzbHBkMDR6QVY3YVg1QTdkT29t?=
 =?utf-8?B?cXk2eU5id3N3dHplQmtoOWpkQ0tuSkh4YndEQXZ4Q3BoM3F3Z3pMdFUzdlFq?=
 =?utf-8?B?YUxTSUxuSnZHVUg1bENsb0htTldqNnowK3p6ZFVQSkhZb3VOdTYrRDdtVnZn?=
 =?utf-8?B?a1N6djVoc2VSTnh0VU9EK1hzd2FEdnVWT1owSGlTcHlBMWNpU3pXQXQ4c0dH?=
 =?utf-8?B?YWZHK0JLaWRwc1RpL2RRN284cEtIa2pSRU50TDJvd3ZvcC80SURXaVoxT0dV?=
 =?utf-8?B?aUJ5KzV1SzdiNkVRYVR5dmoyUmlWd3Nla1FlT3B0Mkw3T0U2ZXVWQjhlSVR3?=
 =?utf-8?B?T3NJSHJ3c3ROblU2aFI5TXN4Nk1YTndIa2Q5YVliWExKRUQ0cXRKNndCdm15?=
 =?utf-8?B?MVBLajlDWVhmSU5YeWpRREppcVNrQkM5QTExUVNlYldPQUNrUWE0R1BLZUlY?=
 =?utf-8?B?bnowa0s5ZUhkNFZiT2dHR0gyd0IzbW1FMmg2dWlyb202VHYwcXpFY0hkc014?=
 =?utf-8?B?UlRtc3Z4SjNjMUNjU2k2aEV5dGdhWG1FSytPbjN3VWViNEdZV01yTHg2cUp3?=
 =?utf-8?B?YmFPcTRjejQybGVLSC91eHRERXF4TWpTcGEwdzYrZjhBbEpaS0tRK0hPTnhz?=
 =?utf-8?B?ZjVOTXhFSHVEZmFoV0Q1YWg4eFROMUoxTGtBNW9udUpIRkJiYWFOcC9MSnI2?=
 =?utf-8?B?dFU5UDNlREtBUXV2c0tVVTB1N2V5UUFrTDM4WHJ5bGx0SkhMa1lwWkxtVk5N?=
 =?utf-8?B?Uzc3NE1wNmlZOHhOUWo2a0tLRnlQQkY0WUZVMzZBMkN5bVdWSDI1M25TM3dw?=
 =?utf-8?B?MHJJSUFJVXhPOHpFNWxoYUpFb3owSzB6TXRTNWMwamVPdVkzNlVxNFJsMTNE?=
 =?utf-8?B?eS92NlhyWUdQYXdtc0hOdkJiZ3J2bzZPUVdHeDVpNXNEc3FSSm5EaEN1d0F0?=
 =?utf-8?B?d3JzTC9jZlhQcEtENEErVUFrbytrRlIzci9HRjNZeDk1NmdCT0ExZHlOYmVM?=
 =?utf-8?B?aGEydmRyTUpmVCtpR1gvWVdlQXpKMG1EZGs2dlFrNGZEWmpKa1lRZms4Nm4y?=
 =?utf-8?B?dk9HN0FTOVpoVGZVTmt5MW5DY3lRa2FLNjJaWW4rLy9CZFhTL3FNYm94M3dY?=
 =?utf-8?B?VGlQZzI5V3BrMDdTcXhiQ2VSNS80MXhYNCs4UGpaSkFyQkY1dGRaTE1HM1hi?=
 =?utf-8?B?a2lpaWRhNG92MUgrUlVVQ2R5eXNDWXovdEJFUW5UYTBRUGdmRXJReVYvc0Vk?=
 =?utf-8?Q?znra0FRfbsSlMh1KkaaxGNo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f02e123-2508-4faa-43a3-08d9e1127c7c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 21:26:16.8515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HKDaWiC2YWyiiXSRbRJJDMKT+s6lzKKPdqW4SzGQKGVm1cLUkeA7nvA7bhxYUdzxzj3RwO0lWF3lwEy7kPGFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5253
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21/01/22 5:30 pm, Matthew Auld wrote:
> On 19/01/2022 11:37, Arunpravin wrote:
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
>> v5(Matthew Auld):
>>    - modify drm_buddy_alloc() passing argument place->lpfn to lpfn
>>      as place->lpfn will currently always be zero for i915
>>
>> v6(Matthew Auld):
>>    - fixup potential uaf - If we are unlucky and can't allocate
>>      enough memory when splitting blocks, where we temporarily
>>      end up with the given block and its buddy on the respective
>>      free list, then we need to ensure we delete both blocks,
>>      and no just the buddy, before potentially freeing them
> 
> Hmm, not sure we really want to squash existing bug fixes into this 
> patch. Perhaps bring in [1] to the start of your series? i915_buddy is 
> gone now. Alternatively I can resend such that it applies on top 
> drm_buddy. Your choice.
> 
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F469806%2F%3Fseries%3D98953%26rev%3D1&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7Ce451a48532e74b6c138408d9dcd5aef0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637783632587526317%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=0UoMVUwlwpu8AbB%2BgJrmRBEc7VPt8aAcraRnWkU83ag%3D&amp;reserved=0
> 

I will revert this fix in v10, please resend on top drm_buddy
>>
>>    - fix warnings reported by kernel test robot <lkp@intel.com>
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c                   | 326 +++++++++++++-----
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++--
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>>   include/drm/drm_buddy.h                       |  22 +-
>>   4 files changed, 293 insertions(+), 124 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index d60878bc9c20..954e31962c74 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -282,23 +282,99 @@ void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_list);
>>   
>> -/**
>> - * drm_buddy_alloc_blocks - allocate power-of-two blocks
>> - *
>> - * @mm: DRM buddy manager to allocate from
>> - * @order: size of the allocation
>> - *
>> - * The order value here translates to:
>> - *
>> - * 0 = 2^0 * mm->chunk_size
>> - * 1 = 2^1 * mm->chunk_size
>> - * 2 = 2^2 * mm->chunk_size
>> - *
>> - * Returns:
>> - * allocated ptr to the &drm_buddy_block on success
>> - */
>> -struct drm_buddy_block *
>> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>> +{
>> +	return s1 <= e2 && e1 >= s2;
>> +}
>> +
>> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>> +{
>> +	return s1 <= s2 && e1 >= e2;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +alloc_range_bias(struct drm_buddy *mm,
>> +		 u64 start, u64 end,
>> +		 unsigned int order)
>> +{
>> +	struct drm_buddy_block *block;
>> +	struct drm_buddy_block *buddy;
>> +	LIST_HEAD(dfs);
>> +	int err;
>> +	int i;
>> +
>> +	end = end - 1;
>> +
>> +	for (i = 0; i < mm->n_roots; ++i)
>> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>> +
>> +	do {
>> +		u64 block_start;
>> +		u64 block_end;
>> +
>> +		block = list_first_entry_or_null(&dfs,
>> +						 struct drm_buddy_block,
>> +						 tmp_link);
>> +		if (!block)
>> +			break;
>> +
>> +		list_del(&block->tmp_link);
>> +
>> +		if (drm_buddy_block_order(block) < order)
>> +			continue;
>> +
>> +		block_start = drm_buddy_block_offset(block);
>> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>> +
>> +		if (!overlaps(start, end, block_start, block_end))
>> +			continue;
>> +
>> +		if (drm_buddy_block_is_allocated(block))
>> +			continue;
>> +
>> +		if (contains(start, end, block_start, block_end) &&
>> +		    order == drm_buddy_block_order(block)) {
>> +			/*
>> +			 * Find the free block within the range.
>> +			 */
>> +			if (drm_buddy_block_is_free(block))
>> +				return block;
>> +
>> +			continue;
>> +		}
>> +
>> +		if (!drm_buddy_block_is_split(block)) {
>> +			err = split_block(mm, block);
>> +			if (unlikely(err))
>> +				goto err_undo;
>> +		}
>> +
>> +		list_add(&block->right->tmp_link, &dfs);
>> +		list_add(&block->left->tmp_link, &dfs);
>> +	} while (1);
>> +
>> +	return ERR_PTR(-ENOSPC);
>> +
>> +err_undo:
>> +	/*
>> +	 * We really don't want to leave around a bunch of split blocks, since
>> +	 * bigger is better, so make sure we merge everything back before we
>> +	 * free the allocated blocks.
>> +	 */
>> +	buddy = get_buddy(block);
>> +	if (buddy &&
>> +	    (drm_buddy_block_is_free(block) &&
>> +	     drm_buddy_block_is_free(buddy))) {
>> +		list_del(&block->link);
>> +		__drm_buddy_free(mm, block);
>> +	}
>> +	return ERR_PTR(err);
>> +}
>> +
>> +static struct drm_buddy_block *
>> +alloc_from_freelist(struct drm_buddy *mm,
>> +		    unsigned int order,
>> +		    unsigned long flags)
>>   {
>>   	struct drm_buddy_block *block = NULL;
>>   	unsigned int i;
>> @@ -320,78 +396,30 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>>   	while (i != order) {
>>   		err = split_block(mm, block);
>>   		if (unlikely(err))
>> -			goto out_free;
>> +			goto err_undo;
>>   
>> -		/* Go low */
>> -		block = block->left;
>> +		block = block->right;
>>   		i--;
>>   	}
>> -
>> -	mark_allocated(block);
>> -	mm->avail -= drm_buddy_block_size(mm, block);
>> -	kmemleak_update_trace(block);
>>   	return block;
>>   
>> -out_free:
>> -	if (i != order)
>> +err_undo:
>> +	if (i != order) {
>> +		list_del(&block->link);
>>   		__drm_buddy_free(mm, block);
>> +	}
>>   	return ERR_PTR(err);
>>   }
>> -EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>> -
>> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>> -{
>> -	return s1 <= e2 && e1 >= s2;
>> -}
>>   
>> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>> -{
>> -	return s1 <= s2 && e1 >= e2;
>> -}
>> -
>> -/**
>> - * drm_buddy_alloc_range - allocate range
>> - *
>> - * @mm: DRM buddy manager to allocate from
>> - * @blocks: output list head to add allocated blocks
>> - * @start: start of the allowed range for this block
>> - * @size: size of the allocation
>> - *
>> - * Intended for pre-allocating portions of the address space, for example to
>> - * reserve a block for the initial framebuffer or similar, hence the expectation
>> - * here is that drm_buddy_alloc_blocks() is still the main vehicle for
>> - * allocations, so if that's not the case then the drm_mm range allocator is
>> - * probably a much better fit, and so you should probably go use that instead.
>> - *
>> - * Note that it's safe to chain together multiple alloc_ranges
>> - * with the same blocks list
>> - *
>> - * Returns:
>> - * 0 on success, error code on failure.
>> - */
>> -int drm_buddy_alloc_range(struct drm_buddy *mm,
>> -			  struct list_head *blocks,
>> -			  u64 start, u64 size)
>> +static int __alloc_range(struct drm_buddy *mm,
>> +			 struct list_head *dfs,
>> +			 u64 start, u64 size,
>> +			 struct list_head *blocks)
>>   {
>>   	struct drm_buddy_block *block;
>>   	struct drm_buddy_block *buddy;
>> -	LIST_HEAD(allocated);
>> -	LIST_HEAD(dfs);
>>   	u64 end;
>>   	int err;
>> -	int i;
>> -
>> -	if (size < mm->chunk_size)
>> -		return -EINVAL;
>> -
>> -	if (!IS_ALIGNED(size | start, mm->chunk_size))
>> -		return -EINVAL;
>> -
>> -	if (range_overflows(start, size, mm->size))
>> -		return -EINVAL;
>> -
>> -	for (i = 0; i < mm->n_roots; ++i)
>> -		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>   
>>   	end = start + size - 1;
>>   
>> @@ -399,7 +427,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>   		u64 block_start;
>>   		u64 block_end;
>>   
>> -		block = list_first_entry_or_null(&dfs,
>> +		block = list_first_entry_or_null(dfs,
>>   						 struct drm_buddy_block,
>>   						 tmp_link);
>>   		if (!block)
>> @@ -426,7 +454,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>   
>>   			mark_allocated(block);
>>   			mm->avail -= drm_buddy_block_size(mm, block);
>> -			list_add_tail(&block->link, &allocated);
>> +			list_add_tail(&block->link, blocks);
>>   			continue;
>>   		}
>>   
>> @@ -436,11 +464,10 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>   				goto err_undo;
>>   		}
>>   
>> -		list_add(&block->right->tmp_link, &dfs);
>> -		list_add(&block->left->tmp_link, &dfs);
>> +		list_add(&block->right->tmp_link, dfs);
>> +		list_add(&block->left->tmp_link, dfs);
>>   	} while (1);
>>   
>> -	list_splice_tail(&allocated, blocks);
> 
> Maybe keep this. That way it will be consistent with what 
> drm_buddy_alloc_blocks is doing? Otherwise if there is a good reason for 
> dropping this, then we should also make drm_buddy_alloc_blocks do the 
> same thing. At the moment if chaining allocations with the same list, 
> this will also nuke the existing nodes if we ever hit err_free, but the 
> other path leaves the existing nodes untouched, AFAIK.
> 

changes are added to v10

>>   	return 0;
>>   
>>   err_undo:
>> @@ -452,14 +479,149 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>   	buddy = get_buddy(block);
>>   	if (buddy &&
>>   	    (drm_buddy_block_is_free(block) &&
>> -	     drm_buddy_block_is_free(buddy)))
>> +	     drm_buddy_block_is_free(buddy))) {
>> +		list_del(&block->link);
>>   		__drm_buddy_free(mm, block);
>> +	}
>> +
>> +err_free:
>> +	drm_buddy_free_list(mm, blocks);
>> +	return err;
>> +}
>> +
>> +/**
>> + * __drm_buddy_alloc_range - actual range allocation
>> + *
>> + * @mm: DRM buddy manager to allocate from
>> + * @start: start of the allowed range for this block
>> + * @size: size of the allocation
>> + * @blocks: output list head to add allocated blocks
>> + *
>> + * Intended for pre-allocating portions of the address space, for example to
>> + * reserve a block for the initial framebuffer or similar
>> + *
>> + * Note that it's safe to chain together multiple alloc_ranges
>> + * with the same blocks list
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>> +				   u64 start,
>> +				   u64 size,
>> +				   struct list_head *blocks)
>> +{
>> +	LIST_HEAD(dfs);
>> +	int i;
>> +
>> +	for (i = 0; i < mm->n_roots; ++i)
>> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>> +
>> +	return __alloc_range(mm, &dfs, start, size, blocks);
>> +}
>> +
>> +/**
>> + * drm_buddy_alloc_blocks - allocate power-of-two blocks
>> + *
>> + * @mm: DRM buddy manager to allocate from
>> + * @start: start of the allowed range for this block
>> + * @end: end of the allowed range for this block
>> + * @size: size of the allocation
>> + * @min_page_size: alignment of the allocation
>> + * @blocks: output list head to add allocated blocks
>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>> + *
>> + * alloc_range_bias() called on range limitations, which traverses
>> + * the tree and returns the desired block.
>> + *
>> + * alloc_from_freelist() called when *no* range restrictions
>> + * are enforced, which picks the block from the freelist.
>> + *
>> + * blocks are allocated in order, the order value here translates to:
>> + *
>> + * 0 = 2^0 * mm->chunk_size
>> + * 1 = 2^1 * mm->chunk_size
>> + * 2 = 2^2 * mm->chunk_size
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>> +			   u64 start, u64 end, u64 size,
>> +			   u64 min_page_size,
>> +			   struct list_head *blocks,
>> +			   unsigned long flags)
>> +{
>> +	struct drm_buddy_block *block = NULL;
>> +	unsigned int min_order, order;
>> +	unsigned long pages;
>> +	LIST_HEAD(allocated);
>> +	int err;
>> +
>> +	if (size < mm->chunk_size)
>> +		return -EINVAL;
>> +
>> +	if (min_page_size < mm->chunk_size)
>> +		return -EINVAL;
>> +
>> +	if (!is_power_of_2(min_page_size))
>> +		return -EINVAL;
>> +
>> +	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
>> +		return -EINVAL;
>> +
>> +	if (check_range_overflow(start, end, size, mm->size))
>> +		return -EINVAL;
>> +
>> +	/* Actual range allocation */
>> +	if (start + size == end)
>> +		return __drm_buddy_alloc_range(mm, start, size, blocks);
>> +
>> +	pages = size >> ilog2(mm->chunk_size);
>> +	order = fls(pages) - 1;
>> +	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>> +
>> +	do {
>> +		order = min(order, (unsigned int)fls(pages) - 1);
>> +		BUG_ON(order > mm->max_order);
>> +		BUG_ON(order < min_order);
>> +
>> +		do {
>> +			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>> +				/* Allocate traversing within the range */
>> +				block = alloc_range_bias(mm, start, end, order);
>> +			else
>> +				/* Allocate from freelist */
>> +				block = alloc_from_freelist(mm, order, flags);
>> +
>> +			if (!IS_ERR(block))
>> +				break;
>> +
>> +			if (order-- == min_order) {
>> +				err = -ENOSPC;
>> +				goto err_free;
>> +			}
>> +		} while (1);
>> +
>> +		mark_allocated(block);
>> +		mm->avail -= drm_buddy_block_size(mm, block);
>> +		kmemleak_update_trace(block);
>> +		list_add_tail(&block->link, &allocated);
>> +
>> +		pages -= BIT(order);
>> +
>> +		if (!pages)
>> +			break;
>> +	} while (1);
>> +
>> +	list_splice_tail(&allocated, blocks);
>> +	return 0;
>>   
>>   err_free:
>>   	drm_buddy_free_list(mm, &allocated);
>>   	return err;
>>   }
>> -EXPORT_SYMBOL(drm_buddy_alloc_range);
>> +EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>>   
>>   /**
>>    * drm_buddy_block_print - print block information
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index 6ba314f9836a..1411f4cf1f21 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   	struct i915_ttm_buddy_resource *bman_res;
>>   	struct drm_buddy *mm = &bman->mm;
>> -	unsigned long n_pages;
>> -	unsigned int min_order;
>> +	unsigned long n_pages, lpfn;
>>   	u64 min_page_size;
>>   	u64 size;
>>   	int err;
>>   
>> -	GEM_BUG_ON(place->fpfn || place->lpfn);
>> +	lpfn = place->lpfn;
>> +	if (!lpfn)
>> +		lpfn = man->size;
>>   
>>   	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>>   	if (!bman_res)
>> @@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	INIT_LIST_HEAD(&bman_res->blocks);
>>   	bman_res->mm = mm;
>>   
>> +	if (place->fpfn || lpfn != man->size)
>> +		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> +
>>   	GEM_BUG_ON(!bman_res->base.num_pages);
>>   	size = bman_res->base.num_pages << PAGE_SHIFT;
>>   
>> @@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   		min_page_size = bo->page_alignment << PAGE_SHIFT;
>>   
>>   	GEM_BUG_ON(min_page_size < mm->chunk_size);
>> -	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>> +
>>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +		unsigned long pages;
>> +
>>   		size = roundup_pow_of_two(size);
>> -		min_order = ilog2(size) - ilog2(mm->chunk_size);
>> +		min_page_size = size;
>> +
>> +		pages = size >> ilog2(mm->chunk_size);
>> +		if (pages > lpfn)
>> +			lpfn = pages;
>>   	}
>>   
>>   	if (size > mm->size) {
>> @@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   
>>   	n_pages = size >> ilog2(mm->chunk_size);
>>   
>> -	do {
>> -		struct drm_buddy_block *block;
>> -		unsigned int order;
>> -
>> -		order = fls(n_pages) - 1;
>> -		GEM_BUG_ON(order > mm->max_order);
>> -		GEM_BUG_ON(order < min_order);
>> -
>> -		do {
>> -			mutex_lock(&bman->lock);
>> -			block = drm_buddy_alloc_blocks(mm, order);
>> -			mutex_unlock(&bman->lock);
>> -			if (!IS_ERR(block))
>> -				break;
>> -
>> -			if (order-- == min_order) {
>> -				err = -ENOSPC;
>> -				goto err_free_blocks;
>> -			}
>> -		} while (1);
>> -
>> -		n_pages -= BIT(order);
>> -
>> -		list_add_tail(&block->link, &bman_res->blocks);
>> -
>> -		if (!n_pages)
>> -			break;
>> -	} while (1);
>> +	mutex_lock(&bman->lock);
>> +	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>> +				    (u64)lpfn << PAGE_SHIFT,
>> +				    (u64)n_pages << PAGE_SHIFT,
>> +				     min_page_size,
>> +				     &bman_res->blocks,
>> +				     bman_res->flags);
>> +	mutex_unlock(&bman->lock);
>> +	if (unlikely(err))
>> +		goto err_free_blocks;
>>   
>>   	*res = &bman_res->base;
>>   	return 0;
>> @@ -266,10 +258,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>>   {
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   	struct drm_buddy *mm = &bman->mm;
>> +	unsigned long flags = 0;
>>   	int ret;
>>   
>> +	flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> +
>>   	mutex_lock(&bman->lock);
>> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
>> +	ret = drm_buddy_alloc_blocks(mm, start,
>> +				     start + size,
>> +				     size, mm->chunk_size,
>> +				     &bman->reserved,
>> +				     flags);
>>   	mutex_unlock(&bman->lock);
>>   
>>   	return ret;
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> index 312077941411..72c90b432e87 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> @@ -20,6 +20,7 @@ struct drm_buddy;
>>    *
>>    * @base: struct ttm_resource base class we extend
>>    * @blocks: the list of struct i915_buddy_block for this resource/allocation
>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>    * @mm: the struct i915_buddy_mm for this resource
>>    *
>>    * Extends the struct ttm_resource to manage an address space allocation with
>> @@ -28,6 +29,7 @@ struct drm_buddy;
>>   struct i915_ttm_buddy_resource {
>>   	struct ttm_resource base;
>>   	struct list_head blocks;
>> +	unsigned long flags;
>>   	struct drm_buddy *mm;
>>   };
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index f524db152413..865664b90a8a 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -13,15 +13,22 @@
>>   
>>   #include <drm/drm_print.h>
>>   
>> -#define range_overflows(start, size, max) ({ \
>> +#define check_range_overflow(start, end, size, max) ({ \
>>   	typeof(start) start__ = (start); \
>> +	typeof(end) end__ = (end);\
>>   	typeof(size) size__ = (size); \
>>   	typeof(max) max__ = (max); \
>>   	(void)(&start__ == &size__); \
>>   	(void)(&start__ == &max__); \
>> -	start__ >= max__ || size__ > max__ - start__; \
>> +	(void)(&start__ == &end__); \
>> +	(void)(&end__ == &size__); \
>> +	(void)(&end__ == &max__); \
>> +	start__ >= max__ || end__ > max__ || \
>> +	size__ > end__ - start__; \
> 
> Hmm, this doesn't say anything about start >= end. IIUC this will 
> incorrectly still allow something like:
> 
> check_range_overflow(PAGE_SIZE, 0ULL, PAGE_SIZE, mm->size)
> 
> Perhaps just keep the macro as it was, and then maybe just add something 
> like:
> 
> if (end > mm->size)
>      return -EINVAL;
> 
> if (range_overflows(start, size, end))
>      return -EINVAL;
> 
> IMO that looks a little easier to understand?
> 
> Otherwise I think looks good.
> 
changes are added to v10
>>   })
>>   
>> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>> +
>>   struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>> @@ -131,12 +138,11 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
>>   
>>   void drm_buddy_fini(struct drm_buddy *mm);
>>   
>> -struct drm_buddy_block *
>> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order);
>> -
>> -int drm_buddy_alloc_range(struct drm_buddy *mm,
>> -			  struct list_head *blocks,
>> -			  u64 start, u64 size);
>> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>> +			   u64 start, u64 end, u64 size,
>> +			   u64 min_page_size,
>> +			   struct list_head *blocks,
>> +			   unsigned long flags);
>>   
>>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>>   
>>
>> base-commit: e3a3896bf9a189f3992db9fd8622893cf90652cb
>>
