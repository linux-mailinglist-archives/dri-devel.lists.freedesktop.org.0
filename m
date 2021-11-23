Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D293045AF11
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 23:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A0089BD5;
	Tue, 23 Nov 2021 22:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2085.outbound.protection.outlook.com [40.107.96.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D05089C1E;
 Tue, 23 Nov 2021 22:30:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRUTS9Pbqj7Z/FrJbUvsdFzXOcrGrNpIYAP8sX4XtenLF/affo5ajtEvEXSggW31CYwi7R/Emlnx1HyRy6iGY2LYoizHsR7s0KGkrTlC5bKHR3ByJruxq8QJ8srDokU/uhl96yEg4sNni5Ufdiwl0oHYHArKUqs+5FS0cP+raborH1+OxnZgc9l74uBKtBQj39iddzZcD4oAu10/Dt/Ketjmppq/gZNQa2CpbuFDCT8GJs2eW8+kWSC1m9ZSLA1Xb3RFBJ/DY9j3gjfFEjOz9b+5gLBYrg8bu3JHBEzrIVZ+nh0mZkEiLT6rnaC3PPzmxFkS09ROis8BpeBPE9GYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlvmjHsccTjSQGFE7SJpngD6sOiegIVToez0p5KNIk8=;
 b=IpBlWXbKeZygw74plW/IzmuJv4BYj9yK7cmNIeFoQUGJuAmRp6495f5fEiLevrN5fZnqrrNvdLsi5OMSbxqvdRvmm3CnxNZ+K+7A69aghAOP6G5fN6SQkOnqAE02Qw+CDYtg3IklvPTifHMfO360ha3K2jjDZValiE1owslmpCU/YP+CDgS6RjWyrDrUNETS3QuqUdYy2sNas+9uBZwNpO+KZQMnDDTfcCYm+Ka5lWBCg6ecxlA4/JKI8BF37VKDiAjauzJDSlrgew5nKLmVC4IQpgfXITNbw4X/FZ2Iv4OSwPMqVxbX13D61l0ux5kiDyvxUHPjh4pN9hOTYs8hVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlvmjHsccTjSQGFE7SJpngD6sOiegIVToez0p5KNIk8=;
 b=EOEA6JaIeOJDEGSkuyLiElVGMF9dg7wZfE7qZh5OSvRx1XJg3rxHGKDtKVj4hF9ZWL5sk35BLNdVqnj0rGaYhrdj8LZMDHIyOqOALeWHFAHY8Vm8XKeUN0Jg1ieylWoR3gfJwHsz1erZ5GTDG/A6ZsiiGExW9hBOCmlsVr2lwk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB3901.namprd12.prod.outlook.com (2603:10b6:208:16c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 22:30:24 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3%9]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 22:30:24 +0000
Message-ID: <23bcceec-f626-eb8e-631d-d858c77f3d04@amd.com>
Date: Wed, 24 Nov 2021 04:09:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/6] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211116201807.147486-1-Arunpravin.PaneerSelvam@amd.com>
 <20211116201807.147486-2-Arunpravin.PaneerSelvam@amd.com>
 <bb9bbfc8-be80-a9d9-961b-564055b6f083@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <bb9bbfc8-be80-a9d9-961b-564055b6f083@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::33) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from [10.138.142.32] (165.204.156.251) by
 BM1PR0101CA0023.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Tue, 23 Nov 2021 22:30:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d133862-be11-4d30-ed47-08d9aed0d75e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3901:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3901C7DEF49B4825467EDD4FE4609@MN2PR12MB3901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HzT9FhGeQWBKMTtr0X+b9uCjcfZBbej902vAdBSLKkqwTdtLFKxbIhqczidYrpBx0v8AnHpauas/ZCEr1a+lHRmay9XbIGzQi+zCGs9HHa3wQFP7YxNZgBSRC2eNK9JHcSYpklKn3hXUkHiRrGbfhqEGM1b/Y6SgnWL7mCGbc1UJu5U5B6HN3mb7p+wSCZSbLBZTaL7dVQRmd5y3JJmt9PVn7v7ydvkdNqyeGMhQtP+KEOJQ+9ABeFT4qeicN/HLsnKraOK9z20XiUM42+dsyDu+Lap+Cy8+SZnLDjdcYrq44z5zGcaItC0YUDzEQRuTyJbTT1zXBwmzIbxAUIv+kEag11KLBmxAFCf3E0pJ8XNIwvJtzMqkBn7I1GWJcNwwNMun2T/0fpa1KGW4aRt4ehaZSSvZxlyu37bqywbprE57NuLIV1QLf4HhZqzWIhnaCLeOrrqgt3WfEitiJndFhb0jySMF+UP6o1v+/f92VfRKXLTp0lMrVzZ8fLed+ZFl6d1v9jT9BQxkrJcIX6MezlQlCDbh5W7ATx0J7isnU27z+wksUywbXUW9MRkWpqHr1uLvJTv74H3sYLsQVTcJ2Z90Unl+LgddDfkgLdv63NejRWlFUfMmOz5dJxgJqAUVvS4vSukxz3AUZqq2G+FhvzU0X79IgLssme1lQzSpzZVta+fGv/d3lKec0bnQ13gxz+FpEsEYaMou3smVDn1OrBpFAOP+opqZeGP2HBf6frk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(186003)(30864003)(956004)(38100700002)(66476007)(66946007)(8936002)(4326008)(2616005)(31686004)(86362001)(66556008)(508600001)(6486002)(53546011)(31696002)(16576012)(5660300002)(6666004)(2906002)(316002)(83380400001)(36756003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1REcHV1T1poZVZ5ais4REFsVFI2NCtxOVhKSmhBendsdzkwbmVUeFVwSFZZ?=
 =?utf-8?B?TFNPaG83M1NaVmt5UmZVSVF5ZkFlOVRFWXFMRmIyNTFJeWE2VE1yMGFHenZW?=
 =?utf-8?B?THZDSW5jNFZMQ2Y5ZndXZ2tqdXNDQS9ITWd2Q2hvYW5UVm5DbzRZSXc4SkV2?=
 =?utf-8?B?K3ZDVnFoMWxWbWxWcjEzQzNEQUpwZk1HalNGblVLdXQybFhXNERnQXZRZk1R?=
 =?utf-8?B?bHkwcHBlM1IxTm1yd05XM3diRlYwb2FWdUFGSGp2anZjRUw4M01rd3pFWUhU?=
 =?utf-8?B?UHE3eUN0SFNKWUF3RFh2c2JIYzdKU2YvdkZKRll6QVZ4RjhuUTd6d1dIY2wy?=
 =?utf-8?B?dzdPbzdTL2NwSFFKdDBhQ0dRV3VHSkFMRFFhSzQrTUtsMzNGaHljQmtMOVJQ?=
 =?utf-8?B?ZjQ0TmE5cnovSWNiSWl3TmZvbkhSYk1jb0pMZ29SR3RnZHAzazU0K0NXN1hH?=
 =?utf-8?B?Y3dIVlliRnYwM25xZ1FWSkQzRFJ6ZjEvbTFwWmNOUlBYT3k2eWlWdkZpRG1y?=
 =?utf-8?B?Ynd3VWJ5ZTJ5Q3Z5ckxVYWlyQTZ3aC9CL3BlK0FoWU1GeG9KVXV1OHUvMW1Z?=
 =?utf-8?B?RGNBVXYrYnNFZGp2WGlxZ0t0R095YUJBUllNM2NQdkRLYlVvRWEwNkZjSXY2?=
 =?utf-8?B?UGFMRFFydkVWNm5hb3lDTjdtOWVpQXIrNWRDc2Q2L2pTcFhiNFVqQlU0SjEx?=
 =?utf-8?B?b21zOVJCUVNlZjhwUnpkYm9LZERyU1Ftb1pjRlluYTBwVndQdGRSS2MyUVg1?=
 =?utf-8?B?VVNBQm9SMTB5NHpZVDZ1bnBoeFRzQ1YyVkprcHlvTGM5TGRvamhHb281VENE?=
 =?utf-8?B?T3Z1WEdDTk9sSzM2Uit3VDB4UFRpWHJraWljVHBpNjlUR3h5b0dYTFFkVkhs?=
 =?utf-8?B?NzE5M09ZejY1cnN3aWhMOUpQTzlyUmo5YUpFRDdzejlkaEd5YkxTUC9laFBM?=
 =?utf-8?B?Sm1ydzhBcW1mOVo0L3VRdnc4bytQL1ViTSttbEtXYjI2M3Q4Z1lSRUswY2FI?=
 =?utf-8?B?NUNxZUphUld6cjVyOTBFamlsdG9VOVlnclU3cjVSdFl0NjkwY2YzVHNOQWFr?=
 =?utf-8?B?dWlNTzFONkI2eC8xUzF5RjcvZUNlVDJnYmJzZklDVE1hSVJNTmVBOFVZQ1FW?=
 =?utf-8?B?dUhvSjdXOGN1L01Qb1M3SHdCc2lySFgrWXI1YzJSblBJTGpHRjV5bndxSnNK?=
 =?utf-8?B?ekNDT1FEZSswZS95elE1UUJCVDdzVXdkZmdsWllRTkUvbDB5dmZGSVcyS0lW?=
 =?utf-8?B?cFpoNTVUNG15eG5qMzkzZVFaV3hZbTU2TzlMTVJnS3Q1eEFqVHAxckE3VXl6?=
 =?utf-8?B?R0FxcHJTa0lzWFg4SGIrUUpOZlc4Qi9tUTVnRlpaL1doMEkxK3ozS21KUXZC?=
 =?utf-8?B?WFl6NjFJWVNhMFpodHVLV3RCQkR0VEl6WnJlejMrWDNnUVJ5ZnQvbFgzR1c4?=
 =?utf-8?B?MzhGVjlPTGdCNm1EWUt3ZTZHbmpWYzZLMGM2Wk5XUDlaVHdlMXVxYk1LeEQy?=
 =?utf-8?B?NDdnK2dEbzhxSnZVbUdTNS9PYWZvRUJJaDBjSXlqMHllem9ob0tCSmlLVml4?=
 =?utf-8?B?K3NaL0pXeGxQak90NmZ0a2NLTUdhOUNWZG1jTitwcVNaMlZSL1FIeWRCcVVm?=
 =?utf-8?B?WHlnSi96SzY4ZFQvV2FwQlZYSStFcFVhdFczcjBzZlkyb2JoZlh5a2dUU3dQ?=
 =?utf-8?B?aEd4WnhtMVFPVG1xQWhnaTRUbW9FdzJUdVh6YnF3OHVybUJqcDltNXc5aU0x?=
 =?utf-8?B?ZW1mWWJlZG5XRjcrMUdEWm9WVGtnQi83anlyT0VRYnRKMGRXL2VnVzN0OWNa?=
 =?utf-8?B?SDY1NjE5cEszTDBJYUg2V3o4ZEhrRWRyZlkyTHIyQnBHYk43ejlidjkrMHIx?=
 =?utf-8?B?SStyNnR4bEFwbkdrZ0g2Mjl3bEo5eG9NRWdBU0FuRE40Qkd6bWdndVBjL1Ry?=
 =?utf-8?B?UTNOWm5qdm9sTW1sTjE5bXR6WDV3YjlVMm52RmM1blFJR0VQMzU3TWFOeW1l?=
 =?utf-8?B?eG5wbklXcDRzVjlFNkltNFVBRkt2azBRcDI5cUdiUCtTdDk5SFBRUEhpRnJ3?=
 =?utf-8?B?ZmluRGU4U3M3eURQYUxhZ0pmUERQVGgzRnpFSUdVdjlmUnkvRGZCM3pCN09K?=
 =?utf-8?B?VWNSaTlBTFp1eGF6NUx1bTEwcmoxVzQxeEZUY3lWWWhiZTV6N1VxNXJOTXd5?=
 =?utf-8?Q?ve20oX4aiJk3drJSw8NBqpI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d133862-be11-4d30-ed47-08d9aed0d75e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 22:30:24.0464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgaNfw8qqAO+6OV+UOgeWWhZx1SOB5GfQnnyhZK7xn12YwZ5pVkuepPOUwmtkDNyDkOtAaKYUrc4VlMcJJO8yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3901
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



On 18/11/21 12:09 am, Matthew Auld wrote:
> On 16/11/2021 20:18, Arunpravin wrote:
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
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c                   | 259 ++++++++++--------
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  69 ++---
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>>   include/drm/drm_buddy.h                       |  22 +-
>>   4 files changed, 203 insertions(+), 149 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 39eb1d224bec..c9b18a29f8d1 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -274,63 +274,6 @@ void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_list);
>>   
>> -/**
>> - * drm_buddy_alloc - allocate power-of-two blocks
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
>> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
>> -{
>> -	struct drm_buddy_block *block = NULL;
>> -	unsigned int i;
>> -	int err;
>> -
>> -	for (i = order; i <= mm->max_order; ++i) {
>> -		block = list_first_entry_or_null(&mm->free_list[i],
>> -						 struct drm_buddy_block,
>> -						 link);
>> -		if (block)
>> -			break;
>> -	}
>> -
>> -	if (!block)
>> -		return ERR_PTR(-ENOSPC);
>> -
>> -	BUG_ON(!drm_buddy_block_is_free(block));
>> -
>> -	while (i != order) {
>> -		err = split_block(mm, block);
>> -		if (unlikely(err))
>> -			goto out_free;
>> -
>> -		/* Go low */
>> -		block = block->left;
>> -		i--;
>> -	}
>> -
>> -	mark_allocated(block);
>> -	mm->avail -= drm_buddy_block_size(mm, block);
>> -	kmemleak_update_trace(block);
>> -	return block;
>> -
>> -out_free:
>> -	if (i != order)
>> -		__drm_buddy_free(mm, block);
>> -	return ERR_PTR(err);
>> -}
>> -EXPORT_SYMBOL(drm_buddy_alloc);
>> -
>>   static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>>   {
>>   	return s1 <= e2 && e1 >= s2;
>> @@ -341,52 +284,22 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>>   	return s1 <= s2 && e1 >= e2;
>>   }
>>   
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
>> - * here is that drm_buddy_alloc() is still the main vehicle for
>> - * allocations, so if that's not the case then the drm_mm range allocator is
>> - * probably a much better fit, and so you should probably go use that instead.
>> - *
>> - * Note that it's safe to chain together multiple alloc_ranges
>> - * with the same blocks list
>> - *
>> - * Returns:
>> - * 0 on success, error code on failure.
>> - */
>> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>> -			  struct list_head *blocks,
>> -			  u64 start, u64 size)
>> +static struct drm_buddy_block *
>> +alloc_range(struct drm_buddy_mm *mm,
>> +	    u64 start, u64 end,
>> +	    unsigned int order)
>>   {
>>   	struct drm_buddy_block *block;
>>   	struct drm_buddy_block *buddy;
>> -	LIST_HEAD(allocated);
>>   	LIST_HEAD(dfs);
>> -	u64 end;
>>   	int err;
>>   	int i;
>>   
>> -	if (size < mm->chunk_size)
>> -		return -EINVAL;
>> -
>> -	if (!IS_ALIGNED(size | start, mm->chunk_size))
>> -		return -EINVAL;
>> -
>> -	if (range_overflows(start, size, mm->size))
>> -		return -EINVAL;
>> +	end = end - 1;
>>   
>>   	for (i = 0; i < mm->n_roots; ++i)
>>   		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>   
>> -	end = start + size - 1;
>> -
>>   	do {
>>   		u64 block_start;
>>   		u64 block_end;
>> @@ -399,26 +312,26 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   
>>   		list_del(&block->tmp_link);
>>   
>> +		if (drm_buddy_block_order(block) < order)
>> +			continue;
>> +
>>   		block_start = drm_buddy_block_offset(block);
>>   		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>>   
>>   		if (!overlaps(start, end, block_start, block_end))
>>   			continue;
>>   
>> -		if (drm_buddy_block_is_allocated(block)) {
>> -			err = -ENOSPC;
>> -			goto err_free;
>> -		}
>> +		if (drm_buddy_block_is_allocated(block))
>> +			continue;
>>   
>> -		if (contains(start, end, block_start, block_end)) {
>> -			if (!drm_buddy_block_is_free(block)) {
>> -				err = -ENOSPC;
>> -				goto err_free;
>> -			}
>> +		if (contains(start, end, block_start, block_end) &&
>> +		    order == drm_buddy_block_order(block)) {
>> +			/*
>> +			 * Find the free block within the range.
>> +			 */
>> +			if (drm_buddy_block_is_free(block))
>> +				return block;
> 
> AFAIK this is still randomly ordered when dealing with actual range 
> allocation. Maybe I'm missing something, but it looks like we are just 
> repeatedly picking the largest order that fits in the remaining number 
> of pages, but it might be the case that the smallest block is for 
> example at the start of the range, depending on the layout of the 
> address space, which would then only get allocated last.
> 
> I think I mentioned this before, but most of the block_trim() looks to 
> already do what we want for this case, and could maybe be factored out, 
> since that is also just another range allocation, except we start with 
> one root node for our "dfs" search.
> 
> Maybe something like:
> 
> drm_buddy_trim(block, new_size...)
> {
>      ....
>      mark_free(block);
>      list_add(&block->tmp_link, &dfs);
>      err = __alloc_range(mm, &dfs, block->start, new_size, ...);
>      if (err)
>      ....
> }
> 
> __drm_buddy_alloc_range(start, size, blocks)
> {
>      for_each_root()
>          list_add(&root->tmp_link, &dfs);
> 
>      err = __alloc_range(mm, &dfs, start, size, ...);
>      if (err)
>      ....
> }
> 
> drm_buddy_alloc(...)
> {
>      /* Actual range allocation */
>      if (start + size == end)
>              return __drm_buddy_alloc_range(...);
>     ....
> }
> 
> And then have something different for the alloc_range_bias()?
> 
Yes, we will have a common function __alloc_range() which does the range
allocation for block_trim() and __drm_buddy_alloc_range() (actual range
allocation).

And, I understood that we keep the alloc_range() implementation for end
bias allocations?

>>   
>> -			mark_allocated(block);
>> -			mm->avail -= drm_buddy_block_size(mm, block);
>> -			list_add_tail(&block->link, &allocated);
>>   			continue;
>>   		}
>>   
>> @@ -432,8 +345,7 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   		list_add(&block->left->tmp_link, &dfs);
>>   	} while (1);
>>   
>> -	list_splice_tail(&allocated, blocks);
>> -	return 0;
>> +	return ERR_PTR(-ENOSPC);
>>   
>>   err_undo:
>>   	/*
>> @@ -446,12 +358,145 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   	    (drm_buddy_block_is_free(block) &&
>>   	     drm_buddy_block_is_free(buddy)))
>>   		__drm_buddy_free(mm, block);
>> +	return ERR_PTR(err);
>> +}
>> +
>> +static struct drm_buddy_block *
>> +alloc_from_freelist(struct drm_buddy_mm *mm,
>> +		    unsigned int order,
>> +		    unsigned long flags)
>> +{
>> +	struct drm_buddy_block *block = NULL;
>> +	unsigned int i;
>> +	int err;
>> +
>> +	for (i = order; i <= mm->max_order; ++i) {
>> +		block = list_first_entry_or_null(&mm->free_list[i],
>> +						 struct drm_buddy_block,
>> +						 link);
>> +		if (block)
>> +			break;
>> +	}
>> +
>> +	if (!block)
>> +		return ERR_PTR(-ENOSPC);
>> +
>> +	BUG_ON(!drm_buddy_block_is_free(block));
>> +
>> +	while (i != order) {
>> +		err = split_block(mm, block);
>> +		if (unlikely(err))
>> +			goto err_undo;
>> +
>> +		block = block->right;
>> +		i--;
>> +	}
>> +	return block;
>> +
>> +err_undo:
>> +	if (i != order)
>> +		__drm_buddy_free(mm, block);
>> +	return ERR_PTR(err);
>> +}
>> +
>> +/**
>> + * drm_buddy_alloc - allocate power-of-two blocks
>> + *
>> + * @mm: DRM buddy manager to allocate from
>> + * @start: start of the allowed range for this block
>> + * @end: end of the allowed range for this block
>> + * @size: size of the allocation
>> + * @min_page_size: alignment of the allocation
>> + * @blocks: output list head to add allocated blocks
>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>> + *
>> + * alloc_range() called on range limitations, which traverses
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
>> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
>> +		    u64 start, u64 end, u64 size,
>> +		    u64 min_page_size,
>> +		    struct list_head *blocks,
>> +		    unsigned long flags)
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
>> +				block = alloc_range(mm, start, end, order);
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
>> +EXPORT_SYMBOL(drm_buddy_alloc);
>>   
>>   /**
>>    * drm_buddy_block_print - print block information
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index c4b70cb8c248..9e3d130c3f42 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   	struct i915_ttm_buddy_resource *bman_res;
>>   	struct drm_buddy_mm *mm = &bman->mm;
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
>> -			block = drm_buddy_alloc(mm, order);
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
>> +	err = drm_buddy_alloc(mm, (u64)place->fpfn << PAGE_SHIFT,
>> +			(u64)place->lpfn << PAGE_SHIFT,
>> +			(u64)n_pages << PAGE_SHIFT,
>> +			 min_page_size,
>> +			 &bman_res->blocks,
>> +			 bman_res->flags);
>> +	mutex_unlock(&bman->lock);
>> +	if (unlikely(err))
>> +		goto err_free_blocks;
>>   
>>   	*res = &bman_res->base;
>>   	return 0;
>> @@ -266,10 +258,19 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>>   {
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   	struct drm_buddy_mm *mm = &bman->mm;
>> +	unsigned long flags = 0;
>> +	u64 min_size;
>>   	int ret;
>>   
>> +	min_size = size;
>> +	flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> +
>>   	mutex_lock(&bman->lock);
>> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
>> +	ret = drm_buddy_alloc(mm, start,
>> +			start + size,
>> +			size, min_size,
> 
> min_page_size = min_size = size. I don't think we want that here. Also 
> the size here might not be power of two. I guess we need to use 
> chunk_size here instead?
ok, we will use chunk_size here.
> 
>> +			&bman->reserved,
>> +			flags);
>>   	mutex_unlock(&bman->lock);
>>   
>>   	return ret;
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> index fa644b512c2e..5ba490875f66 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> @@ -20,6 +20,7 @@ struct drm_buddy_mm;
>>    *
>>    * @base: struct ttm_resource base class we extend
>>    * @blocks: the list of struct i915_buddy_block for this resource/allocation
>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>    * @mm: the struct i915_buddy_mm for this resource
>>    *
>>    * Extends the struct ttm_resource to manage an address space allocation with
>> @@ -28,6 +29,7 @@ struct drm_buddy_mm;
>>   struct i915_ttm_buddy_resource {
>>   	struct ttm_resource base;
>>   	struct list_head blocks;
>> +	unsigned long flags;
>>   	struct drm_buddy_mm *mm;
>>   };
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 5ce3fc702f80..2ec3cbc9d5d7 100644
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
>>   })
>>   
>> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>> +
>>   struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>> @@ -131,12 +138,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
>>   
>>   void drm_buddy_fini(struct drm_buddy_mm *mm);
>>   
>> -struct drm_buddy_block *
>> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
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
>>   
>>
