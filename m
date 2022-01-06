Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C14868E9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 18:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230D710E8F0;
	Thu,  6 Jan 2022 17:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535C810E8F0;
 Thu,  6 Jan 2022 17:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iD8mWiWa1h8c1GkCD6P6vXE0uqRt07stAPSuMMkaPVafQ25gZbfHEXuzXX1d3sKS1l47NgP+fkEsCMrKCJAcMZBnnu8tdVfVUH4WXHjmRCnJMxYK2C0g4VWEOSYG8gMKeGMbs4SvkU52LmN4hEuMp72F4VFN1M2ejKAt3bMuN9QrDS0YP5EfgobOj8iVrVau7tFpKKGEAjJU7v8KNfW353WxV7XBXAzaB7XYURY59mp1qZRM6vFiGF6xhQ6xZf1uLdPErtgxFSW/EMlD1gm66X1VymgZu1r+dnlqc4cbAMfuZw73NMlkXqTFUjo6xqUITY+roLYBY0zeT2kyeEtB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+sR+mB6yX4STPTLl9BDDua3QCWvX1mTspNt88QqJi8=;
 b=Xd74Mfcip9oxfHXtDjXZQ0pOeb24qjZUffGrhWybijh67i2Oro+rrn7muPicR0ji0xdS17G8LhG0xES9jzH+MQW4GF6Y3v/XJwbtTJorFnygejhBbgbcHUXIVkob0HkLcxGvpkk3OjNKDH+sSDiDaqB8xqgRGlXuObCUE/TPqJ7VE/pEjdmUxuCLTm7+JMBLZ3ileQHuyE9P16dzh69viAVE08kzNGdoPIzTey3g4uRchDiW0MTwoL2xUPcQm+K3pWZqSlxv2UV//d+NhcEeYYHFa+zpNFV5BknJ8Y0ZCC1w+TPEg7ScNcASZ+xFQkI00Tn2LBEn7oQW3WBX4x3ZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+sR+mB6yX4STPTLl9BDDua3QCWvX1mTspNt88QqJi8=;
 b=1s1Cyh2aAnh5qvtGNuWgaeST7cttP4o6lnbWi07gNy5v+ffsBrvgiBpo94f8It0BMJaKh4P6V1sIphcOkdiQcP5ci80LG1juGKJ+Cfc0OsoovQ+dPIVV73sMLTverLfSsP6ntpsjyPIYRfjNx3/xPsVTb3Sl2UCqmuYYbRldoLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 17:42:40 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6%5]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 17:42:39 +0000
Message-ID: <aae8b9f0-c5c1-b303-1bc0-5b9c14eb6765@amd.com>
Date: Thu, 6 Jan 2022 23:21:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 4/6] drm: implement a method to free unused pages
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
 <20211226222425.544863-4-Arunpravin.PaneerSelvam@amd.com>
 <9350846b-26bb-cfd6-6c9e-af109ad8b7bb@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <9350846b-26bb-cfd6-6c9e-af109ad8b7bb@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::12) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92d4278b-6ebf-45c0-cf66-08d9d13bef07
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB41427128E85F19E45C28CC18E44C9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JhoykKLnldPnMIYTifXz5ntyBhfEyKh5dEiR8rTzbT6RN354sQlIH8rff57IZ0Jx4yoacTV+w6HhGdG6AZoLSPVnAc7xZOUH31MUzUK5AiNO75wx+j6YOjzyHwcmpc+MaCAfZQqOayHsexsC74XZVwQ3iv/Vn9BROqUzQDORqS7TrydbbJIhir6k7FtA7qH3tWFeFAKrAqjYBzOTrXiiH+8oNDqOZ6rhRWH9Mo7xGgcAC61MKmnXKAAnKpVSW0n5/A/mxEyHYpSmwROOxB4QX7eqq3ai0AMvTBy0BldujvLB5nZTlgM5jfg3U+O8g1yHrFnPTuidNvWk5xbqxfaXDJroPy3/BR7UnTOXJvb5JMH2FRsANH2PDquyf31Hf6NoH91km79ZngsXlTqiq2UQZeQJ/u236a5ttPA2uJdPJ7u308lPfXpwY9e6vZ2eAXBx9/LqeDO8FTJDYjqkW3v5YagrzYObcq9KAcvC57SdzCnTJ8QZ+HQL3pZVd73wYdp8TyuYCukJ4f0v/HJ6W4gTJ7MCw1wQ9rLc/nHfmEKsDm7RRS6wdICDomjsVw39T0qP+3WL1JIoNt3im01sK7bgsCzX4vU/D04olkYJdb6Y7xxxtGqlpav+XqinvL9tpr4Iqu8+xuvKDxySWfiwLtN45C6EU5Hes7U7OUKO2HjNqhsJVAp4+ZoDz+lIoahw03bCwqzqtcfjUEkJvDCS/QGLeUSyyATYt04WgSxgbFr66TwbkhQWIXLEU55BttjBBnxF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(316002)(6666004)(2616005)(36756003)(86362001)(31686004)(66476007)(66556008)(26005)(53546011)(6506007)(66946007)(186003)(6512007)(6486002)(38100700002)(8676002)(8936002)(31696002)(508600001)(2906002)(83380400001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUp1NkVXdzJpMnY0SDVqSk1NRUN5ejU2cjFyblM4MUE2NUMrSDBxanhlYko2?=
 =?utf-8?B?NkZWQlR6MkNUSWVJbTVtUTFCdk9xTUdhdkVJNEVlM083Wk51S0ZpL05OZnlH?=
 =?utf-8?B?M1VzVURlN2ZMRVI2TlJ5blpWOG1FSXgvQkVadDdrdGJkOHRzcCtMb1BYTXc5?=
 =?utf-8?B?RjNXTDlDS3RIM1RjcjhIcGh2N0FVNjliMFhXZm1OaHlJdkxSOXgxYmNsQXgz?=
 =?utf-8?B?VmtVdXlCTUt3Q0FqRTlBam5BNU5qTWhuRmdnQnE3ZmdJRVFpeWNMNGFNQmFL?=
 =?utf-8?B?WlZzNHhOVU9vUmZwcEVhcjF2UlJqQitmTXBZU2ZOVjRDN3Y0S2xkcitRR0hF?=
 =?utf-8?B?WnNWMzFCbkpEQ29jWWxFeVRMcjA2R1J3WUltRk1iUUdPeWlQTnFhcWNTbEFx?=
 =?utf-8?B?WmdldzBjNHVFemlFOXF1NUVYZUNxcTBTRENkNGFaRnZUTXM3aWpvaEVTdDB5?=
 =?utf-8?B?ODRVbFFXRktQNGpSNEFKMVp4b1lUQ3Zhb2tNeG56YTV6M1d6Z3hqQzVnQzA0?=
 =?utf-8?B?cmprU3ZqaUlFRk5zWVorY29RUnY5UEwvckRQcDJoRmFtYnhEd29kak1LMW5R?=
 =?utf-8?B?NmdxdzA0YXRFQlFPeFllclQrd1R3Sm5hcksyeC9YSHdEb1R5RU9zSUo3Z3ZT?=
 =?utf-8?B?UUpLUXgveDh4ZWZZR1hRcWNNdlc5RHAvazZXdGZlYkkyV3UwZ254YTNVc3lB?=
 =?utf-8?B?RTA1UHlGVHZKTStTN24rV0xET3ZaU2orTDVRb2Q4LzlRalcveHYzd3NLZkdw?=
 =?utf-8?B?cnVxS3RxdTloSGlTc2NoeVpHVFVYZVRiRTd2Q3BhTktXblpuUnZCNlVORXYy?=
 =?utf-8?B?dCthSjhBdER2Y0NEU01sSStSQUtsMEM1UW1WaGlQQmNiVlFvMDljQ1FlZ0ht?=
 =?utf-8?B?WTBtM09uaUhUNzIrVHBTT0tKR1FoSjNQUGFKT1lwOS9mL1cycUZOVVB1eS96?=
 =?utf-8?B?cGpOYUpWVUdqMHUrdWtITkVENHpaZlRiMW9OT09HUlFIZGpxRFN3RGJwVzAz?=
 =?utf-8?B?Z3VGRVozYm5LZlRFMnhlYW93RUdNcFgzSUp2ay9ZU0JXVUVJeTI3VkZ3SklB?=
 =?utf-8?B?V3FWejQzZWVHRjBMRmhNc2lQRWxaSE5wNWZ3ZXlQYWo1QVpZVDVoRitaNjV0?=
 =?utf-8?B?RWc1dkdxUG8rKzdRS3hqNzN4azF2SkF2ZnZBREY1ZDFwUzVQd3VINDdsdGpk?=
 =?utf-8?B?OVpydzRSNFpzTG00dkNma2U2SnBzL1RPR3JMTXVqMSszOTNrb2svMFR2b2NZ?=
 =?utf-8?B?dFA3Y1BVRjUzUjVqbGNpQUhEcWV1SngraWFUQ1h6MEhrRzBSRUVGOTBwUlZ0?=
 =?utf-8?B?OThKaksvS3loYlZIOWsyWS9zcTI4RGtYL3FmQm80Q0ZyS3hLTS9PNUdYbzVu?=
 =?utf-8?B?Wm5iMU9IdHFkTTlQTjliSzF1VEg4L1dWUUhkODRlQkcwYW5GUjhJZmcvQm82?=
 =?utf-8?B?ZjRXajMrVVJ5OEh2Nk9rZjZpNXRRZytOTytXTmhJN0xwYTVPSElEOU1IajBn?=
 =?utf-8?B?SEZyMmh0L3V6VzQ0RllORVA2VU0zREJsRTFkemt0QTJHS3VSS2ZGZHJyYXJ4?=
 =?utf-8?B?YWpHM3RrYzRJN1kyWFNNR3dZMktUb3BoQThtQWVnMStUeUlmdVZrdEFWUVBy?=
 =?utf-8?B?d3ZaVk83RzBJSEhsYUM2OHRIM0QvWW4rMnQ0LzFSckx6ZXZRMWkyc0JSbWgz?=
 =?utf-8?B?SzVPZzlHQld0bEJxMERLRG1NQTdJRnRpenRHVSt1ZFNGTmVNNU5iQWhrc3BL?=
 =?utf-8?B?WWtpSmhXbldwUHV3TU1DZzZWdFhZSWFXclhZRGZSMWlUOU5Najg2dVprZkRl?=
 =?utf-8?B?YVBLOW5LRVJ1bEtURk1sNkwzWjJ2dlM0b3NwM0h5UU1oclgvdVpRMDRQalN3?=
 =?utf-8?B?dkV5NEtvQXpqZnQyMWJoWVZDNXVwajNNZDZqcU9xeEpoeC9heEIxUEhCOGJ6?=
 =?utf-8?B?MGZjQ2J2VFMwSWZQSU1kN1BVNVYyVFhxYjVCVUV6VE9veWZKNGxaZDgvbkxG?=
 =?utf-8?B?QURITldrQ2VxUHBiYXZBK0g0ZHVsVFFETWE5cXJVRDVzd0JmK29EOE9aZnlS?=
 =?utf-8?B?eHhHckUrRlJVQVNvK2JGbVZKcnRCejU5S2NlVU15dWZOTllzRGNIOG9KNkVU?=
 =?utf-8?B?dXQySUVWSlh5Z1pyNEVxdEpub2daOW1XRDNUWHhzWDJwMUJGM2ZUVnNtUGcz?=
 =?utf-8?Q?cuqNMzd1pn4sIPdUUDKZ/ag=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d4278b-6ebf-45c0-cf66-08d9d13bef07
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 17:42:39.6927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsYXmGtknv6lmUpmGwFkwxP+T290dZlOQc1l3E7mqYQbH6A/8WsS3BAJaEC52GICNye7CN/Moi41SAgQKI2wHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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



On 04/01/22 7:41 pm, Matthew Auld wrote:
> On 26/12/2021 22:24, Arunpravin wrote:
>> On contiguous allocation, we round up the size
>> to the *next* power of 2, implement a function
>> to free the unused pages after the newly allocate block.
>>
>> v2(Matthew Auld):
>>    - replace function name 'drm_buddy_free_unused_pages' with
>>      drm_buddy_block_trim
>>    - replace input argument name 'actual_size' with 'new_size'
>>    - add more validation checks for input arguments
>>    - add overlaps check to avoid needless searching and splitting
>>    - merged the below patch to see the feature in action
>>       - add free unused pages support to i915 driver
>>    - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
>>      are all globally visible
>>
>> v3(Matthew Auld):
>>    - remove trim method error handling as we address the failure case
>>      at drm_buddy_block_trim() function
>>
>> v4:
>>    - in case of trim, at __alloc_range() split_block failure path
>>      marks the block as free and removes it from the original list,
>>      potentially also freeing it, to overcome this problem, we turn
>>      the drm_buddy_block_trim() input node into a temporary node to
>>      prevent recursively freeing itself, but still retain the
>>      un-splitting/freeing of the other nodes(Matthew Auld)
>>
>>    - modify the drm_buddy_block_trim() function return type
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c                   | 61 +++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  8 +++
>>   include/drm/drm_buddy.h                       |  4 ++
>>   3 files changed, 73 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index eddc1eeda02e..855afcaf7edd 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -538,6 +538,67 @@ static int __drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>   	return __alloc_range(mm, &dfs, start, size, blocks);
>>   }
>>   
>> +/**
>> + * drm_buddy_block_trim - free unused pages
>> + *
>> + * @mm: DRM buddy manager
>> + * @new_size: original size requested
>> + * @blocks: output list head to add allocated blocks
>> + *
>> + * For contiguous allocation, we round up the size to the nearest
>> + * power of two value, drivers consume *actual* size, so remaining
>> + * portions are unused and it can be freed.
>> + */
>> +void drm_buddy_block_trim(struct drm_buddy_mm *mm,
>> +			  u64 new_size,
>> +			  struct list_head *blocks)
> 
> It might be better to just return the error, and let the user decide if 
> they want to ignore it? Also we might want some kind of unit test for 
> this, so having an actual return value might be useful there.
> 
sure will revert it
>> +{
>> +	struct drm_buddy_block *parent;
>> +	struct drm_buddy_block *block;
>> +	LIST_HEAD(dfs);
>> +	u64 new_start;
>> +	int err;
>> +
>> +	if (!list_is_singular(blocks))
>> +		return;
>> +
>> +	block = list_first_entry(blocks,
>> +				 struct drm_buddy_block,
>> +				 link);
>> +
>> +	if (!drm_buddy_block_is_allocated(block))
>> +		return;
>> +
>> +	if (new_size > drm_buddy_block_size(mm, block))
>> +		return;
>> +
>> +	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
>> +		return;
>> +
>> +	if (new_size == drm_buddy_block_size(mm, block))
>> +		return;
>> +
>> +	list_del(&block->link);
>> +	mark_free(mm, block);
>> +	mm->avail += drm_buddy_block_size(mm, block);
>> +
>> +	/* Prevent recursively freeing this node */
>> +	parent = block->parent;
>> +	block->parent = NULL;
>> +
>> +	new_start = drm_buddy_block_offset(block);
>> +	list_add(&block->tmp_link, &dfs);
>> +	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
>> +	if (err) {
>> +		mark_allocated(block);
>> +		mm->avail -= drm_buddy_block_size(mm, block);
>> +		list_add(&block->link, blocks);
>> +	}
>> +
>> +	block->parent = parent;
>> +}
>> +EXPORT_SYMBOL(drm_buddy_block_trim);
>> +
>>   /**
>>    * drm_buddy_alloc - allocate power-of-two blocks
>>    *
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index 7c58efb60dba..05f924f32e96 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -97,6 +97,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	if (unlikely(err))
>>   		goto err_free_blocks;
>>   
>> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +		mutex_lock(&bman->lock);
>> +		drm_buddy_block_trim(mm,
>> +				(u64)n_pages << PAGE_SHIFT,
> 
> AFAIK, n_pages has already been rounded up to the next power-of-two 
> here, so this becomes a noop. I assume we need to use the "original" 
> size here?
> 
ah yes..missed it, will change as below
		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;

                mutex_lock(&bman->lock);
                drm_buddy_block_trim(mm,
                                original_size,
                                &bman_res->blocks);


>> +				&bman_res->blocks);
>> +		mutex_unlock(&bman->lock);
>> +	}
>> +
>>   	*res = &bman_res->base;
>>   	return 0;
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index f573b02304f4..703866a87939 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -146,6 +146,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
>>   		    struct list_head *blocks,
>>   		    unsigned long flags);
>>   
>> +void drm_buddy_block_trim(struct drm_buddy_mm *mm,
>> +			  u64 new_size,
>> +			  struct list_head *blocks);
>> +
>>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>>   
>>   void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
>>
