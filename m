Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B21449C80
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 20:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4666E91E;
	Mon,  8 Nov 2021 19:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AB26E91A;
 Mon,  8 Nov 2021 19:40:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8bIDQ2n12mhJ8kFbdzIGv6SMuHht1FjbxAMO8OG8gT7nwOAnTOofSf2miTtH9I3f1YDc7bC/NL3FB9Zg6Hak+H99lerj+nHjFne74q57A0JgeQjjL/pawMm+TWjBjtzLq7jD3IEWwhJnRHFidMlyrxjrgDx2JEtWHYiU7jSa9K2FwbznpiaL2IrWnP37n6DNwaREzGQF2pY23Gg7rROAxpDvDpbk3071OBfe0a8jpmhL/ryypqNXAy763bUOOChJesaPzVX5e42lm/KhRKMsEObAuXVyVRZ3lGcaIhL4wx+DfxLwbGxRm4Pt9YpjULq1bpf0a9+h6G7jLcpM2+iIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThbPe6KjLlpJ+UD28TRZP3NnphPyE0F9yJ8oOoarvPc=;
 b=lyVRHpoaQ6yvq4/a4aPuKBQSCkPvMlFwROSnEbr8nb9dvkxTZ/33FmHFOwyv4oHF8O2rgMM3ItqCbNlYlHeOKcGM6e9MmLumSZJCQIOxie3gI0PZJV1/6CeidXvQrqFOSubH9snjWhScCwZEK6m2ItLFFVWnkNPob4P2BrAfwUAl70+C09CTzOK4Hhjsup4SnH5YaOhMm89WpWpdPabO/fcayZR87bcF2ScHRcQMokgcOFqXEzwV7giYnDYVOfdwdY5CXOnkRm3PWwzV8MTQ8Kw4aSQYiEAKWLhWh8+9z2v6IYGLZPf14MnFQODQbXL2ud/rzzIJ0n9liUWMbThNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThbPe6KjLlpJ+UD28TRZP3NnphPyE0F9yJ8oOoarvPc=;
 b=smpuAc2v1EKvZyrkzlFpVAfRtBw4LMjzrlbANgyWQFF9jar58M4r76xZLnN4EiDxLmVogVh9oL0a6IIZgFL6xLZrPYaYGGKaVRiIsvKHtVQjW+yr2MSt6VB2wbwuf6T21DQMXkAwEC21CQfdKYNavOSxpfNExdh07ME+Xql5FOM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 19:40:50 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3%9]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 19:40:50 +0000
Message-ID: <868400cc-7a48-6420-5c58-cf976f91ab7d@amd.com>
Date: Tue, 9 Nov 2021 01:20:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/8] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-8-Arunpravin.PaneerSelvam@amd.com>
 <781f4204-ec6b-7094-a96b-0f4c196ffaeb@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <781f4204-ec6b-7094-a96b-0f4c196ffaeb@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::22) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from [10.138.142.32] (165.204.156.251) by
 BM1PR0101CA0060.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Mon, 8 Nov 2021 19:40:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ce00c38-f351-44f0-e6c0-08d9a2efaacd
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-Microsoft-Antispam-PRVS: <MN2PR12MB38395ED63AD382FA0C3B74C7E4919@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xSlpo+T6eLuKR5etgRelWUFxY3S6LGA25SMKyQi9wL0hslBEPHXQ+EukqwujKvz3vq/DEmqXZw74LRpopiyJ+BIObBp+SuJOrFCCDLY56I8FvtLgZLKzG5e+baS4TDw55VhXhZH87hZ6zpzez6KDFaMruW59XA/gwPdXVDX/nsAE9cEhQxQl/U+VU9bxfID7KhwVfQ/VFwd20SWqIL4Ci7MARzLKjpM5N1AyiyuUptkUkxb1AZiX9pl2NkStDaHUKHGW23pcghbg1+7Bk0RlSNEuAM9Skx+WWYRqyLXwCUVGy9I63Usxr6vh5mNMD4Yr6PArgZQyQEm/xph1KRhs3zr8xB8QUEYrdUnQBmhvBfFa/e34qEu81onxny/wQgwAfDayuetMf3hhlVCEu4utJbpool8udCYQcTg4BadR7w4NswusF6AKVURGoQu3F20MQ9fErsLtW1G7FmiFSXM8diDDewdPuH+f828O2xH72qgmIEwSkg5joERJHfPU6ox/nQhsaIKOJhUGbMOVRfBqrYWfEA6rhRZ4Kbl2IxKAoVzX70FHQBMDDmrOJ1aszhbl1jgLlfLQ/3b0lNLomO+YkO3MRO3vV1rJqp/sNAjP+gzgwUJy+1MK2nAEFuoDXUggavs3KMvjIDHRdBBKLxa3LsIdJ1iIfcU4CzSMRPlLZfOZmPNZaNgI5jvhRLc6B3G4StiOvASnKpRRVsYYjo6vIVQmTM6hToXQblmprWQK0rc4R1+0of1Fwv/NowdLm5TB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(5660300002)(26005)(2616005)(316002)(4326008)(66476007)(956004)(31686004)(6486002)(16576012)(53546011)(31696002)(30864003)(86362001)(66556008)(2906002)(38100700002)(36756003)(83380400001)(508600001)(6666004)(66946007)(8936002)(186003)(87944003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0F2UnFsSmFBS3kwRmE1QTFNeGc5T3lhM2c1R0xWTmhZS1Jvb2xhbVAvUzBG?=
 =?utf-8?B?RmNRK1RuUXR5VStIK3U4Z2hURnhTa1Z1NWEzUEJUcERNM0xOZG5Bb3NlQW9I?=
 =?utf-8?B?RzlBY0dTVjJIb2k2TFl5YTJZS1BnaGNwRVhWbFZuNFJPbkREdXU0SnNDNElh?=
 =?utf-8?B?SUs1SVVzZCtNQk0rRFVVRTEyMzNteEM4eFYzVzhoazdXb0orSjdNM2hzTWdC?=
 =?utf-8?B?MzFpaDhMSTdvVlYxbXZVSlpLNXkwVm5Yek92Y0xzOTFiMi8yeWhCMzA2ZlhX?=
 =?utf-8?B?Q3hES0Z4MFpjSXV2NVpncHdyS2o3MS9RWVNmL2g3WXVHL29tbzJpb0gyaGIr?=
 =?utf-8?B?R0xycGRJd1ZWU2EyQkY4d1c2NEpQeEpkQUx6K0lWR1F4SkxpT3FEL3NWczFN?=
 =?utf-8?B?UExmWEVJc1ZMRkY5THBsQVJNUHRLTlduNE1vMTFIZ0J3U0JQUGx0YmRjUnRl?=
 =?utf-8?B?T0E3UWowek1ROXRRbjBLbUV4dUk0cFhmQjAyMitDTnhEVnhtbmNRTUNJSzhF?=
 =?utf-8?B?RXlORi9zKzlEdDZKcDRsYm1KdyttUGRKY29BOGU3SVR0dS9iZmRPWHFNNmlh?=
 =?utf-8?B?S3VYUzV4SjJmSE1oekZzZm9nakFEd2pNVk9zenVBcXpOdFVTbzUvalJ5RWdh?=
 =?utf-8?B?WHZ5aElsU2ZEakZCT0hLYW5YYTJ6TWlxNElncHJ0aGdjV1luYm5oZDNqM2xQ?=
 =?utf-8?B?V01RQitCUFBwSWNNekk0QVRFNXc1ci9EYlFQTnlETGV6djZ3UTAxa1VsbGZQ?=
 =?utf-8?B?OUxXNExsMkdpSTFQdVlTVXFmaFhwTkdjN01uR1hSQ1VWS3BwOTJRTzR1Ny9y?=
 =?utf-8?B?NEduaEsvTWJnOHRyWjFScWtrcGNhcVB4VWxVZ3E4aDk3Sm52WGVPRmk4OXQ0?=
 =?utf-8?B?MkFkVHJUdHByK212TjJ1UEtMV2xLL0htUWlYVUpGNUhMbVBjUTlMRzI4U1hK?=
 =?utf-8?B?cVhkeUFGZ1REZlVhem52Ukw3am1yTHlvK0RUSXpKN3htUjcza1hRL2JZek9u?=
 =?utf-8?B?bVZJUHlQRUtNN1p5a25tYmxkaHhyb3M0MHFUa0JEUHVGNGtVSGt5UnpFdGhp?=
 =?utf-8?B?dk1udTFZOGxyQm1lSDhsSWZzK21DUjZYUHlUeTN4Nyt3OHphd0gxVWdvRGlh?=
 =?utf-8?B?d0tSSEVuZ1J6ek1uK29XWWxYS200bXVOUXAvVkd6eEdBWlFSdHBhNGk4UzQ2?=
 =?utf-8?B?Qzc2OHEvRXVMY25xVFRoVGs5Qkl6ZThzeWg2VStvQWpTWVF1TUVlN013L1d4?=
 =?utf-8?B?bUd0dWR5Vnd4Mks2VG9EMzc4K1Vya0Q5RFRibDlwbTZuVVRScWRhZmprakZD?=
 =?utf-8?B?L1pXWWc4d2NFSS81cHVxWVo2bElySVVFU1lGeEV2N0V5Z3VjYjg4SlRPWEpQ?=
 =?utf-8?B?Q0RvV1lEVGZmQld3czZrSFBqaUF4RnIwcWd1RUo2bTd3NDZ3VWZLTXFpenA3?=
 =?utf-8?B?TmdUTGlLM2U0UE5QLzJBSTAwS2QxamRzQ2FCTnFxenJVanFQaHdpMzVoZ1Rz?=
 =?utf-8?B?WGpoaDl5TDlqelFWMkYwMXVpTnd6OUhGWks5TExtUDFTdDhJQUNJTUpIeHRS?=
 =?utf-8?B?WXR3U3VkeHZBTU9LZFJQNll3RFBnQ1NJVmtERE5HcmtrWE9vN3k0Qy9tdnIx?=
 =?utf-8?B?eWEySDlDM1JadVlHTGI0U3dMRE4xRmpXaFJ0UmdxMFVZWC9VV293SnRERFlX?=
 =?utf-8?B?d0tEVXNOdDUreWc4TnBtcGR2TGs1bWYrYnlqSnVlaUw1YmFVOXdoOUYwOUls?=
 =?utf-8?B?ZUhwQ0xQZTBRNVBrRWR1MU0zOXgwTnNBZUVUV1llTndrcWpPL1p6ZXNoQjRF?=
 =?utf-8?B?TTN0M0hyMDFOVlRzS1ZEL0d3ZXdZU0tmNkNYbzhuZDBLNmF6QnV5NlhSbURP?=
 =?utf-8?B?TmwyeVJHMVRVMXJuWDlZQzNCTCtGQjhsNXg4QytoRnFOY0x6ZWtOTzR2T0R1?=
 =?utf-8?B?ejVpK3E1a1lZT0UvaHBJTDJST01EWE9jcS9lWkJxS1JDeGFyU0RxR3JaeXBh?=
 =?utf-8?B?aVZWaHRKSFFsVDlIby80bGJ6WENhdTBLS0NCL3JEcnVSMVR0djNQb0pFRGw0?=
 =?utf-8?B?MVppYVVNblV6Yk90elJPbFVIRW56VXJpRktMRXVIWDAwamdSZEZIOXRXeTBB?=
 =?utf-8?B?T0VoeVJyNkJYcCtrbzZWV1RnVnNEclh1OFdLMDRZaWJTZHZNMUxtUHNrYk5Y?=
 =?utf-8?Q?Nz5uxGyubUOPvp0Tl5hCP74=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce00c38-f351-44f0-e6c0-08d9a2efaacd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 19:40:49.8828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtJWjPFKqP0gH7eidkGDAAkP7VET9aAG7MlU6mRs8ivuH1M7gijbcfPrvcVNzegrpyQbqHJ+ovo1R/khQPOFEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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

Hi Matthew,
Thanks for the review, Please find my comments

On 04/11/21 12:11 am, Matthew Auld wrote:
> On 25/10/2021 14:00, Arunpravin wrote:
>> - Make drm_buddy_alloc a single function to handle
>>    range allocation and non-range allocation demands
>>
>> - Implemented a new function alloc_range() which allocates
>>    the requested power-of-two block comply with range limitations
>>
>> - Moved order computation and memory alignment logic from
>>    i915 driver to drm buddy
>>
>> V2:
>> merged below changes to keep the build unbroken
>> - drm_buddy_alloc_range() becomes obsolete and may be removed
>> - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>> - apply enhanced drm_buddy_alloc() function to i915 driver
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c                   | 265 +++++++++++-------
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++---
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>>   include/drm/drm_buddy.h                       |  22 +-
>>   4 files changed, 207 insertions(+), 149 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 39eb1d224bec..406e3d521903 100644
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
>> @@ -394,31 +307,32 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   		block = list_first_entry_or_null(&dfs,
>>   						 struct drm_buddy_block,
>>   						 tmp_link);
>> +
> 
> No need for the newline.

[Arun] ok
> 
>>   		if (!block)
>>   			break;
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
>> +		if (contains(start, end, block_start, block_end)
>> +				&& order == drm_buddy_block_order(block)) {
> 
> Alignment looks off, also && should be on the line above.

[Arun] ok
> 
>> +			/*
>> +			 * Find the free block within the range.
>> +			 */
>> +			if (drm_buddy_block_is_free(block))
>> +				return block;
> 
> Would it make sense to keep searching here, rather than restarting the 
> search from scratch every time? Would it work if we pass in the total 
> size and min order?
[Arun] yes, I will rewrite this function
> 
> I take it this will now also be used for allocating CPU mappable memory 
> using an end bias?
[Arun] yes, this function used for allocating CPU mappable memory using
an end bias and for actual range allocation as well.
> 
>>   
>> -			mark_allocated(block);
>> -			mm->avail -= drm_buddy_block_size(mm, block);
>> -			list_add_tail(&block->link, &allocated);
>>   			continue;
>>   		}
>>   
>> @@ -428,12 +342,11 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   				goto err_undo;
>>   		}
>>   
>> -		list_add(&block->right->tmp_link, &dfs);
>>   		list_add(&block->left->tmp_link, &dfs);
>> +		list_add(&block->right->tmp_link, &dfs);
> 
> So this is now top-down? Do we need this? Also I guess this now changes 
> the ordering of the allocated blocks? Ideally they would appear in 
> order, starting from the lowest address(at least for the actual range 
> allocation, and not just the bias thing). I think some places might only 
> check the first block to get the device address, where underneath we 
> have a contiguous allocation.
[Arun] True, I will keep bottom-up
> 
> 
>>   	} while (1);
>>   
>> -	list_splice_tail(&allocated, blocks);
>> -	return 0;
>> +	return ERR_PTR(-ENOSPC);
>>   
>>   err_undo:
>>   	/*
>> @@ -446,12 +359,148 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
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
>> +		if (!list_empty(&mm->free_list[i])) {
> 
> list_first_entry_or_null already handles that.
[Arun] I will remove list_empty()
> 
>> +			block = list_first_entry_or_null(&mm->free_list[i],
>> +							 struct drm_buddy_block,
>> +							 link);
>> +
>> +			if (block)
>> +				break;
>> +		}
>> +	}
>> +
>> +	if (!block)
>> +		return ERR_PTR(-ENOSPC);
>> +
>> +	BUG_ON(!drm_buddy_block_is_free(block));
>> +
>> +	while (i != order) {
>> +		err = split_block(mm, block);
>> +
> 
> No need for the newline.
[Arun] ok
> 
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
> 
> Do we need to validate the flags somewhere?
[Arun] I will move 'unsigned long flags' to enum type declaration
> 
>> +{
>> +	struct drm_buddy_block *block = NULL;
>> +	unsigned int min_order, order;
>> +	unsigned long pages;
>> +	LIST_HEAD(allocated);
>> +	int err;
>> +
>> +	if (size < mm->chunk_size)
>> +		return -EINVAL;
> 
> Also:
> 
> if (min_page_size < mm->chunk_size)
>        return -EINVAL;
> 
> if (!is_power_of_2_u64(min_page_size))
>        return -EINVAL;
> 
> ?
[Arun] ok
> 
>> +
>> +	if (!IS_ALIGNED(start, mm->chunk_size))
>> +		return -EINVAL;
>> +
>> +	if (!IS_ALIGNED(end, mm->chunk_size))
>> +		return -EINVAL;
>> +
>> +	if (!IS_ALIGNED(size, mm->chunk_size))
>> +		return -EINVAL;
> 
> Maybe:
> 
> if (!IS_ALIGNED(start | end | size, mm->chunk_size))
>          return -EINVAL;
> 
> ?
[Arun] ok
> 
>> +
>> +	if (check_range_overflow(start, end, size, mm->size))
>> +		return -EINVAL;
>> +
>> +	pages = size >> ilog2(mm->chunk_size);
>> +	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>> +
>> +	do {
>> +		order = fls(pages) - 1;
> 
> Maybe:
> 
> order = min(order, fls(pages) - 1);
[Arun] ok
> 
> We shouldn't need to reset the order here all the way back to the number 
> of pages, I think. We are still holding the lock, and so we still get 
> the same answer as before, assuming we needed to decrement the order 
> below. Otherwise that might be slightly wasteful AFAIK.
[Arun] right, I will modify
> 
>> +		BUG_ON(order > mm->max_order);
>> +		BUG_ON(order < min_order);
>> +
>> +		do {
>> +			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>> +				/* Allocate traversing within the range */
>> +				block = alloc_range(mm, start, end, order);
> 
> Ok, so blocks might be in a random order, which is a slight concern for 
> actual range allocations(not the bias thing). Can we somehow make 
> alloc_range just do the old behaviour when end - start == size? Not the 
> end of the world though if not.
[Arun] I will change the alloc_range() block allocations to bottom-up,
so both actual range allocation and end bias allocation blocks will
start from lowest address. And, since we are traversing the tree from
left to right, blocks will be in order.

And, alloc_range() handles actual range allocation demands the same way
as in the old i915_buddy_alloc_range() function except alloc_range()
make use of order value to find the blocks within the actual range
allocation.
> 
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
>> index c4b70cb8c248..75197ba6e40d 100644
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
>> @@ -73,34 +83,17 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
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
>> +	mutex_lock(&bman->lock);
>> +	err = drm_buddy_alloc(mm, (uint64_t)place->fpfn << PAGE_SHIFT,
>> +				  (uint64_t)place->lpfn << PAGE_SHIFT,
>> +				  (uint64_t)n_pages << PAGE_SHIFT,
> 
> s/uint64_t/u64/
> 
> Some other places also. AFAIK that is preferred in the kernel, outside 
> of maybe uapi headers.
[Arun] ok
> 
>> +				   min_page_size,
>> +				   &bman_res->blocks,
>> +				   bman_res->flags);
>> +	mutex_unlock(&bman->lock);
>>   
>> -		if (!n_pages)
>> -			break;
>> -	} while (1);
>> +	if (unlikely(err))
>> +		goto err_free_blocks;
>>   
>>   	*res = &bman_res->base;
>>   	return 0;
>> @@ -266,10 +259,18 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
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
>> +	ret = drm_buddy_alloc(mm, start, start + size,
>> +				  size, min_size,
>> +				  &bman->reserved,
>> +				  flags);
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
>> index 5ce3fc702f80..c7bb5509a7ad 100644
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
>> +	start__ >= max__ || end__ > max__ \
>> +		|| size__ > end__ - start__; \
>>   })
>>   
>> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
> 
> Would it make sense to make this an enum or something?
> 
> enum drm_buddy_alloc_mode {
>      DRM_BUDDY_ALLOC_FIRST = 0,
>      DRM_BUDDY_ALLOC_TOPDOWN,
>      DRM_BUDDY_ALLOC_RANGE,
> };
> 
> That way can more easily see where this is actually used, rather than 
> having an opaque 'unsigned long flags'? Or are we expecting to combine 
> allocation strategies or something? Anyway, just a thought.
> 
[Arun] we can, initially I used 'unsigned long flags' keeping in mind to
combine the allocation strategies for end bias demands, but I dont see
any usecase. I will move to enum type declaration.

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
